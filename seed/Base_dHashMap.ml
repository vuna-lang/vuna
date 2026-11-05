open Vuna_runtime
type 'a0 t_Base_dHashMap_dHashMap = C_Base_dHashMap_dHashMap_Base_dHashMap_dHashMap of ((((string, 'a0) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList array) array))

let v_Base_dHashMap_dhashStr = (fun s -> (dtp_strHash s))

let rec v_Base_dHashMap_d_ulookupAssoc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> (if (mc0 = dtb__2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3)) else ((v_Base_dHashMap_d_ulookupAssoc mc0) dtb__1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_d_uhasKeyIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match dtb__4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> (if (mc0 = dtb__6) then true else ((v_Base_dHashMap_d_uhasKeyIn mc0) dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_d_udedupGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__8 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (if ((v_Base_dHashMap_d_uhasKeyIn dtb__10) mc1) then ((v_Base_dHashMap_d_udedupGo dtb__9) mc1) else ((v_Base_dHashMap_d_udedupGo dtb__9) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11)), mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_d_udedupBucket = (fun xs -> ((v_Base_dHashMap_d_udedupGo xs) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Base_dHashMap_dinsert = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dHashMap_dHashMap_Base_dHashMap_dHashMap (dtb__12) -> ((fun base -> ((fun b -> ((fun qi -> ((fun oi -> ((fun ii -> ((fun outer -> ((fun inner -> (C_Base_dHashMap_dHashMap_Base_dHashMap_dHashMap ((((Base_dArray.v_Base_dArray_dset base) oi) (((Base_dArray.v_Base_dArray_dset outer) ii) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), inner))))))) ((Base_dArray.v_Base_dArray_dget outer) ii))) ((Base_dArray.v_Base_dArray_dget base) oi))) (bi_natFromInt (b - (qi * 32))))) (bi_natFromInt qi))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v_Base_dHashMap_dhashStr mc0))) (if ((Base_dArray.v_Base_dArray_dlength dtb__12) = 0) then ((Base_dArray.v_Base_dArray_dmake 32) ((Base_dArray.v_Base_dArray_dmake 32) Base_dList.C_Base_dList_dList_Base_dList_dNil)) else dtb__12))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_dlookup = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dHashMap_dHashMap_Base_dHashMap_dHashMap (dtb__13) -> (if ((Base_dArray.v_Base_dArray_dlength dtb__13) = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun b -> ((fun qi -> ((fun oi -> ((fun ii -> ((v_Base_dHashMap_d_ulookupAssoc mc0) ((Base_dArray.v_Base_dArray_dget ((Base_dArray.v_Base_dArray_dget dtb__13) oi)) ii))) (bi_natFromInt (b - (qi * 32))))) (bi_natFromInt qi))) (if 32 = 0 then failwith "division by zero" else b / 32))) (v_Base_dHashMap_dhashStr mc0)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_dmember = (fun key t -> (match ((v_Base_dHashMap_dlookup key) t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__14) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_dinsertAll = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (match dtb__15 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__17, dtb__18) -> ((v_Base_dHashMap_dinsertAll dtb__16) (((v_Base_dHashMap_dinsert dtb__17) dtb__18) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Base_dHashMap_dfromList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__19, dtb__20) -> (match dtb__19 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> (((v_Base_dHashMap_dinsert dtb__21) dtb__22) (v_Base_dHashMap_dfromList dtb__20))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Base_dHashMap_dHashMap_Base_dHashMap_dHashMap ([||]))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_dofNames = (fun xs -> ((v_Base_dHashMap_dinsertAll ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (n, true)))) xs)) (v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Base_dHashMap_dtoList = (fun mc0 -> (match mc0 with
  | C_Base_dHashMap_dHashMap_Base_dHashMap_dHashMap (dtb__23) -> ((Base_dList.v_Base_dList_dconcatMap (fun outer -> ((Base_dList.v_Base_dList_dconcatMap (fun inner -> (v_Base_dHashMap_d_udedupBucket inner))) (Base_dArray.v_Base_dArray_dtoList outer)))) (Base_dArray.v_Base_dArray_dtoList dtb__23))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dHashMap_dsize = (fun t -> (Base_dList.v_Base_dList_dlength (v_Base_dHashMap_dtoList t)))
