open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
type t_Vuna_dCompiler_dFrontend_dManifest_dManifest = C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest of (string t_Base_dMaybe_dMaybe) * (string t_Base_dList_dList) * (string t_Base_dList_dList t_Base_dMaybe_dMaybe) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList) * (string)

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestMembers = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__6, dtb__7, dtb__8, dtb__9, dtb__10, dtb__11) -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestExports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__12, dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDependencies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> dtb__21
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestPath = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar = (fun c -> (if ((bi_ge_int c) 48) then ((bi_le_int c) 57) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar = (fun c -> (if ((bi_ge_int c) 65) then ((bi_le_int c) 90) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar = (fun c -> (if ((bi_ge_int c) 97) then ((bi_le_int c) 122) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_datLine = (fun path -> (fun line -> (fun msg -> (if ((bi_eq_str path) "") then ((bi_concat "line ") ((bi_concat (bi_strFromInt line)) ((bi_concat ": ") msg))) else ((bi_concat path) ((bi_concat ":") ((bi_concat (bi_strFromInt line)) ((bi_concat ": ") msg))))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr = (fun path -> (fun msg -> (if ((bi_eq_str path) "") then msg else ((bi_concat path) ((bi_concat ": ") msg)))))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dsameSection = (fun d348 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__38, dtb__39) -> (if (((v_Base_dEq_deq d348) dtb__36) dtb__38) then (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection d348) dtb__37) dtb__39) else false)
  | _ -> false
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc = (fun path -> (fun section -> (fun key -> (fun entries -> (match (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__40) -> (if ((bi_eq_str path) "") then ((bi_concat "line ") ((bi_concat (bi_strFromInt dtb__40)) ": ")) else ((bi_concat path) ((bi_concat ":") ((bi_concat (bi_strFromInt dtb__40)) ": "))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((bi_eq_str path) "") then "" else ((bi_concat path) ": "))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringField = (fun path -> (fun section -> (fun key -> (fun entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> (match dtb__41 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr (dtb__42) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__42))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc path) section) key) entries)) ((bi_concat "expected a string for \"") ((bi_concat key) "\"")))))
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringListField = (fun path -> (fun section -> (fun key -> (fun entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__43) -> (match dtb__43 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList (dtb__44) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__44))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc path) section) key) entries)) ((bi_concat "expected an array of strings for \"") ((bi_concat key) "\"")))))
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList = (fun mc0 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__45) -> dtb__45
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__46, dtb__47, dtb__48, dtb__49) -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Eq_uString) dtb__46) C_Base_dList_dList_Base_dList_dNil) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__49) ((bi_concat "unexpected top-level key \"") ((bi_concat dtb__47) "\""))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Eq_uString) dtb__46) (C_Base_dList_dList_Base_dList_dCons ("package", C_Base_dList_dList_Base_dList_dNil))) then (if ((bi_eq_str dtb__47) "name") then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__49) ((bi_concat "unknown key \"") ((bi_concat dtb__47) "\" in [package]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Eq_uString) dtb__46) (C_Base_dList_dList_Base_dList_dCons ("workspace", C_Base_dList_dList_Base_dList_dNil))) then (if ((bi_eq_str dtb__47) "members") then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__49) ((bi_concat "unknown key \"") ((bi_concat dtb__47) "\" in [workspace]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Eq_uString) dtb__46) (C_Base_dList_dList_Base_dList_dCons ("export", C_Base_dList_dList_Base_dList_dNil))) then (if ((bi_eq_str dtb__47) "modules") then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__49) ((bi_concat "unknown key \"") ((bi_concat dtb__47) "\" in [export]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Eq_uString) dtb__46) (C_Base_dList_dList_Base_dList_dCons ("capabilities", C_Base_dList_dList_Base_dList_dNil))) then (if ((bi_eq_str dtb__47) "effects") then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__49) ((bi_concat "unknown key \"") ((bi_concat dtb__47) "\" in [capabilities]")))))) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Eq_uString) dtb__46) (C_Base_dList_dList_Base_dList_dCons ("dependencies", C_Base_dList_dList_Base_dList_dNil))) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__49) ((bi_concat "unknown section [") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__46)) "]")))))))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry mc0) dtb__50) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__52) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__52))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__53) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries mc0) dtb__51)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match dtb__54 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__56, dtb__57, dtb__58, dtb__59) -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection v_Eq_uString) dtb__56) (C_Base_dList_dList_Base_dList_dCons ("dependencies", C_Base_dList_dList_Base_dList_dNil))) then (match dtb__58 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr (dtb__60) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc mc0) dtb__55) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__60)), mc2)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dManifest_datLine mc0) dtb__59) ((bi_concat "dependency \"") ((bi_concat dtb__57) "\" must have a string relative path")))))
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc mc0) dtb__55) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies = (fun path -> (fun entries -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) entries) C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest = (fun path -> (fun entries -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) entries)) (fun checked -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (C_Base_dList_dList_Base_dList_dCons ("package", C_Base_dList_dList_Base_dList_dNil))) "name") entries)) (fun name -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (C_Base_dList_dList_Base_dList_dCons ("workspace", C_Base_dList_dList_Base_dList_dNil))) "members") entries)) (fun members -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (C_Base_dList_dList_Base_dList_dCons ("export", C_Base_dList_dList_Base_dList_dNil))) "modules") entries)) (fun exports -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies path) entries)) (fun deps -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (C_Base_dList_dList_Base_dList_dCons ("capabilities", C_Base_dList_dList_Base_dList_dNil))) "effects") entries)) (fun caps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (name, (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members), exports, deps, (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList caps), path))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest = (fun path -> (fun contents -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt path) contents)) (fun entries -> ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest path) entries)))))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__61) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__61)) then true else ((bi_eq_int dtb__61) 45)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars dtb__62) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars (dtp_unpack name)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__63, dtb__64) -> (if (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__63) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__63)) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__63)) then true else ((bi_eq_int dtb__63) 95)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__64) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__65, dtb__66) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__65) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__66) else false)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment = (fun seg -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars (dtp_unpack seg)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment dtb__67) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments dtb__68) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments (v_Vuna_dCompiler_dCommon_dsplitOnDot name)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__69) -> (if ((bi_eq_str dtb__69) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "package name must not be empty"))) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName dtb__69) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) ((bi_concat "invalid package name \"") ((bi_concat dtb__69) "\" (allowed characters: a-z, 0-9, '-')")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "missing [package] name")))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> (if ((bi_eq_str dtb__70) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "workspace member must not be empty"))) else ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers mc0) dtb__71))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__72) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__73) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) ((bi_concat "invalid export module \"") ((bi_concat dtb__72) "\" (segments must match [A-Z][A-Za-z0-9_]*)"))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__74) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__74)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> (match dtb__75 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (if ((bi_eq_str dtb__77) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "dependency name must not be empty"))) else (if ((bi_eq_str dtb__78) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) ((bi_concat "dependency \"") ((bi_concat dtb__77) "\" path must not be empty"))))) else (if ((v_Base_dList_dmemName dtb__77) mc1) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) ((bi_concat "duplicate dependency \"") ((bi_concat dtb__77) "\""))))) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen mc0) (C_Base_dList_dList_Base_dList_dCons (dtb__77, mc1))) dtb__76))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies = (fun path -> (fun deps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) C_Base_dList_dList_Base_dList_dNil) deps)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (if ((bi_eq_str dtb__79) "") then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) "capability name must not be empty"))) else (if ((v_Base_dList_dmemName dtb__79) mc1) then (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr mc0) ((bi_concat "duplicate capability \"") ((bi_concat dtb__79) "\""))))) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen mc0) (C_Base_dList_dList_Base_dList_dCons (dtb__79, mc1))) dtb__80)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities = (fun path -> (fun caps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen path) C_Base_dList_dList_Base_dList_dNil) caps)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName dtb__86) dtb__81)) (fun okName -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers dtb__86) dtb__82)) (fun okMembers -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports dtb__86) dtb__83)) (fun okExports -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies dtb__86) dtb__84)) (fun okDeps -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities dtb__86) dtb__85)) (fun okCaps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_ddirResult = (fun dir -> (if ((bi_eq_str dir) "") then "/" else dir))

let rec v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__87, dtb__88) -> (if ((bi_eq_int dtb__87) 47) then (v_Vuna_dCompiler_dFrontend_dManifest_ddirResult (dtp_pack (v_Base_dList_dreverse dtb__88))) else (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev dtb__88))
  | C_Base_dList_dList_Base_dList_dNil -> "."
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir = (fun path -> (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev (v_Base_dList_dreverse (dtp_unpack path))))

let v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath = (fun manifest -> (fun rel -> ((fun dir -> (if ((v_Base_dString_dstartsWith "/") rel) then rel else (if ((bi_eq_str dir) ".") then rel else ((bi_concat dir) ((bi_concat "/") rel))))) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestPath manifest)))))
