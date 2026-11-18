open Vuna_runtime
type 'a0 t_Vuna_dCompiler_dBase_dCommon_dEffCheck = 'a0 Base_dEffect_dCore.t_Base_dEffect_dCore_dEff

# 38 "Vuna/Compiler/Base/Common.vuna"
let v_Functor_uVuna_uCompiler_uBase_uCommon_uEffCheck = (Base_dTrait_dFunctor.C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor ((fun f m -> (((Base_dTrait_dFunctor.v_Base_dTrait_dFunctor_dfmap Base_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) f) (let dtb__0 = m in dtb__0)))))

# 41 "Vuna/Compiler/Base/Common.vuna"
let v_Applicative_uVuna_uCompiler_uBase_uCommon_uEffCheck = (Base_dTrait_dApplicative.C_Dict_uBase_dTrait_dApplicative_dApplicative_Applicative ((fun x -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) x)), (fun mf mx -> (((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dap Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (let dtb__1 = mf in dtb__1)) (let dtb__2 = mx in dtb__2))), (fun f ma mb -> ((((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dliftA2 Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) f) (let dtb__3 = ma in dtb__3)) (let dtb__4 = mb in dtb__4)))))

# 46 "Vuna/Compiler/Base/Common.vuna"
let v_Monad_uVuna_uCompiler_uBase_uCommon_uEffCheck = (Base_dTrait_dMonad.C_Dict_uBase_dTrait_dMonad_dMonad_Monad ((fun m k -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (let dtb__5 = m in dtb__5)) (fun x -> (let dtb__6 = (k x) in dtb__6))))))

# 26 "Vuna/Compiler/Base/Common.vuna"
let v_Vuna_dCompiler_dBase_dCommon_dbind = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__7) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__7))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__8) -> (mc1 dtb__8)
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Base/Common.vuna"
let v_Vuna_dCompiler_dBase_dCommon_drunEffCheck = (fun m -> (let dtb__9 = m in dtb__9))

# 51 "Vuna/Compiler/Base/Common.vuna"
let v_Vuna_dCompiler_dBase_dCommon_dstep = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__10) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__10))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__11) -> (match dtb__11 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__12; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__13 } -> ((mc1 dtb__12) dtb__13)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Base/Common.vuna"
let rec v_Vuna_dCompiler_dBase_dCommon_dtraverse = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (match (mc0 dtb__14) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__16) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__16))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__17) -> (match ((v_Vuna_dCompiler_dBase_dCommon_dtraverse mc0) dtb__15) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__18) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__18))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__19) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__17, dtb__19))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
