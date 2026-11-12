open Vuna_runtime
let rec v_Base_dSort_dinsertBy = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if ((mc0 mc1) dtb__0) then (Base_dList.C_Base_dList_dList_Cons (mc1, (Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__0, (((v_Base_dSort_dinsertBy mc0) mc1) dtb__1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc1, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dSort_dsortBy = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (((v_Base_dSort_dinsertBy mc0) dtb__2) ((v_Base_dSort_dsortBy mc0) dtb__3))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dSort_dmergeSort = (fun _uctx0 xs -> ((v_Base_dSort_dsortBy (fun x y -> (((Base_dOrd.v_Base_dOrd_dle _uctx0) x) y))) xs))
