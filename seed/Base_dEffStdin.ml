open Vuna_runtime
type t_Base_dEffStdin_dStdinOp = C_Base_dEffStdin_dStdinOp_ReadLine | C_Base_dEffStdin_dStdinOp_ReadBytes of (int)

# 26 "Base/EffStdin.vuna"
let v_Base_dEffStdin_dstdinReadLine = (fun n -> (((Base_dEff.v_Base_dEff_dsendCore "stdin") n) C_Base_dEffStdin_dStdinOp_ReadLine))

# 30 "Base/EffStdin.vuna"
let v_Base_dEffStdin_dstdinReadBytes = (fun n k -> (((Base_dEff.v_Base_dEff_dsendCore "stdin") n) (C_Base_dEffStdin_dStdinOp_ReadBytes (k))))

# 34 "Base/EffStdin.vuna"
let v_Base_dEffStdin_dhandleStdin = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "stdin") n) ret) (Obj.magic opH)) comp))

# 38 "Base/EffStdin.vuna"
let v_Base_dEffStdin_dstdinOpHIO = (fun op k -> (match op with
  | C_Base_dEffStdin_dStdinOp_ReadLine -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_readLine ())))) (fun v -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_hostStatus ())))) (fun ok -> (if (ok = 1) then ((Obj.magic k) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v))))))))
  | C_Base_dEffStdin_dStdinOp_ReadBytes (dtb__0) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readBytes dtio_0)) dtb__0)) (fun v -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_hostStatus ())))) (fun ok -> (if (ok = 1) then ((Obj.magic k) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v))))))))
  | _ -> failwith "DT: impossible branch"
))

# 53 "Base/EffStdin.vuna"
let v_Base_dEffStdin_dstdinOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffStdin_dStdinOp_ReadLine -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_readLine ())))) (fun v -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok = 1) then ((Obj.magic k) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v))))))))
  | C_Base_dEffStdin_dStdinOp_ReadBytes (dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readBytes dtio_0)) dtb__1)) (fun v -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_hostStatus ()))))) (fun ok -> (if (ok = 1) then ((Obj.magic k) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v))))))))
  | _ -> failwith "DT: impossible branch"
))

# 64 "Base/EffStdin.vuna"
let v_Base_dEffStdin_dhandleStdinHostHost = (fun n comp -> ((((v_Base_dEffStdin_dhandleStdin n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffStdin_dstdinOpHIOHost) comp))

# 67 "Base/EffStdin.vuna"
let v_Base_dEffStdin_drunStdinHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffStdin_dhandleStdinHostHost "default") comp)))
