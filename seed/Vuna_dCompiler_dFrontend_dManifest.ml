open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
type t_Vuna_dCompiler_dFrontend_dManifest_dManifest = C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest of (string t_Base_dMaybe_dMaybe) * (string t_Base_dMaybe_dMaybe) * (string t_Base_dMaybe_dMaybe) * (string t_Base_dList_dList) * (string t_Base_dList_dList t_Base_dMaybe_dMaybe) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList) * (string)

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestVersion = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestEdition = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestMembers = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestExports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> dtb__36
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDependencies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestPath = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> dtb__63
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar = (fun c -> (if ((bi_ge_int c) 48) then ((bi_le_int c) 57) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar = (fun c -> (if ((bi_ge_int c) 65) then ((bi_le_int c) 90) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar = (fun c -> (if ((bi_ge_int c) 97) then ((bi_le_int c) 122) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_datLine = (fun path -> (fun line -> (fun msg -> (if ((bi_eq_str path) "") then ((bi_concat "line ") ((bi_concat (bi_strFromInt line)) ((bi_concat ": ") msg))) else ((bi_concat path) ((bi_concat ":") ((bi_concat (bi_strFromInt line)) ((bi_concat ": ") msg))))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr = (fun path -> (fun msg -> (if ((bi_eq_str path) "") then msg else ((bi_concat path) ((bi_concat ": ") msg)))))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dsameSection = (fun d347 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> (if (((v_Base_dEq_deq d347) dtb__64) dtb__66) then (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection d347) dtb__65) dtb__67) else false)
  | _ -> false
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc = (fun path -> (fun section -> (fun key -> (fun entries -> (match (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__68) -> (if ((bi_eq_str path) "") then ((bi_concat "line ") ((bi_concat (bi_strFromInt dtb__68)) ": ")) else ((bi_concat path) ((bi_concat ":") ((bi_concat (bi_strFromInt dtb__68)) ": "))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((bi_eq_str path) "") then "" else ((bi_concat path) ": "))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringField = (fun path -> (fun section -> (fun key -> (fun entries -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__69) -> (match dtb__69 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr (dtb__70) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__70))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc path) section) key) entries)) ((bi_concat "expected a string for \"") ((bi_concat key) "\"")))))
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringListField = (fun path -> (fun section -> (fun key -> (fun entries -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71) -> (match dtb__71 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList (dtb__72) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__72))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc path) section) key) entries)) ((bi_concat "expected an array of strings for \"") ((bi_concat key) "\"")))))
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList = (fun maybe -> (match maybe with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__73) -> dtb__73
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__74, dtb__75, dtb__76, dtb__77) -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) dtb__74) C_Base_dList_dList_Base_dList_dNil) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__77) ((bi_concat "unexpected top-level key \"") ((bi_concat dtb__75) "\""))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) dtb__74) (C_Base_dList_dList_Base_dList_dCons ("package", C_Base_dList_dList_Base_dList_dNil))) then (if (if (if ((bi_eq_str dtb__75) "name") then true else ((bi_eq_str dtb__75) "version")) then true else ((bi_eq_str dtb__75) "edition")) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__77) ((bi_concat "unknown key \"") ((bi_concat dtb__75) "\" in [package]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) dtb__74) (C_Base_dList_dList_Base_dList_dCons ("workspace", C_Base_dList_dList_Base_dList_dNil))) then (if ((bi_eq_str dtb__75) "members") then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__77) ((bi_concat "unknown key \"") ((bi_concat dtb__75) "\" in [workspace]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) dtb__74) (C_Base_dList_dList_Base_dList_dCons ("export", C_Base_dList_dList_Base_dList_dNil))) then (if ((bi_eq_str dtb__75) "modules") then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__77) ((bi_concat "unknown key \"") ((bi_concat dtb__75) "\" in [export]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) dtb__74) (C_Base_dList_dList_Base_dList_dCons ("capabilities", C_Base_dList_dList_Base_dList_dNil))) then (if ((bi_eq_str dtb__75) "effects") then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__77) ((bi_concat "unknown key \"") ((bi_concat dtb__75) "\" in [capabilities]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) dtb__74) (C_Base_dList_dList_Base_dList_dCons ("dependencies", C_Base_dList_dList_Base_dList_dNil))) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__77) ((bi_concat "unknown section [") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__74)) "]")))))))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries = (fun path -> (fun entries -> (match entries with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Base_dList_dCons (dtb__78, dtb__79) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry path) dtb__78) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__80) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__80))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__81) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) dtb__79)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc = (fun path -> (fun entries -> (fun acc -> (match entries with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse acc)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (match dtb__82 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__84, dtb__85, dtb__86, dtb__87) -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) dtb__84) (C_Base_dList_dList_Base_dList_dCons ("dependencies", C_Base_dList_dList_Base_dList_dNil))) then (match dtb__86 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr (dtb__88) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) dtb__83) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__85, dtb__88)), acc)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine path) dtb__87) ((bi_concat "dependency \"") ((bi_concat dtb__85) "\" must have a string relative path")))))
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) dtb__83) acc))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies = (fun path -> (fun entries -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) entries) C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest = (fun path -> (fun entries -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) entries)) (fun checked -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (C_Base_dList_dList_Base_dList_dCons ("package", C_Base_dList_dList_Base_dList_dNil))) "name") entries)) (fun name -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (C_Base_dList_dList_Base_dList_dCons ("package", C_Base_dList_dList_Base_dList_dNil))) "version") entries)) (fun version -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (C_Base_dList_dList_Base_dList_dCons ("package", C_Base_dList_dList_Base_dList_dNil))) "edition") entries)) (fun edition -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (C_Base_dList_dList_Base_dList_dCons ("workspace", C_Base_dList_dList_Base_dList_dNil))) "members") entries)) (fun members -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (C_Base_dList_dList_Base_dList_dCons ("export", C_Base_dList_dList_Base_dList_dNil))) "modules") entries)) (fun exports -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies path) entries)) (fun deps -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (C_Base_dList_dList_Base_dList_dCons ("capabilities", C_Base_dList_dList_Base_dList_dNil))) "effects") entries)) (fun caps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (name, version, edition, (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members), exports, deps, (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList caps), path))))))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest = (fun path -> (fun contents -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt path) contents)) (fun entries -> ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest path) entries)))))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__89) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__89)) then true else ((bi_eq_int dtb__89) 45)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars dtb__90) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars (dtp_unpack name)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__91, dtb__92) -> (if (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__91) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__91)) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__91)) then true else ((bi_eq_int dtb__91) 95)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__92) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__93) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__94) else false)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment = (fun seg -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars (dtp_unpack seg)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__95, dtb__96) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment dtb__95) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments dtb__96) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments (v_Vuna_dCompiler_dCommon_dsplitOnDot name)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName = (fun path -> (fun name -> (match name with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "missing [package] name")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__97) -> (if ((bi_eq_str dtb__97) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "package name must not be empty"))) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName dtb__97) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) ((bi_concat "invalid package name \"") ((bi_concat dtb__97) "\" (allowed characters: a-z, 0-9, '-')")))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateVersion = (fun path -> (fun version -> (match version with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "missing [package] version")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> (if ((bi_eq_str dtb__98) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "package version must not be empty"))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateEdition = (fun path -> (fun edition -> (match edition with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__99) -> (if ((bi_eq_str dtb__99) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "package edition must not be empty"))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers = (fun path -> (fun members -> (match members with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (if ((bi_eq_str dtb__100) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "workspace member must not be empty"))) else ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers path) dtb__101))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules = (fun path -> (fun modules -> (match modules with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Base_dList_dCons (dtb__102, dtb__103) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__102) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules path) dtb__103) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) ((bi_concat "invalid export module \"") ((bi_concat dtb__102) "\" (segments must match [A-Z][A-Za-z0-9_]*)"))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports = (fun path -> (fun exports -> (match exports with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__104) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules path) dtb__104)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen = (fun path -> (fun seen -> (fun deps -> (match deps with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match dtb__105 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> (if ((bi_eq_str dtb__107) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "dependency name must not be empty"))) else (if ((bi_eq_str dtb__108) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) ((bi_concat "dependency \"") ((bi_concat dtb__107) "\" path must not be empty"))))) else (if ((v_Base_dList_dmemName dtb__107) seen) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) ((bi_concat "duplicate dependency \"") ((bi_concat dtb__107) "\""))))) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) (C_Base_dList_dList_Base_dList_dCons (dtb__107, seen))) dtb__106))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies = (fun path -> (fun deps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) C_Base_dList_dList_Base_dList_dNil) deps)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen = (fun path -> (fun seen -> (fun caps -> (match caps with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (if ((bi_eq_str dtb__109) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "capability name must not be empty"))) else (if ((v_Base_dList_dmemName dtb__109) seen) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) ((bi_concat "duplicate capability \"") ((bi_concat dtb__109) "\""))))) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen path) (C_Base_dList_dList_Base_dList_dCons (dtb__109, seen))) dtb__110)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities = (fun path -> (fun caps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen path) C_Base_dList_dList_Base_dList_dNil) caps)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName dtb__118) dtb__111)) (fun okName -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateVersion dtb__118) dtb__112)) (fun okVersion -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateEdition dtb__118) dtb__113)) (fun okEdition -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers dtb__118) dtb__114)) (fun okMembers -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports dtb__118) dtb__115)) (fun okExports -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies dtb__118) dtb__116)) (fun okDeps -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities dtb__118) dtb__117)) (fun okCaps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_ddirResult = (fun dir -> (if ((bi_eq_str dir) "") then "/" else dir))

let rec v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__120) -> (if ((bi_eq_int dtb__119) 47) then (v_Vuna_dCompiler_dFrontend_dManifest_ddirResult (dtp_pack (v_Base_dList_dreverse dtb__120))) else (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev dtb__120))
  | C_Base_dList_dList_Base_dList_dNil -> "."
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir = (fun path -> (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev (v_Base_dList_dreverse (dtp_unpack path))))

let v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath = (fun manifest -> (fun rel -> ((fun dir -> (if ((v_Base_dString_dstartsWith "/") rel) then rel else (if ((bi_eq_str dir) ".") then rel else ((bi_concat dir) ((bi_concat "/") rel))))) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestPath manifest)))))
