open Vuna_runtime
# 46 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dreprTyIr = (fun name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt)) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr)) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat)) else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dFamilyRepr_FamReprBool -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dFamilyRepr_FamReprNat -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalReprOf name))))))

# 75 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsic = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) -> (if (mc0 = "Array") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__1, dtb__2) -> (match dtb__2 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__1))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else (if (mc0 = "IORef") then (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (match dtb__4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__3))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))

# 29 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel = (fun fuel levels table datas v -> (if (fuel <= 0) then Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque else (match v with
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
and v_Vuna_dCompiler_dLowering_dTy_drenderTyGlobal = (fun fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsic g) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (x : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel (fuel - 1)) levels) table) datas) x))) sp)) with
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
# 80 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs = (fun fuel levels table datas usedPats args -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match usedPats with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (match ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn args) dtb__15) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__17) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel (fuel - 1)) levels) table) datas) dtb__17), ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__16) args)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__16) args)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderTyOf = (fun levels table datas v -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel 256) levels) table) datas) v))

# 99 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel = (fun fuel levels table datas lvl v -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel fuel) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__20) then ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel (fuel - 1)) levels) table) datas) lvl) dtb__21), ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__22) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__18, lvl, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | _ -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel fuel) levels) table) datas) v)
)))

# 96 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderPiTy = (fun levels table datas lvl v -> ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel 256) levels) table) datas) lvl) v))

# 112 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderFieldTy = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc5 : int) -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__23) -> (match dtb__23 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__24, dtb__25, dtb__26) -> (match ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotIn mc0) dtb__25) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__27) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__27)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (mc5 + 1) }
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> (match ((v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsic dtb__28) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (x : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel 256) mc0) mc1) mc2) x))) dtb__29)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__30) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__30; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dLowering_dTy_dreprTyIr dtb__28) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__31) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__31; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__28) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__32) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__28, ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs 256) mc0) mc1) mc2) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn mc1) dtb__28)) dtb__29))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (mc5 + 1) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> (if dtb__34 then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (mc5 + 1) } else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTy mc0) mc1) mc2) mc3) mc4); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 })
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (mc5 + 1) }
))

# 139 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn = (fun (mc0 : bool) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) -> (if mc0 then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)))

# 144 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc3 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc4 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc5 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc6 : int) (mc7 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc8 : int) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__45 } -> (if ((v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn dtb__38) dtb__45) then (match mc7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> ((fun next -> (if dtb__38 then (if dtb__40 then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) mc8)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__51; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__52 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, dtb__51)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__52 }))
  | _ -> failwith "DT: impossible branch"
))) else (match ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFieldTy mc0) mc1) mc2) mc6) dtb__49) mc8) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__53; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) dtb__54)) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__55; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__56 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__53, dtb__55)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__56 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) else (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) mc8))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__50) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__46, mc6, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
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

# 180 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dctorArityNeed = (fun levels table datas c -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) - (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels)))))))

# 192 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (if (dtb__63 >= (v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn dtb__64)) then dtb__63 else (v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn dtb__64))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_ddataArityNeed = (fun levels table datas ctors -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((v_Vuna_dCompiler_dLowering_dTy_dctorArityNeed levels) table) datas)) ctors)) (fun (ns : int Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels) + (v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn ns)))))))

# 258 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dbinderTyAtIn = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (if (mc0 <= 0) then (if (dtb__65).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderErased then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (dtb__65).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrBinder_irBinderTy) else ((v_Vuna_dCompiler_dLowering_dTy_dbinderTyAtIn (mc0 - 1)) dtb__66))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppGo = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__67, dtb__68) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__67)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__68)) mc1) }
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__69, dtb__70, dtb__71) -> ((v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppGo dtb__69) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, mc1)))
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }
))

# 264 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotApp = (fun t -> ((v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotAppGo t) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 338 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dnthTermIn = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (if (mc1 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__72)) else ((v_Vuna_dCompiler_dLowering_dTy_dnthTermIn dtb__73) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel = (fun fuel env binders t -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__74, dtb__75, dtb__76) -> ((v_Vuna_dCompiler_dLowering_dTy_dbinderTyAtIn dtb__75) binders)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__77) -> (((((v_Vuna_dCompiler_dLowering_dTy_dannotHeadTy (fuel - 1)) env) binders) dtb__77) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__78, dtb__79, dtb__80) -> (match (v_Vuna_dCompiler_dLowering_dTy_dflattenAnnotApp t) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__81; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__82 } -> (match dtb__81 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__83) -> (((((v_Vuna_dCompiler_dLowering_dTy_dannotHeadTy (fuel - 1)) env) binders) dtb__83) dtb__82)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__84, dtb__85) -> (((((v_Vuna_dCompiler_dLowering_dTy_dannotHeadTy (fuel - 1)) env) binders) dtb__84) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__85))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__86, dtb__87) -> ((((v_Vuna_dCompiler_dLowering_dTy_dannotConTy (fuel - 1)) env) dtb__86) dtb__87)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__88, dtb__89) -> ((((v_Vuna_dCompiler_dLowering_dTy_dannotConTy (fuel - 1)) env) dtb__88) dtb__89)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__90) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__91) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__92) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__93) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__94, dtb__95, dtb__96) -> ((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) env) binders) dtb__95)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__99) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) env) binders) dtb__100) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__102) -> (match ((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) env) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dmkIrBinderTyped dtb__97) dtb__102), binders))) dtb__101) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__103) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__102, dtb__103))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)))
# 241 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dannotConTy = (fun fuel env c args -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__104) -> (match dtb__104 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__105; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__106 } -> (match (v_Vuna_dCompiler_dLowering_dTy_dreprTyIr dtb__105) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__107) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__107))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dLowering_dTy_dctorTypeArgsOf env) c) args) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__108) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__105, dtb__108))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) c) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors))))
# 272 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dannotHeadTy = (fun fuel env binders g args -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (if (g = "Array") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, dtb__110) -> (match dtb__110 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) env) binders) dtb__109) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__111) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__111))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) args) else (if (g = "IORef") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__112, dtb__113) -> (match dtb__113 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) env) binders) dtb__112) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__114) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__114))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) args) else (match (v_Vuna_dCompiler_dLowering_dTy_dreprTyIr g) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__115) -> (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__115))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__116) -> (match (((((v_Vuna_dCompiler_dLowering_dTy_dannotFamilyArgs (fuel - 1)) env) binders) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) g)) args) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__117) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (g, dtb__117))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 320 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dannotFamilyArgs = (fun fuel env binders usedPats args -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match usedPats with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (match ((v_Vuna_dCompiler_dLowering_dTy_dnthTermIn args) dtb__118) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__120) -> (match ((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel (fuel - 1)) env) binders) dtb__120) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__121) -> (match (((((v_Vuna_dCompiler_dLowering_dTy_dannotFamilyArgs (fuel - 1)) env) binders) dtb__119) args) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__122) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__121, dtb__122))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 343 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dctorTypeArgsOf = (fun env ctor args -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__123) -> (match dtb__123 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__124; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__125 } -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__124) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__126) -> (((((v_Vuna_dCompiler_dLowering_dTy_dannotFamilyArgs 256) env) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) dtb__124)) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) ctor) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors)))

# 204 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dannotTyOf = (fun env binders t -> ((((v_Vuna_dCompiler_dLowering_dTy_dannotTyOfFuel 256) env) binders) t))

# 306 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dannotCalleeTy = (fun env binders t -> (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__127) -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__127) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__128) -> (((v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) binders) t)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__127) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDefTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__129) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTy Base_dData_dList.C_Base_dData_dList_dList_Nil) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__129)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) binders) t)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLowering_dTy_dannotTyOf env) binders) t)
))

# 353 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dfindCtorInLocal = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__130, dtb__131) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__130) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__130)) else ((v_Vuna_dCompiler_dLowering_dTy_dfindCtorInLocal mc0) dtb__131))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dctorKeptFieldTys = (fun env ctor -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__132) -> (match dtb__132 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__133; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__134 } -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData dtb__133) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__135) -> (match ((v_Vuna_dCompiler_dLowering_dTy_dfindCtorInLocal ctor) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__135)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__136) -> ((fun levels -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) dtb__134) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwDatas) dtb__136)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__136)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__136))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))))) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwTyParams) dtb__133))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) ctor) (env).Vuna_dCompiler_dLowering_dEnv.f_Vuna_dCompiler_dLowering_dEnv_dLwEnv_lwCtors)))

# 392 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclOf = (fun table allDatas unboxed d -> ((fun levels -> ((fun arity -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dhasRecordRepr d) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, dtb__138) -> (match dtb__138 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__137)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf allDatas) dtb__137)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__137)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__137))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields d), (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dTy_ddataArityNeed levels) table) allDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun (fullArity : int) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf allDatas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p) })))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun (ctors : (string, Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), fullArity, ctors)))))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__139) -> (match dtb__139 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__140; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__141 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__140)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf allDatas) dtb__140)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__140)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__140))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun (p : (Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (match dtb__143 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, dtb__142))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__140)))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__140)))
)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

# 385 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo = (fun (mc0 : (string, int Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__144, dtb__145) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dTy_dtyDeclOf mc0) mc1) mc2) dtb__144)) (fun (decl : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo mc0) mc1) mc2) dtb__145)) (fun (tail : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (decl, tail))))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclsOf = (fun tyParams unboxed allDatas subset -> ((((v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo tyParams) allDatas) unboxed) subset))

# 419 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclTys = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTyDecl) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__146, dtb__147, dtb__148) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__149, dtb__150, dtb__151, dtb__152) -> dtb__152
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__153, dtb__154, dtb__155) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) dtb__155)
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, dtb__157) -> ((v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames dtb__157) ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__156) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 432 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__158, dtb__159) -> ((v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames dtb__159) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dpushDep dtb__158) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__160, dtb__161) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__161) ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__160) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__162) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__162) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__163) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__163) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__164) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo = (fun (mc0 : Vuna_dCompiler_dIr_dModel.t_Vuna_dCompiler_dIr_dModel_dIrTy Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo dtb__166) ((v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames dtb__165) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefs = (fun decls -> ((v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dTy_dtyDeclTys) decls)) Base_dData_dList.C_Base_dData_dList_dList_Nil))
