open Vuna_runtime
# 29 "Vuna/Compiler/Driver/Native.vuna"
let v_Vuna_dCompiler_dDriver_dNative_dnativeErrDiag = (fun err -> (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhCodegen) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatCodegen) "") (Vuna_dCompiler_dNative_dModel.v_Vuna_dCompiler_dNative_dModel_dnativeErrText err)))

# 32 "Vuna/Compiler/Driver/Native.vuna"
let rec v_Vuna_dCompiler_dDriver_dNative_ddropLast = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, (v_Vuna_dCompiler_dDriver_dNative_ddropLast dtb__1)))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Driver/Native.vuna"
let v_Vuna_dCompiler_dDriver_dNative_dparentDirOf = (fun path -> ((fun parts -> (match (v_Vuna_dCompiler_dDriver_dNative_ddropLast parts) with
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | dtb__2 -> ((Base_dString.v_Base_dString_djoin "/") dtb__2)
)) ((Base_dString.v_Base_dString_dsplit "/") path)))

# 45 "Vuna/Compiler/Driver/Native.vuna"
let rec v_Vuna_dCompiler_dDriver_dNative_dwriteFiles = (fun nFs nProcess mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) (v_Vuna_dCompiler_dDriver_dNative_dparentDirOf (String.concat "" [mc0; "/"; (Base_dPair.v_Base_dPair_dfirstOf dtb__3)])))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) (String.concat "" [mc0; "/"; (Base_dPair.v_Base_dPair_dfirstOf dtb__3)])) (Base_dPair.v_Base_dPair_dsecondOf dtb__3))) (fun _u -> ((((v_Vuna_dCompiler_dDriver_dNative_dwriteFiles nFs) nProcess) mc0) dtb__4)))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Driver/Native.vuna"
let v_Vuna_dCompiler_dDriver_dNative_dcompileNative = (fun nFs nEnv nProcess ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) outDir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun checked -> (match checked with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__5) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__5)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__6) -> ((fun pkg -> (match ((Vuna_dCompiler_dLowering_dProgram.v_Vuna_dCompiler_dLowering_dProgram_dlowerProgramOf ((pkg).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas) ((pkg).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__7) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__7)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__8) -> (match ((Vuna_dCompiler_dNative_dModule.v_Vuna_dCompiler_dNative_dModule_dbuild dtb__8) printResult) with
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeRejected (dtb__9) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((v_Vuna_dCompiler_dDriver_dNative_dnativeErrDiag dtb__9))))
  | Vuna_dCompiler_dNative_dModel.C_Vuna_dCompiler_dNative_dModel_dNativeOutcome_NativeOk (dtb__10) -> ((fun files -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dNative_dwriteFiles nFs) nProcess) outDir) files)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) files))))))) (Vuna_dCompiler_dNative_dRender.v_Vuna_dCompiler_dNative_dRender_drenderFiles dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dsecondOf dtb__6))
  | _ -> failwith "DT: impossible branch"
))))))
