open Vuna_runtime
# 212 "Base/Data/String.vuna"
let v_Eq_u018fc178ff3df1b4_uString = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 216 "Base/Data/String.vuna"
let v_Ord_u5afb3bbeddafcb50_uString = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 223 "Base/Data/String.vuna"
let v_Hashable_ue4b0f10b020a5e82_uString = (B_dTrait_dHashable.C_Hashable_Hashable ((fun s -> (B_dTrait_dHashable.v_hashStr s))))

# 226 "Base/Data/String.vuna"
let v_Semigroup_ueb264836545b3665_uString = (B_dTrait_dMonoid.C_Semigroup_Semigroup ((fun x y -> (x ^ y))))

# 229 "Base/Data/String.vuna"
let v_Monoid_u4f2563914c7fbae1_uString = (B_dTrait_dMonoid.C_Monoid_Monoid (""))

# 22 "Base/Data/String.vuna"
let v_byteLength = (fun (s : string) -> (bi_natFromInt (bi_strLength s)))

# 60 "Base/Data/String.vuna"
let rec v__uinterleave = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__0, B_dData_dList.C_List_Nil))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__0, (B_dData_dList.C_List__x58__x58_ (mc0, ((v__uinterleave mc0) dtb__1)))))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 56 "Base/Data/String.vuna"
let v_join = (fun (sep : string) (xs : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((v__uinterleave sep) xs)))

# 70 "Base/Data/String.vuna"
let v_unlines = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> ""
  | _ -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map (fun (x : string) -> (((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) x) ^ "\n"))) mc0))
))

# 106 "Base/Data/String.vuna"
let rec v_sameBytes = (fun (off : int) (pat : string) (text : string) (i : int) (n : int) (fuel : int) -> (if (fuel <= 0) then true else (if (i >= n) then true else (if (((dtp_strAt pat) i) = ((dtp_strAt text) (off + i))) then ((((((v_sameBytes off) pat) text) (i + 1)) n) (fuel - 1)) else false))))

# 91 "Base/Data/String.vuna"
let v_startsWith = (fun (prefix : string) (text : string) -> (let lp = (bi_strLength prefix) in (if (lp > (bi_strLength text)) then false else ((((((v_sameBytes 0) prefix) text) 0) lp) lp))))

# 98 "Base/Data/String.vuna"
let v_endsWith = (fun (suffix : string) (text : string) -> (let ls = (bi_strLength suffix) in (let ltLen = (bi_strLength text) in (if (ls > ltLen) then false else ((((((v_sameBytes (ltLen - ls)) suffix) text) 0) ls) ls)))))

# 118 "Base/Data/String.vuna"
let v_repeat = (fun (n : int) (s : string) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map (fun (_u : int) -> s)) ((B_dData_dList.v_range 0) n))))

# 122 "Base/Data/String.vuna"
let v_substring = (fun (start : int) (len : int) (s : string) -> (((dtp_substring start) len) s))

# 160 "Base/Data/String.vuna"
let v__uminInt = ((0 - 4611686018427387903) - 1)

# 164 "Base/Data/String.vuna"
let rec v__udigitsToInt = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (if (if (dtb__2 < 48) then true else (dtb__2 > 57)) then B_dData_dMaybe.C_Maybe_Nothing else (let d = (dtb__2 - 48) in (if (mc1 > (if 10 = 0 then failwith "division by zero" else (4611686018427387903 - d) / 10)) then B_dData_dMaybe.C_Maybe_Nothing else ((v__udigitsToInt dtb__3) ((mc1 * 10) + d)))))
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 152 "Base/Data/String.vuna"
let v__unatDigits = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (match ((v__udigitsToInt mc0) 0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> (B_dData_dMaybe.C_Maybe_Just ((bi_natFromInt dtb__4)))
  | _ -> failwith "DT: impossible branch"
)
))

# 126 "Base/Data/String.vuna"
let v_parseNat = (fun (s : string) -> (let nd_uscrut1 = (B_dData_dList.dtp_unpack s) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (if (dtb__5 = 43) then (v__unatDigits dtb__6) else (v__unatDigits nd_uscrut1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 175 "Base/Data/String.vuna"
let rec v__udigitsToNegInt = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (if (if (dtb__7 < 48) then true else (dtb__7 > 57)) then B_dData_dMaybe.C_Maybe_Nothing else (let d = (dtb__7 - 48) in (if (mc1 < (if 10 = 0 then failwith "division by zero" else (v__uminInt + d) / 10)) then B_dData_dMaybe.C_Maybe_Nothing else ((v__udigitsToNegInt dtb__8) ((mc1 * 10) - d)))))
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 134 "Base/Data/String.vuna"
let v_parseInt = (fun (s : string) -> (let nd_uscrut1 = (B_dData_dList.dtp_unpack s) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (if (dtb__9 = 45) then (match dtb__10 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> ((v__udigitsToNegInt dtb__10) 0)
) else (if (dtb__9 = 45) then ((v__udigitsToNegInt dtb__10) 0) else (if (dtb__9 = 43) then (match dtb__10 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> ((v__udigitsToInt dtb__10) 0)
) else (if (dtb__9 = 43) then ((v__udigitsToInt dtb__10) 0) else ((v__udigitsToInt nd_uscrut1) 0)))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 145 "Base/Data/String.vuna"
let v_parseIntOr = (fun (d : int) (s : string) -> (match (v_parseInt s) with
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

# 186 "Base/Data/String.vuna"
let v__uisSpace = (fun (c : int) -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 190 "Base/Data/String.vuna"
let rec v__udropSpace = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (if (v__uisSpace dtb__12) then (v__udropSpace dtb__13) else (B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 75 "Base/Data/String.vuna"
let v_trimLeft = (fun (s : string) -> (B_dData_dList.dtp_pack (v__udropSpace (B_dData_dList.dtp_unpack s))))

# 79 "Base/Data/String.vuna"
let v_trimRight = (fun (s : string) -> (B_dData_dList.dtp_pack (B_dData_dList.v_reverse (v__udropSpace (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack s))))))

# 83 "Base/Data/String.vuna"
let v_trim = (fun (s : string) -> (v_trimLeft (v_trimRight s)))

# 195 "Base/Data/String.vuna"
let rec v__ustartsWithChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if (dtb__14 = dtb__16) then ((v__ustartsWithChars dtb__15) dtb__17) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 34 "Base/Data/String.vuna"
let rec v_splitAcc = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) (mc2 : int) (mc3 : int B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (if (mc2 <= 0) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc3)), mc4))) else (if ((v__ustartsWithChars mc0) mc1) then ((((((v_skipSep mc0) mc1) (mc2 - 1)) (B_dData_dList.v_length mc0)) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc3)), mc4))) else (((((v_splitAcc mc0) dtb__19) (mc2 - 1)) (B_dData_dList.C_List__x58__x58_ (dtb__18, mc3))) mc4)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc3)), mc4)))
  | _ -> failwith "DT: impossible branch"
))
# 45 "Base/Data/String.vuna"
and v_skipSep = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) (mc2 : int) (mc3 : int) (mc4 : int B_dData_dList.t_List) (mc5 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if (mc2 <= 0) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc4)), mc5))) else (if (mc3 <= 0) then (((((v_splitAcc mc0) mc1) (mc2 - 1)) mc4) mc5) else ((((((v_skipSep mc0) dtb__21) (mc2 - 1)) (mc3 - 1)) mc4) mc5)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc4)), mc5)))
  | _ -> failwith "DT: impossible branch"
))

# 26 "Base/Data/String.vuna"
let v_split = (fun (sep : string) (text : string) -> (if ((bi_strLength sep) = 0) then ((B_dData_dList.v_map (fun (c : int) -> (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))))) (B_dData_dList.dtp_unpack text)) else (((((v_splitAcc (B_dData_dList.dtp_unpack sep)) (B_dData_dList.dtp_unpack text)) (((2 * (bi_strLength text)) + (bi_strLength sep)) + 2)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)))

# 66 "Base/Data/String.vuna"
let v_lines = (fun (s : string) -> ((v_split "\n") s))

# 203 "Base/Data/String.vuna"
let rec v__ucontainsChars = (fun (needle : int B_dData_dList.t_List) (text : int B_dData_dList.t_List) -> (if ((v__ustartsWithChars needle) text) then true else (match text with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> ((v__ucontainsChars needle) dtb__23)
  | _ -> failwith "DT: impossible branch"
)))

# 87 "Base/Data/String.vuna"
let v_contains = (fun (needle : string) (text : string) -> ((v__ucontainsChars (B_dData_dList.dtp_unpack needle)) (B_dData_dList.dtp_unpack text)))
