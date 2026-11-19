open Vuna_runtime
# 140 "Base/Data/String.vuna"
let v_Eq_uString = (Base_dTrait_dEq.C_Dict_uBase_dTrait_dEq_dEq_Eq ((fun x y -> (x = y)), (fun x y -> (x <> y))))

# 144 "Base/Data/String.vuna"
let v_Ord_uString = (Base_dTrait_dOrd.C_Dict_uBase_dTrait_dOrd_dOrd_Ord ((fun x y -> (x < y)), (fun x y -> (x <= y)), (fun x y -> (x > y)), (fun x y -> (x >= y))))

# 151 "Base/Data/String.vuna"
let v_Hashable_uString = (Base_dTrait_dHashable.C_Dict_uBase_dTrait_dHashable_dHashable_Hashable ((fun s -> (Base_dTrait_dHashable.v_Base_dTrait_dHashable_dhashStr s))))

# 154 "Base/Data/String.vuna"
let v_Semigroup_uString = (Base_dTrait_dMonoid.C_Dict_uBase_dTrait_dMonoid_dSemigroup_Semigroup ((fun x y -> (x ^ y))))

# 157 "Base/Data/String.vuna"
let v_Monoid_uString = (Base_dTrait_dMonoid.C_Dict_uBase_dTrait_dMonoid_dMonoid_Monoid (""))

# 21 "Base/Data/String.vuna"
let v_Base_dData_dString_dbyteLength = (fun (s : string) -> (bi_natFromInt (bi_strLength s)))

# 59 "Base/Data/String.vuna"
let rec v_Base_dData_dString_d_uinterleave = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, ((v_Base_dData_dString_d_uinterleave mc0) dtb__1)))))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 55 "Base/Data/String.vuna"
let v_Base_dData_dString_djoin = (fun (sep : string) (xs : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.dtp_concatMany ((v_Base_dData_dString_d_uinterleave sep) xs)))

# 69 "Base/Data/String.vuna"
let v_Base_dData_dString_dunlines = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> (Base_dData_dList.dtp_concatMany ((Base_dData_dList.v_Base_dData_dList_dmap (fun (x : string) -> (((Base_dTrait_dInterp.v_Base_dTrait_dInterp_dinterp Base_dTrait_dInterp.v_Interp_uString) x) ^ "\n"))) mc0))
))

# 106 "Base/Data/String.vuna"
let v_Base_dData_dString_drepeat = (fun (n : int) (s : string) -> (Base_dData_dList.dtp_concatMany ((Base_dData_dList.v_Base_dData_dList_dmap (fun (_u : int) -> s)) ((Base_dData_dList.v_Base_dData_dList_drange 0) n))))

# 110 "Base/Data/String.vuna"
let v_Base_dData_dString_dsubstring = (fun (start : int) (len : int) (s : string) -> (((dtp_substring start) len) s))

# 114 "Base/Data/String.vuna"
let v_Base_dData_dString_d_uisSpace = (fun (c : int) -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 118 "Base/Data/String.vuna"
let rec v_Base_dData_dString_d_udropSpace = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (if (v_Base_dData_dString_d_uisSpace dtb__2) then (v_Base_dData_dString_d_udropSpace dtb__3) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 74 "Base/Data/String.vuna"
let v_Base_dData_dString_dtrimLeft = (fun (s : string) -> (Base_dData_dList.dtp_pack (v_Base_dData_dString_d_udropSpace (Base_dData_dList.dtp_unpack s))))

# 78 "Base/Data/String.vuna"
let v_Base_dData_dString_dtrimRight = (fun (s : string) -> (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse (v_Base_dData_dString_d_udropSpace (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.dtp_unpack s))))))

# 82 "Base/Data/String.vuna"
let v_Base_dData_dString_dtrim = (fun (s : string) -> (v_Base_dData_dString_dtrimLeft (v_Base_dData_dString_dtrimRight s)))

# 123 "Base/Data/String.vuna"
let rec v_Base_dData_dString_d_ustartsWithChars = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (if (dtb__4 = dtb__6) then ((v_Base_dData_dString_d_ustartsWithChars dtb__5) dtb__7) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Data/String.vuna"
let rec v_Base_dData_dString_dsplitAcc = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) (mc3 : int Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (if (mc2 <= 0) then (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc3)), mc4))) else (if ((v_Base_dData_dString_d_ustartsWithChars mc0) mc1) then ((((((v_Base_dData_dString_dskipSep mc0) mc1) (mc2 - 1)) (Base_dData_dList.v_Base_dData_dList_dlength mc0)) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc3)), mc4))) else (((((v_Base_dData_dString_dsplitAcc mc0) dtb__9) (mc2 - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, mc3))) mc4)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc3)), mc4)))
  | _ -> failwith "DT: impossible branch"
))
# 44 "Base/Data/String.vuna"
and v_Base_dData_dString_dskipSep = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) (mc3 : int) (mc4 : int Base_dData_dList.t_Base_dData_dList_dList) (mc5 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (if (mc2 <= 0) then (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc4)), mc5))) else (if (mc3 <= 0) then (((((v_Base_dData_dString_dsplitAcc mc0) mc1) (mc2 - 1)) mc4) mc5) else ((((((v_Base_dData_dString_dskipSep mc0) dtb__11) (mc2 - 1)) (mc3 - 1)) mc4) mc5)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc4)), mc5)))
  | _ -> failwith "DT: impossible branch"
))

# 25 "Base/Data/String.vuna"
let v_Base_dData_dString_dsplit = (fun (sep : string) (text : string) -> (if ((bi_strLength sep) = 0) then ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : int) -> (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (Base_dData_dList.dtp_unpack text)) else (((((v_Base_dData_dString_dsplitAcc (Base_dData_dList.dtp_unpack sep)) (Base_dData_dList.dtp_unpack text)) (((2 * (bi_strLength text)) + (bi_strLength sep)) + 2)) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 65 "Base/Data/String.vuna"
let v_Base_dData_dString_dlines = (fun (s : string) -> ((v_Base_dData_dString_dsplit "\n") s))

# 90 "Base/Data/String.vuna"
let v_Base_dData_dString_dstartsWith = (fun (prefix : string) (text : string) -> ((v_Base_dData_dString_d_ustartsWithChars (Base_dData_dList.dtp_unpack prefix)) (Base_dData_dList.dtp_unpack text)))

# 94 "Base/Data/String.vuna"
let v_Base_dData_dString_dendsWith = (fun (suffix : string) (text : string) -> ((fun ls -> ((fun ltLen -> (if (ls > ltLen) then false else ((v_Base_dData_dString_d_ustartsWithChars (Base_dData_dList.dtp_unpack suffix)) ((Base_dData_dList.v_Base_dData_dList_ddrop (ltLen - ls)) (Base_dData_dList.dtp_unpack text))))) (bi_strLength text))) (bi_strLength suffix)))

# 131 "Base/Data/String.vuna"
let rec v_Base_dData_dString_d_ucontainsChars = (fun (needle : int Base_dData_dList.t_Base_dData_dList_dList) (text : int Base_dData_dList.t_Base_dData_dList_dList) -> (if ((v_Base_dData_dString_d_ustartsWithChars needle) text) then true else (match text with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> ((v_Base_dData_dString_d_ucontainsChars needle) dtb__13)
  | _ -> failwith "DT: impossible branch"
)))

# 86 "Base/Data/String.vuna"
let v_Base_dData_dString_dcontains = (fun (needle : string) (text : string) -> ((v_Base_dData_dString_d_ucontainsChars (Base_dData_dList.dtp_unpack needle)) (Base_dData_dList.dtp_unpack text)))
