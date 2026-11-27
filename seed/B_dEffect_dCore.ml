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

# 114 "Base/Effect/Core.vuna"
let v_weaken = (fun dtb_u_u43 -> (let dtb_u_u44 = Obj.obj (dtb_u_u43) in (Obj.repr (dtb_u_u44))))

# 120 "Base/Effect/Core.vuna"
let v_runThunk = (fun dtb_u_u47 -> (let dtb_u_u48 = Obj.obj (dtb_u_u47) in dtb_u_u48))

# 127 "Base/Effect/Core.vuna"
let v_runPure = (fun dtb_u_u50 -> ((v_runThunk dtb_u_u50) C_EffUnit_MkEffUnit))

# 131 "Base/Effect/Core.vuna"
let v_runEff = (fun dtb_u_u53 -> ((v_runThunk dtb_u_u53) C_EffUnit_MkEffUnit))

# 141 "Base/Effect/Core.vuna"
let v_scope = (fun dtb_u_u57 -> (C_Scoped_MkScoped ((fun (dtb_u_u58 : int) -> ((v_runThunk dtb_u_u57) C_EffUnit_MkEffUnit)))))

# 147 "Base/Effect/Core.vuna"
let v_handleScoped = (fun dtb_u_u61 -> (match dtb_u_u61 with
  | C_Scoped_MkScoped (dtb_u_u62) -> (dtp_effect_self dtb_u_u62)
  | _ -> failwith "DT: impossible branch"
))

# 151 "Base/Effect/Core.vuna"
let v_handleSelf = (fun dtb_u_u67 -> (v_handleScoped (v_scope dtb_u_u67)))

# 157 "Base/Effect/Core.vuna"
let v_runMain = (fun dtb_u_u70 -> ((v_runThunk dtb_u_u70) C_EffUnit_MkEffUnit))

# 163 "Base/Effect/Core.vuna"
let v_joinEff = (fun dtb_u_u74 -> (Obj.repr ((fun (dtb_u_u75 : t_EffUnit) -> (let dtb_u_u76 = Obj.obj (dtb_u_u74) in (let dtb_u_u77 = Obj.obj ((dtb_u_u76 dtb_u_u75)) in (dtb_u_u77 dtb_u_u75)))))))

# 176 "Base/Effect/Core.vuna"
let v_joinEffNilOuter = (fun dtb_u_u80 -> (Obj.repr ((fun (dtb_u_u81 : t_EffUnit) -> (let dtb_u_u82 = Obj.obj (dtb_u_u80) in (let dtb_u_u83 = Obj.obj ((dtb_u_u82 dtb_u_u81)) in (dtb_u_u83 dtb_u_u81)))))))

# 189 "Base/Effect/Core.vuna"
let v_joinEffNilInner = (fun dtb_u_u86 -> (Obj.repr ((fun (dtb_u_u87 : t_EffUnit) -> (let dtb_u_u88 = Obj.obj (dtb_u_u86) in (let dtb_u_u89 = Obj.obj ((dtb_u_u88 dtb_u_u87)) in (dtb_u_u89 dtb_u_u87)))))))

# 201 "Base/Effect/Core.vuna"
let v_dropEffHead = (fun dtb_u_u93 -> (let dtb_u_u94 = Obj.obj (dtb_u_u93) in (Obj.repr (dtb_u_u94))))

# 208 "Base/Effect/Core.vuna"
let v_weakenRow = (fun (dtb_u_u96 : t_Row) dtb_u_u98 -> (Obj.repr ((fun (dtb_u_u99 : t_EffUnit) -> (let dtb_u_u100 = Obj.obj (dtb_u_u98) in (dtb_u_u100 dtb_u_u99))))))

# 217 "Base/Effect/Core.vuna"
let v_raise = (fun dtb_u_u103 -> (let dtb_u_u104 = Obj.obj (dtb_u_u103) in (Obj.repr (dtb_u_u104))))

# 222 "Base/Effect/Core.vuna"
let v_raiseTo = (fun (dtb_u_u105 : t_Row) dtb_u_u107 -> (Obj.repr ((fun (dtb_u_u108 : t_EffUnit) -> (let dtb_u_u109 = Obj.obj (dtb_u_u107) in (dtb_u_u109 dtb_u_u108))))))

# 235 "Base/Effect/Core.vuna"
let v_sendCoreId = (fun (dtb_u_u114 : string) (dtb_u_u115 : string) (dtb_u_u116 : int) (dtb_u_u117 : int) dtb_u_u118 -> (Obj.repr ((fun (dtb_u_u119 : t_EffUnit) -> ((((((fun key name kid nid v -> Obj.obj (Effect.perform (Perform (kid, nid, key, name, Obj.repr v)))) dtb_u_u114) dtb_u_u115) dtb_u_u116) dtb_u_u117) dtb_u_u118)))))

# 231 "Base/Effect/Core.vuna"
let v_sendCore = (fun (dtb_u_u124 : string) (dtb_u_u125 : string) dtb_u_u126 -> (((((v_sendCoreId dtb_u_u124) dtb_u_u125) (dtp_effectId dtb_u_u124)) (dtp_effectId dtb_u_u125)) dtb_u_u126))

# 245 "Base/Effect/Core.vuna"
let v_sigFn = C_EffSig_MkEffSig

# 263 "Base/Effect/Core.vuna"
let v_performCoreId = (fun (dtb_u_u128 : string) (dtb_u_u129 : string) (dtb_u_u130 : int) (dtb_u_u131 : int) dtb_u_u136 -> (((((v_sendCoreId dtb_u_u129) dtb_u_u128) dtb_u_u131) dtb_u_u130) (Obj.magic dtb_u_u136)))

# 259 "Base/Effect/Core.vuna"
let v_performCore = (fun (dtb_u_u137 : string) (dtb_u_u138 : string) dtb_u_u143 -> (((((v_performCoreId dtb_u_u137) dtb_u_u138) (dtp_effectId dtb_u_u137)) (dtp_effectId dtb_u_u138)) (Obj.magic dtb_u_u143)))

# 272 "Base/Effect/Core.vuna"
let v_handleCoreId = (fun (dtb_u_u150 : string) (dtb_u_u151 : string) (dtb_u_u152 : int) (dtb_u_u153 : int) dtb_u_u154 dtb_u_u155 dtb_u_u156 -> (Obj.repr ((fun (dtb_u_u157 : t_EffUnit) -> (let dtb_u_u158 = Obj.obj (dtb_u_u156) in ((((((((dtp_effect_handle_id dtb_u_u150) dtb_u_u151) dtb_u_u152) dtb_u_u153) dtb_u_u154) dtb_u_u155) dtb_u_u158) dtb_u_u157))))))

# 267 "Base/Effect/Core.vuna"
let v_handleCore = (fun (dtb_u_u165 : string) (dtb_u_u166 : string) dtb_u_u167 dtb_u_u168 dtb_u_u169 -> (((((((v_handleCoreId dtb_u_u165) dtb_u_u166) (dtp_effectId dtb_u_u165)) (dtp_effectId dtb_u_u166)) dtb_u_u167) dtb_u_u168) dtb_u_u169))

# 286 "Base/Effect/Core.vuna"
let v_handleCoreAtId = (fun (dtb_u_u176 : string) (dtb_u_u177 : string) (dtb_u_u178 : int) (dtb_u_u179 : int) dtb_u_u180 dtb_u_u181 dtb_u_u182 -> (Obj.repr ((fun (dtb_u_u183 : t_EffUnit) -> (let dtb_u_u184 = Obj.obj (dtb_u_u182) in ((((((((dtp_effect_handle_id dtb_u_u176) dtb_u_u177) dtb_u_u178) dtb_u_u179) dtb_u_u180) dtb_u_u181) dtb_u_u184) dtb_u_u183))))))

# 281 "Base/Effect/Core.vuna"
let v_handleCoreAt = (fun (dtb_u_u191 : string) (dtb_u_u192 : string) dtb_u_u193 dtb_u_u194 dtb_u_u195 -> (((((((v_handleCoreAtId dtb_u_u191) dtb_u_u192) (dtp_effectId dtb_u_u191)) (dtp_effectId dtb_u_u192)) dtb_u_u193) dtb_u_u194) dtb_u_u195))

# 305 "Base/Effect/Core.vuna"
let v_toObj = (fun dtb_u_u197 -> (Obj.repr dtb_u_u197))

# 309 "Base/Effect/Core.vuna"
let v_fromObj = (fun dtb_u_u199 -> (Obj.obj (Obj.magic dtb_u_u199)))

# 318 "Base/Effect/Core.vuna"
let v_resumeCont = (fun dtb_u_u202 dtb_u_u203 -> (match dtb_u_u202 with
  | C_Cont_MkCont (dtb_u_u204) -> (dtb_u_u204 dtb_u_u203)
  | _ -> failwith "DT: impossible branch"
))

# 324 "Base/Effect/Core.vuna"
let v_contAdapter = (fun dtb_u_u208 dtb_u_u210 dtb_u_u211 -> ((dtb_u_u208 dtb_u_u210) (C_Cont_MkCont (dtb_u_u211))))

# 333 "Base/Effect/Core.vuna"
let v_handleCoreLinId = (fun (dtb_u_u218 : string) (dtb_u_u219 : string) (dtb_u_u220 : int) (dtb_u_u221 : int) dtb_u_u222 dtb_u_u223 dtb_u_u224 -> (((((((v_handleCoreId dtb_u_u218) dtb_u_u219) dtb_u_u220) dtb_u_u221) dtb_u_u222) (v_contAdapter dtb_u_u223)) dtb_u_u224))

# 328 "Base/Effect/Core.vuna"
let v_handleCoreLin = (fun (dtb_u_u231 : string) (dtb_u_u232 : string) dtb_u_u233 dtb_u_u234 dtb_u_u235 -> (((((((v_handleCoreLinId dtb_u_u231) dtb_u_u232) (dtp_effectId dtb_u_u231)) (dtp_effectId dtb_u_u232)) dtb_u_u233) dtb_u_u234) dtb_u_u235))

# 347 "Base/Effect/Core.vuna"
let v_handleWithId = (fun (dtb_u_u238 : string) (dtb_u_u239 : string) (dtb_u_u240 : int) (dtb_u_u241 : int) dtb_u_u246 dtb_u_u248 dtb_u_u249 -> (((((((v_handleCoreId dtb_u_u239) dtb_u_u238) dtb_u_u241) dtb_u_u240) dtb_u_u248) (Obj.magic dtb_u_u249)) dtb_u_u246))

# 343 "Base/Effect/Core.vuna"
let v_handleWith = (fun (dtb_u_u252 : string) (dtb_u_u253 : string) dtb_u_u258 dtb_u_u260 dtb_u_u261 -> (((((((v_handleWithId dtb_u_u252) dtb_u_u253) (dtp_effectId dtb_u_u252)) (dtp_effectId dtb_u_u253)) dtb_u_u258) dtb_u_u260) (Obj.magic dtb_u_u261)))

# 358 "Base/Effect/Core.vuna"
let v_handleWithAtId = (fun (dtb_u_u264 : string) (dtb_u_u265 : string) (dtb_u_u266 : int) (dtb_u_u267 : int) dtb_u_u272 dtb_u_u273 dtb_u_u274 -> (((((((v_handleCoreAtId dtb_u_u265) dtb_u_u264) dtb_u_u267) dtb_u_u266) dtb_u_u273) (Obj.magic dtb_u_u274)) dtb_u_u272))

# 353 "Base/Effect/Core.vuna"
let v_handleWithAt = (fun (dtb_u_u277 : string) (dtb_u_u278 : string) dtb_u_u283 dtb_u_u284 dtb_u_u285 -> (((((((v_handleWithAtId dtb_u_u277) dtb_u_u278) (dtp_effectId dtb_u_u277)) (dtp_effectId dtb_u_u278)) dtb_u_u283) dtb_u_u284) (Obj.magic dtb_u_u285)))

# 367 "Base/Effect/Core.vuna"
let v_mkCont = (fun dtb_u_u288 -> (C_Cont_MkCont (dtb_u_u288)))

# 373 "Base/Effect/Core.vuna"
let v_pushCleanup = (fun (dtb_u_u290 : (int) -> int) -> (v_effPrim (fun (dtb_u_u291 : int) -> (dtp_cleanup_push dtb_u_u290))))

# 376 "Base/Effect/Core.vuna"
let v_popCleanup = (v_effPrim (fun (dtb_u_u293 : int) -> (dtp_cleanup_pop 0)))

# 379 "Base/Effect/Core.vuna"
let v_bracket = (fun dtb_u_u297 dtb_u_u298 dtb_u_u299 -> (Obj.repr ((fun (dtb_u_u304 : t_EffUnit) -> (let dtb_u_u305 = Obj.obj (dtb_u_u297) in (let dtb_u_u307 = (dtb_u_u305 dtb_u_u304) in (let dtb_u_u313 = Obj.obj ((v_pushCleanup (fun (dtb_u_u315 : int) -> (v_runEff (dtb_u_u298 dtb_u_u307))))) in (let dtb_u_u316 = (dtb_u_u313 dtb_u_u304) in (let dtb_u_u322 = Obj.obj ((dtb_u_u299 dtb_u_u307)) in (let dtb_u_u324 = (dtb_u_u322 dtb_u_u304) in (let dtb_u_u330 = Obj.obj (v_popCleanup) in (let dtb_u_u332 = (dtb_u_u330 dtb_u_u304) in (let dtb_u_u338 = Obj.obj ((dtb_u_u298 dtb_u_u307)) in (let dtb_u_u340 = (dtb_u_u338 dtb_u_u304) in (let dtb_u_u342 = dtb_u_u324 in dtb_u_u342)))))))))))))))

# 390 "Base/Effect/Core.vuna"
let v_finally = (fun dtb_u_u346 (dtb_u_u347 : int t_Eff) -> (((v_bracket (let dtb_u_u349 = 0 in (Obj.repr ((fun (dtb_u_u350 : t_EffUnit) -> dtb_u_u349))))) (fun (dtb_u_u351 : int) -> dtb_u_u347)) (fun (dtb_u_u352 : int) -> dtb_u_u346)))

# 433 "Base/Effect/Core.vuna"
let v_usedSmallLimit = 8

# 449 "Base/Effect/Core.vuna"
let v_emptySt = { f_MSt_msFrames = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msCtx = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msUsed = (C_Used_MkUsedSmall (B_dData_dList.C_List_Nil)); f_MSt_msNext = 0; f_MSt_msFree = B_dData_dList.C_List_Nil; f_MSt_msEpoch = 0; f_MSt_msCleanups = B_dData_dList.C_List_Nil; f_MSt_msCleanDepth = 0 }

# 452 "Base/Effect/Core.vuna"
let v_frameKey = (fun dtb_u_u355 -> (match dtb_u_u355 with
  | C_Frame_MkFrame (dtb_u_u356, dtb_u_u357, dtb_u_u358, dtb_u_u359, dtb_u_u360, dtb_u_u361, dtb_u_u362, dtb_u_u363, dtb_u_u364) -> dtb_u_u356
  | _ -> failwith "DT: impossible branch"
))

# 455 "Base/Effect/Core.vuna"
let v_frameName = (fun dtb_u_u366 -> (match dtb_u_u366 with
  | C_Frame_MkFrame (dtb_u_u367, dtb_u_u368, dtb_u_u369, dtb_u_u370, dtb_u_u371, dtb_u_u372, dtb_u_u373, dtb_u_u374, dtb_u_u375) -> dtb_u_u368
  | _ -> failwith "DT: impossible branch"
))

# 458 "Base/Effect/Core.vuna"
let v_frameRet = (fun dtb_u_u377 -> (match dtb_u_u377 with
  | C_Frame_MkFrame (dtb_u_u378, dtb_u_u379, dtb_u_u380, dtb_u_u381, dtb_u_u382, dtb_u_u383, dtb_u_u384, dtb_u_u385, dtb_u_u386) -> dtb_u_u380
  | _ -> failwith "DT: impossible branch"
))

# 461 "Base/Effect/Core.vuna"
let v_frameOpH = (fun dtb_u_u388 -> (match dtb_u_u388 with
  | C_Frame_MkFrame (dtb_u_u389, dtb_u_u390, dtb_u_u391, dtb_u_u392, dtb_u_u393, dtb_u_u394, dtb_u_u395, dtb_u_u396, dtb_u_u397) -> dtb_u_u392
  | _ -> failwith "DT: impossible branch"
))

# 464 "Base/Effect/Core.vuna"
let v_frameComp = (fun dtb_u_u399 -> (match dtb_u_u399 with
  | C_Frame_MkFrame (dtb_u_u400, dtb_u_u401, dtb_u_u402, dtb_u_u403, dtb_u_u404, dtb_u_u405, dtb_u_u406, dtb_u_u407, dtb_u_u408) -> dtb_u_u404
  | _ -> failwith "DT: impossible branch"
))

# 467 "Base/Effect/Core.vuna"
let v_frameKOuter = (fun dtb_u_u410 -> (match dtb_u_u410 with
  | C_Frame_MkFrame (dtb_u_u411, dtb_u_u412, dtb_u_u413, dtb_u_u414, dtb_u_u415, dtb_u_u416, dtb_u_u417, dtb_u_u418, dtb_u_u419) -> dtb_u_u416
  | _ -> failwith "DT: impossible branch"
))

# 470 "Base/Effect/Core.vuna"
let v_framePrev = (fun dtb_u_u421 -> (match dtb_u_u421 with
  | C_Frame_MkFrame (dtb_u_u422, dtb_u_u423, dtb_u_u424, dtb_u_u425, dtb_u_u426, dtb_u_u427, dtb_u_u428, dtb_u_u429, dtb_u_u430) -> dtb_u_u428
  | _ -> failwith "DT: impossible branch"
))

# 473 "Base/Effect/Core.vuna"
let v_frameCleanDepth = (fun dtb_u_u432 -> (match dtb_u_u432 with
  | C_Frame_MkFrame (dtb_u_u433, dtb_u_u434, dtb_u_u435, dtb_u_u436, dtb_u_u437, dtb_u_u438, dtb_u_u439, dtb_u_u440, dtb_u_u441) -> dtb_u_u440
  | _ -> failwith "DT: impossible branch"
))

# 476 "Base/Effect/Core.vuna"
let v_frameIdOf = (fun dtb_u_u443 -> (match dtb_u_u443 with
  | C_Frame_MkFrame (dtb_u_u444, dtb_u_u445, dtb_u_u446, dtb_u_u447, dtb_u_u448, dtb_u_u449, dtb_u_u450, dtb_u_u451, dtb_u_u452) -> dtb_u_u452
  | _ -> failwith "DT: impossible branch"
))

# 479 "Base/Effect/Core.vuna"
let v_ctxPrompt = (fun dtb_u_u454 -> (match dtb_u_u454 with
  | C_Ctx_MkCtx (dtb_u_u455, dtb_u_u456, dtb_u_u457, dtb_u_u458) -> dtb_u_u455
  | _ -> failwith "DT: impossible branch"
))

# 482 "Base/Effect/Core.vuna"
let v_ctxKRest = (fun dtb_u_u460 -> (match dtb_u_u460 with
  | C_Ctx_MkCtx (dtb_u_u461, dtb_u_u462, dtb_u_u463, dtb_u_u464) -> dtb_u_u462
  | _ -> failwith "DT: impossible branch"
))

# 485 "Base/Effect/Core.vuna"
let v_ctxPrev = (fun dtb_u_u466 -> (match dtb_u_u466 with
  | C_Ctx_MkCtx (dtb_u_u467, dtb_u_u468, dtb_u_u469, dtb_u_u470) -> dtb_u_u469
  | _ -> failwith "DT: impossible branch"
))

# 488 "Base/Effect/Core.vuna"
let v_ctxSlot = (fun dtb_u_u472 -> (match dtb_u_u472 with
  | C_Ctx_MkCtx (dtb_u_u473, dtb_u_u474, dtb_u_u475, dtb_u_u476) -> dtb_u_u476
  | _ -> failwith "DT: impossible branch"
))

# 505 "Base/Effect/Core.vuna"
let rec v_usedEpochSmall = (fun (dtb_u_u477 : int) (dtb_u_u478 : int) (dtb_u_u479 : int) (dtb_u_u480 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u477 <= 0) then false else (let dtb_u_u481 = dtb_u_u480 in (match dtb_u_u481 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u482, dtb_u_u483) -> (match dtb_u_u482 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u484; B_dData_dPair.f_Pair_second = dtb_u_u485 } -> (if (dtb_u_u484 = dtb_u_u478) then (dtb_u_u479 <= dtb_u_u485) else ((((v_usedEpochSmall (dtb_u_u477 - 1)) dtb_u_u478) dtb_u_u479) dtb_u_u483))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

# 493 "Base/Effect/Core.vuna"
let v_usedEpoch = (fun (dtb_u_u486 : int) (dtb_u_u487 : int) (dtb_u_u488 : int) (dtb_u_u489 : t_Used) -> (if (dtb_u_u486 <= 0) then false else (match dtb_u_u489 with
  | C_Used_MkUsedSmall (dtb_u_u490) -> ((((v_usedEpochSmall (dtb_u_u486 - 1)) dtb_u_u487) dtb_u_u488) dtb_u_u490)
  | C_Used_MkUsedBig (dtb_u_u491) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u487) dtb_u_u491) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u492) -> (dtb_u_u488 <= dtb_u_u492)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 515 "Base/Effect/Core.vuna"
let v_tailSlot = (-1)

# 531 "Base/Effect/Core.vuna"
let rec v_markUsedSmall = (fun (dtb_u_u493 : int) (dtb_u_u494 : int) (dtb_u_u495 : int) (dtb_u_u496 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u493 <= 0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u494; B_dData_dPair.f_Pair_second = dtb_u_u495 }, B_dData_dList.C_List_Nil)) else (let dtb_u_u497 = dtb_u_u496 in (match dtb_u_u497 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u498, dtb_u_u499) -> (match dtb_u_u498 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u500; B_dData_dPair.f_Pair_second = dtb_u_u501 } -> (if (dtb_u_u500 = dtb_u_u494) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u494; B_dData_dPair.f_Pair_second = dtb_u_u495 }, dtb_u_u499)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u500; B_dData_dPair.f_Pair_second = dtb_u_u501 }, ((((v_markUsedSmall (dtb_u_u493 - 1)) dtb_u_u494) dtb_u_u495) dtb_u_u499))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u494; B_dData_dPair.f_Pair_second = dtb_u_u495 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))

# 540 "Base/Effect/Core.vuna"
let rec v_usedLen = (fun (dtb_u_u502 : int) (dtb_u_u503 : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u502 <= 0) then 0 else (match dtb_u_u503 with
  | B_dData_dList.C_List_Nil -> 0
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u504, dtb_u_u505) -> (1 + ((v_usedLen (dtb_u_u502 - 1)) dtb_u_u505))
  | _ -> failwith "DT: impossible branch"
)))

# 519 "Base/Effect/Core.vuna"
let v_markUsed = (fun (dtb_u_u506 : int) (dtb_u_u507 : int) (dtb_u_u508 : int) (dtb_u_u509 : t_Used) -> (if (dtb_u_u506 <= 0) then (C_Used_MkUsedSmall ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u507; B_dData_dPair.f_Pair_second = dtb_u_u508 }, B_dData_dList.C_List_Nil)))) else (match dtb_u_u509 with
  | C_Used_MkUsedSmall (dtb_u_u510) -> (let dtb_u_u511 = ((((v_markUsedSmall (dtb_u_u506 - 1)) dtb_u_u507) dtb_u_u508) dtb_u_u510) in (if (((v_usedLen (dtb_u_u506 - 1)) dtb_u_u511) > v_usedSmallLimit) then (C_Used_MkUsedBig ((((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u511))) else (C_Used_MkUsedSmall (dtb_u_u511))))
  | C_Used_MkUsedBig (dtb_u_u512) -> (C_Used_MkUsedBig ((((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u507) dtb_u_u508) dtb_u_u512)))
  | _ -> failwith "DT: impossible branch"
)))

# 550 "Base/Effect/Core.vuna"
let v_prependFree = (fun (dtb_u_u513 : int) (dtb_u_u514 : int B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u513, dtb_u_u514)))

# 553 "Base/Effect/Core.vuna"
let v_samePrompt = (fun dtb_u_u516 dtb_u_u517 -> ((v_frameIdOf dtb_u_u516) = (v_frameIdOf dtb_u_u517)))

# 556 "Base/Effect/Core.vuna"
let rec v_depth = (fun (dtb_u_u519 : int) dtb_u_u520 -> (if (dtb_u_u519 <= 0) then 0 else (match dtb_u_u520 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u521) -> (1 + ((v_depth (dtb_u_u519 - 1)) (v_framePrev dtb_u_u521)))
  | _ -> failwith "DT: impossible branch"
)))

# 565 "Base/Effect/Core.vuna"
let rec v_inChain = (fun (dtb_u_u523 : int) dtb_u_u524 dtb_u_u525 -> (if (dtb_u_u523 <= 0) then false else (match dtb_u_u525 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u526) -> (if ((v_samePrompt dtb_u_u524) dtb_u_u526) then true else (((v_inChain (dtb_u_u523 - 1)) dtb_u_u524) (v_framePrev dtb_u_u526)))
  | _ -> failwith "DT: impossible branch"
)))

# 575 "Base/Effect/Core.vuna"
let v_reinstall = (fun dtb_u_u528 dtb_u_u529 -> (match dtb_u_u528 with
  | C_Frame_MkFrame (dtb_u_u530, dtb_u_u531, dtb_u_u532, dtb_u_u533, dtb_u_u534, dtb_u_u535, dtb_u_u536, dtb_u_u537, dtb_u_u538) -> (C_Frame_MkFrame (dtb_u_u530, dtb_u_u531, dtb_u_u532, dtb_u_u533, dtb_u_u534, dtb_u_u535, dtb_u_u529, dtb_u_u537, dtb_u_u538))
  | _ -> failwith "DT: impossible branch"
))

# 579 "Base/Effect/Core.vuna"
let v_reinstallIfMissing = (fun (dtb_u_u540 : int) dtb_u_u541 dtb_u_u542 -> (if (((v_inChain dtb_u_u540) dtb_u_u541) dtb_u_u542) then dtb_u_u542 else (B_dData_dMaybe.C_Maybe_Just (((v_reinstall dtb_u_u541) dtb_u_u542)))))

# 582 "Base/Effect/Core.vuna"
let rec v_findFrame = (fun (dtb_u_u544 : int) (dtb_u_u545 : int) (dtb_u_u546 : int) dtb_u_u547 -> (if (dtb_u_u544 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u547 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u548) -> (if (if ((v_frameKey dtb_u_u548) = dtb_u_u545) then ((v_frameName dtb_u_u548) = dtb_u_u546) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u548)) else ((((v_findFrame (dtb_u_u544 - 1)) dtb_u_u545) dtb_u_u546) (v_framePrev dtb_u_u548)))
  | _ -> failwith "DT: impossible branch"
)))

# 767 "Base/Effect/Core.vuna"
let rec v_removeFrame = (fun (dtb_u_u550 : int) dtb_u_u551 dtb_u_u552 -> (if (dtb_u_u550 <= 0) then dtb_u_u552 else (match dtb_u_u552 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u553) -> (if ((v_samePrompt dtb_u_u553) dtb_u_u551) then (v_framePrev dtb_u_u553) else (match dtb_u_u553 with
  | C_Frame_MkFrame (dtb_u_u554, dtb_u_u555, dtb_u_u556, dtb_u_u557, dtb_u_u558, dtb_u_u559, dtb_u_u560, dtb_u_u561, dtb_u_u562) -> (B_dData_dMaybe.C_Maybe_Just ((C_Frame_MkFrame (dtb_u_u554, dtb_u_u555, dtb_u_u556, dtb_u_u557, dtb_u_u558, dtb_u_u559, (((v_removeFrame (dtb_u_u550 - 1)) dtb_u_u551) (v_framePrev dtb_u_u553)), dtb_u_u561, dtb_u_u562))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 796 "Base/Effect/Core.vuna"
let v_cleanupRun = (fun (dtb_u_u563 : t_Cleanup) -> (match dtb_u_u563 with
  | C_Cleanup_MkCleanup (dtb_u_u564) -> (dtb_u_u564 0)
  | _ -> failwith "DT: impossible branch"
))

# 800 "Base/Effect/Core.vuna"
let rec v_dropCleanups = (fun (dtb_u_u565 : int) (dtb_u_u566 : int) (dtb_u_u567 : t_Cleanup B_dData_dList.t_List) (dtb_u_u568 : int) -> (if (dtb_u_u565 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u567; B_dData_dPair.f_Pair_second = dtb_u_u568 } else (if (dtb_u_u568 <= dtb_u_u566) then { B_dData_dPair.f_Pair_first = dtb_u_u567; B_dData_dPair.f_Pair_second = dtb_u_u568 } else (match dtb_u_u567 with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u567; B_dData_dPair.f_Pair_second = dtb_u_u568 }
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u569, dtb_u_u570) -> (let dtb_u_u571 = (v_cleanupRun dtb_u_u569) in ((((v_dropCleanups (dtb_u_u565 - 1)) dtb_u_u566) dtb_u_u570) (dtb_u_u568 - 1)))
  | _ -> failwith "DT: impossible branch"
))))

# 781 "Base/Effect/Core.vuna"
let v_finish = (fun (dtb_u_u572 : int) dtb_u_u573 dtb_u_u574 dtb_u_u575 -> (match ((((v_dropCleanups dtb_u_u572) (v_frameCleanDepth (Obj.magic dtb_u_u574))) ((Obj.magic dtb_u_u573)).f_MSt_msCleanups) ((Obj.magic dtb_u_u573)).f_MSt_msCleanDepth) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u576; B_dData_dPair.f_Pair_second = dtb_u_u577 } -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_removeFrame dtb_u_u572) (Obj.magic dtb_u_u574)) ((Obj.magic dtb_u_u573)).f_MSt_msFrames); f_MSt_msCtx = ((Obj.magic dtb_u_u573)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic dtb_u_u573)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic dtb_u_u573)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic dtb_u_u573)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic dtb_u_u573)).f_MSt_msEpoch; f_MSt_msCleanups = dtb_u_u576; f_MSt_msCleanDepth = dtb_u_u577 }; B_dData_dPair.f_Pair_second = ((v_frameKOuter (Obj.magic dtb_u_u574)) (Obj.magic dtb_u_u575)) })
  | _ -> failwith "DT: impossible branch"
))

# 746 "Base/Effect/Core.vuna"
let v_unwind = (fun (dtb_u_u578 : int) dtb_u_u579 dtb_u_u580 dtb_u_u581 -> (match ((Obj.magic dtb_u_u579)).f_MSt_msCtx with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u582) -> (Obj.magic (if ((v_samePrompt (v_ctxPrompt dtb_u_u582)) (Obj.magic dtb_u_u580)) then { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic dtb_u_u579)).f_MSt_msFrames; f_MSt_msCtx = (v_ctxPrev dtb_u_u582); f_MSt_msUsed = ((Obj.magic dtb_u_u579)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic dtb_u_u579)).f_MSt_msNext; f_MSt_msFree = ((v_prependFree (v_ctxSlot dtb_u_u582)) ((Obj.magic dtb_u_u579)).f_MSt_msFree); f_MSt_msEpoch = ((Obj.magic dtb_u_u579)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic dtb_u_u579)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic dtb_u_u579)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((v_ctxKRest dtb_u_u582) (Obj.magic dtb_u_u581)) } else ((((v_finish dtb_u_u578) (Obj.magic dtb_u_u579)) (Obj.magic dtb_u_u580)) (Obj.magic dtb_u_u581))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((((v_finish dtb_u_u578) (Obj.magic dtb_u_u579)) (Obj.magic dtb_u_u580)) (Obj.magic dtb_u_u581)))
  | _ -> failwith "DT: impossible branch"
))

# 595 "Base/Effect/Core.vuna"
let rec v_machineScoped = (fun (dtb_u_u583 : int) dtb_u_u584 dtb_u_u585 dtb_u_u586 -> (match (Obj.magic dtb_u_u586) with
  | C_Scoped_MkScoped (dtb_u_u587) -> (Obj.magic (let dtb_u_u588 = (C_Frame_MkFrame ((v_frameKey (Obj.magic dtb_u_u585)), (v_frameName (Obj.magic dtb_u_u585)), (v_frameRet (Obj.magic dtb_u_u585)), (v_frameOpH (Obj.magic dtb_u_u585)), (fun dtb_u_u590 -> (dtb_u_u587 0)), (fun dtb_u_u591 -> (C_Control_MkDone ((Obj.magic dtb_u_u591)))), (B_dData_dMaybe.C_Maybe_Just ((Obj.magic dtb_u_u585))), ((Obj.magic dtb_u_u584)).f_MSt_msCleanDepth, ((Obj.magic dtb_u_u584)).f_MSt_msNext)) in (((v_runGo (dtb_u_u583 - 1)) { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u588)); f_MSt_msCtx = B_dData_dMaybe.C_Maybe_Nothing; f_MSt_msUsed = ((Obj.magic dtb_u_u584)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic dtb_u_u584)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic dtb_u_u584)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic dtb_u_u584)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic dtb_u_u584)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic dtb_u_u584)).f_MSt_msCleanDepth }) ((dtb_u_u587 0) (fun dtb_u_u589 -> (C_Control_MkReturn (dtb_u_u588, (Obj.magic dtb_u_u589))))))))
  | _ -> failwith "DT: impossible branch"
))
# 617 "Base/Effect/Core.vuna"
and v_runGo = (fun (dtb_u_u592 : int) dtb_u_u593 dtb_u_u594 -> (if (dtb_u_u592 <= 0) then ((fun msg -> failwith msg) "effect machine: fuel exhausted") else (match (Obj.magic dtb_u_u594) with
  | C_Control_MkDone (dtb_u_u595) -> (Obj.magic dtb_u_u595)
  | _ -> (Obj.magic (match (((v_step dtb_u_u592) (Obj.magic dtb_u_u593)) (Obj.magic dtb_u_u594)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u596; B_dData_dPair.f_Pair_second = dtb_u_u597 } -> (Obj.magic (((v_runGo (dtb_u_u592 - 1)) dtb_u_u596) dtb_u_u597))
  | _ -> failwith "DT: impossible branch"
))
)))
# 628 "Base/Effect/Core.vuna"
and v_step = (fun (dtb_u_u598 : int) dtb_u_u599 dtb_u_u600 -> (match (Obj.magic dtb_u_u600) with
  | C_Control_MkHandle (dtb_u_u601, dtb_u_u602, dtb_u_u603, dtb_u_u604, dtb_u_u605, dtb_u_u606) -> (Obj.magic (let dtb_u_u607 = (C_Frame_MkFrame (dtb_u_u601, dtb_u_u602, dtb_u_u603, dtb_u_u604, dtb_u_u605, dtb_u_u606, ((Obj.magic dtb_u_u599)).f_MSt_msFrames, ((Obj.magic dtb_u_u599)).f_MSt_msCleanDepth, ((Obj.magic dtb_u_u599)).f_MSt_msNext)) in { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u607)); f_MSt_msCtx = ((Obj.magic dtb_u_u599)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic dtb_u_u599)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic dtb_u_u599)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic dtb_u_u599)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic dtb_u_u599)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic dtb_u_u599)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic dtb_u_u599)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((dtb_u_u605 (v_toObj 0)) (fun dtb_u_u608 -> (C_Control_MkReturn (dtb_u_u607, (Obj.magic dtb_u_u608))))) }))
  | C_Control_MkSelf (dtb_u_u609, dtb_u_u610) -> (Obj.magic (match ((Obj.magic dtb_u_u599)).f_MSt_msFrames with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "handleScoped outside handler"))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u611) -> (Obj.magic (let dtb_u_u612 = (C_Frame_MkFrame ((v_frameKey dtb_u_u611), (v_frameName dtb_u_u611), (v_frameRet dtb_u_u611), (v_frameOpH dtb_u_u611), dtb_u_u609, dtb_u_u610, ((Obj.magic dtb_u_u599)).f_MSt_msFrames, ((Obj.magic dtb_u_u599)).f_MSt_msCleanDepth, ((Obj.magic dtb_u_u599)).f_MSt_msNext)) in { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u612)); f_MSt_msCtx = ((Obj.magic dtb_u_u599)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic dtb_u_u599)).f_MSt_msUsed; f_MSt_msNext = (((Obj.magic dtb_u_u599)).f_MSt_msNext + 1); f_MSt_msFree = ((Obj.magic dtb_u_u599)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic dtb_u_u599)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic dtb_u_u599)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic dtb_u_u599)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = ((dtb_u_u609 (v_toObj 0)) (fun dtb_u_u613 -> (C_Control_MkReturn (dtb_u_u612, (Obj.magic dtb_u_u613))))) }))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkPerform (dtb_u_u614, dtb_u_u615, dtb_u_u616, dtb_u_u617) -> (Obj.magic (match ((((v_findFrame (dtb_u_u598 - 1)) dtb_u_u614) dtb_u_u615) ((Obj.magic dtb_u_u599)).f_MSt_msFrames) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((fun msg -> failwith msg) "unhandled effect"))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u618) -> (Obj.magic (let dtb_u_u619 = (match ((Obj.magic dtb_u_u599)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u631, dtb_u_u632) -> dtb_u_u631
  | B_dData_dList.C_List_Nil -> ((Obj.magic dtb_u_u599)).f_MSt_msNext
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u620 = (match ((Obj.magic dtb_u_u599)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u629, dtb_u_u630) -> dtb_u_u630
  | B_dData_dList.C_List_Nil -> ((Obj.magic dtb_u_u599)).f_MSt_msFree
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u621 = (match ((Obj.magic dtb_u_u599)).f_MSt_msFree with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u627, dtb_u_u628) -> ((Obj.magic dtb_u_u599)).f_MSt_msNext
  | B_dData_dList.C_List_Nil -> (((Obj.magic dtb_u_u599)).f_MSt_msNext + 1)
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u622 = (((Obj.magic dtb_u_u599)).f_MSt_msEpoch + 1) in { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic dtb_u_u599)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic dtb_u_u599)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic dtb_u_u599)).f_MSt_msUsed; f_MSt_msNext = dtb_u_u621; f_MSt_msFree = dtb_u_u620; f_MSt_msEpoch = dtb_u_u622; f_MSt_msCleanups = ((Obj.magic dtb_u_u599)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic dtb_u_u599)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (((((v_frameOpH dtb_u_u618) dtb_u_u616) (fun dtb_u_u623 dtb_u_u624 -> (C_Control_MkResume (dtb_u_u618, dtb_u_u617, dtb_u_u619, dtb_u_u622, (Obj.magic dtb_u_u623), dtb_u_u624)))) (fun dtb_u_u625 -> (C_Control_MkKDone (dtb_u_u618, (Obj.magic dtb_u_u625))))) (fun dtb_u_u626 -> ((((v_machineScoped (dtb_u_u598 - 1)) (Obj.magic dtb_u_u599)) dtb_u_u618) dtb_u_u626))) })))))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkResume (dtb_u_u633, dtb_u_u634, dtb_u_u635, dtb_u_u636, dtb_u_u637, dtb_u_u638) -> (Obj.magic (match dtb_u_u638 with
  | C_Rest_MkRestTail -> (Obj.magic (if ((((v_usedEpoch (dtb_u_u598 - 1)) v_tailSlot) dtb_u_u636) ((Obj.magic dtb_u_u599)).f_MSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_reinstallIfMissing (dtb_u_u598 - 1)) dtb_u_u633) ((Obj.magic dtb_u_u599)).f_MSt_msFrames); f_MSt_msCtx = ((Obj.magic dtb_u_u599)).f_MSt_msCtx; f_MSt_msUsed = ((((v_markUsed (dtb_u_u598 - 1)) v_tailSlot) dtb_u_u636) ((Obj.magic dtb_u_u599)).f_MSt_msUsed); f_MSt_msNext = ((Obj.magic dtb_u_u599)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic dtb_u_u599)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic dtb_u_u599)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic dtb_u_u599)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic dtb_u_u599)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (dtb_u_u634 dtb_u_u637) }))
  | C_Rest_MkRestCont (dtb_u_u639) -> (Obj.magic (if ((((v_usedEpoch (dtb_u_u598 - 1)) dtb_u_u635) dtb_u_u636) ((Obj.magic dtb_u_u599)).f_MSt_msUsed) then ((fun msg -> failwith msg) "continuation already resumed") else { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = (((v_reinstallIfMissing (dtb_u_u598 - 1)) dtb_u_u633) ((Obj.magic dtb_u_u599)).f_MSt_msFrames); f_MSt_msCtx = (B_dData_dMaybe.C_Maybe_Just ((C_Ctx_MkCtx (dtb_u_u633, dtb_u_u639, ((Obj.magic dtb_u_u599)).f_MSt_msCtx, dtb_u_u635)))); f_MSt_msUsed = ((((v_markUsed (dtb_u_u598 - 1)) dtb_u_u635) dtb_u_u636) ((Obj.magic dtb_u_u599)).f_MSt_msUsed); f_MSt_msNext = ((Obj.magic dtb_u_u599)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic dtb_u_u599)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic dtb_u_u599)).f_MSt_msEpoch; f_MSt_msCleanups = ((Obj.magic dtb_u_u599)).f_MSt_msCleanups; f_MSt_msCleanDepth = ((Obj.magic dtb_u_u599)).f_MSt_msCleanDepth }; B_dData_dPair.f_Pair_second = (dtb_u_u634 dtb_u_u637) }))
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkReturn (dtb_u_u640, dtb_u_u641) -> (Obj.magic ((((v_unwind dtb_u_u598) (Obj.magic dtb_u_u599)) dtb_u_u640) ((v_frameRet dtb_u_u640) dtb_u_u641)))
  | C_Control_MkKDone (dtb_u_u642, dtb_u_u643) -> (Obj.magic ((((v_unwind dtb_u_u598) (Obj.magic dtb_u_u599)) dtb_u_u642) dtb_u_u643))
  | C_Control_MkPopCleanup (dtb_u_u644) -> (Obj.magic (match ((Obj.magic dtb_u_u599)).f_MSt_msCleanups with
  | B_dData_dList.C_List_Nil -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic dtb_u_u599); B_dData_dPair.f_Pair_second = (dtb_u_u644 (v_toObj 0)) })
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u645, dtb_u_u646) -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic dtb_u_u599)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic dtb_u_u599)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic dtb_u_u599)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic dtb_u_u599)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic dtb_u_u599)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic dtb_u_u599)).f_MSt_msEpoch; f_MSt_msCleanups = dtb_u_u646; f_MSt_msCleanDepth = (((Obj.magic dtb_u_u599)).f_MSt_msCleanDepth - 1) }; B_dData_dPair.f_Pair_second = (dtb_u_u644 (v_toObj 0)) })
  | _ -> failwith "DT: impossible branch"
))
  | C_Control_MkPushCleanup (dtb_u_u647, dtb_u_u648) -> (Obj.magic { B_dData_dPair.f_Pair_first = { f_MSt_msFrames = ((Obj.magic dtb_u_u599)).f_MSt_msFrames; f_MSt_msCtx = ((Obj.magic dtb_u_u599)).f_MSt_msCtx; f_MSt_msUsed = ((Obj.magic dtb_u_u599)).f_MSt_msUsed; f_MSt_msNext = ((Obj.magic dtb_u_u599)).f_MSt_msNext; f_MSt_msFree = ((Obj.magic dtb_u_u599)).f_MSt_msFree; f_MSt_msEpoch = ((Obj.magic dtb_u_u599)).f_MSt_msEpoch; f_MSt_msCleanups = (B_dData_dList.C_List__x58__x58_ (dtb_u_u647, ((Obj.magic dtb_u_u599)).f_MSt_msCleanups)); f_MSt_msCleanDepth = (((Obj.magic dtb_u_u599)).f_MSt_msCleanDepth + 1) }; B_dData_dPair.f_Pair_second = (dtb_u_u648 (v_toObj 0)) })
  | C_Control_MkApply (dtb_u_u649, dtb_u_u650) -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic dtb_u_u599); B_dData_dPair.f_Pair_second = (dtb_u_u649 dtb_u_u650) })
  | C_Control_MkDone (dtb_u_u651) -> (Obj.magic { B_dData_dPair.f_Pair_first = (Obj.magic dtb_u_u599); B_dData_dPair.f_Pair_second = (C_Control_MkDone (dtb_u_u651)) })
  | _ -> failwith "DT: impossible branch"
))

# 815 "Base/Effect/Core.vuna"
let v_machineRun = (fun dtb_u_u652 -> (((v_runGo 1000000000) v_emptySt) (Obj.magic dtb_u_u652)))

# 439 "Base/Effect/Core.vuna"
let v_msFrames = (fun dtb_u_u654 -> (match dtb_u_u654 with
  | { f_MSt_msFrames = dtb_u_u655; f_MSt_msCtx = dtb_u_u656; f_MSt_msUsed = dtb_u_u657; f_MSt_msNext = dtb_u_u658; f_MSt_msFree = dtb_u_u659; f_MSt_msEpoch = dtb_u_u660; f_MSt_msCleanups = dtb_u_u661; f_MSt_msCleanDepth = dtb_u_u662 } -> dtb_u_u655
  | _ -> failwith "DT: impossible branch"
))

# 440 "Base/Effect/Core.vuna"
let v_msCtx = (fun dtb_u_u664 -> (match dtb_u_u664 with
  | { f_MSt_msFrames = dtb_u_u665; f_MSt_msCtx = dtb_u_u666; f_MSt_msUsed = dtb_u_u667; f_MSt_msNext = dtb_u_u668; f_MSt_msFree = dtb_u_u669; f_MSt_msEpoch = dtb_u_u670; f_MSt_msCleanups = dtb_u_u671; f_MSt_msCleanDepth = dtb_u_u672 } -> dtb_u_u666
  | _ -> failwith "DT: impossible branch"
))

# 441 "Base/Effect/Core.vuna"
let v_msUsed = (fun dtb_u_u674 -> (match dtb_u_u674 with
  | { f_MSt_msFrames = dtb_u_u675; f_MSt_msCtx = dtb_u_u676; f_MSt_msUsed = dtb_u_u677; f_MSt_msNext = dtb_u_u678; f_MSt_msFree = dtb_u_u679; f_MSt_msEpoch = dtb_u_u680; f_MSt_msCleanups = dtb_u_u681; f_MSt_msCleanDepth = dtb_u_u682 } -> dtb_u_u677
  | _ -> failwith "DT: impossible branch"
))

# 442 "Base/Effect/Core.vuna"
let v_msNext = (fun dtb_u_u684 -> (match dtb_u_u684 with
  | { f_MSt_msFrames = dtb_u_u685; f_MSt_msCtx = dtb_u_u686; f_MSt_msUsed = dtb_u_u687; f_MSt_msNext = dtb_u_u688; f_MSt_msFree = dtb_u_u689; f_MSt_msEpoch = dtb_u_u690; f_MSt_msCleanups = dtb_u_u691; f_MSt_msCleanDepth = dtb_u_u692 } -> dtb_u_u688
  | _ -> failwith "DT: impossible branch"
))

# 443 "Base/Effect/Core.vuna"
let v_msFree = (fun dtb_u_u694 -> (match dtb_u_u694 with
  | { f_MSt_msFrames = dtb_u_u695; f_MSt_msCtx = dtb_u_u696; f_MSt_msUsed = dtb_u_u697; f_MSt_msNext = dtb_u_u698; f_MSt_msFree = dtb_u_u699; f_MSt_msEpoch = dtb_u_u700; f_MSt_msCleanups = dtb_u_u701; f_MSt_msCleanDepth = dtb_u_u702 } -> dtb_u_u699
  | _ -> failwith "DT: impossible branch"
))

# 444 "Base/Effect/Core.vuna"
let v_msEpoch = (fun dtb_u_u704 -> (match dtb_u_u704 with
  | { f_MSt_msFrames = dtb_u_u705; f_MSt_msCtx = dtb_u_u706; f_MSt_msUsed = dtb_u_u707; f_MSt_msNext = dtb_u_u708; f_MSt_msFree = dtb_u_u709; f_MSt_msEpoch = dtb_u_u710; f_MSt_msCleanups = dtb_u_u711; f_MSt_msCleanDepth = dtb_u_u712 } -> dtb_u_u710
  | _ -> failwith "DT: impossible branch"
))

# 445 "Base/Effect/Core.vuna"
let v_msCleanups = (fun dtb_u_u714 -> (match dtb_u_u714 with
  | { f_MSt_msFrames = dtb_u_u715; f_MSt_msCtx = dtb_u_u716; f_MSt_msUsed = dtb_u_u717; f_MSt_msNext = dtb_u_u718; f_MSt_msFree = dtb_u_u719; f_MSt_msEpoch = dtb_u_u720; f_MSt_msCleanups = dtb_u_u721; f_MSt_msCleanDepth = dtb_u_u722 } -> dtb_u_u721
  | _ -> failwith "DT: impossible branch"
))

# 446 "Base/Effect/Core.vuna"
let v_msCleanDepth = (fun dtb_u_u724 -> (match dtb_u_u724 with
  | { f_MSt_msFrames = dtb_u_u725; f_MSt_msCtx = dtb_u_u726; f_MSt_msUsed = dtb_u_u727; f_MSt_msNext = dtb_u_u728; f_MSt_msFree = dtb_u_u729; f_MSt_msEpoch = dtb_u_u730; f_MSt_msCleanups = dtb_u_u731; f_MSt_msCleanDepth = dtb_u_u732 } -> dtb_u_u732
  | _ -> failwith "DT: impossible branch"
))
