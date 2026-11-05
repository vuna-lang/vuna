open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
type t_Vuna_dCompiler_dPackages_dPkg_dRoot = C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot of (string) * (string) * (string t_Base_dList_dList t_Base_dMaybe_dMaybe) * (string t_Base_dList_dList)
and t_Vuna_dCompiler_dPackages_dPkg_dPackage = C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage of (t_Vuna_dCompiler_dFrontend_dManifest_dManifest) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage t_Base_dList_dList) * (string)
and t_Vuna_dCompiler_dPackages_dPkg_dPackageContext = C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext of (string) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dPackages_dPkg_dRoot t_Base_dList_dList) * (string) * (string t_Base_dList_dList)

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__0, dtb__1, dtb__2) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (dtb__3, dtb__4, dtb__5, dtb__6) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (dtb__7, dtb__8, dtb__9, dtb__10) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootPackage = (fun root -> (v_Vuna_dCompiler_dPackages_dPkg_drootName root))

let v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__35, dtb__36, dtb__37) -> dtb__37
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageName = (fun package -> (match (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__38, dtb__39, dtb__40) -> dtb__38
  | _ -> failwith "DT: impossible branch"
) with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> dtb__41
  | _ -> failwith "DT: impossible branch"
) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__47) -> dtb__47
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageExports = (fun package -> (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__48, dtb__49, dtb__50) -> dtb__48
  | _ -> failwith "DT: impossible branch"
) with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> dtb__53
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> (if (dtb__57 = 47) then (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__58) (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc2)), mc1))) C_Base_dList_dList_Base_dList_dNil) else (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__58) mc1) (C_Base_dList_dList_Base_dList_dCons (dtb__57, mc2))))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash = (fun path -> (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars (dtp_unpack path)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__59, dtb__60) -> (if (dtb__59 = "") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__60) mc2) else (if (dtb__59 = ".") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__60) mc2) else (if (dtb__59 = "..") then (match mc2 with
  | C_Base_dList_dList_Base_dList_dNil -> (if mc0 then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__60) C_Base_dList_dList_Base_dList_dNil) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__60) (C_Base_dList_dList_Base_dList_dCons ("..", C_Base_dList_dList_Base_dList_dNil))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (if (dtb__61 = "..") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__60) (C_Base_dList_dList_Base_dList_dCons ("..", mc2))) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__60) dtb__62))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__60) (C_Base_dList_dList_Base_dList_dCons (dtb__59, mc2))))))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir = (fun path -> (if ((v_Base_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dList_dList_Base_dList_dNil -> "/"
  | dtb__63 -> ("/" ^ (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Base_dList_dreverse dtb__63)))
) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dList_dList_Base_dList_dNil -> "."
  | dtb__64 -> (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Base_dList_dreverse dtb__64))
)))

let v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath = (fun path -> (if ((v_Base_dString_dstartsWith "/") path) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [(v_Base_dIO_drunIO (C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (dtp_getcwd ())))); "/"; path]))))

let v_Vuna_dCompiler_dPackages_dPkg_djoinPath = (fun base rel -> (if ((v_Base_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [base; "/"; rel]))))

let rec v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__65, dtb__66) -> (match dtb__66 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__65
  | _ -> (String.concat "" [dtb__65; ", "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText dtb__66)])
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt = (fun path -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (match ((v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__67) -> (C_Base_dResult_dResult_Base_dResult_dErr (("pkg: " ^ dtb__67)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__68) -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__68) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__69) -> (C_Base_dResult_dResult_Base_dResult_dErr (("pkg: " ^ dtb__69)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__70) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (("pkg: missing vuna.toml in " ^ (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString = (fun manifest -> (match (match manifest with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> dtb__71
  | _ -> failwith "DT: impossible branch"
) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__77) -> dtb__77
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__78, dtb__79) -> (if (((v_Base_dEq_deq _uctx0) (v_Base_dPair_dfirstOf dtb__78)) mc0) then true else (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir _uctx0) mc0) dtb__79))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (if (((v_Base_dEq_deq _uctx0) (v_Base_dPair_dfirstOf dtb__80)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Base_dList_dCons (dtb__80, C_Base_dList_dList_Base_dList_dNil)))) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix _uctx0) mc0) dtb__81) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__82))))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix v_Eq_uString) mc0) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ("pkg: dependency cycle at " ^ mc0)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__84) -> ("pkg: dependency cycle: " ^ (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dappend ((v_Base_dList_dmap v_Base_dPair_dsecondOf) (v_Base_dList_dreverse dtb__84))) (C_Base_dList_dList_Base_dList_dCons (dtb__83, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__85) -> (((v_Base_dEq_deq _uctx0) dtb__85) mc1)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__86) -> (String.concat "" ["pkg: dependency "; dtb__86; " expects package name "; dtb__86; " but found "; mc1])
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList = (fun fuel stack baseDir deps -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: pkg fuel exhausted (internal: dependency graph too deep)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__87, dtb__88) -> (match dtb__87 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__89, dtb__90) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk (fuel - 1)) stack) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89))) ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__90)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__91) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__91))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__92) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) stack) baseDir) dtb__88) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__93) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__93))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__94) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__94))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) deps)))
and v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk = (fun fuel stack depName dir -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: pkg fuel exhausted (internal: dependency graph too deep)")) else ((fun normalized -> (if (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir v_Eq_uString) normalized) stack) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage normalized) depName) stack))) else (match (v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt (normalized ^ "/vuna.toml")) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__95) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__95))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__96) -> ((fun name -> (if (((v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk v_Eq_uString) depName) name) then (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (normalized, name)), stack))) normalized) (match dtb__96 with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__100
  | _ -> failwith "DT: impossible branch"
)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__103) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__103))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__104) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__96, dtb__104, normalized))))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString dtb__96))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir dir))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds = (fun package -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package))), (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)))))
and v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds dtb__105)) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds dtb__106))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (match dtb__107 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (if (dtb__109 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110)) else ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir mc0) dtb__108))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__111, dtb__112) -> (match dtb__111 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir dtb__113) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114)), mc0))) dtb__112)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__115) -> (if (dtb__115 = dtb__114) then ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo mc0) dtb__112) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["pkg: duplicate package name \""; dtb__113; "\" in "; dtb__115; " and "; dtb__114; " (package names must be unique within a dependency graph)"]))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames = (fun packages -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds packages)))

let v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound = 1048576

let v_Vuna_dCompiler_dPackages_dPkg_dloadPackage = (fun dir -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound) C_Base_dList_dList_Base_dList_dNil) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) dir)) (fun package -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (C_Base_dList_dList_Base_dList_dCons (package, C_Base_dList_dList_Base_dList_dNil)))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (package)))))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadMembers = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__116, dtb__117) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath mc0) dtb__116)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__118) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__118))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__119) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers mc0) dtb__117) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__120) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__120))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__121) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__121))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages = (fun rootBaseDir -> ((fun base -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__122) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__122))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__123) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers base) (match (match dtb__123 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__124, dtb__125, dtb__126) -> dtb__124
  | _ -> failwith "DT: impossible branch"
) with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> dtb__128
  | _ -> failwith "DT: impossible branch"
)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__133) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__133))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__134) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (C_Base_dList_dList_Base_dList_dCons (dtb__123, dtb__134)))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__123, dtb__134))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rootBaseDir)))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports package), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__135, dtb__136, dtb__137) -> dtb__135
  | _ -> failwith "DT: impossible branch"
) with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> dtb__142
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__144)) mc0) then ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots mc0) dtb__145) else (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__144), mc0))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies dtb__144)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots dtb__146) dtb__145) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__149) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, ((v_Base_dList_dappend dtb__147) (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__144), dtb__149)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots = (fun package -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (C_Base_dList_dList_Base_dList_dCons (selfName, C_Base_dList_dList_Base_dList_dNil))) (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__150, dtb__151, dtb__152) -> dtb__151
  | _ -> failwith "DT: impossible branch"
)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__153, dtb__154) -> (C_Base_dList_dList_Base_dList_dCons (selfRoot, dtb__154))
  | _ -> failwith "DT: impossible branch"
)) (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dRoot (((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"), selfName, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__155, dtb__156, dtb__157) -> dtb__155
  | _ -> failwith "DT: impossible branch"
) with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> dtb__162
  | _ -> failwith "DT: impossible branch"
))))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package)))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry = (fun package -> ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/app/Main.vuna"))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageContext = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package), (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (package)), (v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__164, dtb__165, dtb__166) -> dtb__164
  | _ -> failwith "DT: impossible branch"
) with
  | C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Vuna_dCompiler_dFrontend_dManifest_dManifest (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> dtb__171
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe = (fun fuel dir -> (if (fuel <= 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (dir ^ "/vuna.toml"))) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dir)) else (((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep (fuel - 1)) dir) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir)))))
and v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep = (fun fuel dir parent -> (if (fuel <= 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (parent = dir) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe (fuel - 1)) parent))))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe = (fun startDir -> ((fun start -> ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe ((2 * (bi_strLength start)) + 4)) start)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDir = (fun startDir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe startDir) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__173))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["pkg: no vuna.toml found from "; (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir); " (searched upward)"])))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dhasManifest = (fun dir -> (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (dir ^ "/vuna.toml"))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates = (fun exeDir -> (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "base"), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../base"), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../base"), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../../base"), C_Base_dList_dList_Base_dList_dNil)))))))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound = (fun tried -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["pkg: cannot locate vuna-base (tried: "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText tried); "); set VUNA_BASE to a directory containing vuna.toml"]))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__174, dtb__175) -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dtb__174) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__174)) else ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase mc0) dtb__175))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dlocateBase = (fun _u -> ((fun env -> (if (env = "") then ((fun candidates -> ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase candidates) candidates)) (v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath (v_Base_dIO_drunIO (C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (dtp_execPath ())))))))) else ((fun dir -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dir) then (C_Base_dResult_dResult_Base_dResult_dOk (dir)) else (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound (C_Base_dList_dList_Base_dList_dCons (dir, C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath env)))) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_getenv dtio_0)) "VUNA_BASE"))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext = (fun base -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base)) (fun package -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext ("", C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf package), C_Base_dList_dList_Base_dList_dNil)), "", C_Base_dList_dList_Base_dList_dNil)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextAt = (fun start -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe start) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dtb__176)) (fun package -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dPackages_dPkg_dpackageContext package)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dlocateBase 0)) v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile = (fun path -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath path))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForDir = (fun dir -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath dir)))
