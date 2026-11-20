open Vuna_runtime
type 'a0 t_Heap = C_Heap_HEmpty | C_Heap_HNode of (int) * ('a0) * ('a0 t_Heap) * ('a0 t_Heap)
and 'a0 t_PriorityQueue = { f_PriorityQueue_priorityQueueHeap : 'a0 t_Heap; f_PriorityQueue_priorityQueueCount : int }

# 28 "Base/Container/PriorityQueue.vuna"
let v_rankOf = (fun mc0 -> (match mc0 with
  | C_Heap_HNode (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | C_Heap_HEmpty -> 0
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Container/PriorityQueue.vuna"
let v_makeHeap = (fun x a b -> (if ((v_rankOf a) >= (v_rankOf b)) then (C_Heap_HNode (((v_rankOf b) + 1), x, a, b)) else (C_Heap_HNode (((v_rankOf a) + 1), x, b, a))))

# 38 "Base/Container/PriorityQueue.vuna"
let rec v_meld = (fun _uctx0 h1 h2 -> (match h1 with
  | C_Heap_HEmpty -> h2
  | C_Heap_HNode (dtb__4, dtb__5, dtb__6, dtb__7) -> (match h2 with
  | C_Heap_HEmpty -> h1
  | C_Heap_HNode (dtb__8, dtb__9, dtb__10, dtb__11) -> (if (((B_dTrait_dOrd.v__x60__x61_ _uctx0) dtb__5) dtb__9) then (((v_makeHeap dtb__5) dtb__6) (((v_meld _uctx0) dtb__7) h2)) else (((v_makeHeap dtb__9) dtb__10) (((v_meld _uctx0) h1) dtb__11)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 56 "Base/Container/PriorityQueue.vuna"
let v_empty = { f_PriorityQueue_priorityQueueHeap = C_Heap_HEmpty; f_PriorityQueue_priorityQueueCount = 0 }

# 60 "Base/Container/PriorityQueue.vuna"
let v_push = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | { f_PriorityQueue_priorityQueueHeap = dtb__12; f_PriorityQueue_priorityQueueCount = dtb__13 } -> { f_PriorityQueue_priorityQueueHeap = (((v_meld _uctx0) (C_Heap_HNode (1, mc0, C_Heap_HEmpty, C_Heap_HEmpty))) dtb__12); f_PriorityQueue_priorityQueueCount = (dtb__13 + 1) }
  | _ -> failwith "DT: impossible branch"
))

# 64 "Base/Container/PriorityQueue.vuna"
let v_peek = (fun mc0 -> (match mc0 with
  | { f_PriorityQueue_priorityQueueHeap = dtb__14; f_PriorityQueue_priorityQueueCount = dtb__15 } -> (match dtb__14 with
  | C_Heap_HEmpty -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Heap_HNode (dtb__16, dtb__17, dtb__18, dtb__19) -> (B_dData_dMaybe.C_Maybe_Just (dtb__17))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 71 "Base/Container/PriorityQueue.vuna"
let v_pop = (fun d4964 mc0 -> (match mc0 with
  | { f_PriorityQueue_priorityQueueHeap = dtb__20; f_PriorityQueue_priorityQueueCount = dtb__21 } -> (match dtb__20 with
  | C_Heap_HEmpty -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Heap_HNode (dtb__22, dtb__23, dtb__24, dtb__25) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = { f_PriorityQueue_priorityQueueHeap = (((v_meld d4964) dtb__24) dtb__25); f_PriorityQueue_priorityQueueCount = (dtb__21 - 1) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 78 "Base/Container/PriorityQueue.vuna"
let v_size = (fun mc0 -> (match mc0 with
  | { f_PriorityQueue_priorityQueueHeap = dtb__26; f_PriorityQueue_priorityQueueCount = dtb__27 } -> (bi_natFromInt dtb__27)
  | _ -> failwith "DT: impossible branch"
))

# 82 "Base/Container/PriorityQueue.vuna"
let v_isEmpty = (fun mc0 -> (match mc0 with
  | { f_PriorityQueue_priorityQueueHeap = dtb__28; f_PriorityQueue_priorityQueueCount = dtb__29 } -> (dtb__29 = 0)
  | _ -> failwith "DT: impossible branch"
))

# 86 "Base/Container/PriorityQueue.vuna"
let v_fromList = (fun _uctx0 xs -> (((B_dData_dList.v_foldl (fun acc x -> (((v_push _uctx0) x) acc))) v_empty) xs))

# 90 "Base/Container/PriorityQueue.vuna"
let rec v_drain = (fun _uctx0 (fuel : int) q acc -> (if (fuel <= 0) then (B_dData_dList.v_reverse acc) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__30) -> (match dtb__30 with
  | { B_dData_dPair.f_Pair_first = dtb__31; B_dData_dPair.f_Pair_second = dtb__32 } -> ((((v_drain _uctx0) (fuel - 1)) dtb__32) (B_dData_dList.C_List__x58__x58_ (dtb__31, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.v_reverse acc)
  | _ -> failwith "DT: impossible branch"
)) ((v_pop _uctx0) q))))

# 100 "Base/Container/PriorityQueue.vuna"
let v_toAscList = (fun _uctx0 mc0 -> (match mc0 with
  | { f_PriorityQueue_priorityQueueHeap = dtb__33; f_PriorityQueue_priorityQueueCount = dtb__34 } -> ((((v_drain _uctx0) dtb__34) mc0) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 103 "Base/Container/PriorityQueue.vuna"
let v_Show_uBase_uContainer_uPriorityQueue_uPriorityQueue_ua = (fun _uctx0 _uctx1 -> (B_dTrait_dShow.C_Show_Show ((fun q -> ("fromList " ^ ((B_dTrait_dShow.v_show (B_dData_dList.v_Show_uBase_uData_uList_uList_ua _uctx1)) ((v_toAscList _uctx0) q)))))))
