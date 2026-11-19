open Vuna_runtime
# 29 "Vuna/Compiler/Driver/Native.vuna"
let v_nativeErrDiag = (fun (err : Native_dModel.t_NativeErr) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (Native_dModel.v_nativeErrText err)))

# 32 "Vuna/Compiler/Driver/Native.vuna"
let rec v_dropLast = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__0, (v_dropLast dtb__1)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Driver/Native.vuna"
let v_parentDirOf = (fun (path : string) -> ((fun parts -> (match (v_dropLast parts) with
  | B_dData_dList.C_List_Nil -> "."
  | dtb__2 -> ((B_dData_dString.v_join "/") dtb__2)
)) ((B_dData_dString.v_split "/") path)))

# 45 "Vuna/Compiler/Driver/Native.vuna"
let rec v_writeFiles = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) (v_parentDirOf (String.concat "" [mc0; "/"; (B_dData_dPair.v_firstOf dtb__3)])))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (String.concat "" [mc0; "/"; (B_dData_dPair.v_firstOf dtb__3)])) (B_dData_dPair.v_secondOf dtb__3))) (fun _u -> ((((v_writeFiles nFs) nProcess) mc0) dtb__4)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Driver/Native.vuna"
let v_compileNative = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__5) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__5)))
  | Base_dDiag.C_Check_OkC (dtb__6) -> ((fun pkg -> (match (((Lowering_dProgram.v_lowerProgramOf ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDatas) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDefs) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgGlobals) with
  | Base_dDiag.C_Check_ErrC (dtb__7) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__7)))
  | Base_dDiag.C_Check_OkC (dtb__8) -> (match ((Native_dModule.v_build dtb__8) printResult) with
  | Native_dModel.C_NativeOutcome_NativeRejected (dtb__9) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC ((v_nativeErrDiag dtb__9))))
  | Native_dModel.C_NativeOutcome_NativeOk (dtb__10) -> ((fun files -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_writeFiles nFs) nProcess) outDir) files)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map B_dData_dPair.v_firstOf) files))))))) (Native_dRender.v_renderFiles dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (B_dData_dPair.v_secondOf dtb__6))
  | _ -> failwith "DT: impossible branch"
))))))
