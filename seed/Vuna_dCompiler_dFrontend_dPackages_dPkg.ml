open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot = { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir : string; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName : string; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports : string Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dLayer Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage = { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDir : string }
and t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext = { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir : string; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName : string; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease : bool }
and t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace = { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceDir : string; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceRoot : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceMembers : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage Base_dData_dList.t_Base_dData_dList_dList }

# 46 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDependencies = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest = dtb__0; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies = dtb__1; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDir = dtb__2 } -> dtb__1
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = dtb__3; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = dtb__4; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = dtb__5; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = dtb__6 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = dtb__7; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = dtb__8; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = dtb__9; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = dtb__10 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootLayers = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = dtb__11; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = dtb__12; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = dtb__13; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = dtb__14 } -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootPackage = (fun (root : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot) -> (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root))

# 77 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = dtb__15; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = dtb__16; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = dtb__17; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = dtb__18; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = dtb__19 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = dtb__20; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = dtb__21; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = dtb__22; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = dtb__23; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = dtb__24 } -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageOf = (fun (ctx : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext) -> (ctx).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage)

# 87 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = dtb__25; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = dtb__26; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = dtb__27; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = dtb__28; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = dtb__29 } -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRelease = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = dtb__30; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = dtb__31; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = dtb__32; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = dtb__33; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = dtb__34 } -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease = (fun (release : bool) (ctx : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext) -> { ctx with f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = release })

# 98 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest = dtb__35; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies = dtb__36; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDir = dtb__37 } -> dtb__37
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName = (fun (package : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> (match ((package).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__38) -> dtb__38
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageExports = (fun (package : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> ((package).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports)

# 110 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageLayers = (fun (package : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> ((package).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestLayers)

# 114 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitSlashChars = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__39, dtb__40) -> (if (dtb__39 = 47) then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitSlashChars dtb__40) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc2)), mc1))) Base_dData_dList.C_Base_dData_dList_dList_Nil) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitSlashChars dtb__40) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__39, mc2))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitOnSlash = (fun (path : string) -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitSlashChars (Base_dData_dList.dtp_unpack path)) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 128 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc = (fun (mc0 : bool) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__41, dtb__42) -> (if (dtb__41 = "") then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) mc2) else (if (dtb__41 = ".") then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) mc2) else (if (dtb__41 = "..") then (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if mc0 then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) Base_dData_dList.C_Base_dData_dList_dList_Nil) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("..", Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (if (dtb__43 = "..") then (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("..", mc2))) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) dtb__44))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc mc0) dtb__42) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__41, mc2))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir = (fun (path : string) -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") path) then (match (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc true) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitOnSlash path)) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> "/"
  | dtb__45 -> ("/" ^ (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinSlashes (Base_dData_dList.v_Base_dData_dList_dreverse dtb__45)))
) else (match (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc false) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitOnSlash path)) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> "."
  | dtb__46 -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinSlashes (Base_dData_dList.v_Base_dData_dList_dreverse dtb__46))
)))

# 159 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath = (fun (nEnv : string) (path : string) -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") path) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir path)) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dEnv.v_Base_dEffect_dEnv_denvGetCwd nEnv)) (fun cwd -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir (String.concat "" [cwd; "/"; path])))))))

# 169 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath = (fun (base : string) (rel : string) -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") rel) then (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir rel) else (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir (String.concat "" [base; "/"; rel]))))

# 172 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPathsText = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__47, dtb__48) -> (match dtb__48 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__47
  | _ -> (String.concat "" [dtb__47; ", "; (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPathsText dtb__48)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadManifestAt = (fun (nFs : string) (path : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) path)) (fun text -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest path) text) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__49) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__49))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__50) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest dtb__50) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__51) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__51))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__52) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__52))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1 path) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingManifest ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path))))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir path))))))))

# 197 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmanifestNameString = (fun (manifest : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest) -> (match (manifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__53) -> dtb__53
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmemStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__54)) mc0) then true else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmemStackDir _uctx0) mc0) dtb__55))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, dtb__57) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__56)) mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (match (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcyclePrefix _uctx0) mc0) dtb__57) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__56, dtb__58))))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcycleMessage = (fun (mc0 : string) (mc1 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc2 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__59) -> (match (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcyclePrefix Base_dData_dString.v_Eq_uString) mc0) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__60) -> ("pkg: dependency cycle: " ^ (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinArrows ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) (Base_dData_dList.v_Base_dData_dList_dreverse dtb__60))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__61) -> (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) dtb__61) mc1)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmismatchMessage = (fun (mc0 : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : string) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__62) -> (String.concat "" ["pkg: dependency "; dtb__62; " expects package name "; dtb__62; " but found "; mc1])
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyIdentityEff = (fun (nFs : string) (dep : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dDependency) (dir : string) (manifest : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepIdentityOf dep) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__63) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageSourceEff nFs) dir) manifest)) (fun psR -> (match psR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__64) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__64)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__65) -> ((fun actual -> (if ((Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash dtb__63) = actual) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))) else ((fun detail -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_IdentityMismatch ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), detail))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (detail, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))))))) (String.concat "" ["declared "; dtb__63; ", actual "; actual])))) (Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_didentityHashOf dtb__65))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyPathHashEff = (fun (nFs : string) (dep : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dDependency) (dir : string) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf dep) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__66) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageFilesEff nFs) dir)) (fun filesR -> (match filesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__67) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__67)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__68) -> ((fun actual -> (if ((Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dverifyHash dtb__66) actual) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))) else ((fun detail -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_HashMismatch ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), detail))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep), (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (detail, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))))))) (String.concat "" ["declared "; dtb__66; ", actual "; actual])))) (Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcontentHashOf { Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psName = ""; Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psExports = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psDeps = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psFiles = dtb__68 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadStoreDependency = (fun (nFs : string) (nEnv : string) (fuel : int) (stack : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (dep : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dDependency) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf dep) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_NotMaterialized ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__69) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreDataRootEff nEnv)) (fun root -> ((fun digest -> ((fun dir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) (dir ^ "/.complete"))) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) (dir ^ "/.complete"))) (fun text -> (if (text = digest) then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackageWalk nFs) nEnv) fuel) stack) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__70) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__70)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__71) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyIdentityEff nFs) dep) dir) (dtb__71).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest)) (fun idR -> (match idR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__72) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__72)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__73) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__71)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_NotMaterialized ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_NotMaterialized ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep))))))) (String.concat "" [root; "/pkgs/"; digest]))) (Vuna_dCompiler_dFrontend_dPackages_dSource.v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash dtb__69))))
  | _ -> failwith "DT: impossible branch"
))
# 311 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadDependencyList = (fun (nFs : string) (nEnv : string) (fuel : int) (stack : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (baseDir : string) (deps : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dDependency Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pkg")) else (match deps with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadOneDependency nFs) nEnv) (fuel - 1)) stack) baseDir) dtb__74)) (fun depR -> (match depR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__76) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__76)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__77) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadDependencyList nFs) nEnv) (fuel - 1)) stack) baseDir) dtb__75)) (fun restR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match restR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__78) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__78))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__79) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__79))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 333 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadOneDependency = (fun (nFs : string) (nEnv : string) (fuel : int) (stack : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (baseDir : string) (dep : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dDependency) -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepSourceOf dep) with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__80) -> ((fun dir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackageWalk nFs) nEnv) fuel) stack) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep)))) dir)) (fun depR -> (match depR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__81) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__81)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__82) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyPathHashEff nFs) dep) dir)) (fun hashR -> (match hashR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__83) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__83)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__84) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyIdentityEff nFs) dep) dir) (dtb__82).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest)) (fun idR -> (match idR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__85) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__85)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__86) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__82)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath baseDir) dtb__80))
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__87, dtb__88) -> (((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadStoreDependency nFs) nEnv) fuel) stack) dep)
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__89) -> (((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadStoreDependency nFs) nEnv) fuel) stack) dep)
  | _ -> failwith "DT: impossible branch"
))
# 358 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackageWalk = (fun (nFs : string) (nEnv : string) (fuel : int) (stack : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (depName : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (dir : string) -> (if (fuel <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pkg")) else ((fun normalized -> (if (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmemStackDir Base_dData_dString.v_Eq_uString) normalized) stack) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgInvalid (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcycleMessage normalized) depName) stack))) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadManifestAt nFs) (normalized ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__90) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__90)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__91) -> (match (dtb__91).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0 (dtb__91).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath) Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_NotPackage))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__92) -> ((fun name -> (if (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyNameOk Base_dData_dString.v_Eq_uString) depName) name) then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadDependencyList nFs) nEnv) (fuel - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = normalized; Base_dData_dPair.f_Base_dData_dPair_dPair_second = name }, stack))) normalized) (dtb__91).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies)) (fun dependencyR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match dependencyR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__93) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__93))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__94) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest = dtb__91; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies = dtb__94; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDir = normalized }))
  | _ -> failwith "DT: impossible branch"
)))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgInvalid ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmismatchMessage depName) name))))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmanifestNameString dtb__91))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir dir))))

# 395 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectPackageIds = (fun (package : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName package); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package) }, (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectDependencyIds (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDependencies package)))))
# 400 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectDependencyIds = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__95, dtb__96) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectPackageIds dtb__95)) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectDependencyIds dtb__96))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlookupPackageDir = (fun (mc0 : string) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__100 } -> (if (dtb__99 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__100)) else ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlookupPackageDir mc0) dtb__98))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 410 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniqueNamesGo = (fun (mc0 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__101, dtb__102) -> (match dtb__101 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__103; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__104 } -> (match ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlookupPackageDir dtb__103) mc0) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniqueNamesGo (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__103; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__104 }, mc0))) dtb__102)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__105) -> (if (dtb__105 = dtb__104) then ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniqueNamesGo mc0) dtb__102) else ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_DuplicatePackageName (dtb__103, dtb__105, dtb__104))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (dtb__103, (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (dtb__105, (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (dtb__104, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniquePackageNames = (fun (packages : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniqueNamesGo Base_dData_dList.C_Base_dData_dList_dList_Nil) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectDependencyIds packages)))

# 432 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpkgFuelBound = 1048576

# 436 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage = (fun (nFs : string) (nEnv : string) (dir : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackageWalk nFs) nEnv) v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpkgFuelBound) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) dir)) (fun packageR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match packageR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__106) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__106))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__107) -> (match (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniquePackageNames (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, Base_dData_dList.C_Base_dData_dList_dList_Nil))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__108) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__108))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__109) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__107))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 450 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadMembers = (fun (nFs : string) (nEnv : string) (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath mc0) dtb__110))) (fun memberR -> (match memberR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__112) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__112)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__113) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadMembers nFs) nEnv) mc0) dtb__111)) (fun restR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match restR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__114) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__114))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__115) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__113, dtb__115))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspaceRootOf = (fun (workspace : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace) -> (workspace).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceRoot)

# 478 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspaceMembersOf = (fun (workspace : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace) -> (workspace).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceMembers)

# 482 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspaceAllPackages = (fun (workspace : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace) -> (match (workspace).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceRoot with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (workspace).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceMembers
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__116) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, (workspace).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceMembers))
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadWorkspace = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) -> ((fun base -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadManifestAt nFs) (base ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__117) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__117)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__118) -> (match (dtb__118).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadMembers nFs) nEnv) base) (dtb__118).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers)) (fun membersR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match membersR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__119) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__119))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__120) -> (match (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniquePackageNames dtb__120) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__121) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__121))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__122) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceDir = base; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceRoot = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceMembers = dtb__120 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__123) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) base)) (fun rootR -> (match rootR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__124) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__124)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__125) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadMembers nFs) nEnv) base) (dtb__118).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers)) (fun membersR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match membersR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__126) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__126))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__127) -> (match (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniquePackageNames (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, dtb__127))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__128) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__128))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__129) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceDir = base; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceRoot = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__125)); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceMembers = dtb__127 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir rootBaseDir)))

# 528 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspacePackages = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadWorkspace nFs) nEnv) rootBaseDir)) (fun workspaceR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match workspaceR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__130) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__130))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__131) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspaceAllPackages dtb__131)))
  | _ -> failwith "DT: impossible branch"
)))))

# 551 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRootOf = (fun (package : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package) ^ "/lib"); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageExports package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageLayers package) })

# 541 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspaceContext = (fun (workspace : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace) -> { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = (workspace).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dWorkspace_workspaceDir; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRootOf) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspaceMembersOf workspace)); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = ""; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = false })

# 563 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName dtb__132)) mc0) then ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots mc0) dtb__133) else (match ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName dtb__132), mc0))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDependencies dtb__132)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__134; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__135 } -> (match ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots dtb__134) dtb__133) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__136; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__137 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__136; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__135) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRootOf dtb__132), dtb__137))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageRoots = (fun (package : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> ((fun selfName -> ((fun selfRoot -> (match ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (selfName, Base_dData_dList.C_Base_dData_dList_dList_Nil))) (package).f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageDependencies) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__138; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__139 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (selfRoot, dtb__139))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootDir = ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package) ^ "/lib"); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootName = selfName; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootExports = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dRoot_rootLayerRules = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageLayers package) })) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName package)))

# 585 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry = (fun (package : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package) ^ "/app/Main.vuna"))

# 589 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext = (fun (package : t_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage) -> { f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (package)); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageRoots package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName package); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = false })

# 599 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybe = (fun (nFs : string) (fuel : int) (dir : string) -> (if (fuel <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) (dir ^ "/vuna.toml"))) (fun exists -> (if exists then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dir))) else ((((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybeStep nFs) (fuel - 1)) dir) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir dir)))))))
# 608 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybeStep = (fun (nFs : string) (fuel : int) (dir : string) (parent : string) -> (if (fuel <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (if (parent = dir) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybe nFs) (fuel - 1)) parent))))

# 619 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDirMaybe = (fun (nFs : string) (startDir : string) -> ((fun start -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybe nFs) ((2 * (bi_strLength start)) + 4)) start)) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir startDir)))

# 627 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDir = (fun (nFs : string) (startDir : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDirMaybe nFs) startDir)) (fun found -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match found with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__140) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__140))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_NoManifestUpward ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir startDir)))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir startDir), Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)))))

# 641 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dhasManifest = (fun (nFs : string) (dir : string) -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) (dir ^ "/vuna.toml")))

# 644 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseCandidates = (fun (exeDir : string) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath exeDir) "base"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath exeDir) "../base"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath exeDir) "../../base"), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath exeDir) "../../../base"), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))

# 653 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseNotFound = (fun (tried : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_MissingBase ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPathsText tried)))) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPathsText tried)))

# 656 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfirstExistingBase = (fun (nFs : string) (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__141, dtb__142) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dhasManifest nFs) dtb__141)) (fun exists -> (if exists then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__141))) else (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfirstExistingBase nFs) mc0) dtb__142))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseNotFound mc0))
  | _ -> failwith "DT: impossible branch"
))

# 665 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlocateBase = (fun (nFs : string) (nEnv : string) (_u : Base_dData_dUnit.t_Base_dData_dUnit_dUnit) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dEnv.v_Base_dEffect_dEnv_denvGetEnv nEnv) "VUNA_BASE")) (fun env -> (if (env = "") then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dEnv.v_Base_dEffect_dEnv_denvExecPath nEnv)) (fun exe -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) exe)) (fun cwd -> ((fun candidates -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfirstExistingBase nFs) candidates) candidates)) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseCandidates (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir cwd))))))) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) env)) (fun dir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dhasManifest nFs) dir)) (fun exists -> (if exists then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dir))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseNotFound (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dir, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))))))

# 686 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseOnlyContext = (fun (nFs : string) (nEnv : string) (base : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) base)) (fun packageR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match packageR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__143) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__143))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__144) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextDir = ""; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackage = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRoots = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRootOf dtb__144), Base_dData_dList.C_Base_dData_dList_dList_Nil)); f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextPackageName = ""; f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackageContext_contextRelease = false }))
  | _ -> failwith "DT: impossible branch"
)))))

# 699 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextAt = (fun (nFs : string) (nEnv : string) (start : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDirMaybe nFs) start)) (fun found -> (match found with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__145) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadManifestAt nFs) (dtb__145 ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__146) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__146)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__147) -> (match (dtb__147).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadWorkspace nFs) nEnv) dtb__145)) (fun workspaceR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match workspaceR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__148) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__148))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__149) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspaceContext dtb__149)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__150) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) dtb__145)) (fun packageR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match packageR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__151) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__151))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__152) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext dtb__152)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlocateBase nFs) nEnv) Base_dData_dUnit.C_Base_dData_dUnit_dUnit_MkUnit)) (fun baseR -> (match baseR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__153) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__153)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__154) -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseOnlyContext nFs) nEnv) dtb__154)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 735 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextForFile = (fun (nFs : string) (nEnv : string) (path : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) path)) (fun absolute -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextAt nFs) nEnv) (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir absolute)))))

# 744 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextForDir = (fun (nFs : string) (nEnv : string) (dir : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) dir)) (fun absolute -> (((v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextAt nFs) nEnv) absolute))))
