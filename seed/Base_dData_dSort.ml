open Vuna_runtime
# 11 "Base/Data/Sort.vuna"
let rec v_Base_dData_dSort_dinsertBy = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if ((mc0 mc1) dtb__0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc1, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1)))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, (((v_Base_dData_dSort_dinsertBy mc0) mc1) dtb__1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc1, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 16 "Base/Data/Sort.vuna"
let rec v_Base_dData_dSort_dsortBy = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (((v_Base_dData_dSort_dinsertBy mc0) dtb__2) ((v_Base_dData_dSort_dsortBy mc0) dtb__3))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 21 "Base/Data/Sort.vuna"
let v_Base_dData_dSort_dmergeSort = (fun _uctx0 xs -> ((v_Base_dData_dSort_dsortBy (fun x y -> (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60__x61_ _uctx0) x) y))) xs))
