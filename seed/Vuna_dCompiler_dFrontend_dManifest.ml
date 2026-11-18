open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dManifest_dDependencySource = C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath of (string) | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit of (string) * (string) | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl of (string)
and t_Vuna_dCompiler_dFrontend_dManifest_dDependency = { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias : string; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource : t_Vuna_dCompiler_dFrontend_dManifest_dDependencySource; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity : string Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dFrontend_dManifest_dLayer = { f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName : string; f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerLine : int }
and t_Vuna_dCompiler_dFrontend_dManifest_dManifest = { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestIsWorkspace : bool; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies : t_Vuna_dCompiler_dFrontend_dManifest_dDependency Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath : string; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings : bool Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors : int Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings : bool Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers : t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dFrontend_dManifest_dDepAcc = { f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias : string; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine : int }

# 41 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__0; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__1; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__2; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepSourceOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__4; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__5; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__6; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__7 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__8; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__9; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__10; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__11 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepIdentityOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__12; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__13; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__14; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_demptyDepAcc = (fun alias line -> { f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias = alias; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine = line })

# 92 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar = (fun c -> (if (c >= 48) then (c <= 57) else false))

# 95 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

# 98 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

# 101 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_datLine = (fun path line msg -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt line); ": "; msg]) else (String.concat "" [path; ":"; (bi_strFromInt line); ": "; msg])))

# 104 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr = (fun path msg -> (if (path = "") then msg else (String.concat "" [path; ": "; msg])))

# 107 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dsameSection = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ _uctx0) dtb__16) dtb__18) then (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection _uctx0) dtb__17) dtb__19) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine = (fun path section key entries -> (match (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20) -> dtb__20
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 1
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc = (fun path section key entries -> (match (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__21) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt dtb__21); ": "]) else (String.concat "" [path; ":"; (bi_strFromInt dtb__21); ": "]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (path = "") then "" else (path ^ ": "))
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstringField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22) -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__23) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__23))))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedString (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 128 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstringListField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> (match dtb__24 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray (dtb__25) -> (match (Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_darrayStrings dtb__25) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (key))) key)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 137 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dintField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__27) -> (match dtb__27 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt (dtb__28) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__28))))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedInt (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 143 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dboolField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> (match dtb__29 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (dtb__30) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30))))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedBool (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 149 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> dtb__31
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 156 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disLayersSection = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__32, dtb__33) -> (if (dtb__32 = "layers") then (match dtb__33 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__34, dtb__35) -> true
  | _ -> false
) else false)
  | _ -> false
))

# 160 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dlayerSeen = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (if (mc0 = dtb__36) then true else ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerSeen mc0) dtb__37))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__40; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__41; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__42; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__43 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__40) (Base_dList.C_Base_dList_dList__x58__x58_ ("layers", Base_dList.C_Base_dList_dList_Nil))) then (if ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerSeen dtb__41) mc2) then (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers mc0) dtb__39) mc2) else (match dtb__42 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray (dtb__44) -> (match (Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_darrayStrings dtb__44) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__43) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (dtb__41))) dtb__41)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers mc0) dtb__39) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__41, mc2)))) (fun ls -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName = dtb__41; f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses = dtb__45; f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerLine = dtb__43 }, ls))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__43) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (dtb__41))) dtb__41)
)) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers mc0) dtb__39) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (if ((dtb__46).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName = mc1) then (dtb__46).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses else ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesOf dtb__47) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dreachesFrom = (fun fuel layers todo seen target -> (if (fuel <= 0) then false else (match todo with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (if (dtb__48 = target) then true else (if ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerSeen dtb__48) seen) then (((((v_Vuna_dCompiler_dFrontend_dManifest_dreachesFrom (fuel - 1)) layers) dtb__49) seen) target) else (((((v_Vuna_dCompiler_dFrontend_dManifest_dreachesFrom (fuel - 1)) layers) ((Base_dList.v_Base_dList_dappend dtb__49) ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesOf layers) dtb__48))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__48, seen))) target)))
  | _ -> failwith "DT: impossible branch"
)))

# 189 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dlayerHasCycle = (fun layers l -> (((((v_Vuna_dCompiler_dFrontend_dManifest_dreachesFrom ((Base_dList.v_Base_dList_dlength layers) + 1)) layers) ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesOf layers) (l).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName)) Base_dList.C_Base_dList_dList_Nil) (l).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName))

# 209 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dorFalse = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__50) -> dtb__50
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__51, dtb__52) -> (match dtb__52 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__53, dtb__54) -> (match dtb__54 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__51 = "dependencies")
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 220 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disLintSection = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (if (dtb__55 = "lint") then true else false)
  | _ -> false
))

# 224 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (match dtb__58 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__59
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 228 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disDepSourceKey = (fun key -> (if (if (if (if (if (key = "path") then true else (key = "git")) then true else (key = "rev")) then true else (key = "url")) then true else (key = "hash")) then true else (key = "identity")))

# 238 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__61; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__62; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__63; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__64 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__61) Base_dList.C_Base_dList_dList_Nil) then ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnexpectedTopLevelKey (dtb__62))) dtb__62) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__61) (Base_dList.C_Base_dList_dList__x58__x58_ ("package", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__62 = "name") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__62, "package"))) dtb__62) "package")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__61) (Base_dList.C_Base_dList_dList__x58__x58_ ("workspace", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__62 = "members") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__62, "workspace"))) dtb__62) "workspace")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__61) (Base_dList.C_Base_dList_dList__x58__x58_ ("export", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__62 = "modules") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__62, "export"))) dtb__62) "export")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__61) (Base_dList.C_Base_dList_dList__x58__x58_ ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) then (if (if (if (if (if (dtb__62 = "format") then true else (dtb__62 = "warnings")) then true else (dtb__62 = "max-errors")) then true else (dtb__62 = "lang")) then true else (dtb__62 = "deny-warnings")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__62, "diagnostics"))) dtb__62) "diagnostics")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__61) (Base_dList.C_Base_dList_dList__x58__x58_ ("layers", Base_dList.C_Base_dList_dList_Nil))) then (match dtb__63 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray (dtb__65) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (dtb__62))) dtb__62)
) else (if (v_Vuna_dCompiler_dFrontend_dManifest_disLayersSection dtb__61) then ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_LayerKeyMustBeQuoted ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((Base_dList.v_Base_dList_dappend dtb__61) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__62, Base_dList.C_Base_dList_dList_Nil))))))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((Base_dList.v_Base_dList_dappend dtb__61) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__62, Base_dList.C_Base_dList_dList_Nil))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__61) (Base_dList.C_Base_dList_dList__x58__x58_ ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__61) (Base_dList.C_Base_dList_dList__x58__x58_ ("registry", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__62 = "index") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__62, "registry"))) dtb__62) "registry")) else (if (v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection dtb__61) then (if (v_Vuna_dCompiler_dFrontend_dManifest_disDepSourceKey dtb__62) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownSourceKey (dtb__62, (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection dtb__61)))) dtb__62) (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection dtb__61))) else (if (v_Vuna_dCompiler_dFrontend_dManifest_disLintSection dtb__61) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__64) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_UnknownSection ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__61)))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__61)))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__66, dtb__67) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry mc0) dtb__66) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__68) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__68))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__69) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries mc0) dtb__67)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (if ((dtb__70).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias = mc0) then true else ((v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc mc0) dtb__71))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_densureAcc = (fun alias line acc -> (if ((v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc alias) acc) then acc else ((Base_dList.v_Base_dList_dappend acc) (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dManifest_demptyDepAcc alias) line), Base_dList.C_Base_dList_dList_Nil)))))

# 272 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (if ((dtb__72).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias = mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ ((mc1 dtb__72), dtb__73)) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__72, (((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc mc0) mc1) dtb__73))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccPath = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 280 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccGit = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 283 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccRev = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 286 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccUrl = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 289 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccHash = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 292 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccIdentity = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 295 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__74) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__74))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) mc3) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_ExpectedString (mc1))) mc1)
))

# 300 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dapplyDepEntry = (fun path alias key value line acc -> ((fun ensured -> (if (key = "path") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__75) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__75))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__76) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccPath dtb__76)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "git") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__77) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__77))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__78) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccGit dtb__78)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "rev") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__80) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccRev dtb__80)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "url") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__81) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__81))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__82) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccUrl dtb__82)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "hash") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__83) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__83))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__84) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccHash dtb__84)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__85) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__85))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__86) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccIdentity dtb__86)) ensured)))
  | _ -> failwith "DT: impossible branch"
))))))) (((v_Vuna_dCompiler_dFrontend_dManifest_densureAcc alias) line) acc)))

# 324 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__87, dtb__88) -> (match dtb__87 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__89; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__90; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__91; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__92 } -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection dtb__89) then (match ((((((v_Vuna_dCompiler_dFrontend_dManifest_dapplyDepEntry mc0) (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection dtb__89)) dtb__90) dtb__91) dtb__92) mc2) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__93) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__93))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__94) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables mc0) dtb__88) dtb__94)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables mc0) dtb__88) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__95, dtb__96) -> (match dtb__95 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__97; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__98; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__99; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__100 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__97) (Base_dList.C_Base_dList_dList__x58__x58_ ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (match dtb__99 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__101) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings mc0) dtb__96) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__98; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__101; Base_dPair.f_Base_dPair_dPair_second = dtb__100 } }, mc2)))
  | _ -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__100) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DependencyPathNotString (dtb__98))) dtb__98)
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings mc0) dtb__96) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dbuildDependency = (fun path acc -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__102) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__103) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_SourceConflict ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_SourceConflict ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__102)); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__105) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_GitRevRequired ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_SourceConflict ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__105, dtb__106)); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__108)); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DependencySourceMissing ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__109, dtb__110) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildDependency mc0) dtb__109) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__111) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__111))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__112) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables mc0) dtb__110) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__112, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 365 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies = (fun path entries -> (match (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings path) entries) Base_dList.C_Base_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__113) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__113))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__114) -> (match (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables path) entries) Base_dList.C_Base_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__115) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__115))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__116) -> (match (((v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables path) dtb__116) Base_dList.C_Base_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__117) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__117))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__118) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun p -> { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (Base_dPair.v_Base_dPair_dfirstOf p); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath ((Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf p)))); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })) dtb__114)) dtb__118)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disHexChar = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar c) then true else (if (c >= 65) then (c <= 70) else false)) then true else (if (c >= 97) then (c <= 102) else false)))

# 380 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dallHex = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__119, dtb__120) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disHexChar dtb__119) then (v_Vuna_dCompiler_dFrontend_dManifest_dallHex dtb__120) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText = (fun s -> (if ((Base_dString.v_Base_dString_dstartsWith "sha256:") s) then (if ((bi_strLength s) = 71) then (v_Vuna_dCompiler_dFrontend_dManifest_dallHex (Base_dList.dtp_unpack (((Base_dString.v_Base_dString_dsubstring 7) 64) s))) else false) else (if ((bi_strLength s) = 64) then (v_Vuna_dCompiler_dFrontend_dManifest_dallHex (Base_dList.dtp_unpack s)) else false)))

# 390 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__121) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText dtb__121) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_HashMalformed (dtb__121))) dtb__121))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcheckIdentityForm = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText dtb__122) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_IdentityMalformed (dtb__122))) dtb__122))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependency = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__123; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__124; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__125; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__126 } -> (if (dtb__123 = "") then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyDependencyName) else (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckIdentityForm mc0) dtb__126) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__127) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__127))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__128) -> (match dtb__124 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__129) -> (if (dtb__129 = "") then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyDependencyPath (dtb__123))) dtb__123) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm mc0) dtb__123) dtb__125))
  | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__130, dtb__131) -> (match dtb__125 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingHash (dtb__123))) dtb__123)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__132) -> (if (dtb__130 = "") then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DependencySourceMissing (dtb__123))) dtb__123) else (if (dtb__131 = "") then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_GitRevRequired (dtb__123))) dtb__123) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm mc0) dtb__123) dtb__125)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__133) -> (match dtb__125 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingHash (dtb__123))) dtb__123)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__134) -> (if (dtb__133 = "") then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DependencySourceMissing (dtb__123))) dtb__123) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm mc0) dtb__123) dtb__125))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__135)) mc1) then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DuplicateDependency ((v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__135)))) (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__135)) else (match ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependency mc0) dtb__135) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__137) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__137))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__138) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen mc0) (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__135), mc1))) dtb__136)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 427 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies = (fun path deps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) Base_dList.C_Base_dList_dList_Nil) deps))

# 431 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__139) -> (if (if (if (if (dtb__139 = "short") then true else (dtb__139 = "human")) then true else (dtb__139 = "json")) then true else (dtb__139 = "sarif")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidDiagFormat (dtb__139))) dtb__139))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 437 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__140) -> (if (dtb__140 >= 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidDiagMaxErrors ((bi_strFromInt dtb__140)))) (bi_strFromInt dtb__140)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstartsWithSection = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__141, dtb__142) -> (dtb__141 = mc1)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__143, dtb__144) -> (match dtb__143 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__145; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__146; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__147; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__148 } -> (if ((v_Vuna_dCompiler_dFrontend_dManifest_dstartsWithSection dtb__145) mc1) then true else ((v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent dtb__144) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckRootSections = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__149, dtb__150) -> (if ((v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent mc1) dtb__149) then (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_PackageSectionInWorkspaceRoot (dtb__149))) dtb__149) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckRootSections mc0) mc1) dtb__150))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateRootShape = (fun path entries name members -> (match name with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__151) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent entries) "workspace")) then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 path) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingPackageName) else (if (((Base_dEq.v_Base_dEq_d_x61__x61_ (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) members) Base_dList.C_Base_dList_dList_Nil) then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 path) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyWorkspace) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckRootSections path) entries) (Base_dList.C_Base_dList_dList__x58__x58_ ("export", (Base_dList.C_Base_dList_dList__x58__x58_ ("layers", (Base_dList.C_Base_dList_dList__x58__x58_ ("dependencies", Base_dList.C_Base_dList_dList_Nil)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__152, dtb__153) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__152) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__152)) then true else (dtb__152 = 45)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars dtb__153) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars (Base_dList.dtp_unpack name)))

# 516 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__154, dtb__155) -> (if (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__154) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__154)) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__154)) then true else (dtb__154 = 95)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__155) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__156) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__157) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 509 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment = (fun seg -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars (Base_dList.dtp_unpack seg)))

# 505 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment dtb__158) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments dtb__159) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)))

# 202 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayerTargets = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__160, dtb__161) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__160) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayerTargets mc0) dtb__161) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_LayerInvalidTarget (dtb__160))) dtb__160))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayers = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName (dtb__162).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName) then (match ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayerTargets mc0) (dtb__162).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerUses) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__164) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__164))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__165) -> (if ((v_Vuna_dCompiler_dFrontend_dManifest_dlayerHasCycle mc1) dtb__162) then ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) (dtb__162).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_LayerCycle ((dtb__162).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName))) (dtb__162).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayers mc0) mc1) dtb__163))
  | _ -> failwith "DT: impossible branch"
) else ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 mc0) (dtb__162).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerLine) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_LayerInvalidName ((dtb__162).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName))) (dtb__162).f_Vuna_dCompiler_dFrontend_dManifest_dLayer_layerName))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 524 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> (if (dtb__166 = "") then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc2) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyPackageName) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName dtb__166) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidPackageName (dtb__166))) dtb__166)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if mc0 then ((Base_dList.v_Base_dList_dlength mc1) > 0) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc2) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingPackageName))
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__167, dtb__168) -> (if (dtb__167 = "") then ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_EmptyMember) else ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers mc0) dtb__168))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 536 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__169, dtb__170) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__169) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__170) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidExportModule (dtb__169))) dtb__169))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 541 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__171)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 545 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__172; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__173; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestIsWorkspace = dtb__174; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__175; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__176; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__177; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = dtb__178; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = dtb__179; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = dtb__180; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = dtb__181; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = dtb__182; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex = dtb__183; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers = dtb__184 } -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName dtb__174) dtb__173) dtb__177) dtb__172)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers dtb__177) dtb__173)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports dtb__177) dtb__175)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies dtb__177) dtb__176)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayers dtb__177) dtb__184) dtb__184)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Vuna_dCompiler_dBase_dDiag.v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck) { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__172; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__173; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestIsWorkspace = dtb__174; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__175; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__176; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__177; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = dtb__178; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = dtb__179; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = dtb__180; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = dtb__181; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = dtb__182; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex = dtb__183; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers = dtb__184 })))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddirResult = (fun dir -> (if (dir = "") then "/" else dir))

# 559 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__185, dtb__186) -> (if (dtb__185 = 47) then (v_Vuna_dCompiler_dFrontend_dManifest_ddirResult (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse dtb__186))) else (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev dtb__186))
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

# 556 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir = (fun path -> (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))))

# 567 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath = (fun manifest rel -> ((fun dir -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then rel else (if (dir = ".") then rel else (String.concat "" [dir; "/"; rel])))) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (manifest).f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath)))

# 574 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__187) -> (if (if (dtb__187 = "en") then true else (dtb__187 = "zh")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_InvalidDiagLang (dtb__187))) dtb__187))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest = (fun path entries -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) entries)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers path) entries) Base_dList.C_Base_dList_dList_Nil)) (fun layers -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList__x58__x58_ ("package", Base_dList.C_Base_dList_dList_Nil))) "name") entries)) (fun name -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList__x58__x58_ ("workspace", Base_dList.C_Base_dList_dList_Nil))) "members") entries)) (fun members -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateRootShape path) entries) name) (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList__x58__x58_ ("export", Base_dList.C_Base_dList_dList_Nil))) "modules") entries)) (fun exports -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies path) entries)) (fun deps -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList__x58__x58_ ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "format") entries)) (fun diagFmt -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dList.C_Base_dList_dList__x58__x58_ ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "warnings") entries)) (fun diagWarns -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dintField path) (Base_dList.C_Base_dList_dList__x58__x58_ ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "max-errors") entries)) (fun diagMax -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList__x58__x58_ ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "lang") entries)) (fun diagLang -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dList.C_Base_dList_dList__x58__x58_ ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "deny-warnings") entries)) (fun diagDeny -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList__x58__x58_ ("registry", Base_dList.C_Base_dList_dList_Nil))) "index") entries)) (fun regIndex -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat path) diagFmt)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax path) diagMax)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Vuna_dCompiler_dBase_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang path) diagLang)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Vuna_dCompiler_dBase_dDiag.v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck) { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = name; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestIsWorkspace = ((v_Vuna_dCompiler_dFrontend_dManifest_dsectionPresent entries) "workspace"); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = exports; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = deps; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = path; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = diagFmt; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = diagWarns; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = diagMax; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = diagLang; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = diagDeny; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex = regIndex; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers = layers }))))))))))))))))))))))))))))))))))

# 488 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest = (fun path contents -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt path) contents)) (fun entries -> ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest path) entries))))
