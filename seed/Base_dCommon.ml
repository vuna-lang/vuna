open Vuna_runtime
type 'a0 t_EffCheck = { f_EffCheck_effCheckRun : 'a0 B_dEffect_dCore.t_Eff }

# 38 "Vuna/Compiler/Base/Common.vuna"
let v_Functor_ua5312def40ac3976_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun dtb_u_u3 dtb_u_u4 -> { f_EffCheck_effCheckRun = (((fun dtb_u_u7 dtb_u_u8 -> (Obj.repr ((fun (dtb_u_u9 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u10 = Obj.obj (dtb_u_u8) in (dtb_u_u7 (dtb_u_u10 dtb_u_u9))))))) dtb_u_u3) (dtb_u_u4).f_EffCheck_effCheckRun) })) : Obj.t)))

# 41 "Vuna/Compiler/Base/Common.vuna"
let v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun dtb_u_u12 -> { f_EffCheck_effCheckRun = (let dtb_u_u14 = dtb_u_u12 in (Obj.repr ((fun (dtb_u_u15 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u14)))) })) : Obj.t), ((Obj.magic (fun dtb_u_u18 dtb_u_u19 -> { f_EffCheck_effCheckRun = (((fun dtb_u_u22 dtb_u_u23 -> (Obj.repr ((fun (dtb_u_u24 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u25 = Obj.obj (dtb_u_u22) in (let dtb_u_u26 = Obj.obj (dtb_u_u23) in ((dtb_u_u25 dtb_u_u24) (dtb_u_u26 dtb_u_u24)))))))) (dtb_u_u18).f_EffCheck_effCheckRun) (dtb_u_u19).f_EffCheck_effCheckRun) })) : Obj.t), ((Obj.magic (fun dtb_u_u30 dtb_u_u31 dtb_u_u32 -> { f_EffCheck_effCheckRun = ((((fun dtb_u_u36 dtb_u_u37 dtb_u_u38 -> (Obj.repr ((fun (dtb_u_u39 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u40 = Obj.obj (dtb_u_u37) in (let dtb_u_u41 = Obj.obj (dtb_u_u38) in ((dtb_u_u36 (dtb_u_u40 dtb_u_u39)) (dtb_u_u41 dtb_u_u39)))))))) dtb_u_u30) (dtb_u_u31).f_EffCheck_effCheckRun) (dtb_u_u32).f_EffCheck_effCheckRun) })) : Obj.t)))

# 46 "Vuna/Compiler/Base/Common.vuna"
let v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun dtb_u_u44 dtb_u_u45 -> { f_EffCheck_effCheckRun = (Obj.repr ((fun (dtb_u_u50 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u51 = Obj.obj ((dtb_u_u44).f_EffCheck_effCheckRun) in (let dtb_u_u53 = (dtb_u_u51 dtb_u_u50) in ((Obj.magic ((dtb_u_u45 dtb_u_u53)).f_EffCheck_effCheckRun) dtb_u_u50)))))) })) : Obj.t)))

# 26 "Vuna/Compiler/Base/Common.vuna"
let v_bind = (fun dtb_u_u56 dtb_u_u57 -> (match dtb_u_u56 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u58) -> (Base_dDiag.C_Check_ErrC (dtb_u_u58))
  | Base_dDiag.C_Check_OkC (dtb_u_u59) -> (dtb_u_u57 dtb_u_u59)
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Common.vuna"
let v_runEffCheck = (fun dtb_u_u61 -> (dtb_u_u61).f_EffCheck_effCheckRun)

# 36 "Vuna/Compiler/Base/Common.vuna"
let v_runEffCheck_u_udirect = (fun m _u_ueffTok -> ((Obj.magic (m).f_EffCheck_effCheckRun) _u_ueffTok))

# 51 "Vuna/Compiler/Base/Common.vuna"
let v_step = (fun dtb_u_u65 dtb_u_u66 -> (match dtb_u_u65 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u67) -> (Base_dDiag.C_Check_ErrC (dtb_u_u67))
  | Base_dDiag.C_Check_OkC (dtb_u_u68) -> (match dtb_u_u68 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u69; B_dData_dPair.f_Pair_second = dtb_u_u70 } -> ((dtb_u_u66 dtb_u_u69) dtb_u_u70)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Base/Common.vuna"
let rec v_traverse = (fun dtb_u_u73 dtb_u_u74 -> (match dtb_u_u74 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u75, dtb_u_u76) -> (match (dtb_u_u73 dtb_u_u75) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u77) -> (Base_dDiag.C_Check_ErrC (dtb_u_u77))
  | Base_dDiag.C_Check_OkC (dtb_u_u78) -> (match ((v_traverse dtb_u_u73) dtb_u_u76) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u79) -> (Base_dDiag.C_Check_ErrC (dtb_u_u79))
  | Base_dDiag.C_Check_OkC (dtb_u_u80) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u80))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Common.vuna"
let v_effCheckRun = (fun dtb_u_u82 -> (match dtb_u_u82 with
  | { f_EffCheck_effCheckRun = dtb_u_u83 } -> dtb_u_u83
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Base/Common.vuna"
let v_effCheckRun_u_udirect = (fun p _u_ueffTok -> (match p with
  | { f_EffCheck_effCheckRun = dtb_u_u83 } -> ((Obj.magic dtb_u_u83) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
