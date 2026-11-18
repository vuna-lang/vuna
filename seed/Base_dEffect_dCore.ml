open Vuna_runtime
type t_Base_dEffect_dCore_dNamed = |
and t_Base_dEffect_dCore_dRow = C_Base_dEffect_dCore_dRow_Nil | C_Base_dEffect_dCore_dRow__x58__x58_ of (t_Base_dEffect_dCore_dRow)
and t_Base_dEffect_dCore_dMember = C_Base_dEffect_dCore_dMember_Here | C_Base_dEffect_dCore_dMember_There of (t_Base_dEffect_dCore_dMember)
and t_Base_dEffect_dCore_dEffUnit = C_Base_dEffect_dCore_dEffUnit_MkEffUnit
and 'a0 t_Base_dEffect_dCore_dEff = C_Base_dEffect_dCore_dEff_MkEff of ((t_Base_dEffect_dCore_dEffUnit) -> 'a0)
and 'a0 t_Base_dEffect_dCore_dScoped = C_Base_dEffect_dCore_dScoped_MkScoped of ((int) -> 'a0)
and t_Base_dEffect_dCore_dEffSig = C_Base_dEffect_dCore_dEffSig_MkEffSig
and ('a0, 'a1) t_Base_dEffect_dCore_dCont = C_Base_dEffect_dCore_dCont_MkCont of (('a0) -> 'a1)
and 'a0 t_Base_dEffect_dCore_dControl = C_Base_dEffect_dCore_dControl_MkDone of ('a0) | C_Base_dEffect_dCore_dControl_MkApply of (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) * ('a0) | C_Base_dEffect_dCore_dControl_MkPerform of (string) * (string) * ('a0) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) | C_Base_dEffect_dCore_dControl_MkHandle of (string) * (string) * (('a0) -> 'a0) * (('a0) -> (('a0) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> 'a0 t_Base_dEffect_dCore_dControl) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> 'a0 t_Base_dEffect_dCore_dControl) * (('a0) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> 'a0 t_Base_dEffect_dCore_dControl) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) | C_Base_dEffect_dCore_dControl_MkReturn of ('a0 t_Base_dEffect_dCore_dFrame) * ('a0) | C_Base_dEffect_dCore_dControl_MkKDone of ('a0 t_Base_dEffect_dCore_dFrame) * ('a0) | C_Base_dEffect_dCore_dControl_MkResume of ('a0 t_Base_dEffect_dCore_dFrame) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) * (int) * ('a0) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl)
and 'a0 t_Base_dEffect_dCore_dFrame = C_Base_dEffect_dCore_dFrame_MkFrame of (string) * (string) * (('a0) -> 'a0) * (('a0) -> (('a0) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> 'a0 t_Base_dEffect_dCore_dControl) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> 'a0 t_Base_dEffect_dCore_dControl) * (('a0) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> 'a0 t_Base_dEffect_dCore_dControl) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) * ('a0 t_Base_dEffect_dCore_dFrame Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe)
and 'a0 t_Base_dEffect_dCore_dCtx = C_Base_dEffect_dCore_dCtx_MkCtx of ('a0 t_Base_dEffect_dCore_dFrame) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) * ('a0 t_Base_dEffect_dCore_dCtx Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe)
and 'a0 t_Base_dEffect_dCore_dMSt = { f_Base_dEffect_dCore_dMSt_msFrames : 'a0 t_Base_dEffect_dCore_dFrame Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Base_dEffect_dCore_dMSt_msCtx : 'a0 t_Base_dEffect_dCore_dCtx Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Base_dEffect_dCore_dMSt_msUsed : int Base_dData_dList.t_Base_dData_dList_dList; f_Base_dEffect_dCore_dMSt_msNext : int }

# 69 "Base/Effect/Core.vuna"
let v_Functor_uBase_uEffect_uCore_uEff_ur = (Base_dTrait_dFunctor.C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor ((Obj.magic (fun f e -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__0) -> (f (dtb__0 u))
  | _ -> failwith "DT: impossible branch"
))))))))

# 77 "Base/Effect/Core.vuna"
let v_Monad_uBase_uEffect_uCore_uEff_ur = (Base_dTrait_dMonad.C_Dict_uBase_dTrait_dMonad_dMonad_Monad ((Obj.magic (fun e k -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__1) -> (match (k (dtb__1 u)) with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__2) -> (dtb__2 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 87 "Base/Effect/Core.vuna"
let v_Applicative_uBase_uEffect_uCore_uEff_ur = (Base_dTrait_dApplicative.C_Dict_uBase_dTrait_dApplicative_dApplicative_Applicative ((Obj.magic (fun x -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (_u : t_Base_dEffect_dCore_dEffUnit) -> x))))), (Obj.magic (fun mf mx -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match mf with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__3) -> (match mx with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__4) -> ((dtb__3 u) (dtb__4 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))), (Obj.magic (fun f ma mb -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match ma with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__5) -> (match mb with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__6) -> ((f (dtb__5 u)) (dtb__6 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 56 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_ddefaultInstance = "default"

# 108 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_deffPrim = (fun f -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (_u : t_Base_dEffect_dCore_dEffUnit) -> (f 0)))))

# 112 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dweaken = (fun comp -> (match comp with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__7) -> (C_Base_dEffect_dCore_dEff_MkEff (dtb__7))
  | _ -> failwith "DT: impossible branch"
))

# 118 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunThunk = (fun e _uarity3 -> ((match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
) _uarity3))

# 124 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunPure = (fun e -> ((v_Base_dEffect_dCore_drunThunk e) C_Base_dEffect_dCore_dEffUnit_MkEffUnit))

# 128 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunEff = (fun e -> ((v_Base_dEffect_dCore_drunThunk e) C_Base_dEffect_dCore_dEffUnit_MkEffUnit))

# 138 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dscope = (fun comp -> (C_Base_dEffect_dCore_dScoped_MkScoped ((fun (_u : int) -> ((v_Base_dEffect_dCore_drunThunk comp) C_Base_dEffect_dCore_dEffUnit_MkEffUnit)))))

# 144 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleScoped = (fun mc0 -> (match mc0 with
  | C_Base_dEffect_dCore_dScoped_MkScoped (dtb__9) -> (dtp_effect_self dtb__9)
  | _ -> failwith "DT: impossible branch"
))

# 148 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleSelf = (fun comp -> (v_Base_dEffect_dCore_dhandleScoped (v_Base_dEffect_dCore_dscope comp)))

# 153 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunMain = (fun e -> ((v_Base_dEffect_dCore_drunThunk e) C_Base_dEffect_dCore_dEffUnit_MkEffUnit))

# 159 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_djoinEff = (fun m -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match m with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__10) -> (match (dtb__10 u) with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__11) -> (dtb__11 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 172 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_djoinEffNilOuter = (fun m -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match m with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__12) -> (match (dtb__12 u) with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__13) -> (dtb__13 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 184 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dweakenRow = (fun t e -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__14) -> (dtb__14 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 193 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_draise = (fun mc0 -> (match mc0 with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__15) -> (C_Base_dEffect_dCore_dEff_MkEff (dtb__15))
  | _ -> failwith "DT: impossible branch"
))

# 198 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_draiseTo = (fun r e -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__16) -> (dtb__16 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 207 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dsendCore = (fun key name o -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (_u : t_Base_dEffect_dCore_dEffUnit) -> ((((fun key name v -> Obj.obj (Effect.perform (Perform (key, name, Obj.repr v)))) key) name) o)))))

# 217 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dsigFn = C_Base_dEffect_dCore_dEffSig_MkEffSig

# 231 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dperformCore = (fun n key o -> (((v_Base_dEffect_dCore_dsendCore key) n) (Obj.magic o)))

# 235 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleCore = (fun key name ret opH comp -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match comp with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__17) -> ((((((dtp_effect_handle key) name) ret) opH) dtb__17) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 244 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleCoreAt = (fun key name ret opH comp -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match comp with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__18) -> ((((((dtp_effect_handle key) name) ret) opH) dtb__18) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 263 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dtoObj = (fun x -> (Obj.repr x))

# 267 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dfromObj = (fun o -> (Obj.obj (Obj.magic o)))

# 276 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dresumeCont = (fun c x -> (match c with
  | C_Base_dEffect_dCore_dCont_MkCont (dtb__19) -> (dtb__19 x)
  | _ -> failwith "DT: impossible branch"
))

# 282 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dcontAdapter = (fun opH o k -> ((opH o) (C_Base_dEffect_dCore_dCont_MkCont (k))))

# 286 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleCoreLin = (fun key name ret opH comp -> (((((v_Base_dEffect_dCore_dhandleCore key) name) ret) (v_Base_dEffect_dCore_dcontAdapter opH)) comp))

# 295 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleWith = (fun n key comp ret opH -> (((((v_Base_dEffect_dCore_dhandleCore key) n) ret) (Obj.magic opH)) comp))

# 300 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleWithAt = (fun n key comp ret opH -> (((((v_Base_dEffect_dCore_dhandleCoreAt key) n) ret) (Obj.magic opH)) comp))

# 308 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dmkCont = (fun k -> (C_Base_dEffect_dCore_dCont_MkCont (k)))

# 312 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dbracket = (fun acquire release use -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) acquire) (fun _x64_vuna_x64_effK_u314_u5_u6_x58_res -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (v_Base_dEffect_dCore_deffPrim (fun (_u : int) -> (dtp_cleanup_push (fun (_u : int) -> (v_Base_dEffect_dCore_drunEff (release _x64_vuna_x64_effK_u314_u5_u6_x58_res))))))) (fun _x64_vuna_x64_effK_u0_u0_u7_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (use _x64_vuna_x64_effK_u314_u5_u6_x58_res)) (fun _x64_vuna_x64_effK_u316_u5_u8_x58_a -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (v_Base_dEffect_dCore_deffPrim (fun (_u : int) -> (dtp_cleanup_pop 0)))) (fun _x64_vuna_x64_effK_u0_u0_u9_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (release _x64_vuna_x64_effK_u314_u5_u6_x58_res)) (fun _x64_vuna_x64_effK_u0_u0_u10_x58__u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure v_Applicative_uBase_uEffect_uCore_uEff_ur) _x64_vuna_x64_effK_u316_u5_u8_x58_a))))))))))))

# 323 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dfinally = (fun comp cleanup -> (((v_Base_dEffect_dCore_dbracket ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)) (fun (_u : int) -> cleanup)) (fun (_u : int) -> comp)))

# 353 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_demptySt = { f_Base_dEffect_dCore_dMSt_msFrames = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Base_dEffect_dCore_dMSt_msCtx = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Base_dEffect_dCore_dMSt_msUsed = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Base_dEffect_dCore_dMSt_msNext = 0 }

# 356 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeKey = (fun f -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

# 361 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeName = (fun f -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

# 366 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeRet = (fun f _uarity2 -> ((match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> dtb__36
  | _ -> failwith "DT: impossible branch"
) _uarity2))

# 371 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeOpH = (fun f _uarity2 _uarity3 _uarity4 -> ((((match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> dtb__44
  | _ -> failwith "DT: impossible branch"
) _uarity2) _uarity3) _uarity4))

# 376 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeComp = (fun f _uarity2 _uarity3 -> (((match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> dtb__52
  | _ -> failwith "DT: impossible branch"
) _uarity2) _uarity3))

# 381 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeKOuter = (fun f _uarity2 -> ((match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> dtb__60
  | _ -> failwith "DT: impossible branch"
) _uarity2))

# 386 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframePrev = (fun f -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> dtb__68
  | _ -> failwith "DT: impossible branch"
))

# 391 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dctxPrompt = (fun c -> (match c with
  | C_Base_dEffect_dCore_dCtx_MkCtx (dtb__69, dtb__70, dtb__71) -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

# 396 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dctxKRest = (fun c _uarity2 -> ((match c with
  | C_Base_dEffect_dCore_dCtx_MkCtx (dtb__72, dtb__73, dtb__74) -> dtb__73
  | _ -> failwith "DT: impossible branch"
) _uarity2))

# 401 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dctxPrev = (fun c -> (match c with
  | C_Base_dEffect_dCore_dCtx_MkCtx (dtb__75, dtb__76, dtb__77) -> dtb__77
  | _ -> failwith "DT: impossible branch"
))

# 406 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dsamePrompt = (fun a b -> (if ((v_Base_dEffect_dCore_dframeKey a) = (v_Base_dEffect_dCore_dframeKey b)) then ((v_Base_dEffect_dCore_dframeName a) = (v_Base_dEffect_dCore_dframeName b)) else false))

# 409 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_ddepth = (fun n chain -> (if (n <= 0) then 0 else (match chain with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__78) -> (1 + ((v_Base_dEffect_dCore_ddepth (n - 1)) (v_Base_dEffect_dCore_dframePrev dtb__78)))
  | _ -> failwith "DT: impossible branch"
)))

# 418 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dinChain = (fun fuel f chain -> (if (fuel <= 0) then false else (match chain with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__79) -> (if ((v_Base_dEffect_dCore_dsamePrompt f) dtb__79) then true else (((v_Base_dEffect_dCore_dinChain (fuel - 1)) f) (v_Base_dEffect_dCore_dframePrev dtb__79)))
  | _ -> failwith "DT: impossible branch"
)))

# 428 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dreinstall = (fun f chain -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> (C_Base_dEffect_dCore_dFrame_MkFrame (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, chain))
  | _ -> failwith "DT: impossible branch"
))

# 433 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dreinstallIfMissing = (fun fuel f chain -> (if (((v_Base_dEffect_dCore_dinChain fuel) f) chain) then chain else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Base_dEffect_dCore_dreinstall f) chain)))))

# 436 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dfindFrame = (fun fuel key name chain -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match chain with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__87) -> (if (if ((v_Base_dEffect_dCore_dframeKey dtb__87) = key) then ((v_Base_dEffect_dCore_dframeName dtb__87) = name) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__87)) else ((((v_Base_dEffect_dCore_dfindFrame (fuel - 1)) key) name) (v_Base_dEffect_dCore_dframePrev dtb__87)))
  | _ -> failwith "DT: impossible branch"
)))

# 480 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dmemInt = (fun x xs -> (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__88, dtb__89) -> (if (x = dtb__88) then true else ((v_Base_dEffect_dCore_dmemInt x) dtb__89))
  | _ -> failwith "DT: impossible branch"
))

# 450 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dstep = (fun fuel st c -> (if (fuel <= 0) then ((fun msg -> failwith msg) "vuna: effect machine: fuel exhausted") else (match (Obj.magic c) with
  | C_Base_dEffect_dCore_dControl_MkDone (dtb__90) -> (Obj.magic dtb__90)
  | C_Base_dEffect_dCore_dControl_MkApply (dtb__91, dtb__92) -> (Obj.magic (((v_Base_dEffect_dCore_dstep (fuel - 1)) (Obj.magic st)) (dtb__91 dtb__92)))
  | C_Base_dEffect_dCore_dControl_MkKDone (dtb__93, dtb__94) -> (Obj.magic ((((v_Base_dEffect_dCore_dfinish (fuel - 1)) (Obj.magic st)) dtb__93) dtb__94))
  | C_Base_dEffect_dCore_dControl_MkReturn (dtb__95, dtb__96) -> (Obj.magic (match ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__97) -> (Obj.magic (if ((v_Base_dEffect_dCore_dsamePrompt (v_Base_dEffect_dCore_dctxPrompt dtb__97)) dtb__95) then (((v_Base_dEffect_dCore_dstep (fuel - 1)) { f_Base_dEffect_dCore_dMSt_msFrames = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames; f_Base_dEffect_dCore_dMSt_msCtx = (v_Base_dEffect_dCore_dctxPrev dtb__97); f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext }) ((v_Base_dEffect_dCore_dctxKRest dtb__97) ((v_Base_dEffect_dCore_dframeRet dtb__95) dtb__96))) else ((((v_Base_dEffect_dCore_dfinish (fuel - 1)) (Obj.magic st)) dtb__95) ((v_Base_dEffect_dCore_dframeRet dtb__95) dtb__96))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Obj.magic ((((v_Base_dEffect_dCore_dfinish (fuel - 1)) (Obj.magic st)) dtb__95) ((v_Base_dEffect_dCore_dframeRet dtb__95) dtb__96)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dEffect_dCore_dControl_MkResume (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> (Obj.magic (if ((v_Base_dEffect_dCore_dmemInt dtb__100) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed) then ((fun msg -> failwith msg) "vuna: runtime error: continuation already resumed") else (((v_Base_dEffect_dCore_dstep (fuel - 1)) { f_Base_dEffect_dCore_dMSt_msFrames = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames; f_Base_dEffect_dCore_dMSt_msCtx = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Base_dEffect_dCore_dCtx_MkCtx (dtb__98, dtb__102, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx)))); f_Base_dEffect_dCore_dMSt_msUsed = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__100, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed)); f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext }) (dtb__99 dtb__101))))
  | C_Base_dEffect_dCore_dControl_MkPerform (dtb__103, dtb__104, dtb__105, dtb__106) -> (Obj.magic (match ((((v_Base_dEffect_dCore_dfindFrame (fuel - 1)) dtb__103) dtb__104) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "vuna: runtime error: unhandled effect"))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__107) -> (Obj.magic ((fun id -> (((v_Base_dEffect_dCore_dstep (fuel - 1)) { f_Base_dEffect_dCore_dMSt_msFrames = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames; f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = (id + 1) }) ((((v_Base_dEffect_dCore_dframeOpH dtb__107) dtb__105) (fun v krest -> (C_Base_dEffect_dCore_dControl_MkResume (dtb__107, dtb__106, id, (Obj.magic v), krest)))) (fun r -> (C_Base_dEffect_dCore_dControl_MkKDone (dtb__107, (Obj.magic r))))))) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dEffect_dCore_dControl_MkHandle (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> (Obj.magic ((fun frame -> (((v_Base_dEffect_dCore_dstep (fuel - 1)) { f_Base_dEffect_dCore_dMSt_msFrames = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (frame)); f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext }) ((dtb__112 (v_Base_dEffect_dCore_dtoObj 0)) (fun x -> (C_Base_dEffect_dCore_dControl_MkReturn (frame, (Obj.magic x))))))) (C_Base_dEffect_dCore_dFrame_MkFrame (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames))))
  | _ -> failwith "DT: impossible branch"
)))
# 476 "Base/Effect/Core.vuna"
and v_Base_dEffect_dCore_dfinish = (fun fuel st frame r -> (((v_Base_dEffect_dCore_dstep fuel) { f_Base_dEffect_dCore_dMSt_msFrames = (v_Base_dEffect_dCore_dframePrev (Obj.magic frame)); f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext }) ((v_Base_dEffect_dCore_dframeKOuter (Obj.magic frame)) (Obj.magic r))))

# 446 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunGo = (fun fuel st c -> (if (fuel <= 0) then ((fun msg -> failwith msg) "vuna: effect machine: fuel exhausted") else (((v_Base_dEffect_dCore_dstep fuel) (Obj.magic st)) (Obj.magic c))))

# 487 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dmachineRun = (fun c -> (((v_Base_dEffect_dCore_drunGo 10000000) { f_Base_dEffect_dCore_dMSt_msFrames = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Base_dEffect_dCore_dMSt_msCtx = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Base_dEffect_dCore_dMSt_msUsed = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Base_dEffect_dCore_dMSt_msNext = 0 }) (Obj.magic c)))
