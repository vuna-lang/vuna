open Vuna_runtime
type ('a0, 'a1) t_Base_dHashMap_dHashMap = ((('a0, 'a1) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList array) array)

let v_Base_dHashMap_d_ubucketOf = (fun n -> ((fun m -> (if (m < 0) then (m + 1024) else m)) (n - ((if 1024 = 0 then failwith "division by zero" else n / 1024) * 1024))))

let rec v_Base_dHashMap_d_ulookupAssoc = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__2, dtb__3) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) mc0) dtb__2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3)) else (((v_Base_dHashMap_d_ulookupAssoc _uctx0) mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_d_uhasKeyIn = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__6, dtb__7) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) mc0) dtb__6) then true else (((v_Base_dHashMap_d_uhasKeyIn _uctx0) mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_d_udedupGo = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__10, dtb__11) -> (if (((v_Base_dHashMap_d_uhasKeyIn _uctx0) dtb__10) mc1) then (((v_Base_dHashMap_d_udedupGo _uctx0) dtb__9) mc1) else (((v_Base_dHashMap_d_udedupGo _uctx0) dtb__9) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__10, dtb__11)), mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_d_udedupBucket = (fun _uctx0 xs -> (((v_Base_dHashMap_d_udedupGo _uctx0) xs) Base_dList.C_Base_dList_dList_Nil))

let v_Base_dHashMap_dinsert = (fun _uctx0 mc0 mc1 mc2 -> (let dtb__12 = mc2 in ((fun base -> ((fun b -> ((fun qi -> ((fun oi -> ((fun ii -> ((fun outer -> ((fun inner -> (((Base_dArray.v_Base_dArray_dset base) oi) (((Base_dArray.v_Base_dArray_dset outer) ii) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), inner))))) ((Base_dArray.v_Base_dArray_dget outer) ii))) ((Base_dArray.v_Base_dArray_dget base) oi))) (bi_natFromInt (b - (qi * 32))))) (bi_natFromInt qi))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v_Base_dHashMap_d_ubucketOf ((Base_dHashable.v_Base_dHashable_dhash _uctx0) mc0)))) (if ((Base_dArray.v_Base_dArray_dlength dtb__12) = 0) then ((Base_dArray.v_Base_dArray_dmake 32) ((Base_dArray.v_Base_dArray_dmake 32) Base_dList.C_Base_dList_dList_Nil)) else dtb__12))))

let v_Base_dHashMap_dlookup = (fun _uctx0 _uctx1 mc0 mc1 -> (let dtb__13 = mc1 in (if ((Base_dArray.v_Base_dArray_dlength dtb__13) = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun b -> ((fun qi -> ((fun oi -> ((fun ii -> (((v_Base_dHashMap_d_ulookupAssoc _uctx1) mc0) ((Base_dArray.v_Base_dArray_dget ((Base_dArray.v_Base_dArray_dget dtb__13) oi)) ii))) (bi_natFromInt (b - (qi * 32))))) (bi_natFromInt qi))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v_Base_dHashMap_d_ubucketOf ((Base_dHashable.v_Base_dHashable_dhash _uctx0) mc0))))))

let v_Base_dHashMap_dmember = (fun _uctx0 _uctx1 key t -> (match ((((v_Base_dHashMap_dlookup _uctx0) _uctx1) key) t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_dinsertAll = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (match dtb__15 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__17, dtb__18) -> (((v_Base_dHashMap_dinsertAll _uctx0) dtb__16) ((((v_Base_dHashMap_dinsert _uctx0) dtb__17) dtb__18) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_dfromList = (fun _uctx0 mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (match dtb__19 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__21, dtb__22) -> ((((v_Base_dHashMap_dinsert _uctx0) dtb__21) dtb__22) ((v_Base_dHashMap_dfromList _uctx0) dtb__20))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> [||]
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_dofNames = (fun xs -> (((v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Pair (n, true)))) xs)) ((v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Base_dHashMap_dtoList = (fun _uctx0 mc0 -> (let dtb__23 = mc0 in ((Base_dList.v_Base_dList_dconcatMap (fun outer -> ((Base_dList.v_Base_dList_dconcatMap (fun inner -> ((v_Base_dHashMap_d_udedupBucket _uctx0) inner))) (Base_dArray.v_Base_dArray_dtoList outer)))) (Base_dArray.v_Base_dArray_dtoList dtb__23))))

let v_Show_uBase_uHashMap_uHashMap_uk_uv = (fun _uctx0 _uctx1 _uctx2 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun m -> ("fromList " ^ ((Base_dShow.v_Base_dShow_dshow (Base_dList.v_Show_uBase_uList_uList_ua ((Base_dPair.v_Show_uBase_uPair_uPair_ua_ub _uctx0) _uctx1))) ((v_Base_dHashMap_dtoList _uctx2) m)))))))

let v_Base_dHashMap_dsize = (fun _uctx0 t -> (Base_dList.v_Base_dList_dlength ((v_Base_dHashMap_dtoList _uctx0) t)))
