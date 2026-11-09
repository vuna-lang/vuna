open Vuna_runtime
type t_Vuna_dCompiler_dPackages_dPkg_dRoot = C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root of (string) * (string) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe) * (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe) * (bool) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dPackages_dPkg_dPackage = C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package of (Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage Base_dList.t_Base_dList_dList) * (string)
and t_Vuna_dCompiler_dPackages_dPkg_dPackageContext = C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext of (string) * (t_Vuna_dCompiler_dPackages_dPkg_dPackage Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dPackages_dPkg_dRoot Base_dList.t_Base_dList_dList) * (string) * (string Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe) * (bool)

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__0, dtb__1, dtb__2) -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__3, dtb__4, dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14, dtb__15, dtb__16) -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootPackage = (fun root -> (v_Vuna_dCompiler_dPackages_dPkg_drootName root))

let v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootTrustUnsafe = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootPrivileged = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__36
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_drootHostModules = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> dtb__44
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__52, dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__62
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> dtb__78
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextPrivileged = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__86
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dprivilegedContext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> (C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, true))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageDir = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__94, dtb__95, dtb__96) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageName = (fun package -> (match (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__97, dtb__98, dtb__99) -> dtb__97
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> dtb__100
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageExports = (fun package -> (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__110, dtb__111, dtb__112) -> dtb__110
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__115
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__122, dtb__123) -> (if (dtb__122 = 47) then (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__123) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__123) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__122, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash = (fun path -> (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__124, dtb__125) -> (if (dtb__124 = "") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__125) mc2) else (if (dtb__124 = ".") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__125) mc2) else (if (dtb__124 = "..") then (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (if mc0 then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__125) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__125) (Base_dList.C_Base_dList_dList_Cons ("..", Base_dList.C_Base_dList_dList_Nil))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__126, dtb__127) -> (if (dtb__126 = "..") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__125) (Base_dList.C_Base_dList_dList_Cons ("..", mc2))) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__125) dtb__127))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__125) (Base_dList.C_Base_dList_dList_Cons (dtb__124, mc2))))))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "/"
  | dtb__128 -> ("/" ^ (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__128)))
) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | dtb__129 -> (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__129))
)))

let v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [(Base_dIO_dHost.v_Base_dIO_dHost_drunIO (fun (_ : int) -> (dtp_getcwd ()))); "/"; path]))))

let v_Vuna_dCompiler_dPackages_dPkg_djoinPath = (fun base rel -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [base; "/"; rel]))))

let rec v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (match dtb__131 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__130
  | _ -> (String.concat "" [dtb__130; ", "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText dtb__131)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt = (fun path -> (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (match ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__132) -> (Base_dResult.C_Base_dResult_dResult_Err (("pkg: " ^ dtb__132)))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__133) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__133) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__134) -> (Base_dResult.C_Base_dResult_dResult_Err (("pkg: " ^ dtb__134)))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__135) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__135))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Err (("pkg: missing vuna.toml in " ^ (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString = (fun manifest -> (match (match manifest with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144) -> dtb__136
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__145) -> dtb__145
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__146)) mc0) then true else (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir _uctx0) mc0) dtb__147))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__148)) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__148, Base_dList.C_Base_dList_dList_Nil)))) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix _uctx0) mc0) dtb__149) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__150) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__150))))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__151) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix Base_dString.v_Eq_uString) mc0) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__152) -> ("pkg: dependency cycle: " ^ (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinArrows ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (Base_dList.v_Base_dList_dreverse dtb__152))) (Base_dList.C_Base_dList_dList_Cons (dtb__151, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__153) -> (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__153) mc1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__154) -> (String.concat "" ["pkg: dependency "; dtb__154; " expects package name "; dtb__154; " but found "; mc1])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList = (fun fuel stack baseDir deps -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: pkg fuel exhausted (internal: dependency graph too deep)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (match dtb__155 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__157, dtb__158) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk (fuel - 1)) stack) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__157))) ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__158)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__159) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__159))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__160) -> (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) stack) baseDir) dtb__156) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__161) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__161))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__162) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__162))))
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
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__163) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__163))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__164) -> ((fun name -> (if (((v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk Base_dString.v_Eq_uString) depName) name) then (match ((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList (fuel - 1)) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (normalized, name)), stack))) normalized) (match dtb__164 with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173) -> dtb__168
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__174) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__174))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__175) -> (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__164, dtb__175, normalized))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString dtb__164))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir dir))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds = (fun package -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package))), (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)))))
and v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__176, dtb__177) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds dtb__176)) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds dtb__177))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__178, dtb__179) -> (match dtb__178 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__180, dtb__181) -> (if (dtb__180 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181)) else ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir mc0) dtb__179))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__182, dtb__183) -> (match dtb__182 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__184, dtb__185) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir dtb__184) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__184, dtb__185)), mc0))) dtb__183)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__186) -> (if (dtb__186 = dtb__185) then ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo mc0) dtb__183) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["pkg: duplicate package name \""; dtb__184; "\" in "; dtb__186; " and "; dtb__185; " (package names must be unique within a dependency graph)"]))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames = (fun packages -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds packages)))

let v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound = 1048576

let v_Vuna_dCompiler_dPackages_dPkg_dloadPackage = (fun dir -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) dir)) (fun package -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList_Cons (package, Base_dList.C_Base_dList_dList_Nil)))) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok (package)))))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dloadMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__187, dtb__188) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath mc0) dtb__187)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__189) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__189))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__190) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers mc0) dtb__188) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__191) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__191))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__192) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__190, dtb__192))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages = (fun rootBaseDir -> ((fun base -> (match (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__193) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__193))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__194) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers base) (match (match dtb__194 with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__195, dtb__196, dtb__197) -> dtb__195
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206) -> dtb__199
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__207) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__207))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__208) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList_Cons (dtb__194, dtb__208)))) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__194, dtb__208))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rootBaseDir)))

let v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports package), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__209, dtb__210, dtb__211) -> dtb__209
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> dtb__216
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__221, dtb__222, dtb__223) -> dtb__221
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232) -> dtb__229
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__233, dtb__234, dtb__235) -> dtb__233
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244) -> dtb__242
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__245, dtb__246, dtb__247) -> dtb__245
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> dtb__255
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__257, dtb__258) -> (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__257)) mc0) then ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots mc0) dtb__258) else (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__257), mc0))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies dtb__257)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__259, dtb__260) -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots dtb__259) dtb__258) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__261, dtb__262) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__261, ((Base_dList.v_Base_dList_dappend dtb__260) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__257), dtb__262)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots = (fun package -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList_Cons (selfName, Base_dList.C_Base_dList_dList_Nil))) (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__263, dtb__264, dtb__265) -> dtb__264
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__266, dtb__267) -> (Base_dList.C_Base_dList_dList_Cons (selfRoot, dtb__267))
  | _ -> failwith "DT: impossible branch"
)) (C_Vuna_dCompiler_dPackages_dPkg_dRoot_Root (((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"), selfName, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__268, dtb__269, dtb__270) -> dtb__268
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__271, dtb__272, dtb__273, dtb__274, dtb__275, dtb__276, dtb__277, dtb__278, dtb__279) -> dtb__275
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__280, dtb__281, dtb__282) -> dtb__280
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291) -> dtb__288
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__292, dtb__293, dtb__294) -> dtb__292
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301, dtb__302, dtb__303) -> dtb__301
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__304, dtb__305, dtb__306) -> dtb__304
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315) -> dtb__314
  | _ -> failwith "DT: impossible branch"
))))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package)))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry = (fun package -> ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/app/Main.vuna"))

let v_Vuna_dCompiler_dPackages_dPkg_dpackageContext = (fun package -> (C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package), (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (package)), (v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots package), (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__316, dtb__317, dtb__318) -> dtb__316
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> dtb__323
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__328, dtb__329, dtb__330) -> dtb__328
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338, dtb__339) -> dtb__336
  | _ -> failwith "DT: impossible branch"
), (match (match package with
  | C_Vuna_dCompiler_dPackages_dPkg_dPackage_Package (dtb__340, dtb__341, dtb__342) -> dtb__340
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dManifest_Manifest (dtb__343, dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351) -> dtb__349
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe = (fun fuel dir -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (dir ^ "/vuna.toml"))) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dir)) else (((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep (fuel - 1)) dir) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir)))))
and v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep = (fun fuel dir parent -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (parent = dir) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe (fuel - 1)) parent))))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe = (fun startDir -> ((fun start -> ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe ((2 * (bi_strLength start)) + 4)) start)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))

let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDir = (fun startDir -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe startDir) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__352) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__352))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["pkg: no vuna.toml found from "; (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir); " (searched upward)"])))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dhasManifest = (fun dir -> (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (dir ^ "/vuna.toml"))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates = (fun exeDir -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../../base"), Base_dList.C_Base_dList_dList_Nil)))))))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound = (fun tried -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["pkg: cannot locate vuna-base (tried: "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText tried); "); set VUNA_BASE to a directory containing vuna.toml"]))))

let rec v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__353, dtb__354) -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dtb__353) then (Base_dResult.C_Base_dResult_dResult_Ok (dtb__353)) else ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase mc0) dtb__354))
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dlocateBase = (fun _u -> ((fun env -> (if (env = "") then ((fun candidates -> ((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase candidates) candidates)) (v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath (Base_dIO_dHost.v_Base_dIO_dHost_drunIO (fun (_ : int) -> (dtp_execPath ()))))))) else ((fun dir -> (if (v_Vuna_dCompiler_dPackages_dPkg_dhasManifest dir) then (Base_dResult.C_Base_dResult_dResult_Ok (dir)) else (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil))))) (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath env)))) (Base_dIO_dHost.v_Base_dIO_dHost_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_BASE"))))

let v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext = (fun base -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage base)) (fun package -> (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_PackageContext ("", Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf package), Base_dList.C_Base_dList_dList_Nil)), "", Base_dList.C_Base_dList_dList_Nil, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, false)))))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextAt = (fun start -> (match (v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe start) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__355) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dtb__355)) (fun package -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dPackages_dPkg_dpackageContext package)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dPackages_dPkg_dlocateBase 0)) v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile = (fun path -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath path))))

let v_Vuna_dCompiler_dPackages_dPkg_dcontextForDir = (fun dir -> (v_Vuna_dCompiler_dPackages_dPkg_dcontextAt (v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath dir)))
