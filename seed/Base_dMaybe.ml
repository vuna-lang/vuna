open Vuna_runtime
type 'a0 t_Base_dMaybe_dMaybe = C_Base_dMaybe_dMaybe_Nothing | C_Base_dMaybe_dMaybe_Just of ('a0)

let v_Functor_uBase_dMaybe_dMaybe = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_Functor ((fun f m -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> C_Base_dMaybe_dMaybe_Nothing
  | C_Base_dMaybe_dMaybe_Just (dtb__0) -> (C_Base_dMaybe_dMaybe_Just ((f dtb__0)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Monad_uBase_dMaybe_dMaybe = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun m f -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> C_Base_dMaybe_dMaybe_Nothing
  | C_Base_dMaybe_dMaybe_Just (dtb__1) -> (f dtb__1)
  | _ -> failwith "DT: impossible branch"
))))

let v_Applicative_uBase_dMaybe_dMaybe = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun x -> (C_Base_dMaybe_dMaybe_Just (x))), (fun f ma mb -> (match ma with
  | C_Base_dMaybe_dMaybe_Nothing -> C_Base_dMaybe_dMaybe_Nothing
  | C_Base_dMaybe_dMaybe_Just (dtb__2) -> (match mb with
  | C_Base_dMaybe_dMaybe_Nothing -> C_Base_dMaybe_dMaybe_Nothing
  | C_Base_dMaybe_dMaybe_Just (dtb__3) -> (C_Base_dMaybe_dMaybe_Just (((f dtb__2) dtb__3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Show_uBase_dMaybe_dMaybe_ua = (fun _uctx0 -> (Base_dShow.C_Dict_uBase_dShow_dShow_Show ((fun m -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> "Nothing"
  | C_Base_dMaybe_dMaybe_Just (dtb__4) -> ("Just " ^ ((Base_dShow.v_Base_dShow_dshow _uctx0) dtb__4))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Eq_uBase_dMaybe_dMaybe_ua = (fun _uctx0 -> (Base_dEq.C_Dict_uBase_dEq_dEq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Just (dtb__5) -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Just (dtb__6) -> (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__5) dtb__6)
  | _ -> false
)
  | C_Base_dMaybe_dMaybe_Nothing -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun m n -> (if (((Base_dEq.v_Base_dEq_deq (v_Eq_uBase_dMaybe_dMaybe_ua _uctx0)) m) n) then false else true)))))

let rec v_Ord_uBase_dMaybe_dMaybe_ua = (fun _uctx0 -> (Base_dOrd.C_Dict_uBase_dOrd_dOrd_Ord ((fun mc0 mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Just (dtb__7) -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Just (dtb__8) -> (((Base_dOrd.v_Base_dOrd_dlt _uctx0) dtb__7) dtb__8)
  | C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Nothing -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Just (dtb__9) -> true
  | C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun m n -> (if (((Base_dOrd.v_Base_dOrd_dlt (v_Ord_uBase_dMaybe_dMaybe_ua _uctx0)) m) n) then true else (Base_dBool.v_Base_dBool_dnot (((Base_dOrd.v_Base_dOrd_dlt (v_Ord_uBase_dMaybe_dMaybe_ua _uctx0)) n) m)))), (fun m n -> (((Base_dOrd.v_Base_dOrd_dlt (v_Ord_uBase_dMaybe_dMaybe_ua _uctx0)) n) m)), (fun m n -> (((Base_dOrd.v_Base_dOrd_dle (v_Ord_uBase_dMaybe_dMaybe_ua _uctx0)) n) m)))))

let v_Hashable_uBase_dMaybe_dMaybe_ua = (fun _uctx0 -> (Base_dHashable.C_Dict_uBase_dHashable_dHashable_Hashable ((fun m -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> 0
  | C_Base_dMaybe_dMaybe_Just (dtb__10) -> ((Base_dHashable.v_Base_dHashable_dhashCombine 1) ((Base_dHashable.v_Base_dHashable_dhash _uctx0) dtb__10))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Semigroup_uBase_dMaybe_dMaybe_ua = (fun _uctx0 -> (Base_dMonoid.C_Dict_uBase_dMonoid_dSemigroup_Semigroup ((fun m n -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> C_Base_dMaybe_dMaybe_Nothing
  | C_Base_dMaybe_dMaybe_Just (dtb__11) -> (match n with
  | C_Base_dMaybe_dMaybe_Nothing -> C_Base_dMaybe_dMaybe_Nothing
  | C_Base_dMaybe_dMaybe_Just (dtb__12) -> (C_Base_dMaybe_dMaybe_Just ((((Base_dMonoid.v_Base_dMonoid_dmappend _uctx0) dtb__11) dtb__12)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Monoid_uBase_dMaybe_dMaybe_ua = (fun _uctx0 -> (Base_dMonoid.C_Dict_uBase_dMonoid_dMonoid_Monoid ((C_Base_dMaybe_dMaybe_Just ((Base_dMonoid.v_Base_dMonoid_dmempty _uctx0))))))

let v_Foldable_uBase_dMaybe_dMaybe = (Base_dFoldable.C_Dict_uBase_dFoldable_dFoldable_Foldable ((fun f z m -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> z
  | C_Base_dMaybe_dMaybe_Just (dtb__13) -> ((f dtb__13) z)
  | _ -> failwith "DT: impossible branch"
))))

let v_Traversable_uBase_dMaybe_dMaybe_uf = (fun _uctx0 -> (Base_dTraversable.C_Dict_uBase_dTraversable_dTraversable_Traversable ((fun fun_ m -> (match m with
  | C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure _uctx0) C_Base_dMaybe_dMaybe_Nothing)
  | C_Base_dMaybe_dMaybe_Just (dtb__14) -> ((((Base_dApplicative.v_Base_dApplicative_dliftA2 _uctx0) (fun y _u -> (C_Base_dMaybe_dMaybe_Just (y)))) (fun_ dtb__14)) ((Base_dApplicative.v_Base_dApplicative_dpure _uctx0) dtb__14))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Base_dMaybe_dfromMaybe = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Just (dtb__15) -> dtb__15
  | C_Base_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMaybe_disJust = (fun mc0 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Just (dtb__16) -> true
  | C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMaybe_disNothing = (fun mc0 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Just (dtb__17) -> false
  | C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dMaybe_dmaybe = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dMaybe_dMaybe_Just (dtb__18) -> (mc1 dtb__18)
  | C_Base_dMaybe_dMaybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
))
