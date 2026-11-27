open Vuna_runtime
type t_Named = |
and t_Row = C_Row_Nil | C_Row__x58__x58_ of (t_Row)
and t_Member = C_Member_Here | C_Member_There of (t_Member)
and t_EffUnit = C_EffUnit_MkEffUnit
and 'a0 t_Eff = Obj.t
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
let v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur = (B_dTrait_dFunctor.C_Functor_Functor (((Obj.magic (fun dtb_u_u4 dtb_u_u5 -> (Obj.repr ((fun (dtb_u_u6 : t_EffUnit) -> (let dtb_u_u7 = Obj.obj (dtb_u_u5) in (dtb_u_u4 (dtb_u_u7 dtb_u_u6)))))))) : Obj.t)))

# 79 "Base/Effect/Core.vuna"
let v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur = (B_dTrait_dMonad.C_Monad_Monad (((Obj.magic (fun dtb_u_u11 dtb_u_u12 -> (Obj.repr ((fun (dtb_u_u13 : t_EffUnit) -> (let dtb_u_u14 = Obj.obj (dtb_u_u11) in (let dtb_u_u15 = Obj.obj ((dtb_u_u12 (dtb_u_u14 dtb_u_u13))) in (dtb_u_u15 dtb_u_u13)))))))) : Obj.t)))

# 89 "Base/Effect/Core.vuna"
let v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur = (B_dTrait_dApplicative.C_Applicative_Applicative (((Obj.magic (fun dtb_u_u18 -> (Obj.repr ((fun (dtb_u_u19 : t_EffUnit) -> dtb_u_u18))))) : Obj.t), ((Obj.magic (fun dtb_u_u22 dtb_u_u23 -> (Obj.repr ((fun (dtb_u_u24 : t_EffUnit) -> (let dtb_u_u25 = Obj.obj (dtb_u_u22) in (let dtb_u_u26 = Obj.obj (dtb_u_u23) in ((dtb_u_u25 dtb_u_u24) (dtb_u_u26 dtb_u_u24))))))))) : Obj.t), ((Obj.magic (fun dtb_u_u30 dtb_u_u31 dtb_u_u32 -> (Obj.repr ((fun (dtb_u_u33 : t_EffUnit) -> (let dtb_u_u34 = Obj.obj (dtb_u_u31) in (let dtb_u_u35 = Obj.obj (dtb_u_u32) in ((dtb_u_u30 (dtb_u_u34 dtb_u_u33)) (dtb_u_u35 dtb_u_u33))))))))) : Obj.t)))

# 58 "Base/Effect/Core.vuna"
let v_defaultInstance = "default"

# 110 "Base/Effect/Core.vuna"
let v_effPrim = (fun dtb_u_u38 -> (Obj.repr ((fun (dtb_u_u39 : t_EffUnit) -> (dtb_u_u38 0)))))

# 110 "Base/Effect/Core.vuna"
let v_effPrim_u_udirect = (fun f _u_ueffTok -> (f 0))

# 114 "Base/Effect/Core.vuna"
let v_weaken = (fun dtb_u_u43 -> (let dtb_u_u44 = Obj.obj (dtb_u_u43) in (Obj.repr (dtb_u_u44))))

# 114 "Base/Effect/Core.vuna"
let v_weaken_u_udirect = (fun comp _u_ueffTok -> (let dtb_u_u44 = Obj.obj (comp) in ((Obj.magic (Obj.repr (dtb_u_u44))) _u_ueffTok)))

# 120 "Base/Effect/Core.vuna"
let v_runThunk = (fun e -> (let dtb__8 = Obj.obj (e) in dtb__8))

# 127 "Base/Effect/Core.vuna"
let v_runPure = (fun e -> ((v_runThunk e) C_EffUnit_MkEffUnit))

# 131 "Base/Effect/Core.vuna"
let v_runEff = (fun e -> ((v_runThunk e) C_EffUnit_MkEffUnit))

# 141 "Base/Effect/Core.vuna"
let v_scope = (fun comp -> (C_Scoped_MkScoped ((fun (_u : int) -> ((v_runThunk comp) C_EffUnit_MkEffUnit)))))

# 147 "Base/Effect/Core.vuna"
let v_handleScoped = (fun mc0 -> (match mc0 with
  | C_Scoped_MkScoped (dtb__9) -> (dtp_effect_self dtb__9)
  | _ -> failwith "DT: impossible branch"
))

# 151 "Base/Effect/Core.vuna"
let v_handleSelf = (fun comp -> (v_handleScoped (v_scope comp)))

# 157 "Base/Effect/Core.vuna"
let v_runMain = (fun e -> ((v_runThunk e) C_EffUnit_MkEffUnit))

# 163 "Base/Effect/Core.vuna"
let v_joinEff = (fun dtb_u_u74 -> (Obj.repr ((fun (dtb_u_u75 : t_EffUnit) -> (let dtb_u_u76 = Obj.obj (dtb_u_u74) in (let dtb_u_u77 = Obj.obj ((dtb_u_u76 dtb_u_u75)) in (dtb_u_u77 dtb_u_u75)))))))

# 163 "Base/Effect/Core.vuna"
let v_joinEff_u_udirect = (fun m _u_ueffTok -> (let dtb_u_u76 = Obj.obj (m) in (let dtb_u_u77 = Obj.obj ((dtb_u_u76 _u_ueffTok)) in (dtb_u_u77 _u_ueffTok))))

# 176 "Base/Effect/Core.vuna"
let v_joinEffNilOuter = (fun dtb_u_u80 -> (Obj.repr ((fun (dtb_u_u81 : t_EffUnit) -> (let dtb_u_u82 = Obj.obj (dtb_u_u80) in (let dtb_u_u83 = Obj.obj ((dtb_u_u82 dtb_u_u81)) in (dtb_u_u83 dtb_u_u81)))))))

# 176 "Base/Effect/Core.vuna"
let v_joinEffNilOuter_u_udirect = (fun m _u_ueffTok -> (let dtb_u_u82 = Obj.obj (m) in (let dtb_u_u83 = Obj.obj ((dtb_u_u82 _u_ueffTok)) in (dtb_u_u83 _u_ueffTok))))

# 189 "Base/Effect/Core.vuna"
let v_joinEffNilInner = (fun dtb_u_u86 -> (Obj.repr ((fun (dtb_u_u87 : t_EffUnit) -> (let dtb_u_u88 = Obj.obj (dtb_u_u86) in (let dtb_u_u89 = Obj.obj ((dtb_u_u88 dtb_u_u87)) in (dtb_u_u89 dtb_u_u87)))))))

# 189 "Base/Effect/Core.vuna"
let v_joinEffNilInner_u_udirect = (fun m _u_ueffTok -> (let dtb_u_u88 = Obj.obj (m) in (let dtb_u_u89 = Obj.obj ((dtb_u_u88 _u_ueffTok)) in (dtb_u_u89 _u_ueffTok))))

# 201 "Base/Effect/Core.vuna"
let v_dropEffHead = (fun dtb_u_u93 -> (let dtb_u_u94 = Obj.obj (dtb_u_u93) in (Obj.repr (dtb_u_u94))))

# 201 "Base/Effect/Core.vuna"
let v_dropEffHead_u_udirect = (fun comp _u_ueffTok -> (let dtb_u_u94 = Obj.obj (comp) in ((Obj.magic (Obj.repr (dtb_u_u94))) _u_ueffTok)))

# 208 "Base/Effect/Core.vuna"
let v_weakenRow = (fun (dtb_u_u96 : t_Row) dtb_u_u98 -> (Obj.repr ((fun (dtb_u_u99 : t_EffUnit) -> (let dtb_u_u100 = Obj.obj (dtb_u_u98) in (dtb_u_u100 dtb_u_u99))))))

# 208 "Base/Effect/Core.vuna"
let v_weakenRow_u_udirect = (fun (t : t_Row) e _u_ueffTok -> (let dtb_u_u100 = Obj.obj (e) in (dtb_u_u100 _u_ueffTok)))

# 217 "Base/Effect/Core.vuna"
let v_raise = (fun dtb_u_u103 -> (let dtb_u_u104 = Obj.obj (dtb_u_u103) in (Obj.repr (dtb_u_u104))))

# 217 "Base/Effect/Core.vuna"
let v_raise_u_udirect = (fun mc0 _u_ueffTok -> (let dtb_u_u104 = Obj.obj (mc0) in ((Obj.magic (Obj.repr (dtb_u_u104))) _u_ueffTok)))

# 222 "Base/Effect/Core.vuna"
let v_raiseTo = (fun (dtb_u_u105 : t_Row) dtb_u_u107 -> (Obj.repr ((fun (dtb_u_u108 : t_EffUnit) -> (let dtb_u_u109 = Obj.obj (dtb_u_u107) in (dtb_u_u109 dtb_u_u108))))))

# 222 "Base/Effect/Core.vuna"
let v_raiseTo_u_udirect = (fun (r : t_Row) e _u_ueffTok -> (let dtb_u_u109 = Obj.obj (e) in (dtb_u_u109 _u_ueffTok)))

# 235 "Base/Effect/Core.vuna"
let v_sendCoreId = (fun (dtb_u_u114 : string) (dtb_u_u115 : string) (dtb_u_u116 : int) (dtb_u_u117 : int) dtb_u_u118 -> (Obj.repr ((fun (dtb_u_u119 : t_EffUnit) -> ((((((fun key name kid nid v -> Obj.obj (Effect.perform (Perform (kid, nid, key, name, Obj.repr v)))) dtb_u_u114) dtb_u_u115) dtb_u_u116) dtb_u_u117) dtb_u_u118)))))

# 235 "Base/Effect/Core.vuna"
let v_sendCoreId_u_udirect = (fun (key : string) (name : string) (keyId : int) (nameId : int) o _u_ueffTok -> ((((((fun key name kid nid v -> Obj.obj (Effect.perform (Perform (kid, nid, key, name, Obj.repr v)))) key) name) keyId) nameId) o))

# 231 "Base/Effect/Core.vuna"
let v_sendCore = (fun (key : string) (name : string) o -> (((((v_sendCoreId key) name) (dtp_effectId key)) (dtp_effectId name)) o))

# 231 "Base/Effect/Core.vuna"
let v_sendCore_u_udirect = (fun (key : string) (name : string) o _u_ueffTok -> ((Obj.magic (((((v_sendCoreId key) name) (dtp_effectId key)) (dtp_effectId name)) o)) _u_ueffTok))

# 245 "Base/Effect/Core.vuna"
let v_sigFn = C_EffSig_MkEffSig

# 263 "Base/Effect/Core.vuna"
let v_performCoreId = (fun (n : string) (key : string) (nId : int) (keyId : int) o -> (((((v_sendCoreId key) n) keyId) nId) (Obj.magic o)))

# 263 "Base/Effect/Core.vuna"
let v_performCoreId_u_udirect = (fun (n : string) (key : string) (nId : int) (keyId : int) o _u_ueffTok -> ((Obj.magic (((((v_sendCoreId key) n) keyId) nId) (Obj.magic o))) _u_ueffTok))

# 259 "Base/Effect/Core.vuna"
let v_performCore = (fun (n : string) (key : string) o -> (((((v_performCoreId n) key) (dtp_effectId n)) (dtp_effectId key)) (Obj.magic o)))

# 259 "Base/Effect/Core.vuna"
let v_performCore_u_udirect = (fun (n : string) (key : string) o _u_ueffTok -> ((Obj.magic (((((v_performCoreId n) key) (dtp_effectId n)) (dtp_effectId key)) (Obj.magic o))) _u_ueffTok))

# 272 "Base/Effect/Core.vuna"
let v_handleCoreId = (fun (dtb_u_u150 : string) (dtb_u_u151 : string) (dtb_u_u152 : int) (dtb_u_u153 : int) dtb_u_u154 dtb_u_u155 dtb_u_u156 -> (Obj.repr ((fun (dtb_u_u157 : t_EffUnit) -> (let dtb_u_u158 = Obj.obj (dtb_u_u156) in ((((((((dtp_effect_handle_id dtb_u_u150) dtb_u_u151) dtb_u_u152) dtb_u_u153) dtb_u_u154) dtb_u_u155) dtb_u_u158) dtb_u_u157))))))

# 272 "Base/Effect/Core.vuna"
let v_handleCoreId_u_udirect = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp _u_ueffTok -> (let dtb_u_u158 = Obj.obj (comp) in ((((((((dtp_effect_handle_id key) name) keyId) nameId) ret) opH) dtb_u_u158) _u_ueffTok)))

# 267 "Base/Effect/Core.vuna"
let v_handleCore = (fun (key : string) (name : string) ret opH comp -> (((((((v_handleCoreId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp))

# 267 "Base/Effect/Core.vuna"
let v_handleCore_u_udirect = (fun (key : string) (name : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((v_handleCoreId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp)) _u_ueffTok))

# 286 "Base/Effect/Core.vuna"
let v_handleCoreAtId = (fun (dtb_u_u176 : string) (dtb_u_u177 : string) (dtb_u_u178 : int) (dtb_u_u179 : int) dtb_u_u180 dtb_u_u181 dtb_u_u182 -> (Obj.repr ((fun (dtb_u_u183 : t_EffUnit) -> (let dtb_u_u184 = Obj.obj (dtb_u_u182) in ((((((((dtp_effect_handle_id dtb_u_u176) dtb_u_u177) dtb_u_u178) dtb_u_u179) dtb_u_u180) dtb_u_u181) dtb_u_u184) dtb_u_u183))))))

# 286 "Base/Effect/Core.vuna"
let v_handleCoreAtId_u_udirect = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp _u_ueffTok -> (let dtb_u_u184 = Obj.obj (comp) in ((((((((dtp_effect_handle_id key) name) keyId) nameId) ret) opH) dtb_u_u184) _u_ueffTok)))

# 281 "Base/Effect/Core.vuna"
let v_handleCoreAt = (fun (key : string) (name : string) ret opH comp -> (((((((v_handleCoreAtId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp))

# 281 "Base/Effect/Core.vuna"
let v_handleCoreAt_u_udirect = (fun (key : string) (name : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((v_handleCoreAtId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp)) _u_ueffTok))

# 305 "Base/Effect/Core.vuna"
let v_toObj = (fun x -> (Obj.repr x))

# 309 "Base/Effect/Core.vuna"
let v_fromObj = (fun o -> (Obj.obj (Obj.magic o)))

# 318 "Base/Effect/Core.vuna"
let v_resumeCont = (fun c x -> (match c with
  | C_Cont_MkCont (dtb__22) -> (dtb__22 x)
  | _ -> failwith "DT: impossible branch"
))

# 324 "Base/Effect/Core.vuna"
let v_contAdapter = (fun opH o k -> ((opH o) (C_Cont_MkCont (k))))

# 333 "Base/Effect/Core.vuna"
let v_handleCoreLinId = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp -> (((((((v_handleCoreId key) name) keyId) nameId) ret) (v_contAdapter opH)) comp))

# 333 "Base/Effect/Core.vuna"
let v_handleCoreLinId_u_udirect = (fun (key : string) (name : string) (keyId : int) (nameId : int) ret opH comp _u_ueffTok -> ((Obj.magic (((((((v_handleCoreId key) name) keyId) nameId) ret) (v_contAdapter opH)) comp)) _u_ueffTok))

# 328 "Base/Effect/Core.vuna"
let v_handleCoreLin = (fun (key : string) (name : string) ret opH comp -> (((((((v_handleCoreLinId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp))

# 328 "Base/Effect/Core.vuna"
let v_handleCoreLin_u_udirect = (fun (key : string) (name : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((v_handleCoreLinId key) name) (dtp_effectId key)) (dtp_effectId name)) ret) opH) comp)) _u_ueffTok))

# 347 "Base/Effect/Core.vuna"
let v_handleWithId = (fun (n : string) (key : string) (nId : int) (keyId : int) comp ret opH -> (((((((v_handleCoreId key) n) keyId) nId) ret) (Obj.magic opH)) comp))

# 347 "Base/Effect/Core.vuna"
let v_handleWithId_u_udirect = (fun (n : string) (key : string) (nId : int) (keyId : int) comp ret opH _u_ueffTok -> ((Obj.magic (((((((v_handleCoreId key) n) keyId) nId) ret) (Obj.magic opH)) comp)) _u_ueffTok))

# 343 "Base/Effect/Core.vuna"
let v_handleWith = (fun (n : string) (key : string) comp ret opH -> (((((((v_handleWithId n) key) (dtp_effectId n)) (dtp_effectId key)) comp) ret) (Obj.magic opH)))

# 343 "Base/Effect/Core.vuna"
let v_handleWith_u_udirect = (fun (n : string) (key : string) comp ret opH _u_ueffTok -> ((Obj.magic (((((((v_handleWithId n) key) (dtp_effectId n)) (dtp_effectId key)) comp) ret) (Obj.magic opH))) _u_ueffTok))

# 358 "Base/Effect/Core.vuna"
let v_handleWithAtId = (fun (n : string) (key : string) (nId : int) (keyId : int) comp ret opH -> (((((((v_handleCoreAtId key) n) keyId) nId) ret) (Obj.magic opH)) comp))

# 358 "Base/Effect/Core.vuna"
let v_handleWithAtId_u_udirect = (fun (n : string) (key : string) (nId : int) (keyId : int) comp ret opH _u_ueffTok -> ((Obj.magic (((((((v_handleCoreAtId key) n) keyId) nId) ret) (Obj.magic opH)) comp)) _u_ueffTok))

# 353 "Base/Effect/Core.vuna"
let v_handleWithAt = (fun (n : string) (key : string) comp ret opH -> (((((((v_handleWithAtId n) key) (dtp_effectId n)) (dtp_effectId key)) comp) ret) (Obj.magic opH)))

# 353 "Base/Effect/Core.vuna"
let v_handleWithAt_u_udirect = (fun (n : string) (key : string) comp ret opH _u_ueffTok -> ((Obj.magic (((((((v_handleWithAtId n) key) (dtp_effectId n)) (dtp_effectId key)) comp) ret) (Obj.magic opH))) _u_ueffTok))

# 367 "Base/Effect/Core.vuna"
let v_mkCont = (fun k -> (C_Cont_MkCont (k)))

# 373 "Base/Effect/Core.vuna"
let v_pushCleanup = (fun (th : (int) -> int) -> (v_effPrim (fun (_u : int) -> (dtp_cleanup_push th))))

# 373 "Base/Effect/Core.vuna"
let v_pushCleanup_u_udirect = (fun (th : (int) -> int) _u_ueffTok -> ((Obj.magic (v_effPrim (fun (dtb_u_u291 : int) -> (dtp_cleanup_push th)))) _u_ueffTok))

# 376 "Base/Effect/Core.vuna"
let v_popCleanup = (v_effPrim (fun (_u : int) -> (dtp_cleanup_pop 0)))

# 379 "Base/Effect/Core.vuna"
let v_bracket = (fun dtb_u_u297 dtb_u_u298 dtb_u_u299 -> (Obj.repr ((fun (dtb_u_u304 : t_EffUnit) -> (let dtb_u_u305 = Obj.obj (dtb_u_u297) in (let dtb_u_u307 = (dtb_u_u305 dtb_u_u304) in (let dtb_u_u316 = ((v_pushCleanup_u_udirect (fun (dtb_u_u315 : int) -> (v_runEff (dtb_u_u298 dtb_u_u307)))) dtb_u_u304) in (let dtb_u_u322 = Obj.obj ((dtb_u_u299 dtb_u_u307)) in (let dtb_u_u324 = (dtb_u_u322 dtb_u_u304) in (let dtb_u_u330 = Obj.obj (v_popCleanup) in (let dtb_u_u332 = (dtb_u_u330 dtb_u_u304) in (let dtb_u_u338 = Obj.obj ((dtb_u_u298 dtb_u_u307)) in (let dtb_u_u340 = (dtb_u_u338 dtb_u_u304) in (let dtb_u_u342 = dtb_u_u324 in dtb_u_u342))))))))))))))

# 379 "Base/Effect/Core.vuna"
let v_bracket_u_udirect = (fun acquire release use _u_ueffTok -> (let dtb_u_u305 = Obj.obj (acquire) in (let dtb_u_u307 = (dtb_u_u305 _u_ueffTok) in (let dtb_u_u316 = ((v_pushCleanup_u_udirect (fun (dtb_u_u315 : int) -> (v_runEff (release dtb_u_u307)))) _u_ueffTok) in (let dtb_u_u322 = Obj.obj ((use dtb_u_u307)) in (let dtb_u_u324 = (dtb_u_u322 _u_ueffTok) in (let dtb_u_u330 = Obj.obj (v_popCleanup) in (let dtb_u_u332 = (dtb_u_u330 _u_ueffTok) in (let dtb_u_u338 = Obj.obj ((release dtb_u_u307)) in (let dtb_u_u340 = (dtb_u_u338 _u_ueffTok) in (let dtb_u_u342 = dtb_u_u324 in dtb_u_u342)))))))))))

# 390 "Base/Effect/Core.vuna"
let v_finally = (fun dtb_u_u346 (dtb_u_u347 : int t_Eff) -> (((v_bracket (let dtb_u_u349 = 0 in (Obj.repr ((fun (dtb_u_u350 : t_EffUnit) -> dtb_u_u349))))) (fun (dtb_u_u351 : int) -> dtb_u_u347)) (fun (dtb_u_u352 : int) -> dtb_u_u346)))

# 390 "Base/Effect/Core.vuna"
let v_finally_u_udirect = (fun comp (cleanup : int t_Eff) _u_ueffTok -> ((Obj.magic (((v_bracket (let dtb_u_u349 = 0 in (Obj.repr ((fun (dtb_u_u350 : t_EffUnit) -> dtb_u_u349))))) (fun (dtb_u_u351 : int) -> cleanup)) (fun (dtb_u_u352 : int) -> comp))) _u_ueffTok))

# 433 "Base/Effect/Core.vuna"
let v_usedSmallLimit = 8

# 449 "Base/Effect/Core.vuna"
let v_emptySt = { f_MSt_msFrames = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msCtx = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msUsed = (C_Used_MkUsedSmall (B_dData_dList.C_List_Nil)); f_MSt_msNext = 0; f_MSt_msFree = B_dData_dList.C_List_Nil; f_MSt_msEpoch = 0; f_MSt_msCleanups = B_dData_dList.C_List_Nil; f_MSt_msCleanDepth = 0 }

# 452 "Base/Effect/Core.vuna"
let v_frameKey = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

# 455 "Base/Effect/Core.vuna"
let v_frameName = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> dtb__43
  | _ -> failwith "DT: impossible branch"
))

# 458 "Base/Effect/Core.vuna"
let v_frameRet = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> dtb__53
  | _ -> failwith "DT: impossible branch"
))

# 461 "Base/Effect/Core.vuna"
let v_frameOpH = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> dtb__63
  | _ -> failwith "DT: impossible branch"
))

# 464 "Base/Effect/Core.vuna"
let v_frameComp = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> dtb__73
  | _ -> failwith "DT: impossible branch"
))

# 467 "Base/Effect/Core.vuna"
let v_frameKOuter = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

# 470 "Base/Effect/Core.vuna"
let v_framePrev = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> dtb__93
  | _ -> failwith "DT: impossible branch"
))

# 473 "Base/Effect/Core.vuna"
let v_frameCleanDepth = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> dtb__103
  | _ -> failwith "DT: impossible branch"
))

# 476 "Base/Effect/Core.vuna"
let v_frameIdOf = (fun mc0 -> (match mc0 with
  | C_Frame_MkFrame (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

# 479 "Base/Effect/Core.vuna"
let v_ctxPrompt = (fun mc0 -> (match mc0 with
  | C_Ctx_MkCtx (dtb__114, dtb__115, dtb__116, dtb__117) -> dtb__114
  | _ -> failwith "DT: impossible branch"
))

# 482 "Base/Effect/Core.vuna"
let v_ctxKRest = (fun mc0 -> (match mc0 with
  | C_Ctx_MkCtx (dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__119
  | _ -> failwith "DT: impossible branch"
))

# 485 "Base/Effect/Core.vuna"
let v_ctxPrev = (fun mc0 -> (match mc0 with
  | C_Ctx_MkCtx (dtb__122, dtb__123, dtb__124, dtb__125) -> dtb__124
  | _ -> failwith "DT: impossible branch"
))

# 488 "Base/Effect/Core.vuna"
let v_ctxSlot = (fun mc0 -> (match mc0 with
  | C_Ctx_MkCtx (dtb__126, dtb__127, dtb__128, dtb__129) -> dtb__129
  | _ -> failwith "DT: impossible branch"
))

# 505 "Base/Effect/Core.vuna"
let rec v_usedEpochSmall = (fun (fuel : int) (slot : int) (epoch : int) (xs : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then false else (let nd_uscrut4 = xs in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (match dtb__130 with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> (if (dtb__132 = slot) then (epoch <= dtb__133) else ((((v_usedEpochSmall (fuel - 1)) slot) epoch) dtb__131))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

# 493 "Base/Effect/Core.vuna"
let v_usedEpoch = (fun (fuel : int) (slot : int) (epoch : int) (used : t_Used) -> (if (fuel <= 0) then false else (match used with
  | C_Used_MkUsedSmall (dtb__134) -> ((((v_usedEpochSmall (fuel - 1)) slot) epoch) dtb__134)
  | C_Used_MkUsedBig (dtb__135) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) slot) dtb__135) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (epoch <= dtb__136)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 515 "Base/Effect/Core.vuna"
let v_tailSlot = (-1)

# 531 "Base/Effect/Core.vuna"
let rec v_markUsedSmall = (fun (fuel : int) (slot : int) (epoch : int) (xs : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, B_dData_dList.C_List_Nil)) else (let nd_uscrut4 = xs in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (match dtb__137 with
  | { B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = dtb__140 } -> (if (dtb__139 = slot) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, dtb__138)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = dtb__140 }, ((((v_markUsedSmall (fuel - 1)) slot) epoch) dtb__138))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))

# 540 "Base/Effect/Core.vuna"
let rec v_usedLen = (fun (fuel : int) (xs : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then 0 else (match xs with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (1 + ((v_usedLen (fuel - 1)) dtb__142))
  | _ -> failwith "DT: impossible branch"
)))

# 519 "Base/Effect/Core.vuna"
let v_markUsed = (fun (fuel : int) (slot : int) (epoch : int) (used : t_Used) -> (if (fuel <= 0) then (C_Used_MkUsedSmall ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = slot; B_dData_dPair.f_Pair_second = epoch }, B_dData_dList.C_List_Nil)))) else (match used with
  | C_Used_MkUsedSmall (dtb__143) -> (let xs1 = ((((v_markUsedSmall (fuel - 1)) slot) epoch) dtb__143) in (if (((v_usedLen (fuel - 1)) xs1) > v_usedSmallLimit) then (C_Used_MkUsedBig ((((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) xs1))) else (C_Used_MkUsedSmall (xs1))))
  | C_Used_MkUsedBig (dtb__144) -> (C_Used_MkUsedBig ((((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) slot) epoch) dtb__144)))
  | _ -> failwith "DT: impossible branch"
)))

# 550 "Base/Effect/Core.vuna"
let v_prependFree = (fun (slot : int) (free : int B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ (slot, free)))

# 553 "Base/Effect/Core.vuna"
let v_samePrompt = (fun a b -> ((v_frameIdOf a) = (v_frameIdOf b)))

# 556 "Base/Effect/Core.vuna"
let rec v_depth = (fun (n : int) chain -> (if (n <= 0) then 0 else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__145) -> (1 + ((v_depth (n - 1)) (v_framePrev dtb__145)))
  | _ -> failwith "DT: impossible branch"
)))

# 565 "Base/Effect/Core.vuna"
let rec v_inChain = (fun (fuel : int) f chain -> (if (fuel <= 0) then false else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (if ((v_samePrompt f) dtb__146) then true else (((v_inChain (fuel - 1)) f) (v_framePrev dtb__146)))
  | _ -> failwith "DT: impossible branch"
)))

# 575 "Base/Effect/Core.vuna"
let v_reinstall = (fun mc0 mc1 -> (match mc0 with
  | C_Frame_MkFrame (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (C_Frame_MkFrame (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, mc1, dtb__154, dtb__155))
  | _ -> failwith "DT: impossible branch"
))

# 579 "Base/Effect/Core.vuna"
let v_reinstallIfMissing = (fun (fuel : int) f chain -> (if (((v_inChain fuel) f) chain) then chain else (B_dData_dMaybe.C_Maybe_Just (((v_reinstall f) chain)))))

# 582 "Base/Effect/Core.vuna"
let rec v_findFrame = (fun (fuel : int) (key : int) (name : int) chain -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (if (if ((v_frameKey dtb__156) = key) then ((v_frameName dtb__156) = name) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb__156)) else ((((v_findFrame (fuel - 1)) key) name) (v_framePrev dtb__156)))
  | _ -> failwith "DT: impossible branch"
)))

# 767 "Base/Effect/Core.vuna"
let rec v_removeFrame = (fun (fuel : int) f chain -> (if (fuel <= 0) then chain else (match chain with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (if ((v_samePrompt dtb__157) f) then (v_framePrev dtb__157) else (match dtb__157 with
  | C_Frame_MkFrame (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> (B_dData_dMaybe.C_Maybe_Just ((C_Frame_MkFrame (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, (((v_removeFrame (fuel - 1)) f) (v_framePrev dtb__157)), dtb__165, dtb__166))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 796 "Base/Effect/Core.vuna"
let v_cleanupRun = (fun (mc0 : t_Cleanup) -> (match mc0 with
  | C_Cleanup_MkCleanup (dtb__167) -> (dtb__167 0)
  | _ -> failwith "DT: impossible branch"
))

# 800 "Base/Effect/Core.vuna"
let rec v_dropCleanups = (fun (fuel : int) (depth : int) (cs : t_Cleanup B_dData_dList.t_List) (d : int) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = d } else (if (d <= depth) then { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = d } else (match cs with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = d }
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (let _u = (v_cleanupRun dtb__168) in ((((v_dropCleanups (fuel - 1)) depth) dtb__169) (d - 1)))
  | _ -> failwith "DT: impossible branch"
))))

# 781 "Base/Effect/Core.vuna"
let v_finish = (fun (fuel : int) st frame r -> (match ((((v_dropCleanups fuel) (v_frameCleanDepth (Obj.magic frame))) ((Obj.magic st)).f_MSt_msCleanups) ((Obj.magic st)).f_MSt_msCleanDepth) with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_removeFrame fuel) (Obj.magic frame)) ((Obj.magic st)).f_MSt_msFrames); f_MSt_msCtx = ((Obj.magic st)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic st)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = dtb__170; f_MSt_msCleanDepth = dtb__171 }; B_dData_dPair.f_Pair_second = ((v_frameKOuter (Obj.magic frame)) (Obj.magic r)) })
  | _ -> failwith "DT: impossible branch"
))

# 746 "Base/Effect/Core.vuna"
let v_unwind = (fun (fuel : int) st frame r -> (match ((Obj.magic st)).f_MSt_msCtx with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (Obj.magic (if ((v_samePrompt (v_ctxPrompt dtb__172)) (Obj.magic frame)) then { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic st)).f_MSt_msFrames; f_MSt_msCtx = (v_ctxPrev dtb__172); f_MSt_msUsed = ((Obj.magic st)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic st)).f_MSt_msNext; f_MSt_msFree = ((v_prependFree (v_ctxSlot dtb__172)) ((Obj.magic st)).f_MSt_msFree); f_MSt_msEpoch = ((Obj.magic st)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic st)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic st)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((v_ctxKRest dtb__172) (Obj.magic r)) } else ((((v_finish fuel) (Obj.magic st)) (Obj.magic frame)) (Obj.magic r))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((((v_finish fuel) (Obj.magic st)) (Obj.magic frame)) (Obj.magic r)))
  | _ -> failwith "DT: impossible branch"
))

# 595 "Base/Effect/Core.vuna"
let rec v_machineScoped = (fun (mc0 : int) mc1 mc2 mc3 -> (match (Obj.magic mc3) with
  | C_Scoped_MkScoped (dtb__173) -> (Obj.magic (let frame = (C_Frame_MkFrame ((v_frameKey (Obj.magic mc2)), (v_frameName (Obj.magic mc2)), (v_frameRet (Obj.magic mc2)), (v_frameOpH (Obj.magic mc2)), (fun _u -> (dtb__173 0)), (fun x -> (C_Control_MkDone ((Obj.magic x)))), (B_dData_dMaybe.C_Maybe_Just ((Obj.magic mc2))), ((Obj.magic mc1)).f_MSt_msCleanDepth, ((Obj.magic mc1)).f_MSt_msNext)) in (((v_runGo (mc0 - 1)) { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just ((Obj.magic frame))); f_MSt_msCtx = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic mc1)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }) ((dtb__173 0) (fun x -> (C_Control_MkReturn ((Obj.magic frame), (Obj.magic x))))))))
  | _ -> failwith "DT: impossible branch"
))
# 617 "Base/Effect/Core.vuna"
and v_runGo = (fun (fuel : int) st c -> (if (fuel <= 0) then ((fun msg -> failwith msg) "effect machine: fuel exhausted") else (match (Obj.magic c) with
  | C_Control_MkDone (dtb__174) -> (Obj.magic dtb__174)
  | _ -> (Obj.magic (match (((v_step fuel) (Obj.magic st)) (Obj.magic c)) with
  | { B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = dtb__176 } -> (Obj.magic (((v_runGo (fuel - 1)) dtb__175) dtb__176))
  | _ -> failwith "DT: impossible branch"
))
)))
# 628 "Base/Effect/Core.vuna"
and v_step = (fun (mc0 : int) mc1 mc2 -> (match (Obj.magic mc2) with
  | C_Control_MkHandle (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> (Obj.magic (let frame = (C_Frame_MkFrame (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, ((Obj.magic mc1)).f_MSt_msFrames, ((Obj.magic mc1)).f_MSt_msCleanDepth, ((Obj.magic mc1)).f_MSt_msNext)) in { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just ((Obj.magic frame))); f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic mc1)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((dtb__181 (v_toObj 0)) (fun x -> (C_Control_MkReturn ((Obj.magic frame), (Obj.magic x))))) }))
  | C_Control_MkSelf (dtb__183, dtb__184) -> (Obj.magic (match ((Obj.magic mc1)).f_MSt_msFrames with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "handleScoped outside handler"))
  | B_dData_dMaybe.C_Maybe_Just (dtb__185) -> (Obj.magic (let frame = (C_Frame_MkFrame ((v_frameKey dtb__185), (v_frameName dtb__185), (v_frameRet dtb__185), (v_frameOpH dtb__185), dtb__183, dtb__184, ((Obj.magic mc1)).f_MSt_msFrames, ((Obj.magic mc1)).f_MSt_msCleanDepth, ((Obj.magic mc1)).f_MSt_msNext)) in { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just ((Obj.magic frame))); f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic mc1)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((dtb__183 (v_toObj 0)) (fun x -> (C_Control_MkReturn ((Obj.magic frame), (Obj.magic x))))) }))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkPerform (dtb__186, dtb__187, dtb__188, dtb__189) -> (Obj.magic (match ((((v_findFrame (mc0 - 1)) dtb__186) dtb__187) ((Obj.magic mc1)).f_MSt_msFrames) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "unhandled effect"))
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (Obj.magic (let slot = (match ((Obj.magic mc1)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> dtb__195
  | B_dData_dList.C_List_Nil -> ((Obj.magic mc1)).f_MSt_msNext
  | _ -> failwith "DT: impossible branch"
) in (let free = (match ((Obj.magic mc1)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> dtb__194
  | B_dData_dList.C_List_Nil -> ((Obj.magic mc1)).f_MSt_msFree
  | _ -> failwith "DT: impossible branch"
) in (let next = (match ((Obj.magic mc1)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> ((Obj.magic mc1)).f_MSt_msNext
  | B_dData_dList.C_List_Nil -> (((Obj.magic mc1)).f_MSt_msNext + 1)
  | _ -> failwith "DT: impossible branch"
) in (let epoch = (((Obj.magic mc1)).f_MSt_msEpoch + 1) in { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic mc1)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = next; f_MSt_msFree = free; f_MSt_msEpoch = epoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (((((v_frameOpH dtb__190) dtb__188) (fun v rest -> (C_Control_MkResume (dtb__190, dtb__189, slot, epoch, (Obj.magic v), (Obj.magic rest))))) (fun r -> (C_Control_MkKDone (dtb__190, (Obj.magic r))))) (fun th -> ((((v_machineScoped (mc0 - 1)) (Obj.magic mc1)) dtb__190) (Obj.magic th)))) })))))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkResume (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> (Obj.magic (match dtb__202 with
  | C_Rest_MkRestTail -> (Obj.magic (if ((((v_usedEpoch (mc0 - 1)) v_tailSlot) dtb__200) ((Obj.magic mc1)).f_MSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_reinstallIfMissing (mc0 - 1)) dtb__197) ((Obj.magic mc1)).f_MSt_msFrames); f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((((v_markUsed (mc0 - 1)) v_tailSlot) dtb__200) ((Obj.magic mc1)).f_MSt_msUsed); f_MSt_msNext = ((Obj.magic mc1)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (dtb__198 dtb__201) }))
  | C_Rest_MkRestCont (dtb__203) -> (Obj.magic (if ((((v_usedEpoch (mc0 - 1)) dtb__199) dtb__200) ((Obj.magic mc1)).f_MSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_reinstallIfMissing (mc0 - 1)) dtb__197) ((Obj.magic mc1)).f_MSt_msFrames); f_MSt_msCtx = (B_dData_dMaybe.C_Maybe_Just ((C_Ctx_MkCtx (dtb__197, dtb__203, ((Obj.magic mc1)).f_MSt_msCtx, dtb__199)))); f_MSt_msUsed = ((((v_markUsed (mc0 - 1)) dtb__199) dtb__200) ((Obj.magic mc1)).f_MSt_msUsed); f_MSt_msNext = ((Obj.magic mc1)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic mc1)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic mc1)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (dtb__198 dtb__201) }))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkReturn (dtb__204, dtb__205) -> (Obj.magic ((((v_unwind mc0) (Obj.magic mc1)) dtb__204) ((v_frameRet dtb__204) dtb__205)))
  | C_Control_MkKDone (dtb__206, dtb__207) -> (Obj.magic ((((v_unwind mc0) (Obj.magic mc1)) dtb__206) dtb__207))
  | C_Control_MkPopCleanup (dtb__208) -> (Obj.magic (match ((Obj.magic mc1)).f_MSt_msCleanups with
  | B_dData_dList.C_List_Nil -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic mc1); B_dData_dPair.f_Pair_second = (dtb__208 (v_toObj 0)) })
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic mc1)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic mc1)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = dtb__210; f_MSt_msCleanDepth = (((Obj.magic mc1)).f_MSt_msCleanDepth - 1) }; B_dData_dPair.f_Pair_second = (dtb__208 (v_toObj 0)) })
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkPushCleanup (dtb__211, dtb__212) -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic mc1)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic mc1)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic mc1)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic mc1)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic mc1)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic mc1)).f_MSt_msEpoch; f_MSt_msCleanups = (B_dData_dList.C_List__x58__x58_ (dtb__211, ((Obj.magic mc1)).f_MSt_msCleanups)); f_MSt_msCleanDepth = (((Obj.magic mc1)).f_MSt_msCleanDepth + 1) }; B_dData_dPair.f_Pair_second = (dtb__212 (v_toObj 0)) })
  | C_Control_MkApply (dtb__213, dtb__214) -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic mc1); B_dData_dPair.f_Pair_second = (dtb__213 dtb__214) })
  | C_Control_MkDone (dtb__215) -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic mc1); B_dData_dPair.f_Pair_second = (C_Control_MkDone (dtb__215)) })
  | _ -> failwith "DT: impossible branch"
))

# 815 "Base/Effect/Core.vuna"
let v_machineRun = (fun c -> (((v_runGo 1000000000) v_emptySt) (Obj.magic c)))

# 439 "Base/Effect/Core.vuna"
let v_msFrames = (fun p -> (match p with
  | { f_MSt_msFrames = dtb__216; f_MSt_msCtx = dtb__217; f_MSt_msUsed = dtb__218; f_MSt_msNext = dtb__219; f_MSt_msFree = dtb__220; f_MSt_msEpoch = dtb__221; f_MSt_msCleanups = dtb__222; f_MSt_msCleanDepth = dtb__223 } -> dtb__216
  | _ -> failwith "DT: impossible branch"
))

# 440 "Base/Effect/Core.vuna"
let v_msCtx = (fun p -> (match p with
  | { f_MSt_msFrames = dtb__224; f_MSt_msCtx = dtb__225; f_MSt_msUsed = dtb__226; f_MSt_msNext = dtb__227; f_MSt_msFree = dtb__228; f_MSt_msEpoch = dtb__229; f_MSt_msCleanups = dtb__230; f_MSt_msCleanDepth = dtb__231 } -> dtb__225
  | _ -> failwith "DT: impossible branch"
))

# 441 "Base/Effect/Core.vuna"
let v_msUsed = (fun p -> (match p with
  | { f_MSt_msFrames = dtb__232; f_MSt_msCtx = dtb__233; f_MSt_msUsed = dtb__234; f_MSt_msNext = dtb__235; f_MSt_msFree = dtb__236; f_MSt_msEpoch = dtb__237; f_MSt_msCleanups = dtb__238; f_MSt_msCleanDepth = dtb__239 } -> dtb__234
  | _ -> failwith "DT: impossible branch"
))

# 442 "Base/Effect/Core.vuna"
let v_msNext = (fun p -> (match p with
  | { f_MSt_msFrames = dtb__240; f_MSt_msCtx = dtb__241; f_MSt_msUsed = dtb__242; f_MSt_msNext = dtb__243; f_MSt_msFree = dtb__244; f_MSt_msEpoch = dtb__245; f_MSt_msCleanups = dtb__246; f_MSt_msCleanDepth = dtb__247 } -> dtb__243
  | _ -> failwith "DT: impossible branch"
))

# 443 "Base/Effect/Core.vuna"
let v_msFree = (fun p -> (match p with
  | { f_MSt_msFrames = dtb__248; f_MSt_msCtx = dtb__249; f_MSt_msUsed = dtb__250; f_MSt_msNext = dtb__251; f_MSt_msFree = dtb__252; f_MSt_msEpoch = dtb__253; f_MSt_msCleanups = dtb__254; f_MSt_msCleanDepth = dtb__255 } -> dtb__252
  | _ -> failwith "DT: impossible branch"
))

# 444 "Base/Effect/Core.vuna"
let v_msEpoch = (fun p -> (match p with
  | { f_MSt_msFrames = dtb__256; f_MSt_msCtx = dtb__257; f_MSt_msUsed = dtb__258; f_MSt_msNext = dtb__259; f_MSt_msFree = dtb__260; f_MSt_msEpoch = dtb__261; f_MSt_msCleanups = dtb__262; f_MSt_msCleanDepth = dtb__263 } -> dtb__261
  | _ -> failwith "DT: impossible branch"
))

# 445 "Base/Effect/Core.vuna"
let v_msCleanups = (fun p -> (match p with
  | { f_MSt_msFrames = dtb__264; f_MSt_msCtx = dtb__265; f_MSt_msUsed = dtb__266; f_MSt_msNext = dtb__267; f_MSt_msFree = dtb__268; f_MSt_msEpoch = dtb__269; f_MSt_msCleanups = dtb__270; f_MSt_msCleanDepth = dtb__271 } -> dtb__270
  | _ -> failwith "DT: impossible branch"
))

# 446 "Base/Effect/Core.vuna"
let v_msCleanDepth = (fun p -> (match p with
  | { f_MSt_msFrames = dtb__272; f_MSt_msCtx = dtb__273; f_MSt_msUsed = dtb__274; f_MSt_msNext = dtb__275; f_MSt_msFree = dtb__276; f_MSt_msEpoch = dtb__277; f_MSt_msCleanups = dtb__278; f_MSt_msCleanDepth = dtb__279 } -> dtb__279
  | _ -> failwith "DT: impossible branch"
))
