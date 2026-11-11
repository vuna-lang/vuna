open Vuna_runtime
let v_Vuna_dCompiler_dDiagnostics_dcodeDomain = (fun code -> (match ((Base_dString.v_Base_dString_dsplit "_") code) with
  | Base_dList.C_Base_dList_dList_Nil -> code
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_ddiagPhaseOf = (fun mc0 -> (if (mc0 = "LX") then "lex" else (if (mc0 = "PS") then "parse" else (if (mc0 = "RN") then "resolve" else (if (mc0 = "LD") then "load" else (if (mc0 = "PKG") then "package" else (if (mc0 = "TC") then "elab" else (if (mc0 = "CG") then "codegen" else (if (mc0 = "IC") then "internal" else (if (mc0 = "UN") then "usage" else (if (mc0 = "LN") then "lint" else (if (mc0 = "FX") then "effect" else "tool"))))))))))))

let v_Vuna_dCompiler_dDiagnostics_ddiagCategoryOf = (fun mc0 -> (if (mc0 = "LX") then "syntax" else (if (mc0 = "PS") then "syntax" else (if (mc0 = "RN") then "resolve" else (if (mc0 = "LD") then "package" else (if (mc0 = "PKG") then "package" else (if (mc0 = "TC") then "types" else (if (mc0 = "CG") then "codegen" else (if (mc0 = "IC") then "internal" else (if (mc0 = "UN") then "quantity" else (if (mc0 = "LN") then "style" else (if (mc0 = "FX") then "effects" else "tool"))))))))))))

let v_Vuna_dCompiler_dDiagnostics_ddiagSeverityOf = (fun mc0 -> (if (mc0 = "UN") then "warning" else (if (mc0 = "LN") then "warning" else "error")))

let rec v_Vuna_dCompiler_dDiagnostics_dtcDescPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__2).Vuna_dCompiler_dDiagnostics_dTc.f_Vuna_dCompiler_dDiagnostics_dTc_dTcEntry_tcEntryCode; Base_dPair.f_Base_dPair_dPair_second = (dtb__2).Vuna_dCompiler_dDiagnostics_dTc.f_Vuna_dCompiler_dDiagnostics_dTc_dTcEntry_tcEntryDesc }, (v_Vuna_dCompiler_dDiagnostics_dtcDescPairs dtb__3)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_dcgDescPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__4).Vuna_dCompiler_dDiagnostics_dCg.f_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_cgEntryCode; Base_dPair.f_Base_dPair_dPair_second = (dtb__4).Vuna_dCompiler_dDiagnostics_dCg.f_Vuna_dCompiler_dDiagnostics_dCg_dCgEntry_cgEntryDesc }, (v_Vuna_dCompiler_dDiagnostics_dcgDescPairs dtb__5)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_dicDescPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__6).Vuna_dCompiler_dDiagnostics_dIc.f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryCode; Base_dPair.f_Base_dPair_dPair_second = (dtb__6).Vuna_dCompiler_dDiagnostics_dIc.f_Vuna_dCompiler_dDiagnostics_dIc_dIcEntry_icEntryDesc }, (v_Vuna_dCompiler_dDiagnostics_dicDescPairs dtb__7)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_dlexDescPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__8).Vuna_dCompiler_dFrontend_dDiagnostics.f_Vuna_dCompiler_dFrontend_dDiagnostics_dLexEntry_lexEntryCode; Base_dPair.f_Base_dPair_dPair_second = (dtb__8).Vuna_dCompiler_dFrontend_dDiagnostics.f_Vuna_dCompiler_dFrontend_dDiagnostics_dLexEntry_lexEntryDesc }, (v_Vuna_dCompiler_dDiagnostics_dlexDescPairs dtb__9)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_dpsDescPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__10).Vuna_dCompiler_dFrontend_dDiagnostics.f_Vuna_dCompiler_dFrontend_dDiagnostics_dPsEntry_psEntryCode; Base_dPair.f_Base_dPair_dPair_second = (dtb__10).Vuna_dCompiler_dFrontend_dDiagnostics.f_Vuna_dCompiler_dFrontend_dDiagnostics_dPsEntry_psEntryDesc }, (v_Vuna_dCompiler_dDiagnostics_dpsDescPairs dtb__11)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_drnDescPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__12).Vuna_dCompiler_dDiagnostics_dRn.f_Vuna_dCompiler_dDiagnostics_dRn_dRnEntry_rnEntryCode; Base_dPair.f_Base_dPair_dPair_second = (dtb__12).Vuna_dCompiler_dDiagnostics_dRn.f_Vuna_dCompiler_dDiagnostics_dRn_dRnEntry_rnEntryDesc }, (v_Vuna_dCompiler_dDiagnostics_drnDescPairs dtb__13)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_dpkgDescPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__14).Vuna_dCompiler_dDiagnostics_dPkg.f_Vuna_dCompiler_dDiagnostics_dPkg_dPkgEntry_pkgEntryCode; Base_dPair.f_Base_dPair_dPair_second = (dtb__14).Vuna_dCompiler_dDiagnostics_dPkg.f_Vuna_dCompiler_dDiagnostics_dPkg_dPkgEntry_pkgEntryDesc }, (v_Vuna_dCompiler_dDiagnostics_dpkgDescPairs dtb__15)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_dwarnDescPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__16).Vuna_dCompiler_dDiagnostics_dWarning.f_Vuna_dCompiler_dDiagnostics_dWarning_dWarnEntry_warnEntryCode; Base_dPair.f_Base_dPair_dPair_second = (dtb__16).Vuna_dCompiler_dDiagnostics_dWarning.f_Vuna_dCompiler_dDiagnostics_dWarning_dWarnEntry_warnEntryDesc }, (v_Vuna_dCompiler_dDiagnostics_dwarnDescPairs dtb__17)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDiagnostics_dldDescPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__18).Vuna_dCompiler_dLoader_dDiagnostics.f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryCode; Base_dPair.f_Base_dPair_dPair_second = (dtb__18).Vuna_dCompiler_dLoader_dDiagnostics.f_Vuna_dCompiler_dLoader_dDiagnostics_dLdEntry_ldEntryDesc }, (v_Vuna_dCompiler_dDiagnostics_dldDescPairs dtb__19)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_dallDescPairs = ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDiagnostics_dtcDescPairs Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcAll)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDiagnostics_dcgDescPairs Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgAll)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDiagnostics_dicDescPairs Vuna_dCompiler_dDiagnostics_dIc.v_Vuna_dCompiler_dDiagnostics_dIc_dicAll)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDiagnostics_dlexDescPairs Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexAll)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDiagnostics_dpsDescPairs Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsAll)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDiagnostics_drnDescPairs Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAll)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDiagnostics_dpkgDescPairs Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAll)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDiagnostics_dwarnDescPairs Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAll)) (v_Vuna_dCompiler_dDiagnostics_dldDescPairs Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldAll)))))))))

let rec v_Vuna_dCompiler_dDiagnostics_dlookupDesc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match dtb__20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> (if (dtb__22 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__23)) else ((v_Vuna_dCompiler_dDiagnostics_dlookupDesc mc0) dtb__21))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDiagnostics_ddiagDescOf = (fun code -> ((v_Vuna_dCompiler_dDiagnostics_dlookupDesc code) v_Vuna_dCompiler_dDiagnostics_dallDescPairs))
