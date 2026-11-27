open Vuna_runtime
type 'a0 t_EffCheck = { f_EffCheck_effCheckRun : 'a0 B_dEffect_dCore.t_Eff }

# 38 "Vuna/Compiler/Base/Common.vuna"
let v_Functor_ua5312def40ac3976_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun f m -> { f_EffCheck_effCheckRun = (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (f (dtb__0 u)))))) f) (m).f_EffCheck_effCheckRun) })) : Obj.t)))

# 41 "Vuna/Compiler/Base/Common.vuna"
let v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun x -> { f_EffCheck_effCheckRun = (let x = x in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) })) : Obj.t), ((Obj.magic (fun mf mx -> { f_EffCheck_effCheckRun = (((fun mf mx -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__1 = Obj.obj (mf) in (let dtb__2 = Obj.obj (mx) in ((dtb__1 u) (dtb__2 u))))))) (mf).f_EffCheck_effCheckRun) (mx).f_EffCheck_effCheckRun) })) : Obj.t), ((Obj.magic (fun f ma mb -> { f_EffCheck_effCheckRun = ((((fun f ma mb -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__3 = Obj.obj (ma) in (let dtb__4 = Obj.obj (mb) in ((f (dtb__3 u)) (dtb__4 u))))))) f) (ma).f_EffCheck_effCheckRun) (mb).f_EffCheck_effCheckRun) })) : Obj.t)))

# 46 "Vuna/Compiler/Base/Common.vuna"
let v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun m k -> { f_EffCheck_effCheckRun = (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__5 = Obj.obj (e) in (let dtb__6 = Obj.obj ((k (dtb__5 u))) in (dtb__6 u)))))) (m).f_EffCheck_effCheckRun) (fun x -> ((k x)).f_EffCheck_effCheckRun)) })) : Obj.t)))

# 26 "Vuna/Compiler/Base/Common.vuna"
let v_bind = (fun mc0 mc1 -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__7) -> (Base_dDiag.C_Check_ErrC (dtb__7))
  | Base_dDiag.C_Check_OkC (dtb__8) -> (mc1 dtb__8)
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Common.vuna"
let v_runEffCheck = (fun m -> (m).f_EffCheck_effCheckRun)

# 51 "Vuna/Compiler/Base/Common.vuna"
let v_step = (fun mc0 mc1 -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__9) -> (Base_dDiag.C_Check_ErrC (dtb__9))
  | Base_dDiag.C_Check_OkC (dtb__10) -> (match dtb__10 with
  | { B_dData_dPair.f_Pair_first = dtb__11; B_dData_dPair.f_Pair_second = dtb__12 } -> ((mc1 dtb__11) dtb__12)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Base/Common.vuna"
let rec v_traverse = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (match (mc0 dtb__13) with
  | Base_dDiag.C_Check_ErrC (dtb__15) -> (Base_dDiag.C_Check_ErrC (dtb__15))
  | Base_dDiag.C_Check_OkC (dtb__16) -> (match ((v_traverse mc0) dtb__14) with
  | Base_dDiag.C_Check_ErrC (dtb__17) -> (Base_dDiag.C_Check_ErrC (dtb__17))
  | Base_dDiag.C_Check_OkC (dtb__18) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__18))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Common.vuna"
let v_effCheckRun = (fun p -> (match p with
  | { f_EffCheck_effCheckRun = dtb__19 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))
