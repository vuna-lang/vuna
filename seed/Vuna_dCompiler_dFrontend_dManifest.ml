open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dManifest_dDependencySource = C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath of (string) | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit of (string) * (string) | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl of (string)
and t_Vuna_dCompiler_dFrontend_dManifest_dDependency = { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias : string; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource : t_Vuna_dCompiler_dFrontend_dManifest_dDependencySource; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity : string Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dFrontend_dManifest_dManifest = { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies : t_Vuna_dCompiler_dFrontend_dManifest_dDependency Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath : string; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings : bool Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors : int Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings : bool Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex : string Base_dMaybe.t_Base_dMaybe_dMaybe }
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

# 79 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_demptyDepAcc = (fun alias line -> { f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias = alias; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine = line })

# 83 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar = (fun c -> (if (c >= 48) then (c <= 57) else false))

# 86 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

# 89 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

# 92 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_datLine = (fun path line msg -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt line); ": "; msg]) else (String.concat "" [path; ":"; (bi_strFromInt line); ": "; msg])))

# 95 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr = (fun path msg -> (if (path = "") then msg else (String.concat "" [path; ": "; msg])))

# 98 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dsameSection = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__16) dtb__18) then (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection _uctx0) dtb__17) dtb__19) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine = (fun path section key entries -> (match (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20) -> dtb__20
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 1
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc = (fun path section key entries -> (match (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__21) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt dtb__21); ": "]) else (String.concat "" [path; ":"; (bi_strFromInt dtb__21); ": "]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (path = "") then "" else (path ^ ": "))
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstringField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22) -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__23) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__23))))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedString (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 119 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstringListField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> (match dtb__24 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray (dtb__25) -> (match (Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_darrayStrings dtb__25) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (key))) key)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 128 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dintField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__27) -> (match dtb__27 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt (dtb__28) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__28))))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedInt (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 134 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dboolField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> (match dtb__29 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (dtb__30) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30))))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedBool (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

# 140 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> dtb__31
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dorFalse = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__32) -> dtb__32
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (match dtb__36 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__33 = "dependencies")
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 154 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (match dtb__38 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (match dtb__40 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__39
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 158 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disDepSourceKey = (fun key -> (if (if (if (if (if (key = "path") then true else (key = "git")) then true else (key = "rev")) then true else (key = "url")) then true else (key = "hash")) then true else (key = "identity")))

# 168 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__41; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__42; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__43; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__44 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__41) Base_dList.C_Base_dList_dList_Nil) then ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__44) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnexpectedTopLevelKey (dtb__42))) dtb__42) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__41) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__42 = "name") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__44) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__42, "package"))) dtb__42) "package")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__41) (Base_dList.C_Base_dList_dList_Cons ("workspace", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__42 = "members") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__44) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__42, "workspace"))) dtb__42) "workspace")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__41) (Base_dList.C_Base_dList_dList_Cons ("export", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__42 = "modules") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__44) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__42, "export"))) dtb__42) "export")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__41) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) then (if (if (if (if (if (dtb__42 = "format") then true else (dtb__42 = "warnings")) then true else (dtb__42 = "max-errors")) then true else (dtb__42 = "lang")) then true else (dtb__42 = "deny-warnings")) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__44) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__42, "diagnostics"))) dtb__42) "diagnostics")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__41) (Base_dList.C_Base_dList_dList_Cons ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__41) (Base_dList.C_Base_dList_dList_Cons ("registry", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__42 = "index") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__44) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__42, "registry"))) dtb__42) "registry")) else (if (v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection dtb__41) then (if (v_Vuna_dCompiler_dFrontend_dManifest_disDepSourceKey dtb__42) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__44) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownSourceKey (dtb__42, (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection dtb__41)))) dtb__42) (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection dtb__41))) else ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__44) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownSection ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__41)))) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__41))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry mc0) dtb__45) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__47) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__47))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__48) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries mc0) dtb__46)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (if ((dtb__49).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias = mc0) then true else ((v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc mc0) dtb__50))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_densureAcc = (fun alias line acc -> (if ((v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc alias) acc) then acc else ((Base_dList.v_Base_dList_dappend acc) (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dFrontend_dManifest_demptyDepAcc alias) line), Base_dList.C_Base_dList_dList_Nil)))))

# 198 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (if ((dtb__51).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias = mc0) then (Base_dList.C_Base_dList_dList_Cons ((mc1 dtb__51), dtb__52)) else (Base_dList.C_Base_dList_dList_Cons (dtb__51, (((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc mc0) mc1) dtb__52))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccPath = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 206 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccGit = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 209 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccRev = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 212 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccUrl = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 215 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccHash = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 218 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dsetAccIdentity = (fun s acc -> { acc with f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (s)) })

# 221 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__53) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__53))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 mc0) mc3) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedString (mc1))) mc1)
))

# 226 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dapplyDepEntry = (fun path alias key value line acc -> ((fun ensured -> (if (key = "path") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__54) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__54))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__55) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccPath dtb__55)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "git") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__56) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__56))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__57) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccGit dtb__57)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "rev") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__58) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__58))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__59) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccRev dtb__59)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "url") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__60) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__60))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__61) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccUrl dtb__61)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "hash") then (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__62) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__62))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__63) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccHash dtb__63)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf path) key) value) line) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__64) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__64))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__65) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc alias) (v_Vuna_dCompiler_dFrontend_dManifest_dsetAccIdentity dtb__65)) ensured)))
  | _ -> failwith "DT: impossible branch"
))))))) (((v_Vuna_dCompiler_dFrontend_dManifest_densureAcc alias) line) acc)))

# 250 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (match dtb__66 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__68; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__69; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__70; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__71 } -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection dtb__68) then (match ((((((v_Vuna_dCompiler_dFrontend_dManifest_dapplyDepEntry mc0) (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection dtb__68)) dtb__69) dtb__70) dtb__71) mc2) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__72) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__72))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__73) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables mc0) dtb__67) dtb__73)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables mc0) dtb__67) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match dtb__74 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__76; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__77; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__78; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__79 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__76) (Base_dList.C_Base_dList_dList_Cons ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (match dtb__78 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__80) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings mc0) dtb__75) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__77; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = dtb__79 } }, mc2)))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__79) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DependencyPathNotString (dtb__77))) dtb__77)
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings mc0) dtb__75) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dbuildDependency = (fun path acc -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccPath with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__81) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_SourceConflict ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__83) -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_SourceConflict ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__81)); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccGit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__84) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccRev with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_GitRevRequired ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__86) -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_SourceConflict ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__84, dtb__85)); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccUrl with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__87)); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccHash; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccIdentity }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccTableLine) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DependencySourceMissing ((acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias))) (acc).f_Vuna_dCompiler_dFrontend_dManifest_dDepAcc_depAccAlias)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildDependency mc0) dtb__88) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__90) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__90))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__91) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables mc0) dtb__89) (Base_dList.C_Base_dList_dList_Cons (dtb__91, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies = (fun path entries -> (match (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings path) entries) Base_dList.C_Base_dList_dList_Nil) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__92) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__92))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__93) -> (match (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables path) entries) Base_dList.C_Base_dList_dList_Nil) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__94) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__94))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__95) -> (match (((v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables path) dtb__95) Base_dList.C_Base_dList_dList_Nil) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__96) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__96))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__97) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun p -> { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = (Base_dPair.v_Base_dPair_dfirstOf p); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = (C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath ((Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf p)))); f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })) dtb__93)) dtb__97)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_disHexChar = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar c) then true else (if (c >= 65) then (c <= 70) else false)) then true else (if (c >= 97) then (c <= 102) else false)))

# 306 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dallHex = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disHexChar dtb__98) then (v_Vuna_dCompiler_dFrontend_dManifest_dallHex dtb__99) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText = (fun s -> (if ((Base_dString.v_Base_dString_dstartsWith "sha256:") s) then (if ((bi_strLength s) = 71) then (v_Vuna_dCompiler_dFrontend_dManifest_dallHex (Base_dList.dtp_unpack (((Base_dString.v_Base_dString_dsubstring 7) 64) s))) else false) else (if ((bi_strLength s) = 64) then (v_Vuna_dCompiler_dFrontend_dManifest_dallHex (Base_dList.dtp_unpack s)) else false)))

# 316 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__100) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText dtb__100) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_HashMalformed (dtb__100))) dtb__100))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dcheckIdentityForm = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__101) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText dtb__101) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_IdentityMalformed (dtb__101))) dtb__101))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependency = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias = dtb__102; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource = dtb__103; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash = dtb__104; f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depIdentity = dtb__105 } -> (if (dtb__102 = "") then ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyDependencyName) else (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckIdentityForm mc0) dtb__105) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__106) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__106))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__107) -> (match dtb__103 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__108) -> (if (dtb__108 = "") then (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyDependencyPath (dtb__102))) dtb__102) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm mc0) dtb__102) dtb__104))
  | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__109, dtb__110) -> (match dtb__104 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_MissingHash (dtb__102))) dtb__102)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> (if (dtb__109 = "") then (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DependencySourceMissing (dtb__102))) dtb__102) else (if (dtb__110 = "") then (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_GitRevRequired (dtb__102))) dtb__102) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm mc0) dtb__102) dtb__104)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__112) -> (match dtb__104 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_MissingHash (dtb__102))) dtb__102)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113) -> (if (dtb__112 = "") then (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DependencySourceMissing (dtb__102))) dtb__102) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm mc0) dtb__102) dtb__104))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__114)) mc1) then (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DuplicateDependency ((v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__114)))) (v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__114)) else (match ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependency mc0) dtb__114) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__116) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__116))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__117) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen mc0) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dtb__114), mc1))) dtb__115)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies = (fun path deps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) Base_dList.C_Base_dList_dList_Nil) deps))

# 357 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> (if (if (if (if (dtb__118 = "short") then true else (dtb__118 = "human")) then true else (dtb__118 = "json")) then true else (dtb__118 = "sarif")) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidDiagFormat (dtb__118))) dtb__118))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> (if (dtb__119 >= 1) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidDiagMaxErrors ((bi_strFromInt dtb__119)))) (bi_strFromInt dtb__119)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__120) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__120)) then true else (dtb__120 = 45)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars dtb__121) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars (Base_dList.dtp_unpack name)))

# 428 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (if (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__122) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__122)) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__122)) then true else (dtb__122 = 95)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__123) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__124, dtb__125) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__124) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__125) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment = (fun seg -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars (Base_dList.dtp_unpack seg)))

# 417 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment dtb__126) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments dtb__127) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)))

# 434 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__128) -> (if (dtb__128 = "") then ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyPackageName) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName dtb__128) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidPackageName (dtb__128))) dtb__128)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_MissingPackageName)
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (if (dtb__129 = "") then ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyMember) else ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers mc0) dtb__130))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__131) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__132) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidExportModule (dtb__131))) dtb__131))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__133) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__133)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__134; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__135; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__136; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__137; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__138; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = dtb__139; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = dtb__140; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = dtb__141; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = dtb__142; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = dtb__143; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex = dtb__144 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName dtb__138) dtb__134)) (fun okName -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers dtb__138) dtb__135)) (fun okMembers -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports dtb__138) dtb__136)) (fun okExports -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies dtb__138) dtb__137)) (fun okDeps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__134; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__135; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__136; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__137; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__138; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = dtb__139; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = dtb__140; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = dtb__141; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = dtb__142; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = dtb__143; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex = dtb__144 }))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_ddirResult = (fun dir -> (if (dir = "") then "/" else dir))

# 463 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (if (dtb__145 = 47) then (v_Vuna_dCompiler_dFrontend_dManifest_ddirResult (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse dtb__146))) else (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev dtb__146))
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir = (fun path -> (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))))

# 471 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath = (fun manifest rel -> ((fun dir -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then rel else (if (dir = ".") then rel else (String.concat "" [dir; "/"; rel])))) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (manifest).f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath)))

# 478 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__147) -> (if (if (dtb__147 = "en") then true else (dtb__147 = "zh")) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidDiagLang (dtb__147))) dtb__147))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 368 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest = (fun path entries -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__148) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__148))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__149) -> (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) "name") entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__150) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__150))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__151) -> (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("workspace", Base_dList.C_Base_dList_dList_Nil))) "members") entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__152) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__152))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__153) -> (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("export", Base_dList.C_Base_dList_dList_Nil))) "modules") entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__154) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__154))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__155) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies path) entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__156) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__156))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__157) -> (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "format") entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__158) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__158))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__159) -> (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "warnings") entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__160) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__160))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__161) -> (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dintField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "max-errors") entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__162) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__162))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__163) -> (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "lang") entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__164) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__164))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__165) -> (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "deny-warnings") entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__166) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__166))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__167) -> (match ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList_Cons ("registry", Base_dList.C_Base_dList_dList_Nil))) "index") entries) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__168) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__168))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__169) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat path) dtb__159) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__170) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__170))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__171) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax path) dtb__163) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__172) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__172))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__173) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang path) dtb__165) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__174) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__174))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__175) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__151; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList dtb__153); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__155; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__157; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = path; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = dtb__159; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = dtb__161; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = dtb__163; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = dtb__165; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = dtb__167; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestRegistryIndex = dtb__169 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest = (fun path contents -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt path) contents)) (fun entries -> ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest path) entries))))
