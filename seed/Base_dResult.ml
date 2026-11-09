open Vuna_runtime
type 'a0 t_Base_dResult_dResult = C_Base_dResult_dResult_Ok of ('a0) | C_Base_dResult_dResult_Err of (string)

let v_Show_uBase_dResult_dResult_ua = (fun _uctx0 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__0) -> ("Ok " ^ ((Base_dShow.v_Base_dShow_dshow _uctx0) dtb__0))
  | C_Base_dResult_dResult_Err (dtb__1) -> ("Err " ^ ((Base_dShow.v_Base_dShow_dshow Base_dShow.v_Show_uString) dtb__1))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Base_dResult_dtraverse = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (match (mc0 dtb__2) with
  | C_Base_dResult_dResult_Err (dtb__4) -> (C_Base_dResult_dResult_Err (dtb__4))
  | C_Base_dResult_dResult_Ok (dtb__5) -> (match ((v_Base_dResult_dtraverse mc0) dtb__3) with
  | C_Base_dResult_dResult_Err (dtb__6) -> (C_Base_dResult_dResult_Err (dtb__6))
  | C_Base_dResult_dResult_Ok (dtb__7) -> (C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__7))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dandThen = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__8) -> (C_Base_dResult_dResult_Err (dtb__8))
  | C_Base_dResult_dResult_Ok (dtb__9) -> (mc1 dtb__9)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dstep = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__10) -> (C_Base_dResult_dResult_Err (dtb__10))
  | C_Base_dResult_dResult_Ok (dtb__11) -> (match dtb__11 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__12, dtb__13) -> ((mc1 dtb__12) dtb__13)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dmapResult = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__14) -> (C_Base_dResult_dResult_Err (dtb__14))
  | C_Base_dResult_dResult_Ok (dtb__15) -> (C_Base_dResult_dResult_Ok ((mc0 dtb__15)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dmapError = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__16) -> (C_Base_dResult_dResult_Err ((mc0 dtb__16)))
  | C_Base_dResult_dResult_Ok (dtb__17) -> (C_Base_dResult_dResult_Ok (dtb__17))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dwithDefault = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__18) -> mc0
  | C_Base_dResult_dResult_Ok (dtb__19) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))
