open Vuna_runtime
type 'a0 t_ExnOp = C_ExnOp_ThrowExn of (string) | C_ExnOp_Try of ('a0 B_dEffect_dCore.t_Scoped)

# 20 "Base/Effect/Exn.vuna"
let v_throwExn = (fun (n : string) (msg : string) -> (((((B_dEffect_dCore.v_sendCoreId "exn") n) 547777234) (dtp_effectId n)) (C_ExnOp_ThrowExn (msg))))

# 24 "Base/Effect/Exn.vuna"
let v_tryWith = (fun (n : string) comp -> (((((B_dEffect_dCore.v_sendCoreId "exn") n) 547777234) (dtp_effectId n)) (C_ExnOp_Try ((B_dEffect_dCore.v_scope comp)))))

# 28 "Base/Effect/Exn.vuna"
let v_handleExn = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "exn") n) 547777234) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 32 "Base/Effect/Exn.vuna"
let v_exnOpH = (fun op k -> (match op with
  | C_ExnOp_ThrowExn (dtb__0) -> (B_dData_dResult.C_Result_Err (dtb__0))
  | C_ExnOp_Try (dtb__1) -> ((Obj.magic k) (B_dEffect_dCore.v_handleScoped dtb__1))
  | _ -> failwith "DT: impossible branch"
))

# 39 "Base/Effect/Exn.vuna"
let v_runExn = (fun (n : string) comp -> ((((v_handleExn n) (fun a -> (B_dData_dResult.C_Result_Ok (a)))) v_exnOpH) comp))

# 43 "Base/Effect/Exn.vuna"
let v_catchExn = (fun (n : string) comp fallback -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_tryWith n) comp)) (fun res -> (match res with
  | B_dData_dResult.C_Result_Ok (dtb__2) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__2)
  | B_dData_dResult.C_Result_Err (dtb__3) -> (fallback dtb__3)
  | _ -> failwith "DT: impossible branch"
))))

# 52 "Base/Effect/Exn.vuna"
let v_bracketExn = (fun (n : string) acquire release use -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) acquire) (fun res -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_tryWith n) (use res))) (fun r -> (match r with
  | B_dData_dResult.C_Result_Ok (dtb__4) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (release res)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__4)))
  | B_dData_dResult.C_Result_Err (dtb__5) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (release res)) (fun _u -> ((v_throwExn n) dtb__5)))
  | _ -> failwith "DT: impossible branch"
))))))
