open Vuna_runtime
type t_Base_dEffect_dExit_dExitOp = C_Base_dEffect_dExit_dExitOp_ExitWith of (int)

# 14 "Base/Effect/Exit.vuna"
let v_Base_dEffect_dExit_dexitWith = (fun n code -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "exit") n) (C_Base_dEffect_dExit_dExitOp_ExitWith (code))))

# 18 "Base/Effect/Exit.vuna"
let v_Base_dEffect_dExit_dhandleExit = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "exit") n) ret) (Obj.magic opH)) comp))

# 22 "Base/Effect/Exit.vuna"
let v_Base_dEffect_dExit_dexitOpHIO = (fun op k -> (match op with
  | C_Base_dEffect_dExit_dExitOp_ExitWith (dtb__0) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_exit dtio_0)) dtb__0)) (fun _x64_vuna_x64_effK_u0_u0_u6_x58__u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 34 "Base/Effect/Exit.vuna"
let v_Base_dEffect_dExit_dexitOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffect_dExit_dExitOp_ExitWith (dtb__1) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_exit dtio_0)) dtb__1))) (fun _x64_vuna_x64_effK_u0_u0_u6_x58__u -> ((Obj.magic k) 0)))
  | _ -> failwith "DT: impossible branch"
))

# 43 "Base/Effect/Exit.vuna"
let v_Base_dEffect_dExit_dhandleExitHostHost = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "exit") n) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_Base_dEffect_dExit_dexitOpHIOHost) comp))

# 47 "Base/Effect/Exit.vuna"
let v_Base_dEffect_dExit_drunExitHost = (fun comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_djoinEff ((v_Base_dEffect_dExit_dhandleExitHostHost "default") comp)))
