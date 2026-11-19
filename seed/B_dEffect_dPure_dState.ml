open Vuna_runtime
type ('a0, 'a1) t_State = { f_State_stateRun : ('a0) -> ('a1, 'a0) B_dData_dPair.t_Pair }

# 27 "Base/Effect/Pure/State.vuna"
let v_Functor_uBase_uEffect_uPure_uState_uState_us = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun f st -> { f_State_stateRun = (fun s -> (match ((st).f_State_stateRun s) with
  | { B_dData_dPair.f_Pair_first = dtb__0; B_dData_dPair.f_Pair_second = dtb__1 } -> { B_dData_dPair.f_Pair_first = (f dtb__0); B_dData_dPair.f_Pair_second = dtb__1 }
  | _ -> failwith "DT: impossible branch"
)) })) : Obj.t)))

# 35 "Base/Effect/Pure/State.vuna"
let v_Monad_uBase_uEffect_uPure_uState_uState_us = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun st k -> { f_State_stateRun = (fun s -> (match ((st).f_State_stateRun s) with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> (((k dtb__2)).f_State_stateRun dtb__3)
  | _ -> failwith "DT: impossible branch"
)) })) : Obj.t)))

# 43 "Base/Effect/Pure/State.vuna"
let v_Applicative_uBase_uEffect_uPure_uState_uState_us = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun a -> { f_State_stateRun = (fun s -> { B_dData_dPair.f_Pair_first = a; B_dData_dPair.f_Pair_second = s }) })) : Obj.t), ((Obj.magic (fun mf mx -> { f_State_stateRun = (fun s -> (match ((mf).f_State_stateRun s) with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> (match ((mx).f_State_stateRun dtb__5) with
  | { B_dData_dPair.f_Pair_first = dtb__6; B_dData_dPair.f_Pair_second = dtb__7 } -> { B_dData_dPair.f_Pair_first = (dtb__4 dtb__6); B_dData_dPair.f_Pair_second = dtb__7 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) })) : Obj.t), ((Obj.magic (fun f sa sb -> { f_State_stateRun = (fun s -> (match ((sa).f_State_stateRun s) with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (match ((sb).f_State_stateRun dtb__9) with
  | { B_dData_dPair.f_Pair_first = dtb__10; B_dData_dPair.f_Pair_second = dtb__11 } -> { B_dData_dPair.f_Pair_first = ((f dtb__8) dtb__10); B_dData_dPair.f_Pair_second = dtb__11 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) })) : Obj.t)))

# 17 "Base/Effect/Pure/State.vuna"
let v_runState = (fun mc0 mc1 -> (match mc0 with
  | { f_State_stateRun = dtb__12 } -> (dtb__12 mc1)
  | _ -> failwith "DT: impossible branch"
))

# 21 "Base/Effect/Pure/State.vuna"
let v_evalState = (fun st s -> (B_dData_dPair.v_firstOf ((v_runState st) s)))

# 25 "Base/Effect/Pure/State.vuna"
let v_execState = (fun st s -> (B_dData_dPair.v_secondOf ((v_runState st) s)))

# 64 "Base/Effect/Pure/State.vuna"
let v_get = { f_State_stateRun = (fun s -> { B_dData_dPair.f_Pair_first = s; B_dData_dPair.f_Pair_second = s }) }

# 68 "Base/Effect/Pure/State.vuna"
let v_put = (fun s -> { f_State_stateRun = (fun _u -> { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = s }) })

# 72 "Base/Effect/Pure/State.vuna"
let v_modify = (fun f -> { f_State_stateRun = (fun s -> { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (f s) }) })
