open Vuna_runtime
type ('a0, 'a1) t_Error = C_Error_MkOk of ('a1) | C_Error_MkErr of ('a0)

# 28 "Base/Effect/Pure/Error.vuna"
let v_Functor_uBase_uEffect_uPure_uError_uError_ue = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun mc0 mc1 -> (match mc1 with
  | C_Error_MkErr (dtb__0) -> (C_Error_MkErr (dtb__0))
  | C_Error_MkOk (dtb__1) -> (C_Error_MkOk ((mc0 dtb__1)))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 32 "Base/Effect/Pure/Error.vuna"
let v_Monad_uBase_uEffect_uPure_uError_uError_ue = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun mc0 mc1 -> (match mc0 with
  | C_Error_MkErr (dtb__2) -> (C_Error_MkErr (dtb__2))
  | C_Error_MkOk (dtb__3) -> (mc1 dtb__3)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 36 "Base/Effect/Pure/Error.vuna"
let v_Applicative_uBase_uEffect_uPure_uError_uError_ue = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun a -> (C_Error_MkOk (a)))) : Obj.t), ((Obj.magic (fun mf mx -> (match mf with
  | C_Error_MkOk (dtb__4) -> (match mx with
  | C_Error_MkOk (dtb__5) -> (C_Error_MkOk ((dtb__4 dtb__5)))
  | C_Error_MkErr (dtb__6) -> (C_Error_MkErr (dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Error_MkErr (dtb__7) -> (C_Error_MkErr (dtb__7))
  | _ -> failwith "DT: impossible branch"
))) : Obj.t), ((Obj.magic (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Error_MkErr (dtb__8) -> (C_Error_MkErr (dtb__8))
  | C_Error_MkOk (dtb__9) -> (match mc2 with
  | C_Error_MkErr (dtb__10) -> (C_Error_MkErr (dtb__10))
  | C_Error_MkOk (dtb__11) -> (C_Error_MkOk (((mc0 dtb__9) dtb__11)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) : Obj.t)))

# 17 "Base/Effect/Pure/Error.vuna"
let v_runError = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Error_MkErr (dtb__12) -> (mc1 dtb__12)
  | C_Error_MkOk (dtb__13) -> (mc2 dtb__13)
  | _ -> failwith "DT: impossible branch"
))

# 22 "Base/Effect/Pure/Error.vuna"
let v_throwError = (fun e -> (C_Error_MkErr (e)))

# 26 "Base/Effect/Pure/Error.vuna"
let v_ok = (fun a -> (C_Error_MkOk (a)))

# 51 "Base/Effect/Pure/Error.vuna"
let v_catchError = (fun mc0 mc1 -> (match mc0 with
  | C_Error_MkErr (dtb__14) -> (mc1 dtb__14)
  | C_Error_MkOk (dtb__15) -> (C_Error_MkOk (dtb__15))
  | _ -> failwith "DT: impossible branch"
))
