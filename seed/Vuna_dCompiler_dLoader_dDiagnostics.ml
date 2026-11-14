open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag = C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_EntryFileNotFound of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ImportCycle of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_InvalidModuleName of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntryFile of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntrySource of (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotFound of (string) * (string) | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotExported of (string) * (string)
and t_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry = { f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryCode : string; f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryTemplate : string; f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryDesc : string }

# 26 "Vuna/Compiler/Loader/Diagnostics.vuna"
let v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotExported (dtb__0, dtb__1) -> "LD_ModuleNotExported"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotFound (dtb__2, dtb__3) -> "LD_ModuleNotFound"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntrySource (dtb__4) -> "LD_ModuleHeaderInEntrySource"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntryFile (dtb__5) -> "LD_ModuleHeaderInEntryFile"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_InvalidModuleName (dtb__6) -> "LD_InvalidModuleName"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ImportCycle (dtb__7) -> "LD_ImportCycle"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_EntryFileNotFound (dtb__8) -> "LD_EntryFileNotFound"
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Loader/Diagnostics.vuna"
let v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotExported (dtb__9, dtb__10) -> "module <0> is not exported by package <1>"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotFound (dtb__11, dtb__12) -> "module <0> not found (roots: <1>)"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntrySource (dtb__13) -> "module header is not allowed in entry source (<0>)"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntryFile (dtb__14) -> "module header is not allowed in entry file (<0>)"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_InvalidModuleName (dtb__15) -> "invalid module name: <0>"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ImportCycle (dtb__16) -> "import cycle: <0>"
  | C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_EntryFileNotFound (dtb__17) -> "entry file not found: <0>"
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Loader/Diagnostics.vuna"
let v_Vuna_dCompiler_dLoader_dDiagnostics_dldAll = (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryCode = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_EntryFileNotFound (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryTemplate = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_EntryFileNotFound (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryDesc = "\229\133\165\229\143\163\230\150\135\228\187\182\228\184\141\229\173\152\229\156\168" }, (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryCode = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ImportCycle (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryTemplate = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ImportCycle (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryDesc = "import \230\136\144\231\142\175" }, (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryCode = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_InvalidModuleName (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryTemplate = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_InvalidModuleName (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryDesc = "\233\157\158\230\179\149\230\168\161\229\157\151\229\144\141" }, (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryCode = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntryFile (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryTemplate = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntryFile (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryDesc = "\229\133\165\229\143\163\230\150\135\228\187\182\228\184\141\229\133\129\232\174\184\230\168\161\229\157\151\229\164\180" }, (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryCode = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntrySource (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryTemplate = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntrySource (""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryDesc = "\229\133\165\229\143\163\230\186\144\231\160\129\228\184\141\229\133\129\232\174\184\230\168\161\229\157\151\229\164\180" }, (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryCode = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotFound ("", ""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryTemplate = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotFound ("", ""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryDesc = "\230\168\161\229\157\151\230\156\170\230\137\190\229\136\176" }, (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryCode = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotExported ("", ""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryTemplate = (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleNotExported ("", ""))); f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryDesc = "\230\168\161\229\157\151\230\156\170\232\162\171\229\140\133\229\175\188\229\135\186" }, Base_dList.C_Base_dList_dList_Nil))))))))))))))

# 60 "Vuna/Compiler/Loader/Diagnostics.vuna"
let v_Vuna_dCompiler_dLoader_dDiagnostics_dldMsg = (fun e args -> (((((Vuna_dCompiler_dDiagnostics_dCommon.v_Vuna_dCompiler_dDiagnostics_dCommon_dmkDiag Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLoad) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatPackage) (v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode e)) ((Vuna_dCompiler_dDiagnostics_dCommon.v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagBody (v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate e)) args)))

# 63 "Vuna/Compiler/Loader/Diagnostics.vuna"
let v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr = (fun e args -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dLoader_dDiagnostics_dldMsg e) args))))

# 67 "Vuna/Compiler/Loader/Diagnostics.vuna"
let v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr0 = (fun e -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr e) Base_dVec.C_Base_dVec_dVec_Nil))

# 71 "Vuna/Compiler/Loader/Diagnostics.vuna"
let v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 = (fun e a0 -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr e) (Base_dVec.C_Base_dVec_dVec_Cons (a0, Base_dVec.C_Base_dVec_dVec_Nil))))

# 75 "Vuna/Compiler/Loader/Diagnostics.vuna"
let v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 = (fun e a0 a1 -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr e) (Base_dVec.C_Base_dVec_dVec_Cons (a0, (Base_dVec.C_Base_dVec_dVec_Cons (a1, Base_dVec.C_Base_dVec_dVec_Nil))))))
