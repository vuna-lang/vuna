open Vuna_runtime
type 'a0 t_Vuna_dCompiler_dCommon_dEffCheck = 'a0 Base_dEff.t_Base_dEff_dEff

let v_Functor_uVuna_uCompiler_uCommon_uEffCheck = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_Functor ((fun f m -> (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) f) (let dtb__0 = m in dtb__0)))))

let v_Applicative_uVuna_uCompiler_uCommon_uEffCheck = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun x -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) x)), (fun mf mx -> (((Base_dApplicative.v_Base_dApplicative_dap Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (let dtb__1 = mf in dtb__1)) (let dtb__2 = mx in dtb__2))), (fun f ma mb -> ((((Base_dApplicative.v_Base_dApplicative_dliftA2 Base_dEff.v_Applicative_uBase_uEff_uEff_ur) f) (let dtb__3 = ma in dtb__3)) (let dtb__4 = mb in dtb__4)))))

let v_Monad_uVuna_uCompiler_uCommon_uEffCheck = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun m k -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (let dtb__5 = m in dtb__5)) (fun x -> (let dtb__6 = (k x) in dtb__6))))))

let v_Vuna_dCompiler_dCommon_dbind = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__7) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__7))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__8) -> (mc1 dtb__8)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCommon_drunEffCheck = (fun m -> (let dtb__9 = m in dtb__9))

let v_Vuna_dCompiler_dCommon_dstep = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__10) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__10))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__11) -> (match dtb__11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = dtb__13 } -> ((mc1 dtb__12) dtb__13)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCommon_dtraverse = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match (mc0 dtb__14) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__16) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__16))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__17) -> (match ((v_Vuna_dCompiler_dCommon_dtraverse mc0) dtb__15) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__18) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__18))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__19) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__19))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
