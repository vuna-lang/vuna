open Vuna_runtime
type t_Base_dEffect_dCore_dNamed = |
and t_Base_dEffect_dCore_dRow = C_Base_dEffect_dCore_dRow_Nil | C_Base_dEffect_dCore_dRow__x58__x58_ of (t_Base_dEffect_dCore_dRow)
and t_Base_dEffect_dCore_dMember = C_Base_dEffect_dCore_dMember_Here | C_Base_dEffect_dCore_dMember_There of (t_Base_dEffect_dCore_dMember)
and t_Base_dEffect_dCore_dEffUnit = C_Base_dEffect_dCore_dEffUnit_MkEffUnit
and 'a0 t_Base_dEffect_dCore_dEff = C_Base_dEffect_dCore_dEff_MkEff of ((t_Base_dEffect_dCore_dEffUnit) -> 'a0)
and 'a0 t_Base_dEffect_dCore_dScoped = C_Base_dEffect_dCore_dScoped_MkScoped of ((int) -> 'a0)
and t_Base_dEffect_dCore_dEffSig = C_Base_dEffect_dCore_dEffSig_MkEffSig
and ('a0, 'a1) t_Base_dEffect_dCore_dCont = C_Base_dEffect_dCore_dCont_MkCont of (('a0) -> 'a1)

# 61 "Base/Effect/Core.vuna"
let v_Functor_uBase_uEffect_uCore_uEff_ur = (Base_dTrait_dFunctor.C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor ((fun f e -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__0) -> (f (dtb__0 u))
  | _ -> failwith "DT: impossible branch"
)))))))

# 66 "Base/Effect/Core.vuna"
let v_Monad_uBase_uEffect_uCore_uEff_ur = (Base_dTrait_dMonad.C_Dict_uBase_dTrait_dMonad_dMonad_Monad ((fun e k -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__1) -> (match (k (dtb__1 u)) with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__2) -> (dtb__2 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 72 "Base/Effect/Core.vuna"
let v_Applicative_uBase_uEffect_uCore_uEff_ur = (Base_dTrait_dApplicative.C_Dict_uBase_dTrait_dApplicative_dApplicative_Applicative ((fun x -> (C_Base_dEffect_dCore_dEff_MkEff ((fun _u -> x)))), (fun mf mx -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match mf with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__3) -> (match mx with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__4) -> ((dtb__3 u) (dtb__4 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))), (fun f ma mb -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match ma with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__5) -> (match mb with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__6) -> ((f (dtb__5 u)) (dtb__6 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 48 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_ddefaultInstance = "default"

# 85 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_deffPrim = (fun f -> (C_Base_dEffect_dCore_dEff_MkEff ((fun _u -> (f 0)))))

# 89 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dweaken = (fun comp -> (match comp with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__7) -> (C_Base_dEffect_dCore_dEff_MkEff (dtb__7))
  | _ -> failwith "DT: impossible branch"
))

# 94 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunThunk = (fun e _uarity3 -> ((match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
) _uarity3))

# 99 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunPure = (fun e -> ((v_Base_dEffect_dCore_drunThunk e) C_Base_dEffect_dCore_dEffUnit_MkEffUnit))

# 103 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunEff = (fun e -> ((v_Base_dEffect_dCore_drunThunk e) C_Base_dEffect_dCore_dEffUnit_MkEffUnit))

# 113 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dscope = (fun comp -> (C_Base_dEffect_dCore_dScoped_MkScoped ((fun _u -> ((v_Base_dEffect_dCore_drunThunk comp) C_Base_dEffect_dCore_dEffUnit_MkEffUnit)))))

# 119 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleScoped = (fun mc0 -> (match mc0 with
  | C_Base_dEffect_dCore_dScoped_MkScoped (dtb__9) -> (dtp_effect_self dtb__9)
  | _ -> failwith "DT: impossible branch"
))

# 123 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleSelf = (fun comp -> (v_Base_dEffect_dCore_dhandleScoped (v_Base_dEffect_dCore_dscope comp)))

# 128 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunMain = (fun e -> ((v_Base_dEffect_dCore_drunThunk e) C_Base_dEffect_dCore_dEffUnit_MkEffUnit))

# 134 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_djoinEff = (fun m -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match m with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__10) -> (match (dtb__10 u) with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__11) -> (dtb__11 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 143 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_djoinEffNilOuter = (fun m -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match m with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__12) -> (match (dtb__12 u) with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__13) -> (dtb__13 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 151 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dweakenRow = (fun t e -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__14) -> (dtb__14 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 157 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_draise = (fun mc0 -> (match mc0 with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__15) -> (C_Base_dEffect_dCore_dEff_MkEff (dtb__15))
  | _ -> failwith "DT: impossible branch"
))

# 162 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_draiseTo = (fun r e -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__16) -> (dtb__16 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 168 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dsendCore = (fun key name o -> (C_Base_dEffect_dCore_dEff_MkEff ((fun _u -> ((((fun key name v -> Obj.obj (Effect.perform (Perform (key, name, Obj.repr v)))) key) name) o)))))

# 178 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dsigFn = C_Base_dEffect_dCore_dEffSig_MkEffSig

# 192 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dperformCore = (fun n key o -> (((v_Base_dEffect_dCore_dsendCore key) n) (Obj.magic o)))

# 196 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleCore = (fun key name ret opH comp -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match comp with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__17) -> ((((((dtp_effect_handle key) name) ret) opH) dtb__17) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 202 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleCoreAt = (fun key name ret opH comp -> (C_Base_dEffect_dCore_dEff_MkEff ((fun u -> (match comp with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__18) -> ((((((dtp_effect_handle key) name) ret) opH) dtb__18) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 213 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dresumeCont = (fun c x -> (match c with
  | C_Base_dEffect_dCore_dCont_MkCont (dtb__19) -> (dtb__19 x)
  | _ -> failwith "DT: impossible branch"
))

# 218 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dcontAdapter = (fun opH o k -> ((opH o) (C_Base_dEffect_dCore_dCont_MkCont (k))))

# 222 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleCoreLin = (fun key name ret opH comp -> (((((v_Base_dEffect_dCore_dhandleCore key) name) ret) (v_Base_dEffect_dCore_dcontAdapter opH)) comp))

# 231 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleWith = (fun n key comp ret opH -> (((((v_Base_dEffect_dCore_dhandleCore key) n) ret) (Obj.magic opH)) comp))

# 236 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleWithAt = (fun n key comp ret opH -> (((((v_Base_dEffect_dCore_dhandleCoreAt key) n) ret) (Obj.magic opH)) comp))

# 244 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dmkCont = (fun k -> (C_Base_dEffect_dCore_dCont_MkCont (k)))

# 248 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dbracket = (fun acquire release use -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) acquire) (fun res -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (v_Base_dEffect_dCore_deffPrim (fun _u -> (dtp_cleanup_push (fun _u -> (v_Base_dEffect_dCore_drunEff (release res))))))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (use res)) (fun a -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (v_Base_dEffect_dCore_deffPrim (fun _u -> (dtp_cleanup_pop 0)))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (release res)) (fun _u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure v_Applicative_uBase_uEffect_uCore_uEff_ur) a))))))))))))

# 258 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dfinally = (fun comp cleanup -> (((v_Base_dEffect_dCore_dbracket ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)) (fun _u -> cleanup)) (fun _u -> comp)))
