open Vuna_runtime
type t_StdinOp = C_StdinOp_ReadLine | C_StdinOp_ReadBytes of (int)

# 22 "Base/Effect/Stdin.vuna"
let v_stdinReadLine = (fun (n : string) -> (((((B_dEffect_dCore.v_sendCoreId "stdin") n) 618336925) (dtp_effectId n)) C_StdinOp_ReadLine))

# 26 "Base/Effect/Stdin.vuna"
let v_stdinReadBytes = (fun (n : string) (k : int) -> (((((B_dEffect_dCore.v_sendCoreId "stdin") n) 618336925) (dtp_effectId n)) (C_StdinOp_ReadBytes (k))))

# 30 "Base/Effect/Stdin.vuna"
let v_handleStdin = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "stdin") n) 618336925) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 34 "Base/Effect/Stdin.vuna"
let v_stdinOpHIO = (fun (op : t_StdinOp) k -> (match op with
  | C_StdinOp_ReadLine -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_readLine ())))) (fun v -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ())))) (fun ok -> (if (ok = 1) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (v))))))))
  | C_StdinOp_ReadBytes (dtb__0) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_readBytes dtio_0)) dtb__0)) (fun v -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ())))) (fun ok -> (if (ok = 1) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (v))))))))
  | _ -> failwith "DT: impossible branch"
))

# 52 "Base/Effect/Stdin.vuna"
let v_stdinOpHIOHost = (fun (op : t_StdinOp) k -> (match op with
  | C_StdinOp_ReadLine -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.v_raise (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_readLine ()))))) (fun v -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.v_raise (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok = 1) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (v))))))))
  | C_StdinOp_ReadBytes (dtb__1) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_readBytes dtio_0)) dtb__1))) (fun v -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.v_raise (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok = 1) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (v))))))))
  | _ -> failwith "DT: impossible branch"
))

# 67 "Base/Effect/Stdin.vuna"
let v_handleStdinHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "stdin") n) 618336925) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))) v_stdinOpHIOHost) comp))

# 72 "Base/Effect/Stdin.vuna"
let v_runStdinHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleStdinHostHost "default") comp)))
