open Vuna_runtime
# 85 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_codeDomain = (fun (dtb_u_u1 : string) -> (match ((B_dData_dString.v_split "_") dtb_u_u1) with
  | B_dData_dList.C_List_Nil -> dtb_u_u1
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2, dtb_u_u3) -> dtb_u_u2
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_diagPhaseOf = (fun (dtb_u_u4 : string) -> (if (dtb_u_u4 = "LX") then "lex" else (if (dtb_u_u4 = "PS") then "parse" else (if (dtb_u_u4 = "RN") then "resolve" else (if (dtb_u_u4 = "LD") then "load" else (if (dtb_u_u4 = "PKG") then "package" else (if (dtb_u_u4 = "TC") then "elab" else (if (dtb_u_u4 = "CG") then "codegen" else (if (dtb_u_u4 = "IC") then "internal" else (if (dtb_u_u4 = "UN") then "usage" else (if (dtb_u_u4 = "LN") then "lint" else (if (dtb_u_u4 = "FX") then "effect" else "tool"))))))))))))

# 107 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_diagCategoryOf = (fun (dtb_u_u5 : string) -> (if (dtb_u_u5 = "LX") then "syntax" else (if (dtb_u_u5 = "PS") then "syntax" else (if (dtb_u_u5 = "RN") then "resolve" else (if (dtb_u_u5 = "LD") then "package" else (if (dtb_u_u5 = "PKG") then "package" else (if (dtb_u_u5 = "TC") then "types" else (if (dtb_u_u5 = "CG") then "codegen" else (if (dtb_u_u5 = "IC") then "internal" else (if (dtb_u_u5 = "UN") then "quantity" else (if (dtb_u_u5 = "LN") then "style" else (if (dtb_u_u5 = "FX") then "effects" else "tool"))))))))))))

# 122 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_diagSeverityOf = (fun (dtb_u_u6 : string) -> (if (dtb_u_u6 = "UN") then "warning" else (if (dtb_u_u6 = "LN") then "warning" else "error")))

# 133 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_tcDescPairs = (fun (dtb_u_u7 : Base_dDiagnostics_dTc.t_TcEntry B_dData_dList.t_List) -> (match dtb_u_u7 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u8, dtb_u_u9) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u8).Base_dDiagnostics_dTc.f_TcEntry_tcEntryCode; B_dData_dPair.f_Pair_second = (dtb_u_u8).Base_dDiagnostics_dTc.f_TcEntry_tcEntryDesc }, (v_tcDescPairs dtb_u_u9)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_cgDescPairs = (fun (dtb_u_u10 : Base_dDiagnostics_dCg.t_CgEntry B_dData_dList.t_List) -> (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u11, dtb_u_u12) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u11).Base_dDiagnostics_dCg.f_CgEntry_cgEntryCode; B_dData_dPair.f_Pair_second = (dtb_u_u11).Base_dDiagnostics_dCg.f_CgEntry_cgEntryDesc }, (v_cgDescPairs dtb_u_u12)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_icDescPairs = (fun (dtb_u_u13 : Base_dDiagnostics_dIc.t_IcEntry B_dData_dList.t_List) -> (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u14).Base_dDiagnostics_dIc.f_IcEntry_icEntryCode; B_dData_dPair.f_Pair_second = (dtb_u_u14).Base_dDiagnostics_dIc.f_IcEntry_icEntryDesc }, (v_icDescPairs dtb_u_u15)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_lexDescPairs = (fun (dtb_u_u16 : Base_dDiagnostics_dFrontend.t_LexEntry B_dData_dList.t_List) -> (match dtb_u_u16 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u17, dtb_u_u18) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u17).Base_dDiagnostics_dFrontend.f_LexEntry_lexEntryCode; B_dData_dPair.f_Pair_second = (dtb_u_u17).Base_dDiagnostics_dFrontend.f_LexEntry_lexEntryDesc }, (v_lexDescPairs dtb_u_u18)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_psDescPairs = (fun (dtb_u_u19 : Base_dDiagnostics_dFrontend.t_PsEntry B_dData_dList.t_List) -> (match dtb_u_u19 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u20).Base_dDiagnostics_dFrontend.f_PsEntry_psEntryCode; B_dData_dPair.f_Pair_second = (dtb_u_u20).Base_dDiagnostics_dFrontend.f_PsEntry_psEntryDesc }, (v_psDescPairs dtb_u_u21)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_rnDescPairs = (fun (dtb_u_u22 : Base_dDiagnostics_dRn.t_RnEntry B_dData_dList.t_List) -> (match dtb_u_u22 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u23, dtb_u_u24) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u23).Base_dDiagnostics_dRn.f_RnEntry_rnEntryCode; B_dData_dPair.f_Pair_second = (dtb_u_u23).Base_dDiagnostics_dRn.f_RnEntry_rnEntryDesc }, (v_rnDescPairs dtb_u_u24)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_pkgDescPairs = (fun (dtb_u_u25 : Base_dDiagnostics_dPkg.t_PkgEntry B_dData_dList.t_List) -> (match dtb_u_u25 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u26, dtb_u_u27) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u26).Base_dDiagnostics_dPkg.f_PkgEntry_pkgEntryCode; B_dData_dPair.f_Pair_second = (dtb_u_u26).Base_dDiagnostics_dPkg.f_PkgEntry_pkgEntryDesc }, (v_pkgDescPairs dtb_u_u27)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_warnDescPairs = (fun (dtb_u_u28 : Base_dDiagnostics_dWarning.t_WarnEntry B_dData_dList.t_List) -> (match dtb_u_u28 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u29).Base_dDiagnostics_dWarning.f_WarnEntry_warnEntryCode; B_dData_dPair.f_Pair_second = (dtb_u_u29).Base_dDiagnostics_dWarning.f_WarnEntry_warnEntryDesc }, (v_warnDescPairs dtb_u_u30)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Base/Diagnostics.vuna"
let[@tail_mod_cons] rec v_ldDescPairs = (fun (dtb_u_u31 : Base_dDiagnostics_dLoader.t_LdEntry B_dData_dList.t_List) -> (match dtb_u_u31 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u33) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u32).Base_dDiagnostics_dLoader.f_LdEntry_ldEntryCode; B_dData_dPair.f_Pair_second = (dtb_u_u32).Base_dDiagnostics_dLoader.f_LdEntry_ldEntryDesc }, (v_ldDescPairs dtb_u_u33)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_allDescPairs = ((B_dData_dList.v_append (v_tcDescPairs Base_dDiagnostics_dTc.v_tcAll)) ((B_dData_dList.v_append (v_cgDescPairs Base_dDiagnostics_dCg.v_cgAll)) ((B_dData_dList.v_append (v_icDescPairs Base_dDiagnostics_dIc.v_icAll)) ((B_dData_dList.v_append (v_lexDescPairs Base_dDiagnostics_dFrontend.v_lexAll)) ((B_dData_dList.v_append (v_psDescPairs Base_dDiagnostics_dFrontend.v_psAll)) ((B_dData_dList.v_append (v_rnDescPairs Base_dDiagnostics_dRn.v_rnAll)) ((B_dData_dList.v_append (v_pkgDescPairs Base_dDiagnostics_dPkg.v_pkgAll)) ((B_dData_dList.v_append (v_warnDescPairs Base_dDiagnostics_dWarning.v_warnAll)) (v_ldDescPairs Base_dDiagnostics_dLoader.v_ldAll)))))))))

# 185 "Vuna/Compiler/Base/Diagnostics.vuna"
let rec v_lookupDesc = (fun (dtb_u_u34 : string) (dtb_u_u35 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u35 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u36, dtb_u_u37) -> (match dtb_u_u36 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u38; B_dData_dPair.f_Pair_second = dtb_u_u39 } -> (if (dtb_u_u38 = dtb_u_u34) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u39)) else ((v_lookupDesc dtb_u_u34) dtb_u_u37))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Base/Diagnostics.vuna"
let v_diagDescOf = (fun (dtb_u_u40 : string) -> ((v_lookupDesc dtb_u_u40) v_allDescPairs))
