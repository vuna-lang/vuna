open Vuna_runtime
type t_LdDiag = C_LdDiag_EntryFileNotFound of (string) | C_LdDiag_ImportCycle of (string) | C_LdDiag_InvalidModuleName of (string) | C_LdDiag_ModuleHeaderInEntryFile of (string) | C_LdDiag_ModuleHeaderInEntrySource of (string) | C_LdDiag_ModuleNotFound of (string) * (string) | C_LdDiag_ModuleNotExported of (string) * (string) | C_LdDiag_LayerViolation
and t_LdEntry = { f_LdEntry_ldEntryCode : string; f_LdEntry_ldEntryTemplate : string; f_LdEntry_ldEntryDesc : string }

# 64 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldCode = (fun (dtb_u_u2 : t_LdDiag) -> (match dtb_u_u2 with
  | C_LdDiag_LayerViolation -> "LD_LayerViolation"
  | C_LdDiag_ModuleNotExported (dtb_u_u3, dtb_u_u4) -> "LD_ModuleNotExported"
  | C_LdDiag_ModuleNotFound (dtb_u_u5, dtb_u_u6) -> "LD_ModuleNotFound"
  | C_LdDiag_ModuleHeaderInEntrySource (dtb_u_u7) -> "LD_ModuleHeaderInEntrySource"
  | C_LdDiag_ModuleHeaderInEntryFile (dtb_u_u8) -> "LD_ModuleHeaderInEntryFile"
  | C_LdDiag_InvalidModuleName (dtb_u_u9) -> "LD_InvalidModuleName"
  | C_LdDiag_ImportCycle (dtb_u_u10) -> "LD_ImportCycle"
  | C_LdDiag_EntryFileNotFound (dtb_u_u11) -> "LD_EntryFileNotFound"
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldTemplate = (fun (dtb_u_u13 : t_LdDiag) -> (match dtb_u_u13 with
  | C_LdDiag_LayerViolation -> "module <0> (layer <2>) cannot import <1> (layer <3>)"
  | C_LdDiag_ModuleNotExported (dtb_u_u14, dtb_u_u15) -> "module <0> is not exported by package <1>"
  | C_LdDiag_ModuleNotFound (dtb_u_u16, dtb_u_u17) -> "cannot find module <0> (roots: <1>)"
  | C_LdDiag_ModuleHeaderInEntrySource (dtb_u_u18) -> "module header is not supported in the entry source (<0>)"
  | C_LdDiag_ModuleHeaderInEntryFile (dtb_u_u19) -> "module header is not supported in the entry file (<0>)"
  | C_LdDiag_InvalidModuleName (dtb_u_u20) -> "invalid module name: <0>"
  | C_LdDiag_ImportCycle (dtb_u_u21) -> "import cycle: <0>"
  | C_LdDiag_EntryFileNotFound (dtb_u_u22) -> "entry file not found: <0>"
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldAll = (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_EntryFileNotFound (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_EntryFileNotFound (""))); f_LdEntry_ldEntryDesc = "\229\133\165\229\143\163\230\150\135\228\187\182\228\184\141\229\173\152\229\156\168" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ImportCycle (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ImportCycle (""))); f_LdEntry_ldEntryDesc = "\229\175\188\229\133\165\229\190\170\231\142\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_InvalidModuleName (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_InvalidModuleName (""))); f_LdEntry_ldEntryDesc = "\233\157\158\230\179\149\230\168\161\229\157\151\229\144\141" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ModuleHeaderInEntryFile (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ModuleHeaderInEntryFile (""))); f_LdEntry_ldEntryDesc = "\229\133\165\229\143\163\230\150\135\228\187\182\228\184\141\229\133\129\232\174\184\230\168\161\229\157\151\229\164\180" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ModuleHeaderInEntrySource (""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ModuleHeaderInEntrySource (""))); f_LdEntry_ldEntryDesc = "\229\133\165\229\143\163\230\186\144\231\160\129\228\184\141\229\133\129\232\174\184\230\168\161\229\157\151\229\164\180" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ModuleNotFound ("", ""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ModuleNotFound ("", ""))); f_LdEntry_ldEntryDesc = "\230\168\161\229\157\151\230\156\170\230\137\190\229\136\176" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode (C_LdDiag_ModuleNotExported ("", ""))); f_LdEntry_ldEntryTemplate = (v_ldTemplate (C_LdDiag_ModuleNotExported ("", ""))); f_LdEntry_ldEntryDesc = "\230\168\161\229\157\151\230\156\170\232\162\171\229\140\133\229\175\188\229\135\186" }, (B_dData_dList.C_List__x58__x58_ ({ f_LdEntry_ldEntryCode = (v_ldCode C_LdDiag_LayerViolation); f_LdEntry_ldEntryTemplate = (v_ldTemplate C_LdDiag_LayerViolation); f_LdEntry_ldEntryDesc = "\232\183\168\229\177\130\229\175\188\229\133\165" }, B_dData_dList.C_List_Nil))))))))))))))))

# 115 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldMsg = (fun (dtb_u_u24 : t_LdDiag) (dtb_u_u25 : string B_dData_dVec.t_Vec) -> (((((Base_dDiagnostics_dCommon.v_mkDiag Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLoad) Base_dDiag.C_Category_CatPackage) (v_ldCode dtb_u_u24)) ((Base_dDiagnostics_dCommon.v_diagBody (v_ldTemplate dtb_u_u24)) dtb_u_u25)))

# 118 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr = (fun (dtb_u_u28 : t_LdDiag) (dtb_u_u29 : string B_dData_dVec.t_Vec) -> (Base_dDiag.C_Check_ErrC (((v_ldMsg dtb_u_u28) dtb_u_u29))))

# 122 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr0 = (fun (dtb_u_u31 : t_LdDiag) -> ((v_ldErr dtb_u_u31) B_dData_dVec.C_Vec_Nil))

# 126 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr1 = (fun (dtb_u_u33 : t_LdDiag) (dtb_u_u34 : string) -> ((v_ldErr dtb_u_u33) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u34, B_dData_dVec.C_Vec_Nil))))

# 130 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr4 = (fun (dtb_u_u36 : t_LdDiag) (dtb_u_u37 : string) (dtb_u_u38 : string) (dtb_u_u39 : string) (dtb_u_u40 : string) -> ((v_ldErr dtb_u_u36) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u37, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u38, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u39, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u40, B_dData_dVec.C_Vec_Nil))))))))))

# 134 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldErr2 = (fun (dtb_u_u42 : t_LdDiag) (dtb_u_u43 : string) (dtb_u_u44 : string) -> ((v_ldErr dtb_u_u42) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u43, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u44, B_dData_dVec.C_Vec_Nil))))))

# 85 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldEntryCode = (fun (dtb_u_u45 : t_LdEntry) -> (match dtb_u_u45 with
  | { f_LdEntry_ldEntryCode = dtb_u_u46; f_LdEntry_ldEntryTemplate = dtb_u_u47; f_LdEntry_ldEntryDesc = dtb_u_u48 } -> dtb_u_u46
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldEntryTemplate = (fun (dtb_u_u49 : t_LdEntry) -> (match dtb_u_u49 with
  | { f_LdEntry_ldEntryCode = dtb_u_u50; f_LdEntry_ldEntryTemplate = dtb_u_u51; f_LdEntry_ldEntryDesc = dtb_u_u52 } -> dtb_u_u51
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Base/Diagnostics/Loader.vuna"
let v_ldEntryDesc = (fun (dtb_u_u53 : t_LdEntry) -> (match dtb_u_u53 with
  | { f_LdEntry_ldEntryCode = dtb_u_u54; f_LdEntry_ldEntryTemplate = dtb_u_u55; f_LdEntry_ldEntryDesc = dtb_u_u56 } -> dtb_u_u56
  | _ -> failwith "DT: impossible branch"
))
