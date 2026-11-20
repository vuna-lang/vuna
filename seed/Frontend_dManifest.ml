open Vuna_runtime
type t_DependencySource = C_DependencySource_DepPath of (string) | C_DependencySource_DepGit of (string) * (string) | C_DependencySource_DepUrl of (string)
and t_Dependency = { f_Dependency_depAlias : string; f_Dependency_depSource : t_DependencySource; f_Dependency_depHash : string B_dData_dMaybe.t_Maybe; f_Dependency_depIdentity : string B_dData_dMaybe.t_Maybe }
and t_Layer = { f_Layer_layerName : string; f_Layer_layerUses : string B_dData_dList.t_List; f_Layer_layerLine : int }
and t_Manifest = { f_Manifest_manifestName : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestMembers : string B_dData_dList.t_List; f_Manifest_manifestIsWorkspace : bool; f_Manifest_manifestExports : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe; f_Manifest_manifestDependencies : t_Dependency B_dData_dList.t_List; f_Manifest_manifestPath : string; f_Manifest_manifestDiagFormat : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagWarnings : bool B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagMaxErrors : int B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagLang : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagDenyWarnings : bool B_dData_dMaybe.t_Maybe; f_Manifest_manifestRegistryIndex : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestLayers : t_Layer B_dData_dList.t_List }
and t_DepAcc = { f_DepAcc_depAccAlias : string; f_DepAcc_depAccPath : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccGit : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccRev : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccUrl : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccHash : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccIdentity : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccTableLine : int }

# 42 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAliasOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__0; f_Dependency_depSource = dtb__1; f_Dependency_depHash = dtb__2; f_Dependency_depIdentity = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depSourceOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__4; f_Dependency_depSource = dtb__5; f_Dependency_depHash = dtb__6; f_Dependency_depIdentity = dtb__7 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depHashOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__8; f_Dependency_depSource = dtb__9; f_Dependency_depHash = dtb__10; f_Dependency_depIdentity = dtb__11 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depIdentityOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__12; f_Dependency_depSource = dtb__13; f_Dependency_depHash = dtb__14; f_Dependency_depIdentity = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_emptyDepAcc = (fun (alias : string) (line : int) -> { f_DepAcc_depAccAlias = alias; f_DepAcc_depAccPath = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccGit = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccRev = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccUrl = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccHash = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccIdentity = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccTableLine = line })

# 93 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDigitChar = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 96 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isUpperAlphaChar = (fun (c : int) -> (if (c >= 65) then (c <= 90) else false))

# 99 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLowerAlphaChar = (fun (c : int) -> (if (c >= 97) then (c <= 122) else false))

# 102 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_atLine = (fun (path : string) (line : int) (msg : string) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt line); ": "; msg]) else (String.concat "" [path; ":"; (bi_strFromInt line); ": "; msg])))

# 105 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestErr = (fun (path : string) (msg : string) -> (if (path = "") then msg else (String.concat "" [path; ": "; msg])))

# 108 "Vuna/Compiler/Frontend/Manifest.vuna"
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

# 113 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_fieldLine = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((Frontend_dToml.v_lookupEntryLine section) key) entries) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> dtb__20
  | B_dData_dMaybe.C_Maybe_Nothing -> 1
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_fieldLoc = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((Frontend_dToml.v_lookupEntryLine section) key) entries) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt dtb__21); ": "]) else (String.concat "" [path; ":"; (bi_strFromInt dtb__21); ": "]))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (path = "") then "" else (path ^ ": "))
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (match dtb__22 with
  | Frontend_dToml.C_TomlValue_TStr (dtb__23) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__23))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedString (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Frontend_dToml.v_lookupEntry section) key) entries)))

# 132 "Vuna/Compiler/Frontend/Manifest.vuna"
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

# 143 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_intField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (match dtb__27 with
  | Frontend_dToml.C_TomlValue_TInt (dtb__28) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__28))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedInt (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Frontend_dToml.v_lookupEntry section) key) entries)))

# 150 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_boolField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (match dtb__29 with
  | Frontend_dToml.C_TomlValue_TBool (dtb__30) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__30))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedBool (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Frontend_dToml.v_lookupEntry section) key) entries)))

# 157 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_orEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> dtb__31
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLayersSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (if (dtb__32 = "layers") then (match dtb__33 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> true
  | _ -> false
) else false)
  | _ -> false
))

# 168 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerSeen = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (if (mc0 = dtb__36) then true else ((v_layerSeen mc0) dtb__37))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Frontend/Manifest.vuna"
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

# 188 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerUsesOf = (fun (mc0 : t_Layer B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (if ((dtb__46).f_Layer_layerName = mc1) then (dtb__46).f_Layer_layerUses else ((v_layerUsesOf dtb__47) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_reachesFrom = (fun (fuel : int) (layers : t_Layer B_dData_dList.t_List) (todo : string B_dContainer_dQueue.t_Queue) (seen : string B_dData_dList.t_List) (target : string) -> (if (fuel <= 0) then false else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> (match dtb__48 with
  | { B_dData_dPair.f_Pair_first = dtb__49; B_dData_dPair.f_Pair_second = dtb__50 } -> (if (dtb__49 = target) then true else (if ((v_layerSeen dtb__49) seen) then (((((v_reachesFrom (fuel - 1)) layers) dtb__50) seen) target) else (((((v_reachesFrom (fuel - 1)) layers) ((B_dContainer_dQueue.v_pushAll ((v_layerUsesOf layers) dtb__49)) dtb__50)) (B_dData_dList.C_List__x58__x58_ (dtb__49, seen))) target)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) (B_dContainer_dQueue.v_pop todo))))

# 206 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerUsesTotal = (fun (mc0 : t_Layer B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> ((B_dData_dList.v_length (dtb__51).f_Layer_layerUses) + (v_layerUsesTotal dtb__52))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerVisitBound = (fun (layers : t_Layer B_dData_dList.t_List) -> (((v_layerUsesTotal layers) + (B_dData_dList.v_length layers)) + 1))

# 210 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerHasCycle = (fun (layers : t_Layer B_dData_dList.t_List) (l : t_Layer) -> (((((v_reachesFrom (v_layerVisitBound layers)) layers) (B_dContainer_dQueue.v_fromList ((v_layerUsesOf layers) (l).f_Layer_layerName))) B_dData_dList.C_List_Nil) (l).f_Layer_layerName))

# 238 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_orFalse = (fun (mc0 : bool B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> dtb__53
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDepTableSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (match dtb__55 with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (match dtb__57 with
  | B_dData_dList.C_List_Nil -> (dtb__54 = "dependencies")
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 249 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLintSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (if (dtb__58 = "lint") then true else false)
  | _ -> false
))

# 253 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAliasOfSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (match dtb__61 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__63 with
  | B_dData_dList.C_List_Nil -> dtb__62
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 257 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDepSourceKey = (fun (key : string) -> (if (if (if (if (if (key = "path") then true else (key = "git")) then true else (key = "rev")) then true else (key = "url")) then true else (key = "hash")) then true else (key = "identity")))

# 263 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkOneEntry = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry) -> (match mc1 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__64; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__65; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__66; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__67 } -> (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__64) B_dData_dList.C_List_Nil) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_UnexpectedTopLevelKey (dtb__65))) dtb__65) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__64) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) then (if (dtb__65 = "name") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__65, "package"))) dtb__65) "package")) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__64) (B_dData_dList.C_List__x58__x58_ ("workspace", B_dData_dList.C_List_Nil))) then (if (dtb__65 = "members") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__65, "workspace"))) dtb__65) "workspace")) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__64) (B_dData_dList.C_List__x58__x58_ ("export", B_dData_dList.C_List_Nil))) then (if (dtb__65 = "modules") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__65, "export"))) dtb__65) "export")) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__64) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) then (if (if (if (if (if (dtb__65 = "format") then true else (dtb__65 = "warnings")) then true else (dtb__65 = "max-errors")) then true else (dtb__65 = "lang")) then true else (dtb__65 = "deny-warnings")) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__65, "diagnostics"))) dtb__65) "diagnostics")) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__64) (B_dData_dList.C_List__x58__x58_ ("layers", B_dData_dList.C_List_Nil))) then (match dtb__66 with
  | Frontend_dToml.C_TomlValue_TArray (dtb__68) -> (Base_dDiag.C_Check_OkC (0))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb__65))) dtb__65)
) else (if (v_isLayersSection dtb__64) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_LayerKeyMustBeQuoted ((Base_dSource.v_joinDots ((B_dData_dList.v_append dtb__64) (B_dData_dList.C_List__x58__x58_ (dtb__65, B_dData_dList.C_List_Nil))))))) (Base_dSource.v_joinDots ((B_dData_dList.v_append dtb__64) (B_dData_dList.C_List__x58__x58_ (dtb__65, B_dData_dList.C_List_Nil))))) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__64) (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil))) then (Base_dDiag.C_Check_OkC (0)) else (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__64) (B_dData_dList.C_List__x58__x58_ ("registry", B_dData_dList.C_List_Nil))) then (if (dtb__65 = "index") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__65, "registry"))) dtb__65) "registry")) else (if (v_isDepTableSection dtb__64) then (if (v_isDepSourceKey dtb__65) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownSourceKey (dtb__65, (v_depAliasOfSection dtb__64)))) dtb__65) (v_depAliasOfSection dtb__64))) else (if (v_isLintSection dtb__64) then (Base_dDiag.C_Check_OkC (0)) else ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__67) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownSection ((Base_dSource.v_joinDots dtb__64)))) (Base_dSource.v_joinDots dtb__64)))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_checkEntries = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match ((v_checkOneEntry mc0) dtb__69) with
  | Base_dDiag.C_Check_ErrC (dtb__71) -> (Base_dDiag.C_Check_ErrC (dtb__71))
  | Base_dDiag.C_Check_OkC (dtb__72) -> ((v_checkEntries mc0) dtb__70)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_hasAcc = (fun (mc0 : string) (mc1 : t_DepAcc B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (if ((dtb__73).f_DepAcc_depAccAlias = mc0) then true else ((v_hasAcc mc0) dtb__74))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 294 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_ensureAcc = (fun (alias : string) (line : int) (acc : t_DepAcc B_dData_dList.t_List) -> (if ((v_hasAcc alias) acc) then acc else ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (((v_emptyDepAcc alias) line), B_dData_dList.C_List_Nil)))))

# 297 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_mapAcc = (fun (mc0 : string) (mc1 : (t_DepAcc) -> t_DepAcc) (mc2 : t_DepAcc B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (if ((dtb__75).f_DepAcc_depAccAlias = mc0) then (B_dData_dList.C_List__x58__x58_ ((mc1 dtb__75), dtb__76)) else (B_dData_dList.C_List__x58__x58_ (dtb__75, (((v_mapAcc mc0) mc1) dtb__76))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccPath = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccPath = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 305 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccGit = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccGit = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 308 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccRev = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccRev = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 311 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccUrl = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccUrl = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 314 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccHash = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccHash = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 317 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccIdentity = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccIdentity = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 320 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringValueOf = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dToml.t_TomlValue) (mc3 : int) -> (match mc2 with
  | Frontend_dToml.C_TomlValue_TStr (dtb__77) -> (Base_dDiag.C_Check_OkC (dtb__77))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) mc3) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedString (mc1))) mc1)
))

# 325 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_applyDepEntry = (fun (path : string) (alias : string) (key : string) (value : Frontend_dToml.t_TomlValue) (line : int) (acc : t_DepAcc B_dData_dList.t_List) -> ((fun ensured -> (if (key = "path") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__78) -> (Base_dDiag.C_Check_ErrC (dtb__78))
  | Base_dDiag.C_Check_OkC (dtb__79) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccPath dtb__79)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "git") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__80) -> (Base_dDiag.C_Check_ErrC (dtb__80))
  | Base_dDiag.C_Check_OkC (dtb__81) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccGit dtb__81)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "rev") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__82) -> (Base_dDiag.C_Check_ErrC (dtb__82))
  | Base_dDiag.C_Check_OkC (dtb__83) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccRev dtb__83)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "url") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__84) -> (Base_dDiag.C_Check_ErrC (dtb__84))
  | Base_dDiag.C_Check_OkC (dtb__85) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccUrl dtb__85)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "hash") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__86) -> (Base_dDiag.C_Check_ErrC (dtb__86))
  | Base_dDiag.C_Check_OkC (dtb__87) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccHash dtb__87)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__88) -> (Base_dDiag.C_Check_ErrC (dtb__88))
  | Base_dDiag.C_Check_OkC (dtb__89) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccIdentity dtb__89)) ensured)))
  | _ -> failwith "DT: impossible branch"
))))))) (((v_ensureAcc alias) line) acc)))

# 355 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectTables = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : t_DepAcc B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__92; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__93; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__94; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__95 } -> (if (v_isDepTableSection dtb__92) then (match ((((((v_applyDepEntry mc0) (v_depAliasOfSection dtb__92)) dtb__93) dtb__94) dtb__95) mc2) with
  | Base_dDiag.C_Check_ErrC (dtb__96) -> (Base_dDiag.C_Check_ErrC (dtb__96))
  | Base_dDiag.C_Check_OkC (dtb__97) -> (((v_collectTables mc0) dtb__91) dtb__97)
  | _ -> failwith "DT: impossible branch"
) else (((v_collectTables mc0) dtb__91) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectStrings = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (match dtb__98 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__100; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__101; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__102; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__103 } -> (if (((v_sameSection B_dData_dString.v_Eq_uString) dtb__100) (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil))) then (match dtb__102 with
  | Frontend_dToml.C_TomlValue_TStr (dtb__104) -> (((v_collectStrings mc0) dtb__99) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__104; B_dData_dPair.f_Pair_second = dtb__103 } }, mc2)))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__103) (Base_dDiagnostics_dPkg.C_PkgErr_DependencyPathNotString (dtb__101))) dtb__101)
) else (((v_collectStrings mc0) dtb__99) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_buildDependency = (fun (path : string) (acc : t_DepAcc) -> (match (acc).f_DepAcc_depAccPath with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (match (acc).f_DepAcc_depAccGit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (acc).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (acc).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepPath (dtb__105)); f_Dependency_depHash = (acc).f_DepAcc_depAccHash; f_Dependency_depIdentity = (acc).f_DepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (acc).f_DepAcc_depAccGit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__108) -> (match (acc).f_DepAcc_depAccRev with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_GitRevRequired ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (match (acc).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (acc).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepGit (dtb__108, dtb__109)); f_Dependency_depHash = (acc).f_DepAcc_depAccHash; f_Dependency_depIdentity = (acc).f_DepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (acc).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (acc).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepUrl (dtb__111)); f_Dependency_depHash = (acc).f_DepAcc_depAccHash; f_Dependency_depIdentity = (acc).f_DepAcc_depAccIdentity }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_buildTables = (fun (mc0 : string) (mc1 : t_DepAcc B_dData_dList.t_List) (mc2 : t_Dependency B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (match ((v_buildDependency mc0) dtb__112) with
  | Base_dDiag.C_Check_ErrC (dtb__114) -> (Base_dDiag.C_Check_ErrC (dtb__114))
  | Base_dDiag.C_Check_OkC (dtb__115) -> (((v_buildTables mc0) dtb__113) (B_dData_dList.C_List__x58__x58_ (dtb__115, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_collectDependencies = (fun (path : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((v_collectStrings path) entries) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__116) -> (Base_dDiag.C_Check_ErrC (dtb__116))
  | Base_dDiag.C_Check_OkC (dtb__117) -> (match (((v_collectTables path) entries) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__118) -> (Base_dDiag.C_Check_ErrC (dtb__118))
  | Base_dDiag.C_Check_OkC (dtb__119) -> (match (((v_buildTables path) dtb__119) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__120) -> (Base_dDiag.C_Check_ErrC (dtb__120))
  | Base_dDiag.C_Check_OkC (dtb__121) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (p : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> { f_Dependency_depAlias = (B_dData_dPair.v_firstOf p); f_Dependency_depSource = (C_DependencySource_DepPath ((B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf p)))); f_Dependency_depHash = B_dData_dMaybe.C_Maybe_Nothing; f_Dependency_depIdentity = B_dData_dMaybe.C_Maybe_Nothing })) dtb__117)) dtb__121)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isHexChar = (fun (c : int) -> (if (if (v_isDigitChar c) then true else (if (c >= 65) then (c <= 70) else false)) then true else (if (c >= 97) then (c <= 102) else false)))

# 437 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_allHex = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (if (v_isHexChar dtb__122) then (v_allHex dtb__123) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validHashText = (fun (s : string) -> (if ((B_dData_dString.v_startsWith "sha256:") s) then (if ((bi_strLength s) = 71) then (v_allHex (B_dData_dList.dtp_unpack (((B_dData_dString.v_substring 7) 64) s))) else false) else (if ((bi_strLength s) = 64) then (v_allHex (B_dData_dList.dtp_unpack s)) else false)))

# 449 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkHashForm = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__124) -> (if (v_validHashText dtb__124) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_HashMalformed (dtb__124))) dtb__124))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkIdentityForm = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__125) -> (if (v_validHashText dtb__125) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMalformed (dtb__125))) dtb__125))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDependency = (fun (mc0 : string) (mc1 : t_Dependency) -> (match mc1 with
  | { f_Dependency_depAlias = dtb__126; f_Dependency_depSource = dtb__127; f_Dependency_depHash = dtb__128; f_Dependency_depIdentity = dtb__129 } -> (if (dtb__126 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_EmptyDependencyName) else (match ((v_checkIdentityForm mc0) dtb__129) with
  | Base_dDiag.C_Check_ErrC (dtb__130) -> (Base_dDiag.C_Check_ErrC (dtb__130))
  | Base_dDiag.C_Check_OkC (dtb__131) -> (match dtb__127 with
  | C_DependencySource_DepPath (dtb__132) -> (if (dtb__132 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_EmptyDependencyPath (dtb__126))) dtb__126) else (((v_checkHashForm mc0) dtb__126) dtb__128))
  | C_DependencySource_DepGit (dtb__133, dtb__134) -> (match dtb__128 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_MissingHash (dtb__126))) dtb__126)
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (if (dtb__133 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing (dtb__126))) dtb__126) else (if (dtb__134 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_GitRevRequired (dtb__126))) dtb__126) else (((v_checkHashForm mc0) dtb__126) dtb__128)))
  | _ -> failwith "DT: impossible branch"
)
  | C_DependencySource_DepUrl (dtb__136) -> (match dtb__128 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_MissingHash (dtb__126))) dtb__126)
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (if (dtb__136 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing (dtb__126))) dtb__126) else (((v_checkHashForm mc0) dtb__126) dtb__128))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateDepsSeen = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : t_Dependency B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (if ((B_dData_dList.v_memName (v_depAliasOf dtb__138)) mc1) then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_DuplicateDependency ((v_depAliasOf dtb__138)))) (v_depAliasOf dtb__138)) else (match ((v_validateDependency mc0) dtb__138) with
  | Base_dDiag.C_Check_ErrC (dtb__140) -> (Base_dDiag.C_Check_ErrC (dtb__140))
  | Base_dDiag.C_Check_OkC (dtb__141) -> (((v_validateDepsSeen mc0) (B_dData_dList.C_List__x58__x58_ ((v_depAliasOf dtb__138), mc1))) dtb__139)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDependencies = (fun (path : string) (deps : t_Dependency B_dData_dList.t_List) -> (((v_validateDepsSeen path) B_dData_dList.C_List_Nil) deps))

# 492 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagFormat = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (if (if (if (if (dtb__142 = "short") then true else (dtb__142 = "human")) then true else (dtb__142 = "json")) then true else (dtb__142 = "sarif")) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagFormat (dtb__142))) dtb__142))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagMax = (fun (mc0 : string) (mc1 : int B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (if (dtb__143 >= 1) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagMaxErrors ((bi_strFromInt dtb__143)))) (bi_strFromInt dtb__143)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_startsWithSection = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (dtb__144 = mc1)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_sectionPresent = (fun (mc0 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (match dtb__146 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__148; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__149; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__150; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__151 } -> (if ((v_startsWithSection dtb__148) mc1) then true else ((v_sectionPresent dtb__147) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_checkRootSections = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (if ((v_sectionPresent mc1) dtb__152) then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_PackageSectionInWorkspaceRoot (dtb__152))) dtb__152) else (((v_checkRootSections mc0) mc1) dtb__153))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 516 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateRootShape = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (B_dData_dBool.v_not ((v_sectionPresent mc1) "workspace")) then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_MissingPackageName) else (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_uBase_uData_uList_uList_ua B_dData_dString.v_Eq_uString)) mc3) B_dData_dList.C_List_Nil) then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_EmptyWorkspace) else (((v_checkRootSections mc0) mc1) (B_dData_dList.C_List__x58__x58_ ("export", (B_dData_dList.C_List__x58__x58_ ("layers", (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil)))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validPackageChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> (if (if (if (v_isLowerAlphaChar dtb__155) then true else (v_isDigitChar dtb__155)) then true else (dtb__155 = 45)) then (v_validPackageChars dtb__156) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validPackageName = (fun (name : string) -> (v_validPackageChars (B_dData_dList.dtp_unpack name)))

# 585 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validModuleTail = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__157, dtb__158) -> (if (if (if (if (v_isUpperAlphaChar dtb__157) then true else (v_isLowerAlphaChar dtb__157)) then true else (v_isDigitChar dtb__157)) then true else (dtb__157 = 95)) then (v_validModuleTail dtb__158) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleSegmentChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (if (v_isUpperAlphaChar dtb__159) then (v_validModuleTail dtb__160) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleSegment = (fun (seg : string) -> (v_validModuleSegmentChars (B_dData_dList.dtp_unpack seg)))

# 574 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validModuleSegments = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (if (v_validModuleSegment dtb__161) then (v_validModuleSegments dtb__162) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 571 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleName = (fun (name : string) -> (v_validModuleSegments (Base_dSource.v_splitOnDot name)))

# 229 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateLayerTargets = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (if (v_validModuleName dtb__163) then ((v_validateLayerTargets mc0) dtb__164) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_LayerInvalidTarget (dtb__163))) dtb__163))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateLayers = (fun (mc0 : string) (mc1 : t_Layer B_dData_dList.t_List) (mc2 : t_Layer B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (if (v_validModuleName (dtb__165).f_Layer_layerName) then (match ((v_validateLayerTargets mc0) (dtb__165).f_Layer_layerUses) with
  | Base_dDiag.C_Check_ErrC (dtb__167) -> (Base_dDiag.C_Check_ErrC (dtb__167))
  | Base_dDiag.C_Check_OkC (dtb__168) -> (if ((v_layerHasCycle mc1) dtb__165) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) (dtb__165).f_Layer_layerLine) (Base_dDiagnostics_dPkg.C_PkgErr_LayerCycle ((dtb__165).f_Layer_layerName))) (dtb__165).f_Layer_layerName) else (((v_validateLayers mc0) mc1) dtb__166))
  | _ -> failwith "DT: impossible branch"
) else ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) (dtb__165).f_Layer_layerLine) (Base_dDiagnostics_dPkg.C_PkgErr_LayerInvalidName ((dtb__165).f_Layer_layerName))) (dtb__165).f_Layer_layerName))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 595 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateName = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : string) (mc3 : string B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (if (dtb__169 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc2) Base_dDiagnostics_dPkg.C_PkgErr_EmptyPackageName) else (if (v_validPackageName dtb__169) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc2) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidPackageName (dtb__169))) dtb__169)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if mc0 then ((B_dData_dList.v_length mc1) > 0) else false) then (Base_dDiag.C_Check_OkC (0)) else ((Base_dDiagnostics_dPkg.v_pkgPath0 mc2) Base_dDiagnostics_dPkg.C_PkgErr_MissingPackageName))
  | _ -> failwith "DT: impossible branch"
))

# 603 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateMembers = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (if (dtb__170 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_EmptyMember) else ((v_validateMembers mc0) dtb__171))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateModules = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__172, dtb__173) -> (if (v_validModuleName dtb__172) then ((v_validateModules mc0) dtb__173) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidExportModule (dtb__172))) dtb__172))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateExports = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__174) -> ((v_validateModules mc0) dtb__174)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 617 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateManifest = (fun (mc0 : t_Manifest) -> (match mc0 with
  | { f_Manifest_manifestName = dtb__175; f_Manifest_manifestMembers = dtb__176; f_Manifest_manifestIsWorkspace = dtb__177; f_Manifest_manifestExports = dtb__178; f_Manifest_manifestDependencies = dtb__179; f_Manifest_manifestPath = dtb__180; f_Manifest_manifestDiagFormat = dtb__181; f_Manifest_manifestDiagWarnings = dtb__182; f_Manifest_manifestDiagMaxErrors = dtb__183; f_Manifest_manifestDiagLang = dtb__184; f_Manifest_manifestDiagDenyWarnings = dtb__185; f_Manifest_manifestRegistryIndex = dtb__186; f_Manifest_manifestLayers = dtb__187 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_validateName dtb__177) dtb__176) dtb__180) dtb__175)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateMembers dtb__180) dtb__176)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateExports dtb__180) dtb__178)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateDependencies dtb__180) dtb__179)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) (((v_validateLayers dtb__180) dtb__187) dtb__187)) (fun _u -> ((B_dTrait_dApplicative.v_pure Base_dDiag.v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck) { f_Manifest_manifestName = dtb__175; f_Manifest_manifestMembers = dtb__176; f_Manifest_manifestIsWorkspace = dtb__177; f_Manifest_manifestExports = dtb__178; f_Manifest_manifestDependencies = dtb__179; f_Manifest_manifestPath = dtb__180; f_Manifest_manifestDiagFormat = dtb__181; f_Manifest_manifestDiagWarnings = dtb__182; f_Manifest_manifestDiagMaxErrors = dtb__183; f_Manifest_manifestDiagLang = dtb__184; f_Manifest_manifestDiagDenyWarnings = dtb__185; f_Manifest_manifestRegistryIndex = dtb__186; f_Manifest_manifestLayers = dtb__187 })))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_dirResult = (fun (dir : string) -> (if (dir = "") then "/" else dir))

# 632 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_dirFromRev = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (if (dtb__188 = 47) then (v_dirResult (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb__189))) else (v_dirFromRev dtb__189))
  | B_dData_dList.C_List_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

# 629 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDir = (fun (path : string) -> (v_dirFromRev (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack path))))

# 640 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_resolveManifestPath = (fun (manifest : t_Manifest) (rel : string) -> ((fun dir -> (if ((B_dData_dString.v_startsWith "/") rel) then rel else (if (dir = ".") then rel else (String.concat "" [dir; "/"; rel])))) (v_manifestDir (manifest).f_Manifest_manifestPath)))

# 647 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagLang = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (if (if (dtb__190 = "en") then true else (dtb__190 = "zh")) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagLang (dtb__190))) dtb__190))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_buildManifest = (fun (path : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_checkEntries path) entries)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) (((v_collectLayers path) entries) B_dData_dList.C_List_Nil)) (fun layers -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) "name") entries)) (fun name -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringListField path) (B_dData_dList.C_List__x58__x58_ ("workspace", B_dData_dList.C_List_Nil))) "members") entries)) (fun members -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_validateRootShape path) entries) name) (v_orEmptyList members))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringListField path) (B_dData_dList.C_List__x58__x58_ ("export", B_dData_dList.C_List_Nil))) "modules") entries)) (fun exports -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_collectDependencies path) entries)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "format") entries)) (fun diagFmt -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_boolField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "warnings") entries)) (fun diagWarns -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_intField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "max-errors") entries)) (fun diagMax -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "lang") entries)) (fun diagLang -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_boolField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "deny-warnings") entries)) (fun diagDeny -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("registry", B_dData_dList.C_List_Nil))) "index") entries)) (fun regIndex -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateDiagFormat path) diagFmt)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateDiagMax path) diagMax)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck) ((v_validateDiagLang path) diagLang)) (fun _u -> ((B_dTrait_dApplicative.v_pure Base_dDiag.v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck) { f_Manifest_manifestName = name; f_Manifest_manifestMembers = (v_orEmptyList members); f_Manifest_manifestIsWorkspace = ((v_sectionPresent entries) "workspace"); f_Manifest_manifestExports = exports; f_Manifest_manifestDependencies = deps; f_Manifest_manifestPath = path; f_Manifest_manifestDiagFormat = diagFmt; f_Manifest_manifestDiagWarnings = diagWarns; f_Manifest_manifestDiagMaxErrors = diagMax; f_Manifest_manifestDiagLang = diagLang; f_Manifest_manifestDiagDenyWarnings = diagDeny; f_Manifest_manifestRegistryIndex = regIndex; f_Manifest_manifestLayers = layers }))))))))))))))))))))))))))))))))))

# 556 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_parseManifest = (fun (path : string) (contents : string) -> ((Base_dCommon.v_bind ((Frontend_dToml.v_parseTomlAt path) contents)) (fun (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((v_buildManifest path) entries))))
