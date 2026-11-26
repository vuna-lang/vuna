open Vuna_runtime
# 21 "Base/Data/Sort.vuna"
let rec v_lenIntGo = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> ((v_lenIntGo (mc0 + 1)) dtb__1)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 17 "Base/Data/Sort.vuna"
let v_lenInt = (fun xs -> ((v_lenIntGo 0) xs))

# 26 "Base/Data/Sort.vuna"
let rec v_sortedBy = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (if ((mc0 dtb__2) dtb__4) then ((v_sortedBy mc0) (B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5))) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 32 "Base/Data/Sort.vuna"
let rec v_shortList = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (if (mc0 <= 0) then false else ((v_shortList (mc0 - 1)) dtb__7))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 37 "Base/Data/Sort.vuna"
let[@tail_mod_cons] rec v_insertBy = (fun mc0 mc1 mc2 -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if ((mc0 mc1) dtb__8) then (B_dData_dList.C_List__x58__x58_ (mc1, (B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9)))) else (B_dData_dList.C_List__x58__x58_ (dtb__8, (((v_insertBy mc0) mc1) dtb__9))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 42 "Base/Data/Sort.vuna"
let rec v_insertionSortBy = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (((v_insertBy mc0) dtb__10) ((v_insertionSortBy mc0) dtb__11))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 47 "Base/Data/Sort.vuna"
let rec v_revOnto = (fun mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> ((v_revOnto dtb__13) (B_dData_dList.C_List__x58__x58_ (dtb__12, mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 52 "Base/Data/Sort.vuna"
let rec v_splitHalves = (fun mc0 mc1 mc2 -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__14, mc0)); B_dData_dPair.f_Pair_second = mc1 }
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (((v_splitHalves (B_dData_dList.C_List__x58__x58_ (dtb__14, mc0))) (B_dData_dList.C_List__x58__x58_ (dtb__16, mc1))) dtb__17)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 60 "Base/Data/Sort.vuna"
let rec v_mergeOnto = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if ((mc0 dtb__18) dtb__20) then ((((v_mergeOnto mc0) (B_dData_dList.C_List__x58__x58_ (dtb__18, mc1))) dtb__19) (B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21))) else ((((v_mergeOnto mc0) (B_dData_dList.C_List__x58__x58_ (dtb__20, mc1))) (B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19))) dtb__21))
  | B_dData_dList.C_List_Nil -> ((v_revOnto mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((v_revOnto mc1) mc3)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Base/Data/Sort.vuna"
let rec v_msort = (fun le (fuel : int) xs -> (if (fuel <= 0) then xs else (let nd_uscrut4 = xs in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (match (((v_splitHalves B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) xs) with
  | { B_dData_dPair.f_Pair_first = dtb__26; B_dData_dPair.f_Pair_second = dtb__27 } -> ((((v_mergeOnto le) B_dData_dList.C_List_Nil) (((v_msort le) (fuel - 1)) dtb__26)) (((v_msort le) (fuel - 1)) dtb__27))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> xs
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))

# 80 "Base/Data/Sort.vuna"
let v_sortBy = (fun le xs -> (if ((v_sortedBy le) xs) then xs else (if ((v_shortList 16) xs) then ((v_insertionSortBy le) xs) else (((v_msort le) (v_lenInt xs)) xs))))

# 87 "Base/Data/Sort.vuna"
let v_mergeSort = (fun _uctx0 xs -> ((v_sortBy (fun x y -> (((B_dTrait_dOrd.v__x60__x61_ _uctx0) x) y))) xs))
