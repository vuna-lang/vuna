open Vuna_runtime
# 151 "Base/Data/String.vuna"
let v_Eq_u018fc178ff3df1b4_uString = (B_dTrait_dEq.C_Eq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 155 "Base/Data/String.vuna"
let v_Ord_u5afb3bbeddafcb50_uString = (B_dTrait_dOrd.C_Ord_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 162 "Base/Data/String.vuna"
let v_Hashable_ue4b0f10b020a5e82_uString = (B_dTrait_dHashable.C_Hashable_Hashable ((fun s -> (B_dTrait_dHashable.v_hashStr s))))

# 165 "Base/Data/String.vuna"
let v_Semigroup_ueb264836545b3665_uString = (B_dTrait_dMonoid.C_Semigroup_Semigroup ((fun x y -> (x ^ y))))

# 168 "Base/Data/String.vuna"
let v_Monoid_u4f2563914c7fbae1_uString = (B_dTrait_dMonoid.C_Monoid_Monoid (""))

# 21 "Base/Data/String.vuna"
let v_byteLength = (fun (s : string) -> (bi_natFromInt (bi_strLength s)))

# 59 "Base/Data/String.vuna"
let rec v__uinterleave = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__0, B_dData_dList.C_List_Nil))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__0, (B_dData_dList.C_List__x58__x58_ (mc0, ((v__uinterleave mc0) dtb__1)))))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 55 "Base/Data/String.vuna"
let v_join = (fun (sep : string) (xs : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((v__uinterleave sep) xs)))

# 69 "Base/Data/String.vuna"
let v_unlines = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> ""
  | _ -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map (fun (x : string) -> (((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) x) ^ "\n"))) mc0))
))

# 105 "Base/Data/String.vuna"
let rec v_sameBytes = (fun (off : int) (pat : string) (text : string) (i : int) (n : int) (fuel : int) -> (if (fuel <= 0) then true else (if (i >= n) then true else (if (((dtp_strAt pat) i) = ((dtp_strAt text) (off + i))) then ((((((v_sameBytes off) pat) text) (i + 1)) n) (fuel - 1)) else false))))

# 90 "Base/Data/String.vuna"
let v_startsWith = (fun (prefix : string) (text : string) -> (let lp = (bi_strLength prefix) in (if (lp > (bi_strLength text)) then false else ((((((v_sameBytes 0) prefix) text) 0) lp) lp))))

# 97 "Base/Data/String.vuna"
let v_endsWith = (fun (suffix : string) (text : string) -> (let ls = (bi_strLength suffix) in (let ltLen = (bi_strLength text) in (if (ls > ltLen) then false else ((((((v_sameBytes (ltLen - ls)) suffix) text) 0) ls) ls)))))

# 117 "Base/Data/String.vuna"
let v_repeat = (fun (n : int) (s : string) -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map (fun (_u : int) -> s)) ((B_dData_dList.v_range 0) n))))

# 121 "Base/Data/String.vuna"
let v_substring = (fun (start : int) (len : int) (s : string) -> (((dtp_substring start) len) s))

# 125 "Base/Data/String.vuna"
let v__uisSpace = (fun (c : int) -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 129 "Base/Data/String.vuna"
let rec v__udropSpace = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (if (v__uisSpace dtb__2) then (v__udropSpace dtb__3) else (B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 74 "Base/Data/String.vuna"
let v_trimLeft = (fun (s : string) -> (B_dData_dList.dtp_pack (v__udropSpace (B_dData_dList.dtp_unpack s))))

# 78 "Base/Data/String.vuna"
let v_trimRight = (fun (s : string) -> (B_dData_dList.dtp_pack (B_dData_dList.v_reverse (v__udropSpace (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack s))))))

# 82 "Base/Data/String.vuna"
let v_trim = (fun (s : string) -> (v_trimLeft (v_trimRight s)))

# 134 "Base/Data/String.vuna"
let rec v__ustartsWithChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (if (dtb__4 = dtb__6) then ((v__ustartsWithChars dtb__5) dtb__7) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Data/String.vuna"
let rec v_splitAcc = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) (mc2 : int) (mc3 : int B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (mc2 <= 0) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc3)), mc4))) else (if ((v__ustartsWithChars mc0) mc1) then ((((((v_skipSep mc0) mc1) (mc2 - 1)) (B_dData_dList.v_length mc0)) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc3)), mc4))) else (((((v_splitAcc mc0) dtb__9) (mc2 - 1)) (B_dData_dList.C_List__x58__x58_ (dtb__8, mc3))) mc4)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc3)), mc4)))
  | _ -> failwith "DT: impossible branch"
))
# 44 "Base/Data/String.vuna"
and v_skipSep = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) (mc2 : int) (mc3 : int) (mc4 : int B_dData_dList.t_List) (mc5 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (if (mc2 <= 0) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc4)), mc5))) else (if (mc3 <= 0) then (((((v_splitAcc mc0) mc1) (mc2 - 1)) mc4) mc5) else ((((((v_skipSep mc0) dtb__11) (mc2 - 1)) (mc3 - 1)) mc4) mc5)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc4)), mc5)))
  | _ -> failwith "DT: impossible branch"
))

# 25 "Base/Data/String.vuna"
let v_split = (fun (sep : string) (text : string) -> (if ((bi_strLength sep) = 0) then ((B_dData_dList.v_map (fun (c : int) -> (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))))) (B_dData_dList.dtp_unpack text)) else (((((v_splitAcc (B_dData_dList.dtp_unpack sep)) (B_dData_dList.dtp_unpack text)) (((2 * (bi_strLength text)) + (bi_strLength sep)) + 2)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)))

# 65 "Base/Data/String.vuna"
let v_lines = (fun (s : string) -> ((v_split "\n") s))

# 142 "Base/Data/String.vuna"
let rec v__ucontainsChars = (fun (needle : int B_dData_dList.t_List) (text : int B_dData_dList.t_List) -> (if ((v__ustartsWithChars needle) text) then true else (match text with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> ((v__ucontainsChars needle) dtb__13)
  | _ -> failwith "DT: impossible branch"
)))

# 86 "Base/Data/String.vuna"
let v_contains = (fun (needle : string) (text : string) -> ((v__ucontainsChars (B_dData_dList.dtp_unpack needle)) (B_dData_dList.dtp_unpack text)))
