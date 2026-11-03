open Vuna_runtime
open Vuna_builtins
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
type t_Vuna_dCompiler_dFrontend_dManifest_dManifest = C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest of (string t_Base_dMaybe_dMaybe) * (string t_Base_dMaybe_dMaybe) * (string t_Base_dMaybe_dMaybe) * (string t_Base_dList_dList) * (string t_Base_dList_dList t_Base_dMaybe_dMaybe) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * (string)

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4, dtb__5, dtb__6) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestVersion = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__7, dtb__8, dtb__9, dtb__10, dtb__11, dtb__12, dtb__13) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestEdition = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestMembers = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestExports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> dtb__32
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDependencies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__40
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestPath = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> dtb__48
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar = (fun c -> (if ((bi_ge_int c) 48) then ((bi_le_int c) 57) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar = (fun c -> (if ((bi_ge_int c) 65) then ((bi_le_int c) 90) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar = (fun c -> (if ((bi_ge_int c) 97) then ((bi_le_int c) 122) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_datLine = (fun path -> (fun line -> (fun msg -> (if ((bi_eq_str path) "") then ((bi_concat "line ") ((bi_concat (bi_strFromInt line)) ((bi_concat ": ") msg))) else ((bi_concat path) ((bi_concat ":") ((bi_concat (bi_strFromInt line)) ((bi_concat ": ") msg))))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr = (fun path -> (fun msg -> (if ((bi_eq_str path) "") then msg else ((bi_concat path) ((bi_concat ": ") msg)))))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dsameSection = (fun d268 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (if (((v_Base_dEq_deq d268) dtb__49) dtb__51) then (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection d268) dtb__50) dtb__52) else false)
  | _ -> false
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc = (fun path -> (fun section -> (fun key -> (fun entries -> (match (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__53) -> (if ((bi_eq_str path) "") then ((bi_concat "line ") ((bi_concat (bi_strFromInt dtb__53)) ": ")) else ((bi_concat path) ((bi_concat ":") ((bi_concat (bi_strFromInt dtb__53)) ": "))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((bi_eq_str path) "") then "" else ((bi_concat path) ": "))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringField = (fun path -> (fun section -> (fun key -> (fun entries -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__54) -> (match dtb__54 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr (dtb__55) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__55))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc path) section) key) entries)) ((bi_concat "expected a string for \"") ((bi_concat key) "\"")))))
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringListField = (fun path -> (fun section -> (fun key -> (fun entries -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__56) -> (match dtb__56 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList (dtb__57) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__57))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc path) section) key) entries)) ((bi_concat "expected an array of strings for \"") ((bi_concat key) "\"")))))
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList = (fun maybe -> (match maybe with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__58) -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__59, dtb__60, dtb__61, dtb__62) -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) dtb__59) C_Base_dList_dList_Nil) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__62) ((bi_concat "unexpected top-level key \"") ((bi_concat dtb__60) "\""))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) dtb__59) (C_Base_dList_dList_Cons ("package", C_Base_dList_dList_Nil))) then (if (if (if ((bi_eq_str dtb__60) "name") then true else ((bi_eq_str dtb__60) "version")) then true else ((bi_eq_str dtb__60) "edition")) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__62) ((bi_concat "unknown key \"") ((bi_concat dtb__60) "\" in [package]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) dtb__59) (C_Base_dList_dList_Cons ("workspace", C_Base_dList_dList_Nil))) then (if ((bi_eq_str dtb__60) "members") then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__62) ((bi_concat "unknown key \"") ((bi_concat dtb__60) "\" in [workspace]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) dtb__59) (C_Base_dList_dList_Cons ("export", C_Base_dList_dList_Nil))) then (if ((bi_eq_str dtb__60) "modules") then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__62) ((bi_concat "unknown key \"") ((bi_concat dtb__60) "\" in [export]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) dtb__59) (C_Base_dList_dList_Cons ("dependencies", C_Base_dList_dList_Nil))) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__62) ((bi_concat "unknown section [") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__59)) "]"))))))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries = (fun path -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry path) dtb__63) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__65) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__65))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__66) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) dtb__64)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc = (fun path -> (fun entries -> (fun acc -> (match entries with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse acc)))
  | C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (match dtb__67 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__69, dtb__70, dtb__71, dtb__72) -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) dtb__69) (C_Base_dList_dList_Cons ("dependencies", C_Base_dList_dList_Nil))) then (match dtb__71 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr (dtb__73) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) dtb__68) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__70, dtb__73)), acc)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine path) dtb__72) ((bi_concat "dependency \"") ((bi_concat dtb__70) "\" must have a string relative path")))))
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) dtb__68) acc))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies = (fun path -> (fun entries -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) entries) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest = (fun path -> (fun entries -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) entries)) (fun checked -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (C_Base_dList_dList_Cons ("package", C_Base_dList_dList_Nil))) "name") entries)) (fun name -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (C_Base_dList_dList_Cons ("package", C_Base_dList_dList_Nil))) "version") entries)) (fun version -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (C_Base_dList_dList_Cons ("package", C_Base_dList_dList_Nil))) "edition") entries)) (fun edition -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (C_Base_dList_dList_Cons ("workspace", C_Base_dList_dList_Nil))) "members") entries)) (fun members -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (C_Base_dList_dList_Cons ("export", C_Base_dList_dList_Nil))) "modules") entries)) (fun exports -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies path) entries)) (fun deps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (name, version, edition, (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members), exports, deps, path))))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest = (fun path -> (fun contents -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt path) contents)) (fun entries -> ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest path) entries)))))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__74) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__74)) then true else ((bi_eq_int dtb__74) 45)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars dtb__75) else false)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars (dtp_unpack name)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (if (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__76) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__76)) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__76)) then true else ((bi_eq_int dtb__76) 95)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__77) else false)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__78) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__79) else false)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment = (fun seg -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars (dtp_unpack seg)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment dtb__80) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments dtb__81) else false)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments (v_Vuna_dCompiler_dCommon_dsplitOnDot name)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName = (fun path -> (fun name -> (match name with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "missing [package] name")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> (if ((bi_eq_str dtb__82) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "package name must not be empty"))) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName dtb__82) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) ((bi_concat "invalid package name \"") ((bi_concat dtb__82) "\" (allowed characters: a-z, 0-9, '-')")))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateVersion = (fun path -> (fun version -> (match version with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "missing [package] version")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> (if ((bi_eq_str dtb__83) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "package version must not be empty"))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateEdition = (fun path -> (fun edition -> (match edition with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__84) -> (if ((bi_eq_str dtb__84) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "package edition must not be empty"))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers = (fun path -> (fun members -> (match members with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Cons (dtb__85, dtb__86) -> (if ((bi_eq_str dtb__85) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "workspace member must not be empty"))) else ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers path) dtb__86))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules = (fun path -> (fun modules -> (match modules with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__87) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules path) dtb__88) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) ((bi_concat "invalid export module \"") ((bi_concat dtb__87) "\" (segments must match [A-Z][A-Za-z0-9_]*)"))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports = (fun path -> (fun exports -> (match exports with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules path) dtb__89)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen = (fun path -> (fun seen -> (fun deps -> (match deps with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match dtb__90 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (if ((bi_eq_str dtb__92) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) "dependency name must not be empty"))) else (if ((bi_eq_str dtb__93) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) ((bi_concat "dependency \"") ((bi_concat dtb__92) "\" path must not be empty"))))) else (if ((v_Base_dList_dmemName dtb__92) seen) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr path) ((bi_concat "duplicate dependency \"") ((bi_concat dtb__92) "\""))))) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) (C_Base_dList_dList_Cons (dtb__92, seen))) dtb__91))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies = (fun path -> (fun deps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) C_Base_dList_dList_Nil) deps)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName dtb__100) dtb__94)) (fun okName -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateVersion dtb__100) dtb__95)) (fun okVersion -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateEdition dtb__100) dtb__96)) (fun okEdition -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers dtb__100) dtb__97)) (fun okMembers -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports dtb__100) dtb__98)) (fun okExports -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies dtb__100) dtb__99)) (fun okDeps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_ddirResult = (fun dir -> (if ((bi_eq_str dir) "") then "/" else dir))

let rec v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if ((bi_eq_int dtb__101) 47) then (v_Vuna_dCompiler_dFrontend_dManifest_ddirResult (dtp_pack (v_Base_dList_dreverse dtb__102))) else (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev dtb__102))
  | C_Base_dList_dList_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir = (fun path -> (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev (v_Base_dList_dreverse (dtp_unpack path))))

let v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath = (fun manifest -> (fun rel -> ((fun dir -> (if ((v_Base_dString_dstartsWith "/") rel) then rel else (if ((bi_eq_str dir) ".") then rel else ((bi_concat dir) ((bi_concat "/") rel))))) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestPath manifest)))))
