open Vuna_runtime
type 'a0 t_EffCheck = { f_EffCheck_effCheckRun : 'a0 B_dEffect_dCore.t_Eff }

# 38 "Vuna/Compiler/Base/Common.vuna"
let v_Functor_ua5312def40ac3976_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun f m -> { f_EffCheck_effCheckRun = (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) f) (m).f_EffCheck_effCheckRun) })) : Obj.t)))

# 41 "Vuna/Compiler/Base/Common.vuna"
let v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun x -> { f_EffCheck_effCheckRun = ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) x) })) : Obj.t), ((Obj.magic (fun mf mx -> { f_EffCheck_effCheckRun = (((B_dTrait_dApplicative.v_ap B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (mf).f_EffCheck_effCheckRun) (mx).f_EffCheck_effCheckRun) })) : Obj.t), ((Obj.magic (fun f ma mb -> { f_EffCheck_effCheckRun = ((((B_dTrait_dApplicative.v_liftA2 B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) f) (ma).f_EffCheck_effCheckRun) (mb).f_EffCheck_effCheckRun) })) : Obj.t)))

# 46 "Vuna/Compiler/Base/Common.vuna"
let v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun m k -> { f_EffCheck_effCheckRun = (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (m).f_EffCheck_effCheckRun) (fun x -> ((k x)).f_EffCheck_effCheckRun)) })) : Obj.t)))

# 26 "Vuna/Compiler/Base/Common.vuna"
let v_bind = (fun mc0 mc1 -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__0) -> (Base_dDiag.C_Check_ErrC (dtb__0))
  | Base_dDiag.C_Check_OkC (dtb__1) -> (mc1 dtb__1)
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Common.vuna"
let v_runEffCheck = (fun m -> (m).f_EffCheck_effCheckRun)

# 51 "Vuna/Compiler/Base/Common.vuna"
let v_step = (fun mc0 mc1 -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__2) -> (Base_dDiag.C_Check_ErrC (dtb__2))
  | Base_dDiag.C_Check_OkC (dtb__3) -> (match dtb__3 with
  | { B_dData_dPair.f_Pair_first = dtb__4; B_dData_dPair.f_Pair_second = dtb__5 } -> ((mc1 dtb__4) dtb__5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Base/Common.vuna"
let rec v_traverse = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match (mc0 dtb__6) with
  | Base_dDiag.C_Check_ErrC (dtb__8) -> (Base_dDiag.C_Check_ErrC (dtb__8))
  | Base_dDiag.C_Check_OkC (dtb__9) -> (match ((v_traverse mc0) dtb__7) with
  | Base_dDiag.C_Check_ErrC (dtb__10) -> (Base_dDiag.C_Check_ErrC (dtb__10))
  | Base_dDiag.C_Check_OkC (dtb__11) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__11))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Common.vuna"
let v_effCheckRun = (fun p -> (match p with
  | { f_EffCheck_effCheckRun = dtb__12 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))
