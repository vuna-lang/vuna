open Vuna_runtime
type ('a0, 'a1) t_Base_dState_dState = { f_Base_dState_dState_stateRun : ('a0) -> ('a1, 'a0) Base_dPair.t_Base_dPair_dPair }

# 27 "Base/State.vuna"
let v_Functor_uBase_uState_uState_us = (Base_dFunctor.C_Dict_uBase_dFunctor_dFunctor_Functor ((fun f st -> { f_Base_dState_dState_stateRun = (fun s -> (match ((st).f_Base_dState_dState_stateRun s) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__0; Base_dPair.f_Base_dPair_dPair_second = dtb__1 } -> { Base_dPair.f_Base_dPair_dPair_first = (f dtb__0); Base_dPair.f_Base_dPair_dPair_second = dtb__1 }
  | _ -> failwith "DT: impossible branch"
)) })))

# 32 "Base/State.vuna"
let v_Monad_uBase_uState_uState_us = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun st k -> { f_Base_dState_dState_stateRun = (fun s -> (match ((st).f_Base_dState_dState_stateRun s) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 } -> (((k dtb__2)).f_Base_dState_dState_stateRun dtb__3)
  | _ -> failwith "DT: impossible branch"
)) })))

# 37 "Base/State.vuna"
let v_Applicative_uBase_uState_uState_us = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun a -> { f_Base_dState_dState_stateRun = (fun s -> { Base_dPair.f_Base_dPair_dPair_first = a; Base_dPair.f_Base_dPair_dPair_second = s }) }), (fun mf mx -> { f_Base_dState_dState_stateRun = (fun s -> (match ((mf).f_Base_dState_dState_stateRun s) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__4; Base_dPair.f_Base_dPair_dPair_second = dtb__5 } -> (match ((mx).f_Base_dState_dState_stateRun dtb__5) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 } -> { Base_dPair.f_Base_dPair_dPair_first = (dtb__4 dtb__6); Base_dPair.f_Base_dPair_dPair_second = dtb__7 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) }), (fun f sa sb -> { f_Base_dState_dState_stateRun = (fun s -> (match ((sa).f_Base_dState_dState_stateRun s) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> (match ((sb).f_Base_dState_dState_stateRun dtb__9) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> { Base_dPair.f_Base_dPair_dPair_first = ((f dtb__8) dtb__10); Base_dPair.f_Base_dPair_dPair_second = dtb__11 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) })))

# 17 "Base/State.vuna"
let v_Base_dState_drunState = (fun mc0 mc1 -> (match mc0 with
  | { f_Base_dState_dState_stateRun = dtb__12 } -> (dtb__12 mc1)
  | _ -> failwith "DT: impossible branch"
))

# 21 "Base/State.vuna"
let v_Base_dState_devalState = (fun st s -> (Base_dPair.v_Base_dPair_dfirstOf ((v_Base_dState_drunState st) s)))

# 25 "Base/State.vuna"
let v_Base_dState_dexecState = (fun st s -> (Base_dPair.v_Base_dPair_dsecondOf ((v_Base_dState_drunState st) s)))

# 50 "Base/State.vuna"
let v_Base_dState_dget = { f_Base_dState_dState_stateRun = (fun s -> { Base_dPair.f_Base_dPair_dPair_first = s; Base_dPair.f_Base_dPair_dPair_second = s }) }

# 54 "Base/State.vuna"
let v_Base_dState_dput = (fun s -> { f_Base_dState_dState_stateRun = (fun _u -> { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = s }) })

# 58 "Base/State.vuna"
let v_Base_dState_dmodify = (fun f -> { f_Base_dState_dState_stateRun = (fun s -> { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = (f s) }) })
