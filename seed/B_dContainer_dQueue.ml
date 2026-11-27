open Vuna_runtime
type 'a0 t_Queue = { f_Queue_queueFront : 'a0 B_dData_dList.t_List; f_Queue_queueBack : 'a0 B_dData_dList.t_List; f_Queue_queueCount : int }

# 28 "Base/Container/Queue.vuna"
let rec v_revOnto = (fun dtb_u_u2 dtb_u_u3 -> (match dtb_u_u2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u4, dtb_u_u5) -> ((v_revOnto dtb_u_u5) (B_dData_dList.C_List__x58__x58_ (dtb_u_u4, dtb_u_u3)))
  | B_dData_dList.C_List_Nil -> dtb_u_u3
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Container/Queue.vuna"
let v_appendLists = (fun dtb_u_u7 dtb_u_u8 -> ((v_revOnto ((v_revOnto dtb_u_u7) B_dData_dList.C_List_Nil)) dtb_u_u8))

# 41 "Base/Container/Queue.vuna"
let rec v_lenIntGo = (fun (dtb_u_u10 : int) dtb_u_u11 -> (match dtb_u_u11 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u12, dtb_u_u13) -> ((v_lenIntGo (dtb_u_u10 + 1)) dtb_u_u13)
  | B_dData_dList.C_List_Nil -> dtb_u_u10
  | _ -> failwith "DT: impossible branch"
))

# 37 "Base/Container/Queue.vuna"
let v_lenInt = (fun dtb_u_u15 -> ((v_lenIntGo 0) dtb_u_u15))

# 46 "Base/Container/Queue.vuna"
let v_empty = { f_Queue_queueFront = B_dData_dList.C_List_Nil; f_Queue_queueBack = B_dData_dList.C_List_Nil; f_Queue_queueCount = 0 }

# 50 "Base/Container/Queue.vuna"
let v_push = (fun dtb_u_u18 dtb_u_u19 -> (match dtb_u_u19 with
  | { f_Queue_queueFront = dtb_u_u20; f_Queue_queueBack = dtb_u_u21; f_Queue_queueCount = dtb_u_u22 } -> { f_Queue_queueFront = dtb_u_u20; f_Queue_queueBack = (B_dData_dList.C_List__x58__x58_ (dtb_u_u18, dtb_u_u21)); f_Queue_queueCount = (dtb_u_u22 + 1) }
  | _ -> failwith "DT: impossible branch"
))

# 54 "Base/Container/Queue.vuna"
let rec v_pushAll = (fun dtb_u_u24 dtb_u_u25 -> (match dtb_u_u24 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u26, dtb_u_u27) -> ((v_pushAll dtb_u_u27) ((v_push dtb_u_u26) dtb_u_u25))
  | B_dData_dList.C_List_Nil -> dtb_u_u25
  | _ -> failwith "DT: impossible branch"
))

# 59 "Base/Container/Queue.vuna"
let v_pop = (fun dtb_u_u29 -> (match dtb_u_u29 with
  | { f_Queue_queueFront = dtb_u_u30; f_Queue_queueBack = dtb_u_u31; f_Queue_queueCount = dtb_u_u32 } -> (match dtb_u_u30 with
  | B_dData_dList.C_List_Nil -> (match (B_dData_dList.v_reverse dtb_u_u31) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u33, dtb_u_u34) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u33; B_dData_dPair.f_Pair_second = { f_Queue_queueFront = dtb_u_u34; f_Queue_queueBack = B_dData_dList.C_List_Nil; f_Queue_queueCount = (dtb_u_u32 - 1) } }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u35, dtb_u_u36) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u35; B_dData_dPair.f_Pair_second = { f_Queue_queueFront = dtb_u_u36; f_Queue_queueBack = dtb_u_u31; f_Queue_queueCount = (dtb_u_u32 - 1) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Base/Container/Queue.vuna"
let v_peek = (fun dtb_u_u38 -> (match dtb_u_u38 with
  | { f_Queue_queueFront = dtb_u_u39; f_Queue_queueBack = dtb_u_u40; f_Queue_queueCount = dtb_u_u41 } -> (match dtb_u_u39 with
  | B_dData_dList.C_List_Nil -> (match (B_dData_dList.v_reverse dtb_u_u40) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u42, dtb_u_u43) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u42))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u44, dtb_u_u45) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u44))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 75 "Base/Container/Queue.vuna"
let v_isEmpty = (fun dtb_u_u47 -> (match dtb_u_u47 with
  | { f_Queue_queueFront = dtb_u_u48; f_Queue_queueBack = dtb_u_u49; f_Queue_queueCount = dtb_u_u50 } -> (dtb_u_u50 = 0)
  | _ -> failwith "DT: impossible branch"
))

# 79 "Base/Container/Queue.vuna"
let v_size = (fun dtb_u_u52 -> (match dtb_u_u52 with
  | { f_Queue_queueFront = dtb_u_u53; f_Queue_queueBack = dtb_u_u54; f_Queue_queueCount = dtb_u_u55 } -> (bi_natFromInt dtb_u_u55)
  | _ -> failwith "DT: impossible branch"
))

# 83 "Base/Container/Queue.vuna"
let v_fromList = (fun dtb_u_u57 -> { f_Queue_queueFront = dtb_u_u57; f_Queue_queueBack = B_dData_dList.C_List_Nil; f_Queue_queueCount = (v_lenInt dtb_u_u57) })

# 87 "Base/Container/Queue.vuna"
let v_toList = (fun dtb_u_u59 -> (match dtb_u_u59 with
  | { f_Queue_queueFront = dtb_u_u60; f_Queue_queueBack = dtb_u_u61; f_Queue_queueCount = dtb_u_u62 } -> ((v_appendLists dtb_u_u60) (B_dData_dList.v_reverse dtb_u_u61))
  | _ -> failwith "DT: impossible branch"
))

# 90 "Base/Container/Queue.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Container_x36_46_x36_Queue_x36_46_x36_Queue_ua = (fun dtb_u_u64 -> (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u65 -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua dtb_u_u64)) (v_toList dtb_u_u65)))))))

# 20 "Base/Container/Queue.vuna"
let v_queueFront = (fun dtb_u_u67 -> (match dtb_u_u67 with
  | { f_Queue_queueFront = dtb_u_u68; f_Queue_queueBack = dtb_u_u69; f_Queue_queueCount = dtb_u_u70 } -> dtb_u_u68
  | _ -> failwith "DT: impossible branch"
))

# 22 "Base/Container/Queue.vuna"
let v_queueBack = (fun dtb_u_u72 -> (match dtb_u_u72 with
  | { f_Queue_queueFront = dtb_u_u73; f_Queue_queueBack = dtb_u_u74; f_Queue_queueCount = dtb_u_u75 } -> dtb_u_u74
  | _ -> failwith "DT: impossible branch"
))

# 24 "Base/Container/Queue.vuna"
let v_queueCount = (fun dtb_u_u77 -> (match dtb_u_u77 with
  | { f_Queue_queueFront = dtb_u_u78; f_Queue_queueBack = dtb_u_u79; f_Queue_queueCount = dtb_u_u80 } -> dtb_u_u80
  | _ -> failwith "DT: impossible branch"
))
