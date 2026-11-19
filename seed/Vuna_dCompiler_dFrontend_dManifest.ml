open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dManifest_dDependencySource = C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath of (string) | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit of (string) * (string) | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl of (string)
and t_Vuna_dCompiler_dFrontend_dManifest_dDependency = { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias : string; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource : t_Vuna_dCompiler_dFrontend_dManifest_dDependencySource; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe }
and t_Vuna_dCompiler_dFrontend_dManifest_dLayer = { f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName : string; f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerLine : int }
and t_Vuna_dCompiler_dFrontend_dManifest_dManifest = { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestIsWorkspace : bool; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies : t_Vuna_dCompiler_dFrontend_dManifest_dDependency Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath : string; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings : bool Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors : int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings : bool Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc = { f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias : string; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine : int }

# 41 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dManifest_dDependency) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__0; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__1; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__2; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepSourceOf = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dManifest_dDependency) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__4; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__5; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__6; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__7 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dManifest_dDependency) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__8; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__9; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__10; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__11 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepIdentityOf = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dManifest_dDependency) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__12; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__13; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__14; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_demptyDepAcc = (fun (alias : string) (line : int) -> { f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias = alias; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine = line })

# 92 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 95 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar = (fun (c : int) -> (if (c >= 65) then (c <= 90) else false))

# 98 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar = (fun (c : int) -> (if (c >= 97) then (c <= 122) else false))

# 101 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_datLine = (fun (path : string) (line : int) (msg : string) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt line); ": "; msg]) else (String.concat "" [path; ":"; (bi_strFromInt line); ": "; msg])))

# 104 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr = (fun (path : string) (msg : string) -> (if (path = "") then msg else (String.concat "" [path; ": "; msg])))

# 107 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dsameSection = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) dtb__16) dtb__18) then (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection _uctx0) dtb__17) dtb__19) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine = (fun (path : string) (section : string Base_dData_dList.t_Base_dData_dList_dList) (key : string) (entries : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__20) -> dtb__20
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 1
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc = (fun (path : string) (section : string Base_dData_dList.t_Base_dData_dList_dList) (key : string) (entries : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__21) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt dtb__21); ": "]) else (String.concat "" [path; ":"; (bi_strFromInt dtb__21); ": "]))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (path = "") then "" else (path ^ ": "))
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstringField = (fun (path : string) (section : string Base_dData_dList.t_Base_dData_dList_dList) (key : string) (entries : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22) -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__23) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__23))))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedString (key))) key)
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 131 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstringListField = (fun (path : string) (section : string Base_dData_dList.t_Base_dData_dList_dList) (key : string) (entries : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__24) -> (match dtb__24 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray (dtb__25) -> (match (Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_darrayStrings dtb__25) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (key))) key)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__26) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__26))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (key))) key)
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 142 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dintField = (fun (path : string) (section : string Base_dData_dList.t_Base_dData_dList_dList) (key : string) (entries : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__27) -> (match dtb__27 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt (dtb__28) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__28))))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedInt (key))) key)
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 149 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dboolField = (fun (path : string) (section : string Base_dData_dList.t_Base_dData_dList_dList) (key : string) (entries : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__29) -> (match dtb__29 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (dtb__30) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__30))))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedBool (key))) key)
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 156 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList = (fun mc0 -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__31) -> dtb__31
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disLayersSection = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__32, dtb__33) -> (if (dtb__32 = "layers") then (match dtb__33 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> true
  | _ -> false
) else false)
  | _ -> false
))

# 167 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dlayerSeen = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (if (mc0 = dtb__36) then true else ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerSeen mc0) dtb__37))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__40; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__41; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__42; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__43 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__40) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("layers", Base_dData_dList.C_Base_dData_dList_dList_Nil))) then (if ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerSeen dtb__41) mc2) then (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers mc0) dtb__39) mc2) else (match dtb__42 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray (dtb__44) -> (match (Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_darrayStrings dtb__44) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__43) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (dtb__41))) dtb__41)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__45) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers mc0) dtb__39) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__41, mc2)))) (fun (ls : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName = dtb__41; f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses = dtb__45; f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerLine = dtb__43 }, ls))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__43) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (dtb__41))) dtb__41)
)) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers mc0) dtb__39) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesOf = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (if ((dtb__46).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName = mc1) then (dtb__46).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses else ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesOf dtb__47) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dreachesFrom = (fun (fuel : int) (layers : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (todo : string Base_dData_dList.t_Base_dData_dList_dList) (seen : string Base_dData_dList.t_Base_dData_dList_dList) (target : string) -> (if (fuel <= 0) then false else (match todo with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (if (dtb__48 = target) then true else (if ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerSeen dtb__48) seen) then (((((v_Vuna_dCompiler_dFrontend_dManifest_dreachesFrom (fuel - 1)) layers) dtb__49) seen) target) else (((((v_Vuna_dCompiler_dFrontend_dManifest_dreachesFrom (fuel - 1)) layers) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__49) ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesOf layers) dtb__48))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__48, seen))) target)))
  | _ -> failwith "DT: impossible branch"
)))

# 205 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesTotal = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__50, dtb__51) -> ((Base_dData_dList.v_Base_dData_dList_dlength (dtb__50).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses) + (v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesTotal dtb__51))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dlayerVisitBound = (fun (layers : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesTotal layers) + (Base_dData_dList.v_Base_dData_dList_dlength layers)) + 1))

# 209 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dlayerHasCycle = (fun (layers : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (l : t_Vuna_dCompiler_dFrontend_dManifest_dLayer) -> (((((v_Vuna_dCompiler_dFrontend_dManifest_dreachesFrom (v_Vuna_dCompiler_dFrontend_dManifest_dlayerVisitBound layers)) layers) ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesOf layers) (l).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName)) Base_dData_dList.C_Base_dData_dList_dList_Nil) (l).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName))

# 232 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dorFalse = (fun (mc0 : bool Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__52) -> dtb__52
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__53, dtb__54) -> (match dtb__54 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (match dtb__56 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__53 = "dependencies")
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 243 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disLintSection = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (if (dtb__57 = "lint") then true else false)
  | _ -> false
))

# 247 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__61, dtb__62) -> (match dtb__62 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__61
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 251 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disDepSourceKey = (fun (key : string) -> (if (if (if (if (if (key = "path") then true else (key = "git")) then true else (key = "rev")) then true else (key = "url")) then true else (key = "hash")) then true else (key = "identity")))

# 257 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry) -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__63; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__64; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__65; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__66 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__63) Base_dData_dList.C_Base_dData_dList_dList_Nil) then ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnexpectedTopLevelKey (dtb__64))) dtb__64) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__63) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("package", Base_dData_dList.C_Base_dData_dList_dList_Nil))) then (if (dtb__64 = "name") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__64, "package"))) dtb__64) "package")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__63) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("workspace", Base_dData_dList.C_Base_dData_dList_dList_Nil))) then (if (dtb__64 = "members") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__64, "workspace"))) dtb__64) "workspace")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__63) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("export", Base_dData_dList.C_Base_dData_dList_dList_Nil))) then (if (dtb__64 = "modules") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__64, "export"))) dtb__64) "export")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__63) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("diagnostics", Base_dData_dList.C_Base_dData_dList_dList_Nil))) then (if (if (if (if (if (dtb__64 = "format") then true else (dtb__64 = "warnings")) then true else (dtb__64 = "max-errors")) then true else (dtb__64 = "lang")) then true else (dtb__64 = "deny-warnings")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__64, "diagnostics"))) dtb__64) "diagnostics")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__63) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("layers", Base_dData_dList.C_Base_dData_dList_dList_Nil))) then (match dtb__65 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray (dtb__67) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (dtb__64))) dtb__64)
) else (if (v_Vuna_dCompiler_dFrontend_dManifest_disLayersSection dtb__63) then ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_LayerKeyMustBeQuoted ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((Base_dData_dList.v_Base_dData_dList_dappend dtb__63) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__64, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((Base_dData_dList.v_Base_dData_dList_dappend dtb__63) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__64, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__63) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("dependencies", Base_dData_dList.C_Base_dData_dList_dList_Nil))) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__63) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("registry", Base_dData_dList.C_Base_dData_dList_dList_Nil))) then (if (dtb__64 = "index") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__64, "registry"))) dtb__64) "registry")) else (if (v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection dtb__63) then (if (v_Vuna_dCompiler_dFrontend_dManifest_disDepSourceKey dtb__64) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownSourceKey (dtb__64, (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection dtb__63)))) dtb__64) (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection dtb__63))) else (if (v_Vuna_dCompiler_dFrontend_dManifest_disLintSection dtb__63) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__66) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownSection ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__63)))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__63)))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry mc0) dtb__68) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__70) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__70))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__71) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries mc0) dtb__69)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (if ((dtb__72).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias = mc0) then true else ((v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc mc0) dtb__73))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_densureAcc = (fun (alias : string) (line : int) (acc : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc Base_dData_dList.t_Base_dData_dList_dList) -> (if ((v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc alias) acc) then acc else ((Base_dData_dList.v_Base_dData_dList_dappend acc) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dManifest_demptyDepAcc alias) line), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 291 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc = (fun (mc0 : string) (mc1 : (t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc) -> t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc) (mc2 : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (if ((dtb__74).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((mc1 dtb__74), dtb__75)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, (((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc mc0) mc1) dtb__75))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccPath = (fun (s : string) (acc : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc) -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (s)) })

# 299 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccGit = (fun (s : string) (acc : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc) -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (s)) })

# 302 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccRev = (fun (s : string) (acc : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc) -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (s)) })

# 305 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccUrl = (fun (s : string) (acc : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc) -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (s)) })

# 308 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccHash = (fun (s : string) (acc : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc) -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (s)) })

# 311 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccIdentity = (fun (s : string) (acc : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc) -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (s)) })

# 314 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf = (fun (mc0 : string) (mc1 : string) (mc2 : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) (mc3 : int) -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__76) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__76))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) mc3) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedString (mc1))) mc1)
))

# 319 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dapplyDepEntry = (fun (path : string) (alias : string) (key : string) (value : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) (line : int) (acc : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc Base_dData_dList.t_Base_dData_dList_dList) -> ((fun ensured -> (if (key = "path") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__77) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__77))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__78) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccPath dtb__78)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "git") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__80) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccGit dtb__80)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "rev") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__81) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__81))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__82) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccRev dtb__82)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "url") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__83) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__83))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__84) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccUrl dtb__84)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "hash") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__85) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__85))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__86) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccHash dtb__86)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__87) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__87))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__88) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccIdentity dtb__88)) ensured)))
  | _ -> failwith "DT: impossible branch"
))))))) (((v_Vuna_dCompiler_dFrontend_dManifest_densureAcc alias) line) acc)))

# 349 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__91; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__92; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__93; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__94 } -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection dtb__91) then (match ((((((v_Vuna_dCompiler_dFrontend_dManifest_dapplyDepEntry mc0) (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection dtb__91)) dtb__92) dtb__93) dtb__94) mc2) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__95) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__95))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__96) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables mc0) dtb__90) dtb__96)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables mc0) dtb__90) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__99; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__100; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__101; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__102 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dData_dString.v_Eq_uString) dtb__99) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("dependencies", Base_dData_dList.C_Base_dData_dList_dList_Nil))) then (match dtb__101 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__103) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings mc0) dtb__98) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__100; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__103; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__102 } }, mc2)))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__102) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DependencyPathNotString (dtb__100))) dtb__100)
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings mc0) dtb__98) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dbuildDependency = (fun (path : string) (acc : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__104) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__105) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_SourceConflict ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__106) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_SourceConflict ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__104)); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__107) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_GitRevRequired ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__108) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__109) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_SourceConflict ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__107, dtb__108)); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__110) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__110)); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DependencySourceMissing ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dFrontend_dManifest_dDependency Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildDependency mc0) dtb__111) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__113) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__113))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__114) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables mc0) dtb__112) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__114, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies = (fun (path : string) (entries : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings path) entries) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__115) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__115))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__116) -> (match (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables path) entries) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__117) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__117))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__118) -> (match (((v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables path) dtb__118) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__119) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__119))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__120) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing })) dtb__116)) dtb__120)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disHexChar = (fun (c : int) -> (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar c) then true else (if (c >= 65) then (c <= 70) else false)) then true else (if (c >= 97) then (c <= 102) else false)))

# 431 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dallHex = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__121, dtb__122) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disHexChar dtb__121) then (v_Vuna_dCompiler_dFrontend_dManifest_dallHex dtb__122) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText = (fun (s : string) -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "sha256:") s) then (if ((bi_strLength s) = 71) then (v_Vuna_dCompiler_dFrontend_dManifest_dallHex (Base_dData_dList.dtp_unpack (((Base_dData_dString.v_Base_dData_dString_dsubstring 7) 64) s))) else false) else (if ((bi_strLength s) = 64) then (v_Vuna_dCompiler_dFrontend_dManifest_dallHex (Base_dData_dList.dtp_unpack s)) else false)))

# 443 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm = (fun (mc0 : string) (mc1 : string) (mc2 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__123) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText dtb__123) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_HashMalformed (dtb__123))) dtb__123))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcheckIdentityForm = (fun (mc0 : string) (mc1 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__124) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText dtb__124) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_IdentityMalformed (dtb__124))) dtb__124))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependency = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dManifest_dDependency) -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__125; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__126; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__127; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__128 } -> (if (dtb__125 = "") then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyDependencyName) else (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckIdentityForm mc0) dtb__128) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__129) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__129))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__130) -> (match dtb__126 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__131) -> (if (dtb__131 = "") then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyDependencyPath (dtb__125))) dtb__125) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm mc0) dtb__125) dtb__127))
  | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__132, dtb__133) -> (match dtb__127 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingHash (dtb__125))) dtb__125)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__134) -> (if (dtb__132 = "") then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DependencySourceMissing (dtb__125))) dtb__125) else (if (dtb__133 = "") then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_GitRevRequired (dtb__125))) dtb__125) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm mc0) dtb__125) dtb__127)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__135) -> (match dtb__127 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingHash (dtb__125))) dtb__125)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__136) -> (if (dtb__135 = "") then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DependencySourceMissing (dtb__125))) dtb__125) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm mc0) dtb__125) dtb__127))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dFrontend_dManifest_dDependency Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, dtb__138) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__137)) mc1) then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DuplicateDependency ((v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__137)))) (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__137)) else (match ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependency mc0) dtb__137) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__139) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__139))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__140) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen mc0) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__137), mc1))) dtb__138)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies = (fun (path : string) (deps : t_Vuna_dCompiler_dFrontend_dManifest_dDependency Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) Base_dData_dList.C_Base_dData_dList_dList_Nil) deps))

# 486 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat = (fun (mc0 : string) (mc1 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__141) -> (if (if (if (if (dtb__141 = "short") then true else (dtb__141 = "human")) then true else (dtb__141 = "json")) then true else (dtb__141 = "sarif")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidDiagFormat (dtb__141))) dtb__141))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax = (fun (mc0 : string) (mc1 : int Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__142) -> (if (dtb__142 >= 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidDiagMaxErrors ((bi_strFromInt dtb__142)))) (bi_strFromInt dtb__142)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstartsWithSection = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__143, dtb__144) -> (dtb__143 = mc1)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent = (fun (mc0 : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__145, dtb__146) -> (match dtb__145 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__147; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__148; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__149; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__150 } -> (if ((v_Vuna_dCompiler_dFrontend_dManifest_dstartsWithSection dtb__147) mc1) then true else ((v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent dtb__146) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckRootSections = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent mc1) dtb__151) then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_PackageSectionInWorkspaceRoot (dtb__151))) dtb__151) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckRootSections mc0) mc1) dtb__152))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateRootShape = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot ((v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent mc1) "workspace")) then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingPackageName) else (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ (Base_dData_dList.v_Eq_uBase_uData_uList_uList_ua Base_dData_dString.v_Eq_uString)) mc3) Base_dData_dList.C_Base_dData_dList_dList_Nil) then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyWorkspace) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckRootSections mc0) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("export", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("layers", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("dependencies", Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__153) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 560 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__154, dtb__155) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__154) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__154)) then true else (dtb__154 = 45)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars dtb__155) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName = (fun (name : string) -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars (Base_dData_dList.dtp_unpack name)))

# 579 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (if (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__156) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__156)) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__156)) then true else (dtb__156 = 95)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__157) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__158) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__159) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment = (fun (seg : string) -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars (Base_dData_dList.dtp_unpack seg)))

# 568 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__160, dtb__161) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment dtb__160) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments dtb__161) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 565 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName = (fun (name : string) -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)))

# 223 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayerTargets = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__162) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayerTargets mc0) dtb__163) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_LayerInvalidTarget (dtb__162))) dtb__162))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayers = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__164, dtb__165) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName (dtb__164).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName) then (match ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayerTargets mc0) (dtb__164).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__166) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__166))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__167) -> (if ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerHasCycle mc1) dtb__164) then ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) (dtb__164).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_LayerCycle ((dtb__164).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName))) (dtb__164).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayers mc0) mc1) dtb__165))
  | _ -> failwith "DT: impossible branch"
) else ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) (dtb__164).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_LayerInvalidName ((dtb__164).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName))) (dtb__164).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 589 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName = (fun (mc0 : bool) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string) (mc3 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__168) -> (if (dtb__168 = "") then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc2) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyPackageName) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName dtb__168) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidPackageName (dtb__168))) dtb__168)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (if mc0 then ((Base_dData_dList.v_Base_dData_dList_dlength mc1) > 0) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc2) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingPackageName))
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__169, dtb__170) -> (if (dtb__169 = "") then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyMember) else ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers mc0) dtb__170))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 602 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__171, dtb__172) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__171) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__172) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidExportModule (dtb__171))) dtb__171))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 607 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__173) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__173)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 611 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dManifest_dManifest) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__174; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__175; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestIsWorkspace = dtb__176; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__177; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__178; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__179; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = dtb__180; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = dtb__181; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = dtb__182; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = dtb__183; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = dtb__184; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex = dtb__185; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers = dtb__186 } -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName dtb__176) dtb__175) dtb__179) dtb__174)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers dtb__179) dtb__175)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports dtb__179) dtb__177)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies dtb__179) dtb__178)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayers dtb__179) dtb__186) dtb__186)) (fun _u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Vuna_dCompiler_dBase_dDiag.v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck) { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__174; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__175; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestIsWorkspace = dtb__176; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__177; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__178; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__179; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = dtb__180; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = dtb__181; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = dtb__182; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = dtb__183; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = dtb__184; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex = dtb__185; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers = dtb__186 })))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddirResult = (fun (dir : string) -> (if (dir = "") then "/" else dir))

# 626 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__187, dtb__188) -> (if (dtb__187 = 47) then (v_Vuna_dCompiler_dFrontend_dManifest_ddirResult (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse dtb__188))) else (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev dtb__188))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir = (fun (path : string) -> (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.dtp_unpack path))))

# 634 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath = (fun (manifest : t_Vuna_dCompiler_dFrontend_dManifest_dManifest) (rel : string) -> ((fun dir -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") rel) then rel else (if (dir = ".") then rel else (String.concat "" [dir; "/"; rel])))) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (manifest).f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath)))

# 641 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang = (fun (mc0 : string) (mc1 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__189) -> (if (if (dtb__189 = "en") then true else (dtb__189 = "zh")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidDiagLang (dtb__189))) dtb__189))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest = (fun (path : string) (entries : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) entries)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers path) entries) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (fun layers -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("package", Base_dData_dList.C_Base_dData_dList_dList_Nil))) "name") entries)) (fun name -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("workspace", Base_dData_dList.C_Base_dData_dList_dList_Nil))) "members") entries)) (fun members -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateRootShape path) entries) name) (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("export", Base_dData_dList.C_Base_dData_dList_dList_Nil))) "modules") entries)) (fun exports -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies path) entries)) (fun deps -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("diagnostics", Base_dData_dList.C_Base_dData_dList_dList_Nil))) "format") entries)) (fun diagFmt -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("diagnostics", Base_dData_dList.C_Base_dData_dList_dList_Nil))) "warnings") entries)) (fun diagWarns -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dintField path) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("diagnostics", Base_dData_dList.C_Base_dData_dList_dList_Nil))) "max-errors") entries)) (fun diagMax -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("diagnostics", Base_dData_dList.C_Base_dData_dList_dList_Nil))) "lang") entries)) (fun diagLang -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("diagnostics", Base_dData_dList.C_Base_dData_dList_dList_Nil))) "deny-warnings") entries)) (fun diagDeny -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("registry", Base_dData_dList.C_Base_dData_dList_dList_Nil))) "index") entries)) (fun regIndex -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat path) diagFmt)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax path) diagMax)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang path) diagLang)) (fun _u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Vuna_dCompiler_dBase_dDiag.v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck) { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = name; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestIsWorkspace = ((v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent entries) "workspace"); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = exports; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = deps; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = path; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = diagFmt; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = diagWarns; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = diagMax; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = diagLang; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = diagDeny; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex = regIndex; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers = layers }))))))))))))))))))))))))))))))))))

# 550 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest = (fun (path : string) (contents : string) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt path) contents)) (fun (entries : Vuna_dCompiler_dFrontend_dToml.t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest path) entries))))
