open Vuna_runtime
type 'a0 t_Base_dResult_dResult = C_Base_dResult_dResult_Ok of ('a0) | C_Base_dResult_dResult_Err of (string)

let v_Functor_uBase_uResult_uResult = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_Functor ((fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__0) -> (C_Base_dResult_dResult_Err (dtb__0))
  | C_Base_dResult_dResult_Ok (dtb__1) -> (C_Base_dResult_dResult_Ok ((mc0 dtb__1)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Monad_uBase_uResult_uResult = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__2) -> (C_Base_dResult_dResult_Err (dtb__2))
  | C_Base_dResult_dResult_Ok (dtb__3) -> (mc1 dtb__3)
  | _ -> failwith "DT: impossible branch"
))))

let v_Applicative_uBase_uResult_uResult = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun _uarity1 -> (C_Base_dResult_dResult_Ok (_uarity1))), (fun mf mx -> (match mf with
  | C_Base_dResult_dResult_Ok (dtb__4) -> (match mx with
  | C_Base_dResult_dResult_Ok (dtb__5) -> (C_Base_dResult_dResult_Ok ((dtb__4 dtb__5)))
  | C_Base_dResult_dResult_Err (dtb__6) -> (C_Base_dResult_dResult_Err (dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Err (dtb__7) -> (C_Base_dResult_dResult_Err (dtb__7))
  | _ -> failwith "DT: impossible branch"
)), (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__8) -> (match mc2 with
  | C_Base_dResult_dResult_Err (dtb__9) -> (C_Base_dResult_dResult_Err (dtb__9))
  | _ -> (C_Base_dResult_dResult_Err (dtb__8))
)
  | C_Base_dResult_dResult_Ok (dtb__10) -> (match mc2 with
  | C_Base_dResult_dResult_Err (dtb__11) -> (C_Base_dResult_dResult_Err (dtb__11))
  | C_Base_dResult_dResult_Ok (dtb__12) -> (C_Base_dResult_dResult_Ok (((mc0 dtb__10) dtb__12)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Show_uBase_uResult_uResult_ua = (fun _uctx0 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__13) -> ("Ok " ^ ((Base_dShow.v_Base_dShow_dshow _uctx0) dtb__13))
  | C_Base_dResult_dResult_Err (dtb__14) -> ("Err " ^ ((Base_dShow.v_Base_dShow_dshow Base_dShow.v_Show_uString) dtb__14))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Eq_uBase_uResult_uResult_ua = (fun _uctx0 -> (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__15) -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__16) -> (dtb__15 = dtb__16)
  | _ -> false
)
  | C_Base_dResult_dResult_Ok (dtb__17) -> (match mc1 with
  | C_Base_dResult_dResult_Ok (dtb__18) -> (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__17) dtb__18)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun r s -> (if (((Base_dEq.v_Base_dEq_deq (v_Eq_uBase_uResult_uResult_ua _uctx0)) r) s) then false else true)))))

let v_Hashable_uBase_uResult_uResult_ua = (fun _uctx0 -> (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__19) -> ((Base_dHashable.v_Base_dHashable_dhashCombine 1) ((Base_dHashable.v_Base_dHashable_dhash _uctx0) dtb__19))
  | C_Base_dResult_dResult_Err (dtb__20) -> ((Base_dHashable.v_Base_dHashable_dhashCombine 2) (Base_dHashable.v_Base_dHashable_dhashStr dtb__20))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Foldable_uBase_uResult_uResult = (Base_dFoldable.C_Dict_uBase_dFoldable_dFoldable_Foldable ((fun f z r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__21) -> ((f dtb__21) z)
  | C_Base_dResult_dResult_Err (dtb__22) -> z
  | _ -> failwith "DT: impossible branch"
))))

let v_Traversable_uBase_uResult_uResult_uf = (fun _uctx0 -> (Base_dTraversable.C_Dict_uBase_dTraversable_dTraversable_Traversable ((fun fun_ r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__23) -> ((((Base_dApplicative.v_Base_dApplicative_dliftA2 _uctx0) (fun y _u -> (C_Base_dResult_dResult_Ok (y)))) (fun_ dtb__23)) ((Base_dApplicative.v_Base_dApplicative_dpure _uctx0) dtb__23))
  | C_Base_dResult_dResult_Err (dtb__24) -> ((Base_dApplicative.v_Base_dApplicative_dpure _uctx0) (C_Base_dResult_dResult_Err (dtb__24)))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Base_dResult_dtraverse = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match (mc0 dtb__25) with
  | C_Base_dResult_dResult_Err (dtb__27) -> (C_Base_dResult_dResult_Err (dtb__27))
  | C_Base_dResult_dResult_Ok (dtb__28) -> (match ((v_Base_dResult_dtraverse mc0) dtb__26) with
  | C_Base_dResult_dResult_Err (dtb__29) -> (C_Base_dResult_dResult_Err (dtb__29))
  | C_Base_dResult_dResult_Ok (dtb__30) -> (C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__30))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dstep = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__31) -> (C_Base_dResult_dResult_Err (dtb__31))
  | C_Base_dResult_dResult_Ok (dtb__32) -> (match dtb__32 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__33, dtb__34) -> ((mc1 dtb__33) dtb__34)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dmapError = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__35) -> (C_Base_dResult_dResult_Err ((mc0 dtb__35)))
  | C_Base_dResult_dResult_Ok (dtb__36) -> (C_Base_dResult_dResult_Ok (dtb__36))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dwithDefault = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__37) -> mc0
  | C_Base_dResult_dResult_Ok (dtb__38) -> dtb__38
  | _ -> failwith "DT: impossible branch"
))
