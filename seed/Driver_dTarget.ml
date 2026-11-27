open Vuna_runtime
# 32 "Vuna/Compiler/Driver/Target.vuna"
let v_backendBinaryName = (fun (dtb_u_u1 : string) -> ("vuna-target-" ^ dtb_u_u1))

# 42 "Vuna/Compiler/Driver/Target.vuna"
let v_dropLast = (fun (dtb_u_u2 : string B_dData_dList.t_List) -> (match dtb_u_u2 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> (B_dData_dList.v_reverse ((B_dData_dList.v_drop 1) (B_dData_dList.v_reverse dtb_u_u2)))
))

# 46 "Vuna/Compiler/Driver/Target.vuna"
let v_joinPathSlash = (fun (dtb_u_u3 : string B_dData_dList.t_List) -> (match dtb_u_u3 with
  | B_dData_dList.C_List_Nil -> "/"
  | _ -> ((B_dData_dString.v_join "/") dtb_u_u3)
))

# 36 "Vuna/Compiler/Driver/Target.vuna"
let v_dirOf = (fun (dtb_u_u4 : string) -> (match ((B_dData_dString.v_split "/") dtb_u_u4) with
  | B_dData_dList.C_List_Nil -> "."
  | dtb_u_u5 -> (v_joinPathSlash (v_dropLast dtb_u_u5))
))

# 58 "Vuna/Compiler/Driver/Target.vuna"
let v_execDirs = (fun (dtb_u_u6 : string) -> (if (dtb_u_u6 = "") then B_dData_dList.C_List_Nil else ((B_dData_dString.v_split ":") dtb_u_u6)))

# 111 "Vuna/Compiler/Driver/Target.vuna"
let rec v_isDurationTextGo = (fun (dtb_u_u7 : int B_dData_dList.t_List) (dtb_u_u8 : bool) (dtb_u_u9 : bool) -> (match dtb_u_u7 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u10, dtb_u_u11) -> (if (if (dtb_u_u10 >= 48) then (dtb_u_u10 <= 57) else false) then (((v_isDurationTextGo dtb_u_u11) true) dtb_u_u9) else (if (if (dtb_u_u10 = 46) then (B_dData_dBool.v_not dtb_u_u9) else false) then (((v_isDurationTextGo dtb_u_u11) dtb_u_u8) true) else false))
  | B_dData_dList.C_List_Nil -> dtb_u_u8
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Driver/Target.vuna"
let v_isDurationText = (fun (dtb_u_u12 : string) -> (if (dtb_u_u12 = "") then false else (((v_isDurationTextGo (B_dData_dList.dtp_unpack dtb_u_u12)) false) false)))

# 101 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginTimeoutEff = (fun (dtb_u_u13 : string) -> (Obj.repr ((fun (dtb_u_u20 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u23 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u13) "VUNA_PLUGIN_TIMEOUT") dtb_u_u20) in (let dtb_u_u25 = (if (v_isDurationText dtb_u_u23) then dtb_u_u23 else "300") in dtb_u_u25))))))

# 101 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginTimeoutEff_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u23 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_PLUGIN_TIMEOUT") _u_ueffTok) in (let dtb_u_u25 = (if (v_isDurationText dtb_u_u23) then dtb_u_u23 else "300") in dtb_u_u25)))

# 119 "Vuna/Compiler/Driver/Target.vuna"
let v_hasTimeoutCmd = (fun (dtb_u_u27 : string) -> (Obj.repr ((fun (dtb_u_u34 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u37 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect dtb_u_u27) ".") (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("-c", (B_dData_dList.C_List__x58__x58_ ("command -v timeout >/dev/null 2>&1", B_dData_dList.C_List_Nil))))))) dtb_u_u34) in (let dtb_u_u39 = (dtb_u_u37 = 0) in dtb_u_u39))))))

# 119 "Vuna/Compiler/Driver/Target.vuna"
let v_hasTimeoutCmd_u_udirect = (fun (nProcess : string) _u_ueffTok -> (let dtb_u_u37 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect nProcess) ".") (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("-c", (B_dData_dList.C_List__x58__x58_ ("command -v timeout >/dev/null 2>&1", B_dData_dList.C_List_Nil))))))) _u_ueffTok) in (let dtb_u_u39 = (dtb_u_u37 = 0) in dtb_u_u39)))

# 125 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginTimedOutDiag = (fun (dtb_u_u41 : string) (dtb_u_u42 : string) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend `"; (v_backendBinaryName dtb_u_u41); "` timed out after "; dtb_u_u42; "s (raise or disable with VUNA_PLUGIN_TIMEOUT)"])))

# 140 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginTimedOutPath = (fun (dtb_u_u43 : string) (dtb_u_u44 : string) -> (String.concat "" [dtb_u_u43; "/.vuna-plugin-timeout-"; dtb_u_u44]))

# 186 "Vuna/Compiler/Driver/Target.vuna"
let v_decodedDiags = (fun (dtb_u_u45 : string) -> (match (Base_dDiag_dCodec.v_decDiagnostics dtb_u_u45) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u46) -> dtb_u_u46
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Driver/Target.vuna"
let v_firstDiagOr = (fun (dtb_u_u47 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u48 : string) (dtb_u_u49 : int) -> (match dtb_u_u47 with
  | B_dData_dList.C_List_Nil -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend `"; (v_backendBinaryName dtb_u_u48); "` failed with exit code "; (string_of_int dtb_u_u49)]))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u50, dtb_u_u51) -> dtb_u_u50
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Driver/Target.vuna"
let v_missingBackendDiag = (fun (dtb_u_u52 : string) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) "") (String.concat "" ["target backend plugin `"; (v_backendBinaryName dtb_u_u52); "` is not installed (expected next to `vuna`)"])))

# 212 "Vuna/Compiler/Driver/Target.vuna"
let v_splitNames = (fun (dtb_u_u53 : string) -> ((B_dData_dList.v_filter (fun (dtb_u_u54 : string) -> (dtb_u_u54 <> ""))) ((B_dData_dString.v_split "\n") dtb_u_u53)))

# 215 "Vuna/Compiler/Driver/Target.vuna"
let v_backendPath = (fun (dtb_u_u55 : string) (dtb_u_u56 : string) -> (String.concat "" [dtb_u_u55; "/"; (v_backendBinaryName dtb_u_u56)]))

# 61 "Vuna/Compiler/Driver/Target.vuna"
let rec v_searchBackend = (fun (dtb_u_u57 : string) (dtb_u_u58 : string) (dtb_u_u62 : string B_dData_dList.t_List) (dtb_u_u63 : string) -> (match dtb_u_u62 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (if (dtb_u_u64 = "") then ((((v_searchBackend dtb_u_u57) dtb_u_u58) dtb_u_u65) dtb_u_u63) else (Obj.repr ((fun (dtb_u_u70 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u73 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u58) ((v_backendPath dtb_u_u64) dtb_u_u63)) dtb_u_u70) in (if dtb_u_u73 then (let dtb_u_u75 = (B_dData_dMaybe.C_Maybe_Just (((v_backendPath dtb_u_u64) dtb_u_u63))) in dtb_u_u75) else ((Obj.magic ((((v_searchBackend dtb_u_u57) dtb_u_u58) dtb_u_u65) dtb_u_u63)) dtb_u_u70)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u78 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u79 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u78))))
  | _ -> failwith "DT: impossible branch"
))
# 61 "Vuna/Compiler/Driver/Target.vuna"
and v_searchBackend_u_udirect = (fun (nEnv : string) (nFs : string) (mc0 : string B_dData_dList.t_List) (mc1 : string) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (if (dtb_u_u64 = "") then ((Obj.magic ((((v_searchBackend nEnv) nFs) dtb_u_u65) mc1)) _u_ueffTok) else (let dtb_u_u73 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) ((v_backendPath dtb_u_u64) mc1)) _u_ueffTok) in (if dtb_u_u73 then (let dtb_u_u75 = (B_dData_dMaybe.C_Maybe_Just (((v_backendPath dtb_u_u64) mc1))) in dtb_u_u75) else ((Obj.magic ((((v_searchBackend nEnv) nFs) dtb_u_u65) mc1)) _u_ueffTok))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u78 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u78)
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Driver/Target.vuna"
let v_findBackend = (fun (dtb_u_u80 : string) (dtb_u_u81 : string) (dtb_u_u85 : string) -> (Obj.repr ((fun (dtb_u_u90 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u93 = ((B_dEffect_dEnv.v_envExecPath_u_udirect dtb_u_u80) dtb_u_u90) in (let dtb_u_u101 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u80) "VUNA_EXEC_PATH") dtb_u_u90) in ((Obj.magic ((((v_searchBackend dtb_u_u80) dtb_u_u81) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_dirOf dtb_u_u93), B_dData_dList.C_List_Nil))) (v_execDirs dtb_u_u101))) dtb_u_u85)) dtb_u_u90)))))))

# 51 "Vuna/Compiler/Driver/Target.vuna"
let v_findBackend_u_udirect = (fun (nEnv : string) (nFs : string) (target : string) _u_ueffTok -> (let dtb_u_u93 = ((B_dEffect_dEnv.v_envExecPath_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u101 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_EXEC_PATH") _u_ueffTok) in ((Obj.magic ((((v_searchBackend nEnv) nFs) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((v_dirOf dtb_u_u93), B_dData_dList.C_List_Nil))) (v_execDirs dtb_u_u101))) target)) _u_ueffTok))))

# 218 "Vuna/Compiler/Driver/Target.vuna"
let v_irPathOf = (fun (dtb_u_u102 : string) (dtb_u_u103 : string) -> (String.concat "" [dtb_u_u102; "/.vuna-ir-"; dtb_u_u103]))

# 221 "Vuna/Compiler/Driver/Target.vuna"
let v_diagPathOf = (fun (dtb_u_u104 : string) (dtb_u_u105 : string) -> (String.concat "" [dtb_u_u104; "/.vuna-diag-"; dtb_u_u105]))

# 224 "Vuna/Compiler/Driver/Target.vuna"
let v_filesPathOf = (fun (dtb_u_u106 : string) (dtb_u_u107 : string) -> (String.concat "" [dtb_u_u106; "/.vuna-files-"; dtb_u_u107]))

# 134 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginArgv = (fun (dtb_u_u108 : string) (dtb_u_u109 : string) (dtb_u_u110 : string) (dtb_u_u111 : bool) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb_u_u108, (B_dData_dList.C_List__x58__x58_ ("--ir", (B_dData_dList.C_List__x58__x58_ (((v_irPathOf dtb_u_u110) dtb_u_u109), (B_dData_dList.C_List__x58__x58_ ("--out", (B_dData_dList.C_List__x58__x58_ (dtb_u_u110, (B_dData_dList.C_List__x58__x58_ ("--diag", (B_dData_dList.C_List__x58__x58_ (((v_diagPathOf dtb_u_u110) dtb_u_u109), (B_dData_dList.C_List__x58__x58_ ("--files", (B_dData_dList.C_List__x58__x58_ (((v_filesPathOf dtb_u_u110) dtb_u_u109), B_dData_dList.C_List_Nil))))))))))))))))))) (if dtb_u_u111 then (B_dData_dList.C_List__x58__x58_ ("--print", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)))

# 146 "Vuna/Compiler/Driver/Target.vuna"
let v_pluginRunArgv = (fun (dtb_u_u112 : string) (dtb_u_u113 : string) (dtb_u_u114 : string) (dtb_u_u115 : string) (dtb_u_u116 : bool) -> ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("-c", (B_dData_dList.C_List__x58__x58_ ((String.concat "" ["timeout -s KILL "; dtb_u_u115; "s \"$@\"\ncode=$?\nif [ $code -eq 137 ] || [ $code -eq 124 ]; then printf timeout > \""; ((v_pluginTimedOutPath dtb_u_u114) dtb_u_u113); "\"; fi\nexit $code\n"]), (B_dData_dList.C_List__x58__x58_ ("sh", B_dData_dList.C_List_Nil))))))))) ((((v_pluginArgv dtb_u_u112) dtb_u_u113) dtb_u_u114) dtb_u_u116)))

# 153 "Vuna/Compiler/Driver/Target.vuna"
let v_runBackend = (fun (dtb_u_u117 : string) (dtb_u_u118 : string) (dtb_u_u119 : string) (dtb_u_u124 : string) (dtb_u_u125 : string) (dtb_u_u126 : string) (dtb_u_u127 : bool) (dtb_u_u128 : string) -> (Obj.repr ((fun (dtb_u_u133 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u136 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect dtb_u_u117) ((v_irPathOf dtb_u_u128) dtb_u_u124)) dtb_u_u126) dtb_u_u133) in (let dtb_u_u144 = ((v_pluginTimeoutEff_u_udirect dtb_u_u118) dtb_u_u133) in (let dtb_u_u150 = Obj.obj ((if (dtb_u_u144 = "0") then (let dtb_u_u153 = false in (Obj.repr ((fun (dtb_u_u154 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u153)))) else (v_hasTimeoutCmd dtb_u_u119))) in (let dtb_u_u155 = (dtb_u_u150 dtb_u_u133) in (let dtb_u_u163 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u117) ((v_pluginTimedOutPath dtb_u_u128) dtb_u_u124)) dtb_u_u133) in (let dtb_u_u169 = Obj.obj ((if dtb_u_u163 then ((B_dEffect_dFs.v_fsRemoveFile dtb_u_u117) ((v_pluginTimedOutPath dtb_u_u128) dtb_u_u124)) else (let dtb_u_u172 = 0 in (Obj.repr ((fun (dtb_u_u173 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u172)))))) in (let dtb_u_u174 = (dtb_u_u169 dtb_u_u133) in (let dtb_u_u180 = Obj.obj ((if dtb_u_u155 then (let dtb_u_u183 = (((((v_pluginRunArgv dtb_u_u125) dtb_u_u124) dtb_u_u128) dtb_u_u144) dtb_u_u127) in (Obj.repr ((fun (dtb_u_u184 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u183)))) else (let dtb_u_u186 = ((((v_pluginArgv dtb_u_u125) dtb_u_u124) dtb_u_u128) dtb_u_u127) in (Obj.repr ((fun (dtb_u_u187 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u186)))))) in (let dtb_u_u188 = (dtb_u_u180 dtb_u_u133) in (let dtb_u_u196 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect dtb_u_u119) ".") dtb_u_u188) dtb_u_u133) in (let dtb_u_u202 = Obj.obj ((if dtb_u_u155 then ((B_dEffect_dFs.v_fsFileExists dtb_u_u117) ((v_pluginTimedOutPath dtb_u_u128) dtb_u_u124)) else (let dtb_u_u205 = false in (Obj.repr ((fun (dtb_u_u206 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u205)))))) in (let dtb_u_u207 = (dtb_u_u202 dtb_u_u133) in (let dtb_u_u213 = Obj.obj ((if dtb_u_u207 then ((B_dEffect_dFs.v_fsRemoveFile dtb_u_u117) ((v_pluginTimedOutPath dtb_u_u128) dtb_u_u124)) else (let dtb_u_u216 = 0 in (Obj.repr ((fun (dtb_u_u217 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u216)))))) in (let dtb_u_u218 = (dtb_u_u213 dtb_u_u133) in (let dtb_u_u226 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u117) ((v_diagPathOf dtb_u_u128) dtb_u_u124)) dtb_u_u133) in (let dtb_u_u232 = Obj.obj ((if dtb_u_u226 then ((B_dEffect_dFs.v_fsReadFile dtb_u_u117) ((v_diagPathOf dtb_u_u128) dtb_u_u124)) else (let dtb_u_u235 = "" in (Obj.repr ((fun (dtb_u_u236 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u235)))))) in (let dtb_u_u237 = (dtb_u_u232 dtb_u_u133) in (let dtb_u_u245 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u117) ((v_filesPathOf dtb_u_u128) dtb_u_u124)) dtb_u_u133) in (let dtb_u_u251 = Obj.obj ((if dtb_u_u245 then ((B_dEffect_dFs.v_fsReadFile dtb_u_u117) ((v_filesPathOf dtb_u_u128) dtb_u_u124)) else (let dtb_u_u254 = "" in (Obj.repr ((fun (dtb_u_u255 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u254)))))) in (let dtb_u_u256 = (dtb_u_u251 dtb_u_u133) in (let dtb_u_u264 = (((B_dEffect_dFs.v_fsRemoveFile_u_udirect dtb_u_u117) ((v_irPathOf dtb_u_u128) dtb_u_u124)) dtb_u_u133) in (let dtb_u_u270 = Obj.obj ((if dtb_u_u245 then ((B_dEffect_dFs.v_fsRemoveFile dtb_u_u117) ((v_filesPathOf dtb_u_u128) dtb_u_u124)) else (let dtb_u_u273 = 0 in (Obj.repr ((fun (dtb_u_u274 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u273)))))) in (let dtb_u_u275 = (dtb_u_u270 dtb_u_u133) in (let dtb_u_u281 = Obj.obj ((if dtb_u_u226 then ((B_dEffect_dFs.v_fsRemoveFile dtb_u_u117) ((v_diagPathOf dtb_u_u128) dtb_u_u124)) else (let dtb_u_u284 = 0 in (Obj.repr ((fun (dtb_u_u285 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u284)))))) in (let dtb_u_u286 = (dtb_u_u281 dtb_u_u133) in (if dtb_u_u207 then (let dtb_u_u288 = (Base_dDiag.C_Check_ErrC (((v_pluginTimedOutDiag dtb_u_u124) dtb_u_u144))) in dtb_u_u288) else (if (dtb_u_u196 = 0) then (let dtb_u_u290 = (v_splitNames dtb_u_u256) in (let dtb_u_u291 = (v_decodedDiags dtb_u_u237) in (let dtb_u_u293 = (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u290; B_dData_dPair.f_Pair_second = dtb_u_u291 })) in dtb_u_u293))) else (let dtb_u_u296 = (Base_dDiag.C_Check_ErrC ((((v_firstDiagOr (v_decodedDiags dtb_u_u237)) dtb_u_u124) dtb_u_u196))) in dtb_u_u296))))))))))))))))))))))))))))))))

# 153 "Vuna/Compiler/Driver/Target.vuna"
let v_runBackend_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (bin : string) (irText : string) (printResult : bool) (outDir : string) _u_ueffTok -> (let dtb_u_u136 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect nFs) ((v_irPathOf outDir) target)) irText) _u_ueffTok) in (let dtb_u_u144 = ((v_pluginTimeoutEff_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u150 = Obj.obj ((if (dtb_u_u144 = "0") then (let dtb_u_u153 = false in (Obj.repr ((fun (dtb_u_u154 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u153)))) else (v_hasTimeoutCmd nProcess))) in (let dtb_u_u155 = (dtb_u_u150 _u_ueffTok) in (let dtb_u_u163 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) ((v_pluginTimedOutPath outDir) target)) _u_ueffTok) in (let dtb_u_u169 = Obj.obj ((if dtb_u_u163 then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_pluginTimedOutPath outDir) target)) else (let dtb_u_u172 = 0 in (Obj.repr ((fun (dtb_u_u173 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u172)))))) in (let dtb_u_u174 = (dtb_u_u169 _u_ueffTok) in (let dtb_u_u180 = Obj.obj ((if dtb_u_u155 then (let dtb_u_u183 = (((((v_pluginRunArgv bin) target) outDir) dtb_u_u144) printResult) in (Obj.repr ((fun (dtb_u_u184 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u183)))) else (let dtb_u_u186 = ((((v_pluginArgv bin) target) outDir) printResult) in (Obj.repr ((fun (dtb_u_u187 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u186)))))) in (let dtb_u_u188 = (dtb_u_u180 _u_ueffTok) in (let dtb_u_u196 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect nProcess) ".") dtb_u_u188) _u_ueffTok) in (let dtb_u_u202 = Obj.obj ((if dtb_u_u155 then ((B_dEffect_dFs.v_fsFileExists nFs) ((v_pluginTimedOutPath outDir) target)) else (let dtb_u_u205 = false in (Obj.repr ((fun (dtb_u_u206 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u205)))))) in (let dtb_u_u207 = (dtb_u_u202 _u_ueffTok) in (let dtb_u_u213 = Obj.obj ((if dtb_u_u207 then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_pluginTimedOutPath outDir) target)) else (let dtb_u_u216 = 0 in (Obj.repr ((fun (dtb_u_u217 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u216)))))) in (let dtb_u_u218 = (dtb_u_u213 _u_ueffTok) in (let dtb_u_u226 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) ((v_diagPathOf outDir) target)) _u_ueffTok) in (let dtb_u_u232 = Obj.obj ((if dtb_u_u226 then ((B_dEffect_dFs.v_fsReadFile nFs) ((v_diagPathOf outDir) target)) else (let dtb_u_u235 = "" in (Obj.repr ((fun (dtb_u_u236 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u235)))))) in (let dtb_u_u237 = (dtb_u_u232 _u_ueffTok) in (let dtb_u_u245 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) ((v_filesPathOf outDir) target)) _u_ueffTok) in (let dtb_u_u251 = Obj.obj ((if dtb_u_u245 then ((B_dEffect_dFs.v_fsReadFile nFs) ((v_filesPathOf outDir) target)) else (let dtb_u_u254 = "" in (Obj.repr ((fun (dtb_u_u255 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u254)))))) in (let dtb_u_u256 = (dtb_u_u251 _u_ueffTok) in (let dtb_u_u264 = (((B_dEffect_dFs.v_fsRemoveFile_u_udirect nFs) ((v_irPathOf outDir) target)) _u_ueffTok) in (let dtb_u_u270 = Obj.obj ((if dtb_u_u245 then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_filesPathOf outDir) target)) else (let dtb_u_u273 = 0 in (Obj.repr ((fun (dtb_u_u274 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u273)))))) in (let dtb_u_u275 = (dtb_u_u270 _u_ueffTok) in (let dtb_u_u281 = Obj.obj ((if dtb_u_u226 then ((B_dEffect_dFs.v_fsRemoveFile nFs) ((v_diagPathOf outDir) target)) else (let dtb_u_u284 = 0 in (Obj.repr ((fun (dtb_u_u285 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u284)))))) in (let dtb_u_u286 = (dtb_u_u281 _u_ueffTok) in (if dtb_u_u207 then (let dtb_u_u288 = (Base_dDiag.C_Check_ErrC (((v_pluginTimedOutDiag target) dtb_u_u144))) in dtb_u_u288) else (if (dtb_u_u196 = 0) then (let dtb_u_u290 = (v_splitNames dtb_u_u256) in (let dtb_u_u291 = (v_decodedDiags dtb_u_u237) in (let dtb_u_u293 = (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u290; B_dData_dPair.f_Pair_second = dtb_u_u291 })) in dtb_u_u293))) else (let dtb_u_u296 = (Base_dDiag.C_Check_ErrC ((((v_firstDiagOr (v_decodedDiags dtb_u_u237)) target) dtb_u_u196))) in dtb_u_u296)))))))))))))))))))))))))))))

# 95 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatchWith = (fun (dtb_u_u298 : string) (dtb_u_u299 : string) (dtb_u_u300 : string) (dtb_u_u305 : string) (dtb_u_u306 : string) (dtb_u_u307 : Vuna_dIr_dModel.t_IrProgram) (dtb_u_u308 : bool) (dtb_u_u309 : string) -> ((((((((v_runBackend dtb_u_u298) dtb_u_u299) dtb_u_u300) dtb_u_u305) dtb_u_u306) (Vuna_dIr_dCodec.v_encodeProgram dtb_u_u307)) dtb_u_u308) dtb_u_u309))

# 95 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatchWith_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (bin : string) (program : Vuna_dIr_dModel.t_IrProgram) (printResult : bool) (outDir : string) _u_ueffTok -> ((Obj.magic ((((((((v_runBackend nFs) nEnv) nProcess) target) bin) (Vuna_dIr_dCodec.v_encodeProgram program)) printResult) outDir)) _u_ueffTok))

# 86 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatch = (fun (dtb_u_u310 : string) (dtb_u_u311 : string) (dtb_u_u312 : string) (dtb_u_u317 : string) (dtb_u_u318 : Vuna_dIr_dModel.t_IrProgram) (dtb_u_u319 : bool) (dtb_u_u320 : string) -> (Obj.repr ((fun (dtb_u_u325 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u328 = ((((v_findBackend_u_udirect dtb_u_u311) dtb_u_u310) dtb_u_u317) dtb_u_u325) in (match dtb_u_u328 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u330 = (Base_dDiag.C_Check_ErrC ((v_missingBackendDiag dtb_u_u317))) in dtb_u_u330)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u332) -> ((Obj.magic ((((((((v_dispatchWith dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u317) dtb_u_u332) dtb_u_u318) dtb_u_u319) dtb_u_u320)) dtb_u_u325)
  | _ -> failwith "DT: impossible branch"
))))))

# 86 "Vuna/Compiler/Driver/Target.vuna"
let v_dispatch_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (target : string) (program : Vuna_dIr_dModel.t_IrProgram) (printResult : bool) (outDir : string) _u_ueffTok -> (let dtb_u_u328 = ((((v_findBackend_u_udirect nEnv) nFs) target) _u_ueffTok) in (match dtb_u_u328 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u330 = (Base_dDiag.C_Check_ErrC ((v_missingBackendDiag target))) in dtb_u_u330)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u332) -> ((Obj.magic ((((((((v_dispatchWith nFs) nEnv) nProcess) target) dtb_u_u332) program) printResult) outDir)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))

# 72 "Vuna/Compiler/Driver/Target.vuna"
let v_compileBackend = (fun (dtb_u_u333 : string) (dtb_u_u334 : string) (dtb_u_u335 : string) (dtb_u_u340 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u341 : string) (dtb_u_u342 : string) (dtb_u_u343 : bool) (dtb_u_u344 : string) -> (Obj.repr ((fun (dtb_u_u349 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u352 = ((((Driver_dCompile.v_ensureDirPath_u_udirect dtb_u_u333) dtb_u_u335) dtb_u_u344) dtb_u_u349) in (let dtb_u_u360 = ((((((Driver_dDt.v_dtCheckWithProgramParts_u_udirect dtb_u_u333) dtb_u_u334) dtb_u_u335) dtb_u_u340) dtb_u_u342) dtb_u_u349) in (match dtb_u_u360 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u361) -> (let dtb_u_u363 = (Base_dDiag.C_Check_ErrC (dtb_u_u361)) in dtb_u_u363)
  | Base_dDiag.C_Check_OkC (dtb_u_u365) -> (let dtb_u_u366 = (B_dData_dPair.v_secondOf dtb_u_u365) in (match (((Lowering_dProgram.v_lowerProgramCheckedOf ((dtb_u_u366).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDatas) ((dtb_u_u366).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDefs) ((dtb_u_u366).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgGlobals) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u367) -> (let dtb_u_u369 = (Base_dDiag.C_Check_ErrC (dtb_u_u367)) in dtb_u_u369)
  | Base_dDiag.C_Check_OkC (dtb_u_u371) -> ((Obj.magic (((((((v_dispatch dtb_u_u333) dtb_u_u334) dtb_u_u335) dtb_u_u341) dtb_u_u371) dtb_u_u343) dtb_u_u344)) dtb_u_u349)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))

# 72 "Vuna/Compiler/Driver/Target.vuna"
let v_compileBackend_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (target : string) (entry : string) (printResult : bool) (outDir : string) _u_ueffTok -> (let dtb_u_u352 = ((((Driver_dCompile.v_ensureDirPath_u_udirect nFs) nProcess) outDir) _u_ueffTok) in (let dtb_u_u360 = ((((((Driver_dDt.v_dtCheckWithProgramParts_u_udirect nFs) nEnv) nProcess) ctx) entry) _u_ueffTok) in (match dtb_u_u360 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u361) -> (let dtb_u_u363 = (Base_dDiag.C_Check_ErrC (dtb_u_u361)) in dtb_u_u363)
  | Base_dDiag.C_Check_OkC (dtb_u_u365) -> (let dtb_u_u366 = (B_dData_dPair.v_secondOf dtb_u_u365) in (match (((Lowering_dProgram.v_lowerProgramCheckedOf ((dtb_u_u366).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDatas) ((dtb_u_u366).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgDefs) ((dtb_u_u366).Driver_dDt.f_CheckedPackage_checkedProgram).Elab_dTypes.f_DtProgram_dtProgGlobals) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u367) -> (let dtb_u_u369 = (Base_dDiag.C_Check_ErrC (dtb_u_u367)) in dtb_u_u369)
  | Base_dDiag.C_Check_OkC (dtb_u_u371) -> ((Obj.magic (((((((v_dispatch nFs) nEnv) nProcess) target) dtb_u_u371) printResult) outDir)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))
