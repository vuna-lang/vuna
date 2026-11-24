open Vuna_runtime
type ('a0, 'a1) t_Cursor = C_Cursor_MkCursor of ('a0) * (('a0) -> ('a1 B_dData_dMaybe.t_Maybe, 'a0) B_dData_dPair.t_Pair B_dEffect_dCore.t_Eff)

# 25 "Base/Effect/Cursor.vuna"
let v_cursorOfState = (fun s step -> (C_Cursor_MkCursor (s, step)))

# 29 "Base/Effect/Cursor.vuna"
let v_next = (fun mc0 -> (match mc0 with
  | C_Cursor_MkCursor (dtb__0, dtb__1) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (dtb__1 dtb__0)) (fun p -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (C_Cursor_MkCursor ((B_dData_dPair.v_secondOf p), dtb__1)) })))
  | _ -> failwith "DT: impossible branch"
))

# 36 "Base/Effect/Cursor.vuna"
let v_mapStep = (fun f step s -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (step s)) (fun p -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (((B_dTrait_dFunctor.v_fmap B_dData_dMaybe.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) f) dtb__2); B_dData_dPair.f_Pair_second = dtb__3 })
  | _ -> failwith "DT: impossible branch"
))))

# 33 "Base/Effect/Cursor.vuna"
let v_mapC = (fun mc0 mc1 -> (match mc1 with
  | C_Cursor_MkCursor (dtb__4, dtb__5) -> (C_Cursor_MkCursor (dtb__4, ((v_mapStep mc0) dtb__5)))
  | _ -> failwith "DT: impossible branch"
))

# 46 "Base/Effect/Cursor.vuna"
let v_ofListStep = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb__6)); B_dData_dPair.f_Pair_second = dtb__7 })
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })
  | _ -> failwith "DT: impossible branch"
))

# 43 "Base/Effect/Cursor.vuna"
let v_ofList = (fun xs -> (C_Cursor_MkCursor (xs, v_ofListStep)))

# 51 "Base/Effect/Cursor.vuna"
let rec v_takeC = (fun (n : int) c -> (if (n <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = c }) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_next c)) (fun p -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__8; B_dData_dPair.f_Pair_second = dtb__9 } -> (match dtb__8 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__9 })
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_takeC (n - 1)) dtb__9)) (fun q -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__11; B_dData_dPair.f_Pair_second = dtb__12 } -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11)); B_dData_dPair.f_Pair_second = dtb__12 })
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 67 "Base/Effect/Cursor.vuna"
let rec v_foldC = (fun (n : int) f acc c -> (if (n <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = c }) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_next c)) (fun p -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__13; B_dData_dPair.f_Pair_second = dtb__14 } -> (match dtb__13 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = dtb__14 })
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> ((((v_foldC (n - 1)) f) ((f acc) dtb__15)) dtb__14)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
