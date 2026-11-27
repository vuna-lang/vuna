open Vuna_runtime
type 'a0 t_Maybe = C_Maybe_Nothing | C_Maybe_Just of ('a0)

# 43 "Base/Data/Maybe.vuna"
let v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun f m -> (match m with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb__0) -> (C_Maybe_Just ((f dtb__0)))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 49 "Base/Data/Maybe.vuna"
let v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun m f -> (match m with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb__1) -> (f dtb__1)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 55 "Base/Data/Maybe.vuna"
let v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun x -> (C_Maybe_Just (x)))) : Obj.t), ((Obj.magic (fun mf mx -> (match mf with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb__2) -> (match mx with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb__3) -> (C_Maybe_Just ((dtb__2 dtb__3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t), ((Obj.magic (fun f ma mb -> (match ma with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb__4) -> (match mb with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb__5) -> (C_Maybe_Just (((f dtb__4) dtb__5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 75 "Base/Data/Maybe.vuna"
let v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun _uctx0 -> (B_dTrait_dShow.C_Show_Show ((fun m -> (match m with
  | C_Maybe_Nothing -> "Nothing"
  | C_Maybe_Just (dtb__6) -> ("Just " ^ ((B_dTrait_dShow.v_show _uctx0) dtb__6))
  | _ -> failwith "DT: impossible branch"
)))))

# 82 "Base/Data/Maybe.vuna"
let rec v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun _uctx0 -> (B_dTrait_dEq.C_Eq_Eq ((fun mc0 mc1 -> (match mc0 with
  | C_Maybe_Just (dtb__7) -> (match mc1 with
  | C_Maybe_Just (dtb__8) -> (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__7) dtb__8)
  | _ -> false
)
  | C_Maybe_Nothing -> (match mc1 with
  | C_Maybe_Nothing -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)), (fun m n -> (if (((B_dTrait_dEq.v__x61__x61_ (v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua _uctx0)) m) n) then false else true)))))

# 89 "Base/Data/Maybe.vuna"
let rec v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun _uctx0 -> (B_dTrait_dOrd.C_Ord_Ord ((fun mc0 mc1 -> (match mc0 with
  | C_Maybe_Just (dtb__9) -> (match mc1 with
  | C_Maybe_Just (dtb__10) -> (((B_dTrait_dOrd.v__x60_ _uctx0) dtb__9) dtb__10)
  | C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_Maybe_Nothing -> (match mc1 with
  | C_Maybe_Just (dtb__11) -> true
  | C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)), (fun m n -> (if (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua _uctx0)) m) n) then true else (B_dData_dBool.v_not (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua _uctx0)) n) m)))), (fun m n -> (((B_dTrait_dOrd.v__x60_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua _uctx0)) n) m)), (fun m n -> (((B_dTrait_dOrd.v__x60__x61_ (v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua _uctx0)) n) m)))))

# 98 "Base/Data/Maybe.vuna"
let v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun _uctx0 -> (B_dTrait_dHashable.C_Hashable_Hashable ((fun m -> (match m with
  | C_Maybe_Nothing -> 0
  | C_Maybe_Just (dtb__12) -> ((B_dTrait_dHashable.v_hashCombine 1) ((B_dTrait_dHashable.v_hash _uctx0) dtb__12))
  | _ -> failwith "DT: impossible branch"
)))))

# 104 "Base/Data/Maybe.vuna"
let v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun _uctx0 -> (B_dTrait_dMonoid.C_Semigroup_Semigroup ((fun m n -> (match m with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb__13) -> (match n with
  | C_Maybe_Nothing -> C_Maybe_Nothing
  | C_Maybe_Just (dtb__14) -> (C_Maybe_Just ((((B_dTrait_dMonoid.v_mappend _uctx0) dtb__13) dtb__14)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 113 "Base/Data/Maybe.vuna"
let v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua = (fun _uctx0 -> (B_dTrait_dMonoid.C_Monoid_Monoid ((C_Maybe_Just ((B_dTrait_dMonoid.v_mempty _uctx0))))))

# 116 "Base/Data/Maybe.vuna"
let v_Foldable_u2c890964dd357757_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe = (B_dTrait_dFoldable.C_Foldable_Foldable (((Obj.magic (fun f z m -> (match m with
  | C_Maybe_Nothing -> z
  | C_Maybe_Just (dtb__15) -> ((f dtb__15) z)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 122 "Base/Data/Maybe.vuna"
let v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_uf = (fun _uctx0 -> (B_dTrait_dTraversable.C_Traversable_Traversable (((Obj.magic (fun fun_ m -> (match m with
  | C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure _uctx0) C_Maybe_Nothing)
  | C_Maybe_Just (dtb__16) -> ((((B_dTrait_dApplicative.v_liftA2 _uctx0) (fun y _u -> (C_Maybe_Just (y)))) (fun_ dtb__16)) ((B_dTrait_dApplicative.v_pure _uctx0) dtb__16))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t))))

# 24 "Base/Data/Maybe.vuna"
let v_fromMaybe = (fun mc0 mc1 -> (match mc1 with
  | C_Maybe_Just (dtb__17) -> dtb__17
  | C_Maybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 29 "Base/Data/Maybe.vuna"
let v_isJust = (fun mc0 -> (match mc0 with
  | C_Maybe_Just (dtb__18) -> true
  | C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 34 "Base/Data/Maybe.vuna"
let v_isNothing = (fun mc0 -> (match mc0 with
  | C_Maybe_Just (dtb__19) -> false
  | C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 39 "Base/Data/Maybe.vuna"
let v_maybe = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Maybe_Just (dtb__20) -> (mc1 dtb__20)
  | C_Maybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
))
