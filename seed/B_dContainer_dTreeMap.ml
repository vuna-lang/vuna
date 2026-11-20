open Vuna_runtime
type ('a0, 'a1) t_Tree = C_Tree_Leaf | C_Tree_Node of (int) * ('a0) * ('a1) * (('a0, 'a1) t_Tree) * (('a0, 'a1) t_Tree)
and ('a0, 'a1) t_TreeMap = { f_TreeMap_treeMapRoot : ('a0, 'a1) t_Tree; f_TreeMap_treeMapCount : int }

# 27 "Base/Container/TreeMap.vuna"
let v_maxInt = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 31 "Base/Container/TreeMap.vuna"
let v_heightTree = (fun mc0 -> (match mc0 with
  | C_Tree_Node (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> dtb__0
  | C_Tree_Leaf -> 0
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Container/TreeMap.vuna"
let v_mkTree = (fun key val_ l r -> (C_Tree_Node ((1 + ((v_maxInt (v_heightTree l)) (v_heightTree r))), key, val_, l, r)))

# 40 "Base/Container/TreeMap.vuna"
let v_rotateRight = (fun key val_ l r -> (match l with
  | C_Tree_Node (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> ((((v_mkTree dtb__6) dtb__7) dtb__8) ((((v_mkTree key) val_) dtb__9) r))
  | C_Tree_Leaf -> ((((v_mkTree key) val_) l) r)
  | _ -> failwith "DT: impossible branch"
))

# 47 "Base/Container/TreeMap.vuna"
let v_rotateLeft = (fun key val_ l r -> (match r with
  | C_Tree_Node (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> ((((v_mkTree dtb__11) dtb__12) ((((v_mkTree key) val_) l) dtb__13)) dtb__14)
  | C_Tree_Leaf -> ((((v_mkTree key) val_) l) r)
  | _ -> failwith "DT: impossible branch"
))

# 54 "Base/Container/TreeMap.vuna"
let v_rebalance = (fun key val_ l r -> ((fun b -> (if (b > 1) then (match l with
  | C_Tree_Node (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> (if ((v_heightTree dtb__18) >= (v_heightTree dtb__19)) then ((((v_rotateRight key) val_) l) r) else ((((v_rotateRight key) val_) ((((v_rotateLeft dtb__16) dtb__17) dtb__18) dtb__19)) r))
  | C_Tree_Leaf -> ((((v_mkTree key) val_) l) r)
  | _ -> failwith "DT: impossible branch"
) else (if (b < (0 - 1)) then (match r with
  | C_Tree_Node (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> (if ((v_heightTree dtb__24) >= (v_heightTree dtb__23)) then ((((v_rotateLeft key) val_) l) r) else ((((v_rotateLeft key) val_) l) ((((v_rotateRight dtb__21) dtb__22) dtb__23) dtb__24)))
  | C_Tree_Leaf -> ((((v_mkTree key) val_) l) r)
  | _ -> failwith "DT: impossible branch"
) else ((((v_mkTree key) val_) l) r)))) ((v_heightTree l) - (v_heightTree r))))

# 70 "Base/Container/TreeMap.vuna"
let rec v_insertTree = (fun _uctx0 mc0 mc1 mc2 -> (match mc2 with
  | C_Tree_Node (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> (if (((B_dTrait_dOrd.v__x60_ _uctx0) mc0) dtb__26) then (match ((((v_insertTree _uctx0) mc0) mc1) dtb__28) with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = ((((v_rebalance dtb__26) dtb__27) dtb__31) dtb__29) }
  | _ -> failwith "DT: impossible branch"
) else (if (((B_dTrait_dOrd.v__x60_ _uctx0) dtb__26) mc0) then (match ((((v_insertTree _uctx0) mc0) mc1) dtb__29) with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = ((((v_rebalance dtb__26) dtb__27) dtb__28) dtb__33) }
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = ((((v_mkTree dtb__26) mc1) dtb__28) dtb__29) }))
  | C_Tree_Leaf -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = ((((v_mkTree mc0) mc1) C_Tree_Leaf) C_Tree_Leaf) }
  | _ -> failwith "DT: impossible branch"
))

# 83 "Base/Container/TreeMap.vuna"
let rec v_popMinTree = (fun mc0 -> (match mc0 with
  | C_Tree_Node (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> (match dtb__37 with
  | C_Tree_Leaf -> { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = dtb__36 })); B_dData_dPair.f_Pair_second = dtb__38 }
  | _ -> (match (v_popMinTree dtb__37) with
  | { B_dData_dPair.f_Pair_first = dtb__39; B_dData_dPair.f_Pair_second = dtb__40 } -> { B_dData_dPair.f_Pair_first = dtb__39; B_dData_dPair.f_Pair_second = ((((v_rebalance dtb__35) dtb__36) dtb__40) dtb__38) }
  | _ -> failwith "DT: impossible branch"
)
)
  | C_Tree_Leaf -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = C_Tree_Leaf }
  | _ -> failwith "DT: impossible branch"
))

# 91 "Base/Container/TreeMap.vuna"
let rec v_removeTree = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | C_Tree_Node (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (if (((B_dTrait_dOrd.v__x60_ _uctx0) mc0) dtb__42) then (match (((v_removeTree _uctx0) mc0) dtb__44) with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = ((((v_rebalance dtb__42) dtb__43) dtb__47) dtb__45) }
  | _ -> failwith "DT: impossible branch"
) else (if (((B_dTrait_dOrd.v__x60_ _uctx0) dtb__42) mc0) then (match (((v_removeTree _uctx0) mc0) dtb__45) with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = ((((v_rebalance dtb__42) dtb__43) dtb__44) dtb__49) }
  | _ -> failwith "DT: impossible branch"
) else (match dtb__44 with
  | C_Tree_Leaf -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__45 }
  | C_Tree_Node (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> (match dtb__45 with
  | C_Tree_Leaf -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__44 }
  | C_Tree_Node (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { B_dData_dPair.f_Pair_first = dtb__60; B_dData_dPair.f_Pair_second = dtb__61 } -> (match dtb__60 with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__44 }
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> (match dtb__62 with
  | { B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = dtb__64 } -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = ((((v_rebalance dtb__63) dtb__64) dtb__44) dtb__61) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_popMinTree dtb__45))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Tree_Leaf -> { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = C_Tree_Leaf }
  | _ -> failwith "DT: impossible branch"
))

# 113 "Base/Container/TreeMap.vuna"
let rec v_lookupTree = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | C_Tree_Node (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> (if (((B_dTrait_dOrd.v__x60_ _uctx0) mc0) dtb__66) then (((v_lookupTree _uctx0) mc0) dtb__68) else (if (((B_dTrait_dOrd.v__x60_ _uctx0) dtb__66) mc0) then (((v_lookupTree _uctx0) mc0) dtb__69) else (B_dData_dMaybe.C_Maybe_Just (dtb__67))))
  | C_Tree_Leaf -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 119 "Base/Container/TreeMap.vuna"
let rec v_toAscGo = (fun mc0 mc1 -> (match mc0 with
  | C_Tree_Node (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> ((v_toAscGo dtb__73) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__71; B_dData_dPair.f_Pair_second = dtb__72 }, ((v_toAscGo dtb__74) mc1))))
  | C_Tree_Leaf -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 124 "Base/Container/TreeMap.vuna"
let rec v_toDescGo = (fun mc0 mc1 -> (match mc0 with
  | C_Tree_Node (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> ((v_toDescGo dtb__79) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__76; B_dData_dPair.f_Pair_second = dtb__77 }, ((v_toDescGo dtb__78) mc1))))
  | C_Tree_Leaf -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 129 "Base/Container/TreeMap.vuna"
let rec v_rangeGo = (fun _uctx0 mc0 mc1 mc2 mc3 -> (match mc2 with
  | C_Tree_Node (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> (if (((B_dTrait_dOrd.v__x60_ _uctx0) dtb__81) mc0) then (((((v_rangeGo _uctx0) mc0) mc1) dtb__84) mc3) else (if (((B_dTrait_dOrd.v__x60_ _uctx0) mc1) dtb__81) then (((((v_rangeGo _uctx0) mc0) mc1) dtb__83) mc3) else (((((v_rangeGo _uctx0) mc0) mc1) dtb__83) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__81; B_dData_dPair.f_Pair_second = dtb__82 }, (((((v_rangeGo _uctx0) mc0) mc1) dtb__84) mc3))))))
  | C_Tree_Leaf -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 144 "Base/Container/TreeMap.vuna"
let v_empty = { f_TreeMap_treeMapRoot = C_Tree_Leaf; f_TreeMap_treeMapCount = 0 }

# 148 "Base/Container/TreeMap.vuna"
let v_insert = (fun _uctx0 mc0 mc1 mc2 -> (match mc2 with
  | { f_TreeMap_treeMapRoot = dtb__85; f_TreeMap_treeMapCount = dtb__86 } -> (match ((((v_insertTree _uctx0) mc0) mc1) dtb__85) with
  | { B_dData_dPair.f_Pair_first = dtb__87; B_dData_dPair.f_Pair_second = dtb__88 } -> { f_TreeMap_treeMapRoot = dtb__88; f_TreeMap_treeMapCount = (if dtb__87 then (dtb__86 + 1) else dtb__86) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 154 "Base/Container/TreeMap.vuna"
let v_remove = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | { f_TreeMap_treeMapRoot = dtb__89; f_TreeMap_treeMapCount = dtb__90 } -> (match (((v_removeTree _uctx0) mc0) dtb__89) with
  | { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = dtb__92 } -> { f_TreeMap_treeMapRoot = dtb__92; f_TreeMap_treeMapCount = (if dtb__91 then (dtb__90 - 1) else dtb__90) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 160 "Base/Container/TreeMap.vuna"
let v_lookup = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | { f_TreeMap_treeMapRoot = dtb__93; f_TreeMap_treeMapCount = dtb__94 } -> (((v_lookupTree _uctx0) mc0) dtb__93)
  | _ -> failwith "DT: impossible branch"
))

# 164 "Base/Container/TreeMap.vuna"
let v_member = (fun _uctx0 key t -> (match (((v_lookup _uctx0) key) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 171 "Base/Container/TreeMap.vuna"
let v_size = (fun mc0 -> (match mc0 with
  | { f_TreeMap_treeMapRoot = dtb__96; f_TreeMap_treeMapCount = dtb__97 } -> (bi_natFromInt dtb__97)
  | _ -> failwith "DT: impossible branch"
))

# 175 "Base/Container/TreeMap.vuna"
let v_height = (fun mc0 -> (match mc0 with
  | { f_TreeMap_treeMapRoot = dtb__98; f_TreeMap_treeMapCount = dtb__99 } -> (bi_natFromInt (v_heightTree dtb__98))
  | _ -> failwith "DT: impossible branch"
))

# 179 "Base/Container/TreeMap.vuna"
let v_toAscList = (fun mc0 -> (match mc0 with
  | { f_TreeMap_treeMapRoot = dtb__100; f_TreeMap_treeMapCount = dtb__101 } -> ((v_toAscGo dtb__100) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 194 "Base/Container/TreeMap.vuna"
let v_Show_uBase_uContainer_uTreeMap_uTreeMap_uk_uv = (fun _uctx0 _uctx1 -> (B_dTrait_dShow.C_Show_Show ((fun t -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_uBase_uData_uList_uList_ua ((B_dData_dPair.v_Show_uBase_uData_uPair_uPair_ua_ub _uctx0) _uctx1))) (v_toAscList t)))))))

# 183 "Base/Container/TreeMap.vuna"
let v_toDescList = (fun mc0 -> (match mc0 with
  | { f_TreeMap_treeMapRoot = dtb__102; f_TreeMap_treeMapCount = dtb__103 } -> ((v_toDescGo dtb__102) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 187 "Base/Container/TreeMap.vuna"
let v_range = (fun _uctx0 mc0 mc1 mc2 -> (match mc2 with
  | { f_TreeMap_treeMapRoot = dtb__104; f_TreeMap_treeMapCount = dtb__105 } -> (((((v_rangeGo _uctx0) mc0) mc1) dtb__104) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 191 "Base/Container/TreeMap.vuna"
let v_fromList = (fun _uctx0 ps -> (((B_dData_dList.v_foldl (fun acc p -> ((((v_insert _uctx0) (B_dData_dPair.v_firstOf p)) (B_dData_dPair.v_secondOf p)) acc))) v_empty) ps))
