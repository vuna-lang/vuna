open Vuna_runtime
type 'a0 t_HashSet = ('a0, bool) B_dContainer_dHashMap.t_HashMap

# 21 "Base/Container/HashSet.vuna"
let v_empty = (fun d22875 d22876 -> (((B_dContainer_dHashMap.v_fromList d22875) d22876) B_dData_dList.C_List_Nil))

# 25 "Base/Container/HashSet.vuna"
let v_insert = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__0 = mc1 in (((((B_dContainer_dHashMap.v_insert _uctx0) _uctx1) mc0) true) dtb__0)))

# 29 "Base/Container/HashSet.vuna"
let v_remove = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__1 = mc1 in ((((B_dContainer_dHashMap.v_remove _uctx0) _uctx1) mc0) dtb__1)))

# 33 "Base/Container/HashSet.vuna"
let v_member = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__2 = mc1 in ((((B_dContainer_dHashMap.v_member _uctx0) _uctx1) mc0) dtb__2)))

# 37 "Base/Container/HashSet.vuna"
let v_fromList = (fun _uctx0 _uctx1 xs -> (((B_dData_dList.v_foldl (fun acc x -> ((((v_insert _uctx0) _uctx1) x) acc))) ((v_empty _uctx0) _uctx1)) xs))

# 41 "Base/Container/HashSet.vuna"
let v_toList = (fun mc0 -> (let dtb__3 = mc0 in ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dContainer_dHashMap.v_toList dtb__3))))

# 48 "Base/Container/HashSet.vuna"
let v_Show_uBase_uContainer_uHashSet_uHashSet_ua = (fun _uctx0 -> (B_dTrait_dShow.C_Show_Show ((fun s -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_uBase_uData_uList_uList_ua _uctx0)) (v_toList s)))))))

# 45 "Base/Container/HashSet.vuna"
let v_size = (fun mc0 -> (let dtb__4 = mc0 in (B_dContainer_dHashMap.v_size dtb__4)))
