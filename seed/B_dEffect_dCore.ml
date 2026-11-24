open Vuna_runtime
type t_Named = |
and t_Row = C_Row_Nil | C_Row__x58__x58_ of (t_Row)
and t_Member = C_Member_Here | C_Member_There of (t_Member)
and t_EffUnit = C_EffUnit_MkEffUnit
and 'a0 t_Eff = C_Eff_MkEff of ((t_EffUnit) -> 'a0)
and 'a0 t_Scoped = C_Scoped_MkScoped of ((int) -> 'a0)
and t_EffSig = C_EffSig_MkEffSig
and ('a0, 'a1) t_Cont = C_Cont_MkCont of (('a0) -> 'a1)
and t_Cleanup = C_Cleanup_MkCleanup of ((int) -> int)
and 'a0 t_Rest = C_Rest_MkRestTail | C_Rest_MkRestCont of (('a0) -> 'a0 t_Control)
and 'a0 t_Control = C_Control_MkDone of ('a0) | C_Control_MkApply of (('a0) -> 'a0 t_Control) * ('a0) | C_Control_MkPerform of (int) * (int) * ('a0) * (('a0) -> 'a0 t_Control) | C_Control_MkHandle of (int) * (int) * (('a0) -> 'a0) * (('a0) -> (('a0) -> ('a0 t_Rest) -> 'a0 t_Control) -> (('a0) -> 'a0 t_Control) -> ((Obj.t t_Scoped) -> 'a0) -> 'a0 t_Control) * (('a0) -> (('a0) -> 'a0 t_Control) -> 'a0 t_Control) * (('a0) -> 'a0 t_Control) | C_Control_MkSelf of (('a0) -> (('a0) -> 'a0 t_Control) -> 'a0 t_Control) * (('a0) -> 'a0 t_Control) | C_Control_MkPushCleanup of (t_Cleanup) * (('a0) -> 'a0 t_Control) | C_Control_MkPopCleanup of (('a0) -> 'a0 t_Control) | C_Control_MkReturn of ('a0 t_Frame) * ('a0) | C_Control_MkKDone of ('a0 t_Frame) * ('a0) | C_Control_MkResume of ('a0 t_Frame) * (('a0) -> 'a0 t_Control) * (int) * (int) * ('a0) * ('a0 t_Rest)
and 'a0 t_Frame = C_Frame_MkFrame of (int) * (int) * (('a0) -> 'a0) * (('a0) -> (('a0) -> ('a0 t_Rest) -> 'a0 t_Control) -> (('a0) -> 'a0 t_Control) -> ((Obj.t t_Scoped) -> 'a0) -> 'a0 t_Control) * (('a0) -> (('a0) -> 'a0 t_Control) -> 'a0 t_Control) * (('a0) -> 'a0 t_Control) * ('a0 t_Frame B_dData_dMaybe.t_Maybe) * (int) * (int)
and 'a0 t_Ctx = C_Ctx_MkCtx of ('a0 t_Frame) * (('a0) -> 'a0 t_Control) * ('a0 t_Ctx B_dData_dMaybe.t_Maybe) * (int)
and t_Used = C_Used_MkUsedSmall of ((int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_Used_MkUsedBig of ((int, int) B_dContainer_dHashMap.t_HashMap)
and 'a0 t_MSt = { f_MSt_msFrames : 'a0 t_Frame B_dData_dMaybe.t_Maybe; f_MSt_msCtx : 'a0 t_Ctx B_dData_dMaybe.t_Maybe; f_MSt_msUsed : t_Used; f_MSt_msNext : int; f_MSt_msFree : int B_dData_dList.t_List; f_MSt_msEpoch : int; f_MSt_msCleanups : t_Cleanup B_dData_dList.t_List; f_MSt_msCleanDepth : int }

# 71 "Base/Effect/Core.vuna"
let v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun f e -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match e with
  | C_Eff_MkEff (dtb__0) -> (f (dtb__0 u))
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t)))

# 79 "Base/Effect/Core.vuna"
let v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun e k -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match e with
  | C_Eff_MkEff (dtb__1) -> (match (k (dtb__1 u)) with
  | C_Eff_MkEff (dtb__2) -> (dtb__2 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t)))

# 89 "Base/Effect/Core.vuna"
let v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun x -> (C_Eff_MkEff ((fun (_u : t_EffUnit) -> x))))) : Obj.t), ((Obj.magic (fun mf mx -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match mf with
  | C_Eff_MkEff (dtb__3) -> (match mx with
  | C_Eff_MkEff (dtb__4) -> ((dtb__3 u) (dtb__4 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t), ((Obj.magic (fun f ma mb -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match ma with
  | C_Eff_MkEff (dtb__5) -> (match mb with
  | C_Eff_MkEff (dtb__6) -> ((f (dtb__5 u)) (dtb__6 u))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t)))

# 58 "Base/Effect/Core.vuna"
let v_defaultInstance = "default"

# 110 "Base/Effect/Core.vuna"
let v_effPrim = (fun f -> (C_Eff_MkEff ((fun (_u : t_EffUnit) -> (f 0)))))

# 114 "Base/Effect/Core.vuna"
let v_weaken = (fun comp -> (match comp with
  | C_Eff_MkEff (dtb__7) -> (C_Eff_MkEff (dtb__7))
  | _ -> failwith "DT: impossible branch"
))

# 120 "Base/Effect/Core.vuna"
let v_runThunk = (fun e -> (match e with
  | C_Eff_MkEff (dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 126 "Base/Effect/Core.vuna"
let v_runPure = (fun e -> ((v_runThunk e) C_EffUnit_MkEffUnit))

# 130 "Base/Effect/Core.vuna"
let v_runEff = (fun e -> ((v_runThunk e) C_EffUnit_MkEffUnit))

# 140 "Base/Effect/Core.vuna"
let v_scope = (fun comp -> (C_Scoped_MkScoped ((fun (_u : int) -> ((v_runThunk comp) C_EffUnit_MkEffUnit)))))

# 146 "Base/Effect/Core.vuna"
let v_handleScoped = (fun mc0 -> (match mc0 with
  | C_Scoped_MkScoped (dtb__9) -> (dtp_effect_self dtb__9)
  | _ -> failwith "DT: impossible branch"
))

# 150 "Base/Effect/Core.vuna"
let v_handleSelf = (fun comp -> (v_handleScoped (v_scope comp)))

# 155 "Base/Effect/Core.vuna"
let v_runMain = (fun e -> ((v_runThunk e) C_EffUnit_MkEffUnit))

# 161 "Base/Effect/Core.vuna"
let v_joinEff = (fun m -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match m with
  | C_Eff_MkEff (dtb__10) -> (match (dtb__10 u) with
  | C_Eff_MkEff (dtb__11) -> (dtb__11 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 174 "Base/Effect/Core.vuna"
let v_joinEffNilOuter = (fun m -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match m with
  | C_Eff_MkEff (dtb__12) -> (match (dtb__12 u) with
  | C_Eff_MkEff (dtb__13) -> (dtb__13 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 187 "Base/Effect/Core.vuna"
let v_joinEffNilInner = (fun m -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match m with
  | C_Eff_MkEff (dtb__14) -> (match (dtb__14 u) with
  | C_Eff_MkEff (dtb__15) -> (dtb__15 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 199 "Base/Effect/Core.vuna"
let v_dropEffHead = (fun comp -> (match comp with
  | C_Eff_MkEff (dtb__16) -> (C_Eff_MkEff (dtb__16))
  | _ -> failwith "DT: impossible branch"
))

# 206 "Base/Effect/Core.vuna"
let v_weakenRow = (fun (t : t_Row) e -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match e with
  | C_Eff_MkEff (dtb__17) -> (dtb__17 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 215 "Base/Effect/Core.vuna"
let v_raise = (fun mc0 -> (match mc0 with
  | C_Eff_MkEff (dtb__18) -> (C_Eff_MkEff (dtb__18))
  | _ -> failwith "DT: impossible branch"
))

# 220 "Base/Effect/Core.vuna"
let v_raiseTo = (fun (r : t_Row) e -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match e with
  | C_Eff_MkEff (dtb__19) -> (dtb__19 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 233 "Base/Effect/Core.vuna"
let v_sendCoreId = (fun (key : string) (name : string) (keyId : int) (nameId : int) o -> (C_Eff_MkEff ((fun (_u : t_EffUnit) -> ((((((fun key name kid nid v -> Obj.obj (Effect.perform (Perform (kid, nid, key, name, Obj.repr v)))) key) name) keyId) nameId) o)))))

# 229 "Base/Effect/Core.vuna"
let v_sendCore = (fun (key : string) (name : string) o -> (((((v_sendCoreId key) name) (dtp_effectId key)) (dtp_effectId name)) o))

# 243 "Base/Effect/Core.vuna"
let v_sigFn = C_EffSig_MkEffSig

# 261 "Base/Effect/Core.vuna"
let v_performCoreId = (fun (n : string) (key : string) (nId : int) (keyId : int) o -> (((((v_sendCoreId key) n) keyId) nId) (Obj.magic o)))

# 257 "Base/Effect/Core.vuna"
let v_performCore = (fun (n : string) (key : string) o -> (((((v_performCoreId n) key) (dtp_effectId n)) (dtp_effectId key)) (Obj.magic o)))

# 270 "Base/Effect/Core.vuna"
let v_handleCoreId = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match comp with
  | C_Eff_MkEff (dtb__20) -> ((((((((dtp_effect_handle_id key) name) keyId) nameId) ret) opH) dtb__20) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 265 "Base/Effect/Core.vuna"
let v_handleCore = (fun (key : string) (name : string) ret opH comp -> (((((((v_handleCoreId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp))

# 284 "Base/Effect/Core.vuna"
let v_handleCoreAtId = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match comp with
  | C_Eff_MkEff (dtb__21) -> ((((((((dtp_effect_handle_id key) name) keyId) nameId) ret) opH) dtb__21) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 279 "Base/Effect/Core.vuna"
let v_handleCoreAt = (fun (key : string) (name : string) ret opH comp -> (((((((v_handleCoreAtId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp))

# 303 "Base/Effect/Core.vuna"
let v_toObj = (fun x -> (Obj.repr x))

# 307 "Base/Effect/Core.vuna"
let v_fromObj = (fun o -> (Obj.obj (Obj.magic o)))

# 316 "Base/Effect/Core.vuna"
let v_resumeCont = (fun c x -> (match c with
  | C_Cont_MkCont (dtb__22) -> (dtb__22 x)
  | _ -> failwith "DT: impossible branch"
))

# 322 "Base/Effect/Core.vuna"
let v_contAdapter = (fun opH o k -> ((opH o) (C_Cont_MkCont (k))))

# 331 "Base/Effect/Core.vuna"
let v_handleCoreLinId = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp -> (((((((v_handleCoreId key) name) keyId) nameId) ret) (v_contAdapter opH)) comp))

# 326 "Base/Effect/Core.vuna"
let v_handleCoreLin = (fun (key : string) (name : string) ret opH comp -> (((((((v_handleCoreLinId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp))

# 345 "Base/Effect/Core.vuna"
let v_handleWithId = (fun (n : string) (key : string) (nId : int) (keyId : int) comp ret opH -> (((((((v_handleCoreId key) n) keyId) nId) ret) (Obj.magic opH)) comp))

# 341 "Base/Effect/Core.vuna"
let v_handleWith = (fun (n : string) (key : string) comp ret opH -> (((((((v_handleWithId n) key) (dtp_effectId n)) (dtp_effectId key)) comp) ret) (Obj.magic opH)))

# 356 "Base/Effect/Core.vuna"
let v_handleWithAtId = (fun (n : string) (key : string) (nId : int) (keyId : int) comp ret opH -> (((((((v_handleCoreAtId key) n) keyId) nId) ret) (Obj.magic opH)) comp))

# 351 "Base/Effect/Core.vuna"
let v_handleWithAt = (fun (n : string) (key : string) comp ret opH -> (((((((v_handleWithAtId n) key) (dtp_effectId n)) (dtp_effectId key)) comp) ret) (Obj.magic opH)))

# 365 "Base/Effect/Core.vuna"
let v_mkCont = (fun k -> (C_Cont_MkCont (k)))

# 371 "Base/Effect/Core.vuna"
let v_pushCleanup = (fun (th : (int) -> int) -> (v_effPrim (fun (_u : int) -> (dtp_cleanup_push th))))

# 374 "Base/Effect/Core.vuna"
let v_popCleanup = (v_effPrim (fun (_u : int) -> (dtp_cleanup_pop 0)))

# 377 "Base/Effect/Core.vuna"
let v_bracket = (fun acquire release use -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) acquire) (fun res -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_pushCleanup (fun (_u : int) -> (v_runEff (release res))))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (use res)) (fun a -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_popCleanup) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (release res)) (fun _u -> ((B_dTrait_dApplicative.v_pure v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))))))))))))

# 388 "Base/Effect/Core.vuna"
let v_finally = (fun comp (cleanup : int t_Eff) -> (((v_bracket ((B_dTrait_dApplicative.v_pure v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)) (fun (_u : int) -> cleanup)) (fun (_u : int) -> comp)))

# 431 "Base/Effect/Core.vuna"
let v_usedSmallLimit = 8

# 447 "Base/Effect/Core.vuna"
let v_emptySt = { f_MSt_msFrames = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msCtx = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msUsed = (C_Used_MkUsedSmall (B_dData_dList.C_List_Nil)); f_MSt_msNext = 0; f_MSt_msFree = B_dData_dList.C_List_Nil; f_MSt_msEpoch = 0; f_MSt_msCleanups = B_dData_dList.C_List_Nil; f_MSt_msCleanDepth = 0 }

# 450 "Base/Effect/Core.vuna"
let v_frameKey = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__23
  | _ -> failwith "DT: impossible branch"
))

# 453 "Base/Effect/Core.vuna"
let v_frameName = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

# 456 "Base/Effect/Core.vuna"
let v_frameRet = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> dtb__43
  | _ -> failwith "DT: impossible branch"
))

# 459 "Base/Effect/Core.vuna"
let v_frameOpH = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> dtb__53
  | _ -> failwith "DT: impossible branch"
))

# 462 "Base/Effect/Core.vuna"
let v_frameComp = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> dtb__63
  | _ -> failwith "DT: impossible branch"
))

# 465 "Base/Effect/Core.vuna"
let v_frameKOuter = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> dtb__73
  | _ -> failwith "DT: impossible branch"
))

# 468 "Base/Effect/Core.vuna"
let v_framePrev = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

# 471 "Base/Effect/Core.vuna"
let v_frameCleanDepth = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> dtb__93
  | _ -> failwith "DT: impossible branch"
))

# 474 "Base/Effect/Core.vuna"
let v_frameIdOf = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103) -> dtb__103
  | _ -> failwith "DT: impossible branch"
))

# 477 "Base/Effect/Core.vuna"
let v_ctxPrompt = (fun mc0 -> (match mc0 with
  | C_Ctx_MkCtx (dtb__104, dtb__105, dtb__106, dtb__107) -> dtb__104
  | _ -> failwith "DT: impossible branch"
))

# 480 "Base/Effect/Core.vuna"
let v_ctxKRest = (fun mc0 -> (match mc0 with
  | C_Ctx_MkCtx (dtb__108, dtb__109, dtb__110, dtb__111) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

# 483 "Base/Effect/Core.vuna"
let v_ctxPrev = (fun mc0 -> (match mc0 with
  | C_Ctx_MkCtx (dtb__112, dtb__113, dtb__114, dtb__115) -> dtb__114
  | _ -> failwith "DT: impossible branch"
))

# 486 "Base/Effect/Core.vuna"
let v_ctxSlot = (fun mc0 -> (match mc0 with
  | C_Ctx_MkCtx (dtb__116, dtb__117, dtb__118, dtb__119) -> dtb__119
  | _ -> failwith "DT: impossible branch"
))

# 503 "Base/Effect/Core.vuna"
let rec v_usedEpochSmall = (fun (fuel : int) (slot : int) (epoch : int) (xs : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then false else (let nd_uscrut4 = xs in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | { B_dData_dPair.f_Pair_first = dtb__122; B_dData_dPair.f_Pair_second = dtb__123 } -> (if (dtb__122 = slot) then (epoch <= dtb__123) else ((((v_usedEpochSmall (fuel - 1)) slot) epoch) dtb__121))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

# 491 "Base/Effect/Core.vuna"
let v_usedEpoch = (fun (fuel : int) (slot : int) (epoch : int) (used : t_Used) -> (if (fuel <= 0) then false else (match used with
  | C_Used_MkUsedSmall (dtb__124) -> ((((v_usedEpochSmall (fuel - 1)) slot) epoch) dtb__124)
  | C_Used_MkUsedBig (dtb__125) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) slot) dtb__125) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> (epoch <= dtb__126)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 513 "Base/Effect/Core.vuna"
let v_tailSlot = (-1)

# 529 "Base/Effect/Core.vuna"
let rec v_markUsedSmall = (fun (fuel : int) (slot : int) (epoch : int) (xs : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, B_dData_dList.C_List_Nil)) else (let nd_uscrut4 = xs in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (match dtb__127 with
  | { B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = dtb__130 } -> (if (dtb__129 = slot) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, dtb__128)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = dtb__130 }, ((((v_markUsedSmall (fuel - 1)) slot) epoch) dtb__128))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))

# 538 "Base/Effect/Core.vuna"
let rec v_usedLen = (fun (fuel : int) (xs : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then 0 else (match xs with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (1 + ((v_usedLen (fuel - 1)) dtb__132))
  | _ -> failwith "DT: impossible branch"
)))

# 517 "Base/Effect/Core.vuna"
let v_markUsed = (fun (fuel : int) (slot : int) (epoch : int) (used : t_Used) -> (if (fuel <= 0) then (C_Used_MkUsedSmall ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, B_dData_dList.C_List_Nil)))) else (match used with
  | C_Used_MkUsedSmall (dtb__133) -> (let xs1 = ((((v_markUsedSmall (fuel - 1)) slot) epoch) dtb__133) in (if (((v_usedLen (fuel - 1)) xs1) > v_usedSmallLimit) then (C_Used_MkUsedBig ((((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) xs1))) else (C_Used_MkUsedSmall (xs1))))
  | C_Used_MkUsedBig (dtb__134) -> (C_Used_MkUsedBig ((((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) slot) epoch) dtb__134)))
  | _ -> failwith "DT: impossible branch"
)))

# 548 "Base/Effect/Core.vuna"
let v_prependFree = (fun (slot : int) (free : int B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ (slot, free)))

# 551 "Base/Effect/Core.vuna"
let v_samePrompt = (fun a b -> ((v_frameIdOf a) = (v_frameIdOf b)))

# 554 "Base/Effect/Core.vuna"
let rec v_depth = (fun (n : int) chain -> (if (n <= 0) then 0 else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (1 + ((v_depth (n - 1)) (v_framePrev dtb__135)))
  | _ -> failwith "DT: impossible branch"
)))

# 563 "Base/Effect/Core.vuna"
let rec v_inChain = (fun (fuel : int) f chain -> (if (fuel <= 0) then false else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (if ((v_samePrompt f) dtb__136) then true else (((v_inChain (fuel - 1)) f) (v_framePrev dtb__136)))
  | _ -> failwith "DT: impossible branch"
)))

# 573 "Base/Effect/Core.vuna"
let v_reinstall = (fun mc0 mc1 -> (match mc0 with
  | C_Frame_MkFrame (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> (C_Frame_MkFrame (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, mc1, dtb__144, dtb__145))
  | _ -> failwith "DT: impossible branch"
))

# 577 "Base/Effect/Core.vuna"
let v_reinstallIfMissing = (fun (fuel : int) f chain -> (if (((v_inChain fuel) f) chain) then chain else (B_dData_dMaybe.C_Maybe_Just (((v_reinstall f) chain)))))

# 580 "Base/Effect/Core.vuna"
let rec v_findFrame = (fun (fuel : int) (key : int) (name : int) chain -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (if (if ((v_frameKey dtb__146) = key) then ((v_frameName dtb__146) = name) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb__146)) else ((((v_findFrame (fuel - 1)) key) name) (v_framePrev dtb__146)))
  | _ -> failwith "DT: impossible branch"
)))

# 765 "Base/Effect/Core.vuna"
let rec v_removeFrame = (fun (fuel : int) f chain -> (if (fuel <= 0) then chain else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (if ((v_samePrompt dtb__147) f) then (v_framePrev dtb__147) else (match dtb__147 with
  | C_Frame_MkFrame (dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> (B_dData_dMaybe.C_Maybe_Just ((C_Frame_MkFrame (dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, (((v_removeFrame (fuel - 1)) f) (v_framePrev dtb__147)), dtb__155, dtb__156))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 794 "Base/Effect/Core.vuna"
let v_cleanupRun = (fun (mc0 : t_Cleanup) -> (match mc0 with
  | C_Cleanup_MkCleanup (dtb__157) -> (dtb__157 0)
  | _ -> failwith "DT: impossible branch"
))

# 798 "Base/Effect/Core.vuna"
let rec v_dropCleanups = (fun (fuel : int) (depth : int) (cs : t_Cleanup B_dData_dList.t_List) (d : int) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = d } else (if (d <= depth) then { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = d } else (match cs with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = d }
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (let _u = (v_cleanupRun dtb__158) in ((((v_dropCleanups (fuel - 1)) depth) dtb__159) (d - 1)))
  | _ -> failwith "DT: impossible branch"
))))

# 779 "Base/Effect/Core.vuna"
let v_finish = (fun (fuel : int) st frame r -> (match ((((v_dropCleanups fuel) (v_frameCleanDepth (Obj.magic frame))) ((Obj.magic st)).f_MSt_msCleanups) ((Obj.magic st)).f_MSt_msCleanDepth) with
  | { B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = dtb__161 } -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_removeFrame fuel) (Obj.magic frame)) ((Obj.magic st)).f_MSt_msFrames); f_MSt_msCtx = ((Obj.magic st)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = dtb__160; f_MSt_msCleanDepth = dtb__161 }; B_dData_dPair.f_Pair_second = ((v_frameKOuter (Obj.magic frame)) (Obj.magic r)) })
  | _ -> failwith "DT: impossible branch"
))

# 744 "Base/Effect/Core.vuna"
let v_unwind = (fun (fuel : int) st frame r -> (match ((Obj.magic st)).f_MSt_msCtx with
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> (Obj.magic (if ((v_samePrompt (v_ctxPrompt dtb__162)) (Obj.magic frame)) then { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic st)).f_MSt_msFrames; f_MSt_msCtx = (v_ctxPrev dtb__162); f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((v_prependFree (v_ctxSlot dtb__162)) ((Obj.magic st)).f_MSt_msFree); f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic st)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic st)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((v_ctxKRest dtb__162) (Obj.magic r)) } else ((((v_finish fuel) (Obj.magic st)) (Obj.magic frame)) (Obj.magic r))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((((v_finish fuel) (Obj.magic st)) (Obj.magic frame)) (Obj.magic r)))
  | _ -> failwith "DT: impossible branch"
))

# 593 "Base/Effect/Core.vuna"
let rec v_machineScoped = (fun (mc0 : int) mc1 mc2 mc3 -> (match (Obj.magic mc3) with
  | C_Scoped_MkScoped (dtb__163) -> (Obj.magic (let frame = (C_Frame_MkFrame ((v_frameKey (Obj.magic mc2)), (v_frameName (Obj.magic mc2)), (v_frameRet (Obj.magic mc2)), (v_frameOpH (Obj.magic mc2)), (fun _u -> (dtb__163 0)), (fun x -> (C_Control_MkDone ((Obj.magic x)))), (B_dData_dMaybe.C_Maybe_Just ((Obj.magic mc2))), ((Obj.magic mc1)).f_MSt_msCleanDepth, ((Obj.magic mc1)).f_MSt_msNext)) in (((v_runGo (mc0 - 1)) { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just (frame)); f_MSt_msCtx = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic mc1)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }) ((dtb__163 0) (fun x -> (C_Control_MkReturn (frame, (Obj.magic x))))))))
  | _ -> failwith "DT: impossible branch"
))
# 615 "Base/Effect/Core.vuna"
and v_runGo = (fun (fuel : int) st c -> (if (fuel <= 0) then ((fun msg -> failwith msg) "effect machine: fuel exhausted") else (match (Obj.magic c) with
  | C_Control_MkDone (dtb__164) -> (Obj.magic dtb__164)
  | _ -> (Obj.magic (match (((v_step fuel) (Obj.magic st)) (Obj.magic c)) with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> (Obj.magic (((v_runGo (fuel - 1)) dtb__165) dtb__166))
  | _ -> failwith "DT: impossible branch"
))
)))
# 626 "Base/Effect/Core.vuna"
and v_step = (fun (mc0 : int) mc1 mc2 -> (match (Obj.magic mc2) with
  | C_Control_MkHandle (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> (Obj.magic (let frame = (C_Frame_MkFrame (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, ((Obj.magic mc1)).f_MSt_msFrames, ((Obj.magic mc1)).f_MSt_msCleanDepth, ((Obj.magic mc1)).f_MSt_msNext)) in { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just (frame)); f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic mc1)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((dtb__171 (v_toObj 0)) (fun x -> (C_Control_MkReturn (frame, (Obj.magic x))))) }))
  | C_Control_MkSelf (dtb__173, dtb__174) -> (Obj.magic (match ((Obj.magic mc1)).f_MSt_msFrames with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "handleScoped outside handler"))
  | B_dData_dMaybe.C_Maybe_Just (dtb__175) -> (Obj.magic (let frame = (C_Frame_MkFrame ((v_frameKey dtb__175), (v_frameName dtb__175), (v_frameRet dtb__175), (v_frameOpH dtb__175), dtb__173, dtb__174, ((Obj.magic mc1)).f_MSt_msFrames, ((Obj.magic mc1)).f_MSt_msCleanDepth, ((Obj.magic mc1)).f_MSt_msNext)) in { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just (frame)); f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic mc1)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((dtb__173 (v_toObj 0)) (fun x -> (C_Control_MkReturn (frame, (Obj.magic x))))) }))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkPerform (dtb__176, dtb__177, dtb__178, dtb__179) -> (Obj.magic (match ((((v_findFrame (mc0 - 1)) dtb__176) dtb__177) ((Obj.magic mc1)).f_MSt_msFrames) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "unhandled effect"))
  | B_dData_dMaybe.C_Maybe_Just (dtb__180) -> (Obj.magic (let slot = (match ((Obj.magic mc1)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> dtb__185
  | B_dData_dList.C_List_Nil -> ((Obj.magic mc1)).f_MSt_msNext
  | _ -> failwith "DT: impossible branch"
) in (let free = (match ((Obj.magic mc1)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> dtb__184
  | B_dData_dList.C_List_Nil -> ((Obj.magic mc1)).f_MSt_msFree
  | _ -> failwith "DT: impossible branch"
) in (let next = (match ((Obj.magic mc1)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__182) -> ((Obj.magic mc1)).f_MSt_msNext
  | B_dData_dList.C_List_Nil -> (((Obj.magic mc1)).f_MSt_msNext + 1)
  | _ -> failwith "DT: impossible branch"
) in (let epoch = (((Obj.magic mc1)).f_MSt_msEpoch + 1) in { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic mc1)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = next; f_MSt_msFree = free; f_MSt_msEpoch = epoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (((((v_frameOpH dtb__180) dtb__178) (fun v rest -> (C_Control_MkResume (dtb__180, dtb__179, slot, epoch, (Obj.magic v), rest)))) (fun r -> (C_Control_MkKDone (dtb__180, (Obj.magic r))))) (fun th -> ((((v_machineScoped (mc0 - 1)) (Obj.magic mc1)) dtb__180) th))) })))))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkResume (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192) -> (Obj.magic (match dtb__192 with
  | C_Rest_MkRestTail -> (Obj.magic (if ((((v_usedEpoch (mc0 - 1)) v_tailSlot) dtb__190) ((Obj.magic mc1)).f_MSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_reinstallIfMissing (mc0 - 1)) dtb__187) ((Obj.magic mc1)).f_MSt_msFrames); f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((((v_markUsed (mc0 - 1)) v_tailSlot) dtb__190) ((Obj.magic mc1)).f_MSt_msUsed); f_MSt_msNext = ((Obj.magic mc1)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (dtb__188 dtb__191) }))
  | C_Rest_MkRestCont (dtb__193) -> (Obj.magic (if ((((v_usedEpoch (mc0 - 1)) dtb__189) dtb__190) ((Obj.magic mc1)).f_MSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_reinstallIfMissing (mc0 - 1)) dtb__187) ((Obj.magic mc1)).f_MSt_msFrames); f_MSt_msCtx = (B_dData_dMaybe.C_Maybe_Just ((C_Ctx_MkCtx (dtb__187, dtb__193, ((Obj.magic mc1)).f_MSt_msCtx, dtb__189)))); f_MSt_msUsed = ((((v_markUsed (mc0 - 1)) dtb__189) dtb__190) ((Obj.magic mc1)).f_MSt_msUsed); f_MSt_msNext = ((Obj.magic mc1)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (dtb__188 dtb__191) }))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkReturn (dtb__194, dtb__195) -> (Obj.magic ((((v_unwind mc0) (Obj.magic mc1)) dtb__194) ((v_frameRet dtb__194) dtb__195)))
  | C_Control_MkKDone (dtb__196, dtb__197) -> (Obj.magic ((((v_unwind mc0) (Obj.magic mc1)) dtb__196) dtb__197))
  | C_Control_MkPopCleanup (dtb__198) -> (Obj.magic (match ((Obj.magic mc1)).f_MSt_msCleanups with
  | B_dData_dList.C_List_Nil -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic mc1); B_dData_dPair.f_Pair_second = (dtb__198 (v_toObj 0)) })
  | B_dData_dList.C_List__x58__x58_ (dtb__199, dtb__200) -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic mc1)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic mc1)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = dtb__200; f_MSt_msCleanDepth = (((Obj.magic mc1)).f_MSt_msCleanDepth - 1) }; B_dData_dPair.f_Pair_second = (dtb__198 (v_toObj 0)) })
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkPushCleanup (dtb__201, dtb__202) -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic mc1)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic mc1)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = (B_dData_dList.C_List__x58__x58_ (dtb__201, ((Obj.magic mc1)).f_MSt_msCleanups)); f_MSt_msCleanDepth = (((Obj.magic mc1)).f_MSt_msCleanDepth + 1) }; B_dData_dPair.f_Pair_second = (dtb__202 (v_toObj 0)) })
  | C_Control_MkApply (dtb__203, dtb__204) -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic mc1); B_dData_dPair.f_Pair_second = (dtb__203 dtb__204) })
  | C_Control_MkDone (dtb__205) -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic mc1); B_dData_dPair.f_Pair_second = (C_Control_MkDone (dtb__205)) })
  | _ -> failwith "DT: impossible branch"
))

# 813 "Base/Effect/Core.vuna"
let v_machineRun = (fun c -> (((v_runGo 1000000000) v_emptySt) (Obj.magic c)))
