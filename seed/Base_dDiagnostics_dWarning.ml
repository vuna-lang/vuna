open Vuna_runtime
type t_WarnErr = C_WarnErr_WarnBranchAfterCatchAll | C_WarnErr_WarnRedundantCtorBranch of (string) | C_WarnErr_WarnRedundantLiteralBranch of (string) | C_WarnErr_UnusedBinder of (string) | C_WarnErr_UnusedDefinition of (string) | C_WarnErr_UnusedImport of (string) | C_WarnErr_ShadowedBinder of (string) | C_WarnErr_TargetEffectUnavailable of (string) * (string)
and t_WarnEntry = { f_WarnEntry_warnEntryCode : string; f_WarnEntry_warnEntryTemplate : string; f_WarnEntry_warnEntryDesc : string }

# 32 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_warnCode = (fun (dtb_u_u2 : t_WarnErr) -> (match dtb_u_u2 with
  | C_WarnErr_TargetEffectUnavailable (dtb_u_u3, dtb_u_u4) -> "UN_TargetEffectUnavailable"
  | C_WarnErr_ShadowedBinder (dtb_u_u5) -> "UN_ShadowedBinder"
  | C_WarnErr_UnusedImport (dtb_u_u6) -> "UN_UnusedImport"
  | C_WarnErr_UnusedDefinition (dtb_u_u7) -> "UN_UnusedDefinition"
  | C_WarnErr_UnusedBinder (dtb_u_u8) -> "UN_UnusedBinder"
  | C_WarnErr_WarnRedundantLiteralBranch (dtb_u_u9) -> "UN_RedundantLiteralBranch"
  | C_WarnErr_WarnRedundantCtorBranch (dtb_u_u10) -> "UN_RedundantCtorBranch"
  | C_WarnErr_WarnBranchAfterCatchAll -> "UN_BranchAfterCatchAll"
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_warnTemplate = (fun (dtb_u_u12 : t_WarnErr) -> (match dtb_u_u12 with
  | C_WarnErr_TargetEffectUnavailable (dtb_u_u13, dtb_u_u14) -> "target <0> does not fully implement effect <1>: unsupported operations trap at runtime"
  | C_WarnErr_ShadowedBinder (dtb_u_u15) -> "binder <0> shadows an outer binder"
  | C_WarnErr_UnusedImport (dtb_u_u16) -> "module <0> is imported but never used"
  | C_WarnErr_UnusedDefinition (dtb_u_u17) -> "definition <0> is never used"
  | C_WarnErr_UnusedBinder (dtb_u_u18) -> "binder <0> is never used"
  | C_WarnErr_WarnRedundantLiteralBranch (dtb_u_u19) -> "redundant literal branch: <0> is already covered by an earlier branch"
  | C_WarnErr_WarnRedundantCtorBranch (dtb_u_u20) -> "redundant constructor branch: <0> is already covered by an earlier branch"
  | C_WarnErr_WarnBranchAfterCatchAll -> "unreachable branch: a catch-all precedes it"
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_warnMsg = (fun (dtb_u_u22 : t_WarnErr) (dtb_u_u23 : string B_dData_dVec.t_Vec) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevWarning) Base_dDiag.C_Phase_PhUsage) Base_dDiag.C_Category_CatQuantity) (v_warnCode dtb_u_u22)) ((Base_dDiagnostics_dCommon.v_diagBody (v_warnTemplate dtb_u_u22)) dtb_u_u23)))

# 62 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_warnDiagAt = (fun (dtb_u_u25 : Base_dSource.t_Span) (dtb_u_u27 : t_WarnErr) (dtb_u_u28 : string B_dData_dVec.t_Vec) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u25)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((v_warnMsg dtb_u_u27) dtb_u_u28)))

# 66 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_warnDiagAtMod = (fun (dtb_u_u30 : (Base_dDiag.t_Diagnostic) -> Base_dDiag.t_Diagnostic) (dtb_u_u31 : Base_dSource.t_Span) (dtb_u_u33 : t_WarnErr) (dtb_u_u34 : string B_dData_dVec.t_Vec) -> (dtb_u_u30 (((v_warnDiagAt dtb_u_u31) dtb_u_u33) dtb_u_u34)))

# 71 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_targetEffectWarn = (fun (dtb_u_u35 : string) (dtb_u_u36 : string) -> (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevWarning) Base_dDiag.C_Phase_PhCodegen) Base_dDiag.C_Category_CatCodegen) (v_warnCode (C_WarnErr_TargetEffectUnavailable (dtb_u_u35, dtb_u_u36)))) ((Base_dDiagnostics_dCommon.v_diagBody (v_warnTemplate (C_WarnErr_TargetEffectUnavailable (dtb_u_u35, dtb_u_u36)))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u35, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u36, B_dData_dVec.C_Vec_Nil)))))))

# 87 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_warnAll = (B_dData_dList.C_List__x58__x58_ ({ f_WarnEntry_warnEntryCode = (v_warnCode C_WarnErr_WarnBranchAfterCatchAll); f_WarnEntry_warnEntryTemplate = (v_warnTemplate C_WarnErr_WarnBranchAfterCatchAll); f_WarnEntry_warnEntryDesc = "\229\133\156\229\186\149\229\136\134\230\148\175\228\185\139\229\144\142\231\154\132\229\136\134\230\148\175\228\184\141\229\143\175\232\190\190" }, (B_dData_dList.C_List__x58__x58_ ({ f_WarnEntry_warnEntryCode = (v_warnCode (C_WarnErr_WarnRedundantCtorBranch (""))); f_WarnEntry_warnEntryTemplate = (v_warnTemplate (C_WarnErr_WarnRedundantCtorBranch (""))); f_WarnEntry_warnEntryDesc = "\229\134\151\228\189\153\230\158\132\233\128\160\229\173\144\229\136\134\230\148\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_WarnEntry_warnEntryCode = (v_warnCode (C_WarnErr_WarnRedundantLiteralBranch (""))); f_WarnEntry_warnEntryTemplate = (v_warnTemplate (C_WarnErr_WarnRedundantLiteralBranch (""))); f_WarnEntry_warnEntryDesc = "\229\134\151\228\189\153\229\173\151\233\157\162\233\135\143\229\136\134\230\148\175" }, (B_dData_dList.C_List__x58__x58_ ({ f_WarnEntry_warnEntryCode = (v_warnCode (C_WarnErr_UnusedBinder (""))); f_WarnEntry_warnEntryTemplate = (v_warnTemplate (C_WarnErr_UnusedBinder (""))); f_WarnEntry_warnEntryDesc = "\230\156\170\228\189\191\231\148\168\231\154\132 binder" }, (B_dData_dList.C_List__x58__x58_ ({ f_WarnEntry_warnEntryCode = (v_warnCode (C_WarnErr_UnusedDefinition (""))); f_WarnEntry_warnEntryTemplate = (v_warnTemplate (C_WarnErr_UnusedDefinition (""))); f_WarnEntry_warnEntryDesc = "\230\156\170\228\189\191\231\148\168\231\154\132\229\174\154\228\185\137" }, (B_dData_dList.C_List__x58__x58_ ({ f_WarnEntry_warnEntryCode = (v_warnCode (C_WarnErr_UnusedImport (""))); f_WarnEntry_warnEntryTemplate = (v_warnTemplate (C_WarnErr_UnusedImport (""))); f_WarnEntry_warnEntryDesc = "\230\156\170\228\189\191\231\148\168\231\154\132\229\175\188\229\133\165" }, (B_dData_dList.C_List__x58__x58_ ({ f_WarnEntry_warnEntryCode = (v_warnCode (C_WarnErr_ShadowedBinder (""))); f_WarnEntry_warnEntryTemplate = (v_warnTemplate (C_WarnErr_ShadowedBinder (""))); f_WarnEntry_warnEntryDesc = "\233\129\174\232\148\189\229\164\150\229\177\130\229\144\140\229\144\141 binder" }, (B_dData_dList.C_List__x58__x58_ ({ f_WarnEntry_warnEntryCode = (v_warnCode (C_WarnErr_TargetEffectUnavailable ("", ""))); f_WarnEntry_warnEntryTemplate = (v_warnTemplate (C_WarnErr_TargetEffectUnavailable ("", ""))); f_WarnEntry_warnEntryDesc = "\231\155\174\230\160\135\228\184\141\229\174\158\231\142\176\229\133\165\229\143\163\232\161\140\229\163\176\230\152\142\231\154\132\229\134\133\229\187\186\230\149\136\229\186\148" }, B_dData_dList.C_List_Nil))))))))))))))))

# 81 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_warnEntryCode = (fun (dtb_u_u37 : t_WarnEntry) -> (match dtb_u_u37 with
  | { f_WarnEntry_warnEntryCode = dtb_u_u38; f_WarnEntry_warnEntryTemplate = dtb_u_u39; f_WarnEntry_warnEntryDesc = dtb_u_u40 } -> dtb_u_u38
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_warnEntryTemplate = (fun (dtb_u_u41 : t_WarnEntry) -> (match dtb_u_u41 with
  | { f_WarnEntry_warnEntryCode = dtb_u_u42; f_WarnEntry_warnEntryTemplate = dtb_u_u43; f_WarnEntry_warnEntryDesc = dtb_u_u44 } -> dtb_u_u43
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Base/Diagnostics/Warning.vuna"
let v_warnEntryDesc = (fun (dtb_u_u45 : t_WarnEntry) -> (match dtb_u_u45 with
  | { f_WarnEntry_warnEntryCode = dtb_u_u46; f_WarnEntry_warnEntryTemplate = dtb_u_u47; f_WarnEntry_warnEntryDesc = dtb_u_u48 } -> dtb_u_u48
  | _ -> failwith "DT: impossible branch"
))
