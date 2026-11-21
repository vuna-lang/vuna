open Vuna_runtime
type 'a0 t_Cursor = C_Cursor_MkCursor of ((B_dData_dUnit.t_Unit) -> 'a0 B_dData_dMaybe.t_Maybe B_dEffect_dCore.t_Eff)

# 23 "Base/Effect/Cursor.vuna"
let v_cursorOfStep = (fun f -> (C_Cursor_MkCursor (f)))

# 27 "Base/Effect/Cursor.vuna"
let v_next = (fun mc0 -> (match mc0 with
  | C_Cursor_MkCursor (dtb__0) -> (dtb__0 B_dData_dUnit.C_Unit_MkUnit)
  | _ -> failwith "DT: impossible branch"
))

# 34 "Base/Effect/Cursor.vuna"
let v_mapStepC = (fun f g -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (g B_dData_dUnit.C_Unit_MkUnit)) (fun m -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dData_dMaybe.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe) f) m)))))

# 31 "Base/Effect/Cursor.vuna"
let v_mapC = (fun mc0 mc1 -> (match mc1 with
  | C_Cursor_MkCursor (dtb__1) -> (C_Cursor_MkCursor ((fun (_u : B_dData_dUnit.t_Unit) -> ((v_mapStepC mc0) dtb__1))))
  | _ -> failwith "DT: impossible branch"
))

# 50 "Base/Effect/Cursor.vuna"
let v_popStep = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dPure_dIORef.v_writeRef mc0) dtb__3)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (dtb__2)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 47 "Base/Effect/Cursor.vuna"
let v_popCell = (fun cell -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dPure_dIORef.v_readRef cell)) (v_popStep cell)))

# 41 "Base/Effect/Cursor.vuna"
let v_ofList = (fun xs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dPure_dIORef.v_newRef xs)) (fun cell -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (C_Cursor_MkCursor ((fun (_u : B_dData_dUnit.t_Unit) -> (v_popCell cell))))))))

# 58 "Base/Effect/Cursor.vuna"
let rec v_takeC = (fun (n : int) c -> (if (n <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_next c)) (fun m -> (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_takeC (n - 1)) c)) (fun rest -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (dtb__4, rest)))))
  | _ -> failwith "DT: impossible branch"
)))))

# 69 "Base/Effect/Cursor.vuna"
let rec v_foldC = (fun (n : int) f acc c -> (if (n <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) acc) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_next c)) (fun m -> (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) acc)
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> ((((v_foldC (n - 1)) f) ((f acc) dtb__5)) c)
  | _ -> failwith "DT: impossible branch"
)))))
