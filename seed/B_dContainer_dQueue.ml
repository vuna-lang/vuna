open Vuna_runtime
type 'a0 t_Queue = { f_Queue_queueFront : 'a0 B_dData_dList.t_List; f_Queue_queueBack : 'a0 B_dData_dList.t_List; f_Queue_queueCount : int }

# 28 "Base/Container/Queue.vuna"
let rec v_revOnto = (fun mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> ((v_revOnto dtb__1) (B_dData_dList.C_List__x58__x58_ (dtb__0, mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Container/Queue.vuna"
let v_appendLists = (fun xs ys -> ((v_revOnto ((v_revOnto xs) B_dData_dList.C_List_Nil)) ys))

# 41 "Base/Container/Queue.vuna"
let rec v_lenIntGo = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> ((v_lenIntGo (mc0 + 1)) dtb__3)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 37 "Base/Container/Queue.vuna"
let v_lenInt = (fun xs -> ((v_lenIntGo 0) xs))

# 46 "Base/Container/Queue.vuna"
let v_empty = { f_Queue_queueFront = B_dData_dList.C_List_Nil; f_Queue_queueBack = B_dData_dList.C_List_Nil; f_Queue_queueCount = 0 }

# 50 "Base/Container/Queue.vuna"
let v_push = (fun mc0 mc1 -> (match mc1 with
  | { f_Queue_queueFront = dtb__4; f_Queue_queueBack = dtb__5; f_Queue_queueCount = dtb__6 } -> { f_Queue_queueFront = dtb__4; f_Queue_queueBack = (B_dData_dList.C_List__x58__x58_ (mc0, dtb__5)); f_Queue_queueCount = (dtb__6 + 1) }
  | _ -> failwith "DT: impossible branch"
))

# 54 "Base/Container/Queue.vuna"
let rec v_pushAll = (fun mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> ((v_pushAll dtb__8) ((v_push dtb__7) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 59 "Base/Container/Queue.vuna"
let v_pop = (fun mc0 -> (match mc0 with
  | { f_Queue_queueFront = dtb__9; f_Queue_queueBack = dtb__10; f_Queue_queueCount = dtb__11 } -> (match dtb__9 with
  | B_dData_dList.C_List_Nil -> (match (B_dData_dList.v_reverse dtb__10) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = { f_Queue_queueFront = dtb__13; f_Queue_queueBack = B_dData_dList.C_List_Nil; f_Queue_queueCount = (dtb__11 - 1) } }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__14; B_dData_dPair.f_Pair_second = { f_Queue_queueFront = dtb__15; f_Queue_queueBack = dtb__10; f_Queue_queueCount = (dtb__11 - 1) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Base/Container/Queue.vuna"
let v_peek = (fun mc0 -> (match mc0 with
  | { f_Queue_queueFront = dtb__16; f_Queue_queueBack = dtb__17; f_Queue_queueCount = dtb__18 } -> (match dtb__16 with
  | B_dData_dList.C_List_Nil -> (match (B_dData_dList.v_reverse dtb__17) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (B_dData_dMaybe.C_Maybe_Just (dtb__19))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (B_dData_dMaybe.C_Maybe_Just (dtb__21))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 75 "Base/Container/Queue.vuna"
let v_isEmpty = (fun mc0 -> (match mc0 with
  | { f_Queue_queueFront = dtb__23; f_Queue_queueBack = dtb__24; f_Queue_queueCount = dtb__25 } -> (dtb__25 = 0)
  | _ -> failwith "DT: impossible branch"
))

# 79 "Base/Container/Queue.vuna"
let v_size = (fun mc0 -> (match mc0 with
  | { f_Queue_queueFront = dtb__26; f_Queue_queueBack = dtb__27; f_Queue_queueCount = dtb__28 } -> (bi_natFromInt dtb__28)
  | _ -> failwith "DT: impossible branch"
))

# 83 "Base/Container/Queue.vuna"
let v_fromList = (fun xs -> { f_Queue_queueFront = xs; f_Queue_queueBack = B_dData_dList.C_List_Nil; f_Queue_queueCount = (v_lenInt xs) })

# 87 "Base/Container/Queue.vuna"
let v_toList = (fun mc0 -> (match mc0 with
  | { f_Queue_queueFront = dtb__29; f_Queue_queueBack = dtb__30; f_Queue_queueCount = dtb__31 } -> ((v_appendLists dtb__29) (B_dData_dList.v_reverse dtb__30))
  | _ -> failwith "DT: impossible branch"
))

# 90 "Base/Container/Queue.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Container_x36_46_x36_Queue_x36_46_x36_Queue_ua = (fun _uctx0 -> (B_dTrait_dShow.C_Show_Show ((fun q -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua _uctx0)) (v_toList q)))))))

# 20 "Base/Container/Queue.vuna"
let v_queueFront = (fun p -> (match p with
  | { f_Queue_queueFront = dtb__32; f_Queue_queueBack = dtb__33; f_Queue_queueCount = dtb__34 } -> dtb__32
  | _ -> failwith "DT: impossible branch"
))

# 22 "Base/Container/Queue.vuna"
let v_queueBack = (fun p -> (match p with
  | { f_Queue_queueFront = dtb__35; f_Queue_queueBack = dtb__36; f_Queue_queueCount = dtb__37 } -> dtb__36
  | _ -> failwith "DT: impossible branch"
))

# 24 "Base/Container/Queue.vuna"
let v_queueCount = (fun p -> (match p with
  | { f_Queue_queueFront = dtb__38; f_Queue_queueBack = dtb__39; f_Queue_queueCount = dtb__40 } -> dtb__40
  | _ -> failwith "DT: impossible branch"
))
