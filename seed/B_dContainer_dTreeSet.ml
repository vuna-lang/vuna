open Vuna_runtime
type 'a0 t_TreeSet = ('a0, B_dData_dUnit.t_Unit) B_dContainer_dTreeMap.t_TreeMap

# 23 "Base/Container/TreeSet.vuna"
let v_empty = B_dContainer_dTreeMap.v_empty

# 27 "Base/Container/TreeSet.vuna"
let v_insert = (fun _uctx0 mc0 mc1 -> (let dtb__0 = mc1 in ((((B_dContainer_dTreeMap.v_insert _uctx0) mc0) B_dData_dUnit.C_Unit_MkUnit) dtb__0)))

# 31 "Base/Container/TreeSet.vuna"
let v_remove = (fun _uctx0 mc0 mc1 -> (let dtb__1 = mc1 in (((B_dContainer_dTreeMap.v_remove _uctx0) mc0) dtb__1)))

# 35 "Base/Container/TreeSet.vuna"
let v_member = (fun _uctx0 mc0 mc1 -> (let dtb__2 = mc1 in (((B_dContainer_dTreeMap.v_member _uctx0) mc0) dtb__2)))

# 39 "Base/Container/TreeSet.vuna"
let v_size = (fun mc0 -> (let dtb__3 = mc0 in (B_dContainer_dTreeMap.v_size dtb__3)))

# 43 "Base/Container/TreeSet.vuna"
let v_toAscList = (fun mc0 -> (let dtb__4 = mc0 in ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dContainer_dTreeMap.v_toAscList dtb__4))))

# 54 "Base/Container/TreeSet.vuna"
let v_Show_uBase_uContainer_uTreeSet_uTreeSet_ua = (fun _uctx0 -> (B_dTrait_dShow.C_Show_Show ((fun s -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_uBase_uData_uList_uList_ua _uctx0)) (v_toAscList s)))))))

# 47 "Base/Container/TreeSet.vuna"
let v_toDescList = (fun mc0 -> (let dtb__5 = mc0 in ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dContainer_dTreeMap.v_toDescList dtb__5))))

# 51 "Base/Container/TreeSet.vuna"
let v_fromList = (fun _uctx0 xs -> (((B_dData_dList.v_foldl (fun acc x -> (((v_insert _uctx0) x) acc))) v_empty) xs))
