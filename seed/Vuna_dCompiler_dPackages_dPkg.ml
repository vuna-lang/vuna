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
type t_Vuna_dCompiler_dPackages_dPkg_dRoot = C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot of (string) * (string) * (string t_Base_dList_dList t_Base_dMaybe_dMaybe) * (string t_Base_dList_dList)
and t_Vuna_dCompiler_dPackages_dPkg_dPackage = C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage of (t_Vuna_dCompiler_dFrontend_dManifest_dManifest) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage t_Base_dList_dList) * (string)
and t_Vuna_dCompiler_dPackages_dPkg_dPackageContext = C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext of (string) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dPackages_dPkg_dRoot t_Base_dList_dList) * (string) * (string t_Base_dList_dList)

let v_Vuna_dCompiler_dPackages_dPkg_drootDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (dtb__4, dtb__5, dtb__6, dtb__7) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootPackage = (fun root -> (v_Vuna_dCompiler_dPackages_dPkg_drootName root))

let v_Vuna_dCompiler_dPackages_dPkg_drootExports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (dtb__8, dtb__9, dtb__10, dtb__11) -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackage = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> dtb__40
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__41, dtb__42, dtb__43) -> dtb__41
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__44, dtb__45, dtb__46) -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__47, dtb__48, dtb__49) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageName = (fun package -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestName (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest package)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__50) -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageExports = (fun package -> (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestExports (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest package)))

let rec v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__51, dtb__52) -> (if (dtb__51 = 47) then (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__52) (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc2)), mc1))) C_Base_dList_dList_Base_dList_dNil) else (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__52) mc1) (C_Base_dList_dList_Base_dList_dCons (dtb__51, mc2))))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((dtp_pack (v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash = (fun path -> (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars (dtp_unpack path)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__53, dtb__54) -> (if (dtb__53 = "") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__54) mc2) else (if (dtb__53 = ".") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__54) mc2) else (if (dtb__53 = "..") then (match mc2 with
  | C_Base_dList_dList_Base_dList_dNil -> (if mc0 then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__54) C_Base_dList_dList_Base_dList_dNil) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__54) (C_Base_dList_dList_Base_dList_dCons ("..", C_Base_dList_dList_Base_dList_dNil))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (if (dtb__55 = "..") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__54) (C_Base_dList_dList_Base_dList_dCons ("..", mc2))) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__54) dtb__56))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__54) (C_Base_dList_dList_Base_dList_dCons (dtb__53, mc2))))))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir = (fun path -> (if ((v_Base_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dList_dList_Base_dList_dNil -> "/"
  | dtb__57 -> ("/" ^ (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Base_dList_dreverse dtb__57)))
) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dList_dList_Base_dList_dNil -> "."
  | dtb__58 -> (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Base_dList_dreverse dtb__58))
)))

let v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath = (fun path -> (if ((v_Base_dString_dstartsWith "/") path) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [(v_Base_dIO_drunIO (C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (dtp_getcwd ())))); "/"; path]))))

let v_Vuna_dCompiler_dPackages_dPkg_djoinPath = (fun base rel -> (if ((v_Base_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [base; "/"; rel]))))

let rec v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__59, dtb__60) -> (match dtb__60 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__59
  | _ -> (String.concat "" [dtb__59; ", "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText dtb__60)])
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt = (fun path -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (match ((v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__61) -> (C_Base_dResult_dResult_Base_dResult_dErr (("pkg: " ^ dtb__61)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__62) -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__62) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__63) -> (C_Base_dResult_dResult_Base_dResult_dErr (("pkg: " ^ dtb__63)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__64) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__64))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (("pkg: missing vuna.toml in " ^ (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString = (fun manifest -> (match (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestName manifest) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__65) -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir = (fun d475 mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> (if (((v_Base_dEq_deq d475) (v_Base_dPair_dfirstOf dtb__66)) mc0) then true else (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir d475) mc0) dtb__67))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix = (fun d480 mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (if (((v_Base_dEq_deq d480) (v_Base_dPair_dfirstOf dtb__68)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Base_dList_dCons (dtb__68, C_Base_dList_dList_Base_dList_dNil)))) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix d480) mc0) dtb__69) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__70) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__70))))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix v_Eq_uString) mc0) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ("pkg: dependency cycle at " ^ mc0)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__72) -> ("pkg: dependency cycle: " ^ (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dappend ((v_Base_dList_dmap v_Base_dPair_dsecondOf) (v_Base_dList_dreverse dtb__72))) (C_Base_dList_dList_Base_dList_dCons (dtb__71, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk = (fun d502 mc0 mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__73) -> (((v_Base_dEq_deq d502) dtb__73) mc1)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__74) -> (String.concat "" ["pkg: dependency "; dtb__74; " expects package name "; dtb__74; " but found "; mc1])
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList = (fun fuel stack baseDir deps -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: pkg fuel exhausted (internal: dependency graph too deep)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> (match dtb__75 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk (fuel - 1)) stack) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__77))) ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__78)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__79) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__79))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__80) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) stack) baseDir) dtb__76) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__81) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__81))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__82) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__82))))
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
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__83) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__83))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__84) -> ((fun name -> (if (((v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk v_Eq_uString) depName) name) then (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (normalized, name)), stack))) normalized) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDependencies dtb__84)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__85) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__85))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__86) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__84, dtb__86, normalized))))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString dtb__84))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir dir))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds = (fun package -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package))), (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)))))
and v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__87, dtb__88) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds dtb__87)) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds dtb__88))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> (match dtb__89 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, dtb__92) -> (if (dtb__91 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92)) else ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir mc0) dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match dtb__93 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir dtb__95) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96)), mc0))) dtb__94)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__97) -> (if (dtb__97 = dtb__96) then ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo mc0) dtb__94) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["pkg: duplicate package name \""; dtb__95; "\" in "; dtb__97; " and "; dtb__96; " (package names must be unique within a dependency graph)"]))))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__98, dtb__99) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath mc0) dtb__98)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__100) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__100))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__101) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers mc0) dtb__99) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__102) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__102))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__103) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__103))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages = (fun rootBaseDir -> ((fun base -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__104) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__104))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__105) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers base) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestMembers (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest dtb__105))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__106) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__106))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__107) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__107)))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__107))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rootBaseDir)))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports package), (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestCapabilities (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest package)))))

let rec v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__108)) mc0) then ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots mc0) dtb__109) else (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__108), mc0))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies dtb__108)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__110, dtb__111) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots dtb__110) dtb__109) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__112, dtb__113) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__112, ((v_Base_dList_dappend dtb__111) (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__108), dtb__113)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots = (fun package -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (C_Base_dList_dList_Base_dList_dCons (selfName, C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__114, dtb__115) -> (C_Base_dList_dList_Base_dList_dCons (selfRoot, dtb__115))
  | _ -> failwith "DT: impossible branch"
)) (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Vuna_dCompiler_dPackages_dPkg_dMkRoot (((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"), selfName, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestCapabilities (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest package)))))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package)))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry = (fun package -> ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/app/Main.vuna"))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageContext = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package), (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (package)), (v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestCapabilities (v_Vuna_dCompiler_dPackages_dPkg_dpackageManifest package)))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe = (fun fuel dir -> (if (fuel <= 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (dir ^ "/vuna.toml"))) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dir)) else (((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep (fuel - 1)) dir) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir)))))
and v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep = (fun fuel dir parent -> (if (fuel <= 0) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (parent = dir) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe (fuel - 1)) parent))))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe = (fun startDir -> ((fun start -> ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe ((2 * (bi_strLength start)) + 4)) start)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDir = (fun startDir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe startDir) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__116) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__116))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["pkg: no vuna.toml found from "; (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir); " (searched upward)"])))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dhasManifest = (fun dir -> (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (dir ^ "/vuna.toml"))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates = (fun exeDir -> (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "base"), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../base"), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../base"), (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../../base"), C_Base_dList_dList_Base_dList_dNil)))))))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound = (fun tried -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["pkg: cannot locate vuna-base (tried: "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText tried); "); set VUNA_BASE to a directory containing vuna.toml"]))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dtb__117) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__117)) else ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase mc0) dtb__118))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dlocateBase = (fun _u -> ((fun env -> (if (env = "") then ((fun candidates -> ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase candidates) candidates)) (v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath (v_Base_dIO_drunIO (C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (dtp_execPath ())))))))) else ((fun dir -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dir) then (C_Base_dResult_dResult_Base_dResult_dOk (dir)) else (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound (C_Base_dList_dList_Base_dList_dCons (dir, C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath env)))) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_getenv dtio_0)) "VUNA_BASE"))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext = (fun base -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base)) (fun package -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dMkPackageContext ("", C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf package), C_Base_dList_dList_Base_dList_dNil)), "", C_Base_dList_dList_Base_dList_dNil)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextAt = (fun start -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe start) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__119) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dtb__119)) (fun package -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dPackages_dPkg_dpackageContext package)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dlocateBase 0)) v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile = (fun path -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath path))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForDir = (fun dir -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath dir)))
