open Vuna_runtime
type t_LdDiag = C_LdDiag_EntryFileNotFound of (string) | C_LdDiag_ImportCycle of (string) | C_LdDiag_InvalidModuleName of (string) | C_LdDiag_ModuleHeaderInEntryFile of (string) | C_LdDiag_ModuleHeaderInEntrySource of (string) | C_LdDiag_ModuleNotFound of (string) * (string) | C_LdDiag_ModuleNotExported of (string) * (string) | C_LdDiag_LayerViolation
and t_LdEntry = { f_LdEntry_ldEntryCode : string; f_LdEntry_ldEntryTemplate : string; f_LdEntry_ldEntryDesc : string }

# 64 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldCode = (fun (mc0 : t_LdDiag) -> (match mc0 with
  | C_LdDiag_LayerViolation -> "LD_LayerViolation"
  | C_LdDiag_ModuleNotExported (dtb__0, dtb__1) -> "LD_ModuleNotExported"
  | C_LdDiag_ModuleNotFound (dtb__2, dtb__3) -> "LD_ModuleNotFound"
  | C_LdDiag_ModuleHeaderInEntrySource (dtb__4) -> "LD_ModuleHeaderInEntrySource"
  | C_LdDiag_ModuleHeaderInEntryFile (dtb__5) -> "LD_ModuleHeaderInEntryFile"
  | C_LdDiag_InvalidModuleName (dtb__6) -> "LD_InvalidModuleName"
  | C_LdDiag_ImportCycle (dtb__7) -> "LD_ImportCycle"
  | C_LdDiag_EntryFileNotFound (dtb__8) -> "LD_EntryFileNotFound"
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldTemplate = (fun (mc0 : t_LdDiag) -> (match mc0 with
  | C_LdDiag_LayerViolation -> "module <0> (layer <2>) cannot import <1> (layer <3>)"
  | C_LdDiag_ModuleNotExported (dtb__9, dtb__10) -> "module <0> is not exported by package <1>"
  | C_LdDiag_ModuleNotFound (dtb__11, dtb__12) -> "cannot find module <0> (roots: <1>)"
  | C_LdDiag_ModuleHeaderInEntrySource (dtb__13) -> "module header is not supported in the entry source (<0>)"
  | C_LdDiag_ModuleHeaderInEntryFile (dtb__14) -> "module header is not supported in the entry file (<0>)"
  | C_LdDiag_InvalidModuleName (dtb__15) -> "invalid module name: <0>"
  | C_LdDiag_ImportCycle (dtb__16) -> "import cycle: <0>"
  | C_LdDiag_EntryFileNotFound (dtb__17) -> "entry file not found: <0>"
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldAll = (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_EntryFileNotFound (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_EntryFileNotFound (""))); f_LdEntry_ldEntryDesc = "\229\133\165\229\143\163\230\150\135\228\187\182\228\184\141\229\173\152\229\156\168" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ImportCycle (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ImportCycle (""))); f_LdEntry_ldEntryDesc = "\229\175\188\229\133\165\229\190\170\231\142\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_InvalidModuleName (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_InvalidModuleName (""))); f_LdEntry_ldEntryDesc = "\233\157\158\230\179\149\230\168\161\229\157\151\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ModuleHeaderInEntryFile (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ModuleHeaderInEntryFile (""))); f_LdEntry_ldEntryDesc = "\229\133\165\229\143\163\230\150\135\228\187\182\228\184\141\229\133\129\232\174\184\230\168\161\229\157\151\229\164\180" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ModuleHeaderInEntrySource (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ModuleHeaderInEntrySource (""))); f_LdEntry_ldEntryDesc = "\229\133\165\229\143\163\230\186\144\231\160\129\228\184\141\229\133\129\232\174\184\230\168\161\229\157\151\229\164\180" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ModuleNotFound ("", ""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ModuleNotFound ("", ""))); f_LdEntry_ldEntryDesc = "\230\168\161\229\157\151\230\156\170\230\137\190\229\136\176" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ModuleNotExported ("", ""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ModuleNotExported ("", ""))); f_LdEntry_ldEntryDesc = "\230\168\161\229\157\151\230\156\170\232\162\171\229\140\133\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode C_LdDiag_LayerViolation); f_LdEntry_ldEntryTemplate = (v_ldTemplate C_LdDiag_LayerViolation); f_LdEntry_ldEntryDesc = "\232\183\168\229\177\130\229\175\188\229\133\165" }, B_dData_dList.C_List_Nil))))))))))))))))

# 115 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldMsg = (fun (e : t_LdDiag) (args : string B_dData_dVec.t_Vec) -> (((((Base_dDiagnostics_dCommon.v_mkDiag Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLoad) Base_dDiag.C_Category_CatPackage) (v_ldCode e)) ((Base_dDiagnostics_dCommon.v_diagBody (v_ldTemplate e)) args)))

# 118 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr = (fun (e : t_LdDiag) (args : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((v_ldMsg e) args))))

# 122 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr0 = (fun (e : t_LdDiag) -> ((v_ldErr e) B_dData_dVec.C_Vec_Nil))

# 126 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr1 = (fun (e : t_LdDiag) (a0 : string) -> ((v_ldErr e) (B_dData_dVec.C_Vec__x58__x58_ (a0, B_dData_dVec.C_Vec_Nil))))

# 130 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr4 = (fun (e : t_LdDiag) (a0 : string) (a1 : string) (a2 : string) (a3 : string) -> ((v_ldErr e) (B_dData_dVec.C_Vec__x58__x58_ (a0, (B_dData_dVec.C_Vec__x58__x58_ (a1, (B_dData_dVec.C_Vec__x58__x58_ (a2, (B_dData_dVec.C_Vec__x58__x58_ (a3, B_dData_dVec.C_Vec_Nil))))))))))

# 134 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr2 = (fun (e : t_LdDiag) (a0 : string) (a1 : string) -> ((v_ldErr e) (B_dData_dVec.C_Vec__x58__x58_ (a0, (B_dData_dVec.C_Vec__x58__x58_ (a1, B_dData_dVec.C_Vec_Nil))))))

# 85 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldEntryCode = (fun (p : t_LdEntry) -> (match p with
  | { f_LdEntry_ldEntryCode = dtb__18; f_LdEntry_ldEntryTemplate = dtb__19; f_LdEntry_ldEntryDesc = dtb__20 } -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldEntryTemplate = (fun (p : t_LdEntry) -> (match p with
  | { f_LdEntry_ldEntryCode = dtb__21; f_LdEntry_ldEntryTemplate = dtb__22; f_LdEntry_ldEntryDesc = dtb__23 } -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldEntryDesc = (fun (p : t_LdEntry) -> (match p with
  | { f_LdEntry_ldEntryCode = dtb__24; f_LdEntry_ldEntryTemplate = dtb__25; f_LdEntry_ldEntryDesc = dtb__26 } -> dtb__26
  | _ -> failwith "DT: impossible branch"
))
