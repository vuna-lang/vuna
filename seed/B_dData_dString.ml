open Vuna_runtime
# 268 "Base/Data/String.vuna"
let v_Eq_u018fc178ff3df1b4_uString = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 272 "Base/Data/String.vuna"
let v_Ord_u5afb3bbeddafcb50_uString = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 279 "Base/Data/String.vuna"
let v_Hashable_ue4b0f10b020a5e82_uString = (B_dTrait_dHashable.C_Hashable_Hashable ((fun s -> (B_dTrait_dHashable.v_hashStr s))))

# 282 "Base/Data/String.vuna"
let v_Semigroup_ueb264836545b3665_uString = (B_dTrait_dMonoid.C_Semigroup_Semigroup ((fun x y -> (x ^ y))))

# 285 "Base/Data/String.vuna"
let v_Monoid_u4f2563914c7fbae1_uString = (B_dTrait_dMonoid.C_Monoid_Monoid (""))

# 22 "Base/Data/String.vuna"
let v_byteLength = (fun (s : string) -> (bi_natFromInt (String.length s)))

# 38 "Base/Data/String.vuna"
let rec v_splitChars = (fun (s : string) (i : int) (n : int) (fuel : int) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.v_reverse acc) else (if (i >= n) then (B_dData_dList.v_reverse acc) else (((((v_splitChars s) (i + 1)) n) (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ((((dtp_substring i) 1) s), acc))))))

# 66 "Base/Data/String.vuna"
let[@tail_mod_cons] rec v__uinterleave = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__0, B_dData_dList.C_List_Nil))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__0, (B_dData_dList.C_List__x58__x58_ (mc0, ((v__uinterleave mc0) dtb__1)))))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 62 "Base/Data/String.vuna"
let v_join = (fun (sep : string) (xs : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((v__uinterleave sep) xs)))

# 76 "Base/Data/String.vuna"
let v_unlines = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> ""
  | _ -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map (fun (x : string) -> (((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) x) ^ "\n"))) mc0))
))

# 146 "Base/Data/String.vuna"
let rec v_sameBytes = (fun (off : int) (pat : string) (text : string) (i : int) (n : int) (fuel : int) -> (if (fuel <= 0) then true else (if (i >= n) then true else (if ((let b = pat in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = (let b = text in let k = (off + i) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then ((((((v_sameBytes off) pat) text) (i + 1)) n) (fuel - 1)) else false))))

# 58 "Base/Data/String.vuna"
let v__usepAt = (fun (sep : string) (text : string) (i : int) (n : int) (ls : int) -> (if ((i + ls) <= n) then ((((((v_sameBytes i) sep) text) 0) ls) ls) else false))

# 46 "Base/Data/String.vuna"
let rec v_splitSep = (fun (sep : string) (text : string) (start : int) (i : int) (n : int) (ls : int) (fuel : int) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring start) (n - start)) text), acc))) else (if (i >= n) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring start) (n - start)) text), acc))) else (if (((((v__usepAt sep) text) i) n) ls) then ((((((((v_splitSep sep) text) (i + ls)) (i + ls)) n) ls) (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ((((dtp_substring start) (i - start)) text), acc))) else ((((((((v_splitSep sep) text) start) (i + 1)) n) ls) (fuel - 1)) acc)))))

# 27 "Base/Data/String.vuna"
let v_split = (fun (sep : string) (text : string) -> (let lt = (String.length text) in (let ls = (String.length sep) in (if (ls = 0) then (((((v_splitChars text) 0) lt) ((2 * lt) + 2)) B_dData_dList.C_List_Nil) else ((((((((v_splitSep sep) text) 0) 0) lt) ls) (((2 * lt) + ls) + 2)) B_dData_dList.C_List_Nil)))))

# 72 "Base/Data/String.vuna"
let v_lines = (fun (s : string) -> ((v_split "\n") s))

# 119 "Base/Data/String.vuna"
let rec v__ucontainsAt = (fun (needle : string) (text : string) (i : int) (ln : int) (lt : int) (fuel : int) -> (if (fuel <= 0) then false else (if ((i + ln) > lt) then false else (if ((((((v_sameBytes i) needle) text) 0) ln) ln) then true else ((((((v__ucontainsAt needle) text) (i + 1)) ln) lt) (fuel - 1))))))

# 111 "Base/Data/String.vuna"
let v_contains = (fun (needle : string) (text : string) -> (let ln = (String.length needle) in (let lt = (String.length text) in ((((((v__ucontainsAt needle) text) 0) ln) lt) (lt + 1)))))

# 131 "Base/Data/String.vuna"
let v_startsWith = (fun (prefix : string) (text : string) -> (let lp = (String.length prefix) in (if (lp > (String.length text)) then false else ((((((v_sameBytes 0) prefix) text) 0) lp) lp))))

# 138 "Base/Data/String.vuna"
let v_endsWith = (fun (suffix : string) (text : string) -> (let ls = (String.length suffix) in (let ltLen = (String.length text) in (if (ls > ltLen) then false else ((((((v_sameBytes (ltLen - ls)) suffix) text) 0) ls) ls)))))

# 165 "Base/Data/String.vuna"
let rec v_repeatGo = (fun (k : int) (block : string) (acc : string) (fuel : int) -> (if (fuel <= 0) then acc else (if (k <= 0) then acc else (if ((k - ((if 2 = 0 then failwith "division by zero" else k / 2) * 2)) = 1) then ((((v_repeatGo (if 2 = 0 then failwith "division by zero" else k / 2)) (block ^ block)) (block ^ acc)) (fuel - 1)) else ((((v_repeatGo (if 2 = 0 then failwith "division by zero" else k / 2)) (block ^ block)) acc) (fuel - 1))))))

# 158 "Base/Data/String.vuna"
let v_repeat = (fun (n : int) (s : string) -> (let k = n in (if (k <= 0) then "" else ((((v_repeatGo k) s) "") (k + 1)))))

# 177 "Base/Data/String.vuna"
let v_substring = (fun (start : int) (len : int) (s : string) -> (((dtp_substring start) len) s))

# 227 "Base/Data/String.vuna"
let v__uminInt = ((0 - 4611686018427387903) - 1)

# 231 "Base/Data/String.vuna"
let rec v__udigitsToInt = (fun (s : string) (i : int) (n : int) (acc : int) (fuel : int) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (i >= n) then (B_dData_dMaybe.C_Maybe_Just (acc)) else (let c = (let b = s in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) in (if (if (c < 48) then true else (c > 57)) then B_dData_dMaybe.C_Maybe_Nothing else (let d = (c - 48) in (if (acc > (if 10 = 0 then failwith "division by zero" else (4611686018427387903 - d) / 10)) then B_dData_dMaybe.C_Maybe_Nothing else (((((v__udigitsToInt s) (i + 1)) n) ((acc * 10) + d)) (fuel - 1)))))))))

# 193 "Base/Data/String.vuna"
let v__unatDigits = (fun (s : string) (i : int) (n : int) (fuel : int) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (i >= n) then B_dData_dMaybe.C_Maybe_Nothing else (match (((((v__udigitsToInt s) i) n) 0) ((n - i) + 1)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> (B_dData_dMaybe.C_Maybe_Just ((bi_natFromInt dtb__2)))
  | _ -> failwith "DT: impossible branch"
))))

# 181 "Base/Data/String.vuna"
let v_parseNat = (fun (s : string) -> (let n = (String.length s) in (if (n = 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((let b = s in let k = 0 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 43) then (if (n = 1) then B_dData_dMaybe.C_Maybe_Nothing else ((((v__unatDigits s) 1) n) (n + 1))) else ((((v__unatDigits s) 0) n) (n + 1))))))

# 248 "Base/Data/String.vuna"
let rec v__udigitsToNegInt = (fun (s : string) (i : int) (n : int) (acc : int) (fuel : int) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (i >= n) then (B_dData_dMaybe.C_Maybe_Just (acc)) else (let c = (let b = s in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) in (if (if (c < 48) then true else (c > 57)) then B_dData_dMaybe.C_Maybe_Nothing else (let d = (c - 48) in (if (acc < (if 10 = 0 then failwith "division by zero" else (v__uminInt + d) / 10)) then B_dData_dMaybe.C_Maybe_Nothing else (((((v__udigitsToNegInt s) (i + 1)) n) ((acc * 10) - d)) (fuel - 1)))))))))

# 205 "Base/Data/String.vuna"
let v_parseInt = (fun (s : string) -> (let n = (String.length s) in (if (n = 0) then B_dData_dMaybe.C_Maybe_Nothing else (let c = (let b = s in let k = 0 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) in (if (c = 45) then (if (n = 1) then B_dData_dMaybe.C_Maybe_Nothing else (((((v__udigitsToNegInt s) 1) n) 0) (n + 1))) else (if (c = 43) then (if (n = 1) then B_dData_dMaybe.C_Maybe_Nothing else (((((v__udigitsToInt s) 1) n) 0) (n + 1))) else (((((v__udigitsToInt s) 0) n) 0) (n + 1))))))))

# 220 "Base/Data/String.vuna"
let v_parseIntOr = (fun (d : int) (s : string) -> (match (v_parseInt s) with
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 265 "Base/Data/String.vuna"
let v__uisSpace = (fun (c : int) -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 85 "Base/Data/String.vuna"
let rec v_trimLeftGo = (fun (s : string) (i : int) (n : int) (fuel : int) -> (if (fuel <= 0) then (((dtp_substring i) (n - i)) s) else (if (i >= n) then (((dtp_substring i) (n - i)) s) else (if (v__uisSpace (let b = s in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then ((((v_trimLeftGo s) (i + 1)) n) (fuel - 1)) else (((dtp_substring i) (n - i)) s)))))

# 81 "Base/Data/String.vuna"
let v_trimLeft = (fun (s : string) -> ((((v_trimLeftGo s) 0) (String.length s)) ((String.length s) + 1)))

# 98 "Base/Data/String.vuna"
let rec v_trimRightGo = (fun (s : string) (i : int) (fuel : int) -> (if (fuel <= 0) then (((dtp_substring 0) (i + 1)) s) else (if (i < 0) then (((dtp_substring 0) (i + 1)) s) else (if (v__uisSpace (let b = s in let k = i in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then (((v_trimRightGo s) (i - 1)) (fuel - 1)) else (((dtp_substring 0) (i + 1)) s)))))

# 94 "Base/Data/String.vuna"
let v_trimRight = (fun (s : string) -> (((v_trimRightGo s) ((String.length s) - 1)) ((String.length s) + 1)))

# 107 "Base/Data/String.vuna"
let v_trim = (fun (s : string) -> (v_trimLeft (v_trimRight s)))
