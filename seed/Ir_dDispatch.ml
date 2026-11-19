open Vuna_runtime
type t_SpineArg = { f_SpineArg_saTy : (Ir_dModel.t_IrTy, Ir_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe; f_SpineArg_saValue : Ir_dModel.t_Ir }

# 23 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchIdNameOf = (fun (name : string) (arity : int) -> (if (name = Base_dIntrinsics.v_effSendCoreName) then (if (arity = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dIntrinsics.v_effSendCoreIdName)) else B_dData_dMaybe.C_Maybe_Nothing) else (if (name = "Base.Effect.Core.performCore") then (if (arity = 3) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.performCoreId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (name = "Base.Effect.Core.handleCore") then (if (arity = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleCoreId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (name = "Base.Effect.Core.handleCoreAt") then (if (arity = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleCoreAtId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (name = "Base.Effect.Core.handleCoreLin") then (if (arity = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleCoreLinId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (name = "Base.Effect.Core.handleWith") then (if (arity = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleWithId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (name = "Base.Effect.Core.handleWithAt") then (if (arity = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleWithAtId")) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))))))))

# 47 "Vuna/Compiler/Ir/Dispatch.vuna"
let rec v_flattenSpine = (fun (mc0 : Ir_dModel.t_Ir) -> (match mc0 with
  | Ir_dModel.C_Ir_IrApp (dtb__0, dtb__1, dtb__2) -> ((fun p -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf p)) (B_dData_dList.C_List__x58__x58_ ({ f_SpineArg_saTy = dtb__0; f_SpineArg_saValue = dtb__2 }, B_dData_dList.C_List_Nil))) }) (v_flattenSpine dtb__1))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 54 "Vuna/Compiler/Ir/Dispatch.vuna"
let rec v_buildSpine = (fun (mc0 : Ir_dModel.t_Ir) (mc1 : t_SpineArg B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> ((v_buildSpine (Ir_dModel.C_Ir_IrApp ((dtb__3).f_SpineArg_saTy, mc0, (dtb__3).f_SpineArg_saValue))) dtb__4)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Ir/Dispatch.vuna"
let rec v_argCount = (fun (mc0 : t_SpineArg B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (1 + (v_argCount dtb__6))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchIdArg = (fun (mc0 : Ir_dModel.t_Ir) -> (match mc0 with
  | Ir_dModel.C_Ir_IrStr (dtb__7) -> (Ir_dModel.C_Ir_IrInt ((Base_dIntrinsics.v_dispatchIdOf dtb__7)))
  | _ -> (Ir_dModel.C_Ir_IrRtApp (Base_dIntrinsics.v_dispatchIdIntrinsicName, (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))))
))

# 69 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchSpine = (fun (head : Ir_dModel.t_Ir) (args : t_SpineArg B_dData_dList.t_List) -> (match head with
  | Ir_dModel.C_Ir_IrGlobal (dtb__8) -> (match ((v_dispatchIdNameOf dtb__8) (v_argCount args)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (match dtb__11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> ((v_buildSpine (Ir_dModel.C_Ir_IrGlobal (dtb__9))) (B_dData_dList.C_List__x58__x58_ (dtb__10, (B_dData_dList.C_List__x58__x58_ (dtb__12, (B_dData_dList.C_List__x58__x58_ ({ f_SpineArg_saTy = B_dData_dMaybe.C_Maybe_Nothing; f_SpineArg_saValue = (v_dispatchIdArg (dtb__10).f_SpineArg_saValue) }, (B_dData_dList.C_List__x58__x58_ ({ f_SpineArg_saTy = B_dData_dMaybe.C_Maybe_Nothing; f_SpineArg_saValue = (v_dispatchIdArg (dtb__12).f_SpineArg_saValue) }, dtb__13)))))))))
  | _ -> ((v_buildSpine head) args)
)
  | _ -> ((v_buildSpine head) args)
)) args)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_buildSpine head) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_buildSpine head) args)
))

# 84 "Vuna/Compiler/Ir/Dispatch.vuna"
let rec v_dispatchSpineArgs = (fun (fuel : int) (args : t_SpineArg B_dData_dList.t_List) -> (if (fuel <= 0) then args else (match args with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (B_dData_dList.C_List__x58__x58_ ({ f_SpineArg_saTy = (dtb__14).f_SpineArg_saTy; f_SpineArg_saValue = ((v_dispatch (fuel - 1)) (dtb__14).f_SpineArg_saValue) }, ((v_dispatchSpineArgs (fuel - 1)) dtb__15)))
  | _ -> failwith "DT: impossible branch"
)))
# 94 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_dispatch = (fun (fuel : int) (e : Ir_dModel.t_Ir) -> (if (fuel <= 0) then e else (match e with
  | Ir_dModel.C_Ir_IrVar (dtb__16) -> e
  | Ir_dModel.C_Ir_IrGlobal (dtb__17) -> e
  | Ir_dModel.C_Ir_IrRt (dtb__18) -> e
  | Ir_dModel.C_Ir_IrInt (dtb__19) -> e
  | Ir_dModel.C_Ir_IrStr (dtb__20) -> e
  | Ir_dModel.C_Ir_IrBool (dtb__21) -> e
  | Ir_dModel.C_Ir_IrFloatLit (dtb__22) -> e
  | Ir_dModel.C_Ir_IrEffBind (dtb__23, dtb__24, dtb__25) -> e
  | Ir_dModel.C_Ir_IrCtor (dtb__26, dtb__27, dtb__28, dtb__29) -> (Ir_dModel.C_Ir_IrCtor (dtb__26, dtb__27, dtb__28, ((v_dispatchList (fuel - 1)) dtb__29)))
  | Ir_dModel.C_Ir_IrRecord (dtb__30, dtb__31, dtb__32) -> (Ir_dModel.C_Ir_IrRecord (dtb__30, dtb__31, ((v_dispatchFields (fuel - 1)) dtb__32)))
  | Ir_dModel.C_Ir_IrProj (dtb__33, dtb__34, dtb__35, dtb__36) -> (Ir_dModel.C_Ir_IrProj (((v_dispatch (fuel - 1)) dtb__33), dtb__34, dtb__35, dtb__36))
  | Ir_dModel.C_Ir_IrRecUpd (dtb__37, dtb__38, dtb__39, dtb__40) -> (Ir_dModel.C_Ir_IrRecUpd (((v_dispatch (fuel - 1)) dtb__37), dtb__38, ((v_dispatchFields (fuel - 1)) dtb__39), dtb__40))
  | Ir_dModel.C_Ir_IrApp (dtb__41, dtb__42, dtb__43) -> ((fun p -> ((v_dispatchSpine ((v_dispatch (fuel - 1)) (B_dData_dPair.v_firstOf p))) ((v_dispatchSpineArgs (fuel - 1)) (B_dData_dPair.v_secondOf p)))) (v_flattenSpine (Ir_dModel.C_Ir_IrApp (dtb__41, dtb__42, dtb__43))))
  | Ir_dModel.C_Ir_IrIf (dtb__44, dtb__45, dtb__46) -> (Ir_dModel.C_Ir_IrIf (((v_dispatch (fuel - 1)) dtb__44), ((v_dispatch (fuel - 1)) dtb__45), ((v_dispatch (fuel - 1)) dtb__46)))
  | Ir_dModel.C_Ir_IrCase (dtb__47, dtb__48, dtb__49, dtb__50) -> (Ir_dModel.C_Ir_IrCase (dtb__47, dtb__48, ((v_dispatch (fuel - 1)) dtb__49), ((v_dispatchAlts (fuel - 1)) dtb__50)))
  | Ir_dModel.C_Ir_IrNatCase (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> (Ir_dModel.C_Ir_IrNatCase (((v_dispatch (fuel - 1)) dtb__51), dtb__52, ((v_dispatchAltM (fuel - 1)) dtb__53), ((v_dispatchAltM (fuel - 1)) dtb__54), ((v_dispatchAltM (fuel - 1)) dtb__55)))
  | Ir_dModel.C_Ir_IrConcatMany (dtb__56) -> (Ir_dModel.C_Ir_IrConcatMany (((v_dispatchList (fuel - 1)) dtb__56)))
  | Ir_dModel.C_Ir_IrEffThunk (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61) -> (Ir_dModel.C_Ir_IrEffThunk (dtb__57, dtb__58, dtb__59, dtb__60, ((v_dispatch (fuel - 1)) dtb__61)))
  | Ir_dModel.C_Ir_IrCast (dtb__62, dtb__63, dtb__64) -> (Ir_dModel.C_Ir_IrCast (dtb__62, dtb__63, ((v_dispatch (fuel - 1)) dtb__64)))
  | Ir_dModel.C_Ir_IrLet (dtb__65, dtb__66, dtb__67) -> (Ir_dModel.C_Ir_IrLet (dtb__65, ((v_dispatch (fuel - 1)) dtb__66), ((v_dispatch (fuel - 1)) dtb__67)))
  | Ir_dModel.C_Ir_IrLam (dtb__68, dtb__69, dtb__70) -> (Ir_dModel.C_Ir_IrLam (dtb__68, dtb__69, ((v_dispatch (fuel - 1)) dtb__70)))
  | Ir_dModel.C_Ir_IrTail (dtb__71) -> (Ir_dModel.C_Ir_IrTail (((v_dispatch (fuel - 1)) dtb__71)))
  | Ir_dModel.C_Ir_IrRtApp (dtb__72, dtb__73) -> ((fun args1 -> (if (dtb__72 = Base_dIntrinsics.v_dispatchIdIntrinsicName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | Ir_dModel.C_Ir_IrStr (dtb__76) -> (match dtb__75 with
  | B_dData_dList.C_List_Nil -> (Ir_dModel.C_Ir_IrInt ((Base_dIntrinsics.v_dispatchIdOf dtb__76)))
  | _ -> (Ir_dModel.C_Ir_IrRtApp (dtb__72, args1))
)
  | _ -> (Ir_dModel.C_Ir_IrRtApp (dtb__72, args1))
)
  | _ -> (Ir_dModel.C_Ir_IrRtApp (dtb__72, args1))
)) args1) else (Ir_dModel.C_Ir_IrRtApp (dtb__72, args1)))) ((v_dispatchList (fuel - 1)) dtb__73))
  | _ -> failwith "DT: impossible branch"
)))
# 135 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_dispatchList = (fun (fuel : int) (xs : Ir_dModel.t_Ir B_dData_dList.t_List) -> (if (fuel <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (B_dData_dList.C_List__x58__x58_ (((v_dispatch (fuel - 1)) dtb__77), ((v_dispatchList (fuel - 1)) dtb__78)))
  | _ -> failwith "DT: impossible branch"
)))
# 144 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_dispatchFields = (fun (fuel : int) (fs : (string, Ir_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then fs else (match fs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__79); B_dData_dPair.f_Pair_second = ((v_dispatch (fuel - 1)) (B_dData_dPair.v_secondOf dtb__79)) }, ((v_dispatchFields (fuel - 1)) dtb__80)))
  | _ -> failwith "DT: impossible branch"
)))
# 153 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_dispatchAlt = (fun (fuel : int) (a : Ir_dModel.t_IrAlt) -> (if (fuel <= 0) then a else { Ir_dModel.f_IrAlt_irAltCtor = (a).Ir_dModel.f_IrAlt_irAltCtor; Ir_dModel.f_IrAlt_irAltBinders = (a).Ir_dModel.f_IrAlt_irAltBinders; Ir_dModel.f_IrAlt_irAltBody = ((v_dispatch (fuel - 1)) (a).Ir_dModel.f_IrAlt_irAltBody) }))
# 157 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_dispatchAltM = (fun (fuel : int) (m : Ir_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (fuel <= 0) then m else (match m with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__81) -> (B_dData_dMaybe.C_Maybe_Just (((v_dispatchAlt (fuel - 1)) dtb__81)))
  | _ -> failwith "DT: impossible branch"
)))
# 166 "Vuna/Compiler/Ir/Dispatch.vuna"
and v_dispatchAlts = (fun (fuel : int) (alts : Ir_dModel.t_IrAlt B_dData_dList.t_List) -> (if (fuel <= 0) then alts else (match alts with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (B_dData_dList.C_List__x58__x58_ (((v_dispatchAlt (fuel - 1)) dtb__82), ((v_dispatchAlts (fuel - 1)) dtb__83)))
  | _ -> failwith "DT: impossible branch"
)))

# 207 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchFuelBase = 64

# 210 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchFuelOfBody = (fun (body : Ir_dModel.t_Ir) -> (v_dispatchFuelBase + (2 * (Ir_dModel.v_irSize body))))

# 175 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchDef = (fun (mc0 : Ir_dModel.t_IrDef) -> (match mc0 with
  | Ir_dModel.C_IrDef_IrDef (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> (Ir_dModel.C_IrDef_IrDef (dtb__84, dtb__85, dtb__86, dtb__87, ((v_dispatch (v_dispatchFuelOfBody dtb__88)) dtb__88), dtb__89, dtb__90, dtb__91))
  | _ -> mc0
))

# 180 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchGroup = (fun (mc0 : Ir_dModel.t_IrGroup) -> (match mc0 with
  | { Ir_dModel.f_IrGroup_irGroupIsRec = dtb__92; Ir_dModel.f_IrGroup_irGroupDefs = dtb__93 } -> { Ir_dModel.f_IrGroup_irGroupIsRec = dtb__92; Ir_dModel.f_IrGroup_irGroupDefs = ((B_dData_dList.v_map v_dispatchDef) dtb__93) }
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchEntry = (fun (e : Ir_dModel.t_IrEntry) -> { Ir_dModel.f_IrEntry_irEntryShow = ((v_dispatch (v_dispatchFuelOfBody (e).Ir_dModel.f_IrEntry_irEntryShow)) (e).Ir_dModel.f_IrEntry_irEntryShow); Ir_dModel.f_IrEntry_irEntryMain = (e).Ir_dModel.f_IrEntry_irEntryMain; Ir_dModel.f_IrEntry_irEntryIsAction = (e).Ir_dModel.f_IrEntry_irEntryIsAction; Ir_dModel.f_IrEntry_irEntryRunMain = (e).Ir_dModel.f_IrEntry_irEntryRunMain; Ir_dModel.f_IrEntry_irEntryHandlers = (e).Ir_dModel.f_IrEntry_irEntryHandlers; Ir_dModel.f_IrEntry_irEntryRowTags = (e).Ir_dModel.f_IrEntry_irEntryRowTags })

# 193 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchEntryM = (fun (mc0 : Ir_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__94) -> (B_dData_dMaybe.C_Maybe_Just ((v_dispatchEntry dtb__94)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Ir/Dispatch.vuna"
let v_dispatchIdsUnit = (fun (u : Ir_dModel.t_IrUnit) -> { Ir_dModel.f_IrUnit_irUnitTyDecls = (u).Ir_dModel.f_IrUnit_irUnitTyDecls; Ir_dModel.f_IrUnit_irUnitGroups = ((B_dData_dList.v_map v_dispatchGroup) (u).Ir_dModel.f_IrUnit_irUnitGroups); Ir_dModel.f_IrUnit_irUnitHasListFamily = (u).Ir_dModel.f_IrUnit_irUnitHasListFamily; Ir_dModel.f_IrUnit_irUnitTypeRefs = (u).Ir_dModel.f_IrUnit_irUnitTypeRefs; Ir_dModel.f_IrUnit_irUnitEntry = (v_dispatchEntryM (u).Ir_dModel.f_IrUnit_irUnitEntry) })
