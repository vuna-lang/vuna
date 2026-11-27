open Vuna_runtime
type t_IrTy = C_IrTy_IrTyVar of (int) | C_IrTy_IrTyInt | C_IrTy_IrTyStr | C_IrTy_IrTyBool | C_IrTy_IrTyFloat | C_IrTy_IrTyOpaque | C_IrTy_IrTyArray of (t_IrTy) | C_IrTy_IrTyRef of (t_IrTy) | C_IrTy_IrTyData of (string) * (t_IrTy B_dData_dList.t_List) | C_IrTy_IrTyFun of (t_IrTy) * (t_IrTy)
and t_IrBName = C_IrBName_IrBUser of (string) | C_IrBName_IrBArm of (int) | C_IrBName_IrBNat of (int) | C_IrBName_IrBWild
and t_IrBinder = { f_IrBinder_irBinderId : int; f_IrBinder_irBinderName : t_IrBName; f_IrBinder_irBinderErased : bool; f_IrBinder_irBinderTy : t_IrTy B_dData_dMaybe.t_Maybe }
and t_IrAlt = { f_IrAlt_irAltCtor : (string, string) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe; f_IrAlt_irAltBinders : t_IrBinder B_dData_dList.t_List; f_IrAlt_irAltBody : t_Ir }
and t_Ir = C_Ir_IrVar of (t_IrBinder) | C_Ir_IrGlobal of (string) | C_Ir_IrCtor of (string) * (string) * (t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) * (t_Ir B_dData_dList.t_List) | C_Ir_IrRecord of (string) * (t_IrTy B_dData_dMaybe.t_Maybe) * ((string, t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_Ir_IrProj of (t_Ir) * (string) * (string) * (t_IrTy B_dData_dMaybe.t_Maybe) | C_Ir_IrRecUpd of (t_Ir) * (string) * ((string, t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_IrTy B_dData_dMaybe.t_Maybe) | C_Ir_IrRt of (string) | C_Ir_IrRtApp of (string) * (t_Ir B_dData_dList.t_List) | C_Ir_IrCast of (t_IrTy B_dData_dMaybe.t_Maybe) * (t_IrTy B_dData_dMaybe.t_Maybe) * (t_Ir) | C_Ir_IrInt of (int) | C_Ir_IrStr of (string) | C_Ir_IrBool of (bool) | C_Ir_IrFloatLit of (string) | C_Ir_IrLet of (t_IrBinder B_dData_dList.t_List) * (t_Ir) * (t_Ir) | C_Ir_IrLam of (t_IrBinder B_dData_dList.t_List) * (t_IrTy B_dData_dMaybe.t_Maybe) * (t_Ir) | C_Ir_IrApp of ((t_IrTy, t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (t_Ir) * (t_Ir) | C_Ir_IrTail of (t_Ir) | C_Ir_IrIf of (t_Ir) * (t_Ir) * (t_Ir) | C_Ir_IrCase of (t_IrTy B_dData_dMaybe.t_Maybe) * (t_IrTy B_dData_dMaybe.t_Maybe) * (t_Ir) * (t_IrAlt B_dData_dList.t_List) | C_Ir_IrNatCase of (t_Ir) * (int) * (t_IrAlt B_dData_dMaybe.t_Maybe) * (t_IrAlt B_dData_dMaybe.t_Maybe) * (t_IrAlt B_dData_dMaybe.t_Maybe) | C_Ir_IrConcatMany of (t_Ir B_dData_dList.t_List) | C_Ir_IrEffThunk of (string) * (string) * (t_IrTy) * (int) * (t_Ir) | C_Ir_IrEffBind of (string) * (string) * (t_IrTy)
and t_IrTyDecl = C_IrTyDecl_IrVariantDecl of (string) * (int) * ((string, t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_IrTyDecl_IrRecordDecl of (string) * (int) * ((int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_IrTy B_dData_dList.t_List) | C_IrTyDecl_IrUnboxedDecl of (string) * (int) * (t_IrTy)
and t_IrDef = C_IrDef_IrDef of (string) * (int) * (string B_dData_dList.t_List) * (t_IrTy B_dData_dMaybe.t_Maybe) * (t_Ir) * (bool) * (bool) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe) | C_IrDef_IrExternDef of (string) * (t_IrTy) * (string) * (Base_dSource.t_Span B_dData_dMaybe.t_Maybe)
and t_IrGroup = { f_IrGroup_irGroupIsRec : bool; f_IrGroup_irGroupDefs : t_IrDef B_dData_dList.t_List }
and t_IrEntry = { f_IrEntry_irEntryShow : t_Ir; f_IrEntry_irEntryMain : string; f_IrEntry_irEntryIsAction : bool; f_IrEntry_irEntryRunMain : string B_dData_dMaybe.t_Maybe; f_IrEntry_irEntryHandlers : string B_dData_dList.t_List; f_IrEntry_irEntryRowTags : string B_dData_dList.t_List }
and t_IrListFam = { f_IrListFam_irListFamily : string; f_IrListFam_irListNil : string; f_IrListFam_irListCons : string }
and t_IrShared = { f_IrShared_irSharedRecordFields : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedListFam : t_IrListFam B_dData_dMaybe.t_Maybe; f_IrShared_irSharedUsesFloat : bool; f_IrShared_irSharedUsesTrace : bool; f_IrShared_irSharedUsesObs : bool; f_IrShared_irSharedDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedUnboxed : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedCtorShapes : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List; f_IrShared_irSharedUsesHost : bool; f_IrShared_irSharedUsesSched : bool; f_IrShared_irSharedUsesEff : bool }
and t_IrUnit = { f_IrUnit_irUnitTyDecls : t_IrTyDecl B_dData_dList.t_List; f_IrUnit_irUnitGroups : t_IrGroup B_dData_dList.t_List; f_IrUnit_irUnitHasListFamily : bool; f_IrUnit_irUnitTypeRefs : string B_dData_dList.t_List; f_IrUnit_irUnitEntry : t_IrEntry B_dData_dMaybe.t_Maybe }
and t_IrProgram = { f_IrProgram_irProgShared : t_IrShared; f_IrProgram_irProgUnit : t_IrUnit }

# 68 "Vuna/Ir/Model.vuna"
let rec v_irTyVarAt = (fun (dtb_u_u1 : t_IrTy B_dData_dList.t_List) (dtb_u_u2 : int) -> (match dtb_u_u1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3, dtb_u_u4) -> (if (dtb_u_u2 <= 0) then dtb_u_u3 else ((v_irTyVarAt dtb_u_u4) (dtb_u_u2 - 1)))
  | B_dData_dList.C_List_Nil -> C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Ir/Model.vuna"
let rec v_irTySubstVars = (fun (dtb_u_u5 : t_IrTy B_dData_dList.t_List) (dtb_u_u6 : t_IrTy) -> (match dtb_u_u6 with
  | C_IrTy_IrTyFun (dtb_u_u7, dtb_u_u8) -> (C_IrTy_IrTyFun (((v_irTySubstVars dtb_u_u5) dtb_u_u7), ((v_irTySubstVars dtb_u_u5) dtb_u_u8)))
  | C_IrTy_IrTyData (dtb_u_u9, dtb_u_u10) -> (C_IrTy_IrTyData (dtb_u_u9, ((B_dData_dList.v_map (fun (dtb_u_u11 : t_IrTy) -> ((v_irTySubstVars dtb_u_u5) dtb_u_u11))) dtb_u_u10)))
  | C_IrTy_IrTyRef (dtb_u_u12) -> (C_IrTy_IrTyRef (((v_irTySubstVars dtb_u_u5) dtb_u_u12)))
  | C_IrTy_IrTyArray (dtb_u_u13) -> (C_IrTy_IrTyArray (((v_irTySubstVars dtb_u_u5) dtb_u_u13)))
  | C_IrTy_IrTyOpaque -> C_IrTy_IrTyOpaque
  | C_IrTy_IrTyFloat -> C_IrTy_IrTyFloat
  | C_IrTy_IrTyBool -> C_IrTy_IrTyBool
  | C_IrTy_IrTyStr -> C_IrTy_IrTyStr
  | C_IrTy_IrTyInt -> C_IrTy_IrTyInt
  | C_IrTy_IrTyVar (dtb_u_u14) -> ((v_irTyVarAt dtb_u_u5) dtb_u_u14)
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Ir/Model.vuna"
let v_irTyDataArgsOf = (fun (dtb_u_u15 : t_IrTy B_dData_dMaybe.t_Maybe) -> (match dtb_u_u15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u16) -> (match dtb_u_u16 with
  | C_IrTy_IrTyData (dtb_u_u17, dtb_u_u18) -> dtb_u_u18
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 78 "Vuna/Ir/Model.vuna"
let rec v_irTyAt = (fun (dtb_u_u19 : t_IrTy B_dData_dList.t_List) (dtb_u_u20 : int) -> (match dtb_u_u19 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u21, dtb_u_u22) -> (if (dtb_u_u20 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u21)) else ((v_irTyAt dtb_u_u22) (dtb_u_u20 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Ir/Model.vuna"
let rec v_irTyAnnotatable = (fun (dtb_u_u23 : t_IrTy) -> (match dtb_u_u23 with
  | C_IrTy_IrTyFun (dtb_u_u24, dtb_u_u25) -> (if (v_irTyAnnotatable dtb_u_u24) then (v_irTyAnnotatable dtb_u_u25) else false)
  | C_IrTy_IrTyData (dtb_u_u26, dtb_u_u27) -> (v_allAnnotatableIrTys dtb_u_u27)
  | C_IrTy_IrTyRef (dtb_u_u28) -> (v_irTyAnnotatable dtb_u_u28)
  | C_IrTy_IrTyArray (dtb_u_u29) -> (v_irTyAnnotatable dtb_u_u29)
  | C_IrTy_IrTyOpaque -> false
  | C_IrTy_IrTyFloat -> true
  | C_IrTy_IrTyBool -> true
  | C_IrTy_IrTyStr -> true
  | C_IrTy_IrTyInt -> true
  | C_IrTy_IrTyVar (dtb_u_u30) -> false
  | _ -> failwith "DT: impossible branch"
))
# 97 "Vuna/Ir/Model.vuna"
and v_allAnnotatableIrTys = (fun (dtb_u_u31 : t_IrTy B_dData_dList.t_List) -> (match dtb_u_u31 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u33) -> (if (v_irTyAnnotatable dtb_u_u32) then (v_allAnnotatableIrTys dtb_u_u33) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Ir/Model.vuna"
let v_sameBinderId = (fun (dtb_u_u34 : t_IrBinder) (dtb_u_u35 : t_IrBinder) -> ((dtb_u_u34).f_IrBinder_irBinderId = (dtb_u_u35).f_IrBinder_irBinderId))

# 134 "Vuna/Ir/Model.vuna"
let v_mkIrBinder = (fun (dtb_u_u36 : int) (dtb_u_u37 : string) -> { f_IrBinder_irBinderId = dtb_u_u36; f_IrBinder_irBinderName = (C_IrBName_IrBUser (dtb_u_u37)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 138 "Vuna/Ir/Model.vuna"
let v_mkIrBinderTyped = (fun (dtb_u_u38 : int) (dtb_u_u39 : string) (dtb_u_u40 : t_IrTy) -> { f_IrBinder_irBinderId = dtb_u_u38; f_IrBinder_irBinderName = (C_IrBName_IrBUser (dtb_u_u39)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u40)) })

# 142 "Vuna/Ir/Model.vuna"
let v_mkIrBinderOpaque = (fun (dtb_u_u41 : int) (dtb_u_u42 : string) -> { f_IrBinder_irBinderId = dtb_u_u41; f_IrBinder_irBinderName = (C_IrBName_IrBUser (dtb_u_u42)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyOpaque)) })

# 146 "Vuna/Ir/Model.vuna"
let v_mkIrBinderErased = { f_IrBinder_irBinderId = 0; f_IrBinder_irBinderName = C_IrBName_IrBWild; f_IrBinder_irBinderErased = true; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing }

# 150 "Vuna/Ir/Model.vuna"
let v_mkIrBinderArm = (fun (dtb_u_u43 : int) (dtb_u_u44 : int) -> { f_IrBinder_irBinderId = dtb_u_u43; f_IrBinder_irBinderName = (C_IrBName_IrBArm (dtb_u_u44)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 154 "Vuna/Ir/Model.vuna"
let v_mkIrBinderNat = (fun (dtb_u_u45 : int) (dtb_u_u46 : int) -> { f_IrBinder_irBinderId = dtb_u_u45; f_IrBinder_irBinderName = (C_IrBName_IrBNat (dtb_u_u46)); f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 158 "Vuna/Ir/Model.vuna"
let v_mkIrBinderWild = (fun (dtb_u_u47 : int) -> { f_IrBinder_irBinderId = dtb_u_u47; f_IrBinder_irBinderName = C_IrBName_IrBWild; f_IrBinder_irBinderErased = false; f_IrBinder_irBinderTy = B_dData_dMaybe.C_Maybe_Nothing })

# 278 "Vuna/Ir/Model.vuna"
let rec v_irLamTyFuel = (fun (dtb_u_u48 : int) (dtb_u_u49 : t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u50 : t_IrBinder B_dData_dList.t_List) -> (if (dtb_u_u48 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u50 with
  | B_dData_dList.C_List_Nil -> dtb_u_u49
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u52) -> (match (((v_irLamTyFuel (dtb_u_u48 - 1)) dtb_u_u49) dtb_u_u52) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u53) -> (if (dtb_u_u51).f_IrBinder_irBinderErased then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u53)) else (match (dtb_u_u51).f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u54) -> (B_dData_dMaybe.C_Maybe_Just ((C_IrTy_IrTyFun (dtb_u_u54, dtb_u_u53))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ((C_IrTy_IrTyFun (C_IrTy_IrTyOpaque, dtb_u_u53))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 240 "Vuna/Ir/Model.vuna"
let rec v_irResultTyFuel = (fun (dtb_u_u55 : int) (dtb_u_u56 : t_Ir) -> (if (dtb_u_u55 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u56 with
  | C_Ir_IrVar (dtb_u_u57) -> (if (dtb_u_u57).f_IrBinder_irBinderErased then B_dData_dMaybe.C_Maybe_Nothing else (dtb_u_u57).f_IrBinder_irBinderTy)
  | C_Ir_IrRecord (dtb_u_u58, dtb_u_u59, dtb_u_u60) -> dtb_u_u59
  | C_Ir_IrProj (dtb_u_u61, dtb_u_u62, dtb_u_u63, dtb_u_u64) -> dtb_u_u64
  | C_Ir_IrRecUpd (dtb_u_u65, dtb_u_u66, dtb_u_u67, dtb_u_u68) -> dtb_u_u68
  | C_Ir_IrCast (dtb_u_u69, dtb_u_u70, dtb_u_u71) -> dtb_u_u70
  | C_Ir_IrInt (dtb_u_u72) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyInt))
  | C_Ir_IrStr (dtb_u_u73) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyStr))
  | C_Ir_IrBool (dtb_u_u74) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyBool))
  | C_Ir_IrFloatLit (dtb_u_u75) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyFloat))
  | C_Ir_IrLet (dtb_u_u76, dtb_u_u77, dtb_u_u78) -> ((v_irResultTyFuel (dtb_u_u55 - 1)) dtb_u_u78)
  | C_Ir_IrLam (dtb_u_u79, dtb_u_u80, dtb_u_u81) -> (((v_irLamTyFuel (dtb_u_u55 - 1)) dtb_u_u80) dtb_u_u79)
  | C_Ir_IrApp (dtb_u_u82, dtb_u_u83, dtb_u_u84) -> (match dtb_u_u82 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u85) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u85)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Ir_IrTail (dtb_u_u86) -> ((v_irResultTyFuel (dtb_u_u55 - 1)) dtb_u_u86)
  | C_Ir_IrIf (dtb_u_u87, dtb_u_u88, dtb_u_u89) -> (match ((v_irResultTyFuel (dtb_u_u55 - 1)) dtb_u_u88) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u90) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u90))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_irResultTyFuel (dtb_u_u55 - 1)) dtb_u_u89)
  | _ -> failwith "DT: impossible branch"
)
  | C_Ir_IrCase (dtb_u_u91, dtb_u_u92, dtb_u_u93, dtb_u_u94) -> dtb_u_u92
  | C_Ir_IrConcatMany (dtb_u_u95) -> (B_dData_dMaybe.C_Maybe_Just (C_IrTy_IrTyStr))
  | C_Ir_IrGlobal (dtb_u_u96) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrCtor (dtb_u_u97, dtb_u_u98, dtb_u_u99, dtb_u_u100) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrRt (dtb_u_u101) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrRtApp (dtb_u_u102, dtb_u_u103) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrNatCase (dtb_u_u104, dtb_u_u105, dtb_u_u106, dtb_u_u107, dtb_u_u108) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrEffThunk (dtb_u_u109, dtb_u_u110, dtb_u_u111, dtb_u_u112, dtb_u_u113) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_Ir_IrEffBind (dtb_u_u114, dtb_u_u115, dtb_u_u116) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 237 "Vuna/Ir/Model.vuna"
let v_irResultTyOf = (fun (dtb_u_u117 : t_Ir) -> ((v_irResultTyFuel 256) dtb_u_u117))

# 297 "Vuna/Ir/Model.vuna"
let v_irEffTypeName = "Base.Effect.Core.Eff"

# 300 "Vuna/Ir/Model.vuna"
let v_irEffMkCtor = "Base.Effect.Core.Eff.MkEff"

# 330 "Vuna/Ir/Model.vuna"
let v_irDefName = (fun (dtb_u_u118 : t_IrDef) -> (match dtb_u_u118 with
  | C_IrDef_IrExternDef (dtb_u_u119, dtb_u_u120, dtb_u_u121, dtb_u_u122) -> dtb_u_u119
  | C_IrDef_IrDef (dtb_u_u123, dtb_u_u124, dtb_u_u125, dtb_u_u126, dtb_u_u127, dtb_u_u128, dtb_u_u129, dtb_u_u130) -> dtb_u_u123
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Ir/Model.vuna"
let v_irDefArity = (fun (dtb_u_u131 : t_IrDef) -> (match dtb_u_u131 with
  | C_IrDef_IrExternDef (dtb_u_u132, dtb_u_u133, dtb_u_u134, dtb_u_u135) -> 0
  | C_IrDef_IrDef (dtb_u_u136, dtb_u_u137, dtb_u_u138, dtb_u_u139, dtb_u_u140, dtb_u_u141, dtb_u_u142, dtb_u_u143) -> dtb_u_u137
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Ir/Model.vuna"
let v_irDefDeps = (fun (dtb_u_u144 : t_IrDef) -> (match dtb_u_u144 with
  | C_IrDef_IrExternDef (dtb_u_u145, dtb_u_u146, dtb_u_u147, dtb_u_u148) -> B_dData_dList.C_List_Nil
  | C_IrDef_IrDef (dtb_u_u149, dtb_u_u150, dtb_u_u151, dtb_u_u152, dtb_u_u153, dtb_u_u154, dtb_u_u155, dtb_u_u156) -> dtb_u_u151
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Ir/Model.vuna"
let v_irDefTy = (fun (dtb_u_u157 : t_IrDef) -> (match dtb_u_u157 with
  | C_IrDef_IrExternDef (dtb_u_u158, dtb_u_u159, dtb_u_u160, dtb_u_u161) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u159))
  | C_IrDef_IrDef (dtb_u_u162, dtb_u_u163, dtb_u_u164, dtb_u_u165, dtb_u_u166, dtb_u_u167, dtb_u_u168, dtb_u_u169) -> dtb_u_u165
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Ir/Model.vuna"
let v_irDefBody = (fun (dtb_u_u170 : t_IrDef) -> (match dtb_u_u170 with
  | C_IrDef_IrExternDef (dtb_u_u171, dtb_u_u172, dtb_u_u173, dtb_u_u174) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_IrDef_IrDef (dtb_u_u175, dtb_u_u176, dtb_u_u177, dtb_u_u178, dtb_u_u179, dtb_u_u180, dtb_u_u181, dtb_u_u182) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u179))
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Ir/Model.vuna"
let v_irDefExtern = (fun (dtb_u_u183 : t_IrDef) -> (match dtb_u_u183 with
  | C_IrDef_IrExternDef (dtb_u_u184, dtb_u_u185, dtb_u_u186, dtb_u_u187) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u185; B_dData_dPair.f_Pair_second = dtb_u_u186 }))
  | C_IrDef_IrDef (dtb_u_u188, dtb_u_u189, dtb_u_u190, dtb_u_u191, dtb_u_u192, dtb_u_u193, dtb_u_u194, dtb_u_u195) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Ir/Model.vuna"
let v_irDefRecValueOk = (fun (dtb_u_u196 : t_IrDef) -> (match dtb_u_u196 with
  | C_IrDef_IrExternDef (dtb_u_u197, dtb_u_u198, dtb_u_u199, dtb_u_u200) -> true
  | C_IrDef_IrDef (dtb_u_u201, dtb_u_u202, dtb_u_u203, dtb_u_u204, dtb_u_u205, dtb_u_u206, dtb_u_u207, dtb_u_u208) -> dtb_u_u206
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Ir/Model.vuna"
let v_irDefInitGuard = (fun (dtb_u_u209 : t_IrDef) -> (match dtb_u_u209 with
  | C_IrDef_IrExternDef (dtb_u_u210, dtb_u_u211, dtb_u_u212, dtb_u_u213) -> false
  | C_IrDef_IrDef (dtb_u_u214, dtb_u_u215, dtb_u_u216, dtb_u_u217, dtb_u_u218, dtb_u_u219, dtb_u_u220, dtb_u_u221) -> dtb_u_u220
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Ir/Model.vuna"
let v_irDefSpan = (fun (dtb_u_u222 : t_IrDef) -> (match dtb_u_u222 with
  | C_IrDef_IrExternDef (dtb_u_u223, dtb_u_u224, dtb_u_u225, dtb_u_u226) -> dtb_u_u226
  | C_IrDef_IrDef (dtb_u_u227, dtb_u_u228, dtb_u_u229, dtb_u_u230, dtb_u_u231, dtb_u_u232, dtb_u_u233, dtb_u_u234) -> dtb_u_u234
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Ir/Model.vuna"
let rec v_irSharedUnboxedOf = (fun (dtb_u_u235 : string) (dtb_u_u236 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u236 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u237, dtb_u_u238) -> (if ((B_dData_dPair.v_firstOf dtb_u_u237) = dtb_u_u235) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u237))) else ((v_irSharedUnboxedOf dtb_u_u235) dtb_u_u238))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Ir/Model.vuna"
let rec v_irSharedCtorShapeOf = (fun (dtb_u_u239 : string) (dtb_u_u240 : (string, (string, bool B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u240 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u241, dtb_u_u242) -> (if ((B_dData_dPair.v_firstOf dtb_u_u241) = dtb_u_u239) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u241))) else ((v_irSharedCtorShapeOf dtb_u_u239) dtb_u_u242))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Ir/Model.vuna"
let rec v_irSharedRecordFieldsOf = (fun (dtb_u_u243 : string) (dtb_u_u244 : (string, (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u244 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u245, dtb_u_u246) -> (if ((B_dData_dPair.v_firstOf dtb_u_u245) = dtb_u_u243) then (B_dData_dPair.v_secondOf dtb_u_u245) else ((v_irSharedRecordFieldsOf dtb_u_u243) dtb_u_u246))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Ir/Model.vuna"
let v_irInlineArity = (fun (dtb_u_u247 : string) -> (if (dtb_u_u247 = "+") then 2 else (if (dtb_u_u247 = "-") then 2 else (if (dtb_u_u247 = "*") then 2 else (if (dtb_u_u247 = "/") then 2 else (if (dtb_u_u247 = "&&") then 2 else (if (dtb_u_u247 = "||") then 2 else (if (dtb_u_u247 = "bitAnd") then 2 else (if (dtb_u_u247 = "bitOr") then 2 else (if (dtb_u_u247 = "bitXor") then 2 else (if (dtb_u_u247 = "bitNot") then 1 else (if (dtb_u_u247 = "bitShl") then 2 else (if (dtb_u_u247 = "bitShr") then 2 else (if (dtb_u_u247 = "++") then 2 else (if (dtb_u_u247 = "strLength") then 1 else (if (dtb_u_u247 = "strAt") then 2 else (if (dtb_u_u247 = "strFromInt") then 1 else (if (dtb_u_u247 = "bi_eq_int") then 2 else (if (dtb_u_u247 = "bi_neq_int") then 2 else (if (dtb_u_u247 = "effectId") then 1 else (if (dtb_u_u247 = "bi_eq_str") then 2 else (if (dtb_u_u247 = "bi_neq_str") then 2 else (if (dtb_u_u247 = "bi_lt_int") then 2 else (if (dtb_u_u247 = "bi_le_int") then 2 else (if (dtb_u_u247 = "bi_gt_int") then 2 else (if (dtb_u_u247 = "bi_ge_int") then 2 else (if (dtb_u_u247 = "bi_lt_str") then 2 else (if (dtb_u_u247 = "bi_le_str") then 2 else (if (dtb_u_u247 = "bi_gt_str") then 2 else (if (dtb_u_u247 = "bi_ge_str") then 2 else (if (dtb_u_u247 = "bi_lt_bool") then 2 else (if (dtb_u_u247 = "bi_le_bool") then 2 else (if (dtb_u_u247 = "bi_gt_bool") then 2 else (if (dtb_u_u247 = "bi_ge_bool") then 2 else (if (dtb_u_u247 = "bi_add_float") then 2 else (if (dtb_u_u247 = "bi_sub_float") then 2 else (if (dtb_u_u247 = "bi_mul_float") then 2 else (if (dtb_u_u247 = "bi_div_float") then 2 else (if (dtb_u_u247 = "bi_eq_float") then 2 else (if (dtb_u_u247 = "bi_neq_float") then 2 else (if (dtb_u_u247 = "bi_lt_float") then 2 else (if (dtb_u_u247 = "bi_le_float") then 2 else (if (dtb_u_u247 = "bi_gt_float") then 2 else (if (dtb_u_u247 = "bi_ge_float") then 2 else (if (dtb_u_u247 = "@ir@m@runEff") then 2 else (if (dtb_u_u247 = "natToInt") then 1 else (if (dtb_u_u247 = "natFromInt") then 1 else (if (dtb_u_u247 = "natAdd") then 2 else (if (dtb_u_u247 = "natSub") then 2 else (if (dtb_u_u247 = "natMul") then 2 else (if (dtb_u_u247 = "natDiv") then 2 else 0)))))))))))))))))))))))))))))))))))))))))))))))))))

# 530 "Vuna/Ir/Model.vuna"
let v_irListFamilyOf = (fun (dtb_u_u248 : t_IrListFam) -> (match dtb_u_u248 with
  | { f_IrListFam_irListFamily = dtb_u_u249; f_IrListFam_irListNil = dtb_u_u250; f_IrListFam_irListCons = dtb_u_u251 } -> dtb_u_u249
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Ir/Model.vuna"
let v_irListNilOf = (fun (dtb_u_u252 : t_IrListFam) -> (match dtb_u_u252 with
  | { f_IrListFam_irListFamily = dtb_u_u253; f_IrListFam_irListNil = dtb_u_u254; f_IrListFam_irListCons = dtb_u_u255 } -> dtb_u_u254
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Ir/Model.vuna"
let v_irListConsOf = (fun (dtb_u_u256 : t_IrListFam) -> (match dtb_u_u256 with
  | { f_IrListFam_irListFamily = dtb_u_u257; f_IrListFam_irListNil = dtb_u_u258; f_IrListFam_irListCons = dtb_u_u259 } -> dtb_u_u259
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Ir/Model.vuna"
let v_irAltCtorOf = (fun (dtb_u_u260 : t_IrAlt) -> (match dtb_u_u260 with
  | { f_IrAlt_irAltCtor = dtb_u_u261; f_IrAlt_irAltBinders = dtb_u_u262; f_IrAlt_irAltBody = dtb_u_u263 } -> dtb_u_u261
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Ir/Model.vuna"
let v_irAltBindersOf = (fun (dtb_u_u264 : t_IrAlt) -> (match dtb_u_u264 with
  | { f_IrAlt_irAltCtor = dtb_u_u265; f_IrAlt_irAltBinders = dtb_u_u266; f_IrAlt_irAltBody = dtb_u_u267 } -> dtb_u_u266
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Ir/Model.vuna"
let v_irAltBodyOf = (fun (dtb_u_u268 : t_IrAlt) -> (match dtb_u_u268 with
  | { f_IrAlt_irAltCtor = dtb_u_u269; f_IrAlt_irAltBinders = dtb_u_u270; f_IrAlt_irAltBody = dtb_u_u271 } -> dtb_u_u271
  | _ -> failwith "DT: impossible branch"
))

# 583 "Vuna/Ir/Model.vuna"
let[@tail_mod_cons] rec v_altBodies = (fun (dtb_u_u272 : t_IrAlt B_dData_dList.t_List) -> (match dtb_u_u272 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u273, dtb_u_u274) -> (B_dData_dList.C_List__x58__x58_ ((v_irAltBodyOf dtb_u_u273), (v_altBodies dtb_u_u274)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Ir/Model.vuna"
let v_maybeAltBodies = (fun (dtb_u_u275 : t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u275 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u276) -> (B_dData_dList.C_List__x58__x58_ ((v_irAltBodyOf dtb_u_u276), B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 555 "Vuna/Ir/Model.vuna"
let v_irChildren = (fun (dtb_u_u277 : t_Ir) -> (match dtb_u_u277 with
  | C_Ir_IrEffBind (dtb_u_u278, dtb_u_u279, dtb_u_u280) -> B_dData_dList.C_List_Nil
  | C_Ir_IrFloatLit (dtb_u_u281) -> B_dData_dList.C_List_Nil
  | C_Ir_IrBool (dtb_u_u282) -> B_dData_dList.C_List_Nil
  | C_Ir_IrStr (dtb_u_u283) -> B_dData_dList.C_List_Nil
  | C_Ir_IrInt (dtb_u_u284) -> B_dData_dList.C_List_Nil
  | C_Ir_IrRt (dtb_u_u285) -> B_dData_dList.C_List_Nil
  | C_Ir_IrGlobal (dtb_u_u286) -> B_dData_dList.C_List_Nil
  | C_Ir_IrVar (dtb_u_u287) -> B_dData_dList.C_List_Nil
  | C_Ir_IrTail (dtb_u_u288) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u288, B_dData_dList.C_List_Nil))
  | C_Ir_IrEffThunk (dtb_u_u289, dtb_u_u290, dtb_u_u291, dtb_u_u292, dtb_u_u293) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u293, B_dData_dList.C_List_Nil))
  | C_Ir_IrConcatMany (dtb_u_u294) -> dtb_u_u294
  | C_Ir_IrNatCase (dtb_u_u295, dtb_u_u296, dtb_u_u297, dtb_u_u298, dtb_u_u299) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb_u_u295, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append (v_maybeAltBodies dtb_u_u297)) ((B_dData_dList.v_append (v_maybeAltBodies dtb_u_u298)) (v_maybeAltBodies dtb_u_u299))))
  | C_Ir_IrCase (dtb_u_u300, dtb_u_u301, dtb_u_u302, dtb_u_u303) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u302, (v_altBodies dtb_u_u303)))
  | C_Ir_IrIf (dtb_u_u304, dtb_u_u305, dtb_u_u306) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u304, (B_dData_dList.C_List__x58__x58_ (dtb_u_u305, (B_dData_dList.C_List__x58__x58_ (dtb_u_u306, B_dData_dList.C_List_Nil))))))
  | C_Ir_IrApp (dtb_u_u307, dtb_u_u308, dtb_u_u309) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u308, (B_dData_dList.C_List__x58__x58_ (dtb_u_u309, B_dData_dList.C_List_Nil))))
  | C_Ir_IrLam (dtb_u_u310, dtb_u_u311, dtb_u_u312) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u312, B_dData_dList.C_List_Nil))
  | C_Ir_IrLet (dtb_u_u313, dtb_u_u314, dtb_u_u315) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u314, (B_dData_dList.C_List__x58__x58_ (dtb_u_u315, B_dData_dList.C_List_Nil))))
  | C_Ir_IrCast (dtb_u_u316, dtb_u_u317, dtb_u_u318) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u318, B_dData_dList.C_List_Nil))
  | C_Ir_IrRtApp (dtb_u_u319, dtb_u_u320) -> dtb_u_u320
  | C_Ir_IrRecUpd (dtb_u_u321, dtb_u_u322, dtb_u_u323, dtb_u_u324) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u321, ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb_u_u323)))
  | C_Ir_IrProj (dtb_u_u325, dtb_u_u326, dtb_u_u327, dtb_u_u328) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u325, B_dData_dList.C_List_Nil))
  | C_Ir_IrRecord (dtb_u_u329, dtb_u_u330, dtb_u_u331) -> ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb_u_u331)
  | C_Ir_IrCtor (dtb_u_u332, dtb_u_u333, dtb_u_u334, dtb_u_u335) -> dtb_u_u335
  | _ -> failwith "DT: impossible branch"
))

# 592 "Vuna/Ir/Model.vuna"
let v_irEntryShowOf = (fun (dtb_u_u336 : t_IrEntry) -> (match dtb_u_u336 with
  | { f_IrEntry_irEntryShow = dtb_u_u337; f_IrEntry_irEntryMain = dtb_u_u338; f_IrEntry_irEntryIsAction = dtb_u_u339; f_IrEntry_irEntryRunMain = dtb_u_u340; f_IrEntry_irEntryHandlers = dtb_u_u341; f_IrEntry_irEntryRowTags = dtb_u_u342 } -> dtb_u_u337
  | _ -> failwith "DT: impossible branch"
))

# 596 "Vuna/Ir/Model.vuna"
let v_irEntryMainOf = (fun (dtb_u_u343 : t_IrEntry) -> (match dtb_u_u343 with
  | { f_IrEntry_irEntryShow = dtb_u_u344; f_IrEntry_irEntryMain = dtb_u_u345; f_IrEntry_irEntryIsAction = dtb_u_u346; f_IrEntry_irEntryRunMain = dtb_u_u347; f_IrEntry_irEntryHandlers = dtb_u_u348; f_IrEntry_irEntryRowTags = dtb_u_u349 } -> dtb_u_u345
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Ir/Model.vuna"
let v_irEntryIsActionOf = (fun (dtb_u_u350 : t_IrEntry) -> (match dtb_u_u350 with
  | { f_IrEntry_irEntryShow = dtb_u_u351; f_IrEntry_irEntryMain = dtb_u_u352; f_IrEntry_irEntryIsAction = dtb_u_u353; f_IrEntry_irEntryRunMain = dtb_u_u354; f_IrEntry_irEntryHandlers = dtb_u_u355; f_IrEntry_irEntryRowTags = dtb_u_u356 } -> dtb_u_u353
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Ir/Model.vuna"
let v_irEntryRunMainOf = (fun (dtb_u_u357 : t_IrEntry) -> (match dtb_u_u357 with
  | { f_IrEntry_irEntryShow = dtb_u_u358; f_IrEntry_irEntryMain = dtb_u_u359; f_IrEntry_irEntryIsAction = dtb_u_u360; f_IrEntry_irEntryRunMain = dtb_u_u361; f_IrEntry_irEntryHandlers = dtb_u_u362; f_IrEntry_irEntryRowTags = dtb_u_u363 } -> dtb_u_u361
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Ir/Model.vuna"
let v_irEntryHandlersOf = (fun (dtb_u_u364 : t_IrEntry) -> (match dtb_u_u364 with
  | { f_IrEntry_irEntryShow = dtb_u_u365; f_IrEntry_irEntryMain = dtb_u_u366; f_IrEntry_irEntryIsAction = dtb_u_u367; f_IrEntry_irEntryRunMain = dtb_u_u368; f_IrEntry_irEntryHandlers = dtb_u_u369; f_IrEntry_irEntryRowTags = dtb_u_u370 } -> dtb_u_u369
  | _ -> failwith "DT: impossible branch"
))

# 612 "Vuna/Ir/Model.vuna"
let v_irEntryRowTagsOf = (fun (dtb_u_u371 : t_IrEntry) -> (match dtb_u_u371 with
  | { f_IrEntry_irEntryShow = dtb_u_u372; f_IrEntry_irEntryMain = dtb_u_u373; f_IrEntry_irEntryIsAction = dtb_u_u374; f_IrEntry_irEntryRunMain = dtb_u_u375; f_IrEntry_irEntryHandlers = dtb_u_u376; f_IrEntry_irEntryRowTags = dtb_u_u377 } -> dtb_u_u377
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Ir/Model.vuna"
let v_irProgSharedOf = (fun (dtb_u_u378 : t_IrProgram) -> (match dtb_u_u378 with
  | { f_IrProgram_irProgShared = dtb_u_u379; f_IrProgram_irProgUnit = dtb_u_u380 } -> dtb_u_u379
  | _ -> failwith "DT: impossible branch"
))

# 620 "Vuna/Ir/Model.vuna"
let v_irProgUnitOf = (fun (dtb_u_u381 : t_IrProgram) -> (match dtb_u_u381 with
  | { f_IrProgram_irProgShared = dtb_u_u382; f_IrProgram_irProgUnit = dtb_u_u383 } -> dtb_u_u383
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Ir/Model.vuna"
let rec v_irSize = (fun (dtb_u_u384 : t_Ir) -> (match dtb_u_u384 with
  | C_Ir_IrTail (dtb_u_u385) -> (v_irSize dtb_u_u385)
  | _ -> (1 + (v_irSizeChildren dtb_u_u384))
))
# 631 "Vuna/Ir/Model.vuna"
and v_irSizeChildren = (fun (dtb_u_u386 : t_Ir) -> (match dtb_u_u386 with
  | C_Ir_IrEffBind (dtb_u_u387, dtb_u_u388, dtb_u_u389) -> 0
  | C_Ir_IrFloatLit (dtb_u_u390) -> 0
  | C_Ir_IrBool (dtb_u_u391) -> 0
  | C_Ir_IrStr (dtb_u_u392) -> 0
  | C_Ir_IrInt (dtb_u_u393) -> 0
  | C_Ir_IrRt (dtb_u_u394) -> 0
  | C_Ir_IrGlobal (dtb_u_u395) -> 0
  | C_Ir_IrVar (dtb_u_u396) -> 0
  | C_Ir_IrEffThunk (dtb_u_u397, dtb_u_u398, dtb_u_u399, dtb_u_u400, dtb_u_u401) -> (v_irSize dtb_u_u401)
  | C_Ir_IrConcatMany (dtb_u_u402) -> (v_irSizeList dtb_u_u402)
  | C_Ir_IrNatCase (dtb_u_u403, dtb_u_u404, dtb_u_u405, dtb_u_u406, dtb_u_u407) -> ((((v_irSize dtb_u_u403) + (v_irSizeAlt dtb_u_u405)) + (v_irSizeAlt dtb_u_u406)) + (v_irSizeAlt dtb_u_u407))
  | C_Ir_IrCase (dtb_u_u408, dtb_u_u409, dtb_u_u410, dtb_u_u411) -> ((v_irSize dtb_u_u410) + (v_irSizeAlts dtb_u_u411))
  | C_Ir_IrIf (dtb_u_u412, dtb_u_u413, dtb_u_u414) -> (((v_irSize dtb_u_u412) + (v_irSize dtb_u_u413)) + (v_irSize dtb_u_u414))
  | C_Ir_IrTail (dtb_u_u415) -> (v_irSize dtb_u_u415)
  | C_Ir_IrApp (dtb_u_u416, dtb_u_u417, dtb_u_u418) -> ((v_irSize dtb_u_u417) + (v_irSize dtb_u_u418))
  | C_Ir_IrLam (dtb_u_u419, dtb_u_u420, dtb_u_u421) -> (v_irSize dtb_u_u421)
  | C_Ir_IrLet (dtb_u_u422, dtb_u_u423, dtb_u_u424) -> ((v_irSize dtb_u_u423) + (v_irSize dtb_u_u424))
  | C_Ir_IrCast (dtb_u_u425, dtb_u_u426, dtb_u_u427) -> (v_irSize dtb_u_u427)
  | C_Ir_IrRtApp (dtb_u_u428, dtb_u_u429) -> (v_irSizeList dtb_u_u429)
  | C_Ir_IrRecUpd (dtb_u_u430, dtb_u_u431, dtb_u_u432, dtb_u_u433) -> ((v_irSize dtb_u_u430) + (v_irSizeFields dtb_u_u432))
  | C_Ir_IrProj (dtb_u_u434, dtb_u_u435, dtb_u_u436, dtb_u_u437) -> (v_irSize dtb_u_u434)
  | C_Ir_IrRecord (dtb_u_u438, dtb_u_u439, dtb_u_u440) -> (v_irSizeFields dtb_u_u440)
  | C_Ir_IrCtor (dtb_u_u441, dtb_u_u442, dtb_u_u443, dtb_u_u444) -> (v_irSizeList dtb_u_u444)
  | _ -> failwith "DT: impossible branch"
))
# 657 "Vuna/Ir/Model.vuna"
and v_irSizeList = (fun (dtb_u_u445 : t_Ir B_dData_dList.t_List) -> (match dtb_u_u445 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u446, dtb_u_u447) -> ((v_irSize dtb_u_u446) + (v_irSizeList dtb_u_u447))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 661 "Vuna/Ir/Model.vuna"
and v_irSizeFields = (fun (dtb_u_u448 : (string, t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u448 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u449, dtb_u_u450) -> (match dtb_u_u449 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u451; B_dData_dPair.f_Pair_second = dtb_u_u452 } -> ((v_irSize dtb_u_u452) + (v_irSizeFields dtb_u_u450))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 665 "Vuna/Ir/Model.vuna"
and v_irSizeAlts = (fun (dtb_u_u453 : t_IrAlt B_dData_dList.t_List) -> (match dtb_u_u453 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u454, dtb_u_u455) -> ((v_irSize (v_irAltBodyOf dtb_u_u454)) + (v_irSizeAlts dtb_u_u455))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 669 "Vuna/Ir/Model.vuna"
and v_irSizeAlt = (fun (dtb_u_u456 : t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u456 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u457) -> (v_irSize (v_irAltBodyOf dtb_u_u457))
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Ir/Model.vuna"
let v_irBinderId = (fun (dtb_u_u458 : t_IrBinder) -> (match dtb_u_u458 with
  | { f_IrBinder_irBinderId = dtb_u_u459; f_IrBinder_irBinderName = dtb_u_u460; f_IrBinder_irBinderErased = dtb_u_u461; f_IrBinder_irBinderTy = dtb_u_u462 } -> dtb_u_u459
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Ir/Model.vuna"
let v_irBinderName = (fun (dtb_u_u463 : t_IrBinder) -> (match dtb_u_u463 with
  | { f_IrBinder_irBinderId = dtb_u_u464; f_IrBinder_irBinderName = dtb_u_u465; f_IrBinder_irBinderErased = dtb_u_u466; f_IrBinder_irBinderTy = dtb_u_u467 } -> dtb_u_u465
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Ir/Model.vuna"
let v_irBinderErased = (fun (dtb_u_u468 : t_IrBinder) -> (match dtb_u_u468 with
  | { f_IrBinder_irBinderId = dtb_u_u469; f_IrBinder_irBinderName = dtb_u_u470; f_IrBinder_irBinderErased = dtb_u_u471; f_IrBinder_irBinderTy = dtb_u_u472 } -> dtb_u_u471
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Ir/Model.vuna"
let v_irBinderTy = (fun (dtb_u_u473 : t_IrBinder) -> (match dtb_u_u473 with
  | { f_IrBinder_irBinderId = dtb_u_u474; f_IrBinder_irBinderName = dtb_u_u475; f_IrBinder_irBinderErased = dtb_u_u476; f_IrBinder_irBinderTy = dtb_u_u477 } -> dtb_u_u477
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Ir/Model.vuna"
let v_irAltCtor = (fun (dtb_u_u478 : t_IrAlt) -> (match dtb_u_u478 with
  | { f_IrAlt_irAltCtor = dtb_u_u479; f_IrAlt_irAltBinders = dtb_u_u480; f_IrAlt_irAltBody = dtb_u_u481 } -> dtb_u_u479
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Ir/Model.vuna"
let v_irAltBinders = (fun (dtb_u_u482 : t_IrAlt) -> (match dtb_u_u482 with
  | { f_IrAlt_irAltCtor = dtb_u_u483; f_IrAlt_irAltBinders = dtb_u_u484; f_IrAlt_irAltBody = dtb_u_u485 } -> dtb_u_u484
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Ir/Model.vuna"
let v_irAltBody = (fun (dtb_u_u486 : t_IrAlt) -> (match dtb_u_u486 with
  | { f_IrAlt_irAltCtor = dtb_u_u487; f_IrAlt_irAltBinders = dtb_u_u488; f_IrAlt_irAltBody = dtb_u_u489 } -> dtb_u_u489
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Ir/Model.vuna"
let v_irGroupIsRec = (fun (dtb_u_u490 : t_IrGroup) -> (match dtb_u_u490 with
  | { f_IrGroup_irGroupIsRec = dtb_u_u491; f_IrGroup_irGroupDefs = dtb_u_u492 } -> dtb_u_u491
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Ir/Model.vuna"
let v_irGroupDefs = (fun (dtb_u_u493 : t_IrGroup) -> (match dtb_u_u493 with
  | { f_IrGroup_irGroupIsRec = dtb_u_u494; f_IrGroup_irGroupDefs = dtb_u_u495 } -> dtb_u_u495
  | _ -> failwith "DT: impossible branch"
))

# 380 "Vuna/Ir/Model.vuna"
let v_irEntryShow = (fun (dtb_u_u496 : t_IrEntry) -> (match dtb_u_u496 with
  | { f_IrEntry_irEntryShow = dtb_u_u497; f_IrEntry_irEntryMain = dtb_u_u498; f_IrEntry_irEntryIsAction = dtb_u_u499; f_IrEntry_irEntryRunMain = dtb_u_u500; f_IrEntry_irEntryHandlers = dtb_u_u501; f_IrEntry_irEntryRowTags = dtb_u_u502 } -> dtb_u_u497
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Ir/Model.vuna"
let v_irEntryMain = (fun (dtb_u_u503 : t_IrEntry) -> (match dtb_u_u503 with
  | { f_IrEntry_irEntryShow = dtb_u_u504; f_IrEntry_irEntryMain = dtb_u_u505; f_IrEntry_irEntryIsAction = dtb_u_u506; f_IrEntry_irEntryRunMain = dtb_u_u507; f_IrEntry_irEntryHandlers = dtb_u_u508; f_IrEntry_irEntryRowTags = dtb_u_u509 } -> dtb_u_u505
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Ir/Model.vuna"
let v_irEntryIsAction = (fun (dtb_u_u510 : t_IrEntry) -> (match dtb_u_u510 with
  | { f_IrEntry_irEntryShow = dtb_u_u511; f_IrEntry_irEntryMain = dtb_u_u512; f_IrEntry_irEntryIsAction = dtb_u_u513; f_IrEntry_irEntryRunMain = dtb_u_u514; f_IrEntry_irEntryHandlers = dtb_u_u515; f_IrEntry_irEntryRowTags = dtb_u_u516 } -> dtb_u_u513
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Ir/Model.vuna"
let v_irEntryRunMain = (fun (dtb_u_u517 : t_IrEntry) -> (match dtb_u_u517 with
  | { f_IrEntry_irEntryShow = dtb_u_u518; f_IrEntry_irEntryMain = dtb_u_u519; f_IrEntry_irEntryIsAction = dtb_u_u520; f_IrEntry_irEntryRunMain = dtb_u_u521; f_IrEntry_irEntryHandlers = dtb_u_u522; f_IrEntry_irEntryRowTags = dtb_u_u523 } -> dtb_u_u521
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Ir/Model.vuna"
let v_irEntryHandlers = (fun (dtb_u_u524 : t_IrEntry) -> (match dtb_u_u524 with
  | { f_IrEntry_irEntryShow = dtb_u_u525; f_IrEntry_irEntryMain = dtb_u_u526; f_IrEntry_irEntryIsAction = dtb_u_u527; f_IrEntry_irEntryRunMain = dtb_u_u528; f_IrEntry_irEntryHandlers = dtb_u_u529; f_IrEntry_irEntryRowTags = dtb_u_u530 } -> dtb_u_u529
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Ir/Model.vuna"
let v_irEntryRowTags = (fun (dtb_u_u531 : t_IrEntry) -> (match dtb_u_u531 with
  | { f_IrEntry_irEntryShow = dtb_u_u532; f_IrEntry_irEntryMain = dtb_u_u533; f_IrEntry_irEntryIsAction = dtb_u_u534; f_IrEntry_irEntryRunMain = dtb_u_u535; f_IrEntry_irEntryHandlers = dtb_u_u536; f_IrEntry_irEntryRowTags = dtb_u_u537 } -> dtb_u_u537
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Ir/Model.vuna"
let v_irListFamily = (fun (dtb_u_u538 : t_IrListFam) -> (match dtb_u_u538 with
  | { f_IrListFam_irListFamily = dtb_u_u539; f_IrListFam_irListNil = dtb_u_u540; f_IrListFam_irListCons = dtb_u_u541 } -> dtb_u_u539
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Ir/Model.vuna"
let v_irListNil = (fun (dtb_u_u542 : t_IrListFam) -> (match dtb_u_u542 with
  | { f_IrListFam_irListFamily = dtb_u_u543; f_IrListFam_irListNil = dtb_u_u544; f_IrListFam_irListCons = dtb_u_u545 } -> dtb_u_u544
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Ir/Model.vuna"
let v_irListCons = (fun (dtb_u_u546 : t_IrListFam) -> (match dtb_u_u546 with
  | { f_IrListFam_irListFamily = dtb_u_u547; f_IrListFam_irListNil = dtb_u_u548; f_IrListFam_irListCons = dtb_u_u549 } -> dtb_u_u549
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Ir/Model.vuna"
let v_irSharedRecordFields = (fun (dtb_u_u550 : t_IrShared) -> (match dtb_u_u550 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u551; f_IrShared_irSharedListFam = dtb_u_u552; f_IrShared_irSharedUsesFloat = dtb_u_u553; f_IrShared_irSharedUsesTrace = dtb_u_u554; f_IrShared_irSharedUsesObs = dtb_u_u555; f_IrShared_irSharedDefLocs = dtb_u_u556; f_IrShared_irSharedUnboxed = dtb_u_u557; f_IrShared_irSharedCtorShapes = dtb_u_u558; f_IrShared_irSharedUsesHost = dtb_u_u559; f_IrShared_irSharedUsesSched = dtb_u_u560; f_IrShared_irSharedUsesEff = dtb_u_u561 } -> dtb_u_u551
  | _ -> failwith "DT: impossible branch"
))

# 411 "Vuna/Ir/Model.vuna"
let v_irSharedListFam = (fun (dtb_u_u562 : t_IrShared) -> (match dtb_u_u562 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u563; f_IrShared_irSharedListFam = dtb_u_u564; f_IrShared_irSharedUsesFloat = dtb_u_u565; f_IrShared_irSharedUsesTrace = dtb_u_u566; f_IrShared_irSharedUsesObs = dtb_u_u567; f_IrShared_irSharedDefLocs = dtb_u_u568; f_IrShared_irSharedUnboxed = dtb_u_u569; f_IrShared_irSharedCtorShapes = dtb_u_u570; f_IrShared_irSharedUsesHost = dtb_u_u571; f_IrShared_irSharedUsesSched = dtb_u_u572; f_IrShared_irSharedUsesEff = dtb_u_u573 } -> dtb_u_u564
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Ir/Model.vuna"
let v_irSharedUsesFloat = (fun (dtb_u_u574 : t_IrShared) -> (match dtb_u_u574 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u575; f_IrShared_irSharedListFam = dtb_u_u576; f_IrShared_irSharedUsesFloat = dtb_u_u577; f_IrShared_irSharedUsesTrace = dtb_u_u578; f_IrShared_irSharedUsesObs = dtb_u_u579; f_IrShared_irSharedDefLocs = dtb_u_u580; f_IrShared_irSharedUnboxed = dtb_u_u581; f_IrShared_irSharedCtorShapes = dtb_u_u582; f_IrShared_irSharedUsesHost = dtb_u_u583; f_IrShared_irSharedUsesSched = dtb_u_u584; f_IrShared_irSharedUsesEff = dtb_u_u585 } -> dtb_u_u577
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Ir/Model.vuna"
let v_irSharedUsesTrace = (fun (dtb_u_u586 : t_IrShared) -> (match dtb_u_u586 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u587; f_IrShared_irSharedListFam = dtb_u_u588; f_IrShared_irSharedUsesFloat = dtb_u_u589; f_IrShared_irSharedUsesTrace = dtb_u_u590; f_IrShared_irSharedUsesObs = dtb_u_u591; f_IrShared_irSharedDefLocs = dtb_u_u592; f_IrShared_irSharedUnboxed = dtb_u_u593; f_IrShared_irSharedCtorShapes = dtb_u_u594; f_IrShared_irSharedUsesHost = dtb_u_u595; f_IrShared_irSharedUsesSched = dtb_u_u596; f_IrShared_irSharedUsesEff = dtb_u_u597 } -> dtb_u_u590
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Ir/Model.vuna"
let v_irSharedUsesObs = (fun (dtb_u_u598 : t_IrShared) -> (match dtb_u_u598 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u599; f_IrShared_irSharedListFam = dtb_u_u600; f_IrShared_irSharedUsesFloat = dtb_u_u601; f_IrShared_irSharedUsesTrace = dtb_u_u602; f_IrShared_irSharedUsesObs = dtb_u_u603; f_IrShared_irSharedDefLocs = dtb_u_u604; f_IrShared_irSharedUnboxed = dtb_u_u605; f_IrShared_irSharedCtorShapes = dtb_u_u606; f_IrShared_irSharedUsesHost = dtb_u_u607; f_IrShared_irSharedUsesSched = dtb_u_u608; f_IrShared_irSharedUsesEff = dtb_u_u609 } -> dtb_u_u603
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Ir/Model.vuna"
let v_irSharedDefLocs = (fun (dtb_u_u610 : t_IrShared) -> (match dtb_u_u610 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u611; f_IrShared_irSharedListFam = dtb_u_u612; f_IrShared_irSharedUsesFloat = dtb_u_u613; f_IrShared_irSharedUsesTrace = dtb_u_u614; f_IrShared_irSharedUsesObs = dtb_u_u615; f_IrShared_irSharedDefLocs = dtb_u_u616; f_IrShared_irSharedUnboxed = dtb_u_u617; f_IrShared_irSharedCtorShapes = dtb_u_u618; f_IrShared_irSharedUsesHost = dtb_u_u619; f_IrShared_irSharedUsesSched = dtb_u_u620; f_IrShared_irSharedUsesEff = dtb_u_u621 } -> dtb_u_u616
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Ir/Model.vuna"
let v_irSharedUnboxed = (fun (dtb_u_u622 : t_IrShared) -> (match dtb_u_u622 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u623; f_IrShared_irSharedListFam = dtb_u_u624; f_IrShared_irSharedUsesFloat = dtb_u_u625; f_IrShared_irSharedUsesTrace = dtb_u_u626; f_IrShared_irSharedUsesObs = dtb_u_u627; f_IrShared_irSharedDefLocs = dtb_u_u628; f_IrShared_irSharedUnboxed = dtb_u_u629; f_IrShared_irSharedCtorShapes = dtb_u_u630; f_IrShared_irSharedUsesHost = dtb_u_u631; f_IrShared_irSharedUsesSched = dtb_u_u632; f_IrShared_irSharedUsesEff = dtb_u_u633 } -> dtb_u_u629
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Ir/Model.vuna"
let v_irSharedCtorShapes = (fun (dtb_u_u634 : t_IrShared) -> (match dtb_u_u634 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u635; f_IrShared_irSharedListFam = dtb_u_u636; f_IrShared_irSharedUsesFloat = dtb_u_u637; f_IrShared_irSharedUsesTrace = dtb_u_u638; f_IrShared_irSharedUsesObs = dtb_u_u639; f_IrShared_irSharedDefLocs = dtb_u_u640; f_IrShared_irSharedUnboxed = dtb_u_u641; f_IrShared_irSharedCtorShapes = dtb_u_u642; f_IrShared_irSharedUsesHost = dtb_u_u643; f_IrShared_irSharedUsesSched = dtb_u_u644; f_IrShared_irSharedUsesEff = dtb_u_u645 } -> dtb_u_u642
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Ir/Model.vuna"
let v_irSharedUsesHost = (fun (dtb_u_u646 : t_IrShared) -> (match dtb_u_u646 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u647; f_IrShared_irSharedListFam = dtb_u_u648; f_IrShared_irSharedUsesFloat = dtb_u_u649; f_IrShared_irSharedUsesTrace = dtb_u_u650; f_IrShared_irSharedUsesObs = dtb_u_u651; f_IrShared_irSharedDefLocs = dtb_u_u652; f_IrShared_irSharedUnboxed = dtb_u_u653; f_IrShared_irSharedCtorShapes = dtb_u_u654; f_IrShared_irSharedUsesHost = dtb_u_u655; f_IrShared_irSharedUsesSched = dtb_u_u656; f_IrShared_irSharedUsesEff = dtb_u_u657 } -> dtb_u_u655
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Ir/Model.vuna"
let v_irSharedUsesSched = (fun (dtb_u_u658 : t_IrShared) -> (match dtb_u_u658 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u659; f_IrShared_irSharedListFam = dtb_u_u660; f_IrShared_irSharedUsesFloat = dtb_u_u661; f_IrShared_irSharedUsesTrace = dtb_u_u662; f_IrShared_irSharedUsesObs = dtb_u_u663; f_IrShared_irSharedDefLocs = dtb_u_u664; f_IrShared_irSharedUnboxed = dtb_u_u665; f_IrShared_irSharedCtorShapes = dtb_u_u666; f_IrShared_irSharedUsesHost = dtb_u_u667; f_IrShared_irSharedUsesSched = dtb_u_u668; f_IrShared_irSharedUsesEff = dtb_u_u669 } -> dtb_u_u668
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Ir/Model.vuna"
let v_irSharedUsesEff = (fun (dtb_u_u670 : t_IrShared) -> (match dtb_u_u670 with
  | { f_IrShared_irSharedRecordFields = dtb_u_u671; f_IrShared_irSharedListFam = dtb_u_u672; f_IrShared_irSharedUsesFloat = dtb_u_u673; f_IrShared_irSharedUsesTrace = dtb_u_u674; f_IrShared_irSharedUsesObs = dtb_u_u675; f_IrShared_irSharedDefLocs = dtb_u_u676; f_IrShared_irSharedUnboxed = dtb_u_u677; f_IrShared_irSharedCtorShapes = dtb_u_u678; f_IrShared_irSharedUsesHost = dtb_u_u679; f_IrShared_irSharedUsesSched = dtb_u_u680; f_IrShared_irSharedUsesEff = dtb_u_u681 } -> dtb_u_u681
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Ir/Model.vuna"
let v_irUnitTyDecls = (fun (dtb_u_u682 : t_IrUnit) -> (match dtb_u_u682 with
  | { f_IrUnit_irUnitTyDecls = dtb_u_u683; f_IrUnit_irUnitGroups = dtb_u_u684; f_IrUnit_irUnitHasListFamily = dtb_u_u685; f_IrUnit_irUnitTypeRefs = dtb_u_u686; f_IrUnit_irUnitEntry = dtb_u_u687 } -> dtb_u_u683
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Ir/Model.vuna"
let v_irUnitGroups = (fun (dtb_u_u688 : t_IrUnit) -> (match dtb_u_u688 with
  | { f_IrUnit_irUnitTyDecls = dtb_u_u689; f_IrUnit_irUnitGroups = dtb_u_u690; f_IrUnit_irUnitHasListFamily = dtb_u_u691; f_IrUnit_irUnitTypeRefs = dtb_u_u692; f_IrUnit_irUnitEntry = dtb_u_u693 } -> dtb_u_u690
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Ir/Model.vuna"
let v_irUnitHasListFamily = (fun (dtb_u_u694 : t_IrUnit) -> (match dtb_u_u694 with
  | { f_IrUnit_irUnitTyDecls = dtb_u_u695; f_IrUnit_irUnitGroups = dtb_u_u696; f_IrUnit_irUnitHasListFamily = dtb_u_u697; f_IrUnit_irUnitTypeRefs = dtb_u_u698; f_IrUnit_irUnitEntry = dtb_u_u699 } -> dtb_u_u697
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Ir/Model.vuna"
let v_irUnitTypeRefs = (fun (dtb_u_u700 : t_IrUnit) -> (match dtb_u_u700 with
  | { f_IrUnit_irUnitTyDecls = dtb_u_u701; f_IrUnit_irUnitGroups = dtb_u_u702; f_IrUnit_irUnitHasListFamily = dtb_u_u703; f_IrUnit_irUnitTypeRefs = dtb_u_u704; f_IrUnit_irUnitEntry = dtb_u_u705 } -> dtb_u_u704
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Ir/Model.vuna"
let v_irUnitEntry = (fun (dtb_u_u706 : t_IrUnit) -> (match dtb_u_u706 with
  | { f_IrUnit_irUnitTyDecls = dtb_u_u707; f_IrUnit_irUnitGroups = dtb_u_u708; f_IrUnit_irUnitHasListFamily = dtb_u_u709; f_IrUnit_irUnitTypeRefs = dtb_u_u710; f_IrUnit_irUnitEntry = dtb_u_u711 } -> dtb_u_u711
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Ir/Model.vuna"
let v_irProgShared = (fun (dtb_u_u712 : t_IrProgram) -> (match dtb_u_u712 with
  | { f_IrProgram_irProgShared = dtb_u_u713; f_IrProgram_irProgUnit = dtb_u_u714 } -> dtb_u_u713
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Ir/Model.vuna"
let v_irProgUnit = (fun (dtb_u_u715 : t_IrProgram) -> (match dtb_u_u715 with
  | { f_IrProgram_irProgShared = dtb_u_u716; f_IrProgram_irProgUnit = dtb_u_u717 } -> dtb_u_u717
  | _ -> failwith "DT: impossible branch"
))
