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
open Vuna_dCompiler_dFrontend_dManifest
type t_Vuna_dCompiler_dPackages_dPkg_dRoot = C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot of (string) * (string) * (string t_Base_dList_dList t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dPackages_dPkg_dPackage = C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage of (t_Vuna_dCompiler_dFrontend_dManifest_dManifest) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage t_Base_dList_dList) * (string)
and t_Vuna_dCompiler_dPackages_dPkg_dPackageContext = C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext of (string) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dPackages_dPkg_dRoot t_Base_dList_dList) * (string)

let v_Vuna_dCompiler_dPackages_dPkg_drootDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (dtb__0, dtb__1, dtb__2) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (dtb__3, dtb__4, dtb__5) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootPackage = (fun root -> (v_Vuna_dCompiler_dPackages_dPkg_drootName root))

let v_Vuna_dCompiler_dPackages_dPkg_drootExports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (dtb__6, dtb__7, dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext (dtb__9, dtb__10, dtb__11, dtb__12) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackage = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext (dtb__13, dtb__14, dtb__15, dtb__16) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext (dtb__17, dtb__18, dtb__19, dtb__20) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext (dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__25, dtb__26, dtb__27) -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__28, dtb__29, dtb__30) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__31, dtb__32, dtb__33) -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageName = (fun package -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestName (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest package)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__34) -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageExports = (fun package -> (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestExports (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest package)))

let rec v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars = (fun chars -> (fun acc -> (fun seg -> (match chars with
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse (C_Base_dList_dList_Cons ((dtp_pack (v_Base_dList_dreverse seg)), acc)))
  | C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (if ((bi_eq_int dtb__35) 47) then (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__36) (C_Base_dList_dList_Cons ((dtp_pack (v_Base_dList_dreverse seg)), acc))) C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__36) acc) (C_Base_dList_dList_Cons (dtb__35, seg))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash = (fun path -> (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars (dtp_unpack path)) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc = (fun absolute -> (fun segments -> (fun acc -> (match segments with
  | C_Base_dList_dList_Nil -> acc
  | C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (if ((bi_eq_str dtb__37) "") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__38) acc) else (if ((bi_eq_str dtb__37) ".") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__38) acc) else (if ((bi_eq_str dtb__37) "..") then (match acc with
  | C_Base_dList_dList_Nil -> (if absolute then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__38) C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__38) (C_Base_dList_dList_Cons ("..", C_Base_dList_dList_Nil))))
  | C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if ((bi_eq_str dtb__39) "..") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__38) (C_Base_dList_dList_Cons ("..", acc))) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__38) dtb__40))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc absolute) dtb__38) (C_Base_dList_dList_Cons (dtb__37, acc))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir = (fun path -> (if ((v_Base_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) C_Base_dList_dList_Nil) with
  | C_Base_dList_dList_Nil -> "/"
  | dtb__41 -> ((bi_concat "/") (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Base_dList_dreverse dtb__41)))
) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) C_Base_dList_dList_Nil) with
  | C_Base_dList_dList_Nil -> "."
  | dtb__42 -> (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Base_dList_dreverse dtb__42))
)))

let v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath = (fun path -> (if ((v_Base_dString_dstartsWith "/") path) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir ((bi_concat (dtp_getcwd ())) ((bi_concat "/") path)))))

let v_Vuna_dCompiler_dPackages_dPkg_djoinPath = (fun base -> (fun rel -> (if ((v_Base_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir ((bi_concat base) ((bi_concat "/") rel))))))

let rec v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (match dtb__44 with
  | C_Base_dList_dList_Nil -> dtb__43
  | _ -> ((bi_concat dtb__43) ((bi_concat ", ") (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText dtb__44)))
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt = (fun path -> (if (dtp_fileExists path) then (match ((v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) (dtp_readFile path)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__45) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: ") dtb__45)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__46) -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__46) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__47) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: ") dtb__47)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__48) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__48))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: missing vuna.toml in ") (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString = (fun manifest -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestName manifest) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__49) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir = (fun d493 -> (fun dir -> (fun stack -> (match stack with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (((v_Base_dEq_deq d493) (v_Base_dPair_dfirstOf dtb__50)) dir) then true else (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir d493) dir) dtb__51))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix = (fun d499 -> (fun dir -> (fun stack -> (match stack with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if (((v_Base_dEq_deq d499) (v_Base_dPair_dfirstOf dtb__52)) dir) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Cons (dtb__52, C_Base_dList_dList_Nil)))) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix d499) dir) dtb__53) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__54) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Cons (dtb__52, dtb__54))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage = (fun dir -> (fun depName -> (fun stack -> (match depName with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat "pkg: dependency cycle at ") dir)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__55) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) dir) stack) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat "pkg: dependency cycle at ") dir)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__56) -> ((bi_concat "pkg: dependency cycle: ") (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dappend ((v_Base_dList_dmap v_Base_dPair_dsecondOf) (v_Base_dList_dreverse dtb__56))) (C_Base_dList_dList_Cons (dtb__55, C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk = (fun d520 -> (fun depName -> (fun actual -> (match depName with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__57) -> (((v_Base_dEq_deq d520) dtb__57) actual)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage = (fun depName -> (fun actual -> (match depName with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "pkg: package name mismatch"
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__58) -> ((bi_concat "pkg: dependency ") ((bi_concat dtb__58) ((bi_concat " expects package name ") ((bi_concat dtb__58) ((bi_concat " but found ") actual)))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList = (fun fuel -> (fun stack -> (fun baseDir -> (fun deps -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: pkg fuel exhausted (internal: dependency graph too deep)")) else (match deps with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match dtb__59 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk ((bi_sub fuel) 1)) stack) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__61))) ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__62)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__63) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__63))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__64) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList ((bi_sub fuel) 1)) stack) baseDir) dtb__60) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__65) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__65))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__66) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__64, dtb__66))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk = (fun fuel -> (fun stack -> (fun depName -> (fun dir -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: pkg fuel exhausted (internal: dependency graph too deep)")) else ((fun normalized -> (if (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) normalized) stack) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage normalized) depName) stack))) else (match (v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt ((bi_concat normalized) "/vuna.toml")) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__67) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__67))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__68) -> ((fun name -> (if (((v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) depName) name) then (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList ((bi_sub fuel) 1)) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (normalized, name)), stack))) normalized) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDependencies dtb__68)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__69) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__69))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__70) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__68, dtb__70, normalized))))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString dtb__68))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir dir)))))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds = (fun package -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package))), (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)))))
and v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds = (fun packages -> (match packages with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__71, dtb__72) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds dtb__71)) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds dtb__72))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir = (fun name -> (fun ids -> (match ids with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match dtb__73 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__75, dtb__76) -> (if ((bi_eq_str dtb__75) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__76)) else ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir name) dtb__74))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo = (fun seen -> (fun ids -> (match ids with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (match dtb__77 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir dtb__79) seen) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80)), seen))) dtb__78)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__81) -> (if ((bi_eq_str dtb__81) dtb__80) then ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo seen) dtb__78) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: duplicate package name \"") ((bi_concat dtb__79) ((bi_concat "\" in ") ((bi_concat dtb__81) ((bi_concat " and ") ((bi_concat dtb__80) " (package names must be unique within a dependency graph)")))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames = (fun packages -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds packages)))

let v_Vuna_dCompiler_dPackages_dPkg_dloadPackage = (fun dir -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk 1048576) C_Base_dList_dList_Nil) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) dir)) (fun package -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (C_Base_dList_dList_Cons (package, C_Base_dList_dList_Nil)))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (package)))))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadMembers = (fun baseDir -> (fun members -> (match members with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__82)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__84) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__84))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__85) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers baseDir) dtb__83) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__86) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__86))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__87) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__85, dtb__87))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages = (fun rootBaseDir -> ((fun base -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__88) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__88))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__89) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers base) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestMembers (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest dtb__89))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__90) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__90))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__91) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (C_Base_dList_dList_Cons (dtb__89, dtb__91)))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons (dtb__89, dtb__91))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rootBaseDir)))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package)) "/lib"), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports package))))

let rec v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots = (fun seen -> (fun packages -> (match packages with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (seen, C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__92)) seen) then ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots seen) dtb__93) else (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__92), seen))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies dtb__92)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots dtb__94) dtb__93) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__96, dtb__97) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__96, ((v_Base_dList_dappend dtb__95) (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__92), dtb__97)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots = (fun package -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (C_Base_dList_dList_Cons (selfName, C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, dtb__99) -> (C_Base_dList_dList_Cons (selfRoot, dtb__99))
  | _ -> failwith "DT: impossible branch"
)) (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package)) "/lib"), selfName, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package)))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry = (fun package -> ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package)) "/app/Main.vuna"))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageContext = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package), (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (package)), (v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe = (fun fuel -> (fun dir -> (if ((bi_le_int fuel) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (dtp_fileExists ((bi_concat dir) "/vuna.toml")) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dir)) else (((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep ((bi_sub fuel) 1)) dir) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir))))))
and v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep = (fun fuel -> (fun dir -> (fun parent -> (if ((bi_le_int fuel) 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if ((bi_eq_str parent) dir) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe ((bi_sub fuel) 1)) parent))))))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe = (fun startDir -> ((fun start -> ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe ((bi_add (bi_strLength start)) 1)) start)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDir = (fun startDir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe startDir) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__100) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__100))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: no vuna.toml found from ") ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)) " (searched upward)"))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dhasManifest = (fun dir -> (dtp_fileExists ((bi_concat dir) "/vuna.toml")))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates = (fun exeDir -> (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "base"), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../base"), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../base"), (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../../base"), C_Base_dList_dList_Nil)))))))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound = (fun tried -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "pkg: cannot locate vuna-base (tried: ") ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText tried)) "); set VUNA_BASE to a directory containing vuna.toml")))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dtb__101) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__101)) else ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase mc0) dtb__102))
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound mc0)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dPackages_dPkg_dlocateBase = (fun _u -> ((fun env -> (if ((bi_eq_str env) "") then ((fun candidates -> ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase candidates) candidates)) (v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath (dtp_execPath ()))))) else ((fun dir -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dir) then (C_Base_dResult_dResult_Base_dResult_dOk (dir)) else (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound (C_Base_dList_dList_Cons (dir, C_Base_dList_dList_Nil))))) (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath env)))) (dtp_getenv "VUNA_BASE")))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext = (fun base -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base)) (fun package -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext ("", C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf package), C_Base_dList_dList_Nil)), "")))))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextAt = (fun start -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe start) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__103) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dtb__103)) (fun package -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dPackages_dPkg_dpackageContext package)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dlocateBase 0)) v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile = (fun path -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath path))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForDir = (fun dir -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath dir)))
