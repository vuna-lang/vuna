open Vuna_runtime
type 'a0 t_EffCheck = { f_EffCheck_effCheckRun : 'a0 B_dEffect_dCore.t_Eff }

# 38 "Vuna/Compiler/Base/Common.vuna"
let v_Functor_ua5312def40ac3976_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun dtb_u_u3 dtb_u_u4 -> { f_EffCheck_effCheckRun = (((fun dtb_u_u7 dtb_u_u8 -> (Obj.repr ((fun (dtb_u_u9 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u10 = Obj.obj (dtb_u_u8) in (dtb_u_u7 (dtb_u_u10 dtb_u_u9))))))) dtb_u_u3) (dtb_u_u4).f_EffCheck_effCheckRun) })) : Obj.t)))

# 41 "Vuna/Compiler/Base/Common.vuna"
let v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun dtb_u_u12 -> { f_EffCheck_effCheckRun = (let dtb_u_u14 = dtb_u_u12 in (Obj.repr ((fun (dtb_u_u15 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u14)))) })) : Obj.t), ((Obj.magic (fun dtb_u_u18 dtb_u_u19 -> { f_EffCheck_effCheckRun = (((fun dtb_u_u22 dtb_u_u23 -> (Obj.repr ((fun (dtb_u_u24 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u25 = Obj.obj (dtb_u_u22) in (let dtb_u_u26 = Obj.obj (dtb_u_u23) in ((dtb_u_u25 dtb_u_u24) (dtb_u_u26 dtb_u_u24)))))))) (dtb_u_u18).f_EffCheck_effCheckRun) (dtb_u_u19).f_EffCheck_effCheckRun) })) : Obj.t), ((Obj.magic (fun dtb_u_u30 dtb_u_u31 dtb_u_u32 -> { f_EffCheck_effCheckRun = ((((fun dtb_u_u36 dtb_u_u37 dtb_u_u38 -> (Obj.repr ((fun (dtb_u_u39 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u40 = Obj.obj (dtb_u_u37) in (let dtb_u_u41 = Obj.obj (dtb_u_u38) in ((dtb_u_u36 (dtb_u_u40 dtb_u_u39)) (dtb_u_u41 dtb_u_u39)))))))) dtb_u_u30) (dtb_u_u31).f_EffCheck_effCheckRun) (dtb_u_u32).f_EffCheck_effCheckRun) })) : Obj.t)))

# 46 "Vuna/Compiler/Base/Common.vuna"
let v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun dtb_u_u44 dtb_u_u45 -> { f_EffCheck_effCheckRun = (Obj.repr ((fun (dtb_u_u50 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u51 = Obj.obj ((dtb_u_u44).f_EffCheck_effCheckRun) in (let dtb_u_u53 = (dtb_u_u51 dtb_u_u50) in ((Obj.magic ((dtb_u_u45 dtb_u_u53)).f_EffCheck_effCheckRun) dtb_u_u50)))))) })) : Obj.t)))

# 26 "Vuna/Compiler/Base/Common.vuna"
let v_bind = (fun mc0 mc1 -> (match mc0 with
  | Base_dDiag.C_Check_ErrC (dtb__7) -> (Base_dDiag.C_Check_ErrC (dtb__7))
  | Base_dDiag.C_Check_OkC (dtb__8) -> (mc1 dtb__8)
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Common.vuna"
let v_runEffCheck = (fun m -> (m).f_EffCheck_effCheckRun)

# 36 "Vuna/Compiler/Base/Common.vuna"
let v_runEffCheck_u_udirect = (fun m _u_ueffTok -> ((Obj.magic (m).f_EffCheck_effCheckRun) _u_ueffTok))

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

# 32 "Vuna/Compiler/Base/Common.vuna"
let v_effCheckRun_u_udirect = (fun p _u_ueffTok -> (match p with
  | { f_EffCheck_effCheckRun = dtb_u_u83 } -> ((Obj.magic dtb_u_u83) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
