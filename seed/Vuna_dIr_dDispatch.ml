open Vuna_runtime
type t_SpineArg = { f_SpineArg_saTy : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe; f_SpineArg_saValue : Vuna_dIr_dModel.t_Ir }

# 23 "Vuna/Ir/Dispatch.vuna"
let v_dispatchIdNameOf = (fun (dtb_u_u1 : string) (dtb_u_u2 : int) -> (if (dtb_u_u1 = Base_dIntrinsics.v_effSendCoreName) then (if (dtb_u_u2 = 3) then (B_dData_dMaybe.C_Maybe_Just (Base_dIntrinsics.v_effSendCoreIdName)) else B_dData_dMaybe.C_Maybe_Nothing) else (if (dtb_u_u1 = "Base.Effect.Core.performCore") then (if (dtb_u_u2 = 3) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.performCoreId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (dtb_u_u1 = "Base.Effect.Core.handleCore") then (if (dtb_u_u2 = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleCoreId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (dtb_u_u1 = "Base.Effect.Core.handleCoreAt") then (if (dtb_u_u2 = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleCoreAtId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (dtb_u_u1 = "Base.Effect.Core.handleCoreLin") then (if (dtb_u_u2 = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleCoreLinId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (dtb_u_u1 = "Base.Effect.Core.handleWith") then (if (dtb_u_u2 = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleWithId")) else B_dData_dMaybe.C_Maybe_Nothing) else (if (dtb_u_u1 = "Base.Effect.Core.handleWithAt") then (if (dtb_u_u2 = 5) then (B_dData_dMaybe.C_Maybe_Just ("Base.Effect.Core.handleWithAtId")) else B_dData_dMaybe.C_Maybe_Nothing) else B_dData_dMaybe.C_Maybe_Nothing))))))))

# 42 "Vuna/Ir/Dispatch.vuna"
let rec v_flattenSpine = (fun (dtb_u_u3 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u3 with
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u4, dtb_u_u5, dtb_u_u6) -> (let dtb_u_u7 = (v_flattenSpine dtb_u_u5) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u7); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf dtb_u_u7)) (B_dData_dList.C_List__x58__x58_ ({ f_SpineArg_saTy = dtb_u_u4; f_SpineArg_saValue = dtb_u_u6 }, B_dData_dList.C_List_Nil))) })
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u3; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 49 "Vuna/Ir/Dispatch.vuna"
let rec v_buildSpine = (fun (dtb_u_u8 : Vuna_dIr_dModel.t_Ir) (dtb_u_u9 : t_SpineArg B_dData_dList.t_List) -> (match dtb_u_u9 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u10, dtb_u_u11) -> ((v_buildSpine (Vuna_dIr_dModel.C_Ir_IrApp ((dtb_u_u10).f_SpineArg_saTy, dtb_u_u8, (dtb_u_u10).f_SpineArg_saValue))) dtb_u_u11)
  | B_dData_dList.C_List_Nil -> dtb_u_u8
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Ir/Dispatch.vuna"
let rec v_argCount = (fun (dtb_u_u12 : t_SpineArg B_dData_dList.t_List) -> (match dtb_u_u12 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u13, dtb_u_u14) -> (1 + (v_argCount dtb_u_u14))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Ir/Dispatch.vuna"
let v_dispatchIdArg = (fun (dtb_u_u15 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u15 with
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u16) -> (Vuna_dIr_dModel.C_Ir_IrInt ((Base_dIntrinsics.v_dispatchIdOf dtb_u_u16)))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrRtApp (Base_dIntrinsics.v_dispatchIdIntrinsicName, (B_dData_dList.C_List__x58__x58_ (dtb_u_u15, B_dData_dList.C_List_Nil))))
))

# 64 "Vuna/Ir/Dispatch.vuna"
let v_dispatchSpine = (fun (dtb_u_u17 : Vuna_dIr_dModel.t_Ir) (dtb_u_u18 : t_SpineArg B_dData_dList.t_List) -> (match dtb_u_u17 with
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u19) -> (match ((v_dispatchIdNameOf dtb_u_u19) (v_argCount dtb_u_u18)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u20) -> (let dtb_u_u21 = dtb_u_u18 in (match dtb_u_u21 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u22, dtb_u_u23) -> (match dtb_u_u23 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25) -> ((v_buildSpine (Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u20))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u22, (B_dData_dList.C_List__x58__x58_ (dtb_u_u24, (B_dData_dList.C_List__x58__x58_ ({ f_SpineArg_saTy = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyOpaque; B_dData_dPair.f_Pair_second = Vuna_dIr_dModel.C_IrTy_IrTyOpaque })); f_SpineArg_saValue = (v_dispatchIdArg (dtb_u_u22).f_SpineArg_saValue) }, (B_dData_dList.C_List__x58__x58_ ({ f_SpineArg_saTy = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Vuna_dIr_dModel.C_IrTy_IrTyOpaque; B_dData_dPair.f_Pair_second = Vuna_dIr_dModel.C_IrTy_IrTyOpaque })); f_SpineArg_saValue = (v_dispatchIdArg (dtb_u_u24).f_SpineArg_saValue) }, dtb_u_u25)))))))))
  | _ -> ((v_buildSpine dtb_u_u17) dtb_u_u18)
)
  | _ -> ((v_buildSpine dtb_u_u17) dtb_u_u18)
))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_buildSpine dtb_u_u17) dtb_u_u18)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_buildSpine dtb_u_u17) dtb_u_u18)
))

# 77 "Vuna/Ir/Dispatch.vuna"
let[@tail_mod_cons] rec v_dispatchSpineArgs = (fun (dtb_u_u26 : int) (dtb_u_u27 : t_SpineArg B_dData_dList.t_List) -> (if (dtb_u_u26 <= 0) then dtb_u_u27 else (match dtb_u_u27 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29) -> (B_dData_dList.C_List__x58__x58_ ({ f_SpineArg_saTy = (dtb_u_u28).f_SpineArg_saTy; f_SpineArg_saValue = ((v_dispatch (dtb_u_u26 - 1)) (dtb_u_u28).f_SpineArg_saValue) }, ((v_dispatchSpineArgs (dtb_u_u26 - 1)) dtb_u_u29)))
  | _ -> failwith "DT: impossible branch"
)))
# 87 "Vuna/Ir/Dispatch.vuna"
and v_dispatch = (fun (dtb_u_u30 : int) (dtb_u_u31 : Vuna_dIr_dModel.t_Ir) -> (if (dtb_u_u30 <= 0) then dtb_u_u31 else (match dtb_u_u31 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u32) -> dtb_u_u31
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u33) -> dtb_u_u31
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u34) -> dtb_u_u31
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u35) -> dtb_u_u31
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u36) -> dtb_u_u31
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u37) -> dtb_u_u31
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u38) -> dtb_u_u31
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u39, dtb_u_u40, dtb_u_u41) -> dtb_u_u31
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u42, dtb_u_u43, dtb_u_u44, dtb_u_u45) -> (Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u42, dtb_u_u43, dtb_u_u44, ((v_dispatchList (dtb_u_u30 - 1)) dtb_u_u45)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u46, dtb_u_u47, dtb_u_u48) -> (Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u46, dtb_u_u47, ((v_dispatchFields (dtb_u_u30 - 1)) dtb_u_u48)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u49, dtb_u_u50, dtb_u_u51, dtb_u_u52) -> (Vuna_dIr_dModel.C_Ir_IrProj (((v_dispatch (dtb_u_u30 - 1)) dtb_u_u49), dtb_u_u50, dtb_u_u51, dtb_u_u52))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u53, dtb_u_u54, dtb_u_u55, dtb_u_u56) -> (Vuna_dIr_dModel.C_Ir_IrRecUpd (((v_dispatch (dtb_u_u30 - 1)) dtb_u_u53), dtb_u_u54, ((v_dispatchFields (dtb_u_u30 - 1)) dtb_u_u55), dtb_u_u56))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u57, dtb_u_u58, dtb_u_u59) -> (let dtb_u_u60 = (v_flattenSpine (Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u57, dtb_u_u58, dtb_u_u59))) in ((v_dispatchSpine ((v_dispatch (dtb_u_u30 - 1)) (B_dData_dPair.v_firstOf dtb_u_u60))) ((v_dispatchSpineArgs (dtb_u_u30 - 1)) (B_dData_dPair.v_secondOf dtb_u_u60))))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u61, dtb_u_u62, dtb_u_u63) -> (Vuna_dIr_dModel.C_Ir_IrIf (((v_dispatch (dtb_u_u30 - 1)) dtb_u_u61), ((v_dispatch (dtb_u_u30 - 1)) dtb_u_u62), ((v_dispatch (dtb_u_u30 - 1)) dtb_u_u63)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u64, dtb_u_u65, dtb_u_u66, dtb_u_u67) -> (Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u64, dtb_u_u65, ((v_dispatch (dtb_u_u30 - 1)) dtb_u_u66), ((v_dispatchAlts (dtb_u_u30 - 1)) dtb_u_u67)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u68, dtb_u_u69, dtb_u_u70, dtb_u_u71, dtb_u_u72) -> (Vuna_dIr_dModel.C_Ir_IrNatCase (((v_dispatch (dtb_u_u30 - 1)) dtb_u_u68), dtb_u_u69, ((v_dispatchAltM (dtb_u_u30 - 1)) dtb_u_u70), ((v_dispatchAltM (dtb_u_u30 - 1)) dtb_u_u71), ((v_dispatchAltM (dtb_u_u30 - 1)) dtb_u_u72)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u73) -> (Vuna_dIr_dModel.C_Ir_IrConcatMany (((v_dispatchList (dtb_u_u30 - 1)) dtb_u_u73)))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u74, dtb_u_u75, dtb_u_u76, dtb_u_u77, dtb_u_u78) -> (Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u74, dtb_u_u75, dtb_u_u76, dtb_u_u77, ((v_dispatch (dtb_u_u30 - 1)) dtb_u_u78)))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u79, dtb_u_u80, dtb_u_u81) -> (Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u79, dtb_u_u80, ((v_dispatch (dtb_u_u30 - 1)) dtb_u_u81)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u82, dtb_u_u83, dtb_u_u84) -> (Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u82, ((v_dispatch (dtb_u_u30 - 1)) dtb_u_u83), ((v_dispatch (dtb_u_u30 - 1)) dtb_u_u84)))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u85, dtb_u_u86, dtb_u_u87) -> (Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u85, dtb_u_u86, ((v_dispatch (dtb_u_u30 - 1)) dtb_u_u87)))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u88) -> (Vuna_dIr_dModel.C_Ir_IrTail (((v_dispatch (dtb_u_u30 - 1)) dtb_u_u88)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u89, dtb_u_u90) -> (let dtb_u_u91 = ((v_dispatchList (dtb_u_u30 - 1)) dtb_u_u90) in (if (dtb_u_u89 = Base_dIntrinsics.v_dispatchIdIntrinsicName) then (let dtb_u_u92 = dtb_u_u91 in (match dtb_u_u92 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u93, dtb_u_u94) -> (match dtb_u_u93 with
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u95) -> (match dtb_u_u94 with
  | B_dData_dList.C_List_Nil -> (Vuna_dIr_dModel.C_Ir_IrInt ((Base_dIntrinsics.v_dispatchIdOf dtb_u_u95)))
  | _ -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u89, dtb_u_u91))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u89, dtb_u_u91))
)
  | _ -> (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u89, dtb_u_u91))
)) else (Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u89, dtb_u_u91))))
  | _ -> failwith "DT: impossible branch"
)))
# 128 "Vuna/Ir/Dispatch.vuna"
and v_dispatchList = (fun (dtb_u_u96 : int) (dtb_u_u97 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (dtb_u_u96 <= 0) then dtb_u_u97 else (match dtb_u_u97 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u98, dtb_u_u99) -> (B_dData_dList.C_List__x58__x58_ (((v_dispatch (dtb_u_u96 - 1)) dtb_u_u98), ((v_dispatchList (dtb_u_u96 - 1)) dtb_u_u99)))
  | _ -> failwith "DT: impossible branch"
)))
# 137 "Vuna/Ir/Dispatch.vuna"
and v_dispatchFields = (fun (dtb_u_u100 : int) (dtb_u_u101 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u100 <= 0) then dtb_u_u101 else (match dtb_u_u101 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u102, dtb_u_u103) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u102); B_dData_dPair.f_Pair_second = ((v_dispatch (dtb_u_u100 - 1)) (B_dData_dPair.v_secondOf dtb_u_u102)) }, ((v_dispatchFields (dtb_u_u100 - 1)) dtb_u_u103)))
  | _ -> failwith "DT: impossible branch"
)))
# 146 "Vuna/Ir/Dispatch.vuna"
and v_dispatchAlt = (fun (dtb_u_u104 : int) (dtb_u_u105 : Vuna_dIr_dModel.t_IrAlt) -> (if (dtb_u_u104 <= 0) then dtb_u_u105 else { Vuna_dIr_dModel.f_IrAlt_irAltCtor = (dtb_u_u105).Vuna_dIr_dModel.f_IrAlt_irAltCtor; Vuna_dIr_dModel.f_IrAlt_irAltBinders = (dtb_u_u105).Vuna_dIr_dModel.f_IrAlt_irAltBinders; Vuna_dIr_dModel.f_IrAlt_irAltBody = ((v_dispatch (dtb_u_u104 - 1)) (dtb_u_u105).Vuna_dIr_dModel.f_IrAlt_irAltBody) }))
# 150 "Vuna/Ir/Dispatch.vuna"
and v_dispatchAltM = (fun (dtb_u_u106 : int) (dtb_u_u107 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (if (dtb_u_u106 <= 0) then dtb_u_u107 else (match dtb_u_u107 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u108) -> (B_dData_dMaybe.C_Maybe_Just (((v_dispatchAlt (dtb_u_u106 - 1)) dtb_u_u108)))
  | _ -> failwith "DT: impossible branch"
)))
# 159 "Vuna/Ir/Dispatch.vuna"
and v_dispatchAlts = (fun (dtb_u_u109 : int) (dtb_u_u110 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (if (dtb_u_u109 <= 0) then dtb_u_u110 else (match dtb_u_u110 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u111, dtb_u_u112) -> (B_dData_dList.C_List__x58__x58_ (((v_dispatchAlt (dtb_u_u109 - 1)) dtb_u_u111), ((v_dispatchAlts (dtb_u_u109 - 1)) dtb_u_u112)))
  | _ -> failwith "DT: impossible branch"
)))

# 200 "Vuna/Ir/Dispatch.vuna"
let v_dispatchFuelBase = 64

# 203 "Vuna/Ir/Dispatch.vuna"
let v_dispatchFuelOfBody = (fun (dtb_u_u113 : Vuna_dIr_dModel.t_Ir) -> (v_dispatchFuelBase + (2 * (Vuna_dIr_dModel.v_irSize dtb_u_u113))))

# 168 "Vuna/Ir/Dispatch.vuna"
let v_dispatchDef = (fun (dtb_u_u114 : Vuna_dIr_dModel.t_IrDef) -> (match dtb_u_u114 with
  | Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u115, dtb_u_u116, dtb_u_u117, dtb_u_u118, dtb_u_u119, dtb_u_u120, dtb_u_u121, dtb_u_u122) -> (Vuna_dIr_dModel.C_IrDef_IrDef (dtb_u_u115, dtb_u_u116, dtb_u_u117, dtb_u_u118, ((v_dispatch (v_dispatchFuelOfBody dtb_u_u119)) dtb_u_u119), dtb_u_u120, dtb_u_u121, dtb_u_u122))
  | _ -> dtb_u_u114
))

# 173 "Vuna/Ir/Dispatch.vuna"
let v_dispatchGroup = (fun (dtb_u_u123 : Vuna_dIr_dModel.t_IrGroup) -> (match dtb_u_u123 with
  | { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb_u_u124; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = dtb_u_u125 } -> { Vuna_dIr_dModel.f_IrGroup_irGroupIsRec = dtb_u_u124; Vuna_dIr_dModel.f_IrGroup_irGroupDefs = ((B_dData_dList.v_map v_dispatchDef) dtb_u_u125) }
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Ir/Dispatch.vuna"
let v_dispatchEntry = (fun (dtb_u_u126 : Vuna_dIr_dModel.t_IrEntry) -> { Vuna_dIr_dModel.f_IrEntry_irEntryShow = ((v_dispatch (v_dispatchFuelOfBody (dtb_u_u126).Vuna_dIr_dModel.f_IrEntry_irEntryShow)) (dtb_u_u126).Vuna_dIr_dModel.f_IrEntry_irEntryShow); Vuna_dIr_dModel.f_IrEntry_irEntryMain = (dtb_u_u126).Vuna_dIr_dModel.f_IrEntry_irEntryMain; Vuna_dIr_dModel.f_IrEntry_irEntryIsAction = (dtb_u_u126).Vuna_dIr_dModel.f_IrEntry_irEntryIsAction; Vuna_dIr_dModel.f_IrEntry_irEntryRunMain = (dtb_u_u126).Vuna_dIr_dModel.f_IrEntry_irEntryRunMain; Vuna_dIr_dModel.f_IrEntry_irEntryHandlers = (dtb_u_u126).Vuna_dIr_dModel.f_IrEntry_irEntryHandlers; Vuna_dIr_dModel.f_IrEntry_irEntryRowTags = (dtb_u_u126).Vuna_dIr_dModel.f_IrEntry_irEntryRowTags })

# 186 "Vuna/Ir/Dispatch.vuna"
let v_dispatchEntryM = (fun (dtb_u_u127 : Vuna_dIr_dModel.t_IrEntry B_dData_dMaybe.t_Maybe) -> (match dtb_u_u127 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u128) -> (B_dData_dMaybe.C_Maybe_Just ((v_dispatchEntry dtb_u_u128)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Ir/Dispatch.vuna"
let v_dispatchIdsUnit = (fun (dtb_u_u129 : Vuna_dIr_dModel.t_IrUnit) -> { Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls = (dtb_u_u129).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls; Vuna_dIr_dModel.f_IrUnit_irUnitGroups = ((B_dData_dList.v_map v_dispatchGroup) (dtb_u_u129).Vuna_dIr_dModel.f_IrUnit_irUnitGroups); Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily = (dtb_u_u129).Vuna_dIr_dModel.f_IrUnit_irUnitHasListFamily; Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs = (dtb_u_u129).Vuna_dIr_dModel.f_IrUnit_irUnitTypeRefs; Vuna_dIr_dModel.f_IrUnit_irUnitEntry = (v_dispatchEntryM (dtb_u_u129).Vuna_dIr_dModel.f_IrUnit_irUnitEntry) })

# 38 "Vuna/Ir/Dispatch.vuna"
let v_saTy = (fun (dtb_u_u130 : t_SpineArg) -> (match dtb_u_u130 with
  | { f_SpineArg_saTy = dtb_u_u131; f_SpineArg_saValue = dtb_u_u132 } -> dtb_u_u131
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Ir/Dispatch.vuna"
let v_saValue = (fun (dtb_u_u133 : t_SpineArg) -> (match dtb_u_u133 with
  | { f_SpineArg_saTy = dtb_u_u134; f_SpineArg_saValue = dtb_u_u135 } -> dtb_u_u135
  | _ -> failwith "DT: impossible branch"
))
