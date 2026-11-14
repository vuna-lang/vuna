open Vuna_runtime
# 23 "Vuna/Compiler/Driver/Wasm.vuna"
let v_Vuna_dCompiler_dDriver_dWasm_dwasmErrDiag = (fun err -> (((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagNoLoc Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhCodegen) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatCodegen) "") (Vuna_dCompiler_dWasm_dModel.v_Vuna_dCompiler_dWasm_dModel_dwasmErrText err)))

# 26 "Vuna/Compiler/Driver/Wasm.vuna"
let v_Vuna_dCompiler_dDriver_dWasm_dcompileWasm = (fun ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath outDir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts ctx) entry)) (fun checked -> (match checked with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1) -> ((fun pkg -> (match ((Vuna_dCompiler_dCodegen_dLower.v_Vuna_dCompiler_dCodegen_dLower_dlowerProgramOf ((pkg).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas) ((pkg).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__3) -> (match ((Vuna_dCompiler_dWasm_dModule.v_Vuna_dCompiler_dWasm_dModule_dbuild dtb__3) printResult) with
  | Vuna_dCompiler_dWasm_dModule.C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmRejected (dtb__4) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((v_Vuna_dCompiler_dDriver_dWasm_dwasmErrDiag dtb__4))))
  | Vuna_dCompiler_dWasm_dModule.C_Vuna_dCompiler_dWasm_dModule_dWasmOutcome_WasmOk (dtb__5) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) (outDir ^ "/main.wat")) (Vuna_dCompiler_dWasm_dRender.v_Vuna_dCompiler_dWasm_dRender_drenderModule dtb__5)))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (1)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dsecondOf dtb__1))
  | _ -> failwith "DT: impossible branch"
))))))
