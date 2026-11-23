open Vuna_runtime
# 33 "Vuna/Compiler/Driver/Target.vuna"
let v_backendBinaryName = (fun (target : string) -> ("vuna-target-" ^ target))

# 43 "Vuna/Compiler/Driver/Target.vuna"
let v_dropLast = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> (B_dData_dList.v_reverse ((B_dData_dList.v_drop 1) (B_dData_dList.v_reverse mc0)))
))

# 47 "Vuna/Compiler/Driver/Target.vuna"
let v_joinPathSlash = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> "/"
  | _ -> ((B_dData_dString.v_join "/") mc0)
))

# 37 "Vuna/Compiler/Driver/Target.vuna"
let v_dirOf = (fun (path : string) -> (match ((B_dData_dString.v_split "/") path) with
  | B_dData_dList.C_List_Nil -> "."
  | dtb__0 -> (v_joinPathSlash (v_dropLast dtb__0))
))

# 59 "Vuna/Compiler/Driver/Target.vuna"
let v_execDirs = (fun (s : string) -> (if (s = "") then B_dData_dList.C_List_Nil else ((B_dData_dString.v_split ":") s)))

# 143 "Vuna/Compiler/Driver/Target.vuna"
let v_decodedDiags = (fun (payload : string) -> (match (Base_dDiag_dCodec.v_decDiagnostics payload) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> dtb__1
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Driver/Target.vuna"
let v_firstDiagOr = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (mc1 : string) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend `"; (v_backendBinaryName mc1); "` failed with exit code "; (bi_strFromInt mc2)]))
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> dtb__2
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Driver/Target.vuna"
let v_missingBackendDiag = (fun (target : string) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend plugin `"; (v_backendBinaryName target); "` is not installed (expected next to `vuna`)"])))

# 169 "Vuna/Compiler/Driver/Target.vuna"
let v_splitNames = (fun (payload : string) -> ((B_dData_dList.v_filter (fun (s : string) -> (s <> ""))) ((B_dData_dString.v_split "\n") payload)))

# 172 "Vuna/Compiler/Driver/Target.vuna"
let v_backendPath = (fun (dir : string) (target : string) -> (String.concat "" [dir; "/"; (v_backendBinaryName target)]))

# 62 "Vuna/Compiler/Driver/Target.vuna"
let rec v_searchBackend = (fun (nEnv : string) (nFs : string) (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (if (dtb__4 = "") then ((((v_searchBackend nEnv) nFs) dtb__5) mc1) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_backendPath dtb__4) mc1))) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (((v_backendPath dtb__4) mc1)))) else ((((v_searchBackend nEnv) nFs) dtb__5) mc1)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Driver/Target.vuna"
let v_findBackend = (fun (nEnv : string) (nFs : string) (target : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_EXEC_PATH")) (fun execEnv -> ((((v_searchBackend nEnv) nFs) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_dirOf exe), B_dData_dList.C_List_Nil))) (v_execDirs execEnv))) target))))))

# 175 "Vuna/Compiler/Driver/Target.vuna"
let v_irPathOf = (fun (outDir : string) (target : string) -> (String.concat "" [outDir; "/.vuna-ir-"; target]))

# 178 "Vuna/Compiler/Driver/Target.vuna"
let v_diagPathOf = (fun (outDir : string) (target : string) -> (String.concat "" [outDir; "/.vuna-diag-"; target]))

# 181 "Vuna/Compiler/Driver/Target.vuna"
let v_filesPathOf = (fun (outDir : string) (target : string) -> (String.concat "" [outDir; "/.vuna-files-"; target]))

# 116 "Vuna/Compiler/Driver/Target.vuna"
let v_runBackend = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (bin : string) (key : string) (irText : string) (irHash : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Target") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Target") ("target-cache=miss " ^ target)) else 0))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) ((v_irPathOf outDir) target)) irText)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (bin, (B_dData_dList.C_List__x58__x58_ ("--ir", (B_dData_dList.C_List__x58__x58_ (((v_irPathOf outDir) target), (B_dData_dList.C_List__x58__x58_ ("--out", (B_dData_dList.C_List__x58__x58_ (outDir, (B_dData_dList.C_List__x58__x58_ ("--diag", (B_dData_dList.C_List__x58__x58_ (((v_diagPathOf outDir) target), (B_dData_dList.C_List__x58__x58_ ("--files", (B_dData_dList.C_List__x58__x58_ (((v_filesPathOf outDir) target), B_dData_dList.C_List_Nil))))))))))))))))))) (if printResult then (B_dData_dList.C_List__x58__x58_ ("--print", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)))) (fun code -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_diagPathOf outDir) target))) (fun hasDiag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasDiag then ((B_dEffect_dFs.v_fsReadFile nFs) ((v_diagPathOf outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun payload -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_filesPathOf outDir) target))) (fun hasFiles -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasFiles then ((B_dEffect_dFs.v_fsReadFile nFs) ((v_filesPathOf outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun filesPayload -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_irPathOf outDir) target))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasFiles then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_filesPathOf outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasDiag then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_diagPathOf outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) (fun _u -> (if (code = 0) then (let names = (v_splitNames filesPayload) in (let diags = (v_decodedDiags payload) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Driver_dTargetCache.v_readProducedEff nFs) outDir) names)) (fun contents -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Driver_dTargetCache.v_writeOutputsEff nFs) nEnv) nProcess) key) contents) diags)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = names; B_dData_dPair.f_Pair_second = diags }))))))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC ((((v_firstDiagOr (v_decodedDiags payload)) target) code))))))))))))))))))))))))))

# 96 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatchWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (bin : string) (program : Vuna_dIr_dModel.t_IrProgram) (printResult : bool) (outDir : string) -> (let irText = (Vuna_dIr_dCodec.v_encodeProgram program) in (let irHash = (Driver_dTargetCache.v_irHashOf irText) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Driver_dTargetCache.v_backendVersionEff nFs) bin)) (fun version -> (let key = ((((Driver_dTargetCache.v_outputsKeyOf target) version) irHash) printResult) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Driver_dTargetCache.v_readOutputsEff nFs) nEnv) nProcess) key)) (fun cached -> (let nd_uscrut17 = cached in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((v_runBackend nFs) nEnv) nProcess) target) bin) key) irText) irHash) printResult) outDir)
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (match dtb__6 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Target") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Target") ("target-cache=hit " ^ target)) else 0))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dTargetCache.v_materializeEff nFs) nEnv) nProcess) outDir) dtb__7)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__7); B_dData_dPair.f_Pair_second = dtb__8 })))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))

# 87 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatch = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (program : Vuna_dIr_dModel.t_IrProgram) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_findBackend nEnv) nFs) target)) (fun backend -> (match backend with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC ((v_missingBackendDiag target))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> ((((((((v_dispatchWith nFs) nEnv) nProcess) target) dtb__9) program) printResult) outDir)
  | _ -> failwith "DT: impossible branch"
))))

# 73 "Vuna/Compiler/Driver/Target.vuna"
let v_compileBackend = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (target : string) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__10) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__10)))
  | Base_dDiag.C_Check_OkC (dtb__11) -> (let pkg = (B_dData_dPair.v_secondOf dtb__11) in (match (((Lowering_dProgram.v_lowerProgramCheckedOf ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDatas) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDefs) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgGlobals) with
  | Base_dDiag.C_Check_ErrC (dtb__12) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__12)))
  | Base_dDiag.C_Check_OkC (dtb__13) -> (((((((v_dispatch nFs) nEnv) nProcess) target) dtb__13) printResult) outDir)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
