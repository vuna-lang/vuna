open Vuna_runtime
# 28 "Vuna/Compiler/Driver/Wasm.vuna"
let v_wasmErrDiag = (fun (err : Wasm_dModel.t_WasmErr) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (Wasm_dModel.v_wasmErrText err)))

# 47 "Vuna/Compiler/Driver/Wasm.vuna"
let v_isUnavailable = (fun (mc0 : Base_dCapabilities.t_Capability) -> (match mc0 with
  | Base_dCapabilities.C_Capability_CapAvailable -> false
  | Base_dCapabilities.C_Capability_CapUnavailable -> true
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Driver/Wasm.vuna"
let rec v_capWarnings = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (v_isUnavailable ((Base_dCapabilities.v_capabilityOf mc0) dtb__0)) then (B_dData_dList.C_List__x58__x58_ (((Base_dDiagnostics_dWarning.v_targetEffectWarn mc0) dtb__0), ((v_capWarnings mc0) dtb__1))) else ((v_capWarnings mc0) dtb__1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Driver/Wasm.vuna"
let v_entryCapabilityWarnings = (fun (target : string) (program : Ir_dModel.t_IrProgram) -> (match ((program).Ir_dModel.f_IrProgram_irProgUnit).Ir_dModel.f_IrUnit_irUnitEntry with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> ((v_capWarnings target) (dtb__2).Ir_dModel.f_IrEntry_irEntryRowTags)
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Driver/Wasm.vuna"
let v_compileWasm = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__3) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__3)))
  | Base_dDiag.C_Check_OkC (dtb__4) -> ((fun pkg -> (match (((Lowering_dProgram.v_lowerProgramOf ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDatas) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDefs) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgGlobals) with
  | Base_dDiag.C_Check_ErrC (dtb__5) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__5)))
  | Base_dDiag.C_Check_OkC (dtb__6) -> (match ((Wasm_dModule.v_build dtb__6) printResult) with
  | Wasm_dModule.C_WasmOutcome_WasmRejected (dtb__7) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC ((v_wasmErrDiag dtb__7))))
  | Wasm_dModule.C_WasmOutcome_WasmOk (dtb__8) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (outDir ^ "/main.wat")) (Wasm_dRender.v_renderModule dtb__8))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = ((v_entryCapabilityWarnings "wasm") dtb__6) })))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (B_dData_dPair.v_secondOf dtb__4))
  | _ -> failwith "DT: impossible branch"
))))))
