open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
type 'a0 t_Base_dResult_dResult = C_Base_dResult_dResult_Base_dResult_dOk of ('a0) | C_Base_dResult_dResult_Base_dResult_dErr of (string)

let rec v_Base_dResult_dtraverse = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match (mc0 dtb__0) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__2) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__2))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__3) -> (match ((v_Base_dResult_dtraverse mc0) dtb__1) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__4) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__4))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__5) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__3, dtb__5))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dResult_dandThen = (fun r -> (fun f -> (match r with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__6) -> (f dtb__6)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__7) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__7))
  | _ -> failwith "DT: impossible branch"
)))

let v_Base_dResult_dstep = (fun r -> (fun k -> (match r with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__8) -> (match dtb__8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> ((k dtb__9) dtb__10)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__11) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__11))
  | _ -> failwith "DT: impossible branch"
)))

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
