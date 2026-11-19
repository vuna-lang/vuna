open Vuna_runtime
type t_DependencySource = C_DependencySource_DepPath of (string) | C_DependencySource_DepGit of (string) * (string) | C_DependencySource_DepUrl of (string)
and t_Dependency = { f_Dependency_depAlias : string; f_Dependency_depSource : t_DependencySource; f_Dependency_depHash : string B_dData_dMaybe.t_Maybe; f_Dependency_depIdentity : string B_dData_dMaybe.t_Maybe }
and t_Layer = { f_Layer_layerName : string; f_Layer_layerUses : string B_dData_dList.t_List; f_Layer_layerLine : int }
and t_Manifest = { f_Manifest_manifestName : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestMembers : string B_dData_dList.t_List; f_Manifest_manifestIsWorkspace : bool; f_Manifest_manifestExports : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe; f_Manifest_manifestDependencies : t_Dependency B_dData_dList.t_List; f_Manifest_manifestPath : string; f_Manifest_manifestDiagFormat : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagWarnings : bool B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagMaxErrors : int B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagLang : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagDenyWarnings : bool B_dData_dMaybe.t_Maybe; f_Manifest_manifestRegistryIndex : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestLayers : t_Layer B_dData_dList.t_List }
and t_DepAcc = { f_DepAcc_depAccAlias : string; f_DepAcc_depAccPath : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccGit : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccRev : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccUrl : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccHash : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccIdentity : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccTableLine : int }

# 41 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAliasOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__0; f_Dependency_depSource = dtb__1; f_Dependency_depHash = dtb__2; f_Dependency_depIdentity = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depSourceOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__4; f_Dependency_depSource = dtb__5; f_Dependency_depHash = dtb__6; f_Dependency_depIdentity = dtb__7 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depHashOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__8; f_Dependency_depSource = dtb__9; f_Dependency_depHash = dtb__10; f_Dependency_depIdentity = dtb__11 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depIdentityOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__12; f_Dependency_depSource = dtb__13; f_Dependency_depHash = dtb__14; f_Dependency_depIdentity = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_emptyDepAcc = (fun (alias : string) (line : int) -> { f_DepAcc_depAccAlias = alias; f_DepAcc_depAccPath = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccGit = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccRev = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccUrl = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccHash = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccIdentity = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccTableLine = line })

# 92 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDigitChar = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 95 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isUpperAlphaChar = (fun (c : int) -> (if (c >= 65) then (c <= 90) else false))

# 98 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLowerAlphaChar = (fun (c : int) -> (if (c >= 97) then (c <= 122) else false))

# 101 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_atLine = (fun (path : string) (line : int) (msg : string) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt line); ": "; msg]) else (String.concat "" [path; ":"; (bi_strFromInt line); ": "; msg])))

# 104 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestErr = (fun (path : string) (msg : string) -> (if (path = "") then msg else (String.concat "" [path; ": "; msg])))

# 107 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_sameSection = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__16) dtb__18) then (((v_sameSection _uctx0) dtb__17) dtb__19) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 112 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_fieldLine = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((Frontend_dToml.v_lookupEntryLine section) key) entries) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> dtb__20
  | B_dData_dMaybe.C_Maybe_Nothing -> 1
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_fieldLoc = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((Frontend_dToml.v_lookupEntryLine section) key) entries) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt dtb__21); ": "]) else (String.concat "" [path; ":"; (bi_strFromInt dtb__21); ": "]))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (path = "") then "" else (path ^ ": "))
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (match dtb__22 with
  | Frontend_dToml.C_TomlValue_TStr (dtb__23) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__23))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedString (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Frontend_dToml.v_lookupEntry section) key) entries)))

# 131 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringListField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (match dtb__24 with
  | Frontend_dToml.C_TomlValue_TArray (dtb__25) -> (match (Frontend_dToml.v_arrayStrings dtb__25) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (key))) key)
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__26))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Frontend_dToml.v_lookupEntry section) key) entries)))

# 142 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_intField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (match dtb__27 with
  | Frontend_dToml.C_TomlValue_TInt (dtb__28) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__28))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedInt (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Frontend_dToml.v_lookupEntry section) key) entries)))

# 149 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_boolField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (match dtb__29 with
  | Frontend_dToml.C_TomlValue_TBool (dtb__30) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__30))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedBool (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Frontend_dToml.v_lookupEntry section) key) entries)))

# 156 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_orEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> dtb__31
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLayersSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (if (dtb__32 = "layers") then (match dtb__33 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> true
  | _ -> false
) else false)
  | _ -> false
))

# 167 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerSeen = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (if (mc0 = dtb__36) then true else ((v_layerSeen mc0) dtb__37))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectLayers = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__40; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__41; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__42; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__43 } -> (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__40) (B_dData_dList.C_List__x58__x58_ ("layers", B_dData_dList.C_List_Nil))) then (if ((v_layerSeen dtb__41) mc2) then (((v_collectLayers mc0) dtb__39) mc2) else (match dtb__42 with
  | Frontend_dToml.C_TomlValue_TArray (dtb__44) -> (match (Frontend_dToml.v_arrayStrings dtb__44) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__43) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb__41))) dtb__41)
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> ((Base_dCommon.v_bind (((v_collectLayers mc0) dtb__39) (B_dData_dList.C_List__x58__x58_ (dtb__41, mc2)))) (fun (ls : t_Layer B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ f_Layer_layerName = dtb__41; f_Layer_layerUses = dtb__45; f_Layer_layerLine = dtb__43 }, ls))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__43) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb__41))) dtb__41)
)) else (((v_collectLayers mc0) dtb__39) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerUsesOf = (fun (mc0 : t_Layer B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (if ((dtb__46).f_Layer_layerName = mc1) then (dtb__46).f_Layer_layerUses else ((v_layerUsesOf dtb__47) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_reachesFrom = (fun (fuel : int) (layers : t_Layer B_dData_dList.t_List) (todo : string B_dData_dList.t_List) (seen : string B_dData_dList.t_List) (target : string) -> (if (fuel <= 0) then false else (match todo with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (if (dtb__48 = target) then true else (if ((v_layerSeen dtb__48) seen) then (((((v_reachesFrom (fuel - 1)) layers) dtb__49) seen) target) else (((((v_reachesFrom (fuel - 1)) layers) ((B_dData_dList.v_append dtb__49) ((v_layerUsesOf layers) dtb__48))) (B_dData_dList.C_List__x58__x58_ (dtb__48, seen))) target)))
  | _ -> failwith "DT: impossible branch"
)))

# 205 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerUsesTotal = (fun (mc0 : t_Layer B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> ((B_dData_dList.v_length (dtb__50).f_Layer_layerUses) + (v_layerUsesTotal dtb__51))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerVisitBound = (fun (layers : t_Layer B_dData_dList.t_List) -> (((v_layerUsesTotal layers) + (B_dData_dList.v_length layers)) + 1))

# 209 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerHasCycle = (fun (layers : t_Layer B_dData_dList.t_List) (l : t_Layer) -> (((((v_reachesFrom (v_layerVisitBound layers)) layers) ((v_layerUsesOf layers) (l).f_Layer_layerName)) B_dData_dList.C_List_Nil) (l).f_Layer_layerName))

# 232 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_orFalse = (fun (mc0 : bool B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> dtb__52
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDepTableSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match dtb__54 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (match dtb__56 with
  | B_dData_dList.C_List_Nil -> (dtb__53 = "dependencies")
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 243 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLintSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (if (dtb__57 = "lint") then true else false)
  | _ -> false
))

# 247 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAliasOfSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match dtb__62 with
  | B_dData_dList.C_List_Nil -> dtb__61
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 251 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDepSourceKey = (fun (key : string) -> (if (if (if (if (if (key = "path") then true else (key = "git")) then true else (key = "rev")) then true else (key = "url")) then true else (key = "hash")) then true else (key = "identity")))

# 257 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkOneEntry = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry) -> (match mc1 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__63; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__64; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__65; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__66 } -> (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__63) B_dData_dList.C_List_Nil) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_UnexpectedTopLevelKey (dtb__64))) dtb__64) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__63) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) then (if (dtb__64 = "name") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__64, "package"))) dtb__64) "package")) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__63) (B_dData_dList.C_List__x58__x58_ ("workspace", B_dData_dList.C_List_Nil))) then (if (dtb__64 = "members") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__64, "workspace"))) dtb__64) "workspace")) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__63) (B_dData_dList.C_List__x58__x58_ ("export", B_dData_dList.C_List_Nil))) then (if (dtb__64 = "modules") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__64, "export"))) dtb__64) "export")) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__63) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) then (if (if (if (if (if (dtb__64 = "format") then true else (dtb__64 = "warnings")) then true else (dtb__64 = "max-errors")) then true else (dtb__64 = "lang")) then true else (dtb__64 = "deny-warnings")) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__64, "diagnostics"))) dtb__64) "diagnostics")) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__63) (B_dData_dList.C_List__x58__x58_ ("layers", B_dData_dList.C_List_Nil))) then (match dtb__65 with
  | Frontend_dToml.C_TomlValue_TArray (dtb__67) -> (Base_dDiag.C_Check_OkC (0))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb__64))) dtb__64)
) else (if (v_isLayersSection dtb__63) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_LayerKeyMustBeQuoted ((Base_dSource.v_joinDots ((B_dData_dList.v_append dtb__63) (B_dData_dList.C_List__x58__x58_ (dtb__64, B_dData_dList.C_List_Nil))))))) (Base_dSource.v_joinDots ((B_dData_dList.v_append dtb__63) (B_dData_dList.C_List__x58__x58_ (dtb__64, B_dData_dList.C_List_Nil))))) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__63) (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil))) then (Base_dDiag.C_Check_OkC (0)) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__63) (B_dData_dList.C_List__x58__x58_ ("registry", B_dData_dList.C_List_Nil))) then (if (dtb__64 = "index") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__64, "registry"))) dtb__64) "registry")) else (if (v_isDepTableSection dtb__63) then (if (v_isDepSourceKey dtb__64) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownSourceKey (dtb__64, (v_depAliasOfSection dtb__63)))) dtb__64) (v_depAliasOfSection dtb__63))) else (if (v_isLintSection dtb__63) then (Base_dDiag.C_Check_OkC (0)) else ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__66) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownSection ((Base_dSource.v_joinDots dtb__63)))) (Base_dSource.v_joinDots dtb__63)))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_checkEntries = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (match ((v_checkOneEntry mc0) dtb__68) with
  | Base_dDiag.C_Check_ErrC (dtb__70) -> (Base_dDiag.C_Check_ErrC (dtb__70))
  | Base_dDiag.C_Check_OkC (dtb__71) -> ((v_checkEntries mc0) dtb__69)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_hasAcc = (fun (mc0 : string) (mc1 : t_DepAcc B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (if ((dtb__72).f_DepAcc_depAccAlias = mc0) then true else ((v_hasAcc mc0) dtb__73))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_ensureAcc = (fun (alias : string) (line : int) (acc : t_DepAcc B_dData_dList.t_List) -> (if ((v_hasAcc alias) acc) then acc else ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (((v_emptyDepAcc alias) line), B_dData_dList.C_List_Nil)))))

# 291 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_mapAcc = (fun (mc0 : string) (mc1 : (t_DepAcc) -> t_DepAcc) (mc2 : t_DepAcc B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (if ((dtb__74).f_DepAcc_depAccAlias = mc0) then (B_dData_dList.C_List__x58__x58_ ((mc1 dtb__74), dtb__75)) else (B_dData_dList.C_List__x58__x58_ (dtb__74, (((v_mapAcc mc0) mc1) dtb__75))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccPath = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccPath = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 299 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccGit = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccGit = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 302 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccRev = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccRev = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 305 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccUrl = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccUrl = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 308 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccHash = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccHash = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 311 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccIdentity = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccIdentity = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 314 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringValueOf = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dToml.t_TomlValue) (mc3 : int) -> (match mc2 with
  | Frontend_dToml.C_TomlValue_TStr (dtb__76) -> (Base_dDiag.C_Check_OkC (dtb__76))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) mc3) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedString (mc1))) mc1)
))

# 319 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_applyDepEntry = (fun (path : string) (alias : string) (key : string) (value : Frontend_dToml.t_TomlValue) (line : int) (acc : t_DepAcc B_dData_dList.t_List) -> ((fun ensured -> (if (key = "path") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__77) -> (Base_dDiag.C_Check_ErrC (dtb__77))
  | Base_dDiag.C_Check_OkC (dtb__78) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccPath dtb__78)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "git") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__79) -> (Base_dDiag.C_Check_ErrC (dtb__79))
  | Base_dDiag.C_Check_OkC (dtb__80) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccGit dtb__80)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "rev") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__81) -> (Base_dDiag.C_Check_ErrC (dtb__81))
  | Base_dDiag.C_Check_OkC (dtb__82) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccRev dtb__82)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "url") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__83) -> (Base_dDiag.C_Check_ErrC (dtb__83))
  | Base_dDiag.C_Check_OkC (dtb__84) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccUrl dtb__84)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "hash") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__85) -> (Base_dDiag.C_Check_ErrC (dtb__85))
  | Base_dDiag.C_Check_OkC (dtb__86) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccHash dtb__86)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__87) -> (Base_dDiag.C_Check_ErrC (dtb__87))
  | Base_dDiag.C_Check_OkC (dtb__88) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccIdentity dtb__88)) ensured)))
  | _ -> failwith "DT: impossible branch"
))))))) (((v_ensureAcc alias) line) acc)))

# 349 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectTables = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : t_DepAcc B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__91; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__92; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__93; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__94 } -> (if (v_isDepTableSection dtb__91) then (match ((((((v_applyDepEntry mc0) (v_depAliasOfSection dtb__91)) dtb__92) dtb__93) dtb__94) mc2) with
  | Base_dDiag.C_Check_ErrC (dtb__95) -> (Base_dDiag.C_Check_ErrC (dtb__95))
  | Base_dDiag.C_Check_OkC (dtb__96) -> (((v_collectTables mc0) dtb__90) dtb__96)
  | _ -> failwith "DT: impossible branch"
) else (((v_collectTables mc0) dtb__90) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectStrings = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__99; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__100; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__101; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__102 } -> (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__99) (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil))) then (match dtb__101 with
  | Frontend_dToml.C_TomlValue_TStr (dtb__103) -> (((v_collectStrings mc0) dtb__98) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__102 } }, mc2)))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__102) (Base_dDiagnostics_dPkg.C_PkgErr_DependencyPathNotString (dtb__100))) dtb__100)
) else (((v_collectStrings mc0) dtb__98) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_buildDependency = (fun (path : string) (acc : t_DepAcc) -> (match (acc).f_DepAcc_depAccPath with
  | B_dData_dMaybe.C_Maybe_Just (dtb__104) -> (match (acc).f_DepAcc_depAccGit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (acc).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (acc).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepPath (dtb__104)); f_Dependency_depHash = (acc).f_DepAcc_depAccHash; f_Dependency_depIdentity = (acc).f_DepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (acc).f_DepAcc_depAccGit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> (match (acc).f_DepAcc_depAccRev with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_GitRevRequired ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Just (dtb__108) -> (match (acc).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (acc).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepGit (dtb__107, dtb__108)); f_Dependency_depHash = (acc).f_DepAcc_depAccHash; f_Dependency_depIdentity = (acc).f_DepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (acc).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (acc).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepUrl (dtb__110)); f_Dependency_depHash = (acc).f_DepAcc_depAccHash; f_Dependency_depIdentity = (acc).f_DepAcc_depAccIdentity }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_buildTables = (fun (mc0 : string) (mc1 : t_DepAcc B_dData_dList.t_List) (mc2 : t_Dependency B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match ((v_buildDependency mc0) dtb__111) with
  | Base_dDiag.C_Check_ErrC (dtb__113) -> (Base_dDiag.C_Check_ErrC (dtb__113))
  | Base_dDiag.C_Check_OkC (dtb__114) -> (((v_buildTables mc0) dtb__112) (B_dData_dList.C_List__x58__x58_ (dtb__114, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_collectDependencies = (fun (path : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((v_collectStrings path) entries) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__115) -> (Base_dDiag.C_Check_ErrC (dtb__115))
  | Base_dDiag.C_Check_OkC (dtb__116) -> (match (((v_collectTables path) entries) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__117) -> (Base_dDiag.C_Check_ErrC (dtb__117))
  | Base_dDiag.C_Check_OkC (dtb__118) -> (match (((v_buildTables path) dtb__118) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__119) -> (Base_dDiag.C_Check_ErrC (dtb__119))
  | Base_dDiag.C_Check_OkC (dtb__120) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (p : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> { f_Dependency_depAlias = (B_dData_dPair.v_firstOf p); f_Dependency_depSource = (C_DependencySource_DepPath ((B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf p)))); f_Dependency_depHash = B_dData_dMaybe.C_Maybe_Nothing; f_Dependency_depIdentity = B_dData_dMaybe.C_Maybe_Nothing })) dtb__116)) dtb__120)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isHexChar = (fun (c : int) -> (if (if (v_isDigitChar c) then true else (if (c >= 65) then (c <= 70) else false)) then true else (if (c >= 97) then (c <= 102) else false)))

# 431 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_allHex = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> (if (v_isHexChar dtb__121) then (v_allHex dtb__122) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validHashText = (fun (s : string) -> (if ((B_dData_dString.v_startsWith "sha256:") s) then (if ((bi_strLength s) = 71) then (v_allHex (B_dData_dList.dtp_unpack (((B_dData_dString.v_substring 7) 64) s))) else false) else (if ((bi_strLength s) = 64) then (v_allHex (B_dData_dList.dtp_unpack s)) else false)))

# 443 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkHashForm = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (if (v_validHashText dtb__123) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_HashMalformed (dtb__123))) dtb__123))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkIdentityForm = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__124) -> (if (v_validHashText dtb__124) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMalformed (dtb__124))) dtb__124))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDependency = (fun (mc0 : string) (mc1 : t_Dependency) -> (match mc1 with
  | { f_Dependency_depAlias = dtb__125; f_Dependency_depSource = dtb__126; f_Dependency_depHash = dtb__127; f_Dependency_depIdentity = dtb__128 } -> (if (dtb__125 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_EmptyDependencyName) else (match ((v_checkIdentityForm mc0) dtb__128) with
  | Base_dDiag.C_Check_ErrC (dtb__129) -> (Base_dDiag.C_Check_ErrC (dtb__129))
  | Base_dDiag.C_Check_OkC (dtb__130) -> (match dtb__126 with
  | C_DependencySource_DepPath (dtb__131) -> (if (dtb__131 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_EmptyDependencyPath (dtb__125))) dtb__125) else (((v_checkHashForm mc0) dtb__125) dtb__127))
  | C_DependencySource_DepGit (dtb__132, dtb__133) -> (match dtb__127 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_MissingHash (dtb__125))) dtb__125)
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (if (dtb__132 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing (dtb__125))) dtb__125) else (if (dtb__133 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_GitRevRequired (dtb__125))) dtb__125) else (((v_checkHashForm mc0) dtb__125) dtb__127)))
  | _ -> failwith "DT: impossible branch"
)
  | C_DependencySource_DepUrl (dtb__135) -> (match dtb__127 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_MissingHash (dtb__125))) dtb__125)
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (if (dtb__135 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing (dtb__125))) dtb__125) else (((v_checkHashForm mc0) dtb__125) dtb__127))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateDepsSeen = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : t_Dependency B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (if ((B_dData_dList.v_memName (v_depAliasOf dtb__137)) mc1) then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_DuplicateDependency ((v_depAliasOf dtb__137)))) (v_depAliasOf dtb__137)) else (match ((v_validateDependency mc0) dtb__137) with
  | Base_dDiag.C_Check_ErrC (dtb__139) -> (Base_dDiag.C_Check_ErrC (dtb__139))
  | Base_dDiag.C_Check_OkC (dtb__140) -> (((v_validateDepsSeen mc0) (B_dData_dList.C_List__x58__x58_ ((v_depAliasOf dtb__137), mc1))) dtb__138)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDependencies = (fun (path : string) (deps : t_Dependency B_dData_dList.t_List) -> (((v_validateDepsSeen path) B_dData_dList.C_List_Nil) deps))

# 486 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagFormat = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__141) -> (if (if (if (if (dtb__141 = "short") then true else (dtb__141 = "human")) then true else (dtb__141 = "json")) then true else (dtb__141 = "sarif")) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagFormat (dtb__141))) dtb__141))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagMax = (fun (mc0 : string) (mc1 : int B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (if (dtb__142 >= 1) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagMaxErrors ((bi_strFromInt dtb__142)))) (bi_strFromInt dtb__142)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_startsWithSection = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (dtb__143 = mc1)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_sectionPresent = (fun (mc0 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (match dtb__145 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__147; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__148; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__149; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__150 } -> (if ((v_startsWithSection dtb__147) mc1) then true else ((v_sectionPresent dtb__146) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_checkRootSections = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (if ((v_sectionPresent mc1) dtb__151) then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_PackageSectionInWorkspaceRoot (dtb__151))) dtb__151) else (((v_checkRootSections mc0) mc1) dtb__152))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateRootShape = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (B_dData_dBool.v_not ((v_sectionPresent mc1) "workspace")) then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_MissingPackageName) else (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_uBase_uData_uList_uList_ua B_dData_dString.v_Eq_uString)) mc3) B_dData_dList.C_List_Nil) then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_EmptyWorkspace) else (((v_checkRootSections mc0) mc1) (B_dData_dList.C_List__x58__x58_ ("export", (B_dData_dList.C_List__x58__x58_ ("layers", (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil)))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 560 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validPackageChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (if (if (if (v_isLowerAlphaChar dtb__154) then true else (v_isDigitChar dtb__154)) then true else (dtb__154 = 45)) then (v_validPackageChars dtb__155) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validPackageName = (fun (name : string) -> (v_validPackageChars (B_dData_dList.dtp_unpack name)))

# 579 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validModuleTail = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> (if (if (if (if (v_isUpperAlphaChar dtb__156) then true else (v_isLowerAlphaChar dtb__156)) then true else (v_isDigitChar dtb__156)) then true else (dtb__156 = 95)) then (v_validModuleTail dtb__157) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleSegmentChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (if (v_isUpperAlphaChar dtb__158) then (v_validModuleTail dtb__159) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleSegment = (fun (seg : string) -> (v_validModuleSegmentChars (B_dData_dList.dtp_unpack seg)))

# 568 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validModuleSegments = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> (if (v_validModuleSegment dtb__160) then (v_validModuleSegments dtb__161) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 565 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleName = (fun (name : string) -> (v_validModuleSegments (Base_dSource.v_splitOnDot name)))

# 223 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateLayerTargets = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (if (v_validModuleName dtb__162) then ((v_validateLayerTargets mc0) dtb__163) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_LayerInvalidTarget (dtb__162))) dtb__162))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateLayers = (fun (mc0 : string) (mc1 : t_Layer B_dData_dList.t_List) (mc2 : t_Layer B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (if (v_validModuleName (dtb__164).f_Layer_layerName) then (match ((v_validateLayerTargets mc0) (dtb__164).f_Layer_layerUses) with
  | Base_dDiag.C_Check_ErrC (dtb__166) -> (Base_dDiag.C_Check_ErrC (dtb__166))
  | Base_dDiag.C_Check_OkC (dtb__167) -> (if ((v_layerHasCycle mc1) dtb__164) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) (dtb__164).f_Layer_layerLine) (Base_dDiagnostics_dPkg.C_PkgErr_LayerCycle ((dtb__164).f_Layer_layerName))) (dtb__164).f_Layer_layerName) else (((v_validateLayers mc0) mc1) dtb__165))
  | _ -> failwith "DT: impossible branch"
) else ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) (dtb__164).f_Layer_layerLine) (Base_dDiagnostics_dPkg.C_PkgErr_LayerInvalidName ((dtb__164).f_Layer_layerName))) (dtb__164).f_Layer_layerName))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 589 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateName = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : string) (mc3 : string B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> (if (dtb__168 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc2) Base_dDiagnostics_dPkg.C_PkgErr_EmptyPackageName) else (if (v_validPackageName dtb__168) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc2) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidPackageName (dtb__168))) dtb__168)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if mc0 then ((B_dData_dList.v_length mc1) > 0) else false) then (Base_dDiag.C_Check_OkC (0)) else ((Base_dDiagnostics_dPkg.v_pkgPath0 mc2) Base_dDiagnostics_dPkg.C_PkgErr_MissingPackageName))
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateMembers = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (if (dtb__169 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_EmptyMember) else ((v_validateMembers mc0) dtb__170))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 602 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateModules = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (if (v_validModuleName dtb__171) then ((v_validateModules mc0) dtb__172) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidExportModule (dtb__171))) dtb__171))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 607 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateExports = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__173) -> ((v_validateModules mc0) dtb__173)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 611 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateManifest = (fun (mc0 : t_Manifest) -> (match mc0 with
  | { f_Manifest_manifestName = dtb__174; f_Manifest_manifestMembers = dtb__175; f_Manifest_manifestIsWorkspace = dtb__176; f_Manifest_manifestExports = dtb__177; f_Manifest_manifestDependencies = dtb__178; f_Manifest_manifestPath = dtb__179; f_Manifest_manifestDiagFormat = dtb__180; f_Manifest_manifestDiagWarnings = dtb__181; f_Manifest_manifestDiagMaxErrors = dtb__182; f_Manifest_manifestDiagLang = dtb__183; f_Manifest_manifestDiagDenyWarnings = dtb__184; f_Manifest_manifestRegistryIndex = dtb__185; f_Manifest_manifestLayers = dtb__186 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_validateName dtb__176) dtb__175) dtb__179) dtb__174)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateMembers dtb__179) dtb__175)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateExports dtb__179) dtb__177)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateDependencies dtb__179) dtb__178)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) (((v_validateLayers dtb__179) dtb__186) dtb__186)) (fun _u -> ((B_dTrait_dApplicative.v_pure Base_dDiag.v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck) { f_Manifest_manifestName = dtb__174; f_Manifest_manifestMembers = dtb__175; f_Manifest_manifestIsWorkspace = dtb__176; f_Manifest_manifestExports = dtb__177; f_Manifest_manifestDependencies = dtb__178; f_Manifest_manifestPath = dtb__179; f_Manifest_manifestDiagFormat = dtb__180; f_Manifest_manifestDiagWarnings = dtb__181; f_Manifest_manifestDiagMaxErrors = dtb__182; f_Manifest_manifestDiagLang = dtb__183; f_Manifest_manifestDiagDenyWarnings = dtb__184; f_Manifest_manifestRegistryIndex = dtb__185; f_Manifest_manifestLayers = dtb__186 })))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_dirResult = (fun (dir : string) -> (if (dir = "") then "/" else dir))

# 626 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_dirFromRev = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__187, dtb__188) -> (if (dtb__187 = 47) then (v_dirResult (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb__188))) else (v_dirFromRev dtb__188))
  | B_dData_dList.C_List_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDir = (fun (path : string) -> (v_dirFromRev (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack path))))

# 634 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_resolveManifestPath = (fun (manifest : t_Manifest) (rel : string) -> ((fun dir -> (if ((B_dData_dString.v_startsWith "/") rel) then rel else (if (dir = ".") then rel else (String.concat "" [dir; "/"; rel])))) (v_manifestDir (manifest).f_Manifest_manifestPath)))

# 641 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagLang = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> (if (if (dtb__189 = "en") then true else (dtb__189 = "zh")) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagLang (dtb__189))) dtb__189))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_buildManifest = (fun (path : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_checkEntries path) entries)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) (((v_collectLayers path) entries) B_dData_dList.C_List_Nil)) (fun layers -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) "name") entries)) (fun name -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringListField path) (B_dData_dList.C_List__x58__x58_ ("workspace", B_dData_dList.C_List_Nil))) "members") entries)) (fun members -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_validateRootShape path) entries) name) (v_orEmptyList members))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringListField path) (B_dData_dList.C_List__x58__x58_ ("export", B_dData_dList.C_List_Nil))) "modules") entries)) (fun exports -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_collectDependencies path) entries)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "format") entries)) (fun diagFmt -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_boolField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "warnings") entries)) (fun diagWarns -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_intField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "max-errors") entries)) (fun diagMax -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "lang") entries)) (fun diagLang -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_boolField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "deny-warnings") entries)) (fun diagDeny -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("registry", B_dData_dList.C_List_Nil))) "index") entries)) (fun regIndex -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateDiagFormat path) diagFmt)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateDiagMax path) diagMax)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateDiagLang path) diagLang)) (fun _u -> ((B_dTrait_dApplicative.v_pure Base_dDiag.v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck) { f_Manifest_manifestName = name; f_Manifest_manifestMembers = (v_orEmptyList members); f_Manifest_manifestIsWorkspace = ((v_sectionPresent entries) "workspace"); f_Manifest_manifestExports = exports; f_Manifest_manifestDependencies = deps; f_Manifest_manifestPath = path; f_Manifest_manifestDiagFormat = diagFmt; f_Manifest_manifestDiagWarnings = diagWarns; f_Manifest_manifestDiagMaxErrors = diagMax; f_Manifest_manifestDiagLang = diagLang; f_Manifest_manifestDiagDenyWarnings = diagDeny; f_Manifest_manifestRegistryIndex = regIndex; f_Manifest_manifestLayers = layers }))))))))))))))))))))))))))))))))))

# 550 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_parseManifest = (fun (path : string) (contents : string) -> ((Base_dCommon.v_bind ((Frontend_dToml.v_parseTomlAt path) contents)) (fun (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((v_buildManifest path) entries))))
