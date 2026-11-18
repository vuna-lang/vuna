open Vuna_runtime
# 29 "Vuna/Compiler/Driver/Native.vuna"
let v_Vuna_dCompiler_dDriver_dNative_dnativeErrDiag = (fun err -> (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhCodegen) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatCodegen) "") (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dnativeErrText err)))

# 32 "Vuna/Compiler/Driver/Native.vuna"
let rec v_Vuna_dCompiler_dDriver_dNative_ddropLast = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, (v_Vuna_dCompiler_dDriver_dNative_ddropLast dtb__1)))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Driver/Native.vuna"
let v_Vuna_dCompiler_dDriver_dNative_dparentDirOf = (fun path -> ((fun parts -> (match (v_Vuna_dCompiler_dDriver_dNative_ddropLast parts) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> "."
  | dtb__2 -> ((Base_dData_dString.v_Base_dData_dString_djoin "/") dtb__2)
)) ((Base_dData_dString.v_Base_dData_dString_dsplit "/") path)))

# 45 "Vuna/Compiler/Driver/Native.vuna"
let rec v_Vuna_dCompiler_dDriver_dNative_dwriteFiles = (fun nFs nProcess (mc0 : string) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) (v_Vuna_dCompiler_dDriver_dNative_dparentDirOf (String.concat "" [mc0; "/"; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__3)])))) (fun _x64_vuna_x64_effK_u0_u0_u10_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFile nFs) (String.concat "" [mc0; "/"; (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__3)])) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__3))) (fun _x64_vuna_x64_effK_u0_u0_u11_x58__u -> ((((v_Vuna_dCompiler_dDriver_dNative_dwriteFiles nFs) nProcess) mc0) dtb__4)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Driver/Native.vuna"
let v_Vuna_dCompiler_dDriver_dNative_dcompileNative = (fun nFs nEnv nProcess ctx entry printResult outDir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) outDir)) (fun _x64_vuna_x64_effK_u0_u0_u11_x58__u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun _x64_vuna_x64_effK_u56_u5_u12_x58_checked -> (match _x64_vuna_x64_effK_u56_u5_u12_x58_checked with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__5) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__5)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__6) -> ((fun pkg -> (match ((Vuna_dCompiler_dLowering_dProgram.v_Vuna_dCompiler_dLowering_dProgram_dlowerProgramOf ((pkg).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas) ((pkg).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__7) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__7)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__8) -> (match ((Vuna_dCompiler_dNative_dModule.v_Vuna_dCompiler_dNative_dModule_dbuild dtb__8) printResult) with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected (dtb__9) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((v_Vuna_dCompiler_dDriver_dNative_dnativeErrDiag dtb__9))))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeOk (dtb__10) -> ((fun files -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dNative_dwriteFiles nFs) nProcess) outDir) files)) (fun _x64_vuna_x64_effK_u0_u0_u20_x58__u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) files))))))) (Vuna_dCompiler_dNative_dRender.v_Vuna_dCompiler_dNative_dRender_drenderFiles dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__6))
  | _ -> failwith "DT: impossible branch"
))))))
