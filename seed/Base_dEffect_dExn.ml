open Vuna_runtime
type 'a0 t_Base_dEffect_dExn_dExnOp = C_Base_dEffect_dExn_dExnOp_ThrowExn of (string) | C_Base_dEffect_dExn_dExnOp_Try of ('a0 Base_dEffect_dCore.t_Base_dEffect_dCore_dScoped)

# 20 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dthrowExn = (fun n msg -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "exn") n) (C_Base_dEffect_dExn_dExnOp_ThrowExn (msg))))

# 24 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dtryWith = (fun n comp -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "exn") n) (C_Base_dEffect_dExn_dExnOp_Try ((Base_dEffect_dCore.v_Base_dEffect_dCore_dscope comp)))))

# 28 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dhandleExn = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "exn") n) ret) (Obj.magic opH)) comp))

# 32 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dexnOpH = (fun op k -> (match op with
  | C_Base_dEffect_dExn_dExnOp_ThrowExn (dtb__0) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__0))
  | C_Base_dEffect_dExn_dExnOp_Try (dtb__1) -> ((Obj.magic k) (Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleScoped dtb__1))
  | _ -> failwith "DT: impossible branch"
))

# 38 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_drunExn = (fun n comp -> ((((v_Base_dEffect_dExn_dhandleExn n) (fun a -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (a)))) v_Base_dEffect_dExn_dexnOpH) comp))

# 42 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dcatchExn = (fun n comp fallback -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Base_dEffect_dExn_dtryWith n) comp)) (fun _x64_vuna_x64_effK_u43_u3_u5_x58_res -> (match _x64_vuna_x64_effK_u43_u3_u5_x58_res with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__2) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__2)
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__3) -> (fallback dtb__3)
  | _ -> failwith "DT: impossible branch"
))))

# 50 "Base/Effect/Exn.vuna"
let v_Base_dEffect_dExn_dbracketExn = (fun n acquire release use -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) acquire) (fun _x64_vuna_x64_effK_u51_u3_u7_x58_res -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Base_dEffect_dExn_dtryWith n) (use _x64_vuna_x64_effK_u51_u3_u7_x58_res))) (fun _x64_vuna_x64_effK_u52_u3_u8_x58_r -> (match _x64_vuna_x64_effK_u52_u3_u8_x58_r with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__4) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (release _x64_vuna_x64_effK_u51_u3_u7_x58_res)) (fun _x64_vuna_x64_effK_u0_u0_u11_x58__u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__4)))
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__5) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (release _x64_vuna_x64_effK_u51_u3_u7_x58_res)) (fun _x64_vuna_x64_effK_u0_u0_u11_x58__u -> ((v_Base_dEffect_dExn_dthrowExn n) dtb__5)))
  | _ -> failwith "DT: impossible branch"
))))))
