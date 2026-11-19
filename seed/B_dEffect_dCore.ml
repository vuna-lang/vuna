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
let v_Functor_uBase_uEffect_uCore_uEff_ur = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun f e -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match e with
  | C_Eff_MkEff (dtb__0) -> (f (dtb__0 u))
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t)))

# 79 "Base/Effect/Core.vuna"
let v_Monad_uBase_uEffect_uCore_uEff_ur = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun e k -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match e with
  | C_Eff_MkEff (dtb__1) -> (match (k (dtb__1 u)) with
  | C_Eff_MkEff (dtb__2) -> (dtb__2 u)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) : Obj.t)))

# 89 "Base/Effect/Core.vuna"
let v_Applicative_uBase_uEffect_uCore_uEff_ur = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun x -> (C_Eff_MkEff ((fun (_u : t_EffUnit) -> x))))) : Obj.t), ((Obj.magic (fun mf mx -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match mf with
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
let v_runThunk = (fun e (_uarity3 : t_EffUnit) -> ((match e with
  | C_Eff_MkEff (dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
) _uarity3))

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

# 186 "Base/Effect/Core.vuna"
let v_weakenRow = (fun (t : t_Row) e -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match e with
  | C_Eff_MkEff (dtb__14) -> (dtb__14 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 195 "Base/Effect/Core.vuna"
let v_raise = (fun mc0 -> (match mc0 with
  | C_Eff_MkEff (dtb__15) -> (C_Eff_MkEff (dtb__15))
  | _ -> failwith "DT: impossible branch"
))

# 200 "Base/Effect/Core.vuna"
let v_raiseTo = (fun (r : t_Row) e -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match e with
  | C_Eff_MkEff (dtb__16) -> (dtb__16 u)
  | _ -> failwith "DT: impossible branch"
)))))

# 213 "Base/Effect/Core.vuna"
let v_sendCoreId = (fun (key : string) (name : string) (keyId : int) (nameId : int) o -> (C_Eff_MkEff ((fun (_u : t_EffUnit) -> ((((((fun key name kid nid v -> Obj.obj (Effect.perform (Perform (kid, nid, key, name, Obj.repr v)))) key) name) keyId) nameId) o)))))

# 209 "Base/Effect/Core.vuna"
let v_sendCore = (fun (key : string) (name : string) o -> (((((v_sendCoreId key) name) (dtp_effectId key)) (dtp_effectId name)) o))

# 223 "Base/Effect/Core.vuna"
let v_sigFn = C_EffSig_MkEffSig

# 241 "Base/Effect/Core.vuna"
let v_performCoreId = (fun (n : string) (key : string) (nId : int) (keyId : int) o -> (((((v_sendCoreId key) n) keyId) nId) (Obj.magic o)))

# 237 "Base/Effect/Core.vuna"
let v_performCore = (fun (n : string) (key : string) o -> (((((v_performCoreId n) key) (dtp_effectId n)) (dtp_effectId key)) (Obj.magic o)))

# 250 "Base/Effect/Core.vuna"
let v_handleCoreId = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match comp with
  | C_Eff_MkEff (dtb__17) -> ((((((((dtp_effect_handle_id key) name) keyId) nameId) ret) opH) dtb__17) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 245 "Base/Effect/Core.vuna"
let v_handleCore = (fun (key : string) (name : string) ret opH comp -> (((((((v_handleCoreId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp))

# 264 "Base/Effect/Core.vuna"
let v_handleCoreAtId = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp -> (C_Eff_MkEff ((fun (u : t_EffUnit) -> (match comp with
  | C_Eff_MkEff (dtb__18) -> ((((((((dtp_effect_handle_id key) name) keyId) nameId) ret) opH) dtb__18) u)
  | _ -> failwith "DT: impossible branch"
)))))

# 259 "Base/Effect/Core.vuna"
let v_handleCoreAt = (fun (key : string) (name : string) ret opH comp -> (((((((v_handleCoreAtId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp))

# 283 "Base/Effect/Core.vuna"
let v_toObj = (fun x -> (Obj.repr x))

# 287 "Base/Effect/Core.vuna"
let v_fromObj = (fun o -> (Obj.obj (Obj.magic o)))

# 296 "Base/Effect/Core.vuna"
let v_resumeCont = (fun c x -> (match c with
  | C_Cont_MkCont (dtb__19) -> (dtb__19 x)
  | _ -> failwith "DT: impossible branch"
))

# 302 "Base/Effect/Core.vuna"
let v_contAdapter = (fun opH o k -> ((opH o) (C_Cont_MkCont (k))))

# 311 "Base/Effect/Core.vuna"
let v_handleCoreLinId = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp -> (((((((v_handleCoreId key) name) keyId) nameId) ret) (v_contAdapter opH)) comp))

# 306 "Base/Effect/Core.vuna"
let v_handleCoreLin = (fun (key : string) (name : string) ret opH comp -> (((((((v_handleCoreLinId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp))

# 325 "Base/Effect/Core.vuna"
let v_handleWithId = (fun (n : string) (key : string) (nId : int) (keyId : int) comp ret opH -> (((((((v_handleCoreId key) n) keyId) nId) ret) (Obj.magic opH)) comp))

# 321 "Base/Effect/Core.vuna"
let v_handleWith = (fun (n : string) (key : string) comp ret opH -> (((((((v_handleWithId n) key) (dtp_effectId n)) (dtp_effectId key)) comp) ret) (Obj.magic opH)))

# 336 "Base/Effect/Core.vuna"
let v_handleWithAtId = (fun (n : string) (key : string) (nId : int) (keyId : int) comp ret opH -> (((((((v_handleCoreAtId key) n) keyId) nId) ret) (Obj.magic opH)) comp))

# 331 "Base/Effect/Core.vuna"
let v_handleWithAt = (fun (n : string) (key : string) comp ret opH -> (((((((v_handleWithAtId n) key) (dtp_effectId n)) (dtp_effectId key)) comp) ret) (Obj.magic opH)))

# 345 "Base/Effect/Core.vuna"
let v_mkCont = (fun k -> (C_Cont_MkCont (k)))

# 351 "Base/Effect/Core.vuna"
let v_pushCleanup = (fun (th : (int) -> int) -> (v_effPrim (fun (_u : int) -> (dtp_cleanup_push th))))

# 354 "Base/Effect/Core.vuna"
let v_popCleanup = (v_effPrim (fun (_u : int) -> (dtp_cleanup_pop 0)))

# 357 "Base/Effect/Core.vuna"
let v_bracket = (fun acquire release use -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) acquire) (fun res -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (v_pushCleanup (fun (_u : int) -> (v_runEff (release res))))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (use res)) (fun a -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) v_popCleanup) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ v_Monad_uBase_uEffect_uCore_uEff_ur) (release res)) (fun _u -> ((B_dTrait_dApplicative.v_pure v_Applicative_uBase_uEffect_uCore_uEff_ur) a))))))))))))

# 368 "Base/Effect/Core.vuna"
let v_finally = (fun comp (cleanup : int t_Eff) -> (((v_bracket ((B_dTrait_dApplicative.v_pure v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)) (fun (_u : int) -> cleanup)) (fun (_u : int) -> comp)))

# 411 "Base/Effect/Core.vuna"
let v_usedSmallLimit = 8

# 427 "Base/Effect/Core.vuna"
let v_emptySt = { f_MSt_msFrames = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msCtx = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msUsed = (C_Used_MkUsedSmall (B_dData_dList.C_List_Nil)); f_MSt_msNext = 0; f_MSt_msFree = B_dData_dList.C_List_Nil; f_MSt_msEpoch = 0; f_MSt_msCleanups = B_dData_dList.C_List_Nil; f_MSt_msCleanDepth = 0 }

# 430 "Base/Effect/Core.vuna"
let v_frameKey = (fun f -> (match f with
  | C_Frame_MkFrame (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

# 435 "Base/Effect/Core.vuna"
let v_frameName = (fun f -> (match f with
  | C_Frame_MkFrame (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__30
  | _ -> failwith "DT: impossible branch"
))

# 440 "Base/Effect/Core.vuna"
let v_frameRet = (fun f _uarity2 -> ((match f with
  | C_Frame_MkFrame (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> dtb__40
  | _ -> failwith "DT: impossible branch"
) _uarity2))

# 445 "Base/Effect/Core.vuna"
let v_frameOpH = (fun f _uarity2 _uarity3 _uarity4 _uarity5 -> (((((match f with
  | C_Frame_MkFrame (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> dtb__50
  | _ -> failwith "DT: impossible branch"
) _uarity2) _uarity3) _uarity4) _uarity5))

# 450 "Base/Effect/Core.vuna"
let v_frameComp = (fun f _uarity2 _uarity3 -> (((match f with
  | C_Frame_MkFrame (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64) -> dtb__60
  | _ -> failwith "DT: impossible branch"
) _uarity2) _uarity3))

# 455 "Base/Effect/Core.vuna"
let v_frameKOuter = (fun f _uarity2 -> ((match f with
  | C_Frame_MkFrame (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> dtb__70
  | _ -> failwith "DT: impossible branch"
) _uarity2))

# 460 "Base/Effect/Core.vuna"
let v_framePrev = (fun f -> (match f with
  | C_Frame_MkFrame (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> dtb__80
  | _ -> failwith "DT: impossible branch"
))

# 465 "Base/Effect/Core.vuna"
let v_frameCleanDepth = (fun f -> (match f with
  | C_Frame_MkFrame (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

# 470 "Base/Effect/Core.vuna"
let v_frameIdOf = (fun f -> (match f with
  | C_Frame_MkFrame (dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

# 475 "Base/Effect/Core.vuna"
let v_ctxPrompt = (fun c -> (match c with
  | C_Ctx_MkCtx (dtb__101, dtb__102, dtb__103, dtb__104) -> dtb__101
  | _ -> failwith "DT: impossible branch"
))

# 480 "Base/Effect/Core.vuna"
let v_ctxKRest = (fun c _uarity2 -> ((match c with
  | C_Ctx_MkCtx (dtb__105, dtb__106, dtb__107, dtb__108) -> dtb__106
  | _ -> failwith "DT: impossible branch"
) _uarity2))

# 485 "Base/Effect/Core.vuna"
let v_ctxPrev = (fun c -> (match c with
  | C_Ctx_MkCtx (dtb__109, dtb__110, dtb__111, dtb__112) -> dtb__111
  | _ -> failwith "DT: impossible branch"
))

# 490 "Base/Effect/Core.vuna"
let v_ctxSlot = (fun c -> (match c with
  | C_Ctx_MkCtx (dtb__113, dtb__114, dtb__115, dtb__116) -> dtb__116
  | _ -> failwith "DT: impossible branch"
))

# 509 "Base/Effect/Core.vuna"
let rec v_usedEpochSmall = (fun (fuel : int) (slot : int) (epoch : int) (xs : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then false else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> (match dtb__117 with
  | { B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = dtb__120 } -> (if (dtb__119 = slot) then (epoch <= dtb__120) else ((((v_usedEpochSmall (fuel - 1)) slot) epoch) dtb__118))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)) xs)))

# 497 "Base/Effect/Core.vuna"
let v_usedEpoch = (fun (fuel : int) (slot : int) (epoch : int) (used : t_Used) -> (if (fuel <= 0) then false else (match used with
  | C_Used_MkUsedSmall (dtb__121) -> ((((v_usedEpochSmall (fuel - 1)) slot) epoch) dtb__121)
  | C_Used_MkUsedBig (dtb__122) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) slot) dtb__122) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (epoch <= dtb__123)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 519 "Base/Effect/Core.vuna"
let v_tailSlot = -1

# 535 "Base/Effect/Core.vuna"
let rec v_markUsedSmall = (fun (fuel : int) (slot : int) (epoch : int) (xs : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, B_dData_dList.C_List_Nil)) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (match dtb__124 with
  | { B_dData_dPair.f_Pair_first = dtb__126; B_dData_dPair.f_Pair_second = dtb__127 } -> (if (dtb__126 = slot) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, dtb__125)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__126; B_dData_dPair.f_Pair_second = dtb__127 }, ((((v_markUsedSmall (fuel - 1)) slot) epoch) dtb__125))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)) xs)))

# 544 "Base/Effect/Core.vuna"
let rec v_usedLen = (fun (fuel : int) (xs : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then 0 else (match xs with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (1 + ((v_usedLen (fuel - 1)) dtb__129))
  | _ -> failwith "DT: impossible branch"
)))

# 523 "Base/Effect/Core.vuna"
let v_markUsed = (fun (fuel : int) (slot : int) (epoch : int) (used : t_Used) -> (if (fuel <= 0) then (C_Used_MkUsedSmall ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, B_dData_dList.C_List_Nil)))) else (match used with
  | C_Used_MkUsedSmall (dtb__130) -> ((fun xs1 -> (if (((v_usedLen (fuel - 1)) xs1) > v_usedSmallLimit) then (C_Used_MkUsedBig (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) xs1))) else (C_Used_MkUsedSmall (xs1)))) ((((v_markUsedSmall (fuel - 1)) slot) epoch) dtb__130))
  | C_Used_MkUsedBig (dtb__131) -> (C_Used_MkUsedBig (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_uInt) slot) epoch) dtb__131)))
  | _ -> failwith "DT: impossible branch"
)))

# 554 "Base/Effect/Core.vuna"
let v_prependFree = (fun (slot : int) (free : int B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ (slot, free)))

# 557 "Base/Effect/Core.vuna"
let v_samePrompt = (fun a b -> ((v_frameIdOf a) = (v_frameIdOf b)))

# 560 "Base/Effect/Core.vuna"
let rec v_depth = (fun (n : int) chain -> (if (n <= 0) then 0 else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__132) -> (1 + ((v_depth (n - 1)) (v_framePrev dtb__132)))
  | _ -> failwith "DT: impossible branch"
)))

# 569 "Base/Effect/Core.vuna"
let rec v_inChain = (fun (fuel : int) f chain -> (if (fuel <= 0) then false else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__133) -> (if ((v_samePrompt f) dtb__133) then true else (((v_inChain (fuel - 1)) f) (v_framePrev dtb__133)))
  | _ -> failwith "DT: impossible branch"
)))

# 579 "Base/Effect/Core.vuna"
let v_reinstall = (fun f chain -> (match f with
  | C_Frame_MkFrame (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (C_Frame_MkFrame (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, chain, dtb__141, dtb__142))
  | _ -> failwith "DT: impossible branch"
))

# 584 "Base/Effect/Core.vuna"
let v_reinstallIfMissing = (fun (fuel : int) f chain -> (if (((v_inChain fuel) f) chain) then chain else (B_dData_dMaybe.C_Maybe_Just (((v_reinstall f) chain)))))

# 587 "Base/Effect/Core.vuna"
let rec v_findFrame = (fun (fuel : int) (key : int) (name : int) chain -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (if (if ((v_frameKey dtb__143) = key) then ((v_frameName dtb__143) = name) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb__143)) else ((((v_findFrame (fuel - 1)) key) name) (v_framePrev dtb__143)))
  | _ -> failwith "DT: impossible branch"
)))

# 732 "Base/Effect/Core.vuna"
let rec v_removeFrame = (fun (fuel : int) f chain -> (if (fuel <= 0) then chain else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__144) -> (if ((v_samePrompt dtb__144) f) then (v_framePrev dtb__144) else (match dtb__144 with
  | C_Frame_MkFrame (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (B_dData_dMaybe.C_Maybe_Just ((C_Frame_MkFrame (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, (((v_removeFrame (fuel - 1)) f) (v_framePrev dtb__144)), dtb__152, dtb__153))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 754 "Base/Effect/Core.vuna"
let v_cleanupRun = (fun (c : t_Cleanup) -> (match c with
  | C_Cleanup_MkCleanup (dtb__154) -> (dtb__154 0)
  | _ -> failwith "DT: impossible branch"
))

# 760 "Base/Effect/Core.vuna"
let rec v_dropCleanups = (fun (fuel : int) (depth : int) (cs : t_Cleanup B_dData_dList.t_List) (d : int) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = d } else (if (d <= depth) then { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = d } else (match cs with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = d }
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> ((fun _u -> ((((v_dropCleanups (fuel - 1)) depth) dtb__156) (d - 1))) (v_cleanupRun dtb__155))
  | _ -> failwith "DT: impossible branch"
))))

# 746 "Base/Effect/Core.vuna"
let v_finish = (fun (fuel : int) st frame r -> (match ((((v_dropCleanups fuel) (v_frameCleanDepth (Obj.magic frame))) ((Obj.magic st)).f_MSt_msCleanups) ((Obj.magic st)).f_MSt_msCleanDepth) with
  | { B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = dtb__158 } -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_removeFrame fuel) (Obj.magic frame)) ((Obj.magic st)).f_MSt_msFrames); f_MSt_msCtx = ((Obj.magic st)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = dtb__157; f_MSt_msCleanDepth = dtb__158 }; B_dData_dPair.f_Pair_second = ((v_frameKOuter (Obj.magic frame)) (Obj.magic r)) })
  | _ -> failwith "DT: impossible branch"
))

# 718 "Base/Effect/Core.vuna"
let v_unwind = (fun (fuel : int) st frame r -> (match ((Obj.magic st)).f_MSt_msCtx with
  | B_dData_dMaybe.C_Maybe_Just (dtb__159) -> (Obj.magic (if ((v_samePrompt (v_ctxPrompt dtb__159)) (Obj.magic frame)) then { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic st)).f_MSt_msFrames; f_MSt_msCtx = (v_ctxPrev dtb__159); f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((v_prependFree (v_ctxSlot dtb__159)) ((Obj.magic st)).f_MSt_msFree); f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic st)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic st)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((v_ctxKRest dtb__159) (Obj.magic r)) } else ((((v_finish fuel) (Obj.magic st)) (Obj.magic frame)) (Obj.magic r))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((((v_finish fuel) (Obj.magic st)) (Obj.magic frame)) (Obj.magic r)))
  | _ -> failwith "DT: impossible branch"
))

# 600 "Base/Effect/Core.vuna"
let rec v_machineScoped = (fun (fuel : int) st f sc -> (match (Obj.magic sc) with
  | C_Scoped_MkScoped (dtb__160) -> (Obj.magic ((fun frame -> (((v_runGo (fuel - 1)) { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just (frame)); f_MSt_msCtx = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic st)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic st)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic st)).f_MSt_msCleanDepth }) ((dtb__160 0) (fun x -> (C_Control_MkReturn (frame, (Obj.magic x))))))) (C_Frame_MkFrame ((v_frameKey (Obj.magic f)), (v_frameName (Obj.magic f)), (v_frameRet (Obj.magic f)), (v_frameOpH (Obj.magic f)), (fun _u -> (dtb__160 0)), (fun x -> (C_Control_MkDone ((Obj.magic x)))), (B_dData_dMaybe.C_Maybe_Just ((Obj.magic f))), ((Obj.magic st)).f_MSt_msCleanDepth, ((Obj.magic st)).f_MSt_msNext))))
  | _ -> failwith "DT: impossible branch"
))
# 624 "Base/Effect/Core.vuna"
and v_runGo = (fun (fuel : int) st c -> (if (fuel <= 0) then ((fun msg -> failwith msg) "effect machine: fuel exhausted") else (match (Obj.magic c) with
  | C_Control_MkDone (dtb__161) -> (Obj.magic dtb__161)
  | _ -> (Obj.magic (match (((v_step fuel) (Obj.magic st)) (Obj.magic c)) with
  | { B_dData_dPair.f_Pair_first = dtb__162; B_dData_dPair.f_Pair_second = dtb__163 } -> (Obj.magic (((v_runGo (fuel - 1)) dtb__162) dtb__163))
  | _ -> failwith "DT: impossible branch"
))
)))
# 635 "Base/Effect/Core.vuna"
and v_step = (fun (fuel : int) st c -> (match (Obj.magic c) with
  | C_Control_MkDone (dtb__164) -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic st); B_dData_dPair.f_Pair_second = (C_Control_MkDone (dtb__164)) })
  | C_Control_MkApply (dtb__165, dtb__166) -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic st); B_dData_dPair.f_Pair_second = (dtb__165 dtb__166) })
  | C_Control_MkPushCleanup (dtb__167, dtb__168) -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic st)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic st)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = (B_dData_dList.C_List__x58__x58_ (dtb__167, ((Obj.magic st)).f_MSt_msCleanups)); f_MSt_msCleanDepth = (((Obj.magic st)).f_MSt_msCleanDepth + 1) }; B_dData_dPair.f_Pair_second = (dtb__168 (v_toObj 0)) })
  | C_Control_MkPopCleanup (dtb__169) -> (Obj.magic (match ((Obj.magic st)).f_MSt_msCleanups with
  | B_dData_dList.C_List_Nil -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic st); B_dData_dPair.f_Pair_second = (dtb__169 (v_toObj 0)) })
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic st)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic st)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = dtb__171; f_MSt_msCleanDepth = (((Obj.magic st)).f_MSt_msCleanDepth - 1) }; B_dData_dPair.f_Pair_second = (dtb__169 (v_toObj 0)) })
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkKDone (dtb__172, dtb__173) -> (Obj.magic ((((v_unwind fuel) (Obj.magic st)) dtb__172) dtb__173))
  | C_Control_MkReturn (dtb__174, dtb__175) -> (Obj.magic ((((v_unwind fuel) (Obj.magic st)) dtb__174) ((v_frameRet dtb__174) dtb__175)))
  | C_Control_MkResume (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> (Obj.magic (match dtb__181 with
  | C_Rest_MkRestTail -> (Obj.magic (if ((((v_usedEpoch (fuel - 1)) v_tailSlot) dtb__179) ((Obj.magic st)).f_MSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_reinstallIfMissing (fuel - 1)) dtb__176) ((Obj.magic st)).f_MSt_msFrames); f_MSt_msCtx = ((Obj.magic st)).f_MSt_msCtx; f_MSt_msUsed = ((((v_markUsed (fuel - 1)) v_tailSlot) dtb__179) ((Obj.magic st)).f_MSt_msUsed); f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic st)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic st)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (dtb__177 dtb__180) }))
  | C_Rest_MkRestCont (dtb__182) -> (Obj.magic (if ((((v_usedEpoch (fuel - 1)) dtb__178) dtb__179) ((Obj.magic st)).f_MSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_reinstallIfMissing (fuel - 1)) dtb__176) ((Obj.magic st)).f_MSt_msFrames); f_MSt_msCtx = (B_dData_dMaybe.C_Maybe_Just ((C_Ctx_MkCtx (dtb__176, dtb__182, ((Obj.magic st)).f_MSt_msCtx, dtb__178)))); f_MSt_msUsed = ((((v_markUsed (fuel - 1)) dtb__178) dtb__179) ((Obj.magic st)).f_MSt_msUsed); f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic st)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic st)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (dtb__177 dtb__180) }))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkPerform (dtb__183, dtb__184, dtb__185, dtb__186) -> (Obj.magic (match ((((v_findFrame (fuel - 1)) dtb__183) dtb__184) ((Obj.magic st)).f_MSt_msFrames) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "unhandled effect"))
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (Obj.magic ((fun slot -> ((fun free -> ((fun next -> ((fun epoch -> { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic st)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic st)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = next; f_MSt_msFree = free; f_MSt_msEpoch = epoch; f_MSt_msCleanups = ((Obj.magic st)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic st)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (((((v_frameOpH dtb__187) dtb__185) (fun v rest -> (C_Control_MkResume (dtb__187, dtb__186, slot, epoch, (Obj.magic v), rest)))) (fun r -> (C_Control_MkKDone (dtb__187, (Obj.magic r))))) (fun th -> ((((v_machineScoped (fuel - 1)) (Obj.magic st)) dtb__187) th))) }) (((Obj.magic st)).f_MSt_msEpoch + 1))) (match ((Obj.magic st)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> ((Obj.magic st)).f_MSt_msNext
  | B_dData_dList.C_List_Nil -> (((Obj.magic st)).f_MSt_msNext + 1)
  | _ -> failwith "DT: impossible branch"
))) (match ((Obj.magic st)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb__190, dtb__191) -> dtb__191
  | B_dData_dList.C_List_Nil -> ((Obj.magic st)).f_MSt_msFree
  | _ -> failwith "DT: impossible branch"
))) (match ((Obj.magic st)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> dtb__192
  | B_dData_dList.C_List_Nil -> ((Obj.magic st)).f_MSt_msNext
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkSelf (dtb__194, dtb__195) -> (Obj.magic (match ((Obj.magic st)).f_MSt_msFrames with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "handleScoped outside handler"))
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (Obj.magic ((fun frame -> { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just (frame)); f_MSt_msCtx = ((Obj.magic st)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic st)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic st)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic st)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((dtb__194 (v_toObj 0)) (fun x -> (C_Control_MkReturn (frame, (Obj.magic x))))) }) (C_Frame_MkFrame ((v_frameKey dtb__196), (v_frameName dtb__196), (v_frameRet dtb__196), (v_frameOpH dtb__196), dtb__194, dtb__195, ((Obj.magic st)).f_MSt_msFrames, ((Obj.magic st)).f_MSt_msCleanDepth, ((Obj.magic st)).f_MSt_msNext))))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkHandle (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> (Obj.magic ((fun frame -> { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just (frame)); f_MSt_msCtx = ((Obj.magic st)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic st)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic st)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic st)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((dtb__201 (v_toObj 0)) (fun x -> (C_Control_MkReturn (frame, (Obj.magic x))))) }) (C_Frame_MkFrame (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, ((Obj.magic st)).f_MSt_msFrames, ((Obj.magic st)).f_MSt_msCleanDepth, ((Obj.magic st)).f_MSt_msNext))))
  | _ -> failwith "DT: impossible branch"
))

# 775 "Base/Effect/Core.vuna"
let v_machineRun = (fun c -> (((v_runGo 1000000000) v_emptySt) (Obj.magic c)))
