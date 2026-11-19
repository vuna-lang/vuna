open Vuna_runtime
type 'a0 t_Vuna_dCompiler_dBase_dCommon_dEffCheck = { f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun : 'a0 Base_dEffect_dCore.t_Base_dEffect_dCore_dEff }

# 38 "Vuna/Compiler/Base/Common.vuna"
let v_Functor_uVuna_uCompiler_uBase_uCommon_uEffCheck = (Base_dTrait_dFunctor.C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor (((Obj.magic (fun f m -> { f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun = (((Base_dTrait_dFunctor.v_Base_dTrait_dFunctor_dfmap Base_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) f) (m).f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun) })) : Obj.t)))

# 41 "Vuna/Compiler/Base/Common.vuna"
let v_Applicative_uVuna_uCompiler_uBase_uCommon_uEffCheck = (Base_dTrait_dApplicative.C_Dict_uBase_dTrait_dApplicative_dApplicative_Applicative (((Obj.magic (fun x -> { f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun = ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) x) })) : Obj.t), ((Obj.magic (fun mf mx -> { f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun = (((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dap Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (mf).f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun) (mx).f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun) })) : Obj.t), ((Obj.magic (fun f ma mb -> { f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun = ((((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dliftA2 Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) f) (ma).f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun) (mb).f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun) })) : Obj.t)))

# 46 "Vuna/Compiler/Base/Common.vuna"
let v_Monad_uVuna_uCompiler_uBase_uCommon_uEffCheck = (Base_dTrait_dMonad.C_Dict_uBase_dTrait_dMonad_dMonad_Monad (((Obj.magic (fun m k -> { f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun = (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (m).f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun) (fun x -> ((k x)).f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun)) })) : Obj.t)))

# 26 "Vuna/Compiler/Base/Common.vuna"
let v_Vuna_dCompiler_dBase_dCommon_dbind = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__0) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__0))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1) -> (mc1 dtb__1)
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Common.vuna"
let v_Vuna_dCompiler_dBase_dCommon_drunEffCheck = (fun m -> (m).f_Vuna_dCompiler_dBase_dCommon_dEffCheck_effCheckRun)

# 51 "Vuna/Compiler/Base/Common.vuna"
let v_Vuna_dCompiler_dBase_dCommon_dstep = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__2) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__2))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__3) -> (match dtb__3 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__4; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__5 } -> ((mc1 dtb__4) dtb__5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Base/Common.vuna"
let rec v_Vuna_dCompiler_dBase_dCommon_dtraverse = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (match (mc0 dtb__6) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__8) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__8))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__9) -> (match ((v_Vuna_dCompiler_dBase_dCommon_dtraverse mc0) dtb__7) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__10) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__10))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__11) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__11))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
