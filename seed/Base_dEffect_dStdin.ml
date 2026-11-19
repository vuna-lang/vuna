open Vuna_runtime
type t_Base_dEffect_dStdin_dStdinOp = C_Base_dEffect_dStdin_dStdinOp_ReadLine | C_Base_dEffect_dStdin_dStdinOp_ReadBytes of (int)

# 22 "Base/Effect/Stdin.vuna"
let v_Base_dEffect_dStdin_dstdinReadLine = (fun (n : string) -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "stdin") n) C_Base_dEffect_dStdin_dStdinOp_ReadLine))

# 26 "Base/Effect/Stdin.vuna"
let v_Base_dEffect_dStdin_dstdinReadBytes = (fun (n : string) (k : int) -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "stdin") n) (C_Base_dEffect_dStdin_dStdinOp_ReadBytes (k))))

# 30 "Base/Effect/Stdin.vuna"
let v_Base_dEffect_dStdin_dhandleStdin = (fun (n : string) ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "stdin") n) ret) (Obj.magic opH)) comp))

# 34 "Base/Effect/Stdin.vuna"
let v_Base_dEffect_dStdin_dstdinOpHIO = (fun (op : t_Base_dEffect_dStdin_dStdinOp) k -> (match op with
  | C_Base_dEffect_dStdin_dStdinOp_ReadLine -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_readLine ())))) (fun v -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_hostStatus ())))) (fun ok -> (if (ok = 1) then ((Obj.magic k) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v))))))))
  | C_Base_dEffect_dStdin_dStdinOp_ReadBytes (dtb__0) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_readBytes dtio_0)) dtb__0)) (fun v -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_hostStatus ())))) (fun ok -> (if (ok = 1) then ((Obj.magic k) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v))))))))
  | _ -> failwith "DT: impossible branch"
))

# 52 "Base/Effect/Stdin.vuna"
let v_Base_dEffect_dStdin_dstdinOpHIOHost = (fun (op : t_Base_dEffect_dStdin_dStdinOp) k -> (match op with
  | C_Base_dEffect_dStdin_dStdinOp_ReadLine -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_readLine ()))))) (fun v -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok = 1) then ((Obj.magic k) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v))))))))
  | C_Base_dEffect_dStdin_dStdinOp_ReadBytes (dtb__1) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_readBytes dtio_0)) dtb__1))) (fun v -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok = 1) then ((Obj.magic k) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v))))))))
  | _ -> failwith "DT: impossible branch"
))

# 67 "Base/Effect/Stdin.vuna"
let v_Base_dEffect_dStdin_dhandleStdinHostHost = (fun (n : string) comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "stdin") n) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_Base_dEffect_dStdin_dstdinOpHIOHost) comp))

# 72 "Base/Effect/Stdin.vuna"
let v_Base_dEffect_dStdin_drunStdinHost = (fun comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_djoinEff ((v_Base_dEffect_dStdin_dhandleStdinHostHost "default") comp)))
