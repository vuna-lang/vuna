open Vuna_runtime
type t_Vuna_dCompiler_dPackages_dPkg_dRoot = C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root of (string) * (string) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe) * (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dPackages_dPkg_dPackage = C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package of (Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage Base_dList.t_Base_dList_dList) * (string)
and t_Vuna_dCompiler_dPackages_dPkg_dPackageContext = C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext of (string) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dPackages_dPkg_dRoot Base_dList.t_Base_dList_dList) * (string) * (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe)

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__0, dtb__1, dtb__2) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootPackage = (fun root -> (v_Vuna_dCompiler_dPackages_dPkg_drootName root))

let v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootTrustUnsafe = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__23
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> dtb__38
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> dtb__52
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__53, dtb__54, dtb__55) -> dtb__55
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageName = (fun package -> (match (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__56, dtb__57, dtb__58) -> dtb__56
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__59
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__66) -> dtb__66
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageExports = (fun package -> (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__67, dtb__68, dtb__69) -> dtb__67
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> dtb__72
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (if (dtb__77 = 47) then (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__78) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__78) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__77, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash = (fun path -> (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (if (dtb__79 = "") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__80) mc2) else (if (dtb__79 = ".") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__80) mc2) else (if (dtb__79 = "..") then (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (if mc0 then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__80) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__80) (Base_dList.C_Base_dList_dList_Cons ("..", Base_dList.C_Base_dList_dList_Nil))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (if (dtb__81 = "..") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__80) (Base_dList.C_Base_dList_dList_Cons ("..", mc2))) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__80) dtb__82))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__80) (Base_dList.C_Base_dList_dList_Cons (dtb__79, mc2))))))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "/"
  | dtb__83 -> ("/" ^ (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__83)))
) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | dtb__84 -> (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__84))
)))

let v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [(Base_dIO.v_Base_dIO_drunIO (fun (_ : int) -> (dtp_getcwd ()))); "/"; path]))))

let v_Vuna_dCompiler_dPackages_dPkg_djoinPath = (fun base rel -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [base; "/"; rel]))))

let rec v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__85, dtb__86) -> (match dtb__86 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__85
  | _ -> (String.concat "" [dtb__85; ", "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText dtb__86)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt = (fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (match ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__87) -> (Base_dResult.C_Base_dResult_dResult_Err (("pkg: " ^ dtb__87)))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__88) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__88) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__89) -> (Base_dResult.C_Base_dResult_dResult_Err (("pkg: " ^ dtb__89)))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__90) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Err (("pkg: missing vuna.toml in " ^ (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString = (fun manifest -> (match (match manifest with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> dtb__91
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__98) -> dtb__98
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__99)) mc0) then true else (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir _uctx0) mc0) dtb__100))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__101)) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__101, Base_dList.C_Base_dList_dList_Nil)))) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix _uctx0) mc0) dtb__102) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__103) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__103))))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix Base_dString.v_Eq_uString) mc0) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__105) -> ("pkg: dependency cycle: " ^ (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinArrows ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (Base_dList.v_Base_dList_dreverse dtb__105))) (Base_dList.C_Base_dList_dList_Cons (dtb__104, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__106) mc1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> (String.concat "" ["pkg: dependency "; dtb__107; " expects package name "; dtb__107; " but found "; mc1])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList = (fun fuel stack baseDir deps -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: pkg fuel exhausted (internal: dependency graph too deep)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match dtb__108 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__110, dtb__111) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk (fuel - 1)) stack) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110))) ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__111)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__112) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__112))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__113) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) stack) baseDir) dtb__109) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__114) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__114))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__115) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__115))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) deps)))
and v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk = (fun fuel stack depName dir -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: pkg fuel exhausted (internal: dependency graph too deep)")) else ((fun normalized -> (if (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir Base_dString.v_Eq_uString) normalized) stack) then (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage normalized) depName) stack))) else (match (v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt (normalized ^ "/vuna.toml")) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__116) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__116))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__117) -> ((fun name -> (if (((v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk Base_dString.v_Eq_uString) depName) name) then (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (normalized, name)), stack))) normalized) (match dtb__117 with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> dtb__121
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__125) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__125))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__126) -> (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__117, dtb__126, normalized))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString dtb__117))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir dir))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds = (fun package -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package))), (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)))))
and v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds dtb__127)) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds dtb__128))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (match dtb__129 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__131, dtb__132) -> (if (dtb__131 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__132)) else ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir mc0) dtb__130))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (match dtb__133 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__135, dtb__136) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir dtb__135) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__135, dtb__136)), mc0))) dtb__134)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__137) -> (if (dtb__137 = dtb__136) then ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo mc0) dtb__134) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["pkg: duplicate package name \""; dtb__135; "\" in "; dtb__137; " and "; dtb__136; " (package names must be unique within a dependency graph)"]))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames = (fun packages -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds packages)))

let v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound = 1048576

let v_Vuna_dCompiler_dPackages_dPkg_dloadPackage = (fun dir -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) dir)) (fun package -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList_Cons (package, Base_dList.C_Base_dList_dList_Nil)))) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok (package)))))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__138, dtb__139) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath mc0) dtb__138)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__140) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__140))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__141) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers mc0) dtb__139) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__142) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__142))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__143) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__143))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages = (fun rootBaseDir -> ((fun base -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__144) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__144))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__145) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers base) (match (match dtb__145 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__146, dtb__147, dtb__148) -> dtb__146
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> dtb__150
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__156) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__156))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__157) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__157)))) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__157))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rootBaseDir)))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports package), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__158, dtb__159, dtb__160) -> dtb__158
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167) -> dtb__165
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__168, dtb__169, dtb__170) -> dtb__168
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177) -> dtb__176
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__178, dtb__179) -> (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__178)) mc0) then ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots mc0) dtb__179) else (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__178), mc0))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies dtb__178)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__180, dtb__181) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots dtb__180) dtb__179) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__182, dtb__183) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__182, ((Base_dList.v_Base_dList_dappend dtb__181) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__178), dtb__183)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots = (fun package -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList_Cons (selfName, Base_dList.C_Base_dList_dList_Nil))) (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__184, dtb__185, dtb__186) -> dtb__185
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__187, dtb__188) -> (Base_dList.C_Base_dList_dList_Cons (selfRoot, dtb__188))
  | _ -> failwith "DT: impossible branch"
)) (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"), selfName, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__189, dtb__190, dtb__191) -> dtb__189
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198) -> dtb__196
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__199, dtb__200, dtb__201) -> dtb__199
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208) -> dtb__207
  | _ -> failwith "DT: impossible branch"
))))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package)))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry = (fun package -> ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/app/Main.vuna"))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageContext = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package), (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (package)), (v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__209, dtb__210, dtb__211) -> dtb__209
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218) -> dtb__216
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__219, dtb__220, dtb__221) -> dtb__219
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227, dtb__228) -> dtb__227
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe = (fun fuel dir -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (dir ^ "/vuna.toml"))) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dir)) else (((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep (fuel - 1)) dir) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir)))))
and v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep = (fun fuel dir parent -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (parent = dir) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe (fuel - 1)) parent))))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe = (fun startDir -> ((fun start -> ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe ((2 * (bi_strLength start)) + 4)) start)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDir = (fun startDir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe startDir) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__229))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["pkg: no vuna.toml found from "; (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir); " (searched upward)"])))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dhasManifest = (fun dir -> (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (dir ^ "/vuna.toml"))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates = (fun exeDir -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../../base"), Base_dList.C_Base_dList_dList_Nil)))))))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound = (fun tried -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["pkg: cannot locate vuna-base (tried: "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText tried); "); set VUNA_BASE to a directory containing vuna.toml"]))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__230, dtb__231) -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dtb__230) then (Base_dResult.C_Base_dResult_dResult_Ok (dtb__230)) else ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase mc0) dtb__231))
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dlocateBase = (fun _u -> ((fun env -> (if (env = "") then ((fun candidates -> ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase candidates) candidates)) (v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath (Base_dIO.v_Base_dIO_drunIO (fun (_ : int) -> (dtp_execPath ()))))))) else ((fun dir -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dir) then (Base_dResult.C_Base_dResult_dResult_Ok (dir)) else (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil))))) (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath env)))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_BASE"))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext = (fun base -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base)) (fun package -> (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext ("", Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf package), Base_dList.C_Base_dList_dList_Nil)), "", Base_dList.C_Base_dList_dList_Nil, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextAt = (fun start -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe start) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dtb__232)) (fun package -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dPackages_dPkg_dpackageContext package)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dlocateBase 0)) v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile = (fun path -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath path))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForDir = (fun dir -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath dir)))
