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
let v_pluginTimeoutEff = (fun (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__3 = Obj.obj (e) in (let dtb__4 = Obj.obj ((k (dtb__3 u))) in (dtb__4 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_PLUGIN_TIMEOUT")) (fun env -> (let x = (if (v_isDurationText env) then env else "300") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 119 "Vuna/Compiler/Driver/Target.vuna"
let v_hasTimeoutCmd = (fun (nProcess : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__5 = Obj.obj (e) in (let dtb__6 = Obj.obj ((k (dtb__5 u))) in (dtb__6 u)))))) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("-c", (B_dData_dList.C_List__x58__x58_ ("command -v timeout >/dev/null 2>&1", B_dData_dList.C_List_Nil)))))))) (fun code -> (let x = (code = 0) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 125 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginTimedOutDiag = (fun (target : string) (duration : string) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend `"; (v_backendBinaryName target); "` timed out after "; duration; "s (raise or disable with VUNA_PLUGIN_TIMEOUT)"])))

# 140 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginTimedOutPath = (fun (outDir : string) (target : string) -> (String.concat "" [outDir; "/.vuna-plugin-timeout-"; target]))

# 186 "Vuna/Compiler/Driver/Target.vuna"
let v_decodedDiags = (fun (payload : string) -> (match (Base_dDiag_dCodec.v_decDiagnostics payload) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> dtb__7
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Driver/Target.vuna"
let v_firstDiagOr = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (mc1 : string) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend `"; (v_backendBinaryName mc1); "` failed with exit code "; (string_of_int mc2)]))
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> dtb__8
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
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (if (dtb__10 = "") then ((((v_searchBackend nEnv) nFs) dtb__11) mc1) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__12 = Obj.obj (e) in (let dtb__13 = Obj.obj ((k (dtb__12 u))) in (dtb__13 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_backendPath dtb__10) mc1))) (fun exists -> (if exists then (let x = (B_dData_dMaybe.C_Maybe_Just (((v_backendPath dtb__10) mc1))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else ((((v_searchBackend nEnv) nFs) dtb__11) mc1)))))
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Driver/Target.vuna"
let v_findBackend = (fun (nEnv : string) (nFs : string) (target : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__14 = Obj.obj (e) in (let dtb__15 = Obj.obj ((k (dtb__14 u))) in (dtb__15 u)))))) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__16 = Obj.obj (e) in (let dtb__17 = Obj.obj ((k (dtb__16 u))) in (dtb__17 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_EXEC_PATH")) (fun execEnv -> ((((v_searchBackend nEnv) nFs) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_dirOf exe), B_dData_dList.C_List_Nil))) (v_execDirs execEnv))) target))))))

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
let v_runBackend = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (bin : string) (irText : string) (printResult : bool) (outDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__18 = Obj.obj (e) in (let dtb__19 = Obj.obj ((k (dtb__18 u))) in (dtb__19 u)))))) (((B_dEffect_dFs.v_fsWriteFile nFs) ((v_irPathOf outDir) target)) irText)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__20 = Obj.obj (e) in (let dtb__21 = Obj.obj ((k (dtb__20 u))) in (dtb__21 u)))))) (v_pluginTimeoutEff nEnv)) (fun duration -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__22 = Obj.obj (e) in (let dtb__23 = Obj.obj ((k (dtb__22 u))) in (dtb__23 u)))))) (if (duration = "0") then (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (v_hasTimeoutCmd nProcess))) (fun hasTimeout -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__24 = Obj.obj (e) in (let dtb__25 = Obj.obj ((k (dtb__24 u))) in (dtb__25 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_pluginTimedOutPath outDir) target))) (fun stale -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__26 = Obj.obj (e) in (let dtb__27 = Obj.obj ((k (dtb__26 u))) in (dtb__27 u)))))) (if stale then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_pluginTimedOutPath outDir) target)) else (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__28 = Obj.obj (e) in (let dtb__29 = Obj.obj ((k (dtb__28 u))) in (dtb__29 u)))))) (if hasTimeout then (let x = (((((v_pluginRunArgv bin) target) outDir) duration) printResult) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let x = ((((v_pluginArgv bin) target) outDir) printResult) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun argv -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__30 = Obj.obj (e) in (let dtb__31 = Obj.obj ((k (dtb__30 u))) in (dtb__31 u)))))) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") argv)) (fun code -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__32 = Obj.obj (e) in (let dtb__33 = Obj.obj ((k (dtb__32 u))) in (dtb__33 u)))))) (if hasTimeout then ((B_dEffect_dFs.v_fsFileExists nFs) ((v_pluginTimedOutPath outDir) target)) else (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun timedOut -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__34 = Obj.obj (e) in (let dtb__35 = Obj.obj ((k (dtb__34 u))) in (dtb__35 u)))))) (if timedOut then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_pluginTimedOutPath outDir) target)) else (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__36 = Obj.obj (e) in (let dtb__37 = Obj.obj ((k (dtb__36 u))) in (dtb__37 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_diagPathOf outDir) target))) (fun hasDiag -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__38 = Obj.obj (e) in (let dtb__39 = Obj.obj ((k (dtb__38 u))) in (dtb__39 u)))))) (if hasDiag then ((B_dEffect_dFs.v_fsReadFile nFs) ((v_diagPathOf outDir) target)) else (let x = "" in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun payload -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__40 = Obj.obj (e) in (let dtb__41 = Obj.obj ((k (dtb__40 u))) in (dtb__41 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) ((v_filesPathOf outDir) target))) (fun hasFiles -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__42 = Obj.obj (e) in (let dtb__43 = Obj.obj ((k (dtb__42 u))) in (dtb__43 u)))))) (if hasFiles then ((B_dEffect_dFs.v_fsReadFile nFs) ((v_filesPathOf outDir) target)) else (let x = "" in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun filesPayload -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__44 = Obj.obj (e) in (let dtb__45 = Obj.obj ((k (dtb__44 u))) in (dtb__45 u)))))) ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_irPathOf outDir) target))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__46 = Obj.obj (e) in (let dtb__47 = Obj.obj ((k (dtb__46 u))) in (dtb__47 u)))))) (if hasFiles then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_filesPathOf outDir) target)) else (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__48 = Obj.obj (e) in (let dtb__49 = Obj.obj ((k (dtb__48 u))) in (dtb__49 u)))))) (if hasDiag then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_diagPathOf outDir) target)) else (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun _u -> (if timedOut then (let x = (Base_dDiag.C_Check_ErrC (((v_pluginTimedOutDiag target) duration))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (code = 0) then (let names = (v_splitNames filesPayload) in (let diags = (v_decodedDiags payload) in (let x = (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = names; B_dData_dPair.f_Pair_second = diags })) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = (Base_dDiag.C_Check_ErrC ((((v_firstDiagOr (v_decodedDiags payload)) target) code))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))))))))))))))))))))))))))))

# 95 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatchWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (bin : string) (program : Vuna_dIr_dModel.t_IrProgram) (printResult : bool) (outDir : string) -> ((((((((v_runBackend nFs) nEnv) nProcess) target) bin) (Vuna_dIr_dCodec.v_encodeProgram program)) printResult) outDir))

# 86 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatch = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (program : Vuna_dIr_dModel.t_IrProgram) (printResult : bool) (outDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__50 = Obj.obj (e) in (let dtb__51 = Obj.obj ((k (dtb__50 u))) in (dtb__51 u)))))) (((v_findBackend nEnv) nFs) target)) (fun backend -> (match backend with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = (Base_dDiag.C_Check_ErrC ((v_missingBackendDiag target))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> ((((((((v_dispatchWith nFs) nEnv) nProcess) target) dtb__52) program) printResult) outDir)
  | _ -> failwith "DT: impossible branch"
))))

# 72 "Vuna/Compiler/Driver/Target.vuna"
let v_compileBackend = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (target : string) (entry : string) (printResult : bool) (outDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__53 = Obj.obj (e) in (let dtb__54 = Obj.obj ((k (dtb__53 u))) in (dtb__54 u)))))) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) outDir)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__55 = Obj.obj (e) in (let dtb__56 = Obj.obj ((k (dtb__55 u))) in (dtb__56 u)))))) (((((Driver_dDt.v_dtCheckWithProgramParts nFs) nEnv) nProcess) ctx) entry)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__57) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__57)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__58) -> (let pkg = (B_dData_dPair.v_secondOf dtb__58) in (match (((Lowering_dProgram.v_lowerProgramCheckedOf ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDatas) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDefs) ((pkg).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgGlobals) with
  | Base_dDiag.C_Check_ErrC (dtb__59) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__59)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__60) -> (((((((v_dispatch nFs) nEnv) nProcess) target) dtb__60) printResult) outDir)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
