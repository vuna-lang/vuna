open Vuna_runtime
type t_ReaderOp = C_ReaderOp_Ask

# 17 "Base/Effect/Reader.vuna"
let v_ask = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "reader") n) 653517270) (dtp_effectId n)) C_ReaderOp_Ask))

# 21 "Base/Effect/Reader.vuna"
let v_readerLocalOp = (fun env f (op : t_ReaderOp) k -> (match op with
  | C_ReaderOp_Ask -> ((Obj.magic k) (f env))
  | _ -> failwith "DT: impossible branch"
))

# 27 "Base/Effect/Reader.vuna"
let v_localWith = (fun (n : string) f env comp -> (B_dEffect_dCore.v_weaken (((((((B_dEffect_dCore.v_handleCoreAtId "reader") n) 653517270) (dtp_effectId n)) (fun a -> a)) ((v_readerLocalOp env) f)) comp)))

# 32 "Base/Effect/Reader.vuna"
let v_local = (fun (n : string) f comp -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_ask n)) (fun env -> ((((v_localWith n) f) env) comp))))

# 39 "Base/Effect/Reader.vuna"
let v_handleReader = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "reader") n) 653517270) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 43 "Base/Effect/Reader.vuna"
let v_handleReaderLin = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreLinId "reader") n) 653517270) (dtp_effectId n)) ret) opH) comp))
