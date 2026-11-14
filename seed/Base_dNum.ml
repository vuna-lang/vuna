open Vuna_runtime
type 'a0 t_Dict_uBase_dNum_dNum = C_Dict_uBase_dNum_dNum_Num of (('a0) -> ('a0) -> 'a0) * (('a0) -> ('a0) -> 'a0) * (('a0) -> ('a0) -> 'a0) * (('a0) -> ('a0) -> 'a0)

# 24 "Base/Num.vuna"
let v_Base_dNum_dadd = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dNum_dNum_Num (dtb__0, dtb__1, dtb__2, dtb__3) -> ((dtb__0 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 26 "Base/Num.vuna"
let v_Base_dNum_dsub = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dNum_dNum_Num (dtb__4, dtb__5, dtb__6, dtb__7) -> ((dtb__5 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 28 "Base/Num.vuna"
let v_Base_dNum_dmul = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dNum_dNum_Num (dtb__8, dtb__9, dtb__10, dtb__11) -> ((dtb__10 x0) x1)
  | _ -> failwith "DT: impossible branch"
))

# 30 "Base/Num.vuna"
let v_Base_dNum_ddiv = (fun _ud x0 x1 -> (match _ud with
  | C_Dict_uBase_dNum_dNum_Num (dtb__12, dtb__13, dtb__14, dtb__15) -> ((dtb__15 x0) x1)
  | _ -> failwith "DT: impossible branch"
))
