open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dManifest_dManifest = { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged : bool; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath : string }

let v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar = (fun c -> (if (c >= 48) then (c <= 57) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_datLine = (fun path line msg -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt line); ": "; msg]) else (String.concat "" [path; ":"; (bi_strFromInt line); ": "; msg])))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr = (fun path msg -> (if (path = "") then msg else (String.concat "" [path; ": "; msg])))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dsameSection = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__0) dtb__2) then (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection _uctx0) dtb__1) dtb__3) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc = (fun path section key entries -> (match (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt dtb__4); ": "]) else (String.concat "" [path; ":"; (bi_strFromInt dtb__4); ": "]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (path = "") then "" else (path ^ ": "))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> (match dtb__5 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__6) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc path) section) key) entries); "expected a string for \""; key; "\""])))
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringListField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (match dtb__7 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TList (dtb__8) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__8))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc path) section) key) entries); "expected an array of strings for \""; key; "\""])))
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

let v_Vuna_dCompiler_dFrontend_dManifest_dboolField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__9) -> (match dtb__9 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (dtb__10) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc path) section) key) entries); "expected a boolean for \""; key; "\""])))
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

let v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11) -> dtb__11
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dorFalse = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> dtb__12
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__13; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__14; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__15; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__16 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__13) Base_dList.C_Base_dList_dList_Nil) then (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__16) (String.concat "" ["unexpected top-level key \""; dtb__14; "\""])))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__13) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) then (if (if (dtb__14 = "name") then true else (dtb__14 = "privileged")) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__16) (String.concat "" ["unknown key \""; dtb__14; "\" in [package]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__13) (Base_dList.C_Base_dList_dList_Cons ("workspace", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__14 = "members") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__16) (String.concat "" ["unknown key \""; dtb__14; "\" in [workspace]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__13) (Base_dList.C_Base_dList_dList_Cons ("export", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__14 = "modules") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__16) (String.concat "" ["unknown key \""; dtb__14; "\" in [export]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__13) (Base_dList.C_Base_dList_dList_Cons ("capabilities", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__14 = "effects") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__16) (String.concat "" ["unknown key \""; dtb__14; "\" in [capabilities]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__13) (Base_dList.C_Base_dList_dList_Cons ("trust", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__14 = "unsafe") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__16) (String.concat "" ["unknown key \""; dtb__14; "\" in [trust]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__13) (Base_dList.C_Base_dList_dList_Cons ("privileged", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__14 = "modules") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__16) (String.concat "" ["unknown key \""; dtb__14; "\" in [privileged]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__13) (Base_dList.C_Base_dList_dList_Cons ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__16) (String.concat "" ["unknown section ["; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__13); "]"]))))))))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry mc0) dtb__17) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__19) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__19))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__20) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries mc0) dtb__18)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22) -> (match dtb__21 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__23; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__24; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__25; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__26 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__23) (Base_dList.C_Base_dList_dList_Cons ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (match dtb__25 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__27) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc mc0) dtb__22) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__27 }, mc2)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__26) (String.concat "" ["dependency \""; dtb__24; "\" must have a string relative path"]))))
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc mc0) dtb__22) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies = (fun path entries -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) entries) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest = (fun path entries -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) entries)) (fun checked -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) "name") entries)) (fun name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("workspace", Base_dList.C_Base_dList_dList_Nil))) "members") entries)) (fun members -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("export", Base_dList.C_Base_dList_dList_Nil))) "modules") entries)) (fun exports -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies path) entries)) (fun deps -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("capabilities", Base_dList.C_Base_dList_dList_Nil))) "effects") entries)) (fun caps -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("trust", Base_dList.C_Base_dList_dList_Nil))) "unsafe") entries)) (fun trust -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) "privileged") entries)) (fun privileged -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("privileged", Base_dList.C_Base_dList_dList_Nil))) "modules") entries)) (fun hosts -> (Base_dResult.C_Base_dResult_dResult_Ok ({ f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = name; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = exports; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = deps; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities = (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList caps); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe = trust; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged = (v_Vuna_dCompiler_dFrontend_dManifest_dorFalse privileged); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules = (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList hosts); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = path })))))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest = (fun path contents -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt path) contents)) (fun entries -> ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest path) entries))))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__28) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__28)) then true else (dtb__28 = 45)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars dtb__29) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars (Base_dList.dtp_unpack name)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__30) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__30)) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__30)) then true else (dtb__30 = 95)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__31) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__32) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__33) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment = (fun seg -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars (Base_dList.dtp_unpack seg)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment dtb__34) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments dtb__35) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__36) -> (if (dtb__36 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "package name must not be empty"))) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName dtb__36) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["invalid package name \""; dtb__36; "\" (allowed characters: a-z, 0-9, '-')"]))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "missing [package] name")))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (if (dtb__37 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "workspace member must not be empty"))) else ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers mc0) dtb__38))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__39) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__40) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["invalid export module \""; dtb__39; "\" (segments must match [A-Z][A-Za-z0-9_]*)"])))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__41) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__41)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = dtb__45 } -> (if (dtb__44 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "dependency name must not be empty"))) else (if (dtb__45 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["dependency \""; dtb__44; "\" path must not be empty"])))) else (if ((Base_dList.v_Base_dList_dmemName dtb__44) mc1) then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["duplicate dependency \""; dtb__44; "\""])))) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__44, mc1))) dtb__43))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies = (fun path deps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) Base_dList.C_Base_dList_dList_Nil) deps))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if (dtb__46 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "capability name must not be empty"))) else (if ((Base_dList.v_Base_dList_dmemName dtb__46) mc1) then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["duplicate capability \""; dtb__46; "\""])))) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__46, mc1))) dtb__47)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities = (fun path caps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen path) Base_dList.C_Base_dList_dList_Nil) caps))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidTrustPointName = (fun name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = dtb__49 } -> (if (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__48)) then (dtb__49 <> "") else false) then (dtb__49 <> "_") else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrustEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (dtb__50 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "trust point name must not be empty"))) else (if ((Base_dList.v_Base_dList_dmemName dtb__50) mc1) then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["duplicate trust point \""; dtb__50; "\""])))) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidTrustPointName dtb__50) then (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrustEntries mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__50, mc1))) dtb__51) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["invalid trust point \""; dtb__50; "\" (expected a qualified definition name such as \"Base.IO.runIO\")"])))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrust = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> (if ((Base_dList.v_Base_dList_dmemName "unsafe") mc1) then (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrustEntries mc0) Base_dList.C_Base_dList_dList_Nil) dtb__52) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "[trust] unsafe requires capability \"unsafe\" in [capabilities] effects"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidatePrivilege = (fun mc0 mc1 mc2 mc3 mc4 -> (if mc1 then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) mc4) else (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "non-privileged package declares [capabilities]/[trust]/[privileged]; only [package] privileged = true packages may declare capabilities, trust points or host-layer modules (user code should use Base.Eff.* handlers)")))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "non-privileged package declares [capabilities]/[trust]/[privileged]; only [package] privileged = true packages may declare capabilities, trust points or host-layer modules (user code should use Base.Eff.* handlers)")))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "non-privileged package declares [capabilities]/[trust]/[privileged]; only [package] privileged = true packages may declare capabilities, trust points or host-layer modules (user code should use Base.Eff.* handlers)")))
)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__53; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__54; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__55; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__56; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities = dtb__57; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe = dtb__58; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged = dtb__59; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules = dtb__60; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__61 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName dtb__61) dtb__53)) (fun okName -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers dtb__61) dtb__54)) (fun okMembers -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports dtb__61) dtb__55)) (fun okExports -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies dtb__61) dtb__56)) (fun okDeps -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities dtb__61) dtb__57)) (fun okCaps -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrust dtb__61) dtb__57) dtb__58)) (fun okTrust -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dFrontend_dManifest_dvalidatePrivilege dtb__61) dtb__59) dtb__57) dtb__58) dtb__60)) (fun okPriv -> (Base_dResult.C_Base_dResult_dResult_Ok ({ f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__53; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__54; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__55; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__56; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities = dtb__57; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe = dtb__58; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged = dtb__59; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules = dtb__60; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__61 }))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_ddirResult = (fun dir -> (if (dir = "") then "/" else dir))

let rec v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (if (dtb__62 = 47) then (v_Vuna_dCompiler_dFrontend_dManifest_ddirResult (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse dtb__63))) else (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev dtb__63))
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir = (fun path -> (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))))

let v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath = (fun manifest rel -> ((fun dir -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then rel else (if (dir = ".") then rel else (String.concat "" [dir; "/"; rel])))) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (manifest).f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath)))
