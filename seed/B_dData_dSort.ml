open Vuna_runtime
# 11 "Base/Data/Sort.vuna"
let rec v_insertBy = (fun mc0 mc1 mc2 -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((mc0 mc1) dtb__0) then (B_dData_dList.C_List__x58__x58_ (mc1, (B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1)))) else (B_dData_dList.C_List__x58__x58_ (dtb__0, (((v_insertBy mc0) mc1) dtb__1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc1, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 16 "Base/Data/Sort.vuna"
let rec v_sortBy = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (((v_insertBy mc0) dtb__2) ((v_sortBy mc0) dtb__3))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 21 "Base/Data/Sort.vuna"
let v_mergeSort = (fun _uctx0 xs -> ((v_sortBy (fun x y -> (((B_dTrait_dOrd.v__x60__x61_ _uctx0) x) y))) xs))
