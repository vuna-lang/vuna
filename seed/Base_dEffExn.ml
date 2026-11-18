open Vuna_runtime
type 'a0 t_Base_dEffExn_dExnOp = C_Base_dEffExn_dExnOp_ThrowExn of (string) | C_Base_dEffExn_dExnOp_Try of ('a0 Base_dEff.t_Base_dEff_dScoped)

# 20 "Base/EffExn.vuna"
let v_Base_dEffExn_dthrowExn = (fun n msg -> (((Base_dEff.v_Base_dEff_dsendCore "exn") n) (C_Base_dEffExn_dExnOp_ThrowExn (msg))))

# 24 "Base/EffExn.vuna"
let v_Base_dEffExn_dtryWith = (fun n comp -> (((Base_dEff.v_Base_dEff_dsendCore "exn") n) (C_Base_dEffExn_dExnOp_Try ((Base_dEff.v_Base_dEff_dscope comp)))))

# 28 "Base/EffExn.vuna"
let v_Base_dEffExn_dhandleExn = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCoreAt "exn") n) ret) (Obj.magic opH)) comp))

# 32 "Base/EffExn.vuna"
let v_Base_dEffExn_dexnOpH = (fun op k -> (match op with
  | C_Base_dEffExn_dExnOp_ThrowExn (dtb__0) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__0))
  | C_Base_dEffExn_dExnOp_Try (dtb__1) -> ((Obj.magic k) (Base_dEff.v_Base_dEff_dhandleScoped dtb__1))
  | _ -> failwith "DT: impossible branch"
))

# 38 "Base/EffExn.vuna"
let v_Base_dEffExn_drunExn = (fun n comp -> ((((v_Base_dEffExn_dhandleExn n) (fun a -> (Base_dResult.C_Base_dResult_dResult_Ok (a)))) v_Base_dEffExn_dexnOpH) comp))

# 42 "Base/EffExn.vuna"
let v_Base_dEffExn_dcatchExn = (fun n comp fallback -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Base_dEffExn_dtryWith n) comp)) (fun res -> (match res with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__2) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) dtb__2)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__3) -> (fallback dtb__3)
  | _ -> failwith "DT: impossible branch"
))))

# 50 "Base/EffExn.vuna"
let v_Base_dEffExn_dbracketExn = (fun n acquire release use -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) acquire) (fun res -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Base_dEffExn_dtryWith n) (use res))) (fun r -> (match r with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__4) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (release res)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) dtb__4)))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__5) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (release res)) (fun _u -> ((v_Base_dEffExn_dthrowExn n) dtb__5)))
  | _ -> failwith "DT: impossible branch"
))))))
