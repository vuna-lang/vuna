open Vuna_runtime
# 21 "Base/Data/Sort.vuna"
let rec v_lenIntGo = (fun (dtb_u_u2 : int) dtb_u_u3 -> (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u4, dtb_u_u5) -> ((v_lenIntGo (dtb_u_u2 + 1)) dtb_u_u5)
  | B_dData_dList.C_List_Nil -> dtb_u_u2
  | _ -> failwith "DT: impossible branch"
))

# 17 "Base/Data/Sort.vuna"
let v_lenInt = (fun dtb_u_u7 -> ((v_lenIntGo 0) dtb_u_u7))

# 26 "Base/Data/Sort.vuna"
let rec v_sortedBy = (fun dtb_u_u9 dtb_u_u10 -> (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u11, dtb_u_u12) -> (match dtb_u_u12 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u13, dtb_u_u14) -> (if ((dtb_u_u9 dtb_u_u11) dtb_u_u13) then ((v_sortedBy dtb_u_u9) (B_dData_dList.C_List__x58__x58_ (dtb_u_u13, dtb_u_u14))) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 32 "Base/Data/Sort.vuna"
let rec v_shortList = (fun (dtb_u_u16 : int) dtb_u_u17 -> (match dtb_u_u17 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u18, dtb_u_u19) -> (if (dtb_u_u16 <= 0) then false else ((v_shortList (dtb_u_u16 - 1)) dtb_u_u19))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 37 "Base/Data/Sort.vuna"
let[@tail_mod_cons] rec v_insertBy = (fun dtb_u_u21 dtb_u_u22 dtb_u_u23 -> (match dtb_u_u23 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25) -> (if ((dtb_u_u21 dtb_u_u22) dtb_u_u24) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u22, (B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25)))) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u24, (((v_insertBy dtb_u_u21) dtb_u_u22) dtb_u_u25))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u22, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 42 "Base/Data/Sort.vuna"
let rec v_insertionSortBy = (fun dtb_u_u27 dtb_u_u28 -> (match dtb_u_u28 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> (((v_insertBy dtb_u_u27) dtb_u_u29) ((v_insertionSortBy dtb_u_u27) dtb_u_u30))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 47 "Base/Data/Sort.vuna"
let rec v_revOnto = (fun dtb_u_u32 dtb_u_u33 -> (match dtb_u_u32 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u35) -> ((v_revOnto dtb_u_u35) (B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u33)))
  | B_dData_dList.C_List_Nil -> dtb_u_u33
  | _ -> failwith "DT: impossible branch"
))

# 52 "Base/Data/Sort.vuna"
let rec v_splitHalves = (fun dtb_u_u37 dtb_u_u38 dtb_u_u39 -> (match dtb_u_u39 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u40, dtb_u_u41) -> (match dtb_u_u41 with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u40, dtb_u_u37)); B_dData_dPair.f_Pair_second = dtb_u_u38 }
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u42, dtb_u_u43) -> (((v_splitHalves (B_dData_dList.C_List__x58__x58_ (dtb_u_u40, dtb_u_u37))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u42, dtb_u_u38))) dtb_u_u43)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u37; B_dData_dPair.f_Pair_second = dtb_u_u38 }
  | _ -> failwith "DT: impossible branch"
))

# 60 "Base/Data/Sort.vuna"
let rec v_mergeOnto = (fun dtb_u_u45 dtb_u_u46 dtb_u_u47 dtb_u_u48 -> (match dtb_u_u47 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u49, dtb_u_u50) -> (match dtb_u_u48 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u52) -> (if ((dtb_u_u45 dtb_u_u49) dtb_u_u51) then ((((v_mergeOnto dtb_u_u45) (B_dData_dList.C_List__x58__x58_ (dtb_u_u49, dtb_u_u46))) dtb_u_u50) (B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u52))) else ((((v_mergeOnto dtb_u_u45) (B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u46))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u49, dtb_u_u50))) dtb_u_u52))
  | B_dData_dList.C_List_Nil -> ((v_revOnto dtb_u_u46) dtb_u_u47)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((v_revOnto dtb_u_u46) dtb_u_u48)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Base/Data/Sort.vuna"
let rec v_msort = (fun dtb_u_u54 (dtb_u_u55 : int) dtb_u_u56 -> (if (dtb_u_u55 <= 0) then dtb_u_u56 else (let dtb_u_u57 = dtb_u_u56 in (match dtb_u_u57 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u58, dtb_u_u59) -> (match dtb_u_u59 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u60, dtb_u_u61) -> (match (((v_splitHalves B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) dtb_u_u56) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u62; B_dData_dPair.f_Pair_second = dtb_u_u63 } -> ((((v_mergeOnto dtb_u_u54) B_dData_dList.C_List_Nil) (((v_msort dtb_u_u54) (dtb_u_u55 - 1)) dtb_u_u62)) (((v_msort dtb_u_u54) (dtb_u_u55 - 1)) dtb_u_u63))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u56
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))))

# 80 "Base/Data/Sort.vuna"
let v_sortBy = (fun dtb_u_u65 dtb_u_u66 -> (if ((v_sortedBy dtb_u_u65) dtb_u_u66) then dtb_u_u66 else (if ((v_shortList 16) dtb_u_u66) then ((v_insertionSortBy dtb_u_u65) dtb_u_u66) else (((v_msort dtb_u_u65) (v_lenInt dtb_u_u66)) dtb_u_u66))))

# 87 "Base/Data/Sort.vuna"
let v_mergeSort = (fun dtb_u_u68 dtb_u_u69 -> ((v_sortBy (fun dtb_u_u70 dtb_u_u71 -> (((B_dTrait_dOrd.v__x60__x61_ dtb_u_u68) dtb_u_u70) dtb_u_u71))) dtb_u_u69))
