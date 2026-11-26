open Vuna_runtime
# 85 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_codeDomain = (fun (code : string) -> (match ((B_dData_dString.v_split "_") code) with
  | B_dData_dList.C_List_Nil -> code
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_diagPhaseOf = (fun (mc0 : string) -> (if (mc0 = "LX") then "lex" else (if (mc0 = "PS") then "parse" else (if (mc0 = "RN") then "resolve" else (if (mc0 = "LD") then "load" else (if (mc0 = "PKG") then "package" else (if (mc0 = "TC") then "elab" else (if (mc0 = "CG") then "codegen" else (if (mc0 = "IC") then "internal" else (if (mc0 = "UN") then "usage" else (if (mc0 = "LN") then "lint" else (if (mc0 = "FX") then "effect" else "tool"))))))))))))

# 107 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_diagCategoryOf = (fun (mc0 : string) -> (if (mc0 = "LX") then "syntax" else (if (mc0 = "PS") then "syntax" else (if (mc0 = "RN") then "resolve" else (if (mc0 = "LD") then "package" else (if (mc0 = "PKG") then "package" else (if (mc0 = "TC") then "types" else (if (mc0 = "CG") then "codegen" else (if (mc0 = "IC") then "internal" else (if (mc0 = "UN") then "quantity" else (if (mc0 = "LN") then "style" else (if (mc0 = "FX") then "effects" else "tool"))))))))))))

# 122 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_diagSeverityOf = (fun (mc0 : string) -> (if (mc0 = "UN") then "warning" else (if (mc0 = "LN") then "warning" else "error")))

# 133 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_tcDescPairs = (fun (mc0 : Base_dDiagnostics_dTc.t_TcEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__2).Base_dDiagnostics_dTc.f_TcEntry_tcEntryCode; B_dData_dPair.f_Pair_second = (dtb__2).Base_dDiagnostics_dTc.f_TcEntry_tcEntryDesc }, (v_tcDescPairs dtb__3)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_cgDescPairs = (fun (mc0 : Base_dDiagnostics_dCg.t_CgEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__4).Base_dDiagnostics_dCg.f_CgEntry_cgEntryCode; B_dData_dPair.f_Pair_second = (dtb__4).Base_dDiagnostics_dCg.f_CgEntry_cgEntryDesc }, (v_cgDescPairs dtb__5)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_icDescPairs = (fun (mc0 : Base_dDiagnostics_dIc.t_IcEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__6).Base_dDiagnostics_dIc.f_IcEntry_icEntryCode; B_dData_dPair.f_Pair_second = (dtb__6).Base_dDiagnostics_dIc.f_IcEntry_icEntryDesc }, (v_icDescPairs dtb__7)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_lexDescPairs = (fun (mc0 : Base_dDiagnostics_dFrontend.t_LexEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__8).Base_dDiagnostics_dFrontend.f_LexEntry_lexEntryCode; B_dData_dPair.f_Pair_second = (dtb__8).Base_dDiagnostics_dFrontend.f_LexEntry_lexEntryDesc }, (v_lexDescPairs dtb__9)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_psDescPairs = (fun (mc0 : Base_dDiagnostics_dFrontend.t_PsEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__10).Base_dDiagnostics_dFrontend.f_PsEntry_psEntryCode; B_dData_dPair.f_Pair_second = (dtb__10).Base_dDiagnostics_dFrontend.f_PsEntry_psEntryDesc }, (v_psDescPairs dtb__11)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_rnDescPairs = (fun (mc0 : Base_dDiagnostics_dRn.t_RnEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__12).Base_dDiagnostics_dRn.f_RnEntry_rnEntryCode; B_dData_dPair.f_Pair_second = (dtb__12).Base_dDiagnostics_dRn.f_RnEntry_rnEntryDesc }, (v_rnDescPairs dtb__13)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_pkgDescPairs = (fun (mc0 : Base_dDiagnostics_dPkg.t_PkgEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__14).Base_dDiagnostics_dPkg.f_PkgEntry_pkgEntryCode; B_dData_dPair.f_Pair_second = (dtb__14).Base_dDiagnostics_dPkg.f_PkgEntry_pkgEntryDesc }, (v_pkgDescPairs dtb__15)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_warnDescPairs = (fun (mc0 : Base_dDiagnostics_dWarning.t_WarnEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__16).Base_dDiagnostics_dWarning.f_WarnEntry_warnEntryCode; B_dData_dPair.f_Pair_second = (dtb__16).Base_dDiagnostics_dWarning.f_WarnEntry_warnEntryDesc }, (v_warnDescPairs dtb__17)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_ldDescPairs = (fun (mc0 : Base_dDiagnostics_dLoader.t_LdEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__18).Base_dDiagnostics_dLoader.f_LdEntry_ldEntryCode; B_dData_dPair.f_Pair_second = (dtb__18).Base_dDiagnostics_dLoader.f_LdEntry_ldEntryDesc }, (v_ldDescPairs dtb__19)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_allDescPairs = ((B_dData_dList.v_append (v_tcDescPairs Base_dDiagnostics_dTc.v_tcAll)) ((B_dData_dList.v_append (v_cgDescPairs Base_dDiagnostics_dCg.v_cgAll)) ((B_dData_dList.v_append (v_icDescPairs Base_dDiagnostics_dIc.v_icAll)) ((B_dData_dList.v_append (v_lexDescPairs Base_dDiagnostics_dFrontend.v_lexAll)) ((B_dData_dList.v_append (v_psDescPairs Base_dDiagnostics_dFrontend.v_psAll)) ((B_dData_dList.v_append (v_rnDescPairs Base_dDiagnostics_dRn.v_rnAll)) ((B_dData_dList.v_append (v_pkgDescPairs Base_dDiagnostics_dPkg.v_pkgAll)) ((B_dData_dList.v_append (v_warnDescPairs Base_dDiagnostics_dWarning.v_warnAll)) (v_ldDescPairs Base_dDiagnostics_dLoader.v_ldAll)))))))))

# 185 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_lookupDesc = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (match dtb__20 with
  | { B_dData_dPair.f_Pair_first = dtb__22; B_dData_dPair.f_Pair_second = dtb__23 } -> (if (dtb__22 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__23)) else ((v_lookupDesc mc0) dtb__21))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_diagDescOf = (fun (code : string) -> ((v_lookupDesc code) v_allDescPairs))
