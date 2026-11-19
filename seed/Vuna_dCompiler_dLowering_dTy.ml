open Vuna_runtime
# 46 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dreprTyIr = (fun (name : string) -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt)) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr)) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat)) else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dFamilyRepr_FamReprBool -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dFamilyRepr_FamReprNat -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalReprOf name))))))

# 78 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsicWith = (fun (mc0 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) (mc1 : string) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (mc1 = "Array") then (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, dtb__2) -> (match dtb__2 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray ((mc0 dtb__1)))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc1 = "IORef") then (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (match dtb__4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef ((mc0 dtb__3)))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 29 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel = (fun (fuel : int) (levels : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__5) -> (match dtb__5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__6, dtb__7, dtb__8) -> (match ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotIn levels) dtb__7) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__9) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__9))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__10, dtb__11) -> ((((((v_Vuna_dCompiler_dLowering_dTy_drenderTyGlobal fuel) levels) table) datas) dtb__10) dtb__11)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
)))
# 60 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_drenderTyGlobal = (fun (fuel : int) (levels : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (g : string) (sp : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match (((v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsicWith (fun (x : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel (fuel - 1)) levels) table) datas) x))) g) sp) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__12) -> dtb__12
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dLowering_dTy_dreprTyIr g) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__13) -> dtb__13
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (g, ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs (fuel - 1)) levels) table) datas) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn table) g)) sp)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 83 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs = (fun (fuel : int) (levels : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (usedPats : int Base_dData_dList.t_Base_dData_dList_dList) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match usedPats with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (match ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn args) dtb__15) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__17) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel (fuel - 1)) levels) table) datas) dtb__17), ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__16) args)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__16) args)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderTyOf = (fun (levels : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel 256) levels) table) datas) v))

# 102 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel = (fun (fuel : int) (levels : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (lvl : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel fuel) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__20) then ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel (fuel - 1)) levels) table) datas) lvl) dtb__21), ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__22) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__18, lvl, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | _ -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel fuel) levels) table) datas) v)
)))

# 99 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderPiTy = (fun (levels : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (lvl : int) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel 256) levels) table) datas) lvl) v))

# 117 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderFieldTy = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc5 : int) -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__23) -> (match dtb__23 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__24, dtb__25, dtb__26) -> (match ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotIn mc0) dtb__25) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__27) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__27)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor field type mentions a type variable outside the family's runtime parameter slots")
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> (match (((v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsicWith (fun (x : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel 256) mc0) mc1) mc2) x))) dtb__28) dtb__29) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__30) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__30; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dLowering_dTy_dreprTyIr dtb__28) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__31) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__31; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__28) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__32) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__28, ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs 256) mc0) mc1) mc2) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn mc1) dtb__28)) dtb__29))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("constructor field type head is not a known family: " ^ dtb__28))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> (if dtb__34 then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (mc5 + 1) })) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTy mc0) mc1) mc2) mc3) mc4); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 })))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor field type has no runtime rendering")
))

# 146 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn = (fun (mc0 : bool) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) -> (if mc0 then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)))

# 151 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc3 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc4 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : int) (mc7 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc8 : int) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__45 } -> (if ((v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn dtb__38) dtb__45) then (match mc7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> ((fun next -> (if dtb__38 then (if dtb__40 then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) mc8)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__51; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__52 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, dtb__51)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__52 }))
  | _ -> failwith "DT: impossible branch"
))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFieldTy mc0) mc1) mc2) mc6) dtb__49) mc8)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__53; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) dtb__54)) (fun (q : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__55; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__56 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__53, dtb__55)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__56 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) else (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) mc8))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__50) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__46, mc6, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor telescope does not match its type")
) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor opaque flags shorter than its shape")
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor shape has more binders than its telescope")
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__61, dtb__62) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc8 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dctorArityNeed = (fun (levels : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) - (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels)))))))

# 202 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (if (dtb__63 >= (v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn dtb__64)) then dtb__63 else (v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn dtb__64))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_ddataArityNeed = (fun (levels : int Base_dData_dList.t_Base_dData_dList_dList) (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((v_Vuna_dCompiler_dLowering_dTy_dctorArityNeed levels) table) datas)) ctors)) (fun (ns : int Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels) + (v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn ns)))))))

# 283 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dbinderTyAtIn = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (if (mc0 <= 0) then (if (dtb__65).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (dtb__65).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy) else ((v_Vuna_dCompiler_dLowering_dTy_dbinderTyAtIn (mc0 - 1)) dtb__66))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppGo = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__67, dtb__68) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__67)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__68)) mc1) }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__69, dtb__70, dtb__71) -> ((v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppGo dtb__69) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, mc1)))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }
))

# 289 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotApp = (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppGo t) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 354 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dglobalTyTermOf = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (g : string) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) g) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__72) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__72)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) g) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwGlobals)
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppRigGo = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__73, dtb__74) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__73)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__74) mc1) }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__75, dtb__76, dtb__77) -> ((v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppRigGo dtb__75) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__76; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__77 }, mc1)))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }
))

# 371 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppRig = (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppRigGo t) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 379 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dcountRuntimeArgs = (fun (mc0 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__78, dtb__79) -> (match dtb__78 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__81 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__81) then (v_Vuna_dCompiler_dLowering_dTy_dcountRuntimeArgs dtb__79) else (1 + (v_Vuna_dCompiler_dLowering_dTy_dcountRuntimeArgs dtb__79)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dpeelIrFuns = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__82) -> (if (mc0 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__82)) else (match dtb__82 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__83, dtb__84) -> ((v_Vuna_dCompiler_dLowering_dTy_dpeelIrFuns (mc0 - 1)) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__84)))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 396 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dpeelPiArgsTy = (fun (fuel : int) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__87) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTy Base_dData_dList.C_Base_dData_dList_dList_Nil) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) 0) v)))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__92; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__93 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__93) then ((((v_Vuna_dCompiler_dLowering_dTy_dpeelPiArgsTy (fuel - 1)) env) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__89) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__92))) dtb__91) else ((((v_Vuna_dCompiler_dLowering_dTy_dpeelPiArgsTy (fuel - 1)) env) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__89) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__85, 0, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) args) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTy Base_dData_dList.C_Base_dData_dList_dList_Nil) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) 0) v)))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__96; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__97 } -> ((((v_Vuna_dCompiler_dLowering_dTy_dpeelPiArgsTy (fuel - 1)) env) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__89) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__85, 0, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) dtb__95)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) args))
  | _ -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTy Base_dData_dList.C_Base_dData_dList_dList_Nil) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) 0) v)))
)))

# 433 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dnthTermIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__98, dtb__99) -> (if (mc1 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__98)) else ((v_Vuna_dCompiler_dLowering_dTy_dnthTermIn dtb__99) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel = (fun (fuel : int) (dflt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then dflt else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__100, dtb__101, dtb__102) -> (match ((v_Vuna_dCompiler_dLowering_dTy_dbinderTyAtIn dtb__101) binders) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__103) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__103))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__104) -> ((((((v_Vuna_dCompiler_dLowering_dTy_dannotHeadTy (fuel - 1)) dflt) env) binders) dtb__104) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__105, dtb__106, dtb__107) -> (match (v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotApp t) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__108; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__109 } -> (match dtb__108 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__110) -> ((((((v_Vuna_dCompiler_dLowering_dTy_dannotHeadTy (fuel - 1)) dflt) env) binders) dtb__110) dtb__109)
  | _ -> dflt
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__111, dtb__112) -> ((((((v_Vuna_dCompiler_dLowering_dTy_dannotHeadTy (fuel - 1)) dflt) env) binders) dtb__111) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__112))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__113, dtb__114) -> (((((v_Vuna_dCompiler_dLowering_dTy_dannotConTy (fuel - 1)) dflt) env) dtb__113) dtb__114)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__115, dtb__116) -> (((((v_Vuna_dCompiler_dLowering_dTy_dannotConTy (fuel - 1)) dflt) env) dtb__115) dtb__116)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__117) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__118) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__119) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__120) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__121, dtb__122, dtb__123) -> (((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__122)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__126) then dflt else (match (((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__127) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__129) -> (match (((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) dflt) env) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderTyped dtb__124) dtb__129), binders))) dtb__128) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__130) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__129, dtb__130))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> dflt
)))
# 266 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dannotConTy = (fun (fuel : int) (dflt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (c : string) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then dflt else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__131) -> (match dtb__131 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__132; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__133 } -> (match (v_Vuna_dCompiler_dLowering_dTy_dreprTyIr dtb__132) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__134) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__134))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dLowering_dTy_dctorTypeArgsOf env) c) args) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__135) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__132, dtb__135))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))
# 297 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dannotHeadTy = (fun (fuel : int) (dflt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (g : string) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then dflt else (if (g = "Array") then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__136, dtb__137) -> (match dtb__137 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__136) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__138) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__138))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) args) else (if (g = "IORef") then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__139, dtb__140) -> (match dtb__140 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__139) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__141) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__141))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) args) else (match (v_Vuna_dCompiler_dLowering_dTy_dreprTyIr g) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__142) -> (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__142))
  | _ -> dflt
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> dflt
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__143) -> (match ((((((v_Vuna_dCompiler_dLowering_dTy_dannotFamilyArgs (fuel - 1)) dflt) env) binders) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) g)) args) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__144) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (g, dtb__144))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 415 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dannotFamilyArgs = (fun (fuel : int) (dflt : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (usedPats : int Base_dData_dList.t_Base_dData_dList_dList) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match usedPats with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__145, dtb__146) -> (match ((v_Vuna_dCompiler_dLowering_dTy_dnthTermIn args) dtb__145) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__147) -> (match (((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__147) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__148) -> (match ((((((v_Vuna_dCompiler_dLowering_dTy_dannotFamilyArgs (fuel - 1)) dflt) env) binders) dtb__146) args) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__149) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, dtb__149))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 438 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dctorTypeArgsOf = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (ctor : string) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__150) -> (match dtb__150 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__151; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__152 } -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__151) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__153) -> ((((((v_Vuna_dCompiler_dLowering_dTy_dannotFamilyArgs 256) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) env) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) dtb__151)) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) ctor) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors)))

# 218 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dannotTyOf = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel 256) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) env) binders) t))

# 221 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dannotTyOfTotal = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match (((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel 256) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque))) env) binders) t) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__154) -> dtb__154
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dannotGlobalTy = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (g : string) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__155) -> (((v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dLowering_dTy_dglobalTyTermOf env) g) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__156) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTy Base_dData_dList.C_Base_dData_dList_dList_Nil) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__156))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dannotCalleeTy = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (binders : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__157) -> (((v_Vuna_dCompiler_dLowering_dTy_dannotGlobalTy env) binders) dtb__157)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__158, dtb__159, dtb__160) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__161; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__162 } -> (match dtb__161 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__163) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__163) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__164) -> (((v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) binders) t)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dLowering_dTy_dglobalTyTermOf env) dtb__163) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__165) -> ((((v_Vuna_dCompiler_dLowering_dTy_dpeelPiArgsTy 256) env) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__165)) dtb__162)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLowering_dTy_dpeelIrFuns (v_Vuna_dCompiler_dLowering_dTy_dcountRuntimeArgs dtb__162)) (((v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__163))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dLowering_dTy_dpeelIrFuns (v_Vuna_dCompiler_dLowering_dTy_dcountRuntimeArgs dtb__162)) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfTotal env) binders) dtb__161))))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppRig t))
  | _ -> (((v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) binders) t)
))

# 454 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dfindCtorInLocal = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__166) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__166)) else ((v_Vuna_dCompiler_dLowering_dTy_dfindCtorInLocal mc0) dtb__167))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dctorKeptFieldTys = (fun (env : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv) (ctor : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__168) -> (match dtb__168 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__169; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__170 } -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__169) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__171) -> (match ((v_Vuna_dCompiler_dLowering_dTy_dfindCtorInLocal ctor) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__171)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__172) -> ((fun levels -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) dtb__170) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) dtb__172)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__172)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__172))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))))) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) dtb__169))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) ctor) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors)))

# 493 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclOf = (fun (table : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (allDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (unboxed : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> ((fun levels -> ((fun arity -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dhasRecordRepr d) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__173)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf allDatas) dtb__173)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__173)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__173))) arity)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun fields -> ((fun tys -> (if ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength fields) = (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength tys)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p), fields, tys)))) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["record `"; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); "` has "; (bi_strFromInt (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength fields)); " runtime fields but "; (bi_strFromInt (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength tys)); " field types"])))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields d))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dTy_ddataArityNeed levels) table) allDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun (fullArity : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf allDatas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p) })))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun (ctors : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), fullArity, ctors)))))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__175) -> (match dtb__175 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__176; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__177 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__176)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf allDatas) dtb__176)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__176)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__176))) arity)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> (match dtb__179 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p), dtb__178))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__176)))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__176)))
)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

# 486 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo = (fun (mc0 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__180, dtb__181) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dTy_dtyDeclOf mc0) mc1) mc2) dtb__180)) (fun (decl : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo mc0) mc1) mc2) dtb__181)) (fun (tail : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (decl, tail))))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 483 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclsOf = (fun (tyParams : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (unboxed : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (allDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (subset : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo tyParams) allDatas) unboxed) subset))

# 527 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__182, dtb__183, dtb__184) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__184, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__185, dtb__186, dtb__187, dtb__188) -> dtb__188
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__189, dtb__190, dtb__191) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) dtb__191)
  | _ -> failwith "DT: impossible branch"
))

# 536 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, dtb__193) -> ((v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames dtb__193) ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__192) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 540 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__194, dtb__195) -> ((v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames dtb__195) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dpushDep dtb__194) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__196, dtb__197) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__197) ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__196) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__198) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__198) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__199) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__199) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__200) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 532 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, dtb__202) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo dtb__202) ((v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames dtb__201) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 524 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefs = (fun (decls : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dTy_dtyDeclTys) decls)) Base_dData_dList.C_Base_dData_dList_dList_Nil))
