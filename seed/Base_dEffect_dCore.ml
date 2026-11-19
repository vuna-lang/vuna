open Vuna_runtime
type t_Base_dEffect_dCore_dNamed = |
and t_Base_dEffect_dCore_dRow = C_Base_dEffect_dCore_dRow_Nil | C_Base_dEffect_dCore_dRow__x58__x58_ of (t_Base_dEffect_dCore_dRow)
and t_Base_dEffect_dCore_dMember = C_Base_dEffect_dCore_dMember_Here | C_Base_dEffect_dCore_dMember_There of (t_Base_dEffect_dCore_dMember)
and t_Base_dEffect_dCore_dEffUnit = C_Base_dEffect_dCore_dEffUnit_MkEffUnit
and 'a0 t_Base_dEffect_dCore_dEff = C_Base_dEffect_dCore_dEff_MkEff of ((t_Base_dEffect_dCore_dEffUnit) -> 'a0)
and 'a0 t_Base_dEffect_dCore_dScoped = C_Base_dEffect_dCore_dScoped_MkScoped of ((int) -> 'a0)
and t_Base_dEffect_dCore_dEffSig = C_Base_dEffect_dCore_dEffSig_MkEffSig
and ('a0, 'a1) t_Base_dEffect_dCore_dCont = C_Base_dEffect_dCore_dCont_MkCont of (('a0) -> 'a1)
and t_Base_dEffect_dCore_dCleanup = C_Base_dEffect_dCore_dCleanup_MkCleanup of ((int) -> int)
and 'a0 t_Base_dEffect_dCore_dRest = C_Base_dEffect_dCore_dRest_MkRestTail | C_Base_dEffect_dCore_dRest_MkRestCont of (('a0) -> 'a0 t_Base_dEffect_dCore_dControl)
and 'a0 t_Base_dEffect_dCore_dControl = C_Base_dEffect_dCore_dControl_MkDone of ('a0) | C_Base_dEffect_dCore_dControl_MkApply of (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) * ('a0) | C_Base_dEffect_dCore_dControl_MkPerform of (string) * (string) * ('a0) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) | C_Base_dEffect_dCore_dControl_MkHandle of (string) * (string) * (('a0) -> 'a0) * (('a0) -> (('a0) -> ('a0 t_Base_dEffect_dCore_dRest) -> 'a0 t_Base_dEffect_dCore_dControl) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> ((Obj.t t_Base_dEffect_dCore_dScoped) -> 'a0) -> 'a0 t_Base_dEffect_dCore_dControl) * (('a0) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> 'a0 t_Base_dEffect_dCore_dControl) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) | C_Base_dEffect_dCore_dControl_MkSelf of (('a0) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> 'a0 t_Base_dEffect_dCore_dControl) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) | C_Base_dEffect_dCore_dControl_MkPushCleanup of (t_Base_dEffect_dCore_dCleanup) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) | C_Base_dEffect_dCore_dControl_MkPopCleanup of (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) | C_Base_dEffect_dCore_dControl_MkReturn of ('a0 t_Base_dEffect_dCore_dFrame) * ('a0) | C_Base_dEffect_dCore_dControl_MkKDone of ('a0 t_Base_dEffect_dCore_dFrame) * ('a0) | C_Base_dEffect_dCore_dControl_MkResume of ('a0 t_Base_dEffect_dCore_dFrame) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) * (int) * (int) * ('a0) * ('a0 t_Base_dEffect_dCore_dRest)
and 'a0 t_Base_dEffect_dCore_dFrame = C_Base_dEffect_dCore_dFrame_MkFrame of (string) * (string) * (('a0) -> 'a0) * (('a0) -> (('a0) -> ('a0 t_Base_dEffect_dCore_dRest) -> 'a0 t_Base_dEffect_dCore_dControl) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> ((Obj.t t_Base_dEffect_dCore_dScoped) -> 'a0) -> 'a0 t_Base_dEffect_dCore_dControl) * (('a0) -> (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) -> 'a0 t_Base_dEffect_dCore_dControl) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) * ('a0 t_Base_dEffect_dCore_dFrame Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (int) * (int)
and 'a0 t_Base_dEffect_dCore_dCtx = C_Base_dEffect_dCore_dCtx_MkCtx of ('a0 t_Base_dEffect_dCore_dFrame) * (('a0) -> 'a0 t_Base_dEffect_dCore_dControl) * ('a0 t_Base_dEffect_dCore_dCtx Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (int)
and t_Base_dEffect_dCore_dUsed = C_Base_dEffect_dCore_dUsed_MkUsedSmall of ((int, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Base_dEffect_dCore_dUsed_MkUsedBig of ((int, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap)
and 'a0 t_Base_dEffect_dCore_dMSt = { f_Base_dEffect_dCore_dMSt_msFrames : 'a0 t_Base_dEffect_dCore_dFrame Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Base_dEffect_dCore_dMSt_msCtx : 'a0 t_Base_dEffect_dCore_dCtx Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Base_dEffect_dCore_dMSt_msUsed : t_Base_dEffect_dCore_dUsed; f_Base_dEffect_dCore_dMSt_msNext : int; f_Base_dEffect_dCore_dMSt_msFree : int Base_dData_dList.t_Base_dData_dList_dList; f_Base_dEffect_dCore_dMSt_msEpoch : int; f_Base_dEffect_dCore_dMSt_msCleanups : t_Base_dEffect_dCore_dCleanup Base_dData_dList.t_Base_dData_dList_dList; f_Base_dEffect_dCore_dMSt_msCleanDepth : int }

# 71 "Base/Effect/Core.vuna"
let v_Functor_uBase_uEffect_uCore_uEff_ur = (Base_dTrait_dFunctor.C_Dict_uBase_dTrait_dFunctor_dFunctor_Functor (((Obj.magic (fun f e -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__0) -> (f (dtb__0 u))
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t)))

# 79 "Base/Effect/Core.vuna"
let v_Monad_uBase_uEffect_uCore_uEff_ur = (Base_dTrait_dMonad.C_Dict_uBase_dTrait_dMonad_dMonad_Monad (((Obj.magic (fun e k -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__1) -> (match (k (dtb__1 u)) with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__2) -> (dtb__2 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t)))

# 89 "Base/Effect/Core.vuna"
let v_Applicative_uBase_uEffect_uCore_uEff_ur = (Base_dTrait_dApplicative.C_Dict_uBase_dTrait_dApplicative_dApplicative_Applicative (((Obj.magic (fun x -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (_u : t_Base_dEffect_dCore_dEffUnit) -> x))))) : Obj.t), ((Obj.magic (fun mf mx -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match mf with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__3) -> (match mx with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__4) -> ((dtb__3 u) (dtb__4 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t), ((Obj.magic (fun f ma mb -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match ma with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__5) -> (match mb with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__6) -> ((f (dtb__5 u)) (dtb__6 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t)))

# 58 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_ddefaultInstance = "default"

# 110 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_deffPrim = (fun f -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (_u : t_Base_dEffect_dCore_dEffUnit) -> (f 0)))))

# 114 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dweaken = (fun comp -> (match comp with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__7) -> (C_Base_dEffect_dCore_dEff_MkEff (dtb__7))
  | _ -> failwith "DT: impossible branch"
))

# 120 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunThunk = (fun e (_uarity3 : t_Base_dEffect_dCore_dEffUnit) -> ((match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
) _uarity3))

# 126 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunPure = (fun e -> ((v_Base_dEffect_dCore_drunThunk e) C_Base_dEffect_dCore_dEffUnit_MkEffUnit))

# 130 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunEff = (fun e -> ((v_Base_dEffect_dCore_drunThunk e) C_Base_dEffect_dCore_dEffUnit_MkEffUnit))

# 140 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dscope = (fun comp -> (C_Base_dEffect_dCore_dScoped_MkScoped ((fun (_u : int) -> ((v_Base_dEffect_dCore_drunThunk comp) C_Base_dEffect_dCore_dEffUnit_MkEffUnit)))))

# 146 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleScoped = (fun mc0 -> (match mc0 with
  | C_Base_dEffect_dCore_dScoped_MkScoped (dtb__9) -> (dtp_effect_self dtb__9)
  | _ -> failwith "DT: impossible branch"
))

# 150 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleSelf = (fun comp -> (v_Base_dEffect_dCore_dhandleScoped (v_Base_dEffect_dCore_dscope comp)))

# 155 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_drunMain = (fun e -> ((v_Base_dEffect_dCore_drunThunk e) C_Base_dEffect_dCore_dEffUnit_MkEffUnit))

# 161 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_djoinEff = (fun m -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match m with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__10) -> (match (dtb__10 u) with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__11) -> (dtb__11 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 174 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_djoinEffNilOuter = (fun m -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match m with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__12) -> (match (dtb__12 u) with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__13) -> (dtb__13 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 186 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dweakenRow = (fun (t : t_Base_dEffect_dCore_dRow) e -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__14) -> (dtb__14 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 195 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_draise = (fun mc0 -> (match mc0 with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__15) -> (C_Base_dEffect_dCore_dEff_MkEff (dtb__15))
  | _ -> failwith "DT: impossible branch"
))

# 200 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_draiseTo = (fun (r : t_Base_dEffect_dCore_dRow) e -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match e with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__16) -> (dtb__16 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 209 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dsendCore = (fun (key : string) (name : string) o -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (_u : t_Base_dEffect_dCore_dEffUnit) -> ((((fun key name v -> Obj.obj (Effect.perform (Perform (key, name, Obj.repr v)))) key) name) o)))))

# 219 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dsigFn = C_Base_dEffect_dCore_dEffSig_MkEffSig

# 233 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dperformCore = (fun (n : string) (key : string) o -> (((v_Base_dEffect_dCore_dsendCore key) n) (Obj.magic o)))

# 237 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleCore = (fun (key : string) (name : string) ret opH comp -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match comp with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__17) -> ((((((dtp_effect_handle key) name) ret) opH) dtb__17) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 246 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleCoreAt = (fun (key : string) (name : string) ret opH comp -> (C_Base_dEffect_dCore_dEff_MkEff ((fun (u : t_Base_dEffect_dCore_dEffUnit) -> (match comp with
  | C_Base_dEffect_dCore_dEff_MkEff (dtb__18) -> ((((((dtp_effect_handle key) name) ret) opH) dtb__18) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 265 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dtoObj = (fun x -> (Obj.repr x))

# 269 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dfromObj = (fun o -> (Obj.obj (Obj.magic o)))

# 278 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dresumeCont = (fun c x -> (match c with
  | C_Base_dEffect_dCore_dCont_MkCont (dtb__19) -> (dtb__19 x)
  | _ -> failwith "DT: impossible branch"
))

# 284 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dcontAdapter = (fun opH o k -> ((opH o) (C_Base_dEffect_dCore_dCont_MkCont (k))))

# 288 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleCoreLin = (fun (key : string) (name : string) ret opH comp -> (((((v_Base_dEffect_dCore_dhandleCore key) name) ret) (v_Base_dEffect_dCore_dcontAdapter opH)) comp))

# 297 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleWith = (fun (n : string) (key : string) comp ret opH -> (((((v_Base_dEffect_dCore_dhandleCore key) n) ret) (Obj.magic opH)) comp))

# 302 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dhandleWithAt = (fun (n : string) (key : string) comp ret opH -> (((((v_Base_dEffect_dCore_dhandleCoreAt key) n) ret) (Obj.magic opH)) comp))

# 310 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dmkCont = (fun k -> (C_Base_dEffect_dCore_dCont_MkCont (k)))

# 316 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dpushCleanup = (fun (th : (int) -> int) -> (v_Base_dEffect_dCore_deffPrim (fun (_u : int) -> (dtp_cleanup_push th))))

# 319 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dpopCleanup = (v_Base_dEffect_dCore_deffPrim (fun (_u : int) -> (dtp_cleanup_pop 0)))

# 322 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dbracket = (fun acquire release use -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) acquire) (fun res -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (v_Base_dEffect_dCore_dpushCleanup (fun (_u : int) -> (v_Base_dEffect_dCore_drunEff (release res))))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (use res)) (fun a -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dCore_dpopCleanup) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (release res)) (fun _u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure v_Applicative_uBase_uEffect_uCore_uEff_ur) a))))))))))))

# 333 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dfinally = (fun comp (cleanup : int t_Base_dEffect_dCore_dEff) -> (((v_Base_dEffect_dCore_dbracket ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)) (fun (_u : int) -> cleanup)) (fun (_u : int) -> comp)))

# 376 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dusedSmallLimit = 8

# 392 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_demptySt = { f_Base_dEffect_dCore_dMSt_msFrames = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Base_dEffect_dCore_dMSt_msCtx = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Base_dEffect_dCore_dMSt_msUsed = (C_Base_dEffect_dCore_dUsed_MkUsedSmall (Base_dData_dList.C_Base_dData_dList_dList_Nil)); f_Base_dEffect_dCore_dMSt_msNext = 0; f_Base_dEffect_dCore_dMSt_msFree = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Base_dEffect_dCore_dMSt_msEpoch = 0; f_Base_dEffect_dCore_dMSt_msCleanups = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Base_dEffect_dCore_dMSt_msCleanDepth = 0 }

# 395 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeKey = (fun f -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

# 400 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeName = (fun f -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__30
  | _ -> failwith "DT: impossible branch"
))

# 405 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeRet = (fun f _uarity2 -> ((match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> dtb__40
  | _ -> failwith "DT: impossible branch"
) _uarity2))

# 410 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeOpH = (fun f _uarity2 _uarity3 _uarity4 _uarity5 -> (((((match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> dtb__50
  | _ -> failwith "DT: impossible branch"
) _uarity2) _uarity3) _uarity4) _uarity5))

# 415 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeComp = (fun f _uarity2 _uarity3 -> (((match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64) -> dtb__60
  | _ -> failwith "DT: impossible branch"
) _uarity2) _uarity3))

# 420 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeKOuter = (fun f _uarity2 -> ((match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> dtb__70
  | _ -> failwith "DT: impossible branch"
) _uarity2))

# 425 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframePrev = (fun f -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> dtb__80
  | _ -> failwith "DT: impossible branch"
))

# 430 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeCleanDepth = (fun f -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

# 435 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dframeIdOf = (fun f -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

# 440 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dctxPrompt = (fun c -> (match c with
  | C_Base_dEffect_dCore_dCtx_MkCtx (dtb__101, dtb__102, dtb__103, dtb__104) -> dtb__101
  | _ -> failwith "DT: impossible branch"
))

# 445 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dctxKRest = (fun c _uarity2 -> ((match c with
  | C_Base_dEffect_dCore_dCtx_MkCtx (dtb__105, dtb__106, dtb__107, dtb__108) -> dtb__106
  | _ -> failwith "DT: impossible branch"
) _uarity2))

# 450 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dctxPrev = (fun c -> (match c with
  | C_Base_dEffect_dCore_dCtx_MkCtx (dtb__109, dtb__110, dtb__111, dtb__112) -> dtb__111
  | _ -> failwith "DT: impossible branch"
))

# 455 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dctxSlot = (fun c -> (match c with
  | C_Base_dEffect_dCore_dCtx_MkCtx (dtb__113, dtb__114, dtb__115, dtb__116) -> dtb__116
  | _ -> failwith "DT: impossible branch"
))

# 474 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dusedEpochSmall = (fun (fuel : int) (slot : int) (epoch : int) (xs : (int, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then false else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118) -> (match dtb__117 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__119; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__120 } -> (if (dtb__119 = slot) then (epoch <= dtb__120) else ((((v_Base_dEffect_dCore_dusedEpochSmall (fuel - 1)) slot) epoch) dtb__118))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)) xs)))

# 462 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dusedEpoch = (fun (fuel : int) (slot : int) (epoch : int) (used : t_Base_dEffect_dCore_dUsed) -> (if (fuel <= 0) then false else (match used with
  | C_Base_dEffect_dCore_dUsed_MkUsedSmall (dtb__121) -> ((((v_Base_dEffect_dCore_dusedEpochSmall (fuel - 1)) slot) epoch) dtb__121)
  | C_Base_dEffect_dCore_dUsed_MkUsedBig (dtb__122) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dInt.v_Hashable_uInt) Base_dData_dInt.v_Eq_uInt) slot) dtb__122) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__123) -> (epoch <= dtb__123)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 484 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dtailSlot = -1

# 500 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dmarkUsedSmall = (fun (fuel : int) (slot : int) (epoch : int) (xs : (int, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = slot; Base_dData_dPair.f_Base_dData_dPair_dPair_second = epoch }, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, dtb__125) -> (match dtb__124 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__126; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__127 } -> (if (dtb__126 = slot) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = slot; Base_dData_dPair.f_Base_dData_dPair_dPair_second = epoch }, dtb__125)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__126; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__127 }, ((((v_Base_dEffect_dCore_dmarkUsedSmall (fuel - 1)) slot) epoch) dtb__125))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = slot; Base_dData_dPair.f_Base_dData_dPair_dPair_second = epoch }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) xs)))

# 509 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dusedLen = (fun (fuel : int) (xs : (int, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then 0 else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__128, dtb__129) -> (1 + ((v_Base_dEffect_dCore_dusedLen (fuel - 1)) dtb__129))
  | _ -> failwith "DT: impossible branch"
)))

# 488 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dmarkUsed = (fun (fuel : int) (slot : int) (epoch : int) (used : t_Base_dEffect_dCore_dUsed) -> (if (fuel <= 0) then (C_Base_dEffect_dCore_dUsed_MkUsedSmall ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = slot; Base_dData_dPair.f_Base_dData_dPair_dPair_second = epoch }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (match used with
  | C_Base_dEffect_dCore_dUsed_MkUsedSmall (dtb__130) -> ((fun xs1 -> (if (((v_Base_dEffect_dCore_dusedLen (fuel - 1)) xs1) > v_Base_dEffect_dCore_dusedSmallLimit) then (C_Base_dEffect_dCore_dUsed_MkUsedBig (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) xs1))) else (C_Base_dEffect_dCore_dUsed_MkUsedSmall (xs1)))) ((((v_Base_dEffect_dCore_dmarkUsedSmall (fuel - 1)) slot) epoch) dtb__130))
  | C_Base_dEffect_dCore_dUsed_MkUsedBig (dtb__131) -> (C_Base_dEffect_dCore_dUsed_MkUsedBig (((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dInt.v_Hashable_uInt) slot) epoch) dtb__131)))
  | _ -> failwith "DT: impossible branch"
)))

# 519 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dprependFree = (fun (slot : int) (free : int Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (slot, free)))

# 522 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dsamePrompt = (fun a b -> ((v_Base_dEffect_dCore_dframeIdOf a) = (v_Base_dEffect_dCore_dframeIdOf b)))

# 525 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_ddepth = (fun (n : int) chain -> (if (n <= 0) then 0 else (match chain with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__132) -> (1 + ((v_Base_dEffect_dCore_ddepth (n - 1)) (v_Base_dEffect_dCore_dframePrev dtb__132)))
  | _ -> failwith "DT: impossible branch"
)))

# 534 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dinChain = (fun (fuel : int) f chain -> (if (fuel <= 0) then false else (match chain with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__133) -> (if ((v_Base_dEffect_dCore_dsamePrompt f) dtb__133) then true else (((v_Base_dEffect_dCore_dinChain (fuel - 1)) f) (v_Base_dEffect_dCore_dframePrev dtb__133)))
  | _ -> failwith "DT: impossible branch"
)))

# 544 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dreinstall = (fun f chain -> (match f with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (C_Base_dEffect_dCore_dFrame_MkFrame (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, chain, dtb__141, dtb__142))
  | _ -> failwith "DT: impossible branch"
))

# 549 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dreinstallIfMissing = (fun (fuel : int) f chain -> (if (((v_Base_dEffect_dCore_dinChain fuel) f) chain) then chain else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Base_dEffect_dCore_dreinstall f) chain)))))

# 552 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dfindFrame = (fun (fuel : int) (key : string) (name : string) chain -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match chain with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__143) -> (if (if ((v_Base_dEffect_dCore_dframeKey dtb__143) = key) then ((v_Base_dEffect_dCore_dframeName dtb__143) = name) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__143)) else ((((v_Base_dEffect_dCore_dfindFrame (fuel - 1)) key) name) (v_Base_dEffect_dCore_dframePrev dtb__143)))
  | _ -> failwith "DT: impossible branch"
)))

# 697 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dremoveFrame = (fun (fuel : int) f chain -> (if (fuel <= 0) then chain else (match chain with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__144) -> (if ((v_Base_dEffect_dCore_dsamePrompt dtb__144) f) then (v_Base_dEffect_dCore_dframePrev dtb__144) else (match dtb__144 with
  | C_Base_dEffect_dCore_dFrame_MkFrame (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Base_dEffect_dCore_dFrame_MkFrame (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, (((v_Base_dEffect_dCore_dremoveFrame (fuel - 1)) f) (v_Base_dEffect_dCore_dframePrev dtb__144)), dtb__152, dtb__153))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 719 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dcleanupRun = (fun (c : t_Base_dEffect_dCore_dCleanup) -> (match c with
  | C_Base_dEffect_dCore_dCleanup_MkCleanup (dtb__154) -> (dtb__154 0)
  | _ -> failwith "DT: impossible branch"
))

# 725 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_ddropCleanups = (fun (fuel : int) (depth : int) (cs : t_Base_dEffect_dCore_dCleanup Base_dData_dList.t_Base_dData_dList_dList) (d : int) -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = cs; Base_dData_dPair.f_Base_dData_dPair_dPair_second = d } else (if (d <= depth) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = cs; Base_dData_dPair.f_Base_dData_dPair_dPair_second = d } else (match cs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = cs; Base_dData_dPair.f_Base_dData_dPair_dPair_second = d }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__155, dtb__156) -> ((fun _u -> ((((v_Base_dEffect_dCore_ddropCleanups (fuel - 1)) depth) dtb__156) (d - 1))) (v_Base_dEffect_dCore_dcleanupRun dtb__155))
  | _ -> failwith "DT: impossible branch"
))))

# 711 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dfinish = (fun (fuel : int) st frame r -> (match ((((v_Base_dEffect_dCore_ddropCleanups fuel) (v_Base_dEffect_dCore_dframeCleanDepth (Obj.magic frame))) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__157; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__158 } -> (Obj.magic { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Base_dEffect_dCore_dMSt_msFrames = (((v_Base_dEffect_dCore_dremoveFrame fuel) (Obj.magic frame)) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames); f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext; f_Base_dEffect_dCore_dMSt_msFree = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree; f_Base_dEffect_dCore_dMSt_msEpoch = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch; f_Base_dEffect_dCore_dMSt_msCleanups = dtb__157; f_Base_dEffect_dCore_dMSt_msCleanDepth = dtb__158 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Base_dEffect_dCore_dframeKOuter (Obj.magic frame)) (Obj.magic r)) })
  | _ -> failwith "DT: impossible branch"
))

# 683 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dunwind = (fun (fuel : int) st frame r -> (match ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__159) -> (Obj.magic (if ((v_Base_dEffect_dCore_dsamePrompt (v_Base_dEffect_dCore_dctxPrompt dtb__159)) (Obj.magic frame)) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Base_dEffect_dCore_dMSt_msFrames = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames; f_Base_dEffect_dCore_dMSt_msCtx = (v_Base_dEffect_dCore_dctxPrev dtb__159); f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext; f_Base_dEffect_dCore_dMSt_msFree = ((v_Base_dEffect_dCore_dprependFree (v_Base_dEffect_dCore_dctxSlot dtb__159)) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree); f_Base_dEffect_dCore_dMSt_msEpoch = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch; f_Base_dEffect_dCore_dMSt_msCleanups = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups; f_Base_dEffect_dCore_dMSt_msCleanDepth = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Base_dEffect_dCore_dctxKRest dtb__159) (Obj.magic r)) } else ((((v_Base_dEffect_dCore_dfinish fuel) (Obj.magic st)) (Obj.magic frame)) (Obj.magic r))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Obj.magic ((((v_Base_dEffect_dCore_dfinish fuel) (Obj.magic st)) (Obj.magic frame)) (Obj.magic r)))
  | _ -> failwith "DT: impossible branch"
))

# 565 "Base/Effect/Core.vuna"
let rec v_Base_dEffect_dCore_dmachineScoped = (fun (fuel : int) st f sc -> (match (Obj.magic sc) with
  | C_Base_dEffect_dCore_dScoped_MkScoped (dtb__160) -> (Obj.magic ((fun frame -> (((v_Base_dEffect_dCore_drunGo (fuel - 1)) { f_Base_dEffect_dCore_dMSt_msFrames = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (frame)); f_Base_dEffect_dCore_dMSt_msCtx = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = (((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext + 1); f_Base_dEffect_dCore_dMSt_msFree = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree; f_Base_dEffect_dCore_dMSt_msEpoch = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch; f_Base_dEffect_dCore_dMSt_msCleanups = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups; f_Base_dEffect_dCore_dMSt_msCleanDepth = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth }) ((dtb__160 0) (fun x -> (C_Base_dEffect_dCore_dControl_MkReturn (frame, (Obj.magic x))))))) (C_Base_dEffect_dCore_dFrame_MkFrame ((v_Base_dEffect_dCore_dframeKey (Obj.magic f)), (v_Base_dEffect_dCore_dframeName (Obj.magic f)), (v_Base_dEffect_dCore_dframeRet (Obj.magic f)), (v_Base_dEffect_dCore_dframeOpH (Obj.magic f)), (fun _u -> (dtb__160 0)), (fun x -> (C_Base_dEffect_dCore_dControl_MkDone ((Obj.magic x)))), (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Obj.magic f))), ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext))))
  | _ -> failwith "DT: impossible branch"
))
# 589 "Base/Effect/Core.vuna"
and v_Base_dEffect_dCore_drunGo = (fun (fuel : int) st c -> (if (fuel <= 0) then ((fun msg -> failwith msg) "effect machine: fuel exhausted") else (match (Obj.magic c) with
  | C_Base_dEffect_dCore_dControl_MkDone (dtb__161) -> (Obj.magic dtb__161)
  | _ -> (Obj.magic (match (((v_Base_dEffect_dCore_dstep fuel) (Obj.magic st)) (Obj.magic c)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__162; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__163 } -> (Obj.magic (((v_Base_dEffect_dCore_drunGo (fuel - 1)) dtb__162) dtb__163))
  | _ -> failwith "DT: impossible branch"
))
)))
# 600 "Base/Effect/Core.vuna"
and v_Base_dEffect_dCore_dstep = (fun (fuel : int) st c -> (match (Obj.magic c) with
  | C_Base_dEffect_dCore_dControl_MkDone (dtb__164) -> (Obj.magic { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Obj.magic st); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Base_dEffect_dCore_dControl_MkDone (dtb__164)) })
  | C_Base_dEffect_dCore_dControl_MkApply (dtb__165, dtb__166) -> (Obj.magic { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Obj.magic st); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__165 dtb__166) })
  | C_Base_dEffect_dCore_dControl_MkPushCleanup (dtb__167, dtb__168) -> (Obj.magic { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Base_dEffect_dCore_dMSt_msFrames = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames; f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext; f_Base_dEffect_dCore_dMSt_msFree = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree; f_Base_dEffect_dCore_dMSt_msEpoch = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch; f_Base_dEffect_dCore_dMSt_msCleanups = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__167, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups)); f_Base_dEffect_dCore_dMSt_msCleanDepth = (((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth + 1) }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__168 (v_Base_dEffect_dCore_dtoObj 0)) })
  | C_Base_dEffect_dCore_dControl_MkPopCleanup (dtb__169) -> (Obj.magic (match ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Obj.magic { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Obj.magic st); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__169 (v_Base_dEffect_dCore_dtoObj 0)) })
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__170, dtb__171) -> (Obj.magic { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Base_dEffect_dCore_dMSt_msFrames = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames; f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext; f_Base_dEffect_dCore_dMSt_msFree = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree; f_Base_dEffect_dCore_dMSt_msEpoch = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch; f_Base_dEffect_dCore_dMSt_msCleanups = dtb__171; f_Base_dEffect_dCore_dMSt_msCleanDepth = (((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth - 1) }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__169 (v_Base_dEffect_dCore_dtoObj 0)) })
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dEffect_dCore_dControl_MkKDone (dtb__172, dtb__173) -> (Obj.magic ((((v_Base_dEffect_dCore_dunwind fuel) (Obj.magic st)) dtb__172) dtb__173))
  | C_Base_dEffect_dCore_dControl_MkReturn (dtb__174, dtb__175) -> (Obj.magic ((((v_Base_dEffect_dCore_dunwind fuel) (Obj.magic st)) dtb__174) ((v_Base_dEffect_dCore_dframeRet dtb__174) dtb__175)))
  | C_Base_dEffect_dCore_dControl_MkResume (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> (Obj.magic (match dtb__181 with
  | C_Base_dEffect_dCore_dRest_MkRestTail -> (Obj.magic (if ((((v_Base_dEffect_dCore_dusedEpoch (fuel - 1)) v_Base_dEffect_dCore_dtailSlot) dtb__179) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Base_dEffect_dCore_dMSt_msFrames = (((v_Base_dEffect_dCore_dreinstallIfMissing (fuel - 1)) dtb__176) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames); f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((((v_Base_dEffect_dCore_dmarkUsed (fuel - 1)) v_Base_dEffect_dCore_dtailSlot) dtb__179) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed); f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext; f_Base_dEffect_dCore_dMSt_msFree = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree; f_Base_dEffect_dCore_dMSt_msEpoch = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch; f_Base_dEffect_dCore_dMSt_msCleanups = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups; f_Base_dEffect_dCore_dMSt_msCleanDepth = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__177 dtb__180) }))
  | C_Base_dEffect_dCore_dRest_MkRestCont (dtb__182) -> (Obj.magic (if ((((v_Base_dEffect_dCore_dusedEpoch (fuel - 1)) dtb__178) dtb__179) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Base_dEffect_dCore_dMSt_msFrames = (((v_Base_dEffect_dCore_dreinstallIfMissing (fuel - 1)) dtb__176) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames); f_Base_dEffect_dCore_dMSt_msCtx = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((C_Base_dEffect_dCore_dCtx_MkCtx (dtb__176, dtb__182, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx, dtb__178)))); f_Base_dEffect_dCore_dMSt_msUsed = ((((v_Base_dEffect_dCore_dmarkUsed (fuel - 1)) dtb__178) dtb__179) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed); f_Base_dEffect_dCore_dMSt_msNext = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext; f_Base_dEffect_dCore_dMSt_msFree = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree; f_Base_dEffect_dCore_dMSt_msEpoch = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch; f_Base_dEffect_dCore_dMSt_msCleanups = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups; f_Base_dEffect_dCore_dMSt_msCleanDepth = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__177 dtb__180) }))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dEffect_dCore_dControl_MkPerform (dtb__183, dtb__184, dtb__185, dtb__186) -> (Obj.magic (match ((((v_Base_dEffect_dCore_dfindFrame (fuel - 1)) dtb__183) dtb__184) ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "unhandled effect"))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__187) -> (Obj.magic ((fun slot -> ((fun free -> ((fun next -> ((fun epoch -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Base_dEffect_dCore_dMSt_msFrames = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames; f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = next; f_Base_dEffect_dCore_dMSt_msFree = free; f_Base_dEffect_dCore_dMSt_msEpoch = epoch; f_Base_dEffect_dCore_dMSt_msCleanups = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups; f_Base_dEffect_dCore_dMSt_msCleanDepth = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((((v_Base_dEffect_dCore_dframeOpH dtb__187) dtb__185) (fun v rest -> (C_Base_dEffect_dCore_dControl_MkResume (dtb__187, dtb__186, slot, epoch, (Obj.magic v), rest)))) (fun r -> (C_Base_dEffect_dCore_dControl_MkKDone (dtb__187, (Obj.magic r))))) (fun th -> ((((v_Base_dEffect_dCore_dmachineScoped (fuel - 1)) (Obj.magic st)) dtb__187) th))) }) (((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch + 1))) (match ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__188, dtb__189) -> ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext + 1)
  | _ -> failwith "DT: impossible branch"
))) (match ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__190, dtb__191) -> dtb__191
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree
  | _ -> failwith "DT: impossible branch"
))) (match ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, dtb__193) -> dtb__192
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dEffect_dCore_dControl_MkSelf (dtb__194, dtb__195) -> (Obj.magic (match ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "handleScoped outside handler"))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__196) -> (Obj.magic ((fun frame -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Base_dEffect_dCore_dMSt_msFrames = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (frame)); f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = (((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext + 1); f_Base_dEffect_dCore_dMSt_msFree = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree; f_Base_dEffect_dCore_dMSt_msEpoch = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch; f_Base_dEffect_dCore_dMSt_msCleanups = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups; f_Base_dEffect_dCore_dMSt_msCleanDepth = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((dtb__194 (v_Base_dEffect_dCore_dtoObj 0)) (fun x -> (C_Base_dEffect_dCore_dControl_MkReturn (frame, (Obj.magic x))))) }) (C_Base_dEffect_dCore_dFrame_MkFrame ((v_Base_dEffect_dCore_dframeKey dtb__196), (v_Base_dEffect_dCore_dframeName dtb__196), (v_Base_dEffect_dCore_dframeRet dtb__196), (v_Base_dEffect_dCore_dframeOpH dtb__196), dtb__194, dtb__195, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext))))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dEffect_dCore_dControl_MkHandle (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> (Obj.magic ((fun frame -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Base_dEffect_dCore_dMSt_msFrames = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (frame)); f_Base_dEffect_dCore_dMSt_msCtx = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCtx; f_Base_dEffect_dCore_dMSt_msUsed = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msUsed; f_Base_dEffect_dCore_dMSt_msNext = (((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext + 1); f_Base_dEffect_dCore_dMSt_msFree = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFree; f_Base_dEffect_dCore_dMSt_msEpoch = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msEpoch; f_Base_dEffect_dCore_dMSt_msCleanups = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanups; f_Base_dEffect_dCore_dMSt_msCleanDepth = ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((dtb__201 (v_Base_dEffect_dCore_dtoObj 0)) (fun x -> (C_Base_dEffect_dCore_dControl_MkReturn (frame, (Obj.magic x))))) }) (C_Base_dEffect_dCore_dFrame_MkFrame (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msFrames, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msCleanDepth, ((Obj.magic st)).f_Base_dEffect_dCore_dMSt_msNext))))
  | _ -> failwith "DT: impossible branch"
))

# 740 "Base/Effect/Core.vuna"
let v_Base_dEffect_dCore_dmachineRun = (fun c -> (((v_Base_dEffect_dCore_drunGo 1000000000) v_Base_dEffect_dCore_demptySt) (Obj.magic c)))
