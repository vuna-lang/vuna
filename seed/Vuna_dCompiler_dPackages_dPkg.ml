open Vuna_runtime
type t_Vuna_dCompiler_dPackages_dPkg_dRoot = { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir : string; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName : string; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dPackages_dPkg_dPackage = { f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies : t_Vuna_dCompiler_dPackages_dPkg_dPackage Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDir : string }
and t_Vuna_dCompiler_dPackages_dPkg_dPackageContext = { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir : string; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage : t_Vuna_dCompiler_dPackages_dPkg_dPackage Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots : t_Vuna_dCompiler_dPackages_dPkg_dRoot Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName : string; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRelease : bool }

# 44 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest = dtb__0; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies = dtb__1; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDir = dtb__2 } -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_drootDir = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = dtb__3; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = dtb__4; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = dtb__5 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_drootName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = dtb__6; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = dtb__7; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = dtb__8 } -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_drootPackage = (fun root -> (v_Vuna_dCompiler_dPackages_dPkg_drootName root))

# 72 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcontextDir = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__9; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__10; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__11; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__12; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRelease = dtb__13 } -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__14; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__15; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__16; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__17; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRelease = dtb__18 } -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf = (fun ctx -> (ctx).f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage)

# 82 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__19; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__20; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__21; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__22; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRelease = dtb__23 } -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = dtb__24; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = dtb__25; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = dtb__26; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = dtb__27; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRelease = dtb__28 } -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease = (fun release ctx -> { ctx with f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRelease = release })

# 93 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dpackageDir = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest = dtb__29; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies = dtb__30; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDir = dtb__31 } -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dpackageName = (fun package -> (match ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__32) -> dtb__32
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dpackageExports = (fun package -> ((package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports)

# 105 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (if (dtb__33 = 47) then (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__34) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars dtb__34) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__33, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash = (fun path -> (((v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 117 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (if (dtb__35 = "") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__36) mc2) else (if (dtb__35 = ".") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__36) mc2) else (if (dtb__35 = "..") then (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (if mc0 then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__36) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__36) (Base_dList.C_Base_dList_dList_Cons ("..", Base_dList.C_Base_dList_dList_Nil))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (if (dtb__37 = "..") then (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__36) (Base_dList.C_Base_dList_dList_Cons ("..", mc2))) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__36) dtb__38))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc mc0) dtb__36) (Base_dList.C_Base_dList_dList_Cons (dtb__35, mc2))))))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "/"
  | dtb__39 -> ("/" ^ (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__39)))
) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | dtb__40 -> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__40))
)))

# 141 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath = (fun nEnv path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir path)) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffEnv.v_Base_dEffEnv_denvGetCwd nEnv)) (fun cwd -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [cwd; "/"; path])))))))

# 148 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_djoinPath = (fun base rel -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (String.concat "" [base; "/"; rel]))))

# 151 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (match dtb__42 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__41
  | _ -> (String.concat "" [dtb__41; ", "; (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText dtb__42)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt = (fun nFs path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun text -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) text) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__43) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__43))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__44) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__44) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__45) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__45))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__46) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__46))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 path) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_MissingManifest ((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path))))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path))))))))

# 172 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString = (fun manifest -> (match (manifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47) -> dtb__47
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__48)) mc0) then true else (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir _uctx0) mc0) dtb__49))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__50)) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__50, Base_dList.C_Base_dList_dList_Nil)))) else (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix _uctx0) mc0) dtb__51) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__52))))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53) -> (match (((v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix Base_dString.v_Eq_uString) mc0) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> ("pkg: dependency cycle: " ^ (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinArrows ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (Base_dList.v_Base_dList_dreverse dtb__54))) (Base_dList.C_Base_dList_dList_Cons (dtb__53, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55) -> (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__55) mc1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> (String.concat "" ["pkg: dependency "; dtb__56; " expects package name "; dtb__56; " but found "; mc1])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dverifyIdentityEff = (fun nFs dep dir manifest -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepIdentityOf dep) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dPackages_dSource.v_Vuna_dCompiler_dPackages_dSource_dpackageSourceEff nFs) dir) manifest)) (fun ps -> ((fun actual -> (if ((Vuna_dCompiler_dPackages_dSource.v_Vuna_dCompiler_dPackages_dSource_dnormalizeHash dtb__57) = actual) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))) else ((fun detail -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_IdentityMismatch ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), detail))) (Base_dVec.C_Base_dVec_dVec_Cons ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), (Base_dVec.C_Base_dVec_dVec_Cons (detail, Base_dVec.C_Base_dVec_dVec_Nil))))))) (String.concat "" ["declared "; dtb__57; ", actual "; actual])))) (Vuna_dCompiler_dPackages_dSource.v_Vuna_dCompiler_dPackages_dSource_didentityHashOf ps))))
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dverifyPathHashEff = (fun nFs dep dir -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf dep) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dPackages_dSource.v_Vuna_dCompiler_dPackages_dSource_dpackageFilesEff nFs) dir)) (fun files -> ((fun actual -> (if ((Vuna_dCompiler_dPackages_dSource.v_Vuna_dCompiler_dPackages_dSource_dverifyHash dtb__58) actual) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))) else ((fun detail -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_HashMismatch ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), detail))) (Base_dVec.C_Base_dVec_dVec_Cons ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), (Base_dVec.C_Base_dVec_dVec_Cons (detail, Base_dVec.C_Base_dVec_dVec_Nil))))))) (String.concat "" ["declared "; dtb__58; ", actual "; actual])))) (Vuna_dCompiler_dPackages_dSource.v_Vuna_dCompiler_dPackages_dSource_dcontentHashOf { Vuna_dCompiler_dCanonical_dPkg.f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psName = ""; Vuna_dCompiler_dCanonical_dPkg.f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psExports = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dCanonical_dPkg.f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psDeps = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dCanonical_dPkg.f_Vuna_dCompiler_dCanonical_dPkg_dPackageSource_psFiles = files }))))
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dloadStoreDependency = (fun nFs nEnv fuel stack dep -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf dep) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_NotMaterialized ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreDataRootEff nEnv)) (fun root -> ((fun digest -> ((fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (dir ^ "/.complete"))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) (dir ^ "/.complete"))) (fun text -> (if (text = digest) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk nFs) nEnv) fuel) stack) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__60) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__60)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__61) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dPackages_dPkg_dverifyIdentityEff nFs) dep) dir) (dtb__61).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest)) (fun idR -> (match idR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__62) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__62)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__63) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__61)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_NotMaterialized ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_NotMaterialized ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep))))))) (String.concat "" [root; "/pkgs/"; digest]))) (Vuna_dCompiler_dPackages_dSource.v_Vuna_dCompiler_dPackages_dSource_dnormalizeHash dtb__59))))
  | _ -> failwith "DT: impossible branch"
))
# 260 "Vuna/Compiler/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList = (fun nFs nEnv fuel stack baseDir deps -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pkg")) else (match deps with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dPackages_dPkg_dloadOneDependency nFs) nEnv) (fuel - 1)) stack) baseDir) dtb__64)) (fun depR -> (match depR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__66) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__66)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__67) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList nFs) nEnv) (fuel - 1)) stack) baseDir) dtb__65)) (fun restR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match restR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__68) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__68))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__69) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__67, dtb__69))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 276 "Vuna/Compiler/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dPackages_dPkg_dloadOneDependency = (fun nFs nEnv fuel stack baseDir dep -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepSourceOf dep) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__70) -> ((fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk nFs) nEnv) fuel) stack) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) dir)) (fun depR -> (match depR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__71) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__71)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__72) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dPackages_dPkg_dverifyPathHashEff nFs) dep) dir)) (fun hashR -> (match hashR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__73) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__73)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__74) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dPackages_dPkg_dverifyIdentityEff nFs) dep) dir) (dtb__72).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest)) (fun idR -> (match idR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__75) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__75)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__76) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__72)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath baseDir) dtb__70))
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__77, dtb__78) -> (((((v_Vuna_dCompiler_dPackages_dPkg_dloadStoreDependency nFs) nEnv) fuel) stack) dep)
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__79) -> (((((v_Vuna_dCompiler_dPackages_dPkg_dloadStoreDependency nFs) nEnv) fuel) stack) dep)
  | _ -> failwith "DT: impossible branch"
))
# 297 "Vuna/Compiler/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk = (fun nFs nEnv fuel stack depName dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "pkg")) else ((fun normalized -> (if (((v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir Base_dString.v_Eq_uString) normalized) stack) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgInvalid (((v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage normalized) depName) stack))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt nFs) (normalized ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__80) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__80)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__81) -> ((fun name -> (if (((v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk Base_dString.v_Eq_uString) depName) name) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList nFs) nEnv) (fuel - 1)) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = normalized; Base_dPair.f_Base_dPair_dPair_second = name }, stack))) normalized) (dtb__81).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies)) (fun dependencyR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match dependencyR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__82) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__82))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__83) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest = dtb__81; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies = dtb__83; f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDir = normalized }))
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgInvalid ((v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString dtb__81))
  | _ -> failwith "DT: impossible branch"
))))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir dir))))

# 326 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds = (fun package -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) }, (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies package)))))
# 331 "Vuna/Compiler/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds dtb__84)) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds dtb__85))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (match dtb__86 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__88; Base_dPair.f_Base_dPair_dPair_second = dtb__89 } -> (if (dtb__88 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__89)) else ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir mc0) dtb__87))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 341 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match dtb__90 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__92; Base_dPair.f_Base_dPair_dPair_second = dtb__93 } -> (match ((v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir dtb__92) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__92; Base_dPair.f_Base_dPair_dPair_second = dtb__93 }, mc0))) dtb__91)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94) -> (if (dtb__94 = dtb__93) then ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo mc0) dtb__91) else ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DuplicatePackageName (dtb__92, dtb__94, dtb__93))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__92, (Base_dVec.C_Base_dVec_dVec_Cons (dtb__94, (Base_dVec.C_Base_dVec_dVec_Cons (dtb__93, Base_dVec.C_Base_dVec_dVec_Nil))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames = (fun packages -> ((v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds packages)))

# 360 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound = 1048576

# 364 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dloadPackage = (fun nFs nEnv dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk nFs) nEnv) v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) dir)) (fun packageR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match packageR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__95) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__95))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__96) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList_Cons (dtb__96, Base_dList.C_Base_dList_dList_Nil))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__97) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__97))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__98) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__96))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 375 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dloadMembers = (fun nFs nEnv mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dPackages_dPkg_dloadPackage nFs) nEnv) ((v_Vuna_dCompiler_dPackages_dPkg_djoinPath mc0) dtb__99))) (fun memberR -> (match memberR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__101) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__101)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__102) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers nFs) nEnv) mc0) dtb__100)) (fun restR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match restR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__103) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__103))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__104) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__104))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages = (fun nFs nEnv rootBaseDir -> ((fun base -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dPackages_dPkg_dloadPackage nFs) nEnv) base)) (fun rootR -> (match rootR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__105) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__105)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__106) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dPackages_dPkg_dloadMembers nFs) nEnv) base) ((dtb__106).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers)) (fun membersR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match membersR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__107) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__107))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__108) -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__108))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__109) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__109))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__110) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__108))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir rootBaseDir)))

# 409 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf = (fun package -> { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"); f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package); f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports package) })

# 417 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__111)) mc0) then ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots mc0) dtb__112) else (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__111), mc0))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies dtb__111)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__113; Base_dPair.f_Base_dPair_dPair_second = dtb__114 } -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots dtb__113) dtb__112) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__115; Base_dPair.f_Base_dPair_dPair_second = dtb__116 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__115; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__114) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__111), dtb__116))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots = (fun package -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList_Cons (selfName, Base_dList.C_Base_dList_dList_Nil))) (package).f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__117; Base_dPair.f_Base_dPair_dPair_second = dtb__118 } -> (Base_dList.C_Base_dList_dList_Cons (selfRoot, dtb__118))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootDir = ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/lib"); f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootName = selfName; f_Vuna_dCompiler_dPackages_dPkg_dRoot_rootExports = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing })) (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package)))

# 435 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry = (fun package -> ((v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package) ^ "/app/Main.vuna"))

# 439 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dpackageContext = (fun package -> { f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = (v_Vuna_dCompiler_dPackages_dPkg_dpackageDir package); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (package)); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = (v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots package); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = (v_Vuna_dCompiler_dPackages_dPkg_dpackageName package); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRelease = false })

# 445 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe = (fun nFs fuel dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (dir ^ "/vuna.toml"))) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dir))) else ((((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep nFs) (fuel - 1)) dir) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir)))))))
# 451 "Vuna/Compiler/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep = (fun nFs fuel dir parent -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else (if (parent = dir) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else (((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe nFs) (fuel - 1)) parent))))

# 461 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe = (fun nFs startDir -> ((fun start -> (((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe nFs) ((2 * (bi_strLength start)) + 4)) start)) (v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))

# 469 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDir = (fun nFs startDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe nFs) startDir)) (fun found -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match found with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__119))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_NoManifestUpward ((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir)))) (Base_dVec.C_Base_dVec_dVec_Cons ((v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir startDir), Base_dVec.C_Base_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)))))

# 481 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dhasManifest = (fun nFs dir -> ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (dir ^ "/vuna.toml")))

# 484 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates = (fun exeDir -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../base"), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dPackages_dPkg_djoinPath exeDir) "../../../base"), Base_dList.C_Base_dList_dList_Nil)))))))))

# 492 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound = (fun tried -> ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_MissingBase ((v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText tried)))) (v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText tried)))

# 495 "Vuna/Compiler/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase = (fun nFs mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dhasManifest nFs) dtb__120)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__120))) else (((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase nFs) mc0) dtb__121))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound mc0))
  | _ -> failwith "DT: impossible branch"
))

# 503 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dlocateBase = (fun nFs nEnv _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_BASE")) (fun env -> (if (env = "") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffEnv.v_Base_dEffEnv_denvExecPath nEnv)) (fun exe -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath nEnv) exe)) (fun cwd -> ((fun candidates -> (((v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase nFs) candidates) candidates)) (v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir cwd))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath nEnv) env)) (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dhasManifest nFs) dir)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dir))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil)))))))))))))

# 521 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext = (fun nFs nEnv base -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dPackages_dPkg_dloadPackage nFs) nEnv) base)) (fun packageR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match packageR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__122) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__122))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__123) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextDir = ""; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRoots = (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf dtb__123), Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackageName = ""; f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextRelease = false }))
  | _ -> failwith "DT: impossible branch"
)))))

# 531 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcontextAt = (fun nFs nEnv start -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe nFs) start)) (fun found -> (match found with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__124) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dPackages_dPkg_dloadPackage nFs) nEnv) dtb__124)) (fun packageR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match packageR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__125) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__125))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__126) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__126)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dPackages_dPkg_dlocateBase nFs) nEnv) 0)) (fun baseR -> (match baseR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__127) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__127)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__128) -> (((v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext nFs) nEnv) dtb__128)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 548 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile = (fun nFs nEnv path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath nEnv) path)) (fun absolute -> (((v_Vuna_dCompiler_dPackages_dPkg_dcontextAt nFs) nEnv) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir absolute)))))

# 556 "Vuna/Compiler/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dPackages_dPkg_dcontextForDir = (fun nFs nEnv dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath nEnv) dir)) (fun absolute -> (((v_Vuna_dCompiler_dPackages_dPkg_dcontextAt nFs) nEnv) absolute))))
