open Vuna_runtime
type t_Base_dEffect_dReader_dReaderOp = C_Base_dEffect_dReader_dReaderOp_Ask

# 17 "Base/Effect/Reader.vuna"
let v_Base_dEffect_dReader_dask = (fun n -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "reader") n) C_Base_dEffect_dReader_dReaderOp_Ask))

# 21 "Base/Effect/Reader.vuna"
let v_Base_dEffect_dReader_dreaderLocalOp = (fun env f op k -> (match op with
  | C_Base_dEffect_dReader_dReaderOp_Ask -> ((Obj.magic k) (f env))
  | _ -> failwith "DT: impossible branch"
))

# 26 "Base/Effect/Reader.vuna"
let v_Base_dEffect_dReader_dlocalWith = (fun n f env comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_dweaken (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "reader") n) (fun a -> a)) ((v_Base_dEffect_dReader_dreaderLocalOp env) f)) comp)))

# 31 "Base/Effect/Reader.vuna"
let v_Base_dEffect_dReader_dlocal = (fun n f comp -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_Base_dEffect_dReader_dask n)) (fun _x64_vuna_x64_effK_u32_u3_u6_x58_env -> ((((v_Base_dEffect_dReader_dlocalWith n) f) _x64_vuna_x64_effK_u32_u3_u6_x58_env) comp))))

# 37 "Base/Effect/Reader.vuna"
let v_Base_dEffect_dReader_dhandleReader = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "reader") n) ret) (Obj.magic opH)) comp))

# 41 "Base/Effect/Reader.vuna"
let v_Base_dEffect_dReader_dhandleReaderLin = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreLin "reader") n) ret) opH) comp))
