open Vuna_runtime
type 'a0 t_MutRef = ('a0 ref)

# 19 "Base/Container/MutRef.vuna"
let v_new = (fun x -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((fun x -> ref x) x)))

# 23 "Base/Container/MutRef.vuna"
let v_read = (fun m -> (B_dEffect_dCore.v_raise ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r -> !r) dtio_0)) (let dtb__0 = m in dtb__0))))

# 27 "Base/Container/MutRef.vuna"
let v_write = (fun m v -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun r v -> r := v; 0) dtio_0 dtio_1)) (let dtb__1 = m in dtb__1)) v))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dUnit.C_Unit_MkUnit))))

# 34 "Base/Container/MutRef.vuna"
let v_modify = (fun m f -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_read m)) (fun x -> ((v_write m) (f x)))))

# 41 "Base/Container/MutRef.vuna"
let v_withMutRef = (fun init body -> (B_dEffect_dCore.v_dropEffHead (body ((fun x -> ref x) init))))

# 45 "Base/Container/MutRef.vuna"
let v_withMutRefPure = (fun init body -> (B_dEffect_dCore.v_runPure ((v_withMutRef init) body)))

# 15 "Base/Container/MutRef.vuna"
let v_cell = (fun p -> (let dtb__2 = p in dtb__2))
