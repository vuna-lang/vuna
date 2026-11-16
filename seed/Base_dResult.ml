open Vuna_runtime
type 'a0 t_Base_dResult_dResult = C_Base_dResult_dResult_Ok of ('a0) | C_Base_dResult_dResult_Err of (string)

# 25 "Base/Result.vuna"
let v_Functor_uBase_uResult_uResult = (Base_dFunctor.C_Dict_uBase_dFunctor_dFunctor_Functor ((fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__0) -> (C_Base_dResult_dResult_Err (dtb__0))
  | C_Base_dResult_dResult_Ok (dtb__1) -> (C_Base_dResult_dResult_Ok ((mc0 dtb__1)))
  | _ -> failwith "DT: impossible branch"
))))

# 29 "Base/Result.vuna"
let v_Monad_uBase_uResult_uResult = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__2) -> (C_Base_dResult_dResult_Err (dtb__2))
  | C_Base_dResult_dResult_Ok (dtb__3) -> (mc1 dtb__3)
  | _ -> failwith "DT: impossible branch"
))))

# 33 "Base/Result.vuna"
let v_Applicative_uBase_uResult_uResult = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun _uarity1 -> (C_Base_dResult_dResult_Ok (_uarity1))), (fun mf mx -> (match mf with
  | C_Base_dResult_dResult_Ok (dtb__4) -> (match mx with
  | C_Base_dResult_dResult_Ok (dtb__5) -> (C_Base_dResult_dResult_Ok ((dtb__4 dtb__5)))
  | C_Base_dResult_dResult_Err (dtb__6) -> (C_Base_dResult_dResult_Err (dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Err (dtb__7) -> (C_Base_dResult_dResult_Err (dtb__7))
  | _ -> failwith "DT: impossible branch"
)), (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__8) -> (C_Base_dResult_dResult_Err (dtb__8))
  | C_Base_dResult_dResult_Ok (dtb__9) -> (match mc2 with
  | C_Base_dResult_dResult_Err (dtb__10) -> (C_Base_dResult_dResult_Err (dtb__10))
  | C_Base_dResult_dResult_Ok (dtb__11) -> (C_Base_dResult_dResult_Ok (((mc0 dtb__9) dtb__11)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 71 "Base/Result.vuna"
let v_Show_uBase_uResult_uResult_ua = (fun _uctx0 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__12) -> ("Ok " ^ ((Base_dShow.v_Base_dShow_dshow _uctx0) dtb__12))
  | C_Base_dResult_dResult_Err (dtb__13) -> ("Err " ^ ((Base_dShow.v_Base_dShow_dshow Base_dShow.v_Show_uString) dtb__13))
  | _ -> failwith "DT: impossible branch"
)))))

# 77 "Base/Result.vuna"
let rec v_Eq_uBase_uResult_uResult_ua = (fun _uctx0 -> (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__14) -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__15) -> (dtb__14 = dtb__15)
  | _ -> false
)
  | C_Base_dResult_dResult_Ok (dtb__16) -> (match mc1 with
  | C_Base_dResult_dResult_Ok (dtb__17) -> (((Base_dEq.v_Base_dEq_d_x61__x61_ _uctx0) dtb__16) dtb__17)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun r s -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ (v_Eq_uBase_uResult_uResult_ua _uctx0)) r) s) then false else true)))))

# 83 "Base/Result.vuna"
let v_Hashable_uBase_uResult_uResult_ua = (fun _uctx0 -> (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__18) -> ((Base_dHashable.v_Base_dHashable_dhashCombine 1) ((Base_dHashable.v_Base_dHashable_dhash _uctx0) dtb__18))
  | C_Base_dResult_dResult_Err (dtb__19) -> ((Base_dHashable.v_Base_dHashable_dhashCombine 2) (Base_dHashable.v_Base_dHashable_dhashStr dtb__19))
  | _ -> failwith "DT: impossible branch"
)))))

# 88 "Base/Result.vuna"
let v_Foldable_uBase_uResult_uResult = (Base_dFoldable.C_Dict_uBase_dFoldable_dFoldable_Foldable ((fun f z r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__20) -> ((f dtb__20) z)
  | C_Base_dResult_dResult_Err (dtb__21) -> z
  | _ -> failwith "DT: impossible branch"
))))

# 93 "Base/Result.vuna"
let v_Traversable_uBase_uResult_uResult_uf = (fun _uctx0 -> (Base_dTraversable.C_Dict_uBase_dTraversable_dTraversable_Traversable ((fun fun_ r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__22) -> ((((Base_dApplicative.v_Base_dApplicative_dliftA2 _uctx0) (fun y _u -> (C_Base_dResult_dResult_Ok (y)))) (fun_ dtb__22)) ((Base_dApplicative.v_Base_dApplicative_dpure _uctx0) dtb__22))
  | C_Base_dResult_dResult_Err (dtb__23) -> ((Base_dApplicative.v_Base_dApplicative_dpure _uctx0) (C_Base_dResult_dResult_Err (dtb__23)))
  | _ -> failwith "DT: impossible branch"
)))))

# 46 "Base/Result.vuna"
let rec v_Base_dResult_dtraverse = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (match (mc0 dtb__24) with
  | C_Base_dResult_dResult_Err (dtb__26) -> (C_Base_dResult_dResult_Err (dtb__26))
  | C_Base_dResult_dResult_Ok (dtb__27) -> (match ((v_Base_dResult_dtraverse mc0) dtb__25) with
  | C_Base_dResult_dResult_Err (dtb__28) -> (C_Base_dResult_dResult_Err (dtb__28))
  | C_Base_dResult_dResult_Ok (dtb__29) -> (C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__27, dtb__29))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Base/Result.vuna"
let v_Base_dResult_dstep = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__30) -> (C_Base_dResult_dResult_Err (dtb__30))
  | C_Base_dResult_dResult_Ok (dtb__31) -> (match dtb__31 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__33 } -> ((mc1 dtb__32) dtb__33)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 61 "Base/Result.vuna"
let v_Base_dResult_dmapError = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__34) -> (C_Base_dResult_dResult_Err ((mc0 dtb__34)))
  | C_Base_dResult_dResult_Ok (dtb__35) -> (C_Base_dResult_dResult_Ok (dtb__35))
  | _ -> failwith "DT: impossible branch"
))

# 66 "Base/Result.vuna"
let v_Base_dResult_dwithDefault = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__36) -> mc0
  | C_Base_dResult_dResult_Ok (dtb__37) -> dtb__37
  | _ -> failwith "DT: impossible branch"
))
