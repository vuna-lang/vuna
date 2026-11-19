open Vuna_runtime
type ('a0, 'a1) t_Base_dEffect_dPure_dState_dState = { f_Base_dEffect_dPure_dState_dState_stateRun : ('a0) -> ('a1, 'a0) Base_dData_dPair.t_Base_dData_dPair_dPair }

# 27 "Base/Effect/Pure/State.vuna"
let v_Functor_uBase_uEffect_uPure_uState_uState_us = (Base_dTrait_dFunctor.C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor (((Obj.magic (fun f st -> { f_Base_dEffect_dPure_dState_dState_stateRun = (fun s -> (match ((st).f_Base_dEffect_dPure_dState_dState_stateRun s) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (f dtb__0); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1 }
  | _ -> failwith "DT: impossible branch"
)) })) : Obj.t)))

# 35 "Base/Effect/Pure/State.vuna"
let v_Monad_uBase_uEffect_uPure_uState_uState_us = (Base_dTrait_dMonad.C_Dict_uBase_dTrait_dMonad_dMonad_Monad (((Obj.magic (fun st k -> { f_Base_dEffect_dPure_dState_dState_stateRun = (fun s -> (match ((st).f_Base_dEffect_dPure_dState_dState_stateRun s) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__3 } -> (((k dtb__2)).f_Base_dEffect_dPure_dState_dState_stateRun dtb__3)
  | _ -> failwith "DT: impossible branch"
)) })) : Obj.t)))

# 43 "Base/Effect/Pure/State.vuna"
let v_Applicative_uBase_uEffect_uPure_uState_uState_us = (Base_dTrait_dApplicative.C_Dict_uBase_dTrait_dApplicative_dApplicative_Applicative (((Obj.magic (fun a -> { f_Base_dEffect_dPure_dState_dState_stateRun = (fun s -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = a; Base_dData_dPair.f_Base_dData_dPair_dPair_second = s }) })) : Obj.t), ((Obj.magic (fun mf mx -> { f_Base_dEffect_dPure_dState_dState_stateRun = (fun s -> (match ((mf).f_Base_dEffect_dPure_dState_dState_stateRun s) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__5 } -> (match ((mx).f_Base_dEffect_dPure_dState_dState_stateRun dtb__5) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__6; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__7 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__4 dtb__6); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__7 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) })) : Obj.t), ((Obj.magic (fun f sa sb -> { f_Base_dEffect_dPure_dState_dState_stateRun = (fun s -> (match ((sa).f_Base_dEffect_dPure_dState_dState_stateRun s) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__8; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__9 } -> (match ((sb).f_Base_dEffect_dPure_dState_dState_stateRun dtb__9) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((f dtb__8) dtb__10); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) })) : Obj.t)))

# 17 "Base/Effect/Pure/State.vuna"
let v_Base_dEffect_dPure_dState_drunState = (fun mc0 mc1 -> (match mc0 with
  | { f_Base_dEffect_dPure_dState_dState_stateRun = dtb__12 } -> (dtb__12 mc1)
  | _ -> failwith "DT: impossible branch"
))

# 21 "Base/Effect/Pure/State.vuna"
let v_Base_dEffect_dPure_dState_devalState = (fun st s -> (Base_dData_dPair.v_Base_dData_dPair_dfirstOf ((v_Base_dEffect_dPure_dState_drunState st) s)))

# 25 "Base/Effect/Pure/State.vuna"
let v_Base_dEffect_dPure_dState_dexecState = (fun st s -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf ((v_Base_dEffect_dPure_dState_drunState st) s)))

# 64 "Base/Effect/Pure/State.vuna"
let v_Base_dEffect_dPure_dState_dget = { f_Base_dEffect_dPure_dState_dState_stateRun = (fun s -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = s; Base_dData_dPair.f_Base_dData_dPair_dPair_second = s }) }

# 68 "Base/Effect/Pure/State.vuna"
let v_Base_dEffect_dPure_dState_dput = (fun s -> { f_Base_dEffect_dPure_dState_dState_stateRun = (fun _u -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = 0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = s }) })

# 72 "Base/Effect/Pure/State.vuna"
let v_Base_dEffect_dPure_dState_dmodify = (fun f -> { f_Base_dEffect_dPure_dState_dState_stateRun = (fun s -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = 0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (f s) }) })
