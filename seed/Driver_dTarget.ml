open Vuna_runtime
# 32 "Vuna/Compiler/Driver/Target.vuna"
let v_backendBinaryName = (fun (target : string) -> ("vuna-target-" ^ target))

# 42 "Vuna/Compiler/Driver/Target.vuna"
let v_dropLast = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> (B_dData_dList.v_reverse ((B_dData_dList.v_drop 1) (B_dData_dList.v_reverse mc0)))
))

# 46 "Vuna/Compiler/Driver/Target.vuna"
let v_joinPathSlash = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> "/"
  | _ -> ((B_dData_dString.v_join "/") mc0)
))

# 36 "Vuna/Compiler/Driver/Target.vuna"
let v_dirOf = (fun (path : string) -> (match ((B_dData_dString.v_split "/") path) with
  | B_dData_dList.C_List_Nil -> "."
  | dtb__0 -> (v_joinPathSlash (v_dropLast dtb__0))
))

# 58 "Vuna/Compiler/Driver/Target.vuna"
let v_execDirs = (fun (s : string) -> (if (s = "") then B_dData_dList.C_List_Nil else ((B_dData_dString.v_split ":") s)))

# 111 "Vuna/Compiler/Driver/Target.vuna"
let rec v_isDurationTextGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : bool) (mc2 : bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (if (if (dtb__1 >= 48) then (dtb__1 <= 57) else false) then (((v_isDurationTextGo dtb__2) true) mc2) else (if (if (dtb__1 = 46) then (B_dData_dBool.v_not mc2) else false) then (((v_isDurationTextGo dtb__2) mc1) true) else false))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Driver/Target.vuna"
let v_isDurationText = (fun (s : string) -> (if (s = "") then false else (((v_isDurationTextGo (B_dData_dList.dtp_unpack s)) false) false)))

# 101 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginTimeoutEff = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_PLUGIN_TIMEOUT")) (fun env -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if (v_isDurationText env) then env else "300")))))

# 119 "Vuna/Compiler/Driver/Target.vuna"
let v_hasTimeoutCmd = (fun (nProcess : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("-c", (B_dData_dList.C_List__x58__x58_ ("command -v timeout >/dev/null 2>&1", B_dData_dList.C_List_Nil)))))))) (fun code -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (code = 0)))))

# 125 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginTimedOutDiag = (fun (target : string) (duration : string) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend `"; (v_backendBinaryName target); "` timed out after "; duration; "s (raise or disable with VUNA_PLUGIN_TIMEOUT)"])))

# 140 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginTimedOutPath = (fun (outDir : string) (target : string) -> (String.concat "" [outDir; "/.vuna-plugin-timeout-"; target]))

# 186 "Vuna/Compiler/Driver/Target.vuna"
let v_decodedDiags = (fun (payload : string) -> (match (Base_dDiag_dCodec.v_decDiagnostics payload) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> dtb__3
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Driver/Target.vuna"
let v_firstDiagOr = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (mc1 : string) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend `"; (v_backendBinaryName mc1); "` failed with exit code "; (string_of_int mc2)]))
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Driver/Target.vuna"
let v_missingBackendDiag = (fun (target : string) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend plugin `"; (v_backendBinaryName target); "` is not installed (expected next to `vuna`)"])))

# 212 "Vuna/Compiler/Driver/Target.vuna"
let v_splitNames = (fun (payload : string) -> ((B_dData_dList.v_filter (fun (s : string) -> (s <> ""))) ((B_dData_dString.v_split "\n") payload)))

# 215 "Vuna/Compiler/Driver/Target.vuna"
let v_backendPath = (fun (dir : string) (target : string) -> (String.concat "" [dir; "/"; (v_backendBinaryName target)]))

# 61 "Vuna/Compiler/Driver/Target.vuna"
let rec v_searchBackend = (fun (nEnv : string) (nFs : string) (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (if (dtb__6 = "") then ((((v_searchBackend nEnv) nFs) dtb__7) mc1) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_backendPath dtb__6) mc1))) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (((v_backendPath dtb__6) mc1)))) else ((((v_searchBackend nEnv) nFs) dtb__7) mc1)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Driver/Target.vuna"
let v_findBackend = (fun (nEnv : string) (nFs : string) (target : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_EXEC_PATH")) (fun execEnv -> ((((v_searchBackend nEnv) nFs) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_dirOf exe), B_dData_dList.C_List_Nil))) (v_execDirs execEnv))) target))))))

# 218 "Vuna/Compiler/Driver/Target.vuna"
let v_irPathOf = (fun (outDir : string) (target : string) -> (String.concat "" [outDir; "/.vuna-ir-"; target]))

# 221 "Vuna/Compiler/Driver/Target.vuna"
let v_diagPathOf = (fun (outDir : string) (target : string) -> (String.concat "" [outDir; "/.vuna-diag-"; target]))

# 224 "Vuna/Compiler/Driver/Target.vuna"
let v_filesPathOf = (fun (outDir : string) (target : string) -> (String.concat "" [outDir; "/.vuna-files-"; target]))

# 134 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginArgv = (fun (bin : string) (target : string) (outDir : string) (printResult : bool) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (bin, (B_dData_dList.C_List__x58__x58_ ("--ir", (B_dData_dList.C_List__x58__x58_ (((v_irPathOf outDir) target), (B_dData_dList.C_List__x58__x58_ ("--out", (B_dData_dList.C_List__x58__x58_ (outDir, (B_dData_dList.C_List__x58__x58_ ("--diag", (B_dData_dList.C_List__x58__x58_ (((v_diagPathOf outDir) target), (B_dData_dList.C_List__x58__x58_ ("--files", (B_dData_dList.C_List__x58__x58_ (((v_filesPathOf outDir) target), B_dData_dList.C_List_Nil))))))))))))))))))) (if printResult then (B_dData_dList.C_List__x58__x58_ ("--print", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)))

# 146 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginRunArgv = (fun (bin : string) (target : string) (outDir : string) (duration : string) (printResult : bool) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("-c", (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["timeout -s KILL "; duration; "s \"$@\"\ncode=$?\nif [ $code -eq 137 ] || [ $code -eq 124 ]; then printf timeout > \""; ((v_pluginTimedOutPath outDir) target); "\"; fi\nexit $code\n"]), (B_dData_dList.C_List__x58__x58_ ("sh", B_dData_dList.C_List_Nil))))))))) ((((v_pluginArgv bin) target) outDir) printResult)))

# 153 "Vuna/Compiler/Driver/Target.vuna"
let v_runBackend = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (bin : string) (irText : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) ((v_irPathOf outDir) target)) irText)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_pluginTimeoutEff nEnv)) (fun duration -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if (duration = "0") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false) else (v_hasTimeoutCmd nProcess))) (fun hasTimeout -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_pluginTimedOutPath outDir) target))) (fun stale -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if stale then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_pluginTimedOutPath outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasTimeout then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_pluginRunArgv bin) target) outDir) duration) printResult)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_pluginArgv bin) target) outDir) printResult)))) (fun argv -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") argv)) (fun code -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasTimeout then ((B_dEffect_dFs.v_fsFileExists nFs) ((v_pluginTimedOutPath outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))) (fun timedOut -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if timedOut then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_pluginTimedOutPath outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_diagPathOf outDir) target))) (fun hasDiag -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasDiag then ((B_dEffect_dFs.v_fsReadFile nFs) ((v_diagPathOf outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun payload -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_filesPathOf outDir) target))) (fun hasFiles -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasFiles then ((B_dEffect_dFs.v_fsReadFile nFs) ((v_filesPathOf outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun filesPayload -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_irPathOf outDir) target))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasFiles then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_filesPathOf outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if hasDiag then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_diagPathOf outDir) target)) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) (fun _u -> (if timedOut then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (((v_pluginTimedOutDiag target) duration)))) else (if (code = 0) then (let names = (v_splitNames filesPayload) in (let diags = (v_decodedDiags payload) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = names; B_dData_dPair.f_Pair_second = diags }))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC ((((v_firstDiagOr (v_decodedDiags payload)) target) code)))))))))))))))))))))))))))))))))))))))

# 95 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatchWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (bin : string) (program : Vuna_dIr_dModel.t_IrProgram) (printResult : bool) (outDir : string) -> ((((((((v_runBackend nFs) nEnv) nProcess) target) bin) (Vuna_dIr_dCodec.v_encodeProgram program)) printResult) outDir))

# 86 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatch = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (program : Vuna_dIr_dModel.t_IrProgram) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_findBackend nEnv) nFs) target)) (fun backend -> (match backend with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC ((v_missingBackendDiag target))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> ((((((((v_dispatchWith nFs) nEnv) nProcess) target) dtb__8) program) printResult) outDir)
  | _ -> failwith "DT: impossible branch"
))))

# 72 "Vuna/Compiler/Driver/Target.vuna"
let v_compileBackend = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (target : string) (entry : string) (printResult : bool) (outDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__9) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__9)))
  | Base_dDiag.C_Check_OkC (dtb__10) -> (let pkg = (B_dData_dPair.v_secondOf dtb__10) in (match (((Lowering_dProgram.v_lowerProgramCheckedOf ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDatas) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDefs) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgGlobals) with
  | Base_dDiag.C_Check_ErrC (dtb__11) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__11)))
  | Base_dDiag.C_Check_OkC (dtb__12) -> (((((((v_dispatch nFs) nEnv) nProcess) target) dtb__12) printResult) outDir)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
