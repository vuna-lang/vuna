open Vuna_runtime
type ('a0, 'a1) t_Reader = { f_Reader_readerRun : ('a0) -> 'a1 }

# 17 "Base/Effect/Pure/Reader.vuna"
let v_Functor_uBase_uEffect_uPure_uReader_uReader_ue = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun f r -> { f_Reader_readerRun = (fun e -> (f ((r).f_Reader_readerRun e))) })) : Obj.t)))

# 20 "Base/Effect/Pure/Reader.vuna"
let v_Monad_uBase_uEffect_uPure_uReader_uReader_ue = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun r k -> { f_Reader_readerRun = (fun e -> (((k ((r).f_Reader_readerRun e))).f_Reader_readerRun e)) })) : Obj.t)))

# 23 "Base/Effect/Pure/Reader.vuna"
let v_Applicative_uBase_uEffect_uPure_uReader_uReader_ue = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun a -> { f_Reader_readerRun = (fun e -> a) })) : Obj.t), ((Obj.magic (fun mf mx -> { f_Reader_readerRun = (fun e -> (((mf).f_Reader_readerRun e) ((mx).f_Reader_readerRun e))) })) : Obj.t), ((Obj.magic (fun f ra rb -> { f_Reader_readerRun = (fun e -> ((f ((ra).f_Reader_readerRun e)) ((rb).f_Reader_readerRun e))) })) : Obj.t)))

# 15 "Base/Effect/Pure/Reader.vuna"
let v_runReader = (fun mc0 mc1 -> (match mc0 with
  | { f_Reader_readerRun = dtb__0 } -> (dtb__0 mc1)
  | _ -> failwith "DT: impossible branch"
))

# 30 "Base/Effect/Pure/Reader.vuna"
let v_ask = { f_Reader_readerRun = (fun e -> e) }

# 34 "Base/Effect/Pure/Reader.vuna"
let v_local = (fun f r -> { f_Reader_readerRun = (fun e -> ((r).f_Reader_readerRun (f e))) })
