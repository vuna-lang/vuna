open Vuna_runtime
type ('a0, 'a1) t_Base_dEffect_dPure_dReader_dReader = { f_Base_dEffect_dPure_dReader_dReader_readerRun : ('a0) -> 'a1 }

# 17 "Base/Effect/Pure/Reader.vuna"
let v_Functor_uBase_uEffect_uPure_uReader_uReader_ue = (Base_dTrait_dFunctor.C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor (((Obj.magic (fun f r -> { f_Base_dEffect_dPure_dReader_dReader_readerRun = (fun e -> (f ((r).f_Base_dEffect_dPure_dReader_dReader_readerRun e))) })) : Obj.t)))

# 20 "Base/Effect/Pure/Reader.vuna"
let v_Monad_uBase_uEffect_uPure_uReader_uReader_ue = (Base_dTrait_dMonad.C_Dict_uBase_dTrait_dMonad_dMonad_Monad (((Obj.magic (fun r k -> { f_Base_dEffect_dPure_dReader_dReader_readerRun = (fun e -> (((k ((r).f_Base_dEffect_dPure_dReader_dReader_readerRun e))).f_Base_dEffect_dPure_dReader_dReader_readerRun e)) })) : Obj.t)))

# 23 "Base/Effect/Pure/Reader.vuna"
let v_Applicative_uBase_uEffect_uPure_uReader_uReader_ue = (Base_dTrait_dApplicative.C_Dict_uBase_dTrait_dApplicative_dApplicative_Applicative (((Obj.magic (fun a -> { f_Base_dEffect_dPure_dReader_dReader_readerRun = (fun e -> a) })) : Obj.t), ((Obj.magic (fun mf mx -> { f_Base_dEffect_dPure_dReader_dReader_readerRun = (fun e -> (((mf).f_Base_dEffect_dPure_dReader_dReader_readerRun e) ((mx).f_Base_dEffect_dPure_dReader_dReader_readerRun e))) })) : Obj.t), ((Obj.magic (fun f ra rb -> { f_Base_dEffect_dPure_dReader_dReader_readerRun = (fun e -> ((f ((ra).f_Base_dEffect_dPure_dReader_dReader_readerRun e)) ((rb).f_Base_dEffect_dPure_dReader_dReader_readerRun e))) })) : Obj.t)))

# 15 "Base/Effect/Pure/Reader.vuna"
let v_Base_dEffect_dPure_dReader_drunReader = (fun mc0 mc1 -> (match mc0 with
  | { f_Base_dEffect_dPure_dReader_dReader_readerRun = dtb__0 } -> (dtb__0 mc1)
  | _ -> failwith "DT: impossible branch"
))

# 30 "Base/Effect/Pure/Reader.vuna"
let v_Base_dEffect_dPure_dReader_dask = { f_Base_dEffect_dPure_dReader_dReader_readerRun = (fun e -> e) }

# 34 "Base/Effect/Pure/Reader.vuna"
let v_Base_dEffect_dPure_dReader_dlocal = (fun f r -> { f_Base_dEffect_dPure_dReader_dReader_readerRun = (fun e -> ((r).f_Base_dEffect_dPure_dReader_dReader_readerRun (f e))) })
