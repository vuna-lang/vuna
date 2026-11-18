open Vuna_runtime
type t_Base_dEffect_dError_dErrorOp = C_Base_dEffect_dError_dErrorOp_Throw of (string)

# 15 "Base/Effect/Error.vuna"
let v_Base_dEffect_dError_dthrow = (fun n msg -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "error") n) (C_Base_dEffect_dError_dErrorOp_Throw (msg))))

# 19 "Base/Effect/Error.vuna"
let v_Base_dEffect_dError_dhandleError = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "error") n) ret) (Obj.magic opH)) comp))

# 23 "Base/Effect/Error.vuna"
let v_Base_dEffect_dError_derrorRet = (fun a -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (a)))

# 27 "Base/Effect/Error.vuna"
let v_Base_dEffect_dError_derrorOpH = (fun op k -> (match op with
  | C_Base_dEffect_dError_dErrorOp_Throw (dtb__0) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__0))
  | _ -> failwith "DT: impossible branch"
))

# 33 "Base/Effect/Error.vuna"
let v_Base_dEffect_dError_dcatchResult = (fun n fallback res -> (match res with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__1) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__1)
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__2) -> (fallback dtb__2)
  | _ -> failwith "DT: impossible branch"
))

# 40 "Base/Effect/Error.vuna"
let v_Base_dEffect_dError_drunError = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "error") n) v_Base_dEffect_dError_derrorRet) v_Base_dEffect_dError_derrorOpH) comp))

# 44 "Base/Effect/Error.vuna"
let v_Base_dEffect_dError_dcatch = (fun n comp fallback -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_dweaken ((((v_Base_dEffect_dError_dhandleError n) v_Base_dEffect_dError_derrorRet) v_Base_dEffect_dError_derrorOpH) comp))) (fun res -> (((v_Base_dEffect_dError_dcatchResult n) fallback) res))))
