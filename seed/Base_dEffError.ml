open Vuna_runtime
type t_Base_dEffError_dErrorOp = C_Base_dEffError_dErrorOp_Throw of (string)

# 15 "Base/EffError.vuna"
let v_Base_dEffError_dthrow = (fun n msg -> (((Base_dEff.v_Base_dEff_dsendCore "error") n) (C_Base_dEffError_dErrorOp_Throw (msg))))

# 19 "Base/EffError.vuna"
let v_Base_dEffError_dhandleError = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "error") n) ret) (Obj.magic opH)) comp))

# 23 "Base/EffError.vuna"
let v_Base_dEffError_derrorRet = (fun a -> (Base_dResult.C_Base_dResult_dResult_Ok (a)))

# 27 "Base/EffError.vuna"
let v_Base_dEffError_derrorOpH = (fun op k -> (match op with
  | C_Base_dEffError_dErrorOp_Throw (dtb__0) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__0))
  | _ -> failwith "DT: impossible branch"
))

# 32 "Base/EffError.vuna"
let v_Base_dEffError_dcatchResult = (fun n fallback res -> (match res with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__1) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) dtb__1)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__2) -> (fallback dtb__2)
  | _ -> failwith "DT: impossible branch"
))

# 38 "Base/EffError.vuna"
let v_Base_dEffError_drunError = (fun n comp -> (((((Base_dEff.v_Base_dEff_dhandleCoreAt "error") n) v_Base_dEffError_derrorRet) v_Base_dEffError_derrorOpH) comp))

# 42 "Base/EffError.vuna"
let v_Base_dEffError_dcatch = (fun n comp fallback -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_dweaken ((((v_Base_dEffError_dhandleError n) v_Base_dEffError_derrorRet) v_Base_dEffError_derrorOpH) comp))) (fun res -> (((v_Base_dEffError_dcatchResult n) fallback) res))))
