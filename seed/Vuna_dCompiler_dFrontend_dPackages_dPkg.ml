open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot = { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir : string; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName : string; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage = { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDir : string }
and t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext = { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir : string; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName : string; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease : bool }

# 45 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDependencies = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest = dtb__0; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies = dtb__1; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDir = dtb__2 } -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = dtb__3; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = dtb__4; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = dtb__5; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = dtb__6 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = dtb__7; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = dtb__8; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = dtb__9; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = dtb__10 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootLayers = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = dtb__11; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = dtb__12; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = dtb__13; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = dtb__14 } -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootPackage = (fun root -> (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root))

# 76 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = dtb__15; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = dtb__16; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = dtb__17; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = dtb__18; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = dtb__19 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = dtb__20; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = dtb__21; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = dtb__22; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = dtb__23; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = dtb__24 } -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageOf = (fun ctx -> (ctx).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage)

# 86 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = dtb__25; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = dtb__26; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = dtb__27; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = dtb__28; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = dtb__29 } -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRelease = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = dtb__30; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = dtb__31; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = dtb__32; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = dtb__33; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = dtb__34 } -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease = (fun release ctx -> { ctx with f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = release })

# 97 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest = dtb__35; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies = dtb__36; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDir = dtb__37 } -> dtb__37
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName = (fun package -> (match ((package).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> dtb__38
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageExports = (fun package -> ((package).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports)

# 108 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageLayers = (fun package -> ((package).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers)

# 112 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitSlashChars = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__39, dtb__40) -> (if (dtb__39 = 47) then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitSlashChars dtb__40) (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1))) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitSlashChars dtb__40) mc1) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__39, mc2))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitOnSlash = (fun path -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitSlashChars (Base_dList.dtp_unpack path)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 124 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__41, dtb__42) -> (if (dtb__41 = "") then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) mc2) else (if (dtb__41 = ".") then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) mc2) else (if (dtb__41 = "..") then (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (if mc0 then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) Base_dList.C_Base_dList_dList_Nil) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) (Base_dList.C_Base_dList_dList__x58__x58_ ("..", Base_dList.C_Base_dList_dList_Nil))))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (if (dtb__43 = "..") then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) (Base_dList.C_Base_dList_dList__x58__x58_ ("..", mc2))) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) dtb__44))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__41, mc2))))))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "/"
  | dtb__45 -> ("/" ^ (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__45)))
) else (match (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitOnSlash path)) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | dtb__46 -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinSlashes (Base_dList.v_Base_dList_dreverse dtb__46))
)))

# 148 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath = (fun nEnv path -> (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir path)) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffEnv.v_Base_dEffEnv_denvGetCwd nEnv)) (fun cwd -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir (String.concat "" [cwd; "/"; path])))))))

# 155 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath = (fun base rel -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir (String.concat "" [base; "/"; rel]))))

# 158 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPathsText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__47, dtb__48) -> (match dtb__48 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__47
  | _ -> (String.concat "" [dtb__47; ", "; (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPathsText dtb__48)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadManifestAt = (fun nFs path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun text -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) text) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__49) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__49))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__50) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__50) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__51) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__51))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__52) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__52))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 path) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingManifest ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path))))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path))))))))

# 179 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmanifestNameString = (fun manifest -> (match (manifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53) -> dtb__53
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmemStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__54)) mc0) then true else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmemStackDir _uctx0) mc0) dtb__55))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__56, dtb__57) -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ _uctx0) (Base_dPair.v_Base_dPair_dfirstOf dtb__56)) mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__56, Base_dList.C_Base_dList_dList_Nil)))) else (match (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcyclePrefix _uctx0) mc0) dtb__57) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__56, dtb__58))))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcycleMessage = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (match (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcyclePrefix Base_dString.v_Eq_uString) mc0) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60) -> ("pkg: dependency cycle: " ^ (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinArrows ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) (Base_dList.v_Base_dList_dreverse dtb__60))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__59, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (((Base_dEq.v_Base_dEq_d_x61__x61_ _uctx0) dtb__61) mc1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmismatchMessage = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> (String.concat "" ["pkg: dependency "; dtb__62; " expects package name "; dtb__62; " but found "; mc1])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyIdentityEff = (fun nFs dep dir manifest -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepIdentityOf dep) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__63) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageSourceEff nFs) dir) manifest)) (fun ps -> ((fun actual -> (if ((Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash dtb__63) = actual) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))) else ((fun detail -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_IdentityMismatch ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), detail))) (Base_dVec.C_Base_dVec_dVec_VCons ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), (Base_dVec.C_Base_dVec_dVec_VCons (detail, Base_dVec.C_Base_dVec_dVec_Nil))))))) (String.concat "" ["declared "; dtb__63; ", actual "; actual])))) (Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_didentityHashOf ps))))
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyPathHashEff = (fun nFs dep dir -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf dep) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageFilesEff nFs) dir)) (fun files -> ((fun actual -> (if ((Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dverifyHash dtb__64) actual) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))) else ((fun detail -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_HashMismatch ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), detail))) (Base_dVec.C_Base_dVec_dVec_VCons ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), (Base_dVec.C_Base_dVec_dVec_VCons (detail, Base_dVec.C_Base_dVec_dVec_Nil))))))) (String.concat "" ["declared "; dtb__64; ", actual "; actual])))) (Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcontentHashOf { Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psName = ""; Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psExports = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psDeps = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psFiles = files }))))
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadStoreDependency = (fun nFs nEnv fuel stack dep -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf dep) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_NotMaterialized ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreDataRootEff nEnv)) (fun root -> ((fun digest -> ((fun dir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (dir ^ "/.complete"))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) (dir ^ "/.complete"))) (fun text -> (if (text = digest) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackageWalk nFs) nEnv) fuel) stack) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__66) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__66)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__67) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyIdentityEff nFs) dep) dir) (dtb__67).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest)) (fun idR -> (match idR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__68) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__68)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__69) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__67)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_NotMaterialized ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_NotMaterialized ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep))))))) (String.concat "" [root; "/pkgs/"; digest]))) (Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash dtb__65))))
  | _ -> failwith "DT: impossible branch"
))
# 267 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadDependencyList = (fun nFs nEnv fuel stack baseDir deps -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pkg")) else (match deps with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadOneDependency nFs) nEnv) (fuel - 1)) stack) baseDir) dtb__70)) (fun depR -> (match depR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__72) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__72)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__73) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadDependencyList nFs) nEnv) (fuel - 1)) stack) baseDir) dtb__71)) (fun restR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match restR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__74) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__74))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__75) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__73, dtb__75))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 283 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadOneDependency = (fun nFs nEnv fuel stack baseDir dep -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepSourceOf dep) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__76) -> ((fun dir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackageWalk nFs) nEnv) fuel) stack) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) dir)) (fun depR -> (match depR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__77) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__77)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__78) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyPathHashEff nFs) dep) dir)) (fun hashR -> (match hashR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__80) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyIdentityEff nFs) dep) dir) (dtb__78).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest)) (fun idR -> (match idR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__81) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__81)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__82) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__78)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath baseDir) dtb__76))
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__83, dtb__84) -> (((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadStoreDependency nFs) nEnv) fuel) stack) dep)
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__85) -> (((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadStoreDependency nFs) nEnv) fuel) stack) dep)
  | _ -> failwith "DT: impossible branch"
))
# 304 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackageWalk = (fun nFs nEnv fuel stack depName dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pkg")) else ((fun normalized -> (if (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmemStackDir Base_dString.v_Eq_uString) normalized) stack) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgInvalid (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcycleMessage normalized) depName) stack))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadManifestAt nFs) (normalized ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__86) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__86)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__87) -> ((fun name -> (if (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyNameOk Base_dString.v_Eq_uString) depName) name) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadDependencyList nFs) nEnv) (fuel - 1)) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = normalized; Base_dPair.f_Base_dPair_dPair_second = name }, stack))) normalized) (dtb__87).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies)) (fun dependencyR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match dependencyR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__88) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__88))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__89) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest = dtb__87; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies = dtb__89; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDir = normalized }))
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgInvalid ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmanifestNameString dtb__87))
  | _ -> failwith "DT: impossible branch"
))))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir dir))))

# 333 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectPackageIds = (fun package -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName package); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package) }, (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDependencies package)))))
# 338 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectDependencyIds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__90, dtb__91) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectPackageIds dtb__90)) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectDependencyIds dtb__91))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlookupPackageDir = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__92, dtb__93) -> (match dtb__92 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__94; Base_dPair.f_Base_dPair_dPair_second = dtb__95 } -> (if (dtb__94 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95)) else ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlookupPackageDir mc0) dtb__93))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniqueNamesGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__98; Base_dPair.f_Base_dPair_dPair_second = dtb__99 } -> (match ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlookupPackageDir dtb__98) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniqueNamesGo (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__98; Base_dPair.f_Base_dPair_dPair_second = dtb__99 }, mc0))) dtb__97)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__100) -> (if (dtb__100 = dtb__99) then ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniqueNamesGo mc0) dtb__97) else ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DuplicatePackageName (dtb__98, dtb__100, dtb__99))) (Base_dVec.C_Base_dVec_dVec_VCons (dtb__98, (Base_dVec.C_Base_dVec_dVec_VCons (dtb__100, (Base_dVec.C_Base_dVec_dVec_VCons (dtb__99, Base_dVec.C_Base_dVec_dVec_Nil))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniquePackageNames = (fun packages -> ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniqueNamesGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectDependencyIds packages)))

# 367 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpkgFuelBound = 1048576

# 371 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage = (fun nFs nEnv dir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackageWalk nFs) nEnv) v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpkgFuelBound) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) dir)) (fun packageR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match packageR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__101) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__101))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__102) -> (match (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__102, Base_dList.C_Base_dList_dList_Nil))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__103) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__103))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__104) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 382 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadMembers = (fun nFs nEnv mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath mc0) dtb__105))) (fun memberR -> (match memberR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__107) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__107)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__108) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadMembers nFs) nEnv) mc0) dtb__106)) (fun restR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match restR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__109) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__109))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__110) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__108, dtb__110))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspacePackages = (fun nFs nEnv rootBaseDir -> ((fun base -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) base)) (fun rootR -> (match rootR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__111) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__111)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__112) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadMembers nFs) nEnv) base) ((dtb__112).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers)) (fun membersR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match membersR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__113) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__113))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__114) -> (match (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniquePackageNames (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__112, dtb__114))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__115) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__115))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__116) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__112, dtb__114))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir rootBaseDir)))

# 416 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRootOf = (fun package -> { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package) ^ "/lib"); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageExports package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageLayers package) })

# 425 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__117, dtb__118) -> (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName dtb__117)) mc0) then ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots mc0) dtb__118) else (match ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName dtb__117), mc0))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDependencies dtb__117)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = dtb__120 } -> (match ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots dtb__119) dtb__118) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__121; Base_dPair.f_Base_dPair_dPair_second = dtb__122 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__121; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__120) (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRootOf dtb__117), dtb__122))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageRoots = (fun package -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots (Base_dList.C_Base_dList_dList__x58__x58_ (selfName, Base_dList.C_Base_dList_dList_Nil))) (package).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__123; Base_dPair.f_Base_dPair_dPair_second = dtb__124 } -> (Base_dList.C_Base_dList_dList__x58__x58_ (selfRoot, dtb__124))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package) ^ "/lib"); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = selfName; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageLayers package) })) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName package)))

# 443 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry = (fun package -> ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package) ^ "/app/Main.vuna"))

# 447 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext = (fun package -> { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (package)); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageRoots package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = false })

# 453 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybe = (fun nFs fuel dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (dir ^ "/vuna.toml"))) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dir))) else ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybeStep nFs) (fuel - 1)) dir) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir)))))))
# 459 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybeStep = (fun nFs fuel dir parent -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else (if (parent = dir) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybe nFs) (fuel - 1)) parent))))

# 469 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDirMaybe = (fun nFs startDir -> ((fun start -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybe nFs) ((2 * (bi_strLength start)) + 4)) start)) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir startDir)))

# 477 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDir = (fun nFs startDir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDirMaybe nFs) startDir)) (fun found -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match found with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__125) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__125))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_NoManifestUpward ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir startDir)))) (Base_dVec.C_Base_dVec_dVec_VCons ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir startDir), Base_dVec.C_Base_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)))))

# 489 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dhasManifest = (fun nFs dir -> ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (dir ^ "/vuna.toml")))

# 492 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseCandidates = (fun exeDir -> (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath exeDir) "base"), (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath exeDir) "../base"), (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath exeDir) "../../base"), (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath exeDir) "../../../base"), Base_dList.C_Base_dList_dList_Nil)))))))))

# 500 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseNotFound = (fun tried -> ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingBase ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPathsText tried)))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPathsText tried)))

# 503 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfirstExistingBase = (fun nFs mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__126, dtb__127) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dhasManifest nFs) dtb__126)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__126))) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfirstExistingBase nFs) mc0) dtb__127))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseNotFound mc0))
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlocateBase = (fun nFs nEnv _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_BASE")) (fun env -> (if (env = "") then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffEnv.v_Base_dEffEnv_denvExecPath nEnv)) (fun exe -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) exe)) (fun cwd -> ((fun candidates -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfirstExistingBase nFs) candidates) candidates)) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseCandidates (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir cwd))))))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) env)) (fun dir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dhasManifest nFs) dir)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dir))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseNotFound (Base_dList.C_Base_dList_dList__x58__x58_ (dir, Base_dList.C_Base_dList_dList_Nil)))))))))))))

# 529 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseOnlyContext = (fun nFs nEnv base -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) base)) (fun packageR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match packageR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__128) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__128))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__129) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = ""; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRootOf dtb__129), Base_dList.C_Base_dList_dList_Nil)); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = ""; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = false }))
  | _ -> failwith "DT: impossible branch"
)))))

# 539 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextAt = (fun nFs nEnv start -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDirMaybe nFs) start)) (fun found -> (match found with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__130) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) dtb__130)) (fun packageR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match packageR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__131) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__131))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__132) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext dtb__132)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlocateBase nFs) nEnv) 0)) (fun baseR -> (match baseR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__133) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__133)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__134) -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseOnlyContext nFs) nEnv) dtb__134)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 556 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextForFile = (fun nFs nEnv path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) path)) (fun absolute -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextAt nFs) nEnv) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir absolute)))))

# 564 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextForDir = (fun nFs nEnv dir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) dir)) (fun absolute -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextAt nFs) nEnv) absolute))))
