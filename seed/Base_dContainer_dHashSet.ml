open Vuna_runtime
type 'a0 t_Base_dContainer_dHashSet_dHashSet = ('a0, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap

# 21 "Base/Container/HashSet.vuna"
let v_Base_dContainer_dHashSet_dempty = (fun _uctx0 -> ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList _uctx0) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 25 "Base/Container/HashSet.vuna"
let v_Base_dContainer_dHashSet_dinsert = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__0 = mc1 in ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert _uctx0) mc0) true) dtb__0)))

# 29 "Base/Container/HashSet.vuna"
let v_Base_dContainer_dHashSet_dmember = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__1 = mc1 in ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember _uctx0) _uctx1) mc0) dtb__1)))

# 33 "Base/Container/HashSet.vuna"
let v_Base_dContainer_dHashSet_dfromList = (fun _uctx0 _uctx1 xs -> (((Base_dData_dList.v_Base_dData_dList_dfoldl (fun acc x -> ((((v_Base_dContainer_dHashSet_dinsert _uctx0) _uctx1) x) acc))) (v_Base_dContainer_dHashSet_dempty _uctx0)) xs))

# 37 "Base/Container/HashSet.vuna"
let v_Base_dContainer_dHashSet_dtoList = (fun _uctx0 mc0 -> (let dtb__2 = mc0 in ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dtoList _uctx0) dtb__2))))

# 44 "Base/Container/HashSet.vuna"
let v_Show_uBase_uContainer_uHashSet_uHashSet_ua = (fun _uctx0 _uctx1 -> (Base_dTrait_dShow.C_Dict_uBase_dTrait_dShow_dShow_Show ((fun s -> ("fromList " ^ ((Base_dTrait_dShow.v_Base_dTrait_dShow_dshow (Base_dData_dList.v_Show_uBase_uData_uList_uList_ua _uctx0)) ((v_Base_dContainer_dHashSet_dtoList _uctx1) s)))))))

# 41 "Base/Container/HashSet.vuna"
let v_Base_dContainer_dHashSet_dsize = (fun _uctx0 s -> (Base_dData_dList.v_Base_dData_dList_dlength ((v_Base_dContainer_dHashSet_dtoList _uctx0) s)))
