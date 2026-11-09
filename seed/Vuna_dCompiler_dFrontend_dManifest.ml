open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dManifest_dManifest = C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest of (string Base_dMaybe.t_Base_dMaybe_dMaybe) * (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe) * ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe) * (string)

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

let v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__9) -> dtb__9
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_TomlEntry (dtb__10, dtb__11, dtb__12, dtb__13) -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__10) Base_dList.C_Base_dList_dList_Nil) then (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__13) (String.concat "" ["unexpected top-level key \""; dtb__11; "\""])))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__10) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__11 = "name") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__13) (String.concat "" ["unknown key \""; dtb__11; "\" in [package]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__10) (Base_dList.C_Base_dList_dList_Cons ("workspace", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__11 = "members") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__13) (String.concat "" ["unknown key \""; dtb__11; "\" in [workspace]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__10) (Base_dList.C_Base_dList_dList_Cons ("export", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__11 = "modules") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__13) (String.concat "" ["unknown key \""; dtb__11; "\" in [export]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__10) (Base_dList.C_Base_dList_dList_Cons ("capabilities", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__11 = "effects") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__13) (String.concat "" ["unknown key \""; dtb__11; "\" in [capabilities]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__10) (Base_dList.C_Base_dList_dList_Cons ("trust", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__11 = "unsafe") then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__13) (String.concat "" ["unknown key \""; dtb__11; "\" in [trust]"]))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__10) (Base_dList.C_Base_dList_dList_Cons ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__13) (String.concat "" ["unknown section ["; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__10); "]"])))))))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry mc0) dtb__14) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__16) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__16))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__17) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries mc0) dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_TomlEntry (dtb__20, dtb__21, dtb__22, dtb__23) -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__20) (Base_dList.C_Base_dList_dList_Cons ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__24) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc mc0) dtb__19) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__21, dtb__24)), mc2)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__23) (String.concat "" ["dependency \""; dtb__21; "\" must have a string relative path"]))))
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc mc0) dtb__19) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies = (fun path entries -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) entries) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest = (fun path entries -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) entries)) (fun checked -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) "name") entries)) (fun name -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("workspace", Base_dList.C_Base_dList_dList_Nil))) "members") entries)) (fun members -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("export", Base_dList.C_Base_dList_dList_Nil))) "modules") entries)) (fun exports -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies path) entries)) (fun deps -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("capabilities", Base_dList.C_Base_dList_dList_Nil))) "effects") entries)) (fun caps -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("trust", Base_dList.C_Base_dList_dList_Nil))) "unsafe") entries)) (fun trust -> (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (name, (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members), exports, deps, (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList caps), trust, path)))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest = (fun path contents -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt path) contents)) (fun entries -> ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest path) entries))))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__25) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__25)) then true else (dtb__25 = 45)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars dtb__26) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars (Base_dList.dtp_unpack name)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (if (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__27) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__27)) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__27)) then true else (dtb__27 = 95)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__28) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__29) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__30) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment = (fun seg -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars (Base_dList.dtp_unpack seg)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment dtb__31) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments dtb__32) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__33) -> (if (dtb__33 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "package name must not be empty"))) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName dtb__33) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["invalid package name \""; dtb__33; "\" (allowed characters: a-z, 0-9, '-')"]))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "missing [package] name")))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (if (dtb__34 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "workspace member must not be empty"))) else ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers mc0) dtb__35))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__36) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__37) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["invalid export module \""; dtb__36; "\" (segments must match [A-Z][A-Za-z0-9_]*)"])))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__38)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (match dtb__39 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__41, dtb__42) -> (if (dtb__41 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "dependency name must not be empty"))) else (if (dtb__42 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["dependency \""; dtb__41; "\" path must not be empty"])))) else (if ((Base_dList.v_Base_dList_dmemName dtb__41) mc1) then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["duplicate dependency \""; dtb__41; "\""])))) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__41, mc1))) dtb__40))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies = (fun path deps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) Base_dList.C_Base_dList_dList_Nil) deps))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (if (dtb__43 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "capability name must not be empty"))) else (if ((Base_dList.v_Base_dList_dmemName dtb__43) mc1) then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["duplicate capability \""; dtb__43; "\""])))) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__43, mc1))) dtb__44)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities = (fun path caps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen path) Base_dList.C_Base_dList_dList_Nil) caps))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidTrustPointName = (fun name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__45, dtb__46) -> (if (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__45)) then (dtb__46 <> "") else false) then (dtb__46 <> "_") else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrustEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (if (dtb__47 = "") then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "trust point name must not be empty"))) else (if ((Base_dList.v_Base_dList_dmemName dtb__47) mc1) then (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["duplicate trust point \""; dtb__47; "\""])))) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidTrustPointName dtb__47) then (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrustEntries mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__47, mc1))) dtb__48) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) (String.concat "" ["invalid trust point \""; dtb__47; "\" (expected a qualified definition name such as \"Base.IO.runIO\")"])))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrust = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> (if ((Base_dList.v_Base_dList_dmemName "unsafe") mc1) then (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrustEntries mc0) Base_dList.C_Base_dList_dList_Nil) dtb__49) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "[trust] unsafe requires capability \"unsafe\" in [capabilities] effects"))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName dtb__56) dtb__50)) (fun okName -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers dtb__56) dtb__51)) (fun okMembers -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports dtb__56) dtb__52)) (fun okExports -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies dtb__56) dtb__53)) (fun okDeps -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities dtb__56) dtb__54)) (fun okCaps -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrust dtb__56) dtb__54) dtb__55)) (fun okTrust -> (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_ddirResult = (fun dir -> (if (dir = "") then "/" else dir))

let rec v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if (dtb__57 = 47) then (v_Vuna_dCompiler_dFrontend_dManifest_ddirResult (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse dtb__58))) else (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev dtb__58))
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir = (fun path -> (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))))

let v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath = (fun manifest rel -> ((fun dir -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then rel else (if (dir = ".") then rel else (String.concat "" [dir; "/"; rel])))) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (match manifest with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__65
  | _ -> failwith "DT: impossible branch"
))))
