open Vuna_runtime
# 49 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dcodeDomain = (fun code -> (match ((Base_dData_dString.v_Base_dData_dString_dsplit "_") code) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> code
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_ddiagPhaseOf = (fun (mc0 : string) -> (if (mc0 = "LX") then "lex" else (if (mc0 = "PS") then "parse" else (if (mc0 = "RN") then "resolve" else (if (mc0 = "LD") then "load" else (if (mc0 = "PKG") then "package" else (if (mc0 = "TC") then "elab" else (if (mc0 = "CG") then "codegen" else (if (mc0 = "IC") then "internal" else (if (mc0 = "UN") then "usage" else (if (mc0 = "LN") then "lint" else (if (mc0 = "FX") then "effect" else "tool"))))))))))))

# 71 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_ddiagCategoryOf = (fun (mc0 : string) -> (if (mc0 = "LX") then "syntax" else (if (mc0 = "PS") then "syntax" else (if (mc0 = "RN") then "resolve" else (if (mc0 = "LD") then "package" else (if (mc0 = "PKG") then "package" else (if (mc0 = "TC") then "types" else (if (mc0 = "CG") then "codegen" else (if (mc0 = "IC") then "internal" else (if (mc0 = "UN") then "quantity" else (if (mc0 = "LN") then "style" else (if (mc0 = "FX") then "effects" else "tool"))))))))))))

# 86 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_ddiagSeverityOf = (fun (mc0 : string) -> (if (mc0 = "UN") then "warning" else (if (mc0 = "LN") then "warning" else "error")))

# 97 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dtcDescPairs = (fun (mc0 : Vuna_dCompiler_dBase_dDiagnostics_dTc.t_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__2).Vuna_dCompiler_dBase_dDiagnostics_dTc.f_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcEntry_tcEntryCode; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__2).Vuna_dCompiler_dBase_dDiagnostics_dTc.f_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcEntry_tcEntryDesc }, (v_Vuna_dCompiler_dBase_dDiagnostics_dtcDescPairs dtb__3)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dcgDescPairs = (fun (mc0 : Vuna_dCompiler_dBase_dDiagnostics_dCg.t_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__4).Vuna_dCompiler_dBase_dDiagnostics_dCg.f_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgEntry_cgEntryCode; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__4).Vuna_dCompiler_dBase_dDiagnostics_dCg.f_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgEntry_cgEntryDesc }, (v_Vuna_dCompiler_dBase_dDiagnostics_dcgDescPairs dtb__5)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dicDescPairs = (fun (mc0 : Vuna_dCompiler_dBase_dDiagnostics_dIc.t_Vuna_dCompiler_dBase_dDiagnostics_dIc_dIcEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__6).Vuna_dCompiler_dBase_dDiagnostics_dIc.f_Vuna_dCompiler_dBase_dDiagnostics_dIc_dIcEntry_icEntryCode; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__6).Vuna_dCompiler_dBase_dDiagnostics_dIc.f_Vuna_dCompiler_dBase_dDiagnostics_dIc_dIcEntry_icEntryDesc }, (v_Vuna_dCompiler_dBase_dDiagnostics_dicDescPairs dtb__7)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dlexDescPairs = (fun (mc0 : Vuna_dCompiler_dBase_dDiagnostics_dFrontend.t_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__8).Vuna_dCompiler_dBase_dDiagnostics_dFrontend.f_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexEntry_lexEntryCode; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__8).Vuna_dCompiler_dBase_dDiagnostics_dFrontend.f_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexEntry_lexEntryDesc }, (v_Vuna_dCompiler_dBase_dDiagnostics_dlexDescPairs dtb__9)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dpsDescPairs = (fun (mc0 : Vuna_dCompiler_dBase_dDiagnostics_dFrontend.t_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__10).Vuna_dCompiler_dBase_dDiagnostics_dFrontend.f_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsEntry_psEntryCode; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__10).Vuna_dCompiler_dBase_dDiagnostics_dFrontend.f_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsEntry_psEntryDesc }, (v_Vuna_dCompiler_dBase_dDiagnostics_dpsDescPairs dtb__11)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_drnDescPairs = (fun (mc0 : Vuna_dCompiler_dBase_dDiagnostics_dRn.t_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__12).Vuna_dCompiler_dBase_dDiagnostics_dRn.f_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnEntry_rnEntryCode; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__12).Vuna_dCompiler_dBase_dDiagnostics_dRn.f_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnEntry_rnEntryDesc }, (v_Vuna_dCompiler_dBase_dDiagnostics_drnDescPairs dtb__13)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dpkgDescPairs = (fun (mc0 : Vuna_dCompiler_dBase_dDiagnostics_dPkg.t_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__14).Vuna_dCompiler_dBase_dDiagnostics_dPkg.f_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgEntry_pkgEntryCode; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__14).Vuna_dCompiler_dBase_dDiagnostics_dPkg.f_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgEntry_pkgEntryDesc }, (v_Vuna_dCompiler_dBase_dDiagnostics_dpkgDescPairs dtb__15)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dwarnDescPairs = (fun (mc0 : Vuna_dCompiler_dBase_dDiagnostics_dWarning.t_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__16).Vuna_dCompiler_dBase_dDiagnostics_dWarning.f_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnEntry_warnEntryCode; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__16).Vuna_dCompiler_dBase_dDiagnostics_dWarning.f_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnEntry_warnEntryDesc }, (v_Vuna_dCompiler_dBase_dDiagnostics_dwarnDescPairs dtb__17)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dldDescPairs = (fun (mc0 : Vuna_dCompiler_dBase_dDiagnostics_dLoader.t_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__18).Vuna_dCompiler_dBase_dDiagnostics_dLoader.f_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdEntry_ldEntryCode; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (dtb__18).Vuna_dCompiler_dBase_dDiagnostics_dLoader.f_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdEntry_ldEntryDesc }, (v_Vuna_dCompiler_dBase_dDiagnostics_dldDescPairs dtb__19)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_dallDescPairs = ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dBase_dDiagnostics_dtcDescPairs Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcAll)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dBase_dDiagnostics_dcgDescPairs Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgAll)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dBase_dDiagnostics_dicDescPairs Vuna_dCompiler_dBase_dDiagnostics_dIc.v_Vuna_dCompiler_dBase_dDiagnostics_dIc_dicAll)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dBase_dDiagnostics_dlexDescPairs Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexAll)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dBase_dDiagnostics_dpsDescPairs Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsAll)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dBase_dDiagnostics_drnDescPairs Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAll)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dBase_dDiagnostics_dpkgDescPairs Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAll)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dBase_dDiagnostics_dwarnDescPairs Vuna_dCompiler_dBase_dDiagnostics_dWarning.v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnAll)) (v_Vuna_dCompiler_dBase_dDiagnostics_dldDescPairs Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldAll)))))))))

# 149 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_Vuna_dCompiler_dBase_dDiagnostics_dlookupDesc = (fun (mc0 : string) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (match dtb__20 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__22; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__23 } -> (if (dtb__22 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__23)) else ((v_Vuna_dCompiler_dBase_dDiagnostics_dlookupDesc mc0) dtb__21))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_Vuna_dCompiler_dBase_dDiagnostics_ddiagDescOf = (fun code -> ((v_Vuna_dCompiler_dBase_dDiagnostics_dlookupDesc code) v_Vuna_dCompiler_dBase_dDiagnostics_dallDescPairs))
