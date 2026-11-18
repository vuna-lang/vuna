open Vuna_runtime
# 28 "Vuna/Compiler/Driver/Wasm.vuna"
let v_Vuna_dCompiler_dDriver_dWasm_dwasmErrDiag = (fun err -> (((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhCodegen) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatCodegen) "") (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwasmErrText err)))

# 45 "Vuna/Compiler/Driver/Wasm.vuna"
let v_Vuna_dCompiler_dDriver_dWasm_disUnavailable = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dBase_dCapabilities.C_Vuna_dCompiler_dBase_dCapabilities_dCapability_CapAvailable -> false
  | Vuna_dCompiler_dBase_dCapabilities.C_Vuna_dCompiler_dBase_dCapabilities_dCapability_CapUnavailable -> true
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Driver/Wasm.vuna"
let rec v_Vuna_dCompiler_dDriver_dWasm_dcapWarnings = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (v_Vuna_dCompiler_dDriver_dWasm_disUnavailable ((Vuna_dCompiler_dBase_dCapabilities.v_Vuna_dCompiler_dBase_dCapabilities_dcapabilityOf mc0) dtb__0)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Vuna_dCompiler_dBase_dDiagnostics_dWarning.v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dtargetEffectWarn mc0) dtb__0), ((v_Vuna_dCompiler_dDriver_dWasm_dcapWarnings mc0) dtb__1))) else ((v_Vuna_dCompiler_dDriver_dWasm_dcapWarnings mc0) dtb__1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Driver/Wasm.vuna"
let v_Vuna_dCompiler_dDriver_dWasm_dentryCapabilityWarnings = (fun target program -> (match ((program).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrProgram_irProgUnit).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrUnit_irUnitEntry with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__2) -> ((v_Vuna_dCompiler_dDriver_dWasm_dcapWarnings target) (dtb__2).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrEntry_irEntryRowTags)
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Driver/Wasm.vuna"
let v_Vuna_dCompiler_dDriver_dWasm_dcompileWasm = (fun nFs nEnv nProcess ctx entry printResult outDir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) outDir)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun checked -> (match checked with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__3) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__3)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__4) -> ((fun pkg -> (match ((Vuna_dCompiler_dLowering_dProgram.v_Vuna_dCompiler_dLowering_dProgram_dlowerProgramOf ((pkg).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas) ((pkg).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__5) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__5)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__6) -> (match ((Vuna_dCompiler_dWasm_dModule.v_Vuna_dCompiler_dWasm_dModule_dbuild dtb__6) printResult) with
  | Vuna_dCompiler_dWasm_dModule.C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected (dtb__7) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC ((v_Vuna_dCompiler_dDriver_dWasm_dwasmErrDiag dtb__7))))
  | Vuna_dCompiler_dWasm_dModule.C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmOk (dtb__8) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFile nFs) (outDir ^ "/main.wat")) (Vuna_dCompiler_dWasm_dRender.v_Vuna_dCompiler_dWasm_dRender_drenderModule dtb__8))) (fun _u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = 1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dWasm_dentryCapabilityWarnings "wasm") dtb__6) })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__4))
  | _ -> failwith "DT: impossible branch"
))))))
