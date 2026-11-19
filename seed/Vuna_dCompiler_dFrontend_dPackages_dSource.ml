open Vuna_runtime
# 24 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dskipSourceDir = (fun (name : string) -> (if (if (if (if (if (if (if (if (name = ".git") then true else (name = ".local")) then true else (name = ".output")) then true else (name = ".direnv")) then true else (name = "node_modules")) then true else (name = "seed")) then true else (name = "_scratch")) then true else (name = "result")) then true else (name = "corpus")))

# 39 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash = (fun (h : string) -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "sha256:") h) then (((Base_dData_dString.v_Base_dData_dString_dsubstring 7) 64) h) else h))

# 43 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dverifyHash = (fun (expected : string) (actual : string) -> ((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash expected) = (v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash actual)))

# 70 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpkgSourceDepth = 4096

# 73 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dreadManifestFile = (fun (nFs : string) (root : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) (root ^ "/vuna.toml"))) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) (root ^ "/vuna.toml"))) (fun content -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageFile_pfPath = "vuna.toml"; Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageFile_pfContent = content }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 84 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let rec v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectDirFiles = (fun (nFs : string) (fuel : int) (root : string) (rel : string) -> (if (fuel <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "package file collection")) else ((fun dir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) dir)) (fun exists -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (if exists then ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) dir) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) dir)) (fun names -> (((((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectNames nFs) fuel) root) rel) names))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))) (if (rel = "") then root else (String.concat "" [root; "/"; rel])))))
# 101 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectNames = (fun (nFs : string) (mc0 : int) (mc1 : string) (mc2 : string) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (mc0 <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "package file collection")) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dwalkName nFs) mc0) mc1) mc2) dtb__0)) (fun hereR -> (match hereR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__2) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__2)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__3) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectNames nFs) mc0) mc1) mc2) dtb__1)) (fun thereR -> (match thereR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__4) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__4)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__5) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend dtb__3) dtb__5))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 118 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_Vuna_dCompiler_dFrontend_dPackages_dSource_dwalkName = (fun (nFs : string) (fuel : int) (root : string) (rel : string) (name : string) -> (if (fuel <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "package file collection")) else (if (name = ".") then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (if (name = "..") then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (if (v_Vuna_dCompiler_dFrontend_dPackages_dSource_dskipSourceDir name) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))) else ((fun childRel -> ((fun childPath -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) childPath)) (fun isDir -> (if isDir then ((((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectDirFiles nFs) (fuel - 1)) root) childRel) else (if ((Base_dData_dString.v_Base_dData_dString_dendsWith ".vuna") name) then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) childPath)) (fun content -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageFile_pfPath = childRel; Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageFile_pfContent = content }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))) (String.concat "" [root; "/"; childRel]))) (if (rel = "") then name else (String.concat "" [rel; "/"; name]))))))))

# 144 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dfilePathLe = (fun (a : Vuna_dCompiler_dFrontend_dCanonical_dPkg.t_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageFile) (b : Vuna_dCompiler_dFrontend_dCanonical_dPkg.t_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageFile) -> ((a).Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageFile_pfPath <= (b).Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageFile_pfPath))

# 147 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dsortByPath = (fun (files : Vuna_dCompiler_dFrontend_dCanonical_dPkg.t_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageFile Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dSort.v_Base_dData_dSort_dsortBy v_Vuna_dCompiler_dFrontend_dPackages_dSource_dfilePathLe) files))

# 48 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageFilesEff = (fun (nFs : string) (root : string) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dreadManifestFile nFs) root)) (fun manifestFiles -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectDirFiles nFs) v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpkgSourceDepth) root) "lib")) (fun libR -> (match libR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__6) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__6)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__7) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectDirFiles nFs) v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpkgSourceDepth) root) "app")) (fun appR -> (match appR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__8) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__8)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__9) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectDirFiles nFs) v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpkgSourceDepth) root) "test")) (fun testR -> (match testR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__10) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__10)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__11) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dsortByPath ((Base_dData_dList.v_Base_dData_dList_dappend manifestFiles) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__7) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__9) dtb__11)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))

# 159 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageNameOf = (fun (manifest : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest) -> (match (manifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__12) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 165 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dexportsOf = (fun (manifest : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest) -> (match (manifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__13) -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_ddepKeyOf = (fun (dep : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dDependency) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf dep); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepIdentityOf dep) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__14) -> (v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash dtb__14)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf dep) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> "path"
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__15) -> (v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) })

# 151 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageSourceEff = (fun (nFs : string) (root : string) (manifest : Vuna_dCompiler_dFrontend_dManifest.t_Vuna_dCompiler_dFrontend_dManifest_dManifest) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageFilesEff nFs) root)) (fun filesR -> (match filesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__16) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__16)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__17) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psName = (v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageNameOf manifest); Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psExports = (v_Vuna_dCompiler_dFrontend_dPackages_dSource_dexportsOf manifest); Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psDeps = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dPackages_dSource_ddepKeyOf) (manifest).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies); Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psFiles = dtb__17 })))
  | _ -> failwith "DT: impossible branch"
))))

# 185 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcontentHashOf = (fun (ps : Vuna_dCompiler_dFrontend_dCanonical_dPkg.t_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource) -> (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_dcontentAddress (Vuna_dCompiler_dFrontend_dCanonical_dPkg.v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dencPackageContent (ps).Vuna_dCompiler_dFrontend_dCanonical_dPkg.f_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource_psFiles)))

# 189 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_Vuna_dCompiler_dFrontend_dPackages_dSource_didentityHashOf = (fun (ps : Vuna_dCompiler_dFrontend_dCanonical_dPkg.t_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dPackageSource) -> (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_dcontentAddress (Vuna_dCompiler_dFrontend_dCanonical_dPkg.v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dencPackageIdentity (Vuna_dCompiler_dFrontend_dCanonical_dPkg.v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_didentityOfSource ps))))
