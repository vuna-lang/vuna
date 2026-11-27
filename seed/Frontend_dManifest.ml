open Vuna_runtime
type t_DependencySource = C_DependencySource_DepPath of (string) | C_DependencySource_DepGit of (string) * (string) | C_DependencySource_DepUrl of (string)
and t_Dependency = { f_Dependency_depAlias : string; f_Dependency_depSource : t_DependencySource; f_Dependency_depHash : string B_dData_dMaybe.t_Maybe; f_Dependency_depIdentity : string B_dData_dMaybe.t_Maybe }
and t_Layer = { f_Layer_layerName : string; f_Layer_layerUses : string B_dData_dList.t_List; f_Layer_layerLine : int }
and t_Manifest = { f_Manifest_manifestName : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestMembers : string B_dData_dList.t_List; f_Manifest_manifestIsWorkspace : bool; f_Manifest_manifestExports : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe; f_Manifest_manifestImplicitPrelude : bool; f_Manifest_manifestDependencies : t_Dependency B_dData_dList.t_List; f_Manifest_manifestPath : string; f_Manifest_manifestDiagFormat : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagWarnings : bool B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagMaxErrors : int B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagLang : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestDiagDenyWarnings : bool B_dData_dMaybe.t_Maybe; f_Manifest_manifestRegistryIndex : string B_dData_dMaybe.t_Maybe; f_Manifest_manifestLayers : t_Layer B_dData_dList.t_List }
and t_DepAcc = { f_DepAcc_depAccAlias : string; f_DepAcc_depAccPath : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccGit : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccRev : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccUrl : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccHash : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccIdentity : string B_dData_dMaybe.t_Maybe; f_DepAcc_depAccTableLine : int }

# 44 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAliasOf = (fun (dtb_u_u1 : t_Dependency) -> (match dtb_u_u1 with
  | { f_Dependency_depAlias = dtb_u_u2; f_Dependency_depSource = dtb_u_u3; f_Dependency_depHash = dtb_u_u4; f_Dependency_depIdentity = dtb_u_u5 } -> dtb_u_u2
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depSourceOf = (fun (dtb_u_u6 : t_Dependency) -> (match dtb_u_u6 with
  | { f_Dependency_depAlias = dtb_u_u7; f_Dependency_depSource = dtb_u_u8; f_Dependency_depHash = dtb_u_u9; f_Dependency_depIdentity = dtb_u_u10 } -> dtb_u_u8
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depHashOf = (fun (dtb_u_u11 : t_Dependency) -> (match dtb_u_u11 with
  | { f_Dependency_depAlias = dtb_u_u12; f_Dependency_depSource = dtb_u_u13; f_Dependency_depHash = dtb_u_u14; f_Dependency_depIdentity = dtb_u_u15 } -> dtb_u_u14
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depIdentityOf = (fun (dtb_u_u16 : t_Dependency) -> (match dtb_u_u16 with
  | { f_Dependency_depAlias = dtb_u_u17; f_Dependency_depSource = dtb_u_u18; f_Dependency_depHash = dtb_u_u19; f_Dependency_depIdentity = dtb_u_u20 } -> dtb_u_u20
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_emptyDepAcc = (fun (dtb_u_u21 : string) (dtb_u_u22 : int) -> { f_DepAcc_depAccAlias = dtb_u_u21; f_DepAcc_depAccPath = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccGit = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccRev = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccUrl = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccHash = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccIdentity = B_dData_dMaybe.C_Maybe_Nothing; f_DepAcc_depAccTableLine = dtb_u_u22 })

# 97 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDigitChar = (fun (dtb_u_u23 : int) -> (if (dtb_u_u23 >= 48) then (dtb_u_u23 <= 57) else false))

# 100 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isUpperAlphaChar = (fun (dtb_u_u24 : int) -> (if (dtb_u_u24 >= 65) then (dtb_u_u24 <= 90) else false))

# 103 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLowerAlphaChar = (fun (dtb_u_u25 : int) -> (if (dtb_u_u25 >= 97) then (dtb_u_u25 <= 122) else false))

# 106 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_atLine = (fun (dtb_u_u26 : string) (dtb_u_u27 : int) (dtb_u_u28 : string) -> (if (dtb_u_u26 = "") then (String.concat "" ["line "; (string_of_int dtb_u_u27); ": "; dtb_u_u28]) else (String.concat "" [dtb_u_u26; ":"; (string_of_int dtb_u_u27); ": "; dtb_u_u28])))

# 109 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestErr = (fun (dtb_u_u29 : string) (dtb_u_u30 : string) -> (if (dtb_u_u29 = "") then dtb_u_u30 else (String.concat "" [dtb_u_u29; ": "; dtb_u_u30])))

# 112 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_sameSection = (fun dtb_u_u32 dtb_u_u33 dtb_u_u34 -> (match dtb_u_u33 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u35, dtb_u_u36) -> (match dtb_u_u34 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u37, dtb_u_u38) -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u32) dtb_u_u35) dtb_u_u37) then (((v_sameSection dtb_u_u32) dtb_u_u36) dtb_u_u38) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u34 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_fieldLine = (fun (dtb_u_u39 : string) (dtb_u_u40 : string B_dData_dList.t_List) (dtb_u_u41 : string) (dtb_u_u42 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((Frontend_dToml.v_lookupEntryLine dtb_u_u40) dtb_u_u41) dtb_u_u42) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u43) -> dtb_u_u43
  | B_dData_dMaybe.C_Maybe_Nothing -> 1
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_fieldLoc = (fun (dtb_u_u44 : string) (dtb_u_u45 : string B_dData_dList.t_List) (dtb_u_u46 : string) (dtb_u_u47 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((Frontend_dToml.v_lookupEntryLine dtb_u_u45) dtb_u_u46) dtb_u_u47) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u48) -> (if (dtb_u_u44 = "") then (String.concat "" ["line "; (string_of_int dtb_u_u48); ": "]) else (String.concat "" [dtb_u_u44; ":"; (string_of_int dtb_u_u48); ": "]))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb_u_u44 = "") then "" else (dtb_u_u44 ^ ": "))
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringField = (fun (dtb_u_u49 : string) (dtb_u_u50 : string B_dData_dList.t_List) (dtb_u_u51 : string) (dtb_u_u52 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (let dtb_u_u53 = (((Frontend_dToml.v_lookupEntry dtb_u_u50) dtb_u_u51) dtb_u_u52) in (match dtb_u_u53 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u54) -> (match dtb_u_u54 with
  | Frontend_dToml.C_TomlValue_TStr (dtb_u_u55) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u55))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u49) ((((v_fieldLine dtb_u_u49) dtb_u_u50) dtb_u_u51) dtb_u_u52)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedString (dtb_u_u51))) dtb_u_u51)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 136 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringListField = (fun (dtb_u_u56 : string) (dtb_u_u57 : string B_dData_dList.t_List) (dtb_u_u58 : string) (dtb_u_u59 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (let dtb_u_u60 = (((Frontend_dToml.v_lookupEntry dtb_u_u57) dtb_u_u58) dtb_u_u59) in (match dtb_u_u60 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u61) -> (match dtb_u_u61 with
  | Frontend_dToml.C_TomlValue_TArray (dtb_u_u62) -> (match (Frontend_dToml.v_arrayStrings dtb_u_u62) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u56) ((((v_fieldLine dtb_u_u56) dtb_u_u57) dtb_u_u58) dtb_u_u59)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb_u_u58))) dtb_u_u58)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u63) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u63))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u56) ((((v_fieldLine dtb_u_u56) dtb_u_u57) dtb_u_u58) dtb_u_u59)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb_u_u58))) dtb_u_u58)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 147 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_intField = (fun (dtb_u_u64 : string) (dtb_u_u65 : string B_dData_dList.t_List) (dtb_u_u66 : string) (dtb_u_u67 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (let dtb_u_u68 = (((Frontend_dToml.v_lookupEntry dtb_u_u65) dtb_u_u66) dtb_u_u67) in (match dtb_u_u68 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u69) -> (match dtb_u_u69 with
  | Frontend_dToml.C_TomlValue_TInt (dtb_u_u70) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u70))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u64) ((((v_fieldLine dtb_u_u64) dtb_u_u65) dtb_u_u66) dtb_u_u67)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedInt (dtb_u_u66))) dtb_u_u66)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 154 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_boolField = (fun (dtb_u_u71 : string) (dtb_u_u72 : string B_dData_dList.t_List) (dtb_u_u73 : string) (dtb_u_u74 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (let dtb_u_u75 = (((Frontend_dToml.v_lookupEntry dtb_u_u72) dtb_u_u73) dtb_u_u74) in (match dtb_u_u75 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u76) -> (match dtb_u_u76 with
  | Frontend_dToml.C_TomlValue_TBool (dtb_u_u77) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u77))))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u71) ((((v_fieldLine dtb_u_u71) dtb_u_u72) dtb_u_u73) dtb_u_u74)) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedBool (dtb_u_u73))) dtb_u_u73)
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)))

# 161 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_orEmptyList = (fun dtb_u_u79 -> (match dtb_u_u79 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u80) -> dtb_u_u80
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_preludeEnabled = (fun (dtb_u_u81 : bool B_dData_dMaybe.t_Maybe) -> (match dtb_u_u81 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u82) -> dtb_u_u82
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLayersSection = (fun (dtb_u_u83 : string B_dData_dList.t_List) -> (match dtb_u_u83 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u84, dtb_u_u85) -> (if (dtb_u_u84 = "layers") then (match dtb_u_u85 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> true
  | _ -> false
) else false)
  | _ -> false
))

# 177 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerSeen = (fun (dtb_u_u88 : string) (dtb_u_u89 : string B_dData_dList.t_List) -> (match dtb_u_u89 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u90, dtb_u_u91) -> (if (dtb_u_u88 = dtb_u_u90) then true else ((v_layerSeen dtb_u_u88) dtb_u_u91))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectLayers = (fun (dtb_u_u92 : string) (dtb_u_u93 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (dtb_u_u94 : string B_dData_dList.t_List) -> (match dtb_u_u93 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (match dtb_u_u95 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb_u_u97; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb_u_u98; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb_u_u99; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb_u_u100 } -> (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u97) (B_dData_dList.C_List__x58__x58_ ("layers", B_dData_dList.C_List_Nil))) then (if ((v_layerSeen dtb_u_u98) dtb_u_u94) then (((v_collectLayers dtb_u_u92) dtb_u_u96) dtb_u_u94) else (match dtb_u_u99 with
  | Frontend_dToml.C_TomlValue_TArray (dtb_u_u101) -> (match (Frontend_dToml.v_arrayStrings dtb_u_u101) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u92) dtb_u_u100) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb_u_u98))) dtb_u_u98)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u102) -> ((Base_dCommon.v_bind (((v_collectLayers dtb_u_u92) dtb_u_u96) (B_dData_dList.C_List__x58__x58_ (dtb_u_u98, dtb_u_u94)))) (fun (dtb_u_u103 : t_Layer B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ f_Layer_layerName = dtb_u_u98; f_Layer_layerUses = dtb_u_u102; f_Layer_layerLine = dtb_u_u100 }, dtb_u_u103))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u92) dtb_u_u100) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb_u_u98))) dtb_u_u98)
)) else (((v_collectLayers dtb_u_u92) dtb_u_u96) dtb_u_u94))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerUsesOf = (fun (dtb_u_u104 : t_Layer B_dData_dList.t_List) (dtb_u_u105 : string) -> (match dtb_u_u104 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u106, dtb_u_u107) -> (if ((dtb_u_u106).f_Layer_layerName = dtb_u_u105) then (dtb_u_u106).f_Layer_layerUses else ((v_layerUsesOf dtb_u_u107) dtb_u_u105))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_reachesFrom = (fun (dtb_u_u108 : int) (dtb_u_u109 : t_Layer B_dData_dList.t_List) (dtb_u_u110 : string B_dContainer_dQueue.t_Queue) (dtb_u_u111 : string B_dData_dList.t_List) (dtb_u_u112 : string) -> (if (dtb_u_u108 <= 0) then false else (let dtb_u_u113 = (B_dContainer_dQueue.v_pop dtb_u_u110) in (match dtb_u_u113 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u114) -> (match dtb_u_u114 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u115; B_dData_dPair.f_Pair_second = dtb_u_u116 } -> (if (dtb_u_u115 = dtb_u_u112) then true else (if ((v_layerSeen dtb_u_u115) dtb_u_u111) then (((((v_reachesFrom (dtb_u_u108 - 1)) dtb_u_u109) dtb_u_u116) dtb_u_u111) dtb_u_u112) else (((((v_reachesFrom (dtb_u_u108 - 1)) dtb_u_u109) ((B_dContainer_dQueue.v_pushAll ((v_layerUsesOf dtb_u_u109) dtb_u_u115)) dtb_u_u116)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u115, dtb_u_u111))) dtb_u_u112)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))))

# 215 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_layerUsesTotal = (fun (dtb_u_u117 : t_Layer B_dData_dList.t_List) -> (match dtb_u_u117 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u118, dtb_u_u119) -> ((B_dData_dList.v_length (dtb_u_u118).f_Layer_layerUses) + (v_layerUsesTotal dtb_u_u119))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerVisitBound = (fun (dtb_u_u120 : t_Layer B_dData_dList.t_List) -> (((v_layerUsesTotal dtb_u_u120) + (B_dData_dList.v_length dtb_u_u120)) + 1))

# 219 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerHasCycle = (fun (dtb_u_u121 : t_Layer B_dData_dList.t_List) (dtb_u_u122 : t_Layer) -> (((((v_reachesFrom (v_layerVisitBound dtb_u_u121)) dtb_u_u121) (B_dContainer_dQueue.v_fromList ((v_layerUsesOf dtb_u_u121) (dtb_u_u122).f_Layer_layerName))) B_dData_dList.C_List_Nil) (dtb_u_u122).f_Layer_layerName))

# 247 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_orFalse = (fun (dtb_u_u123 : bool B_dData_dMaybe.t_Maybe) -> (match dtb_u_u123 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u124) -> dtb_u_u124
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDepTableSection = (fun (dtb_u_u125 : string B_dData_dList.t_List) -> (match dtb_u_u125 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u126, dtb_u_u127) -> (match dtb_u_u127 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u128, dtb_u_u129) -> (match dtb_u_u129 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u126 = "dependencies")
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 258 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isLintSection = (fun (dtb_u_u130 : string B_dData_dList.t_List) -> (match dtb_u_u130 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u131, dtb_u_u132) -> (if (dtb_u_u131 = "lint") then true else false)
  | _ -> false
))

# 262 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAliasOfSection = (fun (dtb_u_u133 : string B_dData_dList.t_List) -> (match dtb_u_u133 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u134, dtb_u_u135) -> (match dtb_u_u135 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u136, dtb_u_u137) -> (match dtb_u_u137 with
  | B_dData_dList.C_List_Nil -> dtb_u_u136
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 266 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isDepSourceKey = (fun (dtb_u_u138 : string) -> (if (if (if (if (if (dtb_u_u138 = "path") then true else (dtb_u_u138 = "git")) then true else (dtb_u_u138 = "rev")) then true else (dtb_u_u138 = "url")) then true else (dtb_u_u138 = "hash")) then true else (dtb_u_u138 = "identity")))

# 272 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkOneEntry = (fun (dtb_u_u139 : string) (dtb_u_u140 : Frontend_dToml.t_TomlEntry) -> (match dtb_u_u140 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb_u_u141; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb_u_u142; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb_u_u143; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb_u_u144 } -> (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u141) B_dData_dList.C_List_Nil) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_UnexpectedTopLevelKey (dtb_u_u142))) dtb_u_u142) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u141) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) then (if (if (dtb_u_u142 = "name") then true else (dtb_u_u142 = "implicit-prelude")) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb_u_u142, "package"))) dtb_u_u142) "package")) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u141) (B_dData_dList.C_List__x58__x58_ ("workspace", B_dData_dList.C_List_Nil))) then (if (dtb_u_u142 = "members") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb_u_u142, "workspace"))) dtb_u_u142) "workspace")) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u141) (B_dData_dList.C_List__x58__x58_ ("export", B_dData_dList.C_List_Nil))) then (if (dtb_u_u142 = "modules") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb_u_u142, "export"))) dtb_u_u142) "export")) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u141) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) then (if (if (if (if (if (dtb_u_u142 = "format") then true else (dtb_u_u142 = "warnings")) then true else (dtb_u_u142 = "max-errors")) then true else (dtb_u_u142 = "lang")) then true else (dtb_u_u142 = "deny-warnings")) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb_u_u142, "diagnostics"))) dtb_u_u142) "diagnostics")) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u141) (B_dData_dList.C_List__x58__x58_ ("layers", B_dData_dList.C_List_Nil))) then (match dtb_u_u143 with
  | Frontend_dToml.C_TomlValue_TArray (dtb_u_u145) -> (Base_dDiag.C_Check_OkC (0))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedStringArray (dtb_u_u142))) dtb_u_u142)
) else (if (v_isLayersSection dtb_u_u141) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_LayerKeyMustBeQuoted ((Base_dSource.v_joinDots ((B_dData_dList.v_append dtb_u_u141) (B_dData_dList.C_List__x58__x58_ (dtb_u_u142, B_dData_dList.C_List_Nil))))))) (Base_dSource.v_joinDots ((B_dData_dList.v_append dtb_u_u141) (B_dData_dList.C_List__x58__x58_ (dtb_u_u142, B_dData_dList.C_List_Nil))))) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u141) (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil))) then (Base_dDiag.C_Check_OkC (0)) else (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u141) (B_dData_dList.C_List__x58__x58_ ("registry", B_dData_dList.C_List_Nil))) then (if (dtb_u_u142 = "index") then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownKey (dtb_u_u142, "registry"))) dtb_u_u142) "registry")) else (if (v_isDepTableSection dtb_u_u141) then (if (v_isDepSourceKey dtb_u_u142) then (Base_dDiag.C_Check_OkC (0)) else (((((Base_dDiagnostics_dPkg.v_pkgAt2 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownSourceKey (dtb_u_u142, (v_depAliasOfSection dtb_u_u141)))) dtb_u_u142) (v_depAliasOfSection dtb_u_u141))) else (if (v_isLintSection dtb_u_u141) then (Base_dDiag.C_Check_OkC (0)) else ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u139) dtb_u_u144) (Base_dDiagnostics_dPkg.C_PkgErr_UnknownSection ((Base_dSource.v_joinDots dtb_u_u141)))) (Base_dSource.v_joinDots dtb_u_u141)))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_checkEntries = (fun (dtb_u_u146 : string) (dtb_u_u147 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match dtb_u_u147 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u148, dtb_u_u149) -> (match ((v_checkOneEntry dtb_u_u146) dtb_u_u148) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u150) -> (Base_dDiag.C_Check_ErrC (dtb_u_u150))
  | Base_dDiag.C_Check_OkC (dtb_u_u151) -> ((v_checkEntries dtb_u_u146) dtb_u_u149)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_hasAcc = (fun (dtb_u_u152 : string) (dtb_u_u153 : t_DepAcc B_dData_dList.t_List) -> (match dtb_u_u153 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u154, dtb_u_u155) -> (if ((dtb_u_u154).f_DepAcc_depAccAlias = dtb_u_u152) then true else ((v_hasAcc dtb_u_u152) dtb_u_u155))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_ensureAcc = (fun (dtb_u_u156 : string) (dtb_u_u157 : int) (dtb_u_u158 : t_DepAcc B_dData_dList.t_List) -> (if ((v_hasAcc dtb_u_u156) dtb_u_u158) then dtb_u_u158 else ((B_dData_dList.v_append dtb_u_u158) (B_dData_dList.C_List__x58__x58_ (((v_emptyDepAcc dtb_u_u156) dtb_u_u157), B_dData_dList.C_List_Nil)))))

# 306 "Vuna/Compiler/Frontend/Manifest.vuna"
let[@tail_mod_cons] rec v_mapAcc = (fun (dtb_u_u159 : string) (dtb_u_u160 : (t_DepAcc) -> t_DepAcc) (dtb_u_u161 : t_DepAcc B_dData_dList.t_List) -> (match dtb_u_u161 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u162, dtb_u_u163) -> (if ((dtb_u_u162).f_DepAcc_depAccAlias = dtb_u_u159) then (B_dData_dList.C_List__x58__x58_ ((dtb_u_u160 dtb_u_u162), dtb_u_u163)) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u162, (((v_mapAcc dtb_u_u159) dtb_u_u160) dtb_u_u163))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccPath = (fun (dtb_u_u164 : string) (dtb_u_u165 : t_DepAcc) -> { dtb_u_u165 with f_DepAcc_depAccPath = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u164)) })

# 314 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccGit = (fun (dtb_u_u166 : string) (dtb_u_u167 : t_DepAcc) -> { dtb_u_u167 with f_DepAcc_depAccGit = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u166)) })

# 317 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccRev = (fun (dtb_u_u168 : string) (dtb_u_u169 : t_DepAcc) -> { dtb_u_u169 with f_DepAcc_depAccRev = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u168)) })

# 320 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccUrl = (fun (dtb_u_u170 : string) (dtb_u_u171 : t_DepAcc) -> { dtb_u_u171 with f_DepAcc_depAccUrl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u170)) })

# 323 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccHash = (fun (dtb_u_u172 : string) (dtb_u_u173 : t_DepAcc) -> { dtb_u_u173 with f_DepAcc_depAccHash = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u172)) })

# 326 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_setAccIdentity = (fun (dtb_u_u174 : string) (dtb_u_u175 : t_DepAcc) -> { dtb_u_u175 with f_DepAcc_depAccIdentity = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u174)) })

# 329 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_stringValueOf = (fun (dtb_u_u176 : string) (dtb_u_u177 : string) (dtb_u_u178 : Frontend_dToml.t_TomlValue) (dtb_u_u179 : int) -> (match dtb_u_u178 with
  | Frontend_dToml.C_TomlValue_TStr (dtb_u_u180) -> (Base_dDiag.C_Check_OkC (dtb_u_u180))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u176) dtb_u_u179) (Base_dDiagnostics_dPkg.C_PkgErr_ExpectedString (dtb_u_u177))) dtb_u_u177)
))

# 334 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_applyDepEntry = (fun (dtb_u_u181 : string) (dtb_u_u182 : string) (dtb_u_u183 : string) (dtb_u_u184 : Frontend_dToml.t_TomlValue) (dtb_u_u185 : int) (dtb_u_u186 : t_DepAcc B_dData_dList.t_List) -> (let dtb_u_u187 = (((v_ensureAcc dtb_u_u182) dtb_u_u185) dtb_u_u186) in (if (dtb_u_u183 = "path") then (match ((((v_stringValueOf dtb_u_u181) dtb_u_u183) dtb_u_u184) dtb_u_u185) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u188) -> (Base_dDiag.C_Check_ErrC (dtb_u_u188))
  | Base_dDiag.C_Check_OkC (dtb_u_u189) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc dtb_u_u182) (v_setAccPath dtb_u_u189)) dtb_u_u187)))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u183 = "git") then (match ((((v_stringValueOf dtb_u_u181) dtb_u_u183) dtb_u_u184) dtb_u_u185) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u190) -> (Base_dDiag.C_Check_ErrC (dtb_u_u190))
  | Base_dDiag.C_Check_OkC (dtb_u_u191) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc dtb_u_u182) (v_setAccGit dtb_u_u191)) dtb_u_u187)))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u183 = "rev") then (match ((((v_stringValueOf dtb_u_u181) dtb_u_u183) dtb_u_u184) dtb_u_u185) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u192) -> (Base_dDiag.C_Check_ErrC (dtb_u_u192))
  | Base_dDiag.C_Check_OkC (dtb_u_u193) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc dtb_u_u182) (v_setAccRev dtb_u_u193)) dtb_u_u187)))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u183 = "url") then (match ((((v_stringValueOf dtb_u_u181) dtb_u_u183) dtb_u_u184) dtb_u_u185) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u194) -> (Base_dDiag.C_Check_ErrC (dtb_u_u194))
  | Base_dDiag.C_Check_OkC (dtb_u_u195) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc dtb_u_u182) (v_setAccUrl dtb_u_u195)) dtb_u_u187)))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u183 = "hash") then (match ((((v_stringValueOf dtb_u_u181) dtb_u_u183) dtb_u_u184) dtb_u_u185) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u196) -> (Base_dDiag.C_Check_ErrC (dtb_u_u196))
  | Base_dDiag.C_Check_OkC (dtb_u_u197) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc dtb_u_u182) (v_setAccHash dtb_u_u197)) dtb_u_u187)))
  | _ -> failwith "DT: impossible branch"
) else (match ((((v_stringValueOf dtb_u_u181) dtb_u_u183) dtb_u_u184) dtb_u_u185) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u198) -> (Base_dDiag.C_Check_ErrC (dtb_u_u198))
  | Base_dDiag.C_Check_OkC (dtb_u_u199) -> (Base_dDiag.C_Check_OkC ((((v_mapAcc dtb_u_u182) (v_setAccIdentity dtb_u_u199)) dtb_u_u187)))
  | _ -> failwith "DT: impossible branch"
))))))))

# 364 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectTables = (fun (dtb_u_u200 : string) (dtb_u_u201 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (dtb_u_u202 : t_DepAcc B_dData_dList.t_List) -> (match dtb_u_u201 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u203, dtb_u_u204) -> (match dtb_u_u203 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb_u_u205; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb_u_u206; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb_u_u207; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb_u_u208 } -> (if (v_isDepTableSection dtb_u_u205) then (match ((((((v_applyDepEntry dtb_u_u200) (v_depAliasOfSection dtb_u_u205)) dtb_u_u206) dtb_u_u207) dtb_u_u208) dtb_u_u202) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u209) -> (Base_dDiag.C_Check_ErrC (dtb_u_u209))
  | Base_dDiag.C_Check_OkC (dtb_u_u210) -> (((v_collectTables dtb_u_u200) dtb_u_u204) dtb_u_u210)
  | _ -> failwith "DT: impossible branch"
) else (((v_collectTables dtb_u_u200) dtb_u_u204) dtb_u_u202))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u202))
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_collectStrings = (fun (dtb_u_u211 : string) (dtb_u_u212 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (dtb_u_u213 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u212 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u214, dtb_u_u215) -> (match dtb_u_u214 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb_u_u216; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb_u_u217; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb_u_u218; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb_u_u219 } -> (if (((v_sameSection B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u216) (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil))) then (match dtb_u_u218 with
  | Frontend_dToml.C_TomlValue_TStr (dtb_u_u220) -> (((v_collectStrings dtb_u_u211) dtb_u_u215) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u217; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u220; B_dData_dPair.f_Pair_second = dtb_u_u219 } }, dtb_u_u213)))
  | _ -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u211) dtb_u_u219) (Base_dDiagnostics_dPkg.C_PkgErr_DependencyPathNotString (dtb_u_u217))) dtb_u_u217)
) else (((v_collectStrings dtb_u_u211) dtb_u_u215) dtb_u_u213))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u213)))
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_pathSource = (fun (dtb_u_u221 : string) -> (C_DependencySource_DepPath ((if (dtb_u_u221 = "") then "" else (Base_dSource.v_normalizePath dtb_u_u221)))))

# 389 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_buildDependency = (fun (dtb_u_u222 : string) (dtb_u_u223 : t_DepAcc) -> (match (dtb_u_u223).f_DepAcc_depAccPath with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u224) -> (match (dtb_u_u223).f_DepAcc_depAccGit with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u225) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u222) (dtb_u_u223).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((dtb_u_u223).f_DepAcc_depAccAlias))) (dtb_u_u223).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (dtb_u_u223).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u226) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u222) (dtb_u_u223).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((dtb_u_u223).f_DepAcc_depAccAlias))) (dtb_u_u223).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (dtb_u_u223).f_DepAcc_depAccAlias; f_Dependency_depSource = (v_pathSource dtb_u_u224); f_Dependency_depHash = (dtb_u_u223).f_DepAcc_depAccHash; f_Dependency_depIdentity = (dtb_u_u223).f_DepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (dtb_u_u223).f_DepAcc_depAccGit with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u227) -> (match (dtb_u_u223).f_DepAcc_depAccRev with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u222) (dtb_u_u223).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_GitRevRequired ((dtb_u_u223).f_DepAcc_depAccAlias))) (dtb_u_u223).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u228) -> (match (dtb_u_u223).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u229) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u222) (dtb_u_u223).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_SourceConflict ((dtb_u_u223).f_DepAcc_depAccAlias))) (dtb_u_u223).f_DepAcc_depAccAlias)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (dtb_u_u223).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepGit (dtb_u_u227, dtb_u_u228)); f_Dependency_depHash = (dtb_u_u223).f_DepAcc_depAccHash; f_Dependency_depIdentity = (dtb_u_u223).f_DepAcc_depAccIdentity }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (dtb_u_u223).f_DepAcc_depAccUrl with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u230) -> (Base_dDiag.C_Check_OkC ({ f_Dependency_depAlias = (dtb_u_u223).f_DepAcc_depAccAlias; f_Dependency_depSource = (C_DependencySource_DepUrl (dtb_u_u230)); f_Dependency_depHash = (dtb_u_u223).f_DepAcc_depAccHash; f_Dependency_depIdentity = (dtb_u_u223).f_DepAcc_depAccIdentity }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u222) (dtb_u_u223).f_DepAcc_depAccTableLine) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing ((dtb_u_u223).f_DepAcc_depAccAlias))) (dtb_u_u223).f_DepAcc_depAccAlias)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 424 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_buildTables = (fun (dtb_u_u231 : string) (dtb_u_u232 : t_DepAcc B_dData_dList.t_List) (dtb_u_u233 : t_Dependency B_dData_dList.t_List) -> (match dtb_u_u232 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u234, dtb_u_u235) -> (match ((v_buildDependency dtb_u_u231) dtb_u_u234) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u236) -> (Base_dDiag.C_Check_ErrC (dtb_u_u236))
  | Base_dDiag.C_Check_OkC (dtb_u_u237) -> (((v_buildTables dtb_u_u231) dtb_u_u235) (B_dData_dList.C_List__x58__x58_ (dtb_u_u237, dtb_u_u233)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u233)))
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_collectDependencies = (fun (dtb_u_u238 : string) (dtb_u_u239 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (match (((v_collectStrings dtb_u_u238) dtb_u_u239) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u240) -> (Base_dDiag.C_Check_ErrC (dtb_u_u240))
  | Base_dDiag.C_Check_OkC (dtb_u_u241) -> (match (((v_collectTables dtb_u_u238) dtb_u_u239) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u242) -> (Base_dDiag.C_Check_ErrC (dtb_u_u242))
  | Base_dDiag.C_Check_OkC (dtb_u_u243) -> (match (((v_buildTables dtb_u_u238) dtb_u_u243) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u244) -> (Base_dDiag.C_Check_ErrC (dtb_u_u244))
  | Base_dDiag.C_Check_OkC (dtb_u_u245) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u246 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> { f_Dependency_depAlias = (B_dData_dPair.v_firstOf dtb_u_u246); f_Dependency_depSource = (v_pathSource (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u246))); f_Dependency_depHash = B_dData_dMaybe.C_Maybe_Nothing; f_Dependency_depIdentity = B_dData_dMaybe.C_Maybe_Nothing })) dtb_u_u241)) dtb_u_u245)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_isHexChar = (fun (dtb_u_u247 : int) -> (if (if (v_isDigitChar dtb_u_u247) then true else (if (dtb_u_u247 >= 65) then (dtb_u_u247 <= 70) else false)) then true else (if (dtb_u_u247 >= 97) then (dtb_u_u247 <= 102) else false)))

# 449 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_allHex = (fun (dtb_u_u248 : int B_dData_dList.t_List) -> (match dtb_u_u248 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u249, dtb_u_u250) -> (if (v_isHexChar dtb_u_u249) then (v_allHex dtb_u_u250) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validHashText = (fun (dtb_u_u251 : string) -> (if ((B_dData_dString.v_startsWith "sha256:") dtb_u_u251) then (if ((String.length dtb_u_u251) = 71) then (v_allHex (B_dData_dList.dtp_unpack (((B_dData_dString.v_substring 7) 64) dtb_u_u251))) else false) else (if ((String.length dtb_u_u251) = 64) then (v_allHex (B_dData_dList.dtp_unpack dtb_u_u251)) else false)))

# 461 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkHashForm = (fun (dtb_u_u252 : string) (dtb_u_u253 : string) (dtb_u_u254 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u254 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u255) -> (if (v_validHashText dtb_u_u255) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u252) (Base_dDiagnostics_dPkg.C_PkgErr_HashMalformed (dtb_u_u255))) dtb_u_u255))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_checkIdentityForm = (fun (dtb_u_u256 : string) (dtb_u_u257 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u257 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u258) -> (if (v_validHashText dtb_u_u258) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u256) (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMalformed (dtb_u_u258))) dtb_u_u258))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDependency = (fun (dtb_u_u259 : string) (dtb_u_u260 : t_Dependency) -> (match dtb_u_u260 with
  | { f_Dependency_depAlias = dtb_u_u261; f_Dependency_depSource = dtb_u_u262; f_Dependency_depHash = dtb_u_u263; f_Dependency_depIdentity = dtb_u_u264 } -> (if (dtb_u_u261 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 dtb_u_u259) Base_dDiagnostics_dPkg.C_PkgErr_EmptyDependencyName) else (match ((v_checkIdentityForm dtb_u_u259) dtb_u_u264) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u265) -> (Base_dDiag.C_Check_ErrC (dtb_u_u265))
  | Base_dDiag.C_Check_OkC (dtb_u_u266) -> (match dtb_u_u262 with
  | C_DependencySource_DepPath (dtb_u_u267) -> (if (dtb_u_u267 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u259) (Base_dDiagnostics_dPkg.C_PkgErr_EmptyDependencyPath (dtb_u_u261))) dtb_u_u261) else (((v_checkHashForm dtb_u_u259) dtb_u_u261) dtb_u_u263))
  | C_DependencySource_DepGit (dtb_u_u268, dtb_u_u269) -> (match dtb_u_u263 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u259) (Base_dDiagnostics_dPkg.C_PkgErr_MissingHash (dtb_u_u261))) dtb_u_u261)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u270) -> (if (dtb_u_u268 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u259) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing (dtb_u_u261))) dtb_u_u261) else (if (dtb_u_u269 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u259) (Base_dDiagnostics_dPkg.C_PkgErr_GitRevRequired (dtb_u_u261))) dtb_u_u261) else (((v_checkHashForm dtb_u_u259) dtb_u_u261) dtb_u_u263)))
  | _ -> failwith "DT: impossible branch"
)
  | C_DependencySource_DepUrl (dtb_u_u271) -> (match dtb_u_u263 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u259) (Base_dDiagnostics_dPkg.C_PkgErr_MissingHash (dtb_u_u261))) dtb_u_u261)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u272) -> (if (dtb_u_u271 = "") then (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u259) (Base_dDiagnostics_dPkg.C_PkgErr_DependencySourceMissing (dtb_u_u261))) dtb_u_u261) else (((v_checkHashForm dtb_u_u259) dtb_u_u261) dtb_u_u263))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateDepsSeen = (fun (dtb_u_u273 : string) (dtb_u_u274 : string B_dData_dList.t_List) (dtb_u_u275 : t_Dependency B_dData_dList.t_List) -> (match dtb_u_u275 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u276, dtb_u_u277) -> (if ((B_dData_dList.v_memName (v_depAliasOf dtb_u_u276)) dtb_u_u274) then (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u273) (Base_dDiagnostics_dPkg.C_PkgErr_DuplicateDependency ((v_depAliasOf dtb_u_u276)))) (v_depAliasOf dtb_u_u276)) else (match ((v_validateDependency dtb_u_u273) dtb_u_u276) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u278) -> (Base_dDiag.C_Check_ErrC (dtb_u_u278))
  | Base_dDiag.C_Check_OkC (dtb_u_u279) -> (((v_validateDepsSeen dtb_u_u273) (B_dData_dList.C_List__x58__x58_ ((v_depAliasOf dtb_u_u276), dtb_u_u274))) dtb_u_u277)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDependencies = (fun (dtb_u_u280 : string) (dtb_u_u281 : t_Dependency B_dData_dList.t_List) -> (((v_validateDepsSeen dtb_u_u280) B_dData_dList.C_List_Nil) dtb_u_u281))

# 504 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagFormat = (fun (dtb_u_u282 : string) (dtb_u_u283 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u283 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u284) -> (if (if (if (if (dtb_u_u284 = "short") then true else (dtb_u_u284 = "human")) then true else (dtb_u_u284 = "json")) then true else (dtb_u_u284 = "sarif")) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u282) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagFormat (dtb_u_u284))) dtb_u_u284))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagMax = (fun (dtb_u_u285 : string) (dtb_u_u286 : int B_dData_dMaybe.t_Maybe) -> (match dtb_u_u286 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u287) -> (if (dtb_u_u287 >= 1) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u285) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagMaxErrors ((string_of_int dtb_u_u287)))) (string_of_int dtb_u_u287)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_startsWithSection = (fun (dtb_u_u288 : string B_dData_dList.t_List) (dtb_u_u289 : string) -> (match dtb_u_u288 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u290, dtb_u_u291) -> (dtb_u_u290 = dtb_u_u289)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_sectionPresent = (fun (dtb_u_u292 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (dtb_u_u293 : string) -> (match dtb_u_u292 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u294, dtb_u_u295) -> (match dtb_u_u294 with
  | { Frontend_dToml.f_TomlEntry_tomlEntrySection = dtb_u_u296; Frontend_dToml.f_TomlEntry_tomlEntryKey = dtb_u_u297; Frontend_dToml.f_TomlEntry_tomlEntryValue = dtb_u_u298; Frontend_dToml.f_TomlEntry_tomlEntryLine = dtb_u_u299 } -> (if ((v_startsWithSection dtb_u_u296) dtb_u_u293) then true else ((v_sectionPresent dtb_u_u295) dtb_u_u293))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_checkRootSections = (fun (dtb_u_u300 : string) (dtb_u_u301 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (dtb_u_u302 : string B_dData_dList.t_List) -> (match dtb_u_u302 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u303, dtb_u_u304) -> (if ((v_sectionPresent dtb_u_u301) dtb_u_u303) then (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u300) (Base_dDiagnostics_dPkg.C_PkgErr_PackageSectionInWorkspaceRoot (dtb_u_u303))) dtb_u_u303) else (((v_checkRootSections dtb_u_u300) dtb_u_u301) dtb_u_u304))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateRootShape = (fun (dtb_u_u305 : string) (dtb_u_u306 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) (dtb_u_u307 : string B_dData_dMaybe.t_Maybe) (dtb_u_u308 : string B_dData_dList.t_List) -> (match dtb_u_u307 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (B_dData_dBool.v_not ((v_sectionPresent dtb_u_u306) "workspace")) then ((Base_dDiagnostics_dPkg.v_pkgPath0 dtb_u_u305) Base_dDiagnostics_dPkg.C_PkgErr_MissingPackageName) else (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb_u_u308) B_dData_dList.C_List_Nil) then ((Base_dDiagnostics_dPkg.v_pkgPath0 dtb_u_u305) Base_dDiagnostics_dPkg.C_PkgErr_EmptyWorkspace) else (((v_checkRootSections dtb_u_u305) dtb_u_u306) (B_dData_dList.C_List__x58__x58_ ("package", (B_dData_dList.C_List__x58__x58_ ("export", (B_dData_dList.C_List__x58__x58_ ("layers", (B_dData_dList.C_List__x58__x58_ ("dependencies", B_dData_dList.C_List_Nil)))))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u309) -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 579 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validPackageChars = (fun (dtb_u_u310 : int B_dData_dList.t_List) -> (match dtb_u_u310 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u311, dtb_u_u312) -> (if (if (if (v_isLowerAlphaChar dtb_u_u311) then true else (v_isDigitChar dtb_u_u311)) then true else (dtb_u_u311 = 45)) then (v_validPackageChars dtb_u_u312) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validPackageName = (fun (dtb_u_u313 : string) -> (v_validPackageChars (B_dData_dList.dtp_unpack dtb_u_u313)))

# 598 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validModuleTail = (fun (dtb_u_u314 : int B_dData_dList.t_List) -> (match dtb_u_u314 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u315, dtb_u_u316) -> (if (if (if (if (v_isUpperAlphaChar dtb_u_u315) then true else (v_isLowerAlphaChar dtb_u_u315)) then true else (v_isDigitChar dtb_u_u315)) then true else (dtb_u_u315 = 95)) then (v_validModuleTail dtb_u_u316) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleSegmentChars = (fun (dtb_u_u317 : int B_dData_dList.t_List) -> (match dtb_u_u317 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u318, dtb_u_u319) -> (if (v_isUpperAlphaChar dtb_u_u318) then (v_validModuleTail dtb_u_u319) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 591 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleSegment = (fun (dtb_u_u320 : string) -> (v_validModuleSegmentChars (B_dData_dList.dtp_unpack dtb_u_u320)))

# 587 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validModuleSegments = (fun (dtb_u_u321 : string B_dData_dList.t_List) -> (match dtb_u_u321 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u322, dtb_u_u323) -> (if (v_validModuleSegment dtb_u_u322) then (v_validModuleSegments dtb_u_u323) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validModuleName = (fun (dtb_u_u324 : string) -> (v_validModuleSegments (Base_dSource.v_splitOnDot dtb_u_u324)))

# 238 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateLayerTargets = (fun (dtb_u_u325 : string) (dtb_u_u326 : string B_dData_dList.t_List) -> (match dtb_u_u326 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u327, dtb_u_u328) -> (if (v_validModuleName dtb_u_u327) then ((v_validateLayerTargets dtb_u_u325) dtb_u_u328) else (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u325) (Base_dDiagnostics_dPkg.C_PkgErr_LayerInvalidTarget (dtb_u_u327))) dtb_u_u327))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateLayers = (fun (dtb_u_u329 : string) (dtb_u_u330 : t_Layer B_dData_dList.t_List) (dtb_u_u331 : t_Layer B_dData_dList.t_List) -> (match dtb_u_u331 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u332, dtb_u_u333) -> (if (v_validModuleName (dtb_u_u332).f_Layer_layerName) then (match ((v_validateLayerTargets dtb_u_u329) (dtb_u_u332).f_Layer_layerUses) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u334) -> (Base_dDiag.C_Check_ErrC (dtb_u_u334))
  | Base_dDiag.C_Check_OkC (dtb_u_u335) -> (if ((v_layerHasCycle dtb_u_u330) dtb_u_u332) then ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u329) (dtb_u_u332).f_Layer_layerLine) (Base_dDiagnostics_dPkg.C_PkgErr_LayerCycle ((dtb_u_u332).f_Layer_layerName))) (dtb_u_u332).f_Layer_layerName) else (((v_validateLayers dtb_u_u329) dtb_u_u330) dtb_u_u333))
  | _ -> failwith "DT: impossible branch"
) else ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u329) (dtb_u_u332).f_Layer_layerLine) (Base_dDiagnostics_dPkg.C_PkgErr_LayerInvalidName ((dtb_u_u332).f_Layer_layerName))) (dtb_u_u332).f_Layer_layerName))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateName = (fun (dtb_u_u336 : bool) (dtb_u_u337 : string B_dData_dList.t_List) (dtb_u_u338 : string) (dtb_u_u339 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u339 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u340) -> (if (dtb_u_u340 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 dtb_u_u338) Base_dDiagnostics_dPkg.C_PkgErr_EmptyPackageName) else (if (v_validPackageName dtb_u_u340) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u338) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidPackageName (dtb_u_u340))) dtb_u_u340)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if dtb_u_u336 then ((B_dData_dList.v_length dtb_u_u337) > 0) else false) then (Base_dDiag.C_Check_OkC (0)) else ((Base_dDiagnostics_dPkg.v_pkgPath0 dtb_u_u338) Base_dDiagnostics_dPkg.C_PkgErr_MissingPackageName))
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateMembers = (fun (dtb_u_u341 : string) (dtb_u_u342 : string B_dData_dList.t_List) -> (match dtb_u_u342 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u343, dtb_u_u344) -> (if (dtb_u_u343 = "") then ((Base_dDiagnostics_dPkg.v_pkgPath0 dtb_u_u341) Base_dDiagnostics_dPkg.C_PkgErr_EmptyMember) else ((v_validateMembers dtb_u_u341) dtb_u_u344))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_validateModules = (fun (dtb_u_u345 : string) (dtb_u_u346 : string B_dData_dList.t_List) -> (match dtb_u_u346 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u347, dtb_u_u348) -> (if (v_validModuleName dtb_u_u347) then ((v_validateModules dtb_u_u345) dtb_u_u348) else (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u345) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidExportModule (dtb_u_u347))) dtb_u_u347))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 626 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateExports = (fun (dtb_u_u349 : string) (dtb_u_u350 : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match dtb_u_u350 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u351) -> ((v_validateModules dtb_u_u349) dtb_u_u351)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateManifest = (fun (dtb_u_u352 : t_Manifest) -> (match dtb_u_u352 with
  | { f_Manifest_manifestName = dtb_u_u353; f_Manifest_manifestMembers = dtb_u_u354; f_Manifest_manifestIsWorkspace = dtb_u_u355; f_Manifest_manifestExports = dtb_u_u356; f_Manifest_manifestImplicitPrelude = dtb_u_u357; f_Manifest_manifestDependencies = dtb_u_u358; f_Manifest_manifestPath = dtb_u_u359; f_Manifest_manifestDiagFormat = dtb_u_u360; f_Manifest_manifestDiagWarnings = dtb_u_u361; f_Manifest_manifestDiagMaxErrors = dtb_u_u362; f_Manifest_manifestDiagLang = dtb_u_u363; f_Manifest_manifestDiagDenyWarnings = dtb_u_u364; f_Manifest_manifestRegistryIndex = dtb_u_u365; f_Manifest_manifestLayers = dtb_u_u366 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_validateName dtb_u_u355) dtb_u_u354) dtb_u_u359) dtb_u_u353)) (fun dtb_u_u367 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateMembers dtb_u_u359) dtb_u_u354)) (fun dtb_u_u368 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateExports dtb_u_u359) dtb_u_u356)) (fun dtb_u_u369 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateDependencies dtb_u_u359) dtb_u_u358)) (fun dtb_u_u370 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) (((v_validateLayers dtb_u_u359) dtb_u_u366) dtb_u_u366)) (fun dtb_u_u371 -> ((B_dTrait_dApplicative.v_pure Base_dDiag.v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) { f_Manifest_manifestName = dtb_u_u353; f_Manifest_manifestMembers = dtb_u_u354; f_Manifest_manifestIsWorkspace = dtb_u_u355; f_Manifest_manifestExports = dtb_u_u356; f_Manifest_manifestImplicitPrelude = dtb_u_u357; f_Manifest_manifestDependencies = dtb_u_u358; f_Manifest_manifestPath = dtb_u_u359; f_Manifest_manifestDiagFormat = dtb_u_u360; f_Manifest_manifestDiagWarnings = dtb_u_u361; f_Manifest_manifestDiagMaxErrors = dtb_u_u362; f_Manifest_manifestDiagLang = dtb_u_u363; f_Manifest_manifestDiagDenyWarnings = dtb_u_u364; f_Manifest_manifestRegistryIndex = dtb_u_u365; f_Manifest_manifestLayers = dtb_u_u366 })))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 649 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_dirResult = (fun (dtb_u_u372 : string) -> (if (dtb_u_u372 = "") then "/" else dtb_u_u372))

# 645 "Vuna/Compiler/Frontend/Manifest.vuna"
let rec v_dirFromRev = (fun (dtb_u_u373 : int B_dData_dList.t_List) -> (match dtb_u_u373 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u374, dtb_u_u375) -> (if (dtb_u_u374 = 47) then (v_dirResult (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u375))) else (v_dirFromRev dtb_u_u375))
  | B_dData_dList.C_List_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDir = (fun (dtb_u_u376 : string) -> (v_dirFromRev (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack dtb_u_u376))))

# 653 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_resolveManifestPath = (fun (dtb_u_u377 : t_Manifest) (dtb_u_u378 : string) -> ((Base_dSource.v_joinPath (v_manifestDir (dtb_u_u377).f_Manifest_manifestPath)) dtb_u_u378))

# 657 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_validateDiagLang = (fun (dtb_u_u379 : string) (dtb_u_u380 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u380 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u381) -> (if (if (dtb_u_u381 = "en") then true else (dtb_u_u381 = "zh")) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u379) (Base_dDiagnostics_dPkg.C_PkgErr_InvalidDiagLang (dtb_u_u381))) dtb_u_u381))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_buildManifest = (fun (dtb_u_u382 : string) (dtb_u_u383 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_checkEntries dtb_u_u382) dtb_u_u383)) (fun dtb_u_u384 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) (((v_collectLayers dtb_u_u382) dtb_u_u383) B_dData_dList.C_List_Nil)) (fun dtb_u_u385 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) "name") dtb_u_u383)) (fun dtb_u_u386 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_boolField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("package", B_dData_dList.C_List_Nil))) "implicit-prelude") dtb_u_u383)) (fun dtb_u_u387 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringListField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("workspace", B_dData_dList.C_List_Nil))) "members") dtb_u_u383)) (fun dtb_u_u388 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_validateRootShape dtb_u_u382) dtb_u_u383) dtb_u_u386) (v_orEmptyList dtb_u_u388))) (fun dtb_u_u389 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringListField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("export", B_dData_dList.C_List_Nil))) "modules") dtb_u_u383)) (fun dtb_u_u390 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_collectDependencies dtb_u_u382) dtb_u_u383)) (fun dtb_u_u391 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "format") dtb_u_u383)) (fun dtb_u_u392 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_boolField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "warnings") dtb_u_u383)) (fun dtb_u_u393 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_intField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "max-errors") dtb_u_u383)) (fun dtb_u_u394 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "lang") dtb_u_u383)) (fun dtb_u_u395 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_boolField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("diagnostics", B_dData_dList.C_List_Nil))) "deny-warnings") dtb_u_u383)) (fun dtb_u_u396 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((((v_stringField dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ("registry", B_dData_dList.C_List_Nil))) "index") dtb_u_u383)) (fun dtb_u_u397 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateDiagFormat dtb_u_u382) dtb_u_u392)) (fun dtb_u_u398 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateDiagMax dtb_u_u382) dtb_u_u394)) (fun dtb_u_u399 -> (((B_dTrait_dMonad.v__x62__x62__x61_ Base_dDiag.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) ((v_validateDiagLang dtb_u_u382) dtb_u_u395)) (fun dtb_u_u400 -> ((B_dTrait_dApplicative.v_pure Base_dDiag.v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check) { f_Manifest_manifestName = dtb_u_u386; f_Manifest_manifestMembers = (v_orEmptyList dtb_u_u388); f_Manifest_manifestIsWorkspace = ((v_sectionPresent dtb_u_u383) "workspace"); f_Manifest_manifestExports = dtb_u_u390; f_Manifest_manifestImplicitPrelude = (v_preludeEnabled dtb_u_u387); f_Manifest_manifestDependencies = dtb_u_u391; f_Manifest_manifestPath = dtb_u_u382; f_Manifest_manifestDiagFormat = dtb_u_u392; f_Manifest_manifestDiagWarnings = dtb_u_u393; f_Manifest_manifestDiagMaxErrors = dtb_u_u394; f_Manifest_manifestDiagLang = dtb_u_u395; f_Manifest_manifestDiagDenyWarnings = dtb_u_u396; f_Manifest_manifestRegistryIndex = dtb_u_u397; f_Manifest_manifestLayers = dtb_u_u385 }))))))))))))))))))))))))))))))))))))

# 569 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_parseManifest = (fun (dtb_u_u401 : string) (dtb_u_u402 : string) -> ((Base_dCommon.v_bind ((Frontend_dToml.v_parseTomlAt dtb_u_u401) dtb_u_u402)) (fun (dtb_u_u403 : Frontend_dToml.t_TomlEntry B_dData_dList.t_List) -> ((v_buildManifest dtb_u_u401) dtb_u_u403))))

# 38 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAlias = (fun (dtb_u_u404 : t_Dependency) -> (match dtb_u_u404 with
  | { f_Dependency_depAlias = dtb_u_u405; f_Dependency_depSource = dtb_u_u406; f_Dependency_depHash = dtb_u_u407; f_Dependency_depIdentity = dtb_u_u408 } -> dtb_u_u405
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depSource = (fun (dtb_u_u409 : t_Dependency) -> (match dtb_u_u409 with
  | { f_Dependency_depAlias = dtb_u_u410; f_Dependency_depSource = dtb_u_u411; f_Dependency_depHash = dtb_u_u412; f_Dependency_depIdentity = dtb_u_u413 } -> dtb_u_u411
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depHash = (fun (dtb_u_u414 : t_Dependency) -> (match dtb_u_u414 with
  | { f_Dependency_depAlias = dtb_u_u415; f_Dependency_depSource = dtb_u_u416; f_Dependency_depHash = dtb_u_u417; f_Dependency_depIdentity = dtb_u_u418 } -> dtb_u_u417
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depIdentity = (fun (dtb_u_u419 : t_Dependency) -> (match dtb_u_u419 with
  | { f_Dependency_depAlias = dtb_u_u420; f_Dependency_depSource = dtb_u_u421; f_Dependency_depHash = dtb_u_u422; f_Dependency_depIdentity = dtb_u_u423 } -> dtb_u_u423
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerName = (fun (dtb_u_u424 : t_Layer) -> (match dtb_u_u424 with
  | { f_Layer_layerName = dtb_u_u425; f_Layer_layerUses = dtb_u_u426; f_Layer_layerLine = dtb_u_u427 } -> dtb_u_u425
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerUses = (fun (dtb_u_u428 : t_Layer) -> (match dtb_u_u428 with
  | { f_Layer_layerName = dtb_u_u429; f_Layer_layerUses = dtb_u_u430; f_Layer_layerLine = dtb_u_u431 } -> dtb_u_u430
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_layerLine = (fun (dtb_u_u432 : t_Layer) -> (match dtb_u_u432 with
  | { f_Layer_layerName = dtb_u_u433; f_Layer_layerUses = dtb_u_u434; f_Layer_layerLine = dtb_u_u435 } -> dtb_u_u435
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestName = (fun (dtb_u_u436 : t_Manifest) -> (match dtb_u_u436 with
  | { f_Manifest_manifestName = dtb_u_u437; f_Manifest_manifestMembers = dtb_u_u438; f_Manifest_manifestIsWorkspace = dtb_u_u439; f_Manifest_manifestExports = dtb_u_u440; f_Manifest_manifestImplicitPrelude = dtb_u_u441; f_Manifest_manifestDependencies = dtb_u_u442; f_Manifest_manifestPath = dtb_u_u443; f_Manifest_manifestDiagFormat = dtb_u_u444; f_Manifest_manifestDiagWarnings = dtb_u_u445; f_Manifest_manifestDiagMaxErrors = dtb_u_u446; f_Manifest_manifestDiagLang = dtb_u_u447; f_Manifest_manifestDiagDenyWarnings = dtb_u_u448; f_Manifest_manifestRegistryIndex = dtb_u_u449; f_Manifest_manifestLayers = dtb_u_u450 } -> dtb_u_u437
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestMembers = (fun (dtb_u_u451 : t_Manifest) -> (match dtb_u_u451 with
  | { f_Manifest_manifestName = dtb_u_u452; f_Manifest_manifestMembers = dtb_u_u453; f_Manifest_manifestIsWorkspace = dtb_u_u454; f_Manifest_manifestExports = dtb_u_u455; f_Manifest_manifestImplicitPrelude = dtb_u_u456; f_Manifest_manifestDependencies = dtb_u_u457; f_Manifest_manifestPath = dtb_u_u458; f_Manifest_manifestDiagFormat = dtb_u_u459; f_Manifest_manifestDiagWarnings = dtb_u_u460; f_Manifest_manifestDiagMaxErrors = dtb_u_u461; f_Manifest_manifestDiagLang = dtb_u_u462; f_Manifest_manifestDiagDenyWarnings = dtb_u_u463; f_Manifest_manifestRegistryIndex = dtb_u_u464; f_Manifest_manifestLayers = dtb_u_u465 } -> dtb_u_u453
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestIsWorkspace = (fun (dtb_u_u466 : t_Manifest) -> (match dtb_u_u466 with
  | { f_Manifest_manifestName = dtb_u_u467; f_Manifest_manifestMembers = dtb_u_u468; f_Manifest_manifestIsWorkspace = dtb_u_u469; f_Manifest_manifestExports = dtb_u_u470; f_Manifest_manifestImplicitPrelude = dtb_u_u471; f_Manifest_manifestDependencies = dtb_u_u472; f_Manifest_manifestPath = dtb_u_u473; f_Manifest_manifestDiagFormat = dtb_u_u474; f_Manifest_manifestDiagWarnings = dtb_u_u475; f_Manifest_manifestDiagMaxErrors = dtb_u_u476; f_Manifest_manifestDiagLang = dtb_u_u477; f_Manifest_manifestDiagDenyWarnings = dtb_u_u478; f_Manifest_manifestRegistryIndex = dtb_u_u479; f_Manifest_manifestLayers = dtb_u_u480 } -> dtb_u_u469
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestExports = (fun (dtb_u_u481 : t_Manifest) -> (match dtb_u_u481 with
  | { f_Manifest_manifestName = dtb_u_u482; f_Manifest_manifestMembers = dtb_u_u483; f_Manifest_manifestIsWorkspace = dtb_u_u484; f_Manifest_manifestExports = dtb_u_u485; f_Manifest_manifestImplicitPrelude = dtb_u_u486; f_Manifest_manifestDependencies = dtb_u_u487; f_Manifest_manifestPath = dtb_u_u488; f_Manifest_manifestDiagFormat = dtb_u_u489; f_Manifest_manifestDiagWarnings = dtb_u_u490; f_Manifest_manifestDiagMaxErrors = dtb_u_u491; f_Manifest_manifestDiagLang = dtb_u_u492; f_Manifest_manifestDiagDenyWarnings = dtb_u_u493; f_Manifest_manifestRegistryIndex = dtb_u_u494; f_Manifest_manifestLayers = dtb_u_u495 } -> dtb_u_u485
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestImplicitPrelude = (fun (dtb_u_u496 : t_Manifest) -> (match dtb_u_u496 with
  | { f_Manifest_manifestName = dtb_u_u497; f_Manifest_manifestMembers = dtb_u_u498; f_Manifest_manifestIsWorkspace = dtb_u_u499; f_Manifest_manifestExports = dtb_u_u500; f_Manifest_manifestImplicitPrelude = dtb_u_u501; f_Manifest_manifestDependencies = dtb_u_u502; f_Manifest_manifestPath = dtb_u_u503; f_Manifest_manifestDiagFormat = dtb_u_u504; f_Manifest_manifestDiagWarnings = dtb_u_u505; f_Manifest_manifestDiagMaxErrors = dtb_u_u506; f_Manifest_manifestDiagLang = dtb_u_u507; f_Manifest_manifestDiagDenyWarnings = dtb_u_u508; f_Manifest_manifestRegistryIndex = dtb_u_u509; f_Manifest_manifestLayers = dtb_u_u510 } -> dtb_u_u501
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDependencies = (fun (dtb_u_u511 : t_Manifest) -> (match dtb_u_u511 with
  | { f_Manifest_manifestName = dtb_u_u512; f_Manifest_manifestMembers = dtb_u_u513; f_Manifest_manifestIsWorkspace = dtb_u_u514; f_Manifest_manifestExports = dtb_u_u515; f_Manifest_manifestImplicitPrelude = dtb_u_u516; f_Manifest_manifestDependencies = dtb_u_u517; f_Manifest_manifestPath = dtb_u_u518; f_Manifest_manifestDiagFormat = dtb_u_u519; f_Manifest_manifestDiagWarnings = dtb_u_u520; f_Manifest_manifestDiagMaxErrors = dtb_u_u521; f_Manifest_manifestDiagLang = dtb_u_u522; f_Manifest_manifestDiagDenyWarnings = dtb_u_u523; f_Manifest_manifestRegistryIndex = dtb_u_u524; f_Manifest_manifestLayers = dtb_u_u525 } -> dtb_u_u517
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestPath = (fun (dtb_u_u526 : t_Manifest) -> (match dtb_u_u526 with
  | { f_Manifest_manifestName = dtb_u_u527; f_Manifest_manifestMembers = dtb_u_u528; f_Manifest_manifestIsWorkspace = dtb_u_u529; f_Manifest_manifestExports = dtb_u_u530; f_Manifest_manifestImplicitPrelude = dtb_u_u531; f_Manifest_manifestDependencies = dtb_u_u532; f_Manifest_manifestPath = dtb_u_u533; f_Manifest_manifestDiagFormat = dtb_u_u534; f_Manifest_manifestDiagWarnings = dtb_u_u535; f_Manifest_manifestDiagMaxErrors = dtb_u_u536; f_Manifest_manifestDiagLang = dtb_u_u537; f_Manifest_manifestDiagDenyWarnings = dtb_u_u538; f_Manifest_manifestRegistryIndex = dtb_u_u539; f_Manifest_manifestLayers = dtb_u_u540 } -> dtb_u_u533
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagFormat = (fun (dtb_u_u541 : t_Manifest) -> (match dtb_u_u541 with
  | { f_Manifest_manifestName = dtb_u_u542; f_Manifest_manifestMembers = dtb_u_u543; f_Manifest_manifestIsWorkspace = dtb_u_u544; f_Manifest_manifestExports = dtb_u_u545; f_Manifest_manifestImplicitPrelude = dtb_u_u546; f_Manifest_manifestDependencies = dtb_u_u547; f_Manifest_manifestPath = dtb_u_u548; f_Manifest_manifestDiagFormat = dtb_u_u549; f_Manifest_manifestDiagWarnings = dtb_u_u550; f_Manifest_manifestDiagMaxErrors = dtb_u_u551; f_Manifest_manifestDiagLang = dtb_u_u552; f_Manifest_manifestDiagDenyWarnings = dtb_u_u553; f_Manifest_manifestRegistryIndex = dtb_u_u554; f_Manifest_manifestLayers = dtb_u_u555 } -> dtb_u_u549
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagWarnings = (fun (dtb_u_u556 : t_Manifest) -> (match dtb_u_u556 with
  | { f_Manifest_manifestName = dtb_u_u557; f_Manifest_manifestMembers = dtb_u_u558; f_Manifest_manifestIsWorkspace = dtb_u_u559; f_Manifest_manifestExports = dtb_u_u560; f_Manifest_manifestImplicitPrelude = dtb_u_u561; f_Manifest_manifestDependencies = dtb_u_u562; f_Manifest_manifestPath = dtb_u_u563; f_Manifest_manifestDiagFormat = dtb_u_u564; f_Manifest_manifestDiagWarnings = dtb_u_u565; f_Manifest_manifestDiagMaxErrors = dtb_u_u566; f_Manifest_manifestDiagLang = dtb_u_u567; f_Manifest_manifestDiagDenyWarnings = dtb_u_u568; f_Manifest_manifestRegistryIndex = dtb_u_u569; f_Manifest_manifestLayers = dtb_u_u570 } -> dtb_u_u565
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagMaxErrors = (fun (dtb_u_u571 : t_Manifest) -> (match dtb_u_u571 with
  | { f_Manifest_manifestName = dtb_u_u572; f_Manifest_manifestMembers = dtb_u_u573; f_Manifest_manifestIsWorkspace = dtb_u_u574; f_Manifest_manifestExports = dtb_u_u575; f_Manifest_manifestImplicitPrelude = dtb_u_u576; f_Manifest_manifestDependencies = dtb_u_u577; f_Manifest_manifestPath = dtb_u_u578; f_Manifest_manifestDiagFormat = dtb_u_u579; f_Manifest_manifestDiagWarnings = dtb_u_u580; f_Manifest_manifestDiagMaxErrors = dtb_u_u581; f_Manifest_manifestDiagLang = dtb_u_u582; f_Manifest_manifestDiagDenyWarnings = dtb_u_u583; f_Manifest_manifestRegistryIndex = dtb_u_u584; f_Manifest_manifestLayers = dtb_u_u585 } -> dtb_u_u581
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagLang = (fun (dtb_u_u586 : t_Manifest) -> (match dtb_u_u586 with
  | { f_Manifest_manifestName = dtb_u_u587; f_Manifest_manifestMembers = dtb_u_u588; f_Manifest_manifestIsWorkspace = dtb_u_u589; f_Manifest_manifestExports = dtb_u_u590; f_Manifest_manifestImplicitPrelude = dtb_u_u591; f_Manifest_manifestDependencies = dtb_u_u592; f_Manifest_manifestPath = dtb_u_u593; f_Manifest_manifestDiagFormat = dtb_u_u594; f_Manifest_manifestDiagWarnings = dtb_u_u595; f_Manifest_manifestDiagMaxErrors = dtb_u_u596; f_Manifest_manifestDiagLang = dtb_u_u597; f_Manifest_manifestDiagDenyWarnings = dtb_u_u598; f_Manifest_manifestRegistryIndex = dtb_u_u599; f_Manifest_manifestLayers = dtb_u_u600 } -> dtb_u_u597
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestDiagDenyWarnings = (fun (dtb_u_u601 : t_Manifest) -> (match dtb_u_u601 with
  | { f_Manifest_manifestName = dtb_u_u602; f_Manifest_manifestMembers = dtb_u_u603; f_Manifest_manifestIsWorkspace = dtb_u_u604; f_Manifest_manifestExports = dtb_u_u605; f_Manifest_manifestImplicitPrelude = dtb_u_u606; f_Manifest_manifestDependencies = dtb_u_u607; f_Manifest_manifestPath = dtb_u_u608; f_Manifest_manifestDiagFormat = dtb_u_u609; f_Manifest_manifestDiagWarnings = dtb_u_u610; f_Manifest_manifestDiagMaxErrors = dtb_u_u611; f_Manifest_manifestDiagLang = dtb_u_u612; f_Manifest_manifestDiagDenyWarnings = dtb_u_u613; f_Manifest_manifestRegistryIndex = dtb_u_u614; f_Manifest_manifestLayers = dtb_u_u615 } -> dtb_u_u613
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestRegistryIndex = (fun (dtb_u_u616 : t_Manifest) -> (match dtb_u_u616 with
  | { f_Manifest_manifestName = dtb_u_u617; f_Manifest_manifestMembers = dtb_u_u618; f_Manifest_manifestIsWorkspace = dtb_u_u619; f_Manifest_manifestExports = dtb_u_u620; f_Manifest_manifestImplicitPrelude = dtb_u_u621; f_Manifest_manifestDependencies = dtb_u_u622; f_Manifest_manifestPath = dtb_u_u623; f_Manifest_manifestDiagFormat = dtb_u_u624; f_Manifest_manifestDiagWarnings = dtb_u_u625; f_Manifest_manifestDiagMaxErrors = dtb_u_u626; f_Manifest_manifestDiagLang = dtb_u_u627; f_Manifest_manifestDiagDenyWarnings = dtb_u_u628; f_Manifest_manifestRegistryIndex = dtb_u_u629; f_Manifest_manifestLayers = dtb_u_u630 } -> dtb_u_u629
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_manifestLayers = (fun (dtb_u_u631 : t_Manifest) -> (match dtb_u_u631 with
  | { f_Manifest_manifestName = dtb_u_u632; f_Manifest_manifestMembers = dtb_u_u633; f_Manifest_manifestIsWorkspace = dtb_u_u634; f_Manifest_manifestExports = dtb_u_u635; f_Manifest_manifestImplicitPrelude = dtb_u_u636; f_Manifest_manifestDependencies = dtb_u_u637; f_Manifest_manifestPath = dtb_u_u638; f_Manifest_manifestDiagFormat = dtb_u_u639; f_Manifest_manifestDiagWarnings = dtb_u_u640; f_Manifest_manifestDiagMaxErrors = dtb_u_u641; f_Manifest_manifestDiagLang = dtb_u_u642; f_Manifest_manifestDiagDenyWarnings = dtb_u_u643; f_Manifest_manifestRegistryIndex = dtb_u_u644; f_Manifest_manifestLayers = dtb_u_u645 } -> dtb_u_u645
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccAlias = (fun (dtb_u_u646 : t_DepAcc) -> (match dtb_u_u646 with
  | { f_DepAcc_depAccAlias = dtb_u_u647; f_DepAcc_depAccPath = dtb_u_u648; f_DepAcc_depAccGit = dtb_u_u649; f_DepAcc_depAccRev = dtb_u_u650; f_DepAcc_depAccUrl = dtb_u_u651; f_DepAcc_depAccHash = dtb_u_u652; f_DepAcc_depAccIdentity = dtb_u_u653; f_DepAcc_depAccTableLine = dtb_u_u654 } -> dtb_u_u647
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccPath = (fun (dtb_u_u655 : t_DepAcc) -> (match dtb_u_u655 with
  | { f_DepAcc_depAccAlias = dtb_u_u656; f_DepAcc_depAccPath = dtb_u_u657; f_DepAcc_depAccGit = dtb_u_u658; f_DepAcc_depAccRev = dtb_u_u659; f_DepAcc_depAccUrl = dtb_u_u660; f_DepAcc_depAccHash = dtb_u_u661; f_DepAcc_depAccIdentity = dtb_u_u662; f_DepAcc_depAccTableLine = dtb_u_u663 } -> dtb_u_u657
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccGit = (fun (dtb_u_u664 : t_DepAcc) -> (match dtb_u_u664 with
  | { f_DepAcc_depAccAlias = dtb_u_u665; f_DepAcc_depAccPath = dtb_u_u666; f_DepAcc_depAccGit = dtb_u_u667; f_DepAcc_depAccRev = dtb_u_u668; f_DepAcc_depAccUrl = dtb_u_u669; f_DepAcc_depAccHash = dtb_u_u670; f_DepAcc_depAccIdentity = dtb_u_u671; f_DepAcc_depAccTableLine = dtb_u_u672 } -> dtb_u_u667
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccRev = (fun (dtb_u_u673 : t_DepAcc) -> (match dtb_u_u673 with
  | { f_DepAcc_depAccAlias = dtb_u_u674; f_DepAcc_depAccPath = dtb_u_u675; f_DepAcc_depAccGit = dtb_u_u676; f_DepAcc_depAccRev = dtb_u_u677; f_DepAcc_depAccUrl = dtb_u_u678; f_DepAcc_depAccHash = dtb_u_u679; f_DepAcc_depAccIdentity = dtb_u_u680; f_DepAcc_depAccTableLine = dtb_u_u681 } -> dtb_u_u677
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccUrl = (fun (dtb_u_u682 : t_DepAcc) -> (match dtb_u_u682 with
  | { f_DepAcc_depAccAlias = dtb_u_u683; f_DepAcc_depAccPath = dtb_u_u684; f_DepAcc_depAccGit = dtb_u_u685; f_DepAcc_depAccRev = dtb_u_u686; f_DepAcc_depAccUrl = dtb_u_u687; f_DepAcc_depAccHash = dtb_u_u688; f_DepAcc_depAccIdentity = dtb_u_u689; f_DepAcc_depAccTableLine = dtb_u_u690 } -> dtb_u_u687
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccHash = (fun (dtb_u_u691 : t_DepAcc) -> (match dtb_u_u691 with
  | { f_DepAcc_depAccAlias = dtb_u_u692; f_DepAcc_depAccPath = dtb_u_u693; f_DepAcc_depAccGit = dtb_u_u694; f_DepAcc_depAccRev = dtb_u_u695; f_DepAcc_depAccUrl = dtb_u_u696; f_DepAcc_depAccHash = dtb_u_u697; f_DepAcc_depAccIdentity = dtb_u_u698; f_DepAcc_depAccTableLine = dtb_u_u699 } -> dtb_u_u697
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccIdentity = (fun (dtb_u_u700 : t_DepAcc) -> (match dtb_u_u700 with
  | { f_DepAcc_depAccAlias = dtb_u_u701; f_DepAcc_depAccPath = dtb_u_u702; f_DepAcc_depAccGit = dtb_u_u703; f_DepAcc_depAccRev = dtb_u_u704; f_DepAcc_depAccUrl = dtb_u_u705; f_DepAcc_depAccHash = dtb_u_u706; f_DepAcc_depAccIdentity = dtb_u_u707; f_DepAcc_depAccTableLine = dtb_u_u708 } -> dtb_u_u707
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Frontend/Manifest.vuna"
let v_depAccTableLine = (fun (dtb_u_u709 : t_DepAcc) -> (match dtb_u_u709 with
  | { f_DepAcc_depAccAlias = dtb_u_u710; f_DepAcc_depAccPath = dtb_u_u711; f_DepAcc_depAccGit = dtb_u_u712; f_DepAcc_depAccRev = dtb_u_u713; f_DepAcc_depAccUrl = dtb_u_u714; f_DepAcc_depAccHash = dtb_u_u715; f_DepAcc_depAccIdentity = dtb_u_u716; f_DepAcc_depAccTableLine = dtb_u_u717 } -> dtb_u_u717
  | _ -> failwith "DT: impossible branch"
))
