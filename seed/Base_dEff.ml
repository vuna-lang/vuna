open Vuna_runtime
type t_Base_dEff_dRow = C_Base_dEff_dRow_Nil | C_Base_dEff_dRow_Cons of (string) * (t_Base_dEff_dRow)
and t_Base_dEff_dMember = C_Base_dEff_dMember_Here | C_Base_dEff_dMember_There of (t_Base_dEff_dMember)
and t_Base_dEff_dEffUnit = C_Base_dEff_dEffUnit_MkEffUnit
and 'a0 t_Base_dEff_dEff = C_Base_dEff_dEff_MkEff of ((t_Base_dEff_dEffUnit) -> 'a0)
and ('a0, 'a1) t_Base_dEff_dCont = C_Base_dEff_dCont_MkCont of (('a0) -> 'a1)
and 'a0 t_Base_dEff_dResFn = C_Base_dEff_dResFn_MkResFn of (('a0) -> Obj.t)

let v_Functor_uBase_uEff_uEff_ur = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_Functor ((fun f e -> (C_Base_dEff_dEff_MkEff ((fun u -> (match e with
  | C_Base_dEff_dEff_MkEff (dtb__0) -> (f (dtb__0 u))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Monad_uBase_uEff_uEff_ur = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_Monad ((fun e k -> (C_Base_dEff_dEff_MkEff ((fun u -> (match e with
  | C_Base_dEff_dEff_MkEff (dtb__1) -> (match (k (dtb__1 u)) with
  | C_Base_dEff_dEff_MkEff (dtb__2) -> (dtb__2 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Applicative_uBase_uEff_uEff_ur = (Base_dApplicative.C_Dict_uBase_dApplicative_dApplicative_Applicative ((fun x -> (C_Base_dEff_dEff_MkEff ((fun _u -> x)))), (fun mf mx -> (C_Base_dEff_dEff_MkEff ((fun u -> (match mf with
  | C_Base_dEff_dEff_MkEff (dtb__3) -> (match mx with
  | C_Base_dEff_dEff_MkEff (dtb__4) -> ((dtb__3 u) (dtb__4 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))), (fun f ma mb -> (C_Base_dEff_dEff_MkEff ((fun u -> (match ma with
  | C_Base_dEff_dEff_MkEff (dtb__5) -> (match mb with
  | C_Base_dEff_dEff_MkEff (dtb__6) -> ((f (dtb__5 u)) (dtb__6 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Base_dEff_ddefaultInstance = "default"

let v_Base_dEff_deffPrim = (fun f -> (C_Base_dEff_dEff_MkEff ((fun _u -> (f 0)))))

let v_Base_dEff_dweaken = (fun comp -> (match comp with
  | C_Base_dEff_dEff_MkEff (dtb__7) -> (C_Base_dEff_dEff_MkEff (dtb__7))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEff_drunThunk = (fun e _uarity3 -> ((match e with
  | C_Base_dEff_dEff_MkEff (dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
) _uarity3))

let v_Base_dEff_drunPure = (fun e -> ((v_Base_dEff_drunThunk e) C_Base_dEff_dEffUnit_MkEffUnit))

let v_Base_dEff_drunEff = (fun e -> ((v_Base_dEff_drunThunk e) C_Base_dEff_dEffUnit_MkEffUnit))

let v_Base_dEff_drunMain = (fun e -> ((v_Base_dEff_drunThunk e) C_Base_dEff_dEffUnit_MkEffUnit))

let v_Base_dEff_djoinEff = (fun m -> (C_Base_dEff_dEff_MkEff ((fun u -> (match m with
  | C_Base_dEff_dEff_MkEff (dtb__9) -> (match (dtb__9 u) with
  | C_Base_dEff_dEff_MkEff (dtb__10) -> (dtb__10 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Base_dEff_draise = (fun mc0 -> (match mc0 with
  | C_Base_dEff_dEff_MkEff (dtb__11) -> (C_Base_dEff_dEff_MkEff (dtb__11))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEff_dsendCore = (fun key name o -> (C_Base_dEff_dEff_MkEff ((fun _u -> ((((fun key name v -> Obj.obj (Effect.perform (Perform (key, name, Obj.repr v)))) key) name) o)))))

let v_Base_dEff_dperformCore = (fun n key o -> (((v_Base_dEff_dsendCore key) n) o))

let v_Base_dEff_dhandleCore = (fun key name ret opH comp -> (C_Base_dEff_dEff_MkEff ((((((dtp_effect_handle key) name) ret) opH) (v_Base_dEff_drunThunk comp)))))

let v_Base_dEff_dresumeCont = (fun c x -> (match c with
  | C_Base_dEff_dCont_MkCont (dtb__12) -> (dtb__12 x)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEff_dcontAdapter = (fun opH o k -> (((Obj.magic opH) o) (C_Base_dEff_dCont_MkCont ((Obj.magic k)))))

let v_Base_dEff_dhandleCoreLin = (fun key name ret opH comp -> (((((v_Base_dEff_dhandleCore key) name) ret) (v_Base_dEff_dcontAdapter (Obj.magic opH))) comp))

let v_Base_dEff_dresFn = (fun r -> (C_Base_dEff_dResFn_MkResFn (r)))

let v_Base_dEff_dhandleWith = (fun n key comp ret opH -> (((((v_Base_dEff_dhandleCore key) n) ret) (Obj.magic opH)) comp))

let v_Base_dEff_dhandleWithAt = (fun n key comp ret opH -> (((((v_Base_dEff_dhandleCore key) n) ret) (Obj.magic opH)) comp))

let v_Base_dEff_dmkCont = (fun k -> (C_Base_dEff_dCont_MkCont (k)))

let v_Base_dEff_dbracket = (fun acquire release use -> (((Base_dMonad.v_Base_dMonad_dbind v_Monad_uBase_uEff_uEff_ur) acquire) (fun res -> (((Base_dMonad.v_Base_dMonad_dbind v_Monad_uBase_uEff_uEff_ur) (v_Base_dEff_deffPrim (fun _u -> (dtp_cleanup_push (fun _u -> (v_Base_dEff_drunEff (release res))))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind v_Monad_uBase_uEff_uEff_ur) (use res)) (fun a -> (((Base_dMonad.v_Base_dMonad_dbind v_Monad_uBase_uEff_uEff_ur) (v_Base_dEff_deffPrim (fun _u -> (dtp_cleanup_pop 0)))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind v_Monad_uBase_uEff_uEff_ur) (release res)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure v_Applicative_uBase_uEff_uEff_ur) a))))))))))))

let v_Base_dEff_dfinally = (fun comp cleanup -> (((v_Base_dEff_dbracket ((Base_dApplicative.v_Base_dApplicative_dpure v_Applicative_uBase_uEff_uEff_ur) 0)) (fun _u -> cleanup)) (fun _u -> comp)))
