open Vuna_runtime
# 46 "Vuna/Compiler/Lowering/Ty.vuna"
let v_reprTyIr = (fun (dtb_u_u1 : string) -> (if (dtb_u_u1 = Base_dIntrinsics.v_intTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt)) else (if (dtb_u_u1 = Base_dIntrinsics.v_strTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyStr)) else (if (dtb_u_u1 = Base_dIntrinsics.v_floatTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyFloat)) else (let dtb_u_u2 = (Base_dIntrinsics.v_canonicalReprOf dtb_u_u1) in (match dtb_u_u2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u3) -> (match dtb_u_u3 with
  | Base_dIntrinsics.C_FamilyRepr_FamReprBool -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyBool))
  | Base_dIntrinsics.C_FamilyRepr_FamReprNat -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))))

# 78 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderTyIntrinsicWith = (fun (dtb_u_u4 : (Core_dTerm.t_Value) -> Vuna_dIr_dModel.t_IrTy) (dtb_u_u5 : string) (dtb_u_u6 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u5 = Base_dIntrinsics.v_arrayTypeName) then (let dtb_u_u7 = dtb_u_u6 in (match dtb_u_u7 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u8, dtb_u_u9) -> (match dtb_u_u9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray ((dtb_u_u4 dtb_u_u8)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (dtb_u_u5 = Base_dIntrinsics.v_cellTypeName) then (let dtb_u_u10 = dtb_u_u6 in (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u11, dtb_u_u12) -> (match dtb_u_u12 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef ((dtb_u_u4 dtb_u_u11)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (dtb_u_u5 = Base_dIntrinsics.v_marrayTypeName) then (let dtb_u_u13 = dtb_u_u6 in (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (match dtb_u_u15 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray ((dtb_u_u4 dtb_u_u14)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (dtb_u_u5 = Base_dIntrinsics.v_mdynArrayTypeName) then (let dtb_u_u16 = dtb_u_u6 in (match dtb_u_u16 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u17, dtb_u_u18) -> (match dtb_u_u18 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (dtb_u_u5 = Base_dIntrinsics.v_mbufferTypeName) then (match dtb_u_u6 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u5 = Base_dIntrinsics.v_threadTypeName) then (let dtb_u_u19 = dtb_u_u6 in (match dtb_u_u19 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21) -> (match dtb_u_u21 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (dtb_u_u5 = Base_dIntrinsics.v_mutexTypeName) then (match dtb_u_u6 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u5 = Base_dIntrinsics.v_condvarTypeName) then (match dtb_u_u6 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u5 = Base_dIntrinsics.v_atomicTypeName) then (match dtb_u_u6 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing))))))))))

# 29 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderTyFuel = (fun (dtb_u_u22 : int) (dtb_u_u23 : int B_dData_dList.t_List) (dtb_u_u24 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u25 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u26 : Core_dTerm.t_Value) -> (if (dtb_u_u22 <= 0) then Vuna_dIr_dModel.C_IrTy_IrTyOpaque else (match dtb_u_u26 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u27) -> (match dtb_u_u27 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u28, dtb_u_u29, dtb_u_u30) -> (match ((Lowering_dEnv.v_levelSlotIn dtb_u_u23) dtb_u_u29) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u31) -> (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb_u_u31))
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u32, dtb_u_u33) -> ((((((v_renderTyGlobal dtb_u_u22) dtb_u_u23) dtb_u_u24) dtb_u_u25) dtb_u_u32) dtb_u_u33)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
)))
# 60 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderTyGlobal = (fun (dtb_u_u34 : int) (dtb_u_u35 : int B_dData_dList.t_List) (dtb_u_u36 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u37 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u38 : string) (dtb_u_u39 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match (((v_renderTyIntrinsicWith (fun (dtb_u_u40 : Core_dTerm.t_Value) -> (((((v_renderTyFuel (dtb_u_u34 - 1)) dtb_u_u35) dtb_u_u36) dtb_u_u37) dtb_u_u40))) dtb_u_u38) dtb_u_u39) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u41) -> dtb_u_u41
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr dtb_u_u38) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u42) -> dtb_u_u42
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u38) dtb_u_u37) then (Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u38, ((((((v_renderFamilyArgs (dtb_u_u34 - 1)) dtb_u_u35) dtb_u_u36) dtb_u_u37) ((Lowering_dEnv.v_lookupTyParamsIn dtb_u_u36) dtb_u_u38)) dtb_u_u39))) else Vuna_dIr_dModel.C_IrTy_IrTyOpaque)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 119 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderFamilyArgs = (fun (dtb_u_u43 : int) (dtb_u_u44 : int B_dData_dList.t_List) (dtb_u_u45 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u46 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u47 : int B_dData_dList.t_List) (dtb_u_u48 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u43 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u47 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u49, dtb_u_u50) -> (match ((Lowering_dEnv.v_nthValueIn dtb_u_u48) dtb_u_u49) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u51) -> (B_dData_dList.C_List__x58__x58_ ((((((v_renderTyFuel (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u46) dtb_u_u51), ((((((v_renderFamilyArgs (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u46) dtb_u_u50) dtb_u_u48)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, ((((((v_renderFamilyArgs (dtb_u_u43 - 1)) dtb_u_u44) dtb_u_u45) dtb_u_u46) dtb_u_u50) dtb_u_u48)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderTyOf = (fun (dtb_u_u52 : int B_dData_dList.t_List) (dtb_u_u53 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u54 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u55 : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) dtb_u_u52) dtb_u_u53) dtb_u_u54) dtb_u_u55))

# 138 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderPiTyFuel = (fun (dtb_u_u56 : int) (dtb_u_u57 : int B_dData_dList.t_List) (dtb_u_u58 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u59 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u60 : int) (dtb_u_u61 : Core_dTerm.t_Value) -> (if (dtb_u_u56 <= 0) then (((((v_renderTyFuel dtb_u_u56) dtb_u_u57) dtb_u_u58) dtb_u_u59) dtb_u_u61) else (match dtb_u_u61 with
  | Core_dTerm.C_Value_VPi (dtb_u_u62, dtb_u_u63, dtb_u_u64, dtb_u_u65, dtb_u_u66) -> (let dtb_u_u67 = ((Core_dEval.v_applyClosure dtb_u_u66) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u62, dtb_u_u60, B_dData_dList.C_List_Nil))))) in (if (Core_dTerm.v_rigIsErased dtb_u_u64) then ((((((v_renderPiTyFuel (dtb_u_u56 - 1)) dtb_u_u57) dtb_u_u58) dtb_u_u59) (dtb_u_u60 + 1)) dtb_u_u67) else (Vuna_dIr_dModel.C_IrTy_IrTyFun (((((((v_renderPiTyFuel (dtb_u_u56 - 1)) dtb_u_u57) dtb_u_u58) dtb_u_u59) dtb_u_u60) dtb_u_u65), ((((((v_renderPiTyFuel (dtb_u_u56 - 1)) dtb_u_u57) dtb_u_u58) dtb_u_u59) (dtb_u_u60 + 1)) dtb_u_u67)))))
  | _ -> (((((v_renderTyFuel dtb_u_u56) dtb_u_u57) dtb_u_u58) dtb_u_u59) dtb_u_u61)
)))

# 135 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderPiTy = (fun (dtb_u_u68 : int B_dData_dList.t_List) (dtb_u_u69 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u70 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u71 : int) (dtb_u_u72 : Core_dTerm.t_Value) -> ((((((v_renderPiTyFuel 256) dtb_u_u68) dtb_u_u69) dtb_u_u70) dtb_u_u71) dtb_u_u72))

# 153 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderFieldTy = (fun (dtb_u_u73 : int B_dData_dList.t_List) (dtb_u_u74 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u75 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u76 : int) (dtb_u_u77 : Core_dTerm.t_Value) (dtb_u_u78 : int) -> (match dtb_u_u77 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u79) -> (match dtb_u_u79 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u80, dtb_u_u81, dtb_u_u82) -> (match ((Lowering_dEnv.v_levelSlotIn dtb_u_u73) dtb_u_u81) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u83) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb_u_u83)); B_dData_dPair.f_Pair_second = dtb_u_u78 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "constructor field type mentions a type variable outside the family's runtime parameter slots")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u84, dtb_u_u85) -> (match (((v_renderTyIntrinsicWith (fun (dtb_u_u86 : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) dtb_u_u73) dtb_u_u74) dtb_u_u75) dtb_u_u86))) dtb_u_u84) dtb_u_u85) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u87) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u87; B_dData_dPair.f_Pair_second = dtb_u_u78 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr dtb_u_u84) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u88) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u88; B_dData_dPair.f_Pair_second = dtb_u_u78 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u84) dtb_u_u75) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u84, ((((((v_renderFamilyArgs 256) dtb_u_u73) dtb_u_u74) dtb_u_u75) ((Lowering_dEnv.v_lookupTyParamsIn dtb_u_u74) dtb_u_u84)) dtb_u_u85))); B_dData_dPair.f_Pair_second = dtb_u_u78 })) else (Base_dDiag.v_icInternal ("constructor field type head is not a known family: " ^ dtb_u_u84)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb_u_u89, dtb_u_u90, dtb_u_u91, dtb_u_u92, dtb_u_u93) -> (if dtb_u_u90 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb_u_u78)); B_dData_dPair.f_Pair_second = (dtb_u_u78 + 1) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((((v_renderPiTy dtb_u_u73) dtb_u_u74) dtb_u_u75) dtb_u_u76) dtb_u_u77); B_dData_dPair.f_Pair_second = dtb_u_u78 })))
  | _ -> (Base_dDiag.v_icInternal "constructor field type has no runtime rendering")
))

# 182 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flagMatchesRigIn = (fun (dtb_u_u94 : bool) (dtb_u_u95 : Core_dTerm.t_Rig) -> (if dtb_u_u94 then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased dtb_u_u95)) else (Core_dTerm.v_rigIsErased dtb_u_u95)))

# 187 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_ctorFieldTys = (fun (dtb_u_u96 : int B_dData_dList.t_List) (dtb_u_u97 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u98 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u99 : bool B_dData_dList.t_List) (dtb_u_u100 : bool B_dData_dList.t_List) (dtb_u_u101 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u102 : int) (dtb_u_u103 : Core_dTerm.t_Value) (dtb_u_u104 : int) -> (match dtb_u_u99 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u105, dtb_u_u106) -> (match dtb_u_u100 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u107, dtb_u_u108) -> (match dtb_u_u101 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u109, dtb_u_u110) -> (match dtb_u_u109 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u111; B_dData_dPair.f_Pair_second = dtb_u_u112 } -> (if ((v_flagMatchesRigIn dtb_u_u105) dtb_u_u112) then (match dtb_u_u103 with
  | Core_dTerm.C_Value_VPi (dtb_u_u113, dtb_u_u114, dtb_u_u115, dtb_u_u116, dtb_u_u117) -> (let dtb_u_u118 = ((Core_dEval.v_applyClosure dtb_u_u117) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u113, dtb_u_u102, B_dData_dList.C_List_Nil))))) in (if dtb_u_u105 then (if dtb_u_u107 then ((Base_dCommon.v_bind (((((((((v_ctorFieldTys dtb_u_u96) dtb_u_u97) dtb_u_u98) dtb_u_u106) dtb_u_u108) dtb_u_u110) (dtb_u_u102 + 1)) dtb_u_u118) dtb_u_u104)) (fun (dtb_u_u119 : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match dtb_u_u119 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u120; B_dData_dPair.f_Pair_second = dtb_u_u121 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, dtb_u_u120)); B_dData_dPair.f_Pair_second = dtb_u_u121 }))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((((((v_renderFieldTy dtb_u_u96) dtb_u_u97) dtb_u_u98) dtb_u_u102) dtb_u_u116) dtb_u_u104)) (fun (dtb_u_u122 : (Vuna_dIr_dModel.t_IrTy, int) B_dData_dPair.t_Pair) -> (match dtb_u_u122 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u123; B_dData_dPair.f_Pair_second = dtb_u_u124 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys dtb_u_u96) dtb_u_u97) dtb_u_u98) dtb_u_u106) dtb_u_u108) dtb_u_u110) (dtb_u_u102 + 1)) dtb_u_u118) dtb_u_u124)) (fun (dtb_u_u125 : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match dtb_u_u125 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u126; B_dData_dPair.f_Pair_second = dtb_u_u127 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u123, dtb_u_u126)); B_dData_dPair.f_Pair_second = dtb_u_u127 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) else (((((((((v_ctorFieldTys dtb_u_u96) dtb_u_u97) dtb_u_u98) dtb_u_u106) dtb_u_u108) dtb_u_u110) (dtb_u_u102 + 1)) dtb_u_u118) dtb_u_u104)))
  | _ -> (Base_dDiag.v_icInternal "constructor telescope does not match its type")
) else (Base_dDiag.v_icInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u104 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u101 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u128, dtb_u_u129) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than its shape")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u104 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u100 with
  | B_dData_dList.C_List_Nil -> (match dtb_u_u101 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u130, dtb_u_u131) -> (Base_dDiag.v_icInternal "constructor shape has more binders than its telescope")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u104 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u132, dtb_u_u133) -> (match dtb_u_u101 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u104 }))
  | _ -> (Base_dDiag.v_icInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorArityNeed = (fun (dtb_u_u134 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u135 : int B_dData_dList.t_List) (dtb_u_u136 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u137 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u138 : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys dtb_u_u135) dtb_u_u136) dtb_u_u134) (Elab_dRepresentation.v_ctorKeepFlags dtb_u_u138)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf dtb_u_u137) dtb_u_u138)) (Elab_dTypes.v_dtCtorTelescope dtb_u_u138)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u138))) (Lowering_dEnv.v_listLength dtb_u_u135))) (fun (dtb_u_u139 : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u139) - (Lowering_dEnv.v_listLength dtb_u_u135)))))))

# 238 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_maxIntListIn = (fun (dtb_u_u140 : int B_dData_dList.t_List) -> (match dtb_u_u140 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u141, dtb_u_u142) -> (if (dtb_u_u141 >= (v_maxIntListIn dtb_u_u142)) then dtb_u_u141 else (v_maxIntListIn dtb_u_u142))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Lowering/Ty.vuna"
let v_dataArityNeed = (fun (dtb_u_u143 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u144 : int B_dData_dList.t_List) (dtb_u_u145 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u146 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u147 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((v_ctorArityNeed dtb_u_u143) dtb_u_u144) dtb_u_u145) dtb_u_u146)) dtb_u_u147)) (fun (dtb_u_u148 : int B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((Lowering_dEnv.v_listLength dtb_u_u144) + (v_maxIntListIn dtb_u_u148)))))))

# 258 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tempAnnotBinderId = (0 - 1)

# 323 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_binderTyAtIn = (fun (dtb_u_u149 : int) (dtb_u_u150 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u150 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u151, dtb_u_u152) -> (if (dtb_u_u149 <= 0) then (if (dtb_u_u151).Vuna_dIr_dModel.f_IrBinder_irBinderErased then B_dData_dMaybe.C_Maybe_Nothing else (dtb_u_u151).Vuna_dIr_dModel.f_IrBinder_irBinderTy) else ((v_binderTyAtIn (dtb_u_u149 - 1)) dtb_u_u152))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppGo = (fun (dtb_u_u153 : Core_dTerm.t_Term) (dtb_u_u154 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u153 with
  | Core_dTerm.C_Term_TRecord (dtb_u_u155, dtb_u_u156) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb_u_u155)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u156)) dtb_u_u154) }
  | Core_dTerm.C_Term_TApp (dtb_u_u157, dtb_u_u158, dtb_u_u159) -> ((v_flattenAnnotAppGo dtb_u_u157) (B_dData_dList.C_List__x58__x58_ (dtb_u_u158, dtb_u_u154)))
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u153; B_dData_dPair.f_Pair_second = dtb_u_u154 }
))

# 329 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotApp = (fun (dtb_u_u160 : Core_dTerm.t_Term) -> ((v_flattenAnnotAppGo dtb_u_u160) B_dData_dList.C_List_Nil))

# 406 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_binderTyAtRuntime = (fun (dtb_u_u161 : int) (dtb_u_u162 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u162 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u163, dtb_u_u164) -> (if (dtb_u_u163).Vuna_dIr_dModel.f_IrBinder_irBinderErased then ((v_binderTyAtRuntime dtb_u_u161) dtb_u_u164) else (if (dtb_u_u161 <= 0) then (dtb_u_u163).Vuna_dIr_dModel.f_IrBinder_irBinderTy else ((v_binderTyAtRuntime (dtb_u_u161 - 1)) dtb_u_u164)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Lowering/Ty.vuna"
let v_globalTyTermOf = (fun (dtb_u_u165 : Lowering_dEnv.t_LwEnv) (dtb_u_u166 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u166) (dtb_u_u165).Lowering_dEnv.f_LwEnv_lwDefTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u167) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDefType dtb_u_u167)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u166) (dtb_u_u165).Lowering_dEnv.f_LwEnv_lwGlobals)
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppRigGo = (fun (dtb_u_u168 : Core_dTerm.t_Term) (dtb_u_u169 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u168 with
  | Core_dTerm.C_Term_TRecord (dtb_u_u170, dtb_u_u171) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb_u_u170)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u171) dtb_u_u169) }
  | Core_dTerm.C_Term_TApp (dtb_u_u172, dtb_u_u173, dtb_u_u174) -> ((v_flattenAnnotAppRigGo dtb_u_u172) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u173; B_dData_dPair.f_Pair_second = dtb_u_u174 }, dtb_u_u169)))
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u168; B_dData_dPair.f_Pair_second = dtb_u_u169 }
))

# 461 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotAppRig = (fun (dtb_u_u175 : Core_dTerm.t_Term) -> ((v_flattenAnnotAppRigGo dtb_u_u175) B_dData_dList.C_List_Nil))

# 469 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_countRuntimeArgs = (fun (dtb_u_u176 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u176 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u177, dtb_u_u178) -> (match dtb_u_u177 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u179; B_dData_dPair.f_Pair_second = dtb_u_u180 } -> (if (Core_dTerm.v_rigIsErased dtb_u_u180) then (v_countRuntimeArgs dtb_u_u178) else (1 + (v_countRuntimeArgs dtb_u_u178)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelIrFuns = (fun (dtb_u_u181 : int) (dtb_u_u182 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match dtb_u_u182 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u183) -> (if (dtb_u_u181 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u183)) else (match dtb_u_u183 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u184, dtb_u_u185) -> ((v_peelIrFuns (dtb_u_u181 - 1)) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u185)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 486 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelPiArgsTy = (fun (dtb_u_u186 : int) (dtb_u_u187 : Lowering_dEnv.t_LwEnv) (dtb_u_u188 : Core_dTerm.t_Value) (dtb_u_u189 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u186 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u188 with
  | Core_dTerm.C_Value_VPi (dtb_u_u190, dtb_u_u191, dtb_u_u192, dtb_u_u193, dtb_u_u194) -> (if (Core_dTerm.v_rigIsErased dtb_u_u192) then (let dtb_u_u195 = dtb_u_u189 in (match dtb_u_u195 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (dtb_u_u187).Lowering_dEnv.f_LwEnv_lwTyParams) (dtb_u_u187).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) dtb_u_u188)))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u196, dtb_u_u197) -> (match dtb_u_u196 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u198; B_dData_dPair.f_Pair_second = dtb_u_u199 } -> (if (Core_dTerm.v_rigIsErased dtb_u_u199) then ((((v_peelPiArgsTy (dtb_u_u186 - 1)) dtb_u_u187) ((Core_dEval.v_applyClosure dtb_u_u194) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u198))) dtb_u_u197) else ((((v_peelPiArgsTy (dtb_u_u186 - 1)) dtb_u_u187) ((Core_dEval.v_applyClosure dtb_u_u194) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u190, 0, B_dData_dList.C_List_Nil)))))) dtb_u_u189))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u200 = dtb_u_u189 in (match dtb_u_u200 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (dtb_u_u187).Lowering_dEnv.f_LwEnv_lwTyParams) (dtb_u_u187).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) dtb_u_u188)))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u201, dtb_u_u202) -> (match dtb_u_u201 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u203; B_dData_dPair.f_Pair_second = dtb_u_u204 } -> ((((v_peelPiArgsTy (dtb_u_u186 - 1)) dtb_u_u187) ((Core_dEval.v_applyClosure dtb_u_u194) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u190, 0, B_dData_dList.C_List_Nil)))))) dtb_u_u202)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (dtb_u_u187).Lowering_dEnv.f_LwEnv_lwTyParams) (dtb_u_u187).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) dtb_u_u188)))
)))

# 523 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_nthTermIn = (fun (dtb_u_u205 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u206 : int) -> (match dtb_u_u205 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u207, dtb_u_u208) -> (if (dtb_u_u206 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u207)) else ((v_nthTermIn dtb_u_u208) (dtb_u_u206 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotTyOfFuel = (fun (dtb_u_u209 : int) (dtb_u_u210 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u211 : Lowering_dEnv.t_LwEnv) (dtb_u_u212 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u213 : Core_dTerm.t_Term) -> (if (dtb_u_u209 <= 0) then dtb_u_u210 else (match dtb_u_u213 with
  | Core_dTerm.C_Term_TVar (dtb_u_u214, dtb_u_u215, dtb_u_u216) -> (match ((v_binderTyAtIn dtb_u_u215) dtb_u_u212) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u217) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u217))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u210
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u218) -> ((((((v_annotHeadTy (dtb_u_u209 - 1)) dtb_u_u210) dtb_u_u211) dtb_u_u212) dtb_u_u218) B_dData_dList.C_List_Nil)
  | Core_dTerm.C_Term_TApp (dtb_u_u219, dtb_u_u220, dtb_u_u221) -> (match (v_flattenAnnotApp dtb_u_u213) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u222; B_dData_dPair.f_Pair_second = dtb_u_u223 } -> (match dtb_u_u222 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u224) -> ((((((v_annotHeadTy (dtb_u_u209 - 1)) dtb_u_u210) dtb_u_u211) dtb_u_u212) dtb_u_u224) dtb_u_u223)
  | _ -> dtb_u_u210
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TRecord (dtb_u_u225, dtb_u_u226) -> ((((((v_annotHeadTy (dtb_u_u209 - 1)) dtb_u_u210) dtb_u_u211) dtb_u_u212) dtb_u_u225) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u226))
  | Core_dTerm.C_Term_TCon (dtb_u_u227, dtb_u_u228) -> (((((v_annotConTy (dtb_u_u209 - 1)) dtb_u_u210) dtb_u_u211) dtb_u_u227) dtb_u_u228)
  | Core_dTerm.C_Term_TMk (dtb_u_u229, dtb_u_u230) -> (((((v_annotConTy (dtb_u_u209 - 1)) dtb_u_u210) dtb_u_u211) dtb_u_u229) dtb_u_u230)
  | Core_dTerm.C_Term_TInt (dtb_u_u231) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))
  | Core_dTerm.C_Term_TStr (dtb_u_u232) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyStr))
  | Core_dTerm.C_Term_TBool (dtb_u_u233) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyBool))
  | Core_dTerm.C_Term_TFloat (dtb_u_u234) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyFloat))
  | Core_dTerm.C_Term_TIf (dtb_u_u235, dtb_u_u236, dtb_u_u237) -> (((((v_annotTyOfFuel (dtb_u_u209 - 1)) dtb_u_u210) dtb_u_u211) dtb_u_u212) dtb_u_u236)
  | Core_dTerm.C_Term_TPi (dtb_u_u238, dtb_u_u239, dtb_u_u240, dtb_u_u241, dtb_u_u242) -> (if (Core_dTerm.v_rigIsErased dtb_u_u240) then dtb_u_u210 else (match (((((v_annotTyOfFuel (dtb_u_u209 - 1)) dtb_u_u210) dtb_u_u211) dtb_u_u212) dtb_u_u241) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u243) -> (match (((((v_annotTyOfFuel (dtb_u_u209 - 1)) dtb_u_u210) dtb_u_u211) (B_dData_dList.C_List__x58__x58_ ((((Vuna_dIr_dModel.v_mkIrBinderTyped v_tempAnnotBinderId) dtb_u_u238) dtb_u_u243), dtb_u_u212))) dtb_u_u242) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u244) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u243, dtb_u_u244))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> dtb_u_u210
)))
# 306 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotConTy = (fun (dtb_u_u245 : int) (dtb_u_u246 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u247 : Lowering_dEnv.t_LwEnv) (dtb_u_u248 : string) (dtb_u_u249 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u245 <= 0) then dtb_u_u246 else (let dtb_u_u250 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u248) (dtb_u_u247).Lowering_dEnv.f_LwEnv_lwCtors) in (match dtb_u_u250 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u251) -> (match dtb_u_u251 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u252; B_dData_dPair.f_Pair_second = dtb_u_u253 } -> (match (v_reprTyIr dtb_u_u252) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u254) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u254))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_ctorTypeArgsOf dtb_u_u247) dtb_u_u248) dtb_u_u249) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u255) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u252, dtb_u_u255))))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u246
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u246
  | _ -> failwith "DT: impossible branch"
))))
# 337 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotHeadTy = (fun (dtb_u_u256 : int) (dtb_u_u257 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u258 : Lowering_dEnv.t_LwEnv) (dtb_u_u259 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u260 : string) (dtb_u_u261 : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (dtb_u_u256 <= 0) then dtb_u_u257 else (if (dtb_u_u260 = Base_dIntrinsics.v_arrayTypeName) then (let dtb_u_u262 = dtb_u_u261 in (match dtb_u_u262 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u263, dtb_u_u264) -> (match dtb_u_u264 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (dtb_u_u256 - 1)) dtb_u_u257) dtb_u_u258) dtb_u_u259) dtb_u_u263) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u265) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb_u_u265))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u257
)
  | _ -> dtb_u_u257
)) else (if (dtb_u_u260 = Base_dIntrinsics.v_cellTypeName) then (let dtb_u_u266 = dtb_u_u261 in (match dtb_u_u266 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u267, dtb_u_u268) -> (match dtb_u_u268 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (dtb_u_u256 - 1)) dtb_u_u257) dtb_u_u258) dtb_u_u259) dtb_u_u267) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u269) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb_u_u269))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u257
)
  | _ -> dtb_u_u257
)) else (if (dtb_u_u260 = Base_dIntrinsics.v_marrayTypeName) then (let dtb_u_u270 = dtb_u_u261 in (match dtb_u_u270 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u271, dtb_u_u272) -> (match dtb_u_u272 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (dtb_u_u256 - 1)) dtb_u_u257) dtb_u_u258) dtb_u_u259) dtb_u_u271) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u273) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb_u_u273))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u257
)
  | _ -> dtb_u_u257
)) else (if (dtb_u_u260 = Base_dIntrinsics.v_mdynArrayTypeName) then (let dtb_u_u274 = dtb_u_u261 in (match dtb_u_u274 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u275, dtb_u_u276) -> (match dtb_u_u276 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> dtb_u_u257
)
  | _ -> dtb_u_u257
)) else (if (dtb_u_u260 = Base_dIntrinsics.v_mbufferTypeName) then (match dtb_u_u261 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> dtb_u_u257
) else (if (dtb_u_u260 = Base_dIntrinsics.v_threadTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (if (dtb_u_u260 = Base_dIntrinsics.v_mutexTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (if (dtb_u_u260 = Base_dIntrinsics.v_condvarTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (if (dtb_u_u260 = Base_dIntrinsics.v_atomicTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (match (v_reprTyIr dtb_u_u260) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u277) -> (match dtb_u_u261 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u277))
  | _ -> dtb_u_u257
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u260) (dtb_u_u258).Lowering_dEnv.f_LwEnv_lwDataTbl) then (match ((((((v_annotFamilyArgs (dtb_u_u256 - 1)) dtb_u_u257) dtb_u_u258) dtb_u_u259) ((Lowering_dEnv.v_lookupTyParamsIn (dtb_u_u258).Lowering_dEnv.f_LwEnv_lwTyParams) dtb_u_u260)) dtb_u_u261) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u278) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u260, dtb_u_u278))))
  | _ -> failwith "DT: impossible branch"
) else dtb_u_u257)
  | _ -> failwith "DT: impossible branch"
))))))))))))
# 505 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotFamilyArgs = (fun (dtb_u_u279 : int) (dtb_u_u280 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (dtb_u_u281 : Lowering_dEnv.t_LwEnv) (dtb_u_u282 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u283 : int B_dData_dList.t_List) (dtb_u_u284 : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (dtb_u_u279 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u283 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u285, dtb_u_u286) -> (match ((v_nthTermIn dtb_u_u284) dtb_u_u285) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u287) -> (match (((((v_annotTyOfFuel (dtb_u_u279 - 1)) dtb_u_u280) dtb_u_u281) dtb_u_u282) dtb_u_u287) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u288) -> (match ((((((v_annotFamilyArgs (dtb_u_u279 - 1)) dtb_u_u280) dtb_u_u281) dtb_u_u282) dtb_u_u286) dtb_u_u284) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u289) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u288, dtb_u_u289))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 528 "Vuna/Compiler/Lowering/Ty.vuna"
and v_ctorTypeArgsOf = (fun (dtb_u_u290 : Lowering_dEnv.t_LwEnv) (dtb_u_u291 : string) (dtb_u_u292 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u293 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u291) (dtb_u_u290).Lowering_dEnv.f_LwEnv_lwCtors) in (match dtb_u_u293 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u294) -> (match dtb_u_u294 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u295; B_dData_dPair.f_Pair_second = dtb_u_u296 } -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u295) (dtb_u_u290).Lowering_dEnv.f_LwEnv_lwDataTbl) then ((((((v_annotFamilyArgs 256) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u290) B_dData_dList.C_List_Nil) ((Lowering_dEnv.v_lookupTyParamsIn (dtb_u_u290).Lowering_dEnv.f_LwEnv_lwTyParams) dtb_u_u295)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u292)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 254 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOf = (fun (dtb_u_u297 : Lowering_dEnv.t_LwEnv) (dtb_u_u298 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u299 : Core_dTerm.t_Term) -> (((((v_annotTyOfFuel 256) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u297) dtb_u_u298) dtb_u_u299))

# 261 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOfTotal = (fun (dtb_u_u300 : Lowering_dEnv.t_LwEnv) (dtb_u_u301 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u302 : Core_dTerm.t_Term) -> (match (((((v_annotTyOfFuel 256) (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))) dtb_u_u300) dtb_u_u301) dtb_u_u302) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u303) -> dtb_u_u303
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotRunTyOf = (fun (dtb_u_u304 : Lowering_dEnv.t_LwEnv) (dtb_u_u305 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u306 : Core_dTerm.t_Term) -> (match dtb_u_u306 with
  | Core_dTerm.C_Term_TIf (dtb_u_u307, dtb_u_u308, dtb_u_u309) -> (((v_annotRunTyOf dtb_u_u304) dtb_u_u305) dtb_u_u308)
  | Core_dTerm.C_Term_TVar (dtb_u_u310, dtb_u_u311, dtb_u_u312) -> ((v_binderTyAtRuntime dtb_u_u311) dtb_u_u305)
  | _ -> (((v_annotTyOf dtb_u_u304) dtb_u_u305) dtb_u_u306)
))

# 422 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunTyOfTotal = (fun (dtb_u_u313 : Lowering_dEnv.t_LwEnv) (dtb_u_u314 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u315 : Core_dTerm.t_Term) -> (match (((v_annotRunTyOf dtb_u_u313) dtb_u_u314) dtb_u_u315) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u316) -> dtb_u_u316
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotGlobalTy = (fun (dtb_u_u317 : Lowering_dEnv.t_LwEnv) (dtb_u_u318 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u319 : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u319) (dtb_u_u317).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf dtb_u_u317) dtb_u_u318) (Core_dTerm.C_Term_TGlobal (dtb_u_u319))) else (match ((v_globalTyTermOf dtb_u_u317) dtb_u_u319) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u320) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (dtb_u_u317).Lowering_dEnv.f_LwEnv_lwTyParams) (dtb_u_u317).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u320))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_annotTyOf dtb_u_u317) dtb_u_u318) (Core_dTerm.C_Term_TGlobal (dtb_u_u319)))
  | _ -> failwith "DT: impossible branch"
)))

# 428 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotCalleeTy = (fun (dtb_u_u321 : Lowering_dEnv.t_LwEnv) (dtb_u_u322 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u323 : Core_dTerm.t_Term) -> (match dtb_u_u323 with
  | Core_dTerm.C_Term_TApp (dtb_u_u324, dtb_u_u325, dtb_u_u326) -> (let dtb_u_u327 = (v_flattenAnnotAppRig dtb_u_u323) in (match dtb_u_u327 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u328; B_dData_dPair.f_Pair_second = dtb_u_u329 } -> (match dtb_u_u328 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u330) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u330) (dtb_u_u321).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf dtb_u_u321) dtb_u_u322) dtb_u_u323) else (match ((v_globalTyTermOf dtb_u_u321) dtb_u_u330) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u331) -> ((((v_peelPiArgsTy 256) dtb_u_u321) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u331)) dtb_u_u329)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_peelIrFuns (v_countRuntimeArgs dtb_u_u329)) (((v_annotTyOf dtb_u_u321) dtb_u_u322) (Core_dTerm.C_Term_TGlobal (dtb_u_u330))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb_u_u329)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotTyOfTotal dtb_u_u321) dtb_u_u322) dtb_u_u328))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u332) -> (((v_annotGlobalTy dtb_u_u321) dtb_u_u322) dtb_u_u332)
  | _ -> (((v_annotTyOf dtb_u_u321) dtb_u_u322) dtb_u_u323)
))

# 414 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunCalleeTy = (fun (dtb_u_u333 : Lowering_dEnv.t_LwEnv) (dtb_u_u334 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (dtb_u_u335 : Core_dTerm.t_Term) -> (match dtb_u_u335 with
  | Core_dTerm.C_Term_TApp (dtb_u_u336, dtb_u_u337, dtb_u_u338) -> (let dtb_u_u339 = (v_flattenAnnotAppRig dtb_u_u335) in (match dtb_u_u339 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u340; B_dData_dPair.f_Pair_second = dtb_u_u341 } -> (match dtb_u_u340 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u342) -> (((v_annotCalleeTy dtb_u_u333) dtb_u_u334) dtb_u_u335)
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb_u_u341)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotRunTyOfTotal dtb_u_u333) dtb_u_u334) dtb_u_u340))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u343) -> (((v_annotGlobalTy dtb_u_u333) dtb_u_u334) dtb_u_u343)
  | _ -> (((v_annotRunTyOf dtb_u_u333) dtb_u_u334) dtb_u_u335)
))

# 544 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_findCtorInLocal = (fun (dtb_u_u344 : string) (dtb_u_u345 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match dtb_u_u345 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u346, dtb_u_u347) -> (if ((Elab_dTypes.v_dtCtorName dtb_u_u346) = dtb_u_u344) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u346)) else ((v_findCtorInLocal dtb_u_u344) dtb_u_u347))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorKeptFieldTys = (fun (dtb_u_u348 : Lowering_dEnv.t_LwEnv) (dtb_u_u349 : string) -> (let dtb_u_u350 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u349) (dtb_u_u348).Lowering_dEnv.f_LwEnv_lwCtors) in (match dtb_u_u350 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u351) -> (match dtb_u_u351 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u352; B_dData_dPair.f_Pair_second = dtb_u_u353 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u352) (dtb_u_u348).Lowering_dEnv.f_LwEnv_lwDataTbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u354) -> (match ((v_findCtorInLocal dtb_u_u349) (Elab_dTypes.v_dtDataCtors dtb_u_u354)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u355) -> (let dtb_u_u356 = ((Lowering_dEnv.v_lookupTyParamsIn (dtb_u_u348).Lowering_dEnv.f_LwEnv_lwTyParams) dtb_u_u352) in ((Base_dCommon.v_bind (((((((((v_ctorFieldTys dtb_u_u356) (dtb_u_u348).Lowering_dEnv.f_LwEnv_lwTyParams) (dtb_u_u348).Lowering_dEnv.f_LwEnv_lwDataTbl) dtb_u_u353) ((Lowering_dEnv.v_ctorOpaqueFlagsOf (dtb_u_u348).Lowering_dEnv.f_LwEnv_lwDatas) dtb_u_u355)) (Elab_dTypes.v_dtCtorTelescope dtb_u_u355)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u355))) (Lowering_dEnv.v_listLength dtb_u_u356))) (fun (dtb_u_u357 : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u357))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 584 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclOf = (fun (dtb_u_u358 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u359 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u360 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u361 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u362 : Elab_dTypes.t_DtData) -> (let dtb_u_u363 = ((Lowering_dEnv.v_lookupTyParamsIn dtb_u_u359) (Elab_dTypes.v_dtDataName dtb_u_u362)) in (let dtb_u_u364 = (Lowering_dEnv.v_listLength dtb_u_u363) in (let dtb_u_u365 = ((Elab_dRepresentation.v_lookupUnboxedInfo (Elab_dTypes.v_dtDataName dtb_u_u362)) dtb_u_u361) in (match dtb_u_u365 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Lowering_dEnv.v_hasRecordRepr dtb_u_u362) then (let dtb_u_u366 = (Elab_dTypes.v_dtDataCtors dtb_u_u362) in (match dtb_u_u366 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u367, dtb_u_u368) -> (match dtb_u_u368 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys dtb_u_u363) dtb_u_u359) dtb_u_u358) (Elab_dRepresentation.v_ctorKeepFlags dtb_u_u367)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf dtb_u_u360) dtb_u_u367)) (Elab_dTypes.v_dtCtorTelescope dtb_u_u367)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u367))) dtb_u_u364)) (fun (dtb_u_u369 : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let dtb_u_u370 = (Lowering_dEnv.v_recordRtFields dtb_u_u362) in (let dtb_u_u371 = (B_dData_dPair.v_firstOf dtb_u_u369) in (if ((Lowering_dEnv.v_listLength dtb_u_u370) = (Lowering_dEnv.v_listLength dtb_u_u371)) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl ((Elab_dTypes.v_dtDataName dtb_u_u362), (B_dData_dPair.v_secondOf dtb_u_u369), dtb_u_u370, dtb_u_u371)))) else (Base_dDiag.v_icInternal (String.concat "" ["record `"; (Elab_dTypes.v_dtDataName dtb_u_u362); "` has "; (string_of_int (Lowering_dEnv.v_listLength dtb_u_u370)); " runtime fields but "; (string_of_int (Lowering_dEnv.v_listLength dtb_u_u371)); " field types"])))))))
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName dtb_u_u362)))
)
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName dtb_u_u362)))
)) else ((Base_dCommon.v_bind (((((v_dataArityNeed dtb_u_u358) dtb_u_u363) dtb_u_u359) dtb_u_u360) (Elab_dTypes.v_dtDataCtors dtb_u_u362))) (fun (dtb_u_u372 : int) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u373 : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys dtb_u_u363) dtb_u_u359) dtb_u_u358) (Elab_dRepresentation.v_ctorKeepFlags dtb_u_u373)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf dtb_u_u360) dtb_u_u373)) (Elab_dTypes.v_dtCtorTelescope dtb_u_u373)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u373))) (Lowering_dEnv.v_listLength dtb_u_u363))) (fun (dtb_u_u374 : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName dtb_u_u373); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf dtb_u_u374) })))))) (Elab_dTypes.v_dtDataCtors dtb_u_u362))) (fun (dtb_u_u375 : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl ((Elab_dTypes.v_dtDataName dtb_u_u362), dtb_u_u372, dtb_u_u375)))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u376) -> (match dtb_u_u376 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u377; B_dData_dPair.f_Pair_second = dtb_u_u378 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys dtb_u_u363) dtb_u_u359) dtb_u_u358) (Elab_dRepresentation.v_ctorKeepFlags dtb_u_u377)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf dtb_u_u360) dtb_u_u377)) (Elab_dTypes.v_dtCtorTelescope dtb_u_u377)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u377))) dtb_u_u364)) (fun (dtb_u_u379 : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let dtb_u_u380 = (B_dData_dPair.v_firstOf dtb_u_u379) in (match dtb_u_u380 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u381, dtb_u_u382) -> (match dtb_u_u382 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl ((Elab_dTypes.v_dtDataName dtb_u_u362), (B_dData_dPair.v_secondOf dtb_u_u379), dtb_u_u381))))
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb_u_u377)))
)
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb_u_u377)))
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 577 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclsGo = (fun (dtb_u_u383 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u384 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u385 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u386 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u387 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u387 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u388, dtb_u_u389) -> ((Base_dCommon.v_bind (((((v_tyDeclOf dtb_u_u383) dtb_u_u384) dtb_u_u385) dtb_u_u386) dtb_u_u388)) (fun (dtb_u_u390 : Vuna_dIr_dModel.t_IrTyDecl) -> ((Base_dCommon.v_bind (((((v_tyDeclsGo dtb_u_u383) dtb_u_u384) dtb_u_u385) dtb_u_u386) dtb_u_u389)) (fun (dtb_u_u391 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u390, dtb_u_u391))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 573 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclsOf = (fun (dtb_u_u392 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (dtb_u_u393 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u394 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u395 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u396 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((((v_tyDeclsGo dtb_u_u392) dtb_u_u393) dtb_u_u395) dtb_u_u394) dtb_u_u396))

# 618 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclTys = (fun (dtb_u_u397 : Vuna_dIr_dModel.t_IrTyDecl) -> (match dtb_u_u397 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb_u_u398, dtb_u_u399, dtb_u_u400) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u400, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb_u_u401, dtb_u_u402, dtb_u_u403, dtb_u_u404) -> dtb_u_u404
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb_u_u405, dtb_u_u406, dtb_u_u407) -> ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb_u_u407)
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_foldlTyNames = (fun (dtb_u_u408 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (dtb_u_u409 : string B_dData_dList.t_List) -> (match dtb_u_u408 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u410, dtb_u_u411) -> ((v_foldlTyNames dtb_u_u411) ((v_tyNamesInto dtb_u_u410) dtb_u_u409))
  | B_dData_dList.C_List_Nil -> dtb_u_u409
  | _ -> failwith "DT: impossible branch"
))
# 631 "Vuna/Compiler/Lowering/Ty.vuna"
and v_tyNamesInto = (fun (dtb_u_u412 : Vuna_dIr_dModel.t_IrTy) (dtb_u_u413 : string B_dData_dList.t_List) -> (match dtb_u_u412 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb_u_u414, dtb_u_u415) -> ((v_foldlTyNames dtb_u_u415) ((Lowering_dEnv.v_pushDep dtb_u_u414) dtb_u_u413))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb_u_u416, dtb_u_u417) -> ((v_tyNamesInto dtb_u_u417) ((v_tyNamesInto dtb_u_u416) dtb_u_u413))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb_u_u418) -> ((v_tyNamesInto dtb_u_u418) dtb_u_u413)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb_u_u419) -> ((v_tyNamesInto dtb_u_u419) dtb_u_u413)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> dtb_u_u413
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> dtb_u_u413
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> dtb_u_u413
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> dtb_u_u413
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> dtb_u_u413
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb_u_u420) -> dtb_u_u413
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclRefsGo = (fun (dtb_u_u421 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u422 : string B_dData_dList.t_List) -> (match dtb_u_u421 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u423, dtb_u_u424) -> ((v_tyDeclRefsGo dtb_u_u424) ((v_foldlTyNames dtb_u_u423) dtb_u_u422))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u422)
  | _ -> failwith "DT: impossible branch"
))

# 615 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclRefs = (fun (dtb_u_u425 : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_tyDeclRefsGo ((B_dData_dList.v_map v_tyDeclTys) dtb_u_u425)) B_dData_dList.C_List_Nil))
