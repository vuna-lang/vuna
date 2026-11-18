open Vuna_runtime
type 'a0 t_Base_dHashSet_dHashSet = ('a0, bool) Base_dHashMap.t_Base_dHashMap_dHashMap

# 21 "Base/HashSet.vuna"
let v_Base_dHashSet_dempty = (fun _uctx0 -> ((Base_dHashMap.v_Base_dHashMap_dfromList _uctx0) Base_dList.C_Base_dList_dList_Nil))

# 25 "Base/HashSet.vuna"
let v_Base_dHashSet_dinsert = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__0 = mc1 in ((((Base_dHashMap.v_Base_dHashMap_dinsert _uctx0) mc0) true) dtb__0)))

# 29 "Base/HashSet.vuna"
let v_Base_dHashSet_dmember = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__1 = mc1 in ((((Base_dHashMap.v_Base_dHashMap_dmember _uctx0) _uctx1) mc0) dtb__1)))

# 33 "Base/HashSet.vuna"
let v_Base_dHashSet_dfromList = (fun _uctx0 _uctx1 xs -> (((Base_dList.v_Base_dList_dfoldl (fun acc x -> ((((v_Base_dHashSet_dinsert _uctx0) _uctx1) x) acc))) (v_Base_dHashSet_dempty _uctx0)) xs))

# 37 "Base/HashSet.vuna"
let v_Base_dHashSet_dtoList = (fun _uctx0 mc0 -> (let dtb__2 = mc0 in ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) ((Base_dHashMap.v_Base_dHashMap_dtoList _uctx0) dtb__2))))

# 44 "Base/HashSet.vuna"
let v_Show_uBase_uHashSet_uHashSet_ua = (fun _uctx0 _uctx1 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun s -> ("fromList " ^ ((Base_dShow.v_Base_dShow_dshow (Base_dList.v_Show_uBase_uList_uList_ua _uctx0)) ((v_Base_dHashSet_dtoList _uctx1) s)))))))

# 41 "Base/HashSet.vuna"
let v_Base_dHashSet_dsize = (fun _uctx0 s -> (Base_dList.v_Base_dList_dlength ((v_Base_dHashSet_dtoList _uctx0) s)))
