open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
type 'a0 t_Base_dResult_dResult = C_Base_dResult_dResult_Base_dResult_dOk of ('a0) | C_Base_dResult_dResult_Base_dResult_dErr of (string)

let rec v_Base_dResult_dtraverse = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match (mc0 dtb__0) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__2) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__2))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__3) -> (match ((v_Base_dResult_dtraverse mc0) dtb__1) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__4) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__4))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__5) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__5))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dResult_dandThen = (fun r -> (fun f -> (match r with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__6) -> (f dtb__6)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__7) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__7))
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dResult_dstep = (fun r -> (fun k -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__8) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__8))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__9) -> (match dtb__9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> ((k dtb__10) dtb__11)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) r)))

let v_Base_dResult_dmapResult = (fun f -> (fun r -> (match r with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__12) -> (C_Base_dResult_dResult_Base_dResult_dOk ((f dtb__12)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__13) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__13))
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dResult_dmapError = (fun f -> (fun r -> (match r with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__14) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__14))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__15) -> (C_Base_dResult_dResult_Base_dResult_dErr ((f dtb__15)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dResult_dwithDefault = (fun d -> (fun r -> (match r with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__16) -> dtb__16
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__17) -> d
  | _ -> failwith "DT: impossible branch"
)))
