open Vuna_runtime
type t_ErrorOp = C_ErrorOp_Throw of (string)

# 15 "Base/Effect/Error.vuna"
let v_throw = (fun (n : string) (msg : string) -> (((((B_dEffect_dCore.v_sendCoreId "error") n) 563185489) (dtp_effectId n)) (C_ErrorOp_Throw (msg))))

# 19 "Base/Effect/Error.vuna"
let v_handleError = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "error") n) 563185489) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 23 "Base/Effect/Error.vuna"
let v_errorRet = (fun a -> (B_dData_dResult.C_Result_Ok (a)))

# 27 "Base/Effect/Error.vuna"
let v_errorOpH = (fun (op : t_ErrorOp) k -> (match op with
  | C_ErrorOp_Throw (dtb__0) -> (B_dData_dResult.C_Result_Err (dtb__0))
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Effect/Error.vuna"
let v_catchResult = (fun (n : string) fallback res -> (match res with
  | B_dData_dResult.C_Result_Ok (dtb__1) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__1)
  | B_dData_dResult.C_Result_Err (dtb__2) -> (fallback dtb__2)
  | _ -> failwith "DT: impossible branch"
))

# 40 "Base/Effect/Error.vuna"
let v_runError = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "error") n) 563185489) (dtp_effectId n)) v_errorRet) v_errorOpH) comp))

# 44 "Base/Effect/Error.vuna"
let v_catch = (fun (n : string) comp fallback -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_weaken ((((v_handleError n) v_errorRet) v_errorOpH) comp))) (fun res -> (((v_catchResult n) fallback) res))))
