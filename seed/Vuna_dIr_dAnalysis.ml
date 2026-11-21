open Vuna_runtime
# 22 "Vuna/Ir/Analysis.vuna"
let v_neighborsOf = (fun (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) adjT) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> dtb__0
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 28 "Vuna/Ir/Analysis.vuna"
let v_adjTblOf = (fun (adj : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) adj) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 31 "Vuna/Ir/Analysis.vuna"
let rec v_addDependents = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (let cur = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__1) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> dtb__3
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_addDependents mc0) dtb__2) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__1) (B_dData_dList.C_List__x58__x58_ (mc0, cur))) mc2)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Ir/Analysis.vuna"
let rec v_reverseAdjTbl = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = dtb__7 } -> (((v_addDependents dtb__6) dtb__7) (v_reverseAdjTbl dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Ir/Analysis.vuna"
let rec v_foldNeighborsPostFuel = (fun (fuel : int) (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ms : string B_dData_dList.t_List) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (order : string B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = order } else (match ms with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = order }
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__8) visited) then (((((v_foldNeighborsPostFuel (fuel - 1)) adjT) dtb__9) visited) order) else (match (((((v_dfsPostFuel (fuel - 1)) adjT) dtb__8) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__8) true) visited)) order) with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> (((((v_foldNeighborsPostFuel (fuel - 1)) adjT) dtb__9) dtb__10) dtb__11)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 68 "Vuna/Ir/Analysis.vuna"
and v_dfsPostFuel = (fun (fuel : int) (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (n : string) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (order : string B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = order } else (match (((((v_foldNeighborsPostFuel (fuel - 1)) adjT) ((v_neighborsOf adjT) n)) visited) order) with
  | { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = dtb__13 } -> { B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (n, dtb__13)) }
  | _ -> failwith "DT: impossible branch"
)))

# 48 "Vuna/Ir/Analysis.vuna"
let v_foldNeighborsPost = (fun (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ms : string B_dData_dList.t_List) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (order : string B_dData_dList.t_List) -> (((((v_foldNeighborsPostFuel 100000) adjT) ms) visited) order))

# 65 "Vuna/Ir/Analysis.vuna"
let v_dfsPost = (fun (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (n : string) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (order : string B_dData_dList.t_List) -> (((((v_dfsPostFuel 100000) adjT) n) visited) order))

# 76 "Vuna/Ir/Analysis.vuna"
let rec v_postOrder = (fun (mc0 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__14) mc2) then ((((v_postOrder mc0) dtb__15) mc2) mc3) else (match ((((v_dfsPost mc0) dtb__14) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__14) true) mc2)) mc3) with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> ((((v_postOrder mc0) dtb__15) dtb__16) dtb__17)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Ir/Analysis.vuna"
let rec v_foldNeighborsCollectFuel = (fun (fuel : int) (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ms : string B_dData_dList.t_List) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (comp : string B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = comp } else (match ms with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = comp }
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__18) visited) then (((((v_foldNeighborsCollectFuel (fuel - 1)) adjT) dtb__19) visited) comp) else (match (((((v_dfsCollectFuel (fuel - 1)) adjT) dtb__18) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__18) true) visited)) comp) with
  | { B_dData_dPair.f_Pair_first = dtb__20; B_dData_dPair.f_Pair_second = dtb__21 } -> (((((v_foldNeighborsCollectFuel (fuel - 1)) adjT) dtb__19) dtb__20) dtb__21)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 108 "Vuna/Ir/Analysis.vuna"
and v_dfsCollectFuel = (fun (fuel : int) (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (n : string) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (comp : string B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = comp } else (match (((((v_foldNeighborsCollectFuel (fuel - 1)) adjT) ((v_neighborsOf adjT) n)) visited) comp) with
  | { B_dData_dPair.f_Pair_first = dtb__22; B_dData_dPair.f_Pair_second = dtb__23 } -> { B_dData_dPair.f_Pair_first = dtb__22; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (n, dtb__23)) }
  | _ -> failwith "DT: impossible branch"
)))

# 88 "Vuna/Ir/Analysis.vuna"
let v_foldNeighborsCollect = (fun (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (ms : string B_dData_dList.t_List) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (comp : string B_dData_dList.t_List) -> (((((v_foldNeighborsCollectFuel 100000) adjT) ms) visited) comp))

# 105 "Vuna/Ir/Analysis.vuna"
let v_dfsCollect = (fun (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (n : string) (visited : (string, bool) B_dContainer_dHashMap.t_HashMap) (comp : string B_dData_dList.t_List) -> (((((v_dfsCollectFuel 100000) adjT) n) visited) comp))

# 116 "Vuna/Ir/Analysis.vuna"
let rec v_collectComps = (fun (mc0 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__24) mc2) then ((((v_collectComps mc0) dtb__25) mc2) mc3) else (match ((((v_dfsCollect mc0) dtb__24) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__24) true) mc2)) B_dData_dList.C_List_Nil) with
  | { B_dData_dPair.f_Pair_first = dtb__26; B_dData_dPair.f_Pair_second = dtb__27 } -> ((((v_collectComps mc0) dtb__25) dtb__26) (B_dData_dList.C_List__x58__x58_ (dtb__27, mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Ir/Analysis.vuna"
let v_componentTblOf = (fun (comps : string B_dData_dList.t_List B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_concatMap (fun (g : string B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = g })) g))) comps)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 130 "Vuna/Ir/Analysis.vuna"
let rec v_addAllNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> ((v_addAllNames dtb__29) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__28) true) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Ir/Analysis.vuna"
let rec v_filterNames = (fun (mc0 : (string) -> bool) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (if (mc0 dtb__30) then (B_dData_dList.C_List__x58__x58_ (dtb__30, ((v_filterNames mc0) dtb__31))) else ((v_filterNames mc0) dtb__31))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Ir/Analysis.vuna"
let v_groupOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (match dtb__33 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__32, B_dData_dList.C_List_Nil))
  | _ -> (let memberTbl = (B_dContainer_dHashMap.v_ofNames mc1) in ((v_filterNames (fun (m : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) m) memberTbl))) mc0))
)
  | _ -> (let memberTbl = (B_dContainer_dHashMap.v_ofNames mc1) in ((v_filterNames (fun (m : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) m) memberTbl))) mc0))
))

# 139 "Vuna/Ir/Analysis.vuna"
let rec v_groupsFromCompsGo = (fun (mc0 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__34) mc3) then ((((v_groupsFromCompsGo mc0) mc1) dtb__35) mc3) else (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__34) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (B_dData_dList.C_List__x58__x58_ (((v_groupOf mc1) dtb__36), ((((v_groupsFromCompsGo mc0) mc1) dtb__35) ((v_addAllNames dtb__36) mc3))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_groupsFromCompsGo mc0) mc1) dtb__35) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Ir/Analysis.vuna"
let v_groupsFromComps = (fun (comps : string B_dData_dList.t_List B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> ((((v_groupsFromCompsGo (v_componentTblOf comps)) names) names) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 162 "Vuna/Ir/Analysis.vuna"
let v_notIn = (fun (name : string) (names : string B_dData_dList.t_List) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName name) names)))

# 189 "Vuna/Ir/Analysis.vuna"
let rec v_indexGroups = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List B_dData_dList.t_List) (mc2 : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (((v_indexGroups (mc0 + 1)) dtb__38) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = dtb__37 }, mc2)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Ir/Analysis.vuna"
let v_groupIndexTbl = (fun (indexed : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_concatMap (fun (p : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = n; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p) })) (B_dData_dPair.v_secondOf p)))) indexed)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 205 "Vuna/Ir/Analysis.vuna"
let rec v_groupDepIdxGo = (fun (mc0 : int) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : string B_dData_dList.t_List) (mc3 : (int, bool) B_dContainer_dHashMap.t_HashMap) (mc4 : int B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__39) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__41) -> (if (if (dtb__41 = mc0) then true else ((((B_dContainer_dHashMap.v_member B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__41) mc3)) then (((((v_groupDepIdxGo mc0) mc1) dtb__40) mc3) mc4) else (((((v_groupDepIdxGo mc0) mc1) dtb__40) (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb__41) true) mc3)) (B_dData_dList.C_List__x58__x58_ (dtb__41, mc4))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_groupDepIdxGo mc0) mc1) dtb__40) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc4)
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Ir/Analysis.vuna"
let v_groupDepIdx = (fun (mc0 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = dtb__43 } -> (((((v_groupDepIdxGo dtb__42) mc1) ((B_dData_dList.v_concatMap (v_neighborsOf mc0)) dtb__43)) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Ir/Analysis.vuna"
let v_lookupInt = (fun (tbl : (int, int) B_dContainer_dHashMap.t_HashMap) (k : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) k) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__44) -> dtb__44
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Ir/Analysis.vuna"
let v_lookupNames = (fun (tbl : (int, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (k : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) k) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> dtb__45
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Ir/Analysis.vuna"
let v_lookupDeps = (fun (tbl : (int, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (k : int) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) k) tbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> dtb__46
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Ir/Analysis.vuna"
let v_addReverseEdges = (fun (mc0 : (int, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__47; B_dData_dPair.f_Pair_second = dtb__48 } -> (((B_dData_dList.v_foldl (fun (acc : (int, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (d : int) -> (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) d) ((B_dData_dList.v_append ((v_lookupDeps acc) d)) (B_dData_dList.C_List__x58__x58_ (dtb__47, B_dData_dList.C_List_Nil)))) acc))) mc0) dtb__48)
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Ir/Analysis.vuna"
let v_reverseDepTbl = (fun (pairs : (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_addReverseEdges) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)) pairs))

# 243 "Vuna/Ir/Analysis.vuna"
let rec v_insertReady = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (if (mc0 <= dtb__49) then (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50)))) else (B_dData_dList.C_List__x58__x58_ (dtb__49, ((v_insertReady mc0) dtb__50))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Ir/Analysis.vuna"
let rec v_orderGroupsGo = (fun (fuel : int) (grpTbl : (int, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (revTbl : (int, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (indeg : (int, int) B_dContainer_dHashMap.t_HashMap) (ready : int B_dData_dList.t_List) (remaining : int) (acc : string B_dData_dList.t_List B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_DependencyCycle) else (if (remaining = 0) then (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse acc))) else (match ready with
  | B_dData_dList.C_List_Nil -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_DependencyCycle)
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (let deps = ((v_lookupDeps revTbl) dtb__51) in (let indeg2 = (((B_dData_dList.v_foldl (fun (acc2 : (int, int) B_dContainer_dHashMap.t_HashMap) (d : int) -> (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) d) (((v_lookupInt indeg) d) - 1)) acc2))) indeg) deps) in (let ready2 = (((B_dData_dList.v_foldl (fun (r : int B_dData_dList.t_List) (d : int) -> (if (((v_lookupInt indeg2) d) = 0) then ((v_insertReady d) r) else r))) dtb__52) deps) in (((((((v_orderGroupsGo (fuel - 1)) grpTbl) revTbl) indeg2) ready2) (remaining - 1)) (B_dData_dList.C_List__x58__x58_ (((v_lookupNames grpTbl) dtb__51), acc))))))
  | _ -> failwith "DT: impossible branch"
))))

# 296 "Vuna/Ir/Analysis.vuna"
let rec v_allCovered = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__53) mc0) then ((v_allCovered mc0) dtb__54) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Ir/Analysis.vuna"
let v_checkGroupsCover = (fun (groups : string B_dData_dList.t_List B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (let covered = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_concatMap (fun (g : string B_dData_dList.t_List) -> g)) groups)) in (if ((v_allCovered covered) names) then (Base_dDiag.C_Check_OkC (groups)) else (Base_dDiag.v_icInternal "SCC grouping dropped definitions (DFS budget exhausted?)"))))

# 301 "Vuna/Ir/Analysis.vuna"
let v_groupNeedsRec = (fun (mc0 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (match dtb__56 with
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_memName dtb__55) ((v_neighborsOf mc0) dtb__55))
  | _ -> true
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Ir/Analysis.vuna"
let rec v_firstBadRecursiveValue = (fun (mc0 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (if ((Vuna_dIr_dModel.v_irDefArity dtb__57) = 0) then (if (Vuna_dIr_dModel.v_irDefRecValueOk dtb__57) then (v_firstBadRecursiveValue dtb__58) else (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.v_irDefName dtb__57)))) else (v_firstBadRecursiveValue dtb__58))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Ir/Analysis.vuna"
let rec v_findDefByName = (fun (mc0 : string) (mc1 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (if ((Vuna_dIr_dModel.v_irDefName dtb__59) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__59)) else ((v_findDefByName mc0) dtb__60))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Ir/Analysis.vuna"
let rec v_groupDefsOf = (fun (mc0 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match ((v_findDefByName dtb__61) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_groupDefsOf mc0) dtb__62)
  | B_dData_dMaybe.C_Maybe_Just (dtb__63) -> (B_dData_dList.C_List__x58__x58_ (dtb__63, ((v_groupDefsOf mc0) dtb__62)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Ir/Analysis.vuna"
let rec v_assembleGroups = (fun (mc0 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (let members = ((v_groupDefsOf mc1) dtb__64) in (let isRec = ((v_groupNeedsRec mc0) dtb__64) in (let checked = (if isRec then (match (v_firstBadRecursiveValue members) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (match ((v_findDefByName dtb__66) members) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> ((((Base_dDiagnostics_dCg.v_cgErrDefAt (Vuna_dIr_dModel.v_irDefSpan dtb__67)) dtb__66) (Base_dDiagnostics_dCg.C_CgErr_RecursiveValueDefinition (dtb__66))) (B_dData_dVec.C_Vec_VCons (dtb__66, B_dData_dVec.C_Vec_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_RecursiveValueDefinition (dtb__66))) dtb__66)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = true; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = members }))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC ({ Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = false; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = members }))) in ((Base_dCommon.v_bind checked) (fun (grp : Vuna_dIr_dModel.t_IrGroup) -> ((Base_dCommon.v_bind (((v_assembleGroups mc0) mc1) dtb__65)) (fun (tail : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (grp, tail)))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Ir/Analysis.vuna"
let rec v_countList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (1 + (v_countList dtb__69))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Ir/Analysis.vuna"
let v_orderGroups = (fun (adjT : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (groups : string B_dData_dList.t_List B_dData_dList.t_List) -> (let indexed = (((v_indexGroups 0) groups) B_dData_dList.C_List_Nil) in (let groupIdxT = (v_groupIndexTbl indexed) in (let grpTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) ((B_dData_dList.v_map (fun (p : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) indexed)) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)) in (let depPairs = ((B_dData_dList.v_map (fun (p : (int, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (((v_groupDepIdx adjT) groupIdxT) p) })) indexed) in (let revTbl = (v_reverseDepTbl depPairs) in (let indeg = (((B_dData_dList.v_foldl (fun (acc : (int, int) B_dContainer_dHashMap.t_HashMap) (p : (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) (B_dData_dPair.v_firstOf p)) (v_countList (B_dData_dPair.v_secondOf p))) acc))) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)) depPairs) in (let ready = ((B_dData_dList.v_filter (fun (n : int) -> (((v_lookupInt indeg) n) = 0))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) indexed)) in (((((((v_orderGroupsGo ((v_countList groups) + 1)) grpTbl) revTbl) indeg) ready) (v_countList groups)) B_dData_dList.C_List_Nil)))))))))

# 269 "Vuna/Ir/Analysis.vuna"
let v_groupNames = (fun (adj : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (names : string B_dData_dList.t_List) -> (let nameTbl = (B_dContainer_dHashMap.v_ofNames names) in (let adj2 = ((B_dData_dList.v_map (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_filter (fun (n : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) nameTbl))) (B_dData_dPair.v_secondOf p)) })) adj) in (let adjT = (v_adjTblOf adj2) in (let revT = (v_reverseAdjTbl adj2) in (match ((((v_postOrder adjT) names) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) with
  | { B_dData_dPair.f_Pair_first = dtb__70; B_dData_dPair.f_Pair_second = dtb__71 } -> (let comps = ((((v_collectComps revT) dtb__71) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in (let groups = ((v_groupsFromComps comps) names) in ((Base_dCommon.v_bind ((v_orderGroups adjT) groups)) (fun (ordered : string B_dData_dList.t_List B_dData_dList.t_List) -> ((v_checkGroupsCover ordered) names)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 363 "Vuna/Ir/Analysis.vuna"
let v_depEdgeCount = (fun (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (((B_dData_dList.v_foldl (fun (acc : int) (d : Vuna_dIr_dModel.t_IrDef) -> (((B_dTrait_dNum.v__x43_ B_dData_dInt.v_Num_ub27c21f837ed69cc_uInt) acc) (v_countList (Vuna_dIr_dModel.v_irDefDeps d))))) 0) defs))

# 370 "Vuna/Ir/Analysis.vuna"
let rec v_reachableNames = (fun (fuel : int) (pending : string B_dData_dList.t_List) (defTbl : (string, Vuna_dIr_dModel.t_IrDef) B_dContainer_dHashMap.t_HashMap) (seen : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (if (fuel <= 0) then seen else (match pending with
  | B_dData_dList.C_List_Nil -> seen
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__72) seen) then ((((v_reachableNames (fuel - 1)) dtb__73) defTbl) seen) else (let seen2 = (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__72) true) seen) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__72) defTbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_reachableNames (fuel - 1)) dtb__73) defTbl) seen2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> ((((v_reachableNames (fuel - 1)) ((B_dData_dList.v_append (Vuna_dIr_dModel.v_irDefDeps dtb__74)) dtb__73)) defTbl) seen2)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 355 "Vuna/Ir/Analysis.vuna"
let v_reachableDefs = (fun (seeds : string B_dData_dList.t_List) (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (let defTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (d : Vuna_dIr_dModel.t_IrDef) -> { B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.v_irDefName d); B_dData_dPair.f_Pair_second = d })) defs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (let budget = ((8 + (v_countList seeds)) + (v_depEdgeCount defs)) in (let seen = ((((v_reachableNames budget) seeds) defTbl) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in ((B_dData_dList.v_filter (fun (d : Vuna_dIr_dModel.t_IrDef) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Vuna_dIr_dModel.v_irDefName d)) seen))) defs)))))

# 392 "Vuna/Ir/Analysis.vuna"
let rec v_irStringsOf = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> (v_irStringsOf dtb__79)
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__80) -> ((B_dData_dList.v_concatMap v_irStringsOf) dtb__80)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> ((B_dData_dList.v_append (v_irStringsOf dtb__81)) ((B_dData_dList.v_append (v_irStringsOfAltMaybe dtb__83)) ((B_dData_dList.v_append (v_irStringsOfAltMaybe dtb__84)) (v_irStringsOfAltMaybe dtb__85))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__86, dtb__87, dtb__88, dtb__89) -> ((B_dData_dList.v_append (v_irStringsOf dtb__88)) ((B_dData_dList.v_concatMap v_irStringsOfAlt) dtb__89))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__90, dtb__91, dtb__92) -> ((B_dData_dList.v_append (v_irStringsOf dtb__90)) ((B_dData_dList.v_append (v_irStringsOf dtb__91)) (v_irStringsOf dtb__92)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb__93) -> (v_irStringsOf dtb__93)
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__94, dtb__95, dtb__96) -> ((B_dData_dList.v_append (v_irStringsOf dtb__95)) (v_irStringsOf dtb__96))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__97, dtb__98, dtb__99) -> (v_irStringsOf dtb__99)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__100, dtb__101, dtb__102) -> ((B_dData_dList.v_append (v_irStringsOf dtb__101)) (v_irStringsOf dtb__102))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__103, dtb__104, dtb__105) -> (v_irStringsOf dtb__105)
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__106, dtb__107) -> ((B_dData_dList.v_concatMap v_irStringsOf) dtb__107)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__108, dtb__109, dtb__110, dtb__111) -> ((B_dData_dList.v_append (v_irStringsOf dtb__108)) ((B_dData_dList.v_concatMap v_irStringsOfField) dtb__110))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__112, dtb__113, dtb__114, dtb__115) -> (v_irStringsOf dtb__112)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__116, dtb__117, dtb__118) -> ((B_dData_dList.v_concatMap v_irStringsOfField) dtb__118)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__119, dtb__120, dtb__121, dtb__122) -> ((B_dData_dList.v_concatMap v_irStringsOf) dtb__122)
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb__123) -> (B_dData_dList.C_List__x58__x58_ (dtb__123, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 415 "Vuna/Ir/Analysis.vuna"
and v_irStringsOfField = (fun (p : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> (v_irStringsOf (B_dData_dPair.v_secondOf p)))
# 418 "Vuna/Ir/Analysis.vuna"
and v_irStringsOfAlt = (fun (alt : Vuna_dIr_dModel.t_IrAlt) -> (v_irStringsOf (Vuna_dIr_dModel.v_irAltBodyOf alt)))
# 421 "Vuna/Ir/Analysis.vuna"
and v_irStringsOfAltMaybe = (fun (mc0 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__124) -> (v_irStringsOfAlt dtb__124)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Ir/Analysis.vuna"
let rec v_flattenApp = (fun (mc0 : Vuna_dIr_dModel.t_Ir) -> (match mc0 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__125, dtb__126, dtb__127) -> (let p = (v_flattenApp dtb__126) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf p)) (B_dData_dList.C_List__x58__x58_ (dtb__127, B_dData_dList.C_List_Nil))) })
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 434 "Vuna/Ir/Analysis.vuna"
let v_irStringsOfDef = (fun (d : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefBody d) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__128) -> (v_irStringsOf dtb__128)
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Ir/Analysis.vuna"
let rec v_checkUniqueDefNamesGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__129) mc1) then (Base_dDiag.v_icInternal (String.concat "" ["duplicate runtime definition name in IR: `"; dtb__129; "`"])) else ((v_checkUniqueDefNamesGo dtb__130) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__129) true) mc1)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Ir/Analysis.vuna"
let v_checkUniqueDefNames = (fun (defs : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> ((v_checkUniqueDefNamesGo ((B_dData_dList.v_map Vuna_dIr_dModel.v_irDefName) defs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 482 "Vuna/Ir/Analysis.vuna"
let rec v_firstBadRecName = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string) -> bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (if (mc1 dtb__131) then ((v_firstBadRecName dtb__132) mc1) else (B_dData_dMaybe.C_Maybe_Just (dtb__131)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Ir/Analysis.vuna"
let rec v_assembleGo = (fun (mc0 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List B_dData_dList.t_List) (mc2 : (string) -> bool) (mc3 : (string) -> Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (let isRec = ((v_groupNeedsRec mc0) dtb__133) in (let checked = (if isRec then (match ((v_firstBadRecName dtb__133) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> ((((Base_dDiagnostics_dCg.v_cgErrDefAt (mc3 dtb__135)) dtb__135) (Base_dDiagnostics_dCg.C_CgErr_RecursiveValueDefinition (dtb__135))) (B_dData_dVec.C_Vec_VCons (dtb__135, B_dData_dVec.C_Vec_Nil)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__133 }))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb__133 }))) in ((Base_dCommon.v_bind checked) (fun (grp : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_assembleGo mc0) dtb__134) mc2) mc3)) (fun (tail : (bool, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (grp, tail))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Ir/Analysis.vuna"
let v_groupNamesGo = (fun (mc0 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List B_dData_dList.t_List Base_dDiag.t_Check) (mc3 : (string) -> bool) (mc4 : (string) -> Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | Base_dDiag.C_Check_OkC (dtb__136) -> ((((v_assembleGo mc0) dtb__136) mc3) mc4)
  | Base_dDiag.C_Check_ErrC (dtb__137) -> (Base_dDiag.C_Check_ErrC (dtb__137))
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Ir/Analysis.vuna"
let v_assembleGroupNames = (fun (adj : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (names : string B_dData_dList.t_List) (recOk : (string) -> bool) (spanOf : (string) -> Base_dSource.t_Span B_dData_dMaybe.t_Maybe) -> (((((v_groupNamesGo (v_adjTblOf adj)) names) ((v_groupNames adj) names)) recOk) spanOf))

# 488 "Vuna/Ir/Analysis.vuna"
let rec v_irMentionsGlobal = (fun (mc0 : string) (mc1 : Vuna_dIr_dModel.t_Ir) -> (match mc1 with
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> ((v_irMentionsGlobal mc0) dtb__142)
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb__143) -> ((v_anyMentions mc0) dtb__143)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> (if ((v_irMentionsGlobal mc0) dtb__144) then true else (if ((v_anyMentionsAltM mc0) dtb__146) then true else (if ((v_anyMentionsAltM mc0) dtb__147) then true else ((v_anyMentionsAltM mc0) dtb__148))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb__149, dtb__150, dtb__151, dtb__152) -> (if ((v_irMentionsGlobal mc0) dtb__151) then true else ((v_anyMentionsAlts mc0) dtb__152))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb__153, dtb__154, dtb__155) -> (if ((v_irMentionsGlobal mc0) dtb__153) then true else (if ((v_irMentionsGlobal mc0) dtb__154) then true else ((v_irMentionsGlobal mc0) dtb__155)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb__156, dtb__157, dtb__158) -> (if ((v_irMentionsGlobal mc0) dtb__157) then true else ((v_irMentionsGlobal mc0) dtb__158))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb__159, dtb__160, dtb__161) -> ((v_irMentionsGlobal mc0) dtb__161)
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb__162, dtb__163, dtb__164) -> (if ((v_irMentionsGlobal mc0) dtb__163) then true else ((v_irMentionsGlobal mc0) dtb__164))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb__165, dtb__166, dtb__167) -> ((v_irMentionsGlobal mc0) dtb__167)
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb__168, dtb__169) -> ((v_anyMentions mc0) dtb__169)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb__170, dtb__171, dtb__172, dtb__173) -> (if ((v_irMentionsGlobal mc0) dtb__170) then true else ((v_anyMentionsFields mc0) dtb__172))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb__174, dtb__175, dtb__176, dtb__177) -> ((v_irMentionsGlobal mc0) dtb__174)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb__178, dtb__179, dtb__180) -> ((v_anyMentionsFields mc0) dtb__180)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb__181, dtb__182, dtb__183, dtb__184) -> ((v_anyMentions mc0) dtb__184)
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb__185) -> (dtb__185 = mc0)
  | _ -> false
))
# 512 "Vuna/Ir/Analysis.vuna"
and v_anyMentions = (fun (mc0 : string) (mc1 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__186, dtb__187) -> (if ((v_irMentionsGlobal mc0) dtb__186) then true else ((v_anyMentions mc0) dtb__187))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 516 "Vuna/Ir/Analysis.vuna"
and v_anyMentionsFields = (fun (mc0 : string) (mc1 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (match dtb__188 with
  | { B_dData_dPair.f_Pair_first = dtb__190; B_dData_dPair.f_Pair_second = dtb__191 } -> (if ((v_irMentionsGlobal mc0) dtb__191) then true else ((v_anyMentionsFields mc0) dtb__189))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 521 "Vuna/Ir/Analysis.vuna"
and v_anyMentionsAlts = (fun (mc0 : string) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (if ((v_irMentionsGlobal mc0) (Vuna_dIr_dModel.v_irAltBodyOf dtb__192)) then true else ((v_anyMentionsAlts mc0) dtb__193))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 526 "Vuna/Ir/Analysis.vuna"
and v_anyMentionsAltM = (fun (mc0 : string) (mc1 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> ((v_irMentionsGlobal mc0) (Vuna_dIr_dModel.v_irAltBodyOf dtb__194))
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
