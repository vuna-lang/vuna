open Vuna_runtime
# 58 "Vuna/Ir/Validate.vuna"
let rec v_firstMissingDep = (fun (dtb_u_u1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u3 : string) (dtb_u_u4 : string B_dData_dList.t_List) -> (match dtb_u_u4 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u5, dtb_u_u6) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u5) dtb_u_u1) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u5) dtb_u_u2) then ((((v_firstMissingDep dtb_u_u1) dtb_u_u2) dtb_u_u3) dtb_u_u6) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u3; B_dData_dPair.f_Pair_second = dtb_u_u5 }))) else ((((v_firstMissingDep dtb_u_u1) dtb_u_u2) dtb_u_u3) dtb_u_u6))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Ir/Validate.vuna"
let rec v_firstUnorderedDepGo = (fun (dtb_u_u7 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u8 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u9 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match dtb_u_u9 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u10, dtb_u_u11) -> (match ((((v_firstMissingDep dtb_u_u7) dtb_u_u8) (Vuna_dIr_dModel.v_irDefName dtb_u_u10)) (Vuna_dIr_dModel.v_irDefDeps dtb_u_u10)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u12) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u12))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_firstUnorderedDepGo dtb_u_u7) dtb_u_u8) dtb_u_u11)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Ir/Validate.vuna"
let v_firstUnorderedDep = (fun (dtb_u_u13 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u14 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u15 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (((v_firstUnorderedDepGo dtb_u_u13) dtb_u_u14) dtb_u_u15))

# 36 "Vuna/Ir/Validate.vuna"
let rec v_checkGroupOrderGo = (fun (dtb_u_u16 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (dtb_u_u17 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u18 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u16 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u19, dtb_u_u20) -> (let dtb_u_u21 = (Vuna_dIr_dModel.v_irGroupDefs dtb_u_u19) in (let dtb_u_u22 = (((B_dData_dList.v_foldl (fun (dtb_u_u24 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u25 : Vuna_dIr_dModel.t_IrDef) -> (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (Vuna_dIr_dModel.v_irDefName dtb_u_u25)) true) dtb_u_u24))) dtb_u_u17) dtb_u_u21) in (match (((v_firstUnorderedDep dtb_u_u18) dtb_u_u22) dtb_u_u21) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkGroupOrderGo dtb_u_u20) dtb_u_u22) dtb_u_u18)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u23) -> (Base_dDiag.v_icInternal (String.concat "" ["IR group order is inconsistent: `"; (B_dData_dPair.v_secondOf dtb_u_u23); "` referenced before it is defined (group of `"; (B_dData_dPair.v_firstOf dtb_u_u23); "`)"]))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Ir/Validate.vuna"
let v_checkGroupOrder = (fun (dtb_u_u26 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) (dtb_u_u27 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (((v_checkGroupOrderGo dtb_u_u26) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) dtb_u_u27))

# 71 "Vuna/Ir/Validate.vuna"
let rec v_checkSymbolRefs = (fun (dtb_u_u28 : (string, int B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u28 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> (match (Vuna_dIr_dRuntime.v_irRtLookup (B_dData_dPair.v_firstOf dtb_u_u29)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["IR references an undeclared runtime symbol: `"; (B_dData_dPair.v_firstOf dtb_u_u29); "`"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u31) -> (match (B_dData_dPair.v_secondOf dtb_u_u29) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkSymbolRefs dtb_u_u30)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u32) -> (if (if (dtb_u_u32 > 0) then ((Vuna_dIr_dModel.v_irInlineArity (B_dData_dPair.v_firstOf dtb_u_u29)) = dtb_u_u32) else false) then (v_checkSymbolRefs dtb_u_u30) else (Base_dDiag.v_icInternal (String.concat "" ["IR saturated runtime symbol `"; (B_dData_dPair.v_firstOf dtb_u_u29); "` has the wrong arity ("; (string_of_int dtb_u_u32); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Ir/Validate.vuna"
let rec v_irTyArrowArity = (fun (dtb_u_u33 : Vuna_dIr_dModel.t_IrTy) -> (match dtb_u_u33 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u34, dtb_u_u35) -> (1 + (v_irTyArrowArity dtb_u_u35))
  | _ -> 0
))

# 122 "Vuna/Ir/Validate.vuna"
let v_checkDefArityVsSig = (fun (dtb_u_u36 : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefExtern dtb_u_u36) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u37) -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Vuna_dIr_dModel.v_irDefTy dtb_u_u36) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u38) -> (let dtb_u_u39 = (v_irTyArrowArity dtb_u_u38) in (if (if ((Vuna_dIr_dModel.v_irDefArity dtb_u_u36) = 0) then true else (dtb_u_u39 = 0)) then (Base_dDiag.C_Check_OkC (0)) else (if ((Vuna_dIr_dModel.v_irDefArity dtb_u_u36) <= dtb_u_u39) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["definition `"; (Vuna_dIr_dModel.v_irDefName dtb_u_u36); "` has "; (string_of_int (Vuna_dIr_dModel.v_irDefArity dtb_u_u36)); " runtime parameters but its signature has "; (string_of_int dtb_u_u39)])))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Ir/Validate.vuna"
let rec v_countKeptFlags = (fun (dtb_u_u40 : bool B_dData_dList.t_List) -> (match dtb_u_u40 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u41, dtb_u_u42) -> (if dtb_u_u41 then (1 + (v_countKeptFlags dtb_u_u42)) else (v_countKeptFlags dtb_u_u42))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Ir/Validate.vuna"
let v_checkCtorArity = (fun (dtb_u_u43 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u44 : string) (dtb_u_u45 : string) (dtb_u_u46 : int) -> (let dtb_u_u47 = ((Vuna_dIr_dModel.v_irSharedCtorShapeOf dtb_u_u45) (dtb_u_u43).Vuna_dIr_dModel.f_IrShared_irSharedCtorShapes) in (match dtb_u_u47 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u48) -> (match dtb_u_u48 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u49; B_dData_dPair.f_Pair_second = dtb_u_u50 } -> (if (dtb_u_u49 = dtb_u_u44) then (let dtb_u_u51 = (v_countKeptFlags dtb_u_u50) in (if (dtb_u_u46 = dtb_u_u51) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["constructor `"; dtb_u_u45; "` has "; (string_of_int dtb_u_u46); " runtime arguments, expected "; (string_of_int dtb_u_u51)])))) else (Base_dDiag.v_icInternal (String.concat "" ["constructor `"; dtb_u_u45; "` belongs to family `"; dtb_u_u49; "`, not `"; dtb_u_u44; "`"])))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["IR references an undeclared constructor: `"; dtb_u_u45; "`"]))
  | _ -> failwith "DT: impossible branch"
)))

# 242 "Vuna/Ir/Validate.vuna"
let rec v_anyErasedBinder = (fun (dtb_u_u52 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u52 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u53, dtb_u_u54) -> (if (dtb_u_u53).Vuna_dIr_dModel.f_IrBinder_irBinderErased then true else (v_anyErasedBinder dtb_u_u54))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Ir/Validate.vuna"
let rec v_memBinderId = (fun (dtb_u_u55 : int) (dtb_u_u56 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u56 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u57, dtb_u_u58) -> (if (dtb_u_u57).Vuna_dIr_dModel.f_IrBinder_irBinderErased then ((v_memBinderId dtb_u_u55) dtb_u_u58) else (if ((dtb_u_u57).Vuna_dIr_dModel.f_IrBinder_irBinderId = dtb_u_u55) then true else ((v_memBinderId dtb_u_u55) dtb_u_u58)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderIds = (fun (dtb_u_u59 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u59 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u60, dtb_u_u61) -> (if (dtb_u_u60).Vuna_dIr_dModel.f_IrBinder_irBinderErased then (v_checkBinderIds dtb_u_u61) else (if ((dtb_u_u60).Vuna_dIr_dModel.f_IrBinder_irBinderId = 0) then (Base_dDiag.v_icInternal "runtime binder has no stable id") else (if ((v_memBinderId (dtb_u_u60).Vuna_dIr_dModel.f_IrBinder_irBinderId) dtb_u_u61) then (Base_dDiag.v_icInternal "duplicate binder id in the same telescope") else (v_checkBinderIds dtb_u_u61))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Ir/Validate.vuna"
let rec v_tyDeclArityOf = (fun (dtb_u_u62 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u63 : string) -> (match dtb_u_u62 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (match dtb_u_u64 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb_u_u66, dtb_u_u67, dtb_u_u68) -> (if (dtb_u_u66 = dtb_u_u63) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u67)) else ((v_tyDeclArityOf dtb_u_u65) dtb_u_u63))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb_u_u69, dtb_u_u70, dtb_u_u71, dtb_u_u72) -> (if (dtb_u_u69 = dtb_u_u63) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u70)) else ((v_tyDeclArityOf dtb_u_u65) dtb_u_u63))
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb_u_u73, dtb_u_u74, dtb_u_u75) -> (if (dtb_u_u73 = dtb_u_u63) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u74)) else ((v_tyDeclArityOf dtb_u_u65) dtb_u_u63))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Ir/Validate.vuna"
let rec v_listLength = (fun dtb_u_u77 -> (match dtb_u_u77 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u79) -> (1 + (v_listLength dtb_u_u79))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Ir/Validate.vuna"
let rec v_checkTyArityIn = (fun (dtb_u_u80 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u81 : int B_dData_dMaybe.t_Maybe) (dtb_u_u82 : Vuna_dIr_dModel.t_IrTy) -> (match dtb_u_u82 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u83, dtb_u_u84) -> (match ((v_tyDeclArityOf dtb_u_u80) dtb_u_u83) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u85) -> (if ((v_listLength dtb_u_u84) = dtb_u_u85) then (((v_checkTyArityListIn dtb_u_u80) dtb_u_u81) dtb_u_u84) else (Base_dDiag.v_icInternal (String.concat "" ["binder type annotation has the wrong type argument count for `"; dtb_u_u83; "` (expected "; (string_of_int dtb_u_u85); ", got "; (string_of_int (v_listLength dtb_u_u84)); ")"])))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkTyArityListIn dtb_u_u80) dtb_u_u81) dtb_u_u84)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u86, dtb_u_u87) -> ((Base_dCommon.v_bind (((v_checkTyArityIn dtb_u_u80) dtb_u_u81) dtb_u_u86)) (fun (dtb_u_u88 : int) -> (((v_checkTyArityIn dtb_u_u80) dtb_u_u81) dtb_u_u87)))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb_u_u89) -> (((v_checkTyArityIn dtb_u_u80) dtb_u_u81) dtb_u_u89)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb_u_u90) -> (((v_checkTyArityIn dtb_u_u80) dtb_u_u81) dtb_u_u90)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> (Base_dDiag.C_Check_OkC (0))
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb_u_u91) -> (if (dtb_u_u91 < 0) then (Base_dDiag.v_icInternal "negative runtime type parameter slot") else (match dtb_u_u81 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u92) -> (if (dtb_u_u91 < dtb_u_u92) then (Base_dDiag.C_Check_OkC (0)) else (Base_dDiag.v_icInternal (String.concat "" ["runtime type parameter slot "; (string_of_int dtb_u_u91); " is out of range (declaration has "; (string_of_int dtb_u_u92); " type parameters)"])))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
# 326 "Vuna/Ir/Validate.vuna"
and v_checkTyArityListIn = (fun (dtb_u_u93 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u94 : int B_dData_dMaybe.t_Maybe) (dtb_u_u95 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (match dtb_u_u95 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u96, dtb_u_u97) -> ((Base_dCommon.v_bind (((v_checkTyArityIn dtb_u_u93) dtb_u_u94) dtb_u_u96)) (fun (dtb_u_u98 : int) -> (((v_checkTyArityListIn dtb_u_u93) dtb_u_u94) dtb_u_u97)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Ir/Validate.vuna"
let v_checkTyArity = (fun (dtb_u_u99 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u100 : Vuna_dIr_dModel.t_IrTy) -> (((v_checkTyArityIn dtb_u_u99) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u100))

# 144 "Vuna/Ir/Validate.vuna"
let v_checkDefTy = (fun (dtb_u_u101 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u102 : string) (dtb_u_u103 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match dtb_u_u103 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u104) -> (match ((v_checkTyArity dtb_u_u101) dtb_u_u104) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u105) -> (Base_dDiag.v_icInternal (String.concat "" ["definition `"; dtb_u_u102; "` has an invalid runtime signature"]))
  | Base_dDiag.C_Check_OkC (dtb_u_u106) -> (Base_dDiag.C_Check_OkC (dtb_u_u106))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Ir/Validate.vuna"
let v_checkAppTy = (fun (dtb_u_u107 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u108 : (Vuna_dIr_dModel.t_IrTy, Vuna_dIr_dModel.t_IrTy) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u108 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u109) -> ((Base_dCommon.v_bind ((v_checkTyArity dtb_u_u107) (B_dData_dPair.v_firstOf dtb_u_u109))) (fun (dtb_u_u110 : int) -> ((v_checkTyArity dtb_u_u107) (B_dData_dPair.v_secondOf dtb_u_u109))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "IR application has an empty runtime type slot")
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Ir/Validate.vuna"
let v_checkIrTyM = (fun (dtb_u_u111 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u112 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match dtb_u_u112 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u113) -> ((v_checkTyArity dtb_u_u111) dtb_u_u113)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Ir/Validate.vuna"
let v_checkNodeTy = (fun (dtb_u_u114 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u115 : string) (dtb_u_u116 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match dtb_u_u116 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u117) -> ((v_checkTyArity dtb_u_u114) dtb_u_u117)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["IR node `"; dtb_u_u115; "` has an empty runtime type slot"]))
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderTysList = (fun (dtb_u_u118 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u119 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u119 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u120, dtb_u_u121) -> (if (dtb_u_u120).Vuna_dIr_dModel.f_IrBinder_irBinderErased then (match (dtb_u_u120).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkBinderTysList dtb_u_u118) dtb_u_u121)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u122) -> (Base_dDiag.v_icInternal "erased binder carries a runtime type annotation")
  | _ -> failwith "DT: impossible branch"
) else (match (dtb_u_u120).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkBinderTysList dtb_u_u118) dtb_u_u121)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u123) -> ((Base_dCommon.v_bind ((v_checkTyArity dtb_u_u118) dtb_u_u123)) (fun (dtb_u_u124 : int) -> ((v_checkBinderTysList dtb_u_u118) dtb_u_u121)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Ir/Validate.vuna"
let v_checkBinderTysOf = (fun (dtb_u_u125 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u126 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_checkBinderIds dtb_u_u126)) (fun (dtb_u_u127 : int) -> ((v_checkBinderTysList dtb_u_u125) dtb_u_u126))))

# 280 "Vuna/Ir/Validate.vuna"
let rec v_checkAltBinderTys = (fun (dtb_u_u128 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u129 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match dtb_u_u129 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u130, dtb_u_u131) -> ((Base_dCommon.v_bind ((v_checkBinderTysOf dtb_u_u128) (Vuna_dIr_dModel.v_irAltBindersOf dtb_u_u130))) (fun (dtb_u_u132 : int) -> ((v_checkAltBinderTys dtb_u_u128) dtb_u_u131)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Ir/Validate.vuna"
let v_checkAltBinderTysM = (fun (dtb_u_u133 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u134 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u134 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u135) -> ((v_checkBinderTysOf dtb_u_u133) (Vuna_dIr_dModel.v_irAltBindersOf dtb_u_u135))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Ir/Validate.vuna"
let v_checkTyArityList = (fun (dtb_u_u136 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u137 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) -> (((v_checkTyArityListIn dtb_u_u136) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u137))

# 210 "Vuna/Ir/Validate.vuna"
let v_checkTyArityListM = (fun (dtb_u_u138 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u139 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match dtb_u_u139 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u140) -> ((v_checkTyArityList dtb_u_u138) dtb_u_u140)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Ir/Validate.vuna"
let v_checkCtorTys = (fun (dtb_u_u141 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u142 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u143 : string) (dtb_u_u144 : string) (dtb_u_u145 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (dtb_u_u146 : int) -> ((Base_dCommon.v_bind ((v_checkTyArityListM dtb_u_u142) dtb_u_u145)) (fun (dtb_u_u147 : int) -> (let dtb_u_u148 = (match ((v_tyDeclArityOf dtb_u_u142) dtb_u_u143) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u149) -> (match dtb_u_u145 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u150) -> ((v_listLength dtb_u_u150) = dtb_u_u149)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) in (if dtb_u_u148 then ((((v_checkCtorArity dtb_u_u141) dtb_u_u143) dtb_u_u144) dtb_u_u146) else (Base_dDiag.v_icInternal (String.concat "" ["constructor application has the wrong runtime type argument count for `"; dtb_u_u143; "`"])))))))

# 160 "Vuna/Ir/Validate.vuna"
let rec v_checkNodeBinderTys = (fun (dtb_u_u151 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u152 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u153 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u153 with
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u154) -> (((v_checkNodeBinderTys dtb_u_u151) dtb_u_u152) dtb_u_u154)
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u155, dtb_u_u156, dtb_u_u157) -> ((Base_dCommon.v_bind ((v_checkIrTyM dtb_u_u152) dtb_u_u155)) (fun (dtb_u_u158 : int) -> ((v_checkIrTyM dtb_u_u152) dtb_u_u156)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u159, dtb_u_u160, dtb_u_u161, dtb_u_u162, dtb_u_u163) -> ((Base_dCommon.v_bind ((v_checkAltBinderTysM dtb_u_u152) dtb_u_u161)) (fun (dtb_u_u164 : int) -> ((Base_dCommon.v_bind ((v_checkAltBinderTysM dtb_u_u152) dtb_u_u162)) (fun (dtb_u_u165 : int) -> ((v_checkAltBinderTysM dtb_u_u152) dtb_u_u163)))))
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u166, dtb_u_u167, dtb_u_u168, dtb_u_u169) -> (((v_checkNodeTy dtb_u_u152) "update") dtb_u_u169)
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u170, dtb_u_u171, dtb_u_u172, dtb_u_u173) -> (((v_checkNodeTy dtb_u_u152) "projection") dtb_u_u173)
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u174, dtb_u_u175, dtb_u_u176) -> (((v_checkNodeTy dtb_u_u152) "record") dtb_u_u175)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u177, dtb_u_u178, dtb_u_u179, dtb_u_u180) -> ((((((v_checkCtorTys dtb_u_u151) dtb_u_u152) dtb_u_u177) dtb_u_u178) dtb_u_u179) (v_listLength dtb_u_u180))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u181, dtb_u_u182, dtb_u_u183) -> ((v_checkAppTy dtb_u_u152) dtb_u_u181)
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u184, dtb_u_u185, dtb_u_u186, dtb_u_u187) -> ((Base_dCommon.v_bind (((v_checkNodeTy dtb_u_u152) "case scrutinee") dtb_u_u184)) (fun (dtb_u_u188 : int) -> ((Base_dCommon.v_bind (((v_checkNodeTy dtb_u_u152) "case") dtb_u_u185)) (fun (dtb_u_u189 : int) -> ((v_checkAltBinderTys dtb_u_u152) dtb_u_u187)))))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u190, dtb_u_u191, dtb_u_u192) -> ((v_checkBinderTysOf dtb_u_u152) dtb_u_u190)
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u193, dtb_u_u194, dtb_u_u195) -> (if (v_anyErasedBinder dtb_u_u193) then (Base_dDiag.v_icInternal "IR lambda carries an erased binder placeholder") else ((Base_dCommon.v_bind ((v_checkBinderTysOf dtb_u_u152) dtb_u_u193)) (fun (dtb_u_u196 : int) -> (((v_checkNodeTy dtb_u_u152) "lambda") dtb_u_u194))))
  | _ -> (Base_dDiag.C_Check_OkC (0))
))

# 151 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderTysWork = (fun (dtb_u_u197 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u198 : int) (dtb_u_u199 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u200 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (if (dtb_u_u198 <= 0) then (Base_dDiag.v_icFuel "ir-binder-ty") else (match dtb_u_u200 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u201, dtb_u_u202) -> ((Base_dCommon.v_bind (((v_checkNodeBinderTys dtb_u_u197) dtb_u_u199) dtb_u_u201)) (fun (dtb_u_u203 : int) -> ((((v_checkBinderTysWork dtb_u_u197) (dtb_u_u198 - 1)) dtb_u_u199) ((B_dData_dList.v_append (Vuna_dIr_dModel.v_irChildren dtb_u_u201)) dtb_u_u202))))
  | _ -> failwith "DT: impossible branch"
)))

# 106 "Vuna/Ir/Validate.vuna"
let rec v_checkBinderTys = (fun (dtb_u_u204 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u205 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u206 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match dtb_u_u206 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u207, dtb_u_u208) -> ((Base_dCommon.v_bind (((v_checkDefTy dtb_u_u205) (Vuna_dIr_dModel.v_irDefName dtb_u_u207)) (Vuna_dIr_dModel.v_irDefTy dtb_u_u207))) (fun (dtb_u_u209 : int) -> ((Base_dCommon.v_bind (v_checkDefArityVsSig dtb_u_u207)) (fun (dtb_u_u210 : int) -> (match (Vuna_dIr_dModel.v_irDefBody dtb_u_u207) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_checkBinderTys dtb_u_u204) dtb_u_u205) dtb_u_u208)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u211) -> ((Base_dCommon.v_bind ((((v_checkBinderTysWork dtb_u_u204) ((8 * (Vuna_dIr_dModel.v_irSize dtb_u_u211)) + 64)) dtb_u_u205) (B_dData_dList.C_List__x58__x58_ (dtb_u_u211, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u212 : int) -> (((v_checkBinderTys dtb_u_u204) dtb_u_u205) dtb_u_u208)))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Ir/Validate.vuna"
let rec v_checkDeclCtorSlots = (fun (dtb_u_u213 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u214 : string) (dtb_u_u215 : int) (dtb_u_u216 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u216 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u217, dtb_u_u218) -> (match dtb_u_u217 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u219; B_dData_dPair.f_Pair_second = dtb_u_u220 } -> ((Base_dCommon.v_bind (((v_checkTyArityListIn dtb_u_u213) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u215))) dtb_u_u220)) (fun (dtb_u_u221 : int) -> ((((v_checkDeclCtorSlots dtb_u_u213) dtb_u_u214) dtb_u_u215) dtb_u_u218)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Ir/Validate.vuna"
let v_checkDeclSlots = (fun (dtb_u_u222 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u223 : Vuna_dIr_dModel.t_IrTyDecl) -> (match dtb_u_u223 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb_u_u224, dtb_u_u225, dtb_u_u226) -> (((v_checkTyArityIn dtb_u_u222) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u225))) dtb_u_u226)
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb_u_u227, dtb_u_u228, dtb_u_u229, dtb_u_u230) -> (((v_checkTyArityListIn dtb_u_u222) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u228))) dtb_u_u230)
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb_u_u231, dtb_u_u232, dtb_u_u233) -> ((((v_checkDeclCtorSlots dtb_u_u222) dtb_u_u231) dtb_u_u232) dtb_u_u233)
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Ir/Validate.vuna"
let rec v_validateTyDeclsGo = (fun (dtb_u_u234 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) (dtb_u_u235 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (match dtb_u_u235 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u236, dtb_u_u237) -> ((Base_dCommon.v_bind ((v_checkDeclSlots dtb_u_u234) dtb_u_u236)) (fun (dtb_u_u238 : int) -> ((v_validateTyDeclsGo dtb_u_u234) dtb_u_u237)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Ir/Validate.vuna"
let v_validateTyDecls = (fun (dtb_u_u239 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_validateTyDeclsGo dtb_u_u239) dtb_u_u239))

# 398 "Vuna/Ir/Validate.vuna"
let v_scopedFuelOf = (fun (dtb_u_u240 : Vuna_dIr_dModel.t_Ir) -> ((8 * (Vuna_dIr_dModel.v_irSize dtb_u_u240)) + 64))

# 443 "Vuna/Ir/Validate.vuna"
let v_maybeAlts = (fun (dtb_u_u241 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (match dtb_u_u241 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u242) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u242, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Ir/Validate.vuna"
let[@tail_mod_cons] rec v_altWork = (fun (dtb_u_u243 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u244 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match dtb_u_u244 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u245, dtb_u_u246) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append (Vuna_dIr_dModel.v_irAltBindersOf dtb_u_u245)) dtb_u_u243); B_dData_dPair.f_Pair_second = (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u245) }, ((v_altWork dtb_u_u243) dtb_u_u246)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Ir/Validate.vuna"
let v_scopedChildren = (fun (dtb_u_u247 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u248 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u248 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u249, dtb_u_u250, dtb_u_u251) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u252) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u253) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u254) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u255) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u256) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u257) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u258) -> B_dData_dList.C_List_Nil
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u259) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u259 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u260, dtb_u_u261, dtb_u_u262, dtb_u_u263, dtb_u_u264) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u264 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u265) -> ((B_dData_dList.v_map (fun (dtb_u_u266 : Vuna_dIr_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u266 })) dtb_u_u265)
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u267, dtb_u_u268, dtb_u_u269, dtb_u_u270, dtb_u_u271) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u267 }, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append ((v_altWork dtb_u_u247) (v_maybeAlts dtb_u_u269))) ((B_dData_dList.v_append ((v_altWork dtb_u_u247) (v_maybeAlts dtb_u_u270))) ((v_altWork dtb_u_u247) (v_maybeAlts dtb_u_u271)))))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u272, dtb_u_u273, dtb_u_u274, dtb_u_u275) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u274 }, ((v_altWork dtb_u_u247) dtb_u_u275)))
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u276, dtb_u_u277, dtb_u_u278) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u276 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u277 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u278 }, B_dData_dList.C_List_Nil))))))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u279, dtb_u_u280, dtb_u_u281) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u280 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u281 }, B_dData_dList.C_List_Nil))))
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u282, dtb_u_u283, dtb_u_u284) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb_u_u282) dtb_u_u247); B_dData_dPair.f_Pair_second = dtb_u_u284 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u285, dtb_u_u286, dtb_u_u287) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u286 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb_u_u285) dtb_u_u247); B_dData_dPair.f_Pair_second = dtb_u_u287 }, B_dData_dList.C_List_Nil))))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u288, dtb_u_u289, dtb_u_u290) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u290 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u291, dtb_u_u292) -> ((B_dData_dList.v_map (fun (dtb_u_u293 : Vuna_dIr_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u293 })) dtb_u_u292)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u294, dtb_u_u295, dtb_u_u296, dtb_u_u297) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u294 }, ((B_dData_dList.v_map (fun (dtb_u_u298 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u298) })) dtb_u_u296)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u299, dtb_u_u300, dtb_u_u301, dtb_u_u302) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u299 }, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u303, dtb_u_u304, dtb_u_u305) -> ((B_dData_dList.v_map (fun (dtb_u_u306 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u306) })) dtb_u_u305)
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u307, dtb_u_u308, dtb_u_u309, dtb_u_u310) -> ((B_dData_dList.v_map (fun (dtb_u_u311 : Vuna_dIr_dModel.t_Ir) -> { B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u311 })) dtb_u_u310)
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Ir/Validate.vuna"
let v_sameBinder = Vuna_dIr_dModel.v_sameBinderId

# 452 "Vuna/Ir/Validate.vuna"
let rec v_memBinder = (fun (dtb_u_u312 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u313 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u313 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u314, dtb_u_u315) -> (if ((v_sameBinder dtb_u_u312) dtb_u_u314) then true else ((v_memBinder dtb_u_u312) dtb_u_u315))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Ir/Validate.vuna"
let rec v_checkScopedWork = (fun (dtb_u_u316 : int) (dtb_u_u317 : (Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u316 <= 0) then (Base_dDiag.v_icFuel "ir-scope") else (let dtb_u_u318 = dtb_u_u317 in (match dtb_u_u318 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u319, dtb_u_u320) -> (match dtb_u_u319 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u321; B_dData_dPair.f_Pair_second = dtb_u_u322 } -> (match dtb_u_u322 with
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u323) -> (if (dtb_u_u323).Vuna_dIr_dModel.f_IrBinder_irBinderErased then (Base_dDiag.v_icInternal "erased binder reached runtime IR") else (if ((v_memBinder dtb_u_u323) dtb_u_u321) then ((v_checkScopedWork (dtb_u_u316 - 1)) dtb_u_u320) else (Base_dDiag.v_icInternal "IR variable references a binder outside its scope")))
  | _ -> ((v_checkScopedWork (dtb_u_u316 - 1)) ((B_dData_dList.v_append ((v_scopedChildren dtb_u_u321) dtb_u_u322)) dtb_u_u320))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))))

# 388 "Vuna/Ir/Validate.vuna"
let rec v_checkScopedDefs = (fun (dtb_u_u324 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match dtb_u_u324 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u325, dtb_u_u326) -> (match (Vuna_dIr_dModel.v_irDefBody dtb_u_u325) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_checkScopedDefs dtb_u_u326)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u327) -> ((Base_dCommon.v_bind ((v_checkScopedWork ((v_scopedFuelOf dtb_u_u327) + 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u327 }, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u328 : int) -> (v_checkScopedDefs dtb_u_u326)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Ir/Validate.vuna"
let v_checkScopedUnit = (fun (dtb_u_u329 : Vuna_dIr_dModel.t_IrUnit) -> (v_checkScopedDefs ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (dtb_u_u329).Vuna_dIr_dModel.f_IrUnit_irUnitGroups)))

# 23 "Vuna/Ir/Validate.vuna"
let v_validateUnit = (fun (dtb_u_u330 : Vuna_dIr_dModel.t_IrShared) (dtb_u_u331 : Vuna_dIr_dModel.t_IrUnit) -> (let dtb_u_u332 = ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (dtb_u_u331).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) in (let dtb_u_u333 = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map Vuna_dIr_dModel.v_irDefName) dtb_u_u332)) in ((Base_dCommon.v_bind (Vuna_dIr_dAnalysis.v_checkUniqueDefNames dtb_u_u332)) (fun (dtb_u_u334 : int) -> ((Base_dCommon.v_bind ((v_checkGroupOrder (dtb_u_u331).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) dtb_u_u333)) (fun (dtb_u_u335 : int) -> ((Base_dCommon.v_bind (v_checkSymbolRefs (Vuna_dIr_dRuntime.v_irSymbolsOfUnit dtb_u_u331))) (fun (dtb_u_u336 : int) -> ((Base_dCommon.v_bind (v_checkScopedUnit dtb_u_u331)) (fun (dtb_u_u337 : int) -> ((Base_dCommon.v_bind (v_validateTyDecls (dtb_u_u331).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls)) (fun (dtb_u_u338 : int) -> (((v_checkBinderTys dtb_u_u330) (dtb_u_u331).Vuna_dIr_dModel.f_IrUnit_irUnitTyDecls) dtb_u_u332))))))))))))))

# 87 "Vuna/Ir/Validate.vuna"
let v_validateProgram = (fun (dtb_u_u339 : Vuna_dIr_dModel.t_IrProgram) -> (let dtb_u_u340 = (dtb_u_u339).Vuna_dIr_dModel.f_IrProgram_irProgUnit in (let dtb_u_u341 = (dtb_u_u339).Vuna_dIr_dModel.f_IrProgram_irProgShared in (let dtb_u_u342 = ((B_dData_dList.v_concatMap Vuna_dIr_dModel.v_irGroupDefs) (dtb_u_u340).Vuna_dIr_dModel.f_IrUnit_irUnitGroups) in (match (dtb_u_u340).Vuna_dIr_dModel.f_IrUnit_irUnitEntry with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_validateUnit dtb_u_u341) dtb_u_u340)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u343) -> (if ((B_dData_dList.v_memName (dtb_u_u343).Vuna_dIr_dModel.f_IrEntry_irEntryMain) ((B_dData_dList.v_map Vuna_dIr_dModel.v_irDefName) dtb_u_u342)) then ((v_validateUnit dtb_u_u341) dtb_u_u340) else (Base_dDiag.v_icInternal (String.concat "" ["IR entry references an undefined main: `"; (dtb_u_u343).Vuna_dIr_dModel.f_IrEntry_irEntryMain; "`"])))
  | _ -> failwith "DT: impossible branch"
)))))

# 382 "Vuna/Ir/Validate.vuna"
let v_validateScopedDefs = (fun (dtb_u_u344 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Vuna_dIr_dAnalysis.v_checkUniqueDefNames dtb_u_u344)) (fun (dtb_u_u345 : int) -> (v_checkScopedDefs dtb_u_u344))))
