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

let v_Applicative_uBase_uResult_uResult = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun _uarity1 -> (C_Base_dResult_dResult_Ok (_uarity1))), (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__4) -> (match mc2 with
  | C_Base_dResult_dResult_Err (dtb__5) -> (C_Base_dResult_dResult_Err (dtb__5))
  | _ -> (C_Base_dResult_dResult_Err (dtb__4))
)
  | C_Base_dResult_dResult_Ok (dtb__6) -> (match mc2 with
  | C_Base_dResult_dResult_Err (dtb__7) -> (C_Base_dResult_dResult_Err (dtb__7))
  | C_Base_dResult_dResult_Ok (dtb__8) -> (C_Base_dResult_dResult_Ok (((mc0 dtb__6) dtb__8)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Show_uBase_uResult_uResult_ua = (fun _uctx0 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__9) -> ("Ok " ^ ((Base_dShow.v_Base_dShow_dshow _uctx0) dtb__9))
  | C_Base_dResult_dResult_Err (dtb__10) -> ("Err " ^ ((Base_dShow.v_Base_dShow_dshow Base_dShow.v_Show_uString) dtb__10))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Eq_uBase_uResult_uResult_ua = (fun _uctx0 -> (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__11) -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__12) -> (dtb__11 = dtb__12)
  | _ -> false
)
  | C_Base_dResult_dResult_Ok (dtb__13) -> (match mc1 with
  | C_Base_dResult_dResult_Ok (dtb__14) -> (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__13) dtb__14)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun r s -> (if (((Base_dEq.v_Base_dEq_deq (v_Eq_uBase_uResult_uResult_ua _uctx0)) r) s) then false else true)))))

let v_Hashable_uBase_uResult_uResult_ua = (fun _uctx0 -> (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__15) -> ((Base_dHashable.v_Base_dHashable_dhashCombine 1) ((Base_dHashable.v_Base_dHashable_dhash _uctx0) dtb__15))
  | C_Base_dResult_dResult_Err (dtb__16) -> ((Base_dHashable.v_Base_dHashable_dhashCombine 2) (Base_dHashable.v_Base_dHashable_dhashStr dtb__16))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Foldable_uBase_uResult_uResult = (Base_dFoldable.C_Dict_uBase_dFoldable_dFoldable_Foldable ((fun f z r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__17) -> ((f dtb__17) z)
  | C_Base_dResult_dResult_Err (dtb__18) -> z
  | _ -> failwith "DT: impossible branch"
))))

let v_Traversable_uBase_uResult_uResult_uf = (fun _uctx0 -> (Base_dTraversable.C_Dict_uBase_dTraversable_dTraversable_Traversable ((fun fun_ r -> (match r with
  | C_Base_dResult_dResult_Ok (dtb__19) -> ((((Base_dApplicative.v_Base_dApplicative_dliftA2 _uctx0) (fun y _u -> (C_Base_dResult_dResult_Ok (y)))) (fun_ dtb__19)) ((Base_dApplicative.v_Base_dApplicative_dpure _uctx0) dtb__19))
  | C_Base_dResult_dResult_Err (dtb__20) -> ((Base_dApplicative.v_Base_dApplicative_dpure _uctx0) (C_Base_dResult_dResult_Err (dtb__20)))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Base_dResult_dtraverse = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22) -> (match (mc0 dtb__21) with
  | C_Base_dResult_dResult_Err (dtb__23) -> (C_Base_dResult_dResult_Err (dtb__23))
  | C_Base_dResult_dResult_Ok (dtb__24) -> (match ((v_Base_dResult_dtraverse mc0) dtb__22) with
  | C_Base_dResult_dResult_Err (dtb__25) -> (C_Base_dResult_dResult_Err (dtb__25))
  | C_Base_dResult_dResult_Ok (dtb__26) -> (C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__26))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dstep = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dResult_dResult_Err (dtb__27) -> (C_Base_dResult_dResult_Err (dtb__27))
  | C_Base_dResult_dResult_Ok (dtb__28) -> (match dtb__28 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__29, dtb__30) -> ((mc1 dtb__29) dtb__30)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dmapError = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__31) -> (C_Base_dResult_dResult_Err ((mc0 dtb__31)))
  | C_Base_dResult_dResult_Ok (dtb__32) -> (C_Base_dResult_dResult_Ok (dtb__32))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dResult_dwithDefault = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dResult_dResult_Err (dtb__33) -> mc0
  | C_Base_dResult_dResult_Ok (dtb__34) -> dtb__34
  | _ -> failwith "DT: impossible branch"
))
