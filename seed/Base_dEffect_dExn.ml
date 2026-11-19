open Vuna_runtime
type 'a0 t_Base_dEffect_dExn_dExnOp = C_Base_dEffect_dExn_dExnOp_ThrowExn of (string) | C_Base_dEffect_dExn_dExnOp_Try of ('a0 Base_dEffect_dCore.t_Base_dEffect_dCore_dScoped)

# 20 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dthrowExn = (fun (n : string) (msg : string) -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "exn") n) 547777234) (dtp_effectId n)) (C_Base_dEffect_dExn_dExnOp_ThrowExn (msg))))

# 24 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dtryWith = (fun (n : string) comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCoreId "exn") n) 547777234) (dtp_effectId n)) (C_Base_dEffect_dExn_dExnOp_Try ((Base_dEffect_dCore.v_Base_dEffect_dCore_dscope comp)))))

# 28 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dhandleExn = (fun (n : string) ret opH comp -> (((((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAtId "exn") n) 547777234) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 32 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dexnOpH = (fun op k -> (match op with
  | C_Base_dEffect_dExn_dExnOp_ThrowExn (dtb__0) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__0))
  | C_Base_dEffect_dExn_dExnOp_Try (dtb__1) -> ((Obj.magic k) (Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleScoped dtb__1))
  | _ -> failwith "DT: impossible branch"
))

# 39 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_drunExn = (fun (n : string) comp -> ((((v_Base_dEffect_dExn_dhandleExn n) (fun a -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (a)))) v_Base_dEffect_dExn_dexnOpH) comp))

# 43 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dcatchExn = (fun (n : string) comp fallback -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Base_dEffect_dExn_dtryWith n) comp)) (fun res -> (match res with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__2) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__2)
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__3) -> (fallback dtb__3)
  | _ -> failwith "DT: impossible branch"
))))

# 52 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dbracketExn = (fun (n : string) acquire release use -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) acquire) (fun res -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Base_dEffect_dExn_dtryWith n) (use res))) (fun r -> (match r with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__4) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (release res)) (fun _u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__4)))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__5) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (release res)) (fun _u -> ((v_Base_dEffect_dExn_dthrowExn n) dtb__5)))
  | _ -> failwith "DT: impossible branch"
))))))
