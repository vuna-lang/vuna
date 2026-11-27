open Vuna_runtime
type t_DependencySource = C_DependencySource_DepPath of (string) | C_DependencySource_DepGit of (string) * (string) | C_DependencySource_DepUrl of (string)
and t_Dependency = { f_Dependency_depAlias : string; f_Dependency_depSource : t_DependencySource; f_Dependency_depHash : string B_dData_dMaybe.t_Maybe; f_Dependency_depIdentity : string B_dData_dMaybe.t_Maybe }
and t_Layer = { f_Layer_layerName : string; f_Layer_layerUses : string B_dData_dList.t_List; f_Layer_layerLine : int }
and t_Manifest = { f_Manifest_manifestName : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestMembers : string B_dData_dList.t_List; f_Manifest_manifestIsWorkspace : bool; f_Manifest_manifestExports : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe; f_Manifest_manifestImplicitPrelude : bool; f_Manifest_manifestDependencies : t_Dependency B_dData_dList.t_List; f_Manifest_manifestPath : string; f_Manifest_manifestDiagFormat : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagWarnings : bool B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagMaxErrors : int B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagLang : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagDenyWarnings : bool B_dData_dMaybe.t_Maybe; f_Manifest_manifestRegistryIndex : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestLayers : t_Layer B_dData_dList.t_List }
and t_DepAcc = { f_DepAcc_depAccAlias : string; f_DepAcc_depAccPath : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccGit : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccRev : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccUrl : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccHash : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccIdentity : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccTableLine : int }

# 44 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAliasOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__0; f_Dependency_depSource = dtb__1; f_Dependency_depHash = dtb__2; f_Dependency_depIdentity = dtb__3 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depSourceOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__4; f_Dependency_depSource = dtb__5; f_Dependency_depHash = dtb__6; f_Dependency_depIdentity = dtb__7 } -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depHashOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__8; f_Dependency_depSource = dtb__9; f_Dependency_depHash = dtb__10; f_Dependency_depIdentity = dtb__11 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depIdentityOf = (fun (mc0 : t_Dependency) -> (match mc0 with
  | { f_Dependency_depAlias = dtb__12; f_Dependency_depSource = dtb__13; f_Dependency_depHash = dtb__14; f_Dependency_depIdentity = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_emptyDepAcc = (fun (alias : string) (line : int) -> { f_DepAcc_depAccAlias = alias; f_DepAcc_depAccPath = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccGit = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccRev = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccUrl = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccHash = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccIdentity = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccTableLine = line })

# 97 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDigitChar = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 100 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isUpperAlphaChar = (fun (c : int) -> (if (c >= 65) then (c <= 90) else false))

# 103 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLowerAlphaChar = (fun (c : int) -> (if (c >= 97) then (c <= 122) else false))

# 106 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_atLine = (fun (path : string) (line : int) (msg : string) -> (if (path = "") then (String.concat "" ["line "; (string_of_int line); ": "; msg]) else (String.concat "" [path; ":"; (string_of_int line); ": "; msg])))

# 109 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestErr = (fun (path : string) (msg : string) -> (if (path = "") then msg else (String.concat "" [path; ": "; msg])))

# 112 "Vuna/Compiler/Frontend/Manifest.vuna"
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

# 117 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_fieldLine = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((Frontend_dToml.v_lookupEntryLine section) key) entries) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> dtb__20
  | B_dData_dMaybe.C_Maybe_Nothing -> 1
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_fieldLoc = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((Frontend_dToml.v_lookupEntryLine section) key) entries) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (if (path = "") then (String.concat "" ["line "; (string_of_int dtb__21); ": "]) else (String.concat "" [path; ":"; (string_of_int dtb__21); ": "]))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (path = "") then "" else (path ^ ": "))
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (let nd_uscrut4 = (((Frontend_dToml.v_lookupEntry section) key) entries) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (match dtb__22 with
  | Frontend_dToml.C_TomlValue_TStr (dtb__23) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__23))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedString (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 136 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringListField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (let nd_uscrut4 = (((Frontend_dToml.v_lookupEntry section) key) entries) in (match nd_uscrut4 with
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
)))

# 147 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_intField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (let nd_uscrut4 = (((Frontend_dToml.v_lookupEntry section) key) entries) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (match dtb__27 with
  | Frontend_dToml.C_TomlValue_TInt (dtb__28) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__28))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedInt (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 154 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_boolField = (fun (path : string) (section : string B_dData_dList.t_List) (key : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (let nd_uscrut4 = (((Frontend_dToml.v_lookupEntry section) key) entries) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (match dtb__29 with
  | Frontend_dToml.C_TomlValue_TBool (dtb__30) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__30))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) ((((v_fieldLine path) section) key) entries)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedBool (key))) key)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 161 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_orEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> dtb__31
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_preludeEnabled = (fun (mc0 : bool B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> dtb__32
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLayersSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (if (dtb__33 = "layers") then (match dtb__34 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> true
  | _ -> false
) else false)
  | _ -> false
))

# 177 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerSeen = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (if (mc0 = dtb__37) then true else ((v_layerSeen mc0) dtb__38))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectLayers = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match dtb__39 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__41; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__42; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__43; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__44 } -> (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__41) (B_dData_dList.C_List__x58__x58_ ("layers", B_dData_dList.C_List_Nil))) then (if ((v_layerSeen dtb__42) mc2) then (((v_collectLayers mc0) dtb__40) mc2) else (match dtb__43 with
  | Frontend_dToml.C_TomlValue_TArray (dtb__45) -> (match (Frontend_dToml.v_arrayStrings dtb__45) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__44) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb__42))) dtb__42)
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> ((Base_dCommon.v_bind (((v_collectLayers mc0) dtb__40) (B_dData_dList.C_List__x58__x58_ (dtb__42, mc2)))) (fun (ls : t_Layer B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ f_Layer_layerName = dtb__42; f_Layer_layerUses = dtb__46; f_Layer_layerLine = dtb__44 }, ls))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__44) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb__42))) dtb__42)
)) else (((v_collectLayers mc0) dtb__40) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerUsesOf = (fun (mc0 : t_Layer B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (if ((dtb__47).f_Layer_layerName = mc1) then (dtb__47).f_Layer_layerUses else ((v_layerUsesOf dtb__48) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_reachesFrom = (fun (fuel : int) (layers : t_Layer B_dData_dList.t_List) (todo : string B_dContainer_dQueue.t_Queue) (seen : string B_dData_dList.t_List) (target : string) -> (if (fuel <= 0) then false else (let nd_uscrut5 = (B_dContainer_dQueue.v_pop todo) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (match dtb__49 with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (if (dtb__50 = target) then true else (if ((v_layerSeen dtb__50) seen) then (((((v_reachesFrom (fuel - 1)) layers) dtb__51) seen) target) else (((((v_reachesFrom (fuel - 1)) layers) ((B_dContainer_dQueue.v_pushAll ((v_layerUsesOf layers) dtb__50)) dtb__51)) (B_dData_dList.C_List__x58__x58_ (dtb__50, seen))) target)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))))

# 215 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerUsesTotal = (fun (mc0 : t_Layer B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> ((B_dData_dList.v_length (dtb__52).f_Layer_layerUses) + (v_layerUsesTotal dtb__53))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerVisitBound = (fun (layers : t_Layer B_dData_dList.t_List) -> (((v_layerUsesTotal layers) + (B_dData_dList.v_length layers)) + 1))

# 219 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerHasCycle = (fun (layers : t_Layer B_dData_dList.t_List) (l : t_Layer) -> (((((v_reachesFrom (v_layerVisitBound layers)) layers) (B_dContainer_dQueue.v_fromList ((v_layerUsesOf layers) (l).f_Layer_layerName))) B_dData_dList.C_List_Nil) (l).f_Layer_layerName))

# 247 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_orFalse = (fun (mc0 : bool B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> dtb__54
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDepTableSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (match dtb__56 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match dtb__58 with
  | B_dData_dList.C_List_Nil -> (dtb__55 = "dependencies")
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 258 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLintSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (if (dtb__59 = "lint") then true else false)
  | _ -> false
))

# 262 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAliasOfSection = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match dtb__62 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (match dtb__64 with
  | B_dData_dList.C_List_Nil -> dtb__63
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 266 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDepSourceKey = (fun (key : string) -> (if (if (if (if (if (key = "path") then true else (key = "git")) then true else (key = "rev")) then true else (key = "url")) then true else (key = "hash")) then true else (key = "identity")))

# 272 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkOneEntry = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry) -> (match mc1 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__65; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__66; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__67; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__68 } -> (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__65) B_dData_dList.C_List_Nil) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_UnexpectedTopLevelKey (dtb__66))) dtb__66) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__65) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) then (if (if (dtb__66 = "name") then true else (dtb__66 = "implicit-prelude")) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__66, "package"))) dtb__66) "package")) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__65) (B_dData_dList.C_List__x58__x58_ ("workspace", B_dData_dList.C_List_Nil))) then (if (dtb__66 = "members") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__66, "workspace"))) dtb__66) "workspace")) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__65) (B_dData_dList.C_List__x58__x58_ ("export", B_dData_dList.C_List_Nil))) then (if (dtb__66 = "modules") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__66, "export"))) dtb__66) "export")) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__65) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) then (if (if (if (if (if (dtb__66 = "format") then true else (dtb__66 = "warnings")) then true else (dtb__66 = "max-errors")) then true else (dtb__66 = "lang")) then true else (dtb__66 = "deny-warnings")) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__66, "diagnostics"))) dtb__66) "diagnostics")) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__65) (B_dData_dList.C_List__x58__x58_ ("layers", B_dData_dList.C_List_Nil))) then (match dtb__67 with
  | Frontend_dToml.C_TomlValue_TArray (dtb__69) -> (Base_dDiag.C_Check_OkC (0))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb__66))) dtb__66)
) else (if (v_isLayersSection dtb__65) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_LayerKeyMustBeQuoted ((Base_dSource.v_joinDots ((B_dData_dList.v_append dtb__65) (B_dData_dList.C_List__x58__x58_ (dtb__66, B_dData_dList.C_List_Nil))))))) (Base_dSource.v_joinDots ((B_dData_dList.v_append dtb__65) (B_dData_dList.C_List__x58__x58_ (dtb__66, B_dData_dList.C_List_Nil))))) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__65) (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil))) then (Base_dDiag.C_Check_OkC (0)) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__65) (B_dData_dList.C_List__x58__x58_ ("registry", B_dData_dList.C_List_Nil))) then (if (dtb__66 = "index") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb__66, "registry"))) dtb__66) "registry")) else (if (v_isDepTableSection dtb__65) then (if (v_isDepSourceKey dtb__66) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownSourceKey (dtb__66, (v_depAliasOfSection dtb__65)))) dtb__66) (v_depAliasOfSection dtb__65))) else (if (v_isLintSection dtb__65) then (Base_dDiag.C_Check_OkC (0)) else ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__68) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownSection ((Base_dSource.v_joinDots dtb__65)))) (Base_dSource.v_joinDots dtb__65)))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_checkEntries = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match ((v_checkOneEntry mc0) dtb__70) with
  | Base_dDiag.C_Check_ErrC (dtb__72) -> (Base_dDiag.C_Check_ErrC (dtb__72))
  | Base_dDiag.C_Check_OkC (dtb__73) -> ((v_checkEntries mc0) dtb__71)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_hasAcc = (fun (mc0 : string) (mc1 : t_DepAcc B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (if ((dtb__74).f_DepAcc_depAccAlias = mc0) then true else ((v_hasAcc mc0) dtb__75))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_ensureAcc = (fun (alias : string) (line : int) (acc : t_DepAcc B_dData_dList.t_List) -> (if ((v_hasAcc alias) acc) then acc else ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (((v_emptyDepAcc alias) line), B_dData_dList.C_List_Nil)))))

# 306 "Vuna/Compiler/Frontend/Manifest.vuna"
let[@tail_mod_cons] rec v_mapAcc = (fun (mc0 : string) (mc1 : (t_DepAcc) -> t_DepAcc) (mc2 : t_DepAcc B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (if ((dtb__76).f_DepAcc_depAccAlias = mc0) then (B_dData_dList.C_List__x58__x58_ ((mc1 dtb__76), dtb__77)) else (B_dData_dList.C_List__x58__x58_ (dtb__76, (((v_mapAcc mc0) mc1) dtb__77))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccPath = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccPath = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 314 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccGit = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccGit = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 317 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccRev = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccRev = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 320 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccUrl = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccUrl = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 323 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccHash = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccHash = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 326 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccIdentity = (fun (s : string) (acc : t_DepAcc) -> { acc with f_DepAcc_depAccIdentity = (B_dData_dMaybe.C_Maybe_Just (s)) })

# 329 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringValueOf = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dToml.t_TomlValue) (mc3 : int) -> (match mc2 with
  | Frontend_dToml.C_TomlValue_TStr (dtb__78) -> (Base_dDiag.C_Check_OkC (dtb__78))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) mc3) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedString (mc1))) mc1)
))

# 334 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_applyDepEntry = (fun (path : string) (alias : string) (key : string) (value : Frontend_dToml.t_TomlValue) (line : int) (acc : t_DepAcc B_dData_dList.t_List) -> (let ensured = (((v_ensureAcc alias) line) acc) in (if (key = "path") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__79) -> (Base_dDiag.C_Check_ErrC (dtb__79))
  | Base_dDiag.C_Check_OkC (dtb__80) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccPath dtb__80)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "git") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__81) -> (Base_dDiag.C_Check_ErrC (dtb__81))
  | Base_dDiag.C_Check_OkC (dtb__82) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccGit dtb__82)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "rev") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__83) -> (Base_dDiag.C_Check_ErrC (dtb__83))
  | Base_dDiag.C_Check_OkC (dtb__84) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccRev dtb__84)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "url") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__85) -> (Base_dDiag.C_Check_ErrC (dtb__85))
  | Base_dDiag.C_Check_OkC (dtb__86) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccUrl dtb__86)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (if (key = "hash") then (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__87) -> (Base_dDiag.C_Check_ErrC (dtb__87))
  | Base_dDiag.C_Check_OkC (dtb__88) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccHash dtb__88)) ensured)))
  | _ -> failwith "DT: impossible branch"
) else (match ((((v_stringValueOf path) key) value) line) with
  | Base_dDiag.C_Check_ErrC (dtb__89) -> (Base_dDiag.C_Check_ErrC (dtb__89))
  | Base_dDiag.C_Check_OkC (dtb__90) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc alias) (v_setAccIdentity dtb__90)) ensured)))
  | _ -> failwith "DT: impossible branch"
))))))))

# 364 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectTables = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : t_DepAcc B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match dtb__91 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__93; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__94; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__95; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__96 } -> (if (v_isDepTableSection dtb__93) then (match ((((((v_applyDepEntry mc0) (v_depAliasOfSection dtb__93)) dtb__94) dtb__95) dtb__96) mc2) with
  | Base_dDiag.C_Check_ErrC (dtb__97) -> (Base_dDiag.C_Check_ErrC (dtb__97))
  | Base_dDiag.C_Check_OkC (dtb__98) -> (((v_collectTables mc0) dtb__92) dtb__98)
  | _ -> failwith "DT: impossible branch"
) else (((v_collectTables mc0) dtb__92) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (mc2))
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectStrings = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (match dtb__99 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__101; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__102; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__103; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__104 } -> (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__101) (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil))) then (match dtb__103 with
  | Frontend_dToml.C_TomlValue_TStr (dtb__105) -> (((v_collectStrings mc0) dtb__100) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = dtb__104 } }, mc2)))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) dtb__104) (Base_dDiagnostics_dPkg.C_PkgErr_DependencyPathNotString (dtb__102))) dtb__102)
) else (((v_collectStrings mc0) dtb__100) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_pathSource = (fun (p : string) -> (C_DependencySource_DepPath ((if (p = "") then "" else (Base_dSource.v_normalizePath p)))))

# 389 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_buildDependency = (fun (path : string) (acc : t_DepAcc) -> (match (acc).f_DepAcc_depAccPath with
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> (match (acc).f_DepAcc_depAccGit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (acc).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb__108) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (acc).f_DepAcc_depAccAlias; f_Dependency_depSource = (v_pathSource dtb__106); f_Dependency_depHash = (acc).f_DepAcc_depAccHash; f_Dependency_depIdentity = (acc).f_DepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (acc).f_DepAcc_depAccGit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (match (acc).f_DepAcc_depAccRev with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_GitRevRequired ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> (match (acc).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (acc).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepGit (dtb__109, dtb__110)); f_Dependency_depHash = (acc).f_DepAcc_depAccHash; f_Dependency_depIdentity = (acc).f_DepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (acc).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb__112) -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (acc).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepUrl (dtb__112)); f_Dependency_depHash = (acc).f_DepAcc_depAccHash; f_Dependency_depIdentity = (acc).f_DepAcc_depAccIdentity }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) (acc).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing ((acc).f_DepAcc_depAccAlias))) (acc).f_DepAcc_depAccAlias)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_buildTables = (fun (mc0 : string) (mc1 : t_DepAcc B_dData_dList.t_List) (mc2 : t_Dependency B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (match ((v_buildDependency mc0) dtb__113) with
  | Base_dDiag.C_Check_ErrC (dtb__115) -> (Base_dDiag.C_Check_ErrC (dtb__115))
  | Base_dDiag.C_Check_OkC (dtb__116) -> (((v_buildTables mc0) dtb__114) (B_dData_dList.C_List__x58__x58_ (dtb__116, mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_collectDependencies = (fun (path : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((v_collectStrings path) entries) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__117) -> (Base_dDiag.C_Check_ErrC (dtb__117))
  | Base_dDiag.C_Check_OkC (dtb__118) -> (match (((v_collectTables path) entries) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__119) -> (Base_dDiag.C_Check_ErrC (dtb__119))
  | Base_dDiag.C_Check_OkC (dtb__120) -> (match (((v_buildTables path) dtb__120) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__121) -> (Base_dDiag.C_Check_ErrC (dtb__121))
  | Base_dDiag.C_Check_OkC (dtb__122) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (p : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> { f_Dependency_depAlias = (B_dData_dPair.v_firstOf p); f_Dependency_depSource = (v_pathSource (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf p))); f_Dependency_depHash = B_dData_dMaybe.C_Maybe_Nothing; f_Dependency_depIdentity = B_dData_dMaybe.C_Maybe_Nothing })) dtb__118)) dtb__122)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isHexChar = (fun (c : int) -> (if (if (v_isDigitChar c) then true else (if (c >= 65) then (c <= 70) else false)) then true else (if (c >= 97) then (c <= 102) else false)))

# 449 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_allHex = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (if (v_isHexChar dtb__123) then (v_allHex dtb__124) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validHashText = (fun (s : string) -> (if ((B_dData_dString.v_startsWith "sha256:") s) then (if ((String.length s) = 71) then (v_allHex (B_dData_dList.dtp_unpack (((B_dData_dString.v_substring 7) 64) s))) else false) else (if ((String.length s) = 64) then (v_allHex (B_dData_dList.dtp_unpack s)) else false)))

# 461 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkHashForm = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__125) -> (if (v_validHashText dtb__125) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_HashMalformed (dtb__125))) dtb__125))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkIdentityForm = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> (if (v_validHashText dtb__126) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMalformed (dtb__126))) dtb__126))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDependency = (fun (mc0 : string) (mc1 : t_Dependency) -> (match mc1 with
  | { f_Dependency_depAlias = dtb__127; f_Dependency_depSource = dtb__128; f_Dependency_depHash = dtb__129; f_Dependency_depIdentity = dtb__130 } -> (if (dtb__127 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_EmptyDependencyName) else (match ((v_checkIdentityForm mc0) dtb__130) with
  | Base_dDiag.C_Check_ErrC (dtb__131) -> (Base_dDiag.C_Check_ErrC (dtb__131))
  | Base_dDiag.C_Check_OkC (dtb__132) -> (match dtb__128 with
  | C_DependencySource_DepPath (dtb__133) -> (if (dtb__133 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_EmptyDependencyPath (dtb__127))) dtb__127) else (((v_checkHashForm mc0) dtb__127) dtb__129))
  | C_DependencySource_DepGit (dtb__134, dtb__135) -> (match dtb__129 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_MissingHash (dtb__127))) dtb__127)
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (if (dtb__134 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing (dtb__127))) dtb__127) else (if (dtb__135 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_GitRevRequired (dtb__127))) dtb__127) else (((v_checkHashForm mc0) dtb__127) dtb__129)))
  | _ -> failwith "DT: impossible branch"
)
  | C_DependencySource_DepUrl (dtb__137) -> (match dtb__129 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_MissingHash (dtb__127))) dtb__127)
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> (if (dtb__137 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing (dtb__127))) dtb__127) else (((v_checkHashForm mc0) dtb__127) dtb__129))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateDepsSeen = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : t_Dependency B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (if ((B_dData_dList.v_memName (v_depAliasOf dtb__139)) mc1) then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_DuplicateDependency ((v_depAliasOf dtb__139)))) (v_depAliasOf dtb__139)) else (match ((v_validateDependency mc0) dtb__139) with
  | Base_dDiag.C_Check_ErrC (dtb__141) -> (Base_dDiag.C_Check_ErrC (dtb__141))
  | Base_dDiag.C_Check_OkC (dtb__142) -> (((v_validateDepsSeen mc0) (B_dData_dList.C_List__x58__x58_ ((v_depAliasOf dtb__139), mc1))) dtb__140)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDependencies = (fun (path : string) (deps : t_Dependency B_dData_dList.t_List) -> (((v_validateDepsSeen path) B_dData_dList.C_List_Nil) deps))

# 504 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagFormat = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (if (if (if (if (dtb__143 = "short") then true else (dtb__143 = "human")) then true else (dtb__143 = "json")) then true else (dtb__143 = "sarif")) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagFormat (dtb__143))) dtb__143))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagMax = (fun (mc0 : string) (mc1 : int B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__144) -> (if (dtb__144 >= 1) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagMaxErrors ((string_of_int dtb__144)))) (string_of_int dtb__144)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_startsWithSection = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (dtb__145 = mc1)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_sectionPresent = (fun (mc0 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (match dtb__147 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb__149; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb__150; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb__151; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb__152 } -> (if ((v_startsWithSection dtb__149) mc1) then true else ((v_sectionPresent dtb__148) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_checkRootSections = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (if ((v_sectionPresent mc1) dtb__153) then (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_PackageSectionInWorkspaceRoot (dtb__153))) dtb__153) else (((v_checkRootSections mc0) mc1) dtb__154))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateRootShape = (fun (mc0 : string) (mc1 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (B_dData_dBool.v_not ((v_sectionPresent mc1) "workspace")) then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_MissingPackageName) else (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) mc3) B_dData_dList.C_List_Nil) then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_EmptyWorkspace) else (((v_checkRootSections mc0) mc1) (B_dData_dList.C_List__x58__x58_ ("package", (B_dData_dList.C_List__x58__x58_ ("export", (B_dData_dList.C_List__x58__x58_ ("layers", (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil)))))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 579 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validPackageChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> (if (if (if (v_isLowerAlphaChar dtb__156) then true else (v_isDigitChar dtb__156)) then true else (dtb__156 = 45)) then (v_validPackageChars dtb__157) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validPackageName = (fun (name : string) -> (v_validPackageChars (B_dData_dList.dtp_unpack name)))

# 598 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validModuleTail = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (if (if (if (if (v_isUpperAlphaChar dtb__158) then true else (v_isLowerAlphaChar dtb__158)) then true else (v_isDigitChar dtb__158)) then true else (dtb__158 = 95)) then (v_validModuleTail dtb__159) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleSegmentChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> (if (v_isUpperAlphaChar dtb__160) then (v_validModuleTail dtb__161) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleSegment = (fun (seg : string) -> (v_validModuleSegmentChars (B_dData_dList.dtp_unpack seg)))

# 587 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validModuleSegments = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (if (v_validModuleSegment dtb__162) then (v_validModuleSegments dtb__163) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleName = (fun (name : string) -> (v_validModuleSegments (Base_dSource.v_splitOnDot name)))

# 238 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateLayerTargets = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (if (v_validModuleName dtb__164) then ((v_validateLayerTargets mc0) dtb__165) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_LayerInvalidTarget (dtb__164))) dtb__164))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateLayers = (fun (mc0 : string) (mc1 : t_Layer B_dData_dList.t_List) (mc2 : t_Layer B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (if (v_validModuleName (dtb__166).f_Layer_layerName) then (match ((v_validateLayerTargets mc0) (dtb__166).f_Layer_layerUses) with
  | Base_dDiag.C_Check_ErrC (dtb__168) -> (Base_dDiag.C_Check_ErrC (dtb__168))
  | Base_dDiag.C_Check_OkC (dtb__169) -> (if ((v_layerHasCycle mc1) dtb__166) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) (dtb__166).f_Layer_layerLine) (Base_dDiagnostics_dPkg.C_PkgErr_LayerCycle ((dtb__166).f_Layer_layerName))) (dtb__166).f_Layer_layerName) else (((v_validateLayers mc0) mc1) dtb__167))
  | _ -> failwith "DT: impossible branch"
) else ((((Base_dDiagnostics_dPkg.v_pkgAt1 mc0) (dtb__166).f_Layer_layerLine) (Base_dDiagnostics_dPkg.C_PkgErr_LayerInvalidName ((dtb__166).f_Layer_layerName))) (dtb__166).f_Layer_layerName))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateName = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : string) (mc3 : string B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> (if (dtb__170 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc2) Base_dDiagnostics_dPkg.C_PkgErr_EmptyPackageName) else (if (v_validPackageName dtb__170) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc2) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidPackageName (dtb__170))) dtb__170)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if mc0 then ((B_dData_dList.v_length mc1) > 0) else false) then (Base_dDiag.C_Check_OkC (0)) else ((Base_dDiagnostics_dPkg.v_pkgPath0 mc2) Base_dDiagnostics_dPkg.C_PkgErr_MissingPackageName))
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateMembers = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (if (dtb__171 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 mc0) Base_dDiagnostics_dPkg.C_PkgErr_EmptyMember) else ((v_validateMembers mc0) dtb__172))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateModules = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (if (v_validModuleName dtb__173) then ((v_validateModules mc0) dtb__174) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidExportModule (dtb__173))) dtb__173))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 626 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateExports = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__175) -> ((v_validateModules mc0) dtb__175)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateManifest = (fun (mc0 : t_Manifest) -> (match mc0 with
  | { f_Manifest_manifestName = dtb__176; f_Manifest_manifestMembers = dtb__177; f_Manifest_manifestIsWorkspace = dtb__178; f_Manifest_manifestExports = dtb__179; f_Manifest_manifestImplicitPrelude = dtb__180; f_Manifest_manifestDependencies = dtb__181; f_Manifest_manifestPath = dtb__182; f_Manifest_manifestDiagFormat = dtb__183; f_Manifest_manifestDiagWarnings = dtb__184; f_Manifest_manifestDiagMaxErrors = dtb__185; f_Manifest_manifestDiagLang = dtb__186; f_Manifest_manifestDiagDenyWarnings = dtb__187; f_Manifest_manifestRegistryIndex = dtb__188; f_Manifest_manifestLayers = dtb__189 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_validateName dtb__178) dtb__177) dtb__182) dtb__176)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateMembers dtb__182) dtb__177)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateExports dtb__182) dtb__179)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateDependencies dtb__182) dtb__181)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) (((v_validateLayers dtb__182) dtb__189) dtb__189)) (fun _u -> ((B_dTrait_dApplicative.v_pure Base_dDiag.v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) { f_Manifest_manifestName = dtb__176; f_Manifest_manifestMembers = dtb__177; f_Manifest_manifestIsWorkspace = dtb__178; f_Manifest_manifestExports = dtb__179; f_Manifest_manifestImplicitPrelude = dtb__180; f_Manifest_manifestDependencies = dtb__181; f_Manifest_manifestPath = dtb__182; f_Manifest_manifestDiagFormat = dtb__183; f_Manifest_manifestDiagWarnings = dtb__184; f_Manifest_manifestDiagMaxErrors = dtb__185; f_Manifest_manifestDiagLang = dtb__186; f_Manifest_manifestDiagDenyWarnings = dtb__187; f_Manifest_manifestRegistryIndex = dtb__188; f_Manifest_manifestLayers = dtb__189 })))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 649 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_dirResult = (fun (dir : string) -> (if (dir = "") then "/" else dir))

# 645 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_dirFromRev = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__190, dtb__191) -> (if (dtb__190 = 47) then (v_dirResult (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb__191))) else (v_dirFromRev dtb__191))
  | B_dData_dList.C_List_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDir = (fun (path : string) -> (v_dirFromRev (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack path))))

# 653 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_resolveManifestPath = (fun (manifest : t_Manifest) (rel : string) -> ((Base_dSource.v_joinPath (v_manifestDir (manifest).f_Manifest_manifestPath)) rel))

# 657 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagLang = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> (if (if (dtb__192 = "en") then true else (dtb__192 = "zh")) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 mc0) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagLang (dtb__192))) dtb__192))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_buildManifest = (fun (path : string) (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_checkEntries path) entries)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) (((v_collectLayers path) entries) B_dData_dList.C_List_Nil)) (fun layers -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) "name") entries)) (fun name -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_boolField path) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) "implicit-prelude") entries)) (fun preludeField -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringListField path) (B_dData_dList.C_List__x58__x58_ ("workspace", B_dData_dList.C_List_Nil))) "members") entries)) (fun members -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_validateRootShape path) entries) name) (v_orEmptyList members))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringListField path) (B_dData_dList.C_List__x58__x58_ ("export", B_dData_dList.C_List_Nil))) "modules") entries)) (fun exports -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_collectDependencies path) entries)) (fun deps -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "format") entries)) (fun diagFmt -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_boolField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "warnings") entries)) (fun diagWarns -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_intField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "max-errors") entries)) (fun diagMax -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "lang") entries)) (fun diagLang -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_boolField path) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "deny-warnings") entries)) (fun diagDeny -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringField path) (B_dData_dList.C_List__x58__x58_ ("registry", B_dData_dList.C_List_Nil))) "index") entries)) (fun regIndex -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateDiagFormat path) diagFmt)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateDiagMax path) diagMax)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateDiagLang path) diagLang)) (fun _u -> ((B_dTrait_dApplicative.v_pure Base_dDiag.v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) { f_Manifest_manifestName = name; f_Manifest_manifestMembers = (v_orEmptyList members); f_Manifest_manifestIsWorkspace = ((v_sectionPresent entries) "workspace"); f_Manifest_manifestExports = exports; f_Manifest_manifestImplicitPrelude = (v_preludeEnabled preludeField); f_Manifest_manifestDependencies = deps; f_Manifest_manifestPath = path; f_Manifest_manifestDiagFormat = diagFmt; f_Manifest_manifestDiagWarnings = diagWarns; f_Manifest_manifestDiagMaxErrors = diagMax; f_Manifest_manifestDiagLang = diagLang; f_Manifest_manifestDiagDenyWarnings = diagDeny; f_Manifest_manifestRegistryIndex = regIndex; f_Manifest_manifestLayers = layers }))))))))))))))))))))))))))))))))))))

# 569 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_parseManifest = (fun (path : string) (contents : string) -> ((Base_dCommon.v_bind ((Frontend_dToml.v_parseTomlAt path) contents)) (fun (entries : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((v_buildManifest path) entries))))

# 38 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAlias = (fun (p : t_Dependency) -> (match p with
  | { f_Dependency_depAlias = dtb__193; f_Dependency_depSource = dtb__194; f_Dependency_depHash = dtb__195; f_Dependency_depIdentity = dtb__196 } -> dtb__193
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depSource = (fun (p : t_Dependency) -> (match p with
  | { f_Dependency_depAlias = dtb__197; f_Dependency_depSource = dtb__198; f_Dependency_depHash = dtb__199; f_Dependency_depIdentity = dtb__200 } -> dtb__198
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depHash = (fun (p : t_Dependency) -> (match p with
  | { f_Dependency_depAlias = dtb__201; f_Dependency_depSource = dtb__202; f_Dependency_depHash = dtb__203; f_Dependency_depIdentity = dtb__204 } -> dtb__203
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depIdentity = (fun (p : t_Dependency) -> (match p with
  | { f_Dependency_depAlias = dtb__205; f_Dependency_depSource = dtb__206; f_Dependency_depHash = dtb__207; f_Dependency_depIdentity = dtb__208 } -> dtb__208
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerName = (fun (p : t_Layer) -> (match p with
  | { f_Layer_layerName = dtb__209; f_Layer_layerUses = dtb__210; f_Layer_layerLine = dtb__211 } -> dtb__209
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerUses = (fun (p : t_Layer) -> (match p with
  | { f_Layer_layerName = dtb__212; f_Layer_layerUses = dtb__213; f_Layer_layerLine = dtb__214 } -> dtb__213
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerLine = (fun (p : t_Layer) -> (match p with
  | { f_Layer_layerName = dtb__215; f_Layer_layerUses = dtb__216; f_Layer_layerLine = dtb__217 } -> dtb__217
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestName = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__218; f_Manifest_manifestMembers = dtb__219; f_Manifest_manifestIsWorkspace = dtb__220; f_Manifest_manifestExports = dtb__221; f_Manifest_manifestImplicitPrelude = dtb__222; f_Manifest_manifestDependencies = dtb__223; f_Manifest_manifestPath = dtb__224; f_Manifest_manifestDiagFormat = dtb__225; f_Manifest_manifestDiagWarnings = dtb__226; f_Manifest_manifestDiagMaxErrors = dtb__227; f_Manifest_manifestDiagLang = dtb__228; f_Manifest_manifestDiagDenyWarnings = dtb__229; f_Manifest_manifestRegistryIndex = dtb__230; f_Manifest_manifestLayers = dtb__231 } -> dtb__218
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestMembers = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__232; f_Manifest_manifestMembers = dtb__233; f_Manifest_manifestIsWorkspace = dtb__234; f_Manifest_manifestExports = dtb__235; f_Manifest_manifestImplicitPrelude = dtb__236; f_Manifest_manifestDependencies = dtb__237; f_Manifest_manifestPath = dtb__238; f_Manifest_manifestDiagFormat = dtb__239; f_Manifest_manifestDiagWarnings = dtb__240; f_Manifest_manifestDiagMaxErrors = dtb__241; f_Manifest_manifestDiagLang = dtb__242; f_Manifest_manifestDiagDenyWarnings = dtb__243; f_Manifest_manifestRegistryIndex = dtb__244; f_Manifest_manifestLayers = dtb__245 } -> dtb__233
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestIsWorkspace = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__246; f_Manifest_manifestMembers = dtb__247; f_Manifest_manifestIsWorkspace = dtb__248; f_Manifest_manifestExports = dtb__249; f_Manifest_manifestImplicitPrelude = dtb__250; f_Manifest_manifestDependencies = dtb__251; f_Manifest_manifestPath = dtb__252; f_Manifest_manifestDiagFormat = dtb__253; f_Manifest_manifestDiagWarnings = dtb__254; f_Manifest_manifestDiagMaxErrors = dtb__255; f_Manifest_manifestDiagLang = dtb__256; f_Manifest_manifestDiagDenyWarnings = dtb__257; f_Manifest_manifestRegistryIndex = dtb__258; f_Manifest_manifestLayers = dtb__259 } -> dtb__248
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestExports = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__260; f_Manifest_manifestMembers = dtb__261; f_Manifest_manifestIsWorkspace = dtb__262; f_Manifest_manifestExports = dtb__263; f_Manifest_manifestImplicitPrelude = dtb__264; f_Manifest_manifestDependencies = dtb__265; f_Manifest_manifestPath = dtb__266; f_Manifest_manifestDiagFormat = dtb__267; f_Manifest_manifestDiagWarnings = dtb__268; f_Manifest_manifestDiagMaxErrors = dtb__269; f_Manifest_manifestDiagLang = dtb__270; f_Manifest_manifestDiagDenyWarnings = dtb__271; f_Manifest_manifestRegistryIndex = dtb__272; f_Manifest_manifestLayers = dtb__273 } -> dtb__263
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestImplicitPrelude = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__274; f_Manifest_manifestMembers = dtb__275; f_Manifest_manifestIsWorkspace = dtb__276; f_Manifest_manifestExports = dtb__277; f_Manifest_manifestImplicitPrelude = dtb__278; f_Manifest_manifestDependencies = dtb__279; f_Manifest_manifestPath = dtb__280; f_Manifest_manifestDiagFormat = dtb__281; f_Manifest_manifestDiagWarnings = dtb__282; f_Manifest_manifestDiagMaxErrors = dtb__283; f_Manifest_manifestDiagLang = dtb__284; f_Manifest_manifestDiagDenyWarnings = dtb__285; f_Manifest_manifestRegistryIndex = dtb__286; f_Manifest_manifestLayers = dtb__287 } -> dtb__278
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDependencies = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__288; f_Manifest_manifestMembers = dtb__289; f_Manifest_manifestIsWorkspace = dtb__290; f_Manifest_manifestExports = dtb__291; f_Manifest_manifestImplicitPrelude = dtb__292; f_Manifest_manifestDependencies = dtb__293; f_Manifest_manifestPath = dtb__294; f_Manifest_manifestDiagFormat = dtb__295; f_Manifest_manifestDiagWarnings = dtb__296; f_Manifest_manifestDiagMaxErrors = dtb__297; f_Manifest_manifestDiagLang = dtb__298; f_Manifest_manifestDiagDenyWarnings = dtb__299; f_Manifest_manifestRegistryIndex = dtb__300; f_Manifest_manifestLayers = dtb__301 } -> dtb__293
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestPath = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__302; f_Manifest_manifestMembers = dtb__303; f_Manifest_manifestIsWorkspace = dtb__304; f_Manifest_manifestExports = dtb__305; f_Manifest_manifestImplicitPrelude = dtb__306; f_Manifest_manifestDependencies = dtb__307; f_Manifest_manifestPath = dtb__308; f_Manifest_manifestDiagFormat = dtb__309; f_Manifest_manifestDiagWarnings = dtb__310; f_Manifest_manifestDiagMaxErrors = dtb__311; f_Manifest_manifestDiagLang = dtb__312; f_Manifest_manifestDiagDenyWarnings = dtb__313; f_Manifest_manifestRegistryIndex = dtb__314; f_Manifest_manifestLayers = dtb__315 } -> dtb__308
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagFormat = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__316; f_Manifest_manifestMembers = dtb__317; f_Manifest_manifestIsWorkspace = dtb__318; f_Manifest_manifestExports = dtb__319; f_Manifest_manifestImplicitPrelude = dtb__320; f_Manifest_manifestDependencies = dtb__321; f_Manifest_manifestPath = dtb__322; f_Manifest_manifestDiagFormat = dtb__323; f_Manifest_manifestDiagWarnings = dtb__324; f_Manifest_manifestDiagMaxErrors = dtb__325; f_Manifest_manifestDiagLang = dtb__326; f_Manifest_manifestDiagDenyWarnings = dtb__327; f_Manifest_manifestRegistryIndex = dtb__328; f_Manifest_manifestLayers = dtb__329 } -> dtb__323
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagWarnings = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__330; f_Manifest_manifestMembers = dtb__331; f_Manifest_manifestIsWorkspace = dtb__332; f_Manifest_manifestExports = dtb__333; f_Manifest_manifestImplicitPrelude = dtb__334; f_Manifest_manifestDependencies = dtb__335; f_Manifest_manifestPath = dtb__336; f_Manifest_manifestDiagFormat = dtb__337; f_Manifest_manifestDiagWarnings = dtb__338; f_Manifest_manifestDiagMaxErrors = dtb__339; f_Manifest_manifestDiagLang = dtb__340; f_Manifest_manifestDiagDenyWarnings = dtb__341; f_Manifest_manifestRegistryIndex = dtb__342; f_Manifest_manifestLayers = dtb__343 } -> dtb__338
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagMaxErrors = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__344; f_Manifest_manifestMembers = dtb__345; f_Manifest_manifestIsWorkspace = dtb__346; f_Manifest_manifestExports = dtb__347; f_Manifest_manifestImplicitPrelude = dtb__348; f_Manifest_manifestDependencies = dtb__349; f_Manifest_manifestPath = dtb__350; f_Manifest_manifestDiagFormat = dtb__351; f_Manifest_manifestDiagWarnings = dtb__352; f_Manifest_manifestDiagMaxErrors = dtb__353; f_Manifest_manifestDiagLang = dtb__354; f_Manifest_manifestDiagDenyWarnings = dtb__355; f_Manifest_manifestRegistryIndex = dtb__356; f_Manifest_manifestLayers = dtb__357 } -> dtb__353
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagLang = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__358; f_Manifest_manifestMembers = dtb__359; f_Manifest_manifestIsWorkspace = dtb__360; f_Manifest_manifestExports = dtb__361; f_Manifest_manifestImplicitPrelude = dtb__362; f_Manifest_manifestDependencies = dtb__363; f_Manifest_manifestPath = dtb__364; f_Manifest_manifestDiagFormat = dtb__365; f_Manifest_manifestDiagWarnings = dtb__366; f_Manifest_manifestDiagMaxErrors = dtb__367; f_Manifest_manifestDiagLang = dtb__368; f_Manifest_manifestDiagDenyWarnings = dtb__369; f_Manifest_manifestRegistryIndex = dtb__370; f_Manifest_manifestLayers = dtb__371 } -> dtb__368
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagDenyWarnings = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__372; f_Manifest_manifestMembers = dtb__373; f_Manifest_manifestIsWorkspace = dtb__374; f_Manifest_manifestExports = dtb__375; f_Manifest_manifestImplicitPrelude = dtb__376; f_Manifest_manifestDependencies = dtb__377; f_Manifest_manifestPath = dtb__378; f_Manifest_manifestDiagFormat = dtb__379; f_Manifest_manifestDiagWarnings = dtb__380; f_Manifest_manifestDiagMaxErrors = dtb__381; f_Manifest_manifestDiagLang = dtb__382; f_Manifest_manifestDiagDenyWarnings = dtb__383; f_Manifest_manifestRegistryIndex = dtb__384; f_Manifest_manifestLayers = dtb__385 } -> dtb__383
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestRegistryIndex = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__386; f_Manifest_manifestMembers = dtb__387; f_Manifest_manifestIsWorkspace = dtb__388; f_Manifest_manifestExports = dtb__389; f_Manifest_manifestImplicitPrelude = dtb__390; f_Manifest_manifestDependencies = dtb__391; f_Manifest_manifestPath = dtb__392; f_Manifest_manifestDiagFormat = dtb__393; f_Manifest_manifestDiagWarnings = dtb__394; f_Manifest_manifestDiagMaxErrors = dtb__395; f_Manifest_manifestDiagLang = dtb__396; f_Manifest_manifestDiagDenyWarnings = dtb__397; f_Manifest_manifestRegistryIndex = dtb__398; f_Manifest_manifestLayers = dtb__399 } -> dtb__398
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestLayers = (fun (p : t_Manifest) -> (match p with
  | { f_Manifest_manifestName = dtb__400; f_Manifest_manifestMembers = dtb__401; f_Manifest_manifestIsWorkspace = dtb__402; f_Manifest_manifestExports = dtb__403; f_Manifest_manifestImplicitPrelude = dtb__404; f_Manifest_manifestDependencies = dtb__405; f_Manifest_manifestPath = dtb__406; f_Manifest_manifestDiagFormat = dtb__407; f_Manifest_manifestDiagWarnings = dtb__408; f_Manifest_manifestDiagMaxErrors = dtb__409; f_Manifest_manifestDiagLang = dtb__410; f_Manifest_manifestDiagDenyWarnings = dtb__411; f_Manifest_manifestRegistryIndex = dtb__412; f_Manifest_manifestLayers = dtb__413 } -> dtb__413
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccAlias = (fun (p : t_DepAcc) -> (match p with
  | { f_DepAcc_depAccAlias = dtb__414; f_DepAcc_depAccPath = dtb__415; f_DepAcc_depAccGit = dtb__416; f_DepAcc_depAccRev = dtb__417; f_DepAcc_depAccUrl = dtb__418; f_DepAcc_depAccHash = dtb__419; f_DepAcc_depAccIdentity = dtb__420; f_DepAcc_depAccTableLine = dtb__421 } -> dtb__414
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccPath = (fun (p : t_DepAcc) -> (match p with
  | { f_DepAcc_depAccAlias = dtb__422; f_DepAcc_depAccPath = dtb__423; f_DepAcc_depAccGit = dtb__424; f_DepAcc_depAccRev = dtb__425; f_DepAcc_depAccUrl = dtb__426; f_DepAcc_depAccHash = dtb__427; f_DepAcc_depAccIdentity = dtb__428; f_DepAcc_depAccTableLine = dtb__429 } -> dtb__423
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccGit = (fun (p : t_DepAcc) -> (match p with
  | { f_DepAcc_depAccAlias = dtb__430; f_DepAcc_depAccPath = dtb__431; f_DepAcc_depAccGit = dtb__432; f_DepAcc_depAccRev = dtb__433; f_DepAcc_depAccUrl = dtb__434; f_DepAcc_depAccHash = dtb__435; f_DepAcc_depAccIdentity = dtb__436; f_DepAcc_depAccTableLine = dtb__437 } -> dtb__432
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccRev = (fun (p : t_DepAcc) -> (match p with
  | { f_DepAcc_depAccAlias = dtb__438; f_DepAcc_depAccPath = dtb__439; f_DepAcc_depAccGit = dtb__440; f_DepAcc_depAccRev = dtb__441; f_DepAcc_depAccUrl = dtb__442; f_DepAcc_depAccHash = dtb__443; f_DepAcc_depAccIdentity = dtb__444; f_DepAcc_depAccTableLine = dtb__445 } -> dtb__441
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccUrl = (fun (p : t_DepAcc) -> (match p with
  | { f_DepAcc_depAccAlias = dtb__446; f_DepAcc_depAccPath = dtb__447; f_DepAcc_depAccGit = dtb__448; f_DepAcc_depAccRev = dtb__449; f_DepAcc_depAccUrl = dtb__450; f_DepAcc_depAccHash = dtb__451; f_DepAcc_depAccIdentity = dtb__452; f_DepAcc_depAccTableLine = dtb__453 } -> dtb__450
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccHash = (fun (p : t_DepAcc) -> (match p with
  | { f_DepAcc_depAccAlias = dtb__454; f_DepAcc_depAccPath = dtb__455; f_DepAcc_depAccGit = dtb__456; f_DepAcc_depAccRev = dtb__457; f_DepAcc_depAccUrl = dtb__458; f_DepAcc_depAccHash = dtb__459; f_DepAcc_depAccIdentity = dtb__460; f_DepAcc_depAccTableLine = dtb__461 } -> dtb__459
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccIdentity = (fun (p : t_DepAcc) -> (match p with
  | { f_DepAcc_depAccAlias = dtb__462; f_DepAcc_depAccPath = dtb__463; f_DepAcc_depAccGit = dtb__464; f_DepAcc_depAccRev = dtb__465; f_DepAcc_depAccUrl = dtb__466; f_DepAcc_depAccHash = dtb__467; f_DepAcc_depAccIdentity = dtb__468; f_DepAcc_depAccTableLine = dtb__469 } -> dtb__468
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccTableLine = (fun (p : t_DepAcc) -> (match p with
  | { f_DepAcc_depAccAlias = dtb__470; f_DepAcc_depAccPath = dtb__471; f_DepAcc_depAccGit = dtb__472; f_DepAcc_depAccRev = dtb__473; f_DepAcc_depAccUrl = dtb__474; f_DepAcc_depAccHash = dtb__475; f_DepAcc_depAccIdentity = dtb__476; f_DepAcc_depAccTableLine = dtb__477 } -> dtb__477
  | _ -> failwith "DT: impossible branch"
))
