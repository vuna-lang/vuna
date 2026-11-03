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
open Vuna_dCompiler_dFrontend_dManifest
type t_Vuna_dCompiler_dPackages_dPkg_dRoot = C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot of (string) * (string) * (string t_Base_dList_dList t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dPackages_dPkg_dPackage = C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage of (t_Vuna_dCompiler_dFrontend_dManifest_dManifest) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage t_Base_dList_dList) * (string)

let v_Vuna_dCompiler_dPackages_dPkg_drootDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (dtb__0, dtb__1, dtb__2) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (dtb__3, dtb__4, dtb__5) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootPackage = (fun root -> (v_Vuna_dCompiler_dPackages_dPkg_drootName root))

let v_Vuna_dCompiler_dPackages_dPkg_drootExports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (dtb__6, dtb__7, dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__9, dtb__10, dtb__11) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__12, dtb__13, dtb__14) -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__15, dtb__16, dtb__17) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageName = (fun package -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestName (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest package)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__18) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageExports = (fun package -> (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestExports (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest package)))

let rec v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars = (fun chars -> (fun acc -> (fun seg -> (match chars with
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse (C_Base_dList_dList_Cons ((dtp_pack (v_Base_dList_dreverse seg)), acc)))
  | C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (if ((bi_eq_int dtb__19) 47) then (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__20) (C_Base_dList_dList_Cons ((dtp_pack (v_Base_dList_dreverse seg)), acc))) C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__20) acc) (C_Base_dList_dList_Cons (dtb__19, seg))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash = (fun path -> (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars (dtp_unpack path)) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dPackages_dPkg_dnormalizeParent = (fun absolute -> (fun acc -> (fun rest -> (match acc with
  | C_Base_dList_dList_Nil -> (if absolute then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) rest) C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) rest) (C_Base_dList_dList_Cons ("..", C_Base_dList_dList_Nil))))
  | C_Base_dList_dList_Cons (dtb__21, dtb__22) -> (if ((bi_eq_str dtb__21) "..") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) rest) (C_Base_dList_dList_Cons ("..", acc))) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) rest) dtb__22))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc = (fun absolute -> (fun segments -> (fun acc -> (match segments with
  | C_Base_dList_dList_Nil -> acc
  | C_Base_dList_dList_Cons (dtb__23, dtb__24) -> (if ((bi_eq_str dtb__23) "") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__24) acc) else (if ((bi_eq_str dtb__23) ".") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__24) acc) else (if ((bi_eq_str dtb__23) "..") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeParent absolute) acc) dtb__24) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__24) (C_Base_dList_dList_Cons (dtb__23, acc))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir = (fun path -> (if ((v_Base_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) C_Base_dList_dList_Nil) with
  | C_Base_dList_dList_Nil -> "/"
  | dtb__25 -> ((bi_concat "/") (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Base_dList_dreverse dtb__25)))
) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) C_Base_dList_dList_Nil) with
  | C_Base_dList_dList_Nil -> "."
  | dtb__26 -> (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Base_dList_dreverse dtb__26))
)))

let v_Vuna_dCompiler_dPackages_dPkg_drawRoot = (fun dir -> (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot ((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir dir), "", C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))

let v_Vuna_dCompiler_dPackages_dPkg_djoinPath = (fun base -> (fun rel -> (if ((v_Base_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir ((bi_concat base) ((bi_concat "/") rel))))))

let v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt = (fun path -> (if (dtp_fileExists path) then (match ((v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) (dtp_readFile path)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__27) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: ") dtb__27)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__28) -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__28) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__29) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: ") dtb__29)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__30) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__30))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: missing vuna.toml in ") (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString = (fun manifest -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestName manifest) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__31) -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir = (fun d415 -> (fun dir -> (fun stack -> (match stack with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if (((v_Base_dEq_deq d415) (v_Base_dPair_dfirstOf dtb__32)) dir) then true else (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir d415) dir) dtb__33))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix = (fun d421 -> (fun dir -> (fun stack -> (match stack with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (if (((v_Base_dEq_deq d421) (v_Base_dPair_dfirstOf dtb__34)) dir) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Cons (dtb__34, C_Base_dList_dList_Nil)))) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix d421) dir) dtb__35) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Cons (dtb__34, dtb__36))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage = (fun dir -> (fun depName -> (fun stack -> (match depName with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat "pkg: dependency cycle at ") dir)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__37) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) dir) stack) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat "pkg: dependency cycle at ") dir)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__38) -> ((bi_concat "pkg: dependency cycle: ") (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dappend ((v_Base_dList_dmap v_Base_dPair_dsecondOf) (v_Base_dList_dreverse dtb__38))) (C_Base_dList_dList_Cons (dtb__37, C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk = (fun d442 -> (fun depName -> (fun actual -> (match depName with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39) -> (((v_Base_dEq_deq d442) dtb__39) actual)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage = (fun depName -> (fun actual -> (match depName with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "pkg: package name mismatch"
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__40) -> ((bi_concat "pkg: dependency ") ((bi_concat dtb__40) ((bi_concat " expects package name ") ((bi_concat dtb__40) ((bi_concat " but found ") actual)))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList = (fun stack -> (fun baseDir -> (fun deps -> (match deps with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (match dtb__41 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__44) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk stack) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__43))) ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__44)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__45) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__45))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__46) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList stack) baseDir) dtb__42) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__47) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__47))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__48) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__46, dtb__48))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk = (fun stack -> (fun depName -> (fun dir -> ((fun normalized -> (if (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) normalized) stack) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage normalized) depName) stack))) else (match (v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt ((bi_concat normalized) "/vuna.toml")) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__49) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__49))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__50) -> ((fun name -> (if (((v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) depName) name) then (match (((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (normalized, name)), stack))) normalized) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDependencies dtb__50)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__51) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__51))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__52) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__50, dtb__52, normalized))))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString dtb__50))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir dir)))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds = (fun package -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package))), (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)))))
and v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds = (fun packages -> (match packages with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__53, dtb__54) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds dtb__53)) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds dtb__54))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir = (fun name -> (fun ids -> (match ids with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (match dtb__55 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> (if ((bi_eq_str dtb__57) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__58)) else ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir name) dtb__56))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo = (fun seen -> (fun ids -> (match ids with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match dtb__59 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir dtb__61) seen) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62)), seen))) dtb__60)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__63) -> (if ((bi_eq_str dtb__63) dtb__62) then ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo seen) dtb__60) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: duplicate package name \"") ((bi_concat dtb__61) ((bi_concat "\" in ") ((bi_concat dtb__63) ((bi_concat " and ") ((bi_concat dtb__62) " (package names must be unique within a dependency graph)")))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames = (fun packages -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds packages)))

let v_Vuna_dCompiler_dPackages_dPkg_dloadPackage = (fun dir -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk C_Base_dList_dList_Nil) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) dir)) (fun package -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (C_Base_dList_dList_Cons (package, C_Base_dList_dList_Nil)))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (package)))))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadMembers = (fun baseDir -> (fun members -> (match members with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__64)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__66) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__66))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__67) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers baseDir) dtb__65) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__68) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__68))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__69) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__67, dtb__69))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages = (fun rootBaseDir -> ((fun base -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__70) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__70))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__71) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers base) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestMembers (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest dtb__71))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__72) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__72))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__73) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (C_Base_dList_dList_Cons (dtb__71, dtb__73)))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__71, dtb__73))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rootBaseDir)))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package)) "/lib"), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports package))))

let rec v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots = (fun seen -> (fun packages -> (match packages with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (seen, C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__74)) seen) then ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots seen) dtb__75) else (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__74), seen))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies dtb__74)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__76, dtb__77) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots dtb__76) dtb__75) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, dtb__79) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, ((v_Base_dList_dappend dtb__77) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__74), dtb__79)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots = (fun package -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (C_Base_dList_dList_Cons (selfName, C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__80, dtb__81) -> (C_Base_dList_dList_Cons (selfRoot, dtb__81))
  | _ -> failwith "DT: impossible branch"
)) (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package)) "/lib"), selfName, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package)))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry = (fun package -> ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package)) "/app/Main.vuna"))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUp = (fun start -> (fun dir -> (if (dtp_fileExists ((bi_concat dir) "/vuna.toml")) then (C_Base_dResult_dResult_Base_dResult_dOk (dir)) else (((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpStep start) dir) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir)))))
and v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpStep = (fun start -> (fun dir -> (fun parent -> (if ((bi_eq_str parent) dir) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: no vuna.toml found from ") ((bi_concat start) " (searched upward)")))) else ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUp start) parent)))))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDir = (fun startDir -> ((fun start -> ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUp start) start)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))
