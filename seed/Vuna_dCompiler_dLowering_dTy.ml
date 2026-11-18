open Vuna_runtime
# 41 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dreprTyIr = (fun name -> (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt)) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr)) else (if (name = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat)) else ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dFamilyRepr_FamReprBool -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool))
  | Vuna_dCompiler_dBase_dIntrinsics.C_Vuna_dCompiler_dBase_dIntrinsics_dFamilyRepr_FamReprNat -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalReprOf name))))))

# 60 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsic = (fun mc0 mc1 -> (if (mc0 = "Array") then (match mc1 with
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
# 50 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_drenderTyGlobal = (fun fuel levels table datas g sp -> (match ((v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsic g) ((Base_dData_dList.v_Base_dData_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel (fuel - 1)) levels) table) datas) x))) sp)) with
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
# 65 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs = (fun fuel levels table datas usedPats args -> (if (fuel <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match usedPats with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (match ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn args) dtb__15) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__17) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel (fuel - 1)) levels) table) datas) dtb__17), ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__16) args)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs (fuel - 1)) levels) table) datas) dtb__16) args)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderTyOf = (fun levels table datas v -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel 256) levels) table) datas) v))

# 79 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel = (fun fuel levels table datas lvl v -> (if (fuel <= 0) then (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel fuel) levels) table) datas) v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> ((fun next -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__20) then ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next) else (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel (fuel - 1)) levels) table) datas) lvl) dtb__21), ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel (fuel - 1)) levels) table) datas) (lvl + 1)) next))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__22) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__18, lvl, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
  | _ -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel fuel) levels) table) datas) v)
)))

# 76 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderPiTy = (fun levels table datas lvl v -> ((((((v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel 256) levels) table) datas) lvl) v))

# 91 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_drenderFieldTy = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__23) -> (match dtb__23 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__24, dtb__25, dtb__26) -> (match ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotIn mc0) dtb__25) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__27) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__27)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (mc5)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (mc5 + 1) }
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> (match ((v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsic dtb__28) ((Base_dData_dList.v_Base_dData_dList_dmap (fun x -> (((((v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel 256) mc0) mc1) mc2) x))) dtb__29)) with
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

# 110 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn = (fun mc0 mc1 -> (if mc0 then (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)) else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased mc1)))

# 115 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__45 } -> (if ((v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn dtb__38) dtb__45) then (match mc7 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> ((fun next -> (if dtb__38 then (if dtb__40 then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) mc8)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__51; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__52 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque, dtb__51)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__52 }))
  | _ -> failwith "DT: impossible branch"
))) else (match ((((((v_Vuna_dCompiler_dLowering_dTy_drenderFieldTy mc0) mc1) mc2) mc6) dtb__49) mc8) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__53; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) dtb__54)) (fun p -> (match p with
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

# 139 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dctorArityNeed = (fun levels table datas c -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) datas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf datas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) - (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels)))))))

# 151 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (if (dtb__63 >= (v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn dtb__64)) then dtb__63 else (v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn dtb__64))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_ddataArityNeed = (fun levels table datas ctors -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((v_Vuna_dCompiler_dLowering_dTy_dctorArityNeed levels) table) datas)) ctors)) (fun ns -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels) + (v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn ns)))))))

# 170 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclOf = (fun table allDatas unboxed d -> ((fun levels -> ((fun arity -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dhasRecordRepr d) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (match dtb__66 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__65)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf allDatas) dtb__65)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__65)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__65))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields d), (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("record family must have exactly one constructor: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)))
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dTy_ddataArityNeed levels) table) allDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun fullArity -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun c -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags c)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf allDatas) c)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p) })))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d))) (fun ctors -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), fullArity, ctors)))))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__67) -> (match dtb__67 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__68; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__69 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys levels) table) allDatas) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__68)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf allDatas) dtb__68)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__68)) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__68))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (match dtb__71 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), arity, dtb__70))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__68)))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unboxed constructor does not have exactly one kept field: " ^ (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__68)))
)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) unboxed))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlistLength levels))) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn table) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))))

# 164 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, dtb__73) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dTy_dtyDeclOf mc0) mc1) mc2) dtb__72)) (fun decl -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo mc0) mc1) mc2) dtb__73)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (decl, tail))))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclsOf = (fun tyParams unboxed allDatas subset -> ((((v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo tyParams) allDatas) unboxed) subset))

# 193 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclTys = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrUnboxedDecl (dtb__74, dtb__75, dtb__76) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrRecordDecl (dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__80
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTyDecl_IrVariantDecl (dtb__81, dtb__82, dtb__83) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) dtb__83)
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__84, dtb__85) -> ((v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames dtb__85) ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__84) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 206 "Vuna/Compiler/Lowering/Ty.vuna"
and v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyData (dtb__86, dtb__87) -> ((v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames dtb__87) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dpushDep dtb__86) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFun (dtb__88, dtb__89) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__89) ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__88) mc1))
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyRef (dtb__90) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__90) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyArray (dtb__91) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto dtb__91) mc1)
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyOpaque -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyFloat -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyBool -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyStr -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyInt -> mc1
  | Vuna_dCompiler_dIr_dModel.C_Vuna_dCompiler_dIr_dModel_dIrTy_IrTyVar (dtb__92) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__93, dtb__94) -> ((v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo dtb__94) ((v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames dtb__93) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Lowering/Ty.vuna"
let v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefs = (fun decls -> ((v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLowering_dTy_dtyDeclTys) decls)) Base_dData_dList.C_Base_dData_dList_dList_Nil))
