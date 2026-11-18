open Vuna_runtime
type ('a0, 'a1) t_Base_dEffect_dPure_dError_dError = C_Base_dEffect_dPure_dError_dError_MkOk of ('a1) | C_Base_dEffect_dPure_dError_dError_MkErr of ('a0)

# 28 "Base/Effect/Pure/Error.vuna"
let v_Functor_uBase_uEffect_uPure_uError_uError_ue = (Base_dTrait_dFunctor.C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor ((Obj.magic (fun mc0 mc1 -> (match mc1 with
  | C_Base_dEffect_dPure_dError_dError_MkErr (dtb__0) -> (C_Base_dEffect_dPure_dError_dError_MkErr (dtb__0))
  | C_Base_dEffect_dPure_dError_dError_MkOk (dtb__1) -> (C_Base_dEffect_dPure_dError_dError_MkOk ((mc0 dtb__1)))
  | _ -> failwith "DT: impossible branch"
)))))

# 32 "Base/Effect/Pure/Error.vuna"
let v_Monad_uBase_uEffect_uPure_uError_uError_ue = (Base_dTrait_dMonad.C_Dict_uBase_dTrait_dMonad_dMonad_Monad ((Obj.magic (fun mc0 mc1 -> (match mc0 with
  | C_Base_dEffect_dPure_dError_dError_MkErr (dtb__2) -> (C_Base_dEffect_dPure_dError_dError_MkErr (dtb__2))
  | C_Base_dEffect_dPure_dError_dError_MkOk (dtb__3) -> (mc1 dtb__3)
  | _ -> failwith "DT: impossible branch"
)))))

# 36 "Base/Effect/Pure/Error.vuna"
let v_Applicative_uBase_uEffect_uPure_uError_uError_ue = (Base_dTrait_dApplicative.C_Dict_uBase_dTrait_dApplicative_dApplicative_Applicative ((Obj.magic (fun a -> (C_Base_dEffect_dPure_dError_dError_MkOk (a)))), (Obj.magic (fun mf mx -> (match mf with
  | C_Base_dEffect_dPure_dError_dError_MkOk (dtb__4) -> (match mx with
  | C_Base_dEffect_dPure_dError_dError_MkOk (dtb__5) -> (C_Base_dEffect_dPure_dError_dError_MkOk ((dtb__4 dtb__5)))
  | C_Base_dEffect_dPure_dError_dError_MkErr (dtb__6) -> (C_Base_dEffect_dPure_dError_dError_MkErr (dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dEffect_dPure_dError_dError_MkErr (dtb__7) -> (C_Base_dEffect_dPure_dError_dError_MkErr (dtb__7))
  | _ -> failwith "DT: impossible branch"
))), (Obj.magic (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dEffect_dPure_dError_dError_MkErr (dtb__8) -> (C_Base_dEffect_dPure_dError_dError_MkErr (dtb__8))
  | C_Base_dEffect_dPure_dError_dError_MkOk (dtb__9) -> (match mc2 with
  | C_Base_dEffect_dPure_dError_dError_MkErr (dtb__10) -> (C_Base_dEffect_dPure_dError_dError_MkErr (dtb__10))
  | C_Base_dEffect_dPure_dError_dError_MkOk (dtb__11) -> (C_Base_dEffect_dPure_dError_dError_MkOk (((mc0 dtb__9) dtb__11)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 17 "Base/Effect/Pure/Error.vuna"
let v_Base_dEffect_dPure_dError_drunError = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dEffect_dPure_dError_dError_MkErr (dtb__12) -> (mc1 dtb__12)
  | C_Base_dEffect_dPure_dError_dError_MkOk (dtb__13) -> (mc2 dtb__13)
  | _ -> failwith "DT: impossible branch"
))

# 22 "Base/Effect/Pure/Error.vuna"
let v_Base_dEffect_dPure_dError_dthrowError = (fun e -> (C_Base_dEffect_dPure_dError_dError_MkErr (e)))

# 26 "Base/Effect/Pure/Error.vuna"
let v_Base_dEffect_dPure_dError_dok = (fun a -> (C_Base_dEffect_dPure_dError_dError_MkOk (a)))

# 51 "Base/Effect/Pure/Error.vuna"
let v_Base_dEffect_dPure_dError_dcatchError = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dEffect_dPure_dError_dError_MkErr (dtb__14) -> (mc1 dtb__14)
  | C_Base_dEffect_dPure_dError_dError_MkOk (dtb__15) -> (C_Base_dEffect_dPure_dError_dError_MkOk (dtb__15))
  | _ -> failwith "DT: impossible branch"
))
