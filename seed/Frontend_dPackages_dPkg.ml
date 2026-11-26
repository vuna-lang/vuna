open Vuna_runtime
type t_Root = { f_Root_rootDir : string; f_Root_rootName : string; f_Root_rootExports : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe; f_Root_rootLayerRules : Frontend_dManifest.t_Layer B_dData_dList.t_List; f_Root_rootImplicitPrelude : bool }
and t_Package = { f_Package_packageManifest : Frontend_dManifest.t_Manifest; f_Package_packageDependencies : t_Package B_dData_dList.t_List; f_Package_packageDir : string }
and t_PackageContext = { f_PackageContext_contextDir : string; f_PackageContext_contextPackage : t_Package B_dData_dMaybe.t_Maybe; f_PackageContext_contextRoots : t_Root B_dData_dList.t_List; f_PackageContext_contextPackageName : string; f_PackageContext_contextRelease : bool }
and t_Workspace = { f_Workspace_workspaceDir : string; f_Workspace_workspaceRoot : t_Package B_dData_dMaybe.t_Maybe; f_Workspace_workspaceMembers : t_Package B_dData_dList.t_List }

# 66 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootLayers = (fun (mc0 : t_Root) -> (match mc0 with
  | { f_Root_rootDir = dtb__0; f_Root_rootName = dtb__1; f_Root_rootExports = dtb__2; f_Root_rootLayerRules = dtb__3; f_Root_rootImplicitPrelude = dtb__4 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackageOf = (fun (ctx : t_PackageContext) -> (ctx).f_PackageContext_contextPackage)

# 78 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextWithRelease = (fun (release : bool) (ctx : t_PackageContext) -> { ctx with f_PackageContext_contextRelease = release })

# 81 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageName = (fun (package : t_Package) -> (match ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageExports = (fun (package : t_Package) -> ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestExports)

# 90 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageLayers = (fun (package : t_Package) -> ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestLayers)

# 93 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageImplicitPrelude = (fun (package : t_Package) -> ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestImplicitPrelude)

# 97 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_splitSlashChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (if (dtb__6 = 47) then (((v_splitSlashChars dtb__7) (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc2)), mc1))) B_dData_dList.C_List_Nil) else (((v_splitSlashChars dtb__7) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__6, mc2))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 105 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_splitOnSlash = (fun (path : string) -> (((v_splitSlashChars (B_dData_dList.dtp_unpack path)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 111 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_normalizeAcc = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (dtb__8 = "") then (((v_normalizeAcc mc0) dtb__9) mc2) else (if (dtb__8 = ".") then (((v_normalizeAcc mc0) dtb__9) mc2) else (if (dtb__8 = "..") then (match mc2 with
  | B_dData_dList.C_List_Nil -> (if mc0 then (((v_normalizeAcc mc0) dtb__9) B_dData_dList.C_List_Nil) else (((v_normalizeAcc mc0) dtb__9) (B_dData_dList.C_List__x58__x58_ ("..", B_dData_dList.C_List_Nil))))
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (if (dtb__10 = "..") then (((v_normalizeAcc mc0) dtb__9) (B_dData_dList.C_List__x58__x58_ ("..", mc2))) else (((v_normalizeAcc mc0) dtb__9) dtb__11))
  | _ -> failwith "DT: impossible branch"
) else (((v_normalizeAcc mc0) dtb__9) (B_dData_dList.C_List__x58__x58_ (dtb__8, mc2))))))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_normalizeDir = (fun (path : string) -> (if ((B_dData_dString.v_startsWith "/") path) then (match (((v_normalizeAcc true) (v_splitOnSlash path)) B_dData_dList.C_List_Nil) with
  | B_dData_dList.C_List_Nil -> "/"
  | dtb__12 -> ("/" ^ (Base_dSource.v_joinSlashes (B_dData_dList.v_reverse dtb__12)))
) else (match (((v_normalizeAcc false) (v_splitOnSlash path)) B_dData_dList.C_List_Nil) with
  | B_dData_dList.C_List_Nil -> "."
  | dtb__13 -> (Base_dSource.v_joinSlashes (B_dData_dList.v_reverse dtb__13))
)))

# 142 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_absolutePath = (fun (nEnv : string) (path : string) -> (if ((B_dData_dString.v_startsWith "/") path) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_normalizeDir path)) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dEnv.v_envGetCwd nEnv)) (fun cwd -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_normalizeDir (String.concat "" [cwd; "/"; path])))))))

# 152 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_joinPath = (fun (base : string) (rel : string) -> (if ((B_dData_dString.v_startsWith "/") rel) then (v_normalizeDir rel) else (v_normalizeDir (String.concat "" [base; "/"; rel]))))

# 155 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_joinPathsText = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (match dtb__15 with
  | B_dData_dList.C_List_Nil -> dtb__14
  | _ -> (String.concat "" [dtb__14; ", "; (v_joinPathsText dtb__15)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadManifestAt = (fun (nFs : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match ((Frontend_dManifest.v_parseManifest path) text) with
  | Base_dDiag.C_Check_ErrC (dtb__16) -> (Base_dDiag.C_Check_ErrC (dtb__16))
  | Base_dDiag.C_Check_OkC (dtb__17) -> (match (Frontend_dManifest.v_validateManifest dtb__17) with
  | Base_dDiag.C_Check_ErrC (dtb__18) -> (Base_dDiag.C_Check_ErrC (dtb__18))
  | Base_dDiag.C_Check_OkC (dtb__19) -> (Base_dDiag.C_Check_OkC (dtb__19))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dDiagnostics_dPkg.v_pkgPath1 path) (Base_dDiagnostics_dPkg.C_PkgErr_MissingManifest ((v_normalizeDir (Frontend_dManifest.v_manifestDir path))))) (v_normalizeDir (Frontend_dManifest.v_manifestDir path))))))))

# 180 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_manifestNameString = (fun (manifest : Frontend_dManifest.t_Manifest) -> (match (manifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_memStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) (B_dData_dPair.v_firstOf dtb__21)) mc0) then true else (((v_memStackDir _uctx0) mc0) dtb__22))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_cyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) (B_dData_dPair.v_firstOf dtb__23)) mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__23, B_dData_dList.C_List_Nil)))) else (match (((v_cyclePrefix _uctx0) mc0) dtb__24) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__25))))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_cycleMessage = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (match (((v_cyclePrefix B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) mc0) mc2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> ("pkg: dependency cycle: " ^ (Base_dSource.v_joinArrows ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (B_dData_dList.v_reverse dtb__27))) (B_dData_dList.C_List__x58__x58_ (dtb__26, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__28) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_mismatchMessage = (fun (mc0 : string B_dData_dMaybe.t_Maybe) (mc1 : string) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (String.concat "" ["pkg: dependency "; dtb__29; " expects package name "; dtb__29; " but found "; mc1])
  | B_dData_dMaybe.C_Maybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyIdentityEff = (fun (nFs : string) (dep : Frontend_dManifest.t_Dependency) (dir : string) (manifest : Frontend_dManifest.t_Manifest) -> (match (Frontend_dManifest.v_depIdentityOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__30) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dSource.v_packageSourceEff nFs) dir) manifest)) (fun psR -> (match psR with
  | Base_dDiag.C_Check_ErrC (dtb__31) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__31)))
  | Base_dDiag.C_Check_OkC (dtb__32) -> (let actual = (Frontend_dPackages_dSource.v_identityHashOf dtb__32) in (if ((Frontend_dPackages_dSource.v_normalizeHash dtb__30) = actual) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0))) else (let detail = (String.concat "" ["declared "; dtb__30; ", actual "; actual]) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMismatch ((Frontend_dManifest.v_depAliasOf dep), detail))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dep), (B_dData_dVec.C_Vec__x58__x58_ (detail, B_dData_dVec.C_Vec_Nil)))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyPathHashEff = (fun (nFs : string) (dep : Frontend_dManifest.t_Dependency) (dir : string) -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dSource.v_packageFilesEff nFs) dir)) (fun filesR -> (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__34) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__34)))
  | Base_dDiag.C_Check_OkC (dtb__35) -> (let actual = (Frontend_dPackages_dSource.v_contentHashOf { Frontend_dCanonical_dPkg.f_PackageSource_psName = ""; Frontend_dCanonical_dPkg.f_PackageSource_psExports = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psDeps = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb__35 }) in (if ((Frontend_dPackages_dSource.v_verifyHash dtb__33) actual) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0))) else (let detail = (String.concat "" ["declared "; dtb__33; ", actual "; actual]) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_HashMismatch ((Frontend_dManifest.v_depAliasOf dep), detail))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dep), (B_dData_dVec.C_Vec__x58__x58_ (detail, B_dData_dVec.C_Vec_Nil)))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_emptyPackageMemo = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)

# 347 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoLookup = (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dContainer_dMutRef.v_read memo)) (fun tbl -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dir) tbl)))))

# 353 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoInsert = (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dir : string) (pkg : t_Package) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dContainer_dMutRef.v_read memo)) (fun tbl -> ((B_dContainer_dMutRef.v_write memo) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dir) pkg) tbl)))))

# 221 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadStoreDependency = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dep : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dStore.v_storeDataRootEff nEnv)) (fun root -> (let digest = (Frontend_dPackages_dSource.v_normalizeHash dtb__36) in (let dir = (String.concat "" [root; "/pkgs/"; digest]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/.complete"))) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) (dir ^ "/.complete"))) (fun text -> (if (text = digest) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadPackageWalk nFs) nEnv) memo) fuel) stack) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dep)))) dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__37) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__37)))
  | Base_dDiag.C_Check_OkC (dtb__38) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_verifyIdentityEff nFs) dep) dir) (dtb__38).f_Package_packageManifest)) (fun idR -> (match idR with
  | Base_dDiag.C_Check_ErrC (dtb__39) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__39)))
  | Base_dDiag.C_Check_OkC (dtb__40) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__38)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep))))))))))
  | _ -> failwith "DT: impossible branch"
))
# 294 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadDependencyList = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (baseDir : string) (deps : Frontend_dManifest.t_Dependency B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "pkg")) else (match deps with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadOneDependency nFs) nEnv) memo) (fuel - 1)) stack) baseDir) dtb__41)) (fun depR -> (match depR with
  | Base_dDiag.C_Check_ErrC (dtb__43) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__43)))
  | Base_dDiag.C_Check_OkC (dtb__44) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadDependencyList nFs) nEnv) memo) (fuel - 1)) stack) baseDir) dtb__42)) (fun restR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__45) -> (Base_dDiag.C_Check_ErrC (dtb__45))
  | Base_dDiag.C_Check_OkC (dtb__46) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__46))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 316 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadOneDependency = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (baseDir : string) (dep : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depSourceOf dep) with
  | Frontend_dManifest.C_DependencySource_DepPath (dtb__47) -> (let dir = ((v_joinPath baseDir) dtb__47) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadPackageWalk nFs) nEnv) memo) fuel) stack) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dep)))) dir)) (fun depR -> (match depR with
  | Base_dDiag.C_Check_ErrC (dtb__48) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__48)))
  | Base_dDiag.C_Check_OkC (dtb__49) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_verifyPathHashEff nFs) dep) dir)) (fun hashR -> (match hashR with
  | Base_dDiag.C_Check_ErrC (dtb__50) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__50)))
  | Base_dDiag.C_Check_OkC (dtb__51) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_verifyIdentityEff nFs) dep) dir) (dtb__49).f_Package_packageManifest)) (fun idR -> (match idR with
  | Base_dDiag.C_Check_ErrC (dtb__52) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__52)))
  | Base_dDiag.C_Check_OkC (dtb__53) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__49)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Frontend_dManifest.C_DependencySource_DepGit (dtb__54, dtb__55) -> ((((((v_loadStoreDependency nFs) nEnv) memo) fuel) stack) dep)
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb__56) -> ((((((v_loadStoreDependency nFs) nEnv) memo) fuel) stack) dep)
  | _ -> failwith "DT: impossible branch"
))
# 359 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadPackageWalk = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (depName : string B_dData_dMaybe.t_Maybe) (dir : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "pkg")) else (let normalized = (v_normalizeDir dir) in (if (((v_memStackDir B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) normalized) stack) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiagnostics_dPkg.v_pkgInvalid (((v_cycleMessage normalized) depName) stack))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_memoLookup memo) normalized)) (fun cached -> (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) depName) (v_packageName dtb__57)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__57))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage depName) (v_packageName dtb__57)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_loadManifestAt nFs) (normalized ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Base_dDiag.C_Check_ErrC (dtb__58) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__58)))
  | Base_dDiag.C_Check_OkC (dtb__59) -> (match (dtb__59).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgPath0 (dtb__59).Frontend_dManifest.f_Manifest_manifestPath) Base_dDiagnostics_dPkg.C_PkgErr_NotPackage))
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (let name = (v_manifestNameString dtb__59) in (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) depName) name) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadDependencyList nFs) nEnv) memo) (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = normalized; B_dData_dPair.f_Pair_second = name }, stack))) normalized) (dtb__59).Frontend_dManifest.f_Manifest_manifestDependencies)) (fun dependencyR -> (match dependencyR with
  | Base_dDiag.C_Check_ErrC (dtb__61) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__61)))
  | Base_dDiag.C_Check_OkC (dtb__62) -> (let pkg = { f_Package_packageManifest = dtb__59; f_Package_packageDependencies = dtb__62; f_Package_packageDir = normalized } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_memoInsert memo) normalized) pkg)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (pkg))))))
  | _ -> failwith "DT: impossible branch"
))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage depName) name)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

# 412 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_lookupPackageDir = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (match dtb__63 with
  | { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__66 } -> (if (dtb__65 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__66)) else ((v_lookupPackageDir mc0) dtb__64))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_checkUniqueNamesGo = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | { B_dData_dPair.f_Pair_first = dtb__69; B_dData_dPair.f_Pair_second = dtb__70 } -> (match ((v_lookupPackageDir dtb__69) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkUniqueNamesGo (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__69; B_dData_dPair.f_Pair_second = dtb__70 }, mc0))) dtb__68)
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> (if (dtb__71 = dtb__70) then ((v_checkUniqueNamesGo mc0) dtb__68) else ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_DuplicatePackageName (dtb__69, dtb__71, dtb__70))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__69, (B_dData_dVec.C_Vec__x58__x58_ (dtb__71, (B_dData_dVec.C_Vec__x58__x58_ (dtb__70, B_dData_dVec.C_Vec_Nil))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_pkgFuelBound = 1048576

# 485 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceRootOf = (fun (workspace : t_Workspace) -> (workspace).f_Workspace_workspaceRoot)

# 488 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceMembersOf = (fun (workspace : t_Workspace) -> (workspace).f_Workspace_workspaceMembers)

# 492 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceAllPackages = (fun (workspace : t_Workspace) -> (match (workspace).f_Workspace_workspaceRoot with
  | B_dData_dMaybe.C_Maybe_Nothing -> (workspace).f_Workspace_workspaceMembers
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (B_dData_dList.C_List__x58__x58_ (dtb__72, (workspace).f_Workspace_workspaceMembers))
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_findManifestUpMaybe = (fun (nFs : string) (fuel : int) (dir : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/vuna.toml"))) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (dir))) else ((((v_findManifestUpMaybeStep nFs) (fuel - 1)) dir) (Frontend_dManifest.v_manifestDir dir)))))))
# 625 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_findManifestUpMaybeStep = (fun (nFs : string) (fuel : int) (dir : string) (parent : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (if (parent = dir) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((v_findManifestUpMaybe nFs) (fuel - 1)) parent))))

# 636 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDirMaybe = (fun (nFs : string) (startDir : string) -> (let start = (v_normalizeDir startDir) in (((v_findManifestUpMaybe nFs) ((2 * (bi_strLength start)) + 4)) start)))

# 644 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDir = (fun (nFs : string) (startDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_findManifestDirMaybe nFs) startDir)) (fun found -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match found with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (Base_dDiag.C_Check_OkC (dtb__73))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_NoManifestUpward ((v_normalizeDir startDir)))) (B_dData_dVec.C_Vec__x58__x58_ ((v_normalizeDir startDir), B_dData_dVec.C_Vec_Nil)))
  | _ -> failwith "DT: impossible branch"
)))))

# 658 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_hasManifest = (fun (nFs : string) (dir : string) -> ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/vuna.toml")))

# 661 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseCandidates = (fun (exeDir : string) -> (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "base"), (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "../base"), (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "../../base"), (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "../../../base"), B_dData_dList.C_List_Nil)))))))))

# 670 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseNotFound = (fun (tried : string B_dData_dList.t_List) -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_MissingBase ((v_joinPathsText tried)))) (v_joinPathsText tried)))

# 673 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_firstExistingBase = (fun (nFs : string) (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_hasManifest nFs) dtb__74)) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__74))) else (((v_firstExistingBase nFs) mc0) dtb__75))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_baseNotFound mc0))
  | _ -> failwith "DT: impossible branch"
))

# 682 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_locateBase = (fun (nFs : string) (nEnv : string) (_u : B_dData_dUnit.t_Unit) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_BASE")) (fun env -> (if (env = "") then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_absolutePath nEnv) exe)) (fun cwd -> (let candidates = (v_baseCandidates (Frontend_dManifest.v_manifestDir cwd)) in (((v_firstExistingBase nFs) candidates) candidates)))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_absolutePath nEnv) env)) (fun dir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_hasManifest nFs) dir)) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dir))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_baseNotFound (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)))))))))))))

# 37 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootDir = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__76; f_Root_rootName = dtb__77; f_Root_rootExports = dtb__78; f_Root_rootLayerRules = dtb__79; f_Root_rootImplicitPrelude = dtb__80 } -> dtb__76
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootName = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__81; f_Root_rootName = dtb__82; f_Root_rootExports = dtb__83; f_Root_rootLayerRules = dtb__84; f_Root_rootImplicitPrelude = dtb__85 } -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootPackage = (fun (root : t_Root) -> (v_rootName root))

# 39 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootExports = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__86; f_Root_rootName = dtb__87; f_Root_rootExports = dtb__88; f_Root_rootLayerRules = dtb__89; f_Root_rootImplicitPrelude = dtb__90 } -> dtb__88
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootLayerRules = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__91; f_Root_rootName = dtb__92; f_Root_rootExports = dtb__93; f_Root_rootLayerRules = dtb__94; f_Root_rootImplicitPrelude = dtb__95 } -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootImplicitPrelude = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__96; f_Root_rootName = dtb__97; f_Root_rootExports = dtb__98; f_Root_rootLayerRules = dtb__99; f_Root_rootImplicitPrelude = dtb__100 } -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageManifest = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__101; f_Package_packageDependencies = dtb__102; f_Package_packageDir = dtb__103 } -> dtb__101
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDependencies = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__104; f_Package_packageDependencies = dtb__105; f_Package_packageDir = dtb__106 } -> dtb__105
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDir = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__107; f_Package_packageDependencies = dtb__108; f_Package_packageDir = dtb__109 } -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_collectPackageIds = (fun (package : t_Package) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_packageName package); B_dData_dPair.f_Pair_second = (v_packageDir package) }, (v_collectDependencyIds (v_packageDependencies package)))))
# 407 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_collectDependencyIds = (fun (mc0 : t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> ((B_dData_dList.v_append (v_collectPackageIds dtb__110)) (v_collectDependencyIds dtb__111))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_checkUniquePackageNames = (fun (packages : t_Package B_dData_dList.t_List) -> ((v_checkUniqueNamesGo B_dData_dList.C_List_Nil) (v_collectDependencyIds packages)))

# 443 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadPackage = (fun (nFs : string) (nEnv : string) (dir : string) -> ((B_dContainer_dMutRef.v_withMutRef v_emptyPackageMemo) (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadPackageWalk nFs) nEnv) memo) v_pkgFuelBound) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing) dir)) (fun packageR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match packageR with
  | Base_dDiag.C_Check_ErrC (dtb__112) -> (Base_dDiag.C_Check_ErrC (dtb__112))
  | Base_dDiag.C_Check_OkC (dtb__113) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb__113, B_dData_dList.C_List_Nil))) with
  | Base_dDiag.C_Check_ErrC (dtb__114) -> (Base_dDiag.C_Check_ErrC (dtb__114))
  | Base_dDiag.C_Check_OkC (dtb__115) -> (Base_dDiag.C_Check_OkC (dtb__113))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 460 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadMembers = (fun (nFs : string) (nEnv : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadPackage nFs) nEnv) ((v_joinPath mc0) dtb__116))) (fun memberR -> (match memberR with
  | Base_dDiag.C_Check_ErrC (dtb__118) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__118)))
  | Base_dDiag.C_Check_OkC (dtb__119) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_loadMembers nFs) nEnv) mc0) dtb__117)) (fun restR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__120) -> (Base_dDiag.C_Check_ErrC (dtb__120))
  | Base_dDiag.C_Check_OkC (dtb__121) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__121))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadWorkspace = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) -> (let base = (v_normalizeDir rootBaseDir) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_loadManifestAt nFs) (base ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Base_dDiag.C_Check_ErrC (dtb__122) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__122)))
  | Base_dDiag.C_Check_OkC (dtb__123) -> (match (dtb__123).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_loadMembers nFs) nEnv) base) (dtb__123).Frontend_dManifest.f_Manifest_manifestMembers)) (fun membersR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match membersR with
  | Base_dDiag.C_Check_ErrC (dtb__124) -> (Base_dDiag.C_Check_ErrC (dtb__124))
  | Base_dDiag.C_Check_OkC (dtb__125) -> (match (v_checkUniquePackageNames dtb__125) with
  | Base_dDiag.C_Check_ErrC (dtb__126) -> (Base_dDiag.C_Check_ErrC (dtb__126))
  | Base_dDiag.C_Check_OkC (dtb__127) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = base; f_Workspace_workspaceRoot = B_dData_dMaybe.C_Maybe_Nothing; f_Workspace_workspaceMembers = dtb__125 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__128) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadPackage nFs) nEnv) base)) (fun rootR -> (match rootR with
  | Base_dDiag.C_Check_ErrC (dtb__129) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__129)))
  | Base_dDiag.C_Check_OkC (dtb__130) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_loadMembers nFs) nEnv) base) (dtb__123).Frontend_dManifest.f_Manifest_manifestMembers)) (fun membersR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match membersR with
  | Base_dDiag.C_Check_ErrC (dtb__131) -> (Base_dDiag.C_Check_ErrC (dtb__131))
  | Base_dDiag.C_Check_OkC (dtb__132) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__132))) with
  | Base_dDiag.C_Check_ErrC (dtb__133) -> (Base_dDiag.C_Check_ErrC (dtb__133))
  | Base_dDiag.C_Check_OkC (dtb__134) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = base; f_Workspace_workspaceRoot = (B_dData_dMaybe.C_Maybe_Just (dtb__130)); f_Workspace_workspaceMembers = dtb__132 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 538 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspacePackages = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadWorkspace nFs) nEnv) rootBaseDir)) (fun workspaceR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match workspaceR with
  | Base_dDiag.C_Check_ErrC (dtb__135) -> (Base_dDiag.C_Check_ErrC (dtb__135))
  | Base_dDiag.C_Check_OkC (dtb__136) -> (Base_dDiag.C_Check_OkC ((v_workspaceAllPackages dtb__136)))
  | _ -> failwith "DT: impossible branch"
)))))

# 561 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyRootOf = (fun (package : t_Package) -> { f_Root_rootDir = ((v_packageDir package) ^ "/lib"); f_Root_rootName = (v_packageName package); f_Root_rootExports = (v_packageExports package); f_Root_rootLayerRules = (v_packageLayers package); f_Root_rootImplicitPrelude = (v_packageImplicitPrelude package) })

# 551 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceContext = (fun (workspace : t_Workspace) -> { f_PackageContext_contextDir = (workspace).f_Workspace_workspaceDir; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = ((B_dData_dList.v_map v_dependencyRootOf) (v_workspaceMembersOf workspace)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false })

# 574 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_dependencyRoots = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (if ((B_dData_dList.v_memName (v_packageName dtb__137)) mc0) then ((v_dependencyRoots mc0) dtb__138) else (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ ((v_packageName dtb__137), mc0))) (v_packageDependencies dtb__137)) with
  | { B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = dtb__140 } -> (match ((v_dependencyRoots dtb__139) dtb__138) with
  | { B_dData_dPair.f_Pair_first = dtb__141; B_dData_dPair.f_Pair_second = dtb__142 } -> { B_dData_dPair.f_Pair_first = dtb__141; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__140) (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb__137), dtb__142))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageRoots = (fun (package : t_Package) -> (let selfName = (v_packageName package) in (let selfRoot = { f_Root_rootDir = ((v_packageDir package) ^ "/lib"); f_Root_rootName = selfName; f_Root_rootExports = B_dData_dMaybe.C_Maybe_Nothing; f_Root_rootLayerRules = (v_packageLayers package); f_Root_rootImplicitPrelude = (v_packageImplicitPrelude package) } in (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ (selfName, B_dData_dList.C_List_Nil))) (package).f_Package_packageDependencies) with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> (B_dData_dList.C_List__x58__x58_ (selfRoot, dtb__144))
  | _ -> failwith "DT: impossible branch"
))))

# 602 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageEntry = (fun (package : t_Package) -> ((v_packageDir package) ^ "/app/Main.vuna"))

# 606 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageContext = (fun (package : t_Package) -> { f_PackageContext_contextDir = (v_packageDir package); f_PackageContext_contextPackage = (B_dData_dMaybe.C_Maybe_Just (package)); f_PackageContext_contextRoots = (v_packageRoots package); f_PackageContext_contextPackageName = (v_packageName package); f_PackageContext_contextRelease = false })

# 703 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseOnlyContext = (fun (nFs : string) (nEnv : string) (base : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadPackage nFs) nEnv) base)) (fun packageR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match packageR with
  | Base_dDiag.C_Check_ErrC (dtb__145) -> (Base_dDiag.C_Check_ErrC (dtb__145))
  | Base_dDiag.C_Check_OkC (dtb__146) -> (Base_dDiag.C_Check_OkC ({ f_PackageContext_contextDir = ""; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb__146), B_dData_dList.C_List_Nil)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false }))
  | _ -> failwith "DT: impossible branch"
)))))

# 716 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextAt = (fun (nFs : string) (nEnv : string) (start : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_findManifestDirMaybe nFs) start)) (fun found -> (match found with
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_loadManifestAt nFs) (dtb__147 ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Base_dDiag.C_Check_ErrC (dtb__148) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__148)))
  | Base_dDiag.C_Check_OkC (dtb__149) -> (match (dtb__149).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadWorkspace nFs) nEnv) dtb__147)) (fun workspaceR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match workspaceR with
  | Base_dDiag.C_Check_ErrC (dtb__150) -> (Base_dDiag.C_Check_ErrC (dtb__150))
  | Base_dDiag.C_Check_OkC (dtb__151) -> (Base_dDiag.C_Check_OkC ((v_workspaceContext dtb__151)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__152) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadPackage nFs) nEnv) dtb__147)) (fun packageR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match packageR with
  | Base_dDiag.C_Check_ErrC (dtb__153) -> (Base_dDiag.C_Check_ErrC (dtb__153))
  | Base_dDiag.C_Check_OkC (dtb__154) -> (Base_dDiag.C_Check_OkC ((v_packageContext dtb__154)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_locateBase nFs) nEnv) B_dData_dUnit.C_Unit_MkUnit)) (fun baseR -> (match baseR with
  | Base_dDiag.C_Check_ErrC (dtb__155) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__155)))
  | Base_dDiag.C_Check_OkC (dtb__156) -> (((v_baseOnlyContext nFs) nEnv) dtb__156)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 752 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForFile = (fun (nFs : string) (nEnv : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_absolutePath nEnv) path)) (fun absolute -> (((v_contextAt nFs) nEnv) (Frontend_dManifest.v_manifestDir absolute)))))

# 761 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForDir = (fun (nFs : string) (nEnv : string) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_absolutePath nEnv) dir)) (fun absolute -> (((v_contextAt nFs) nEnv) absolute))))

# 59 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextDir = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__157; f_PackageContext_contextPackage = dtb__158; f_PackageContext_contextRoots = dtb__159; f_PackageContext_contextPackageName = dtb__160; f_PackageContext_contextRelease = dtb__161 } -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackage = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__162; f_PackageContext_contextPackage = dtb__163; f_PackageContext_contextRoots = dtb__164; f_PackageContext_contextPackageName = dtb__165; f_PackageContext_contextRelease = dtb__166 } -> dtb__163
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRoots = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__167; f_PackageContext_contextPackage = dtb__168; f_PackageContext_contextRoots = dtb__169; f_PackageContext_contextPackageName = dtb__170; f_PackageContext_contextRelease = dtb__171 } -> dtb__169
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackageName = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__172; f_PackageContext_contextPackage = dtb__173; f_PackageContext_contextRoots = dtb__174; f_PackageContext_contextPackageName = dtb__175; f_PackageContext_contextRelease = dtb__176 } -> dtb__175
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRelease = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__177; f_PackageContext_contextPackage = dtb__178; f_PackageContext_contextRoots = dtb__179; f_PackageContext_contextPackageName = dtb__180; f_PackageContext_contextRelease = dtb__181 } -> dtb__181
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceDir = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__182; f_Workspace_workspaceRoot = dtb__183; f_Workspace_workspaceMembers = dtb__184 } -> dtb__182
  | _ -> failwith "DT: impossible branch"
))

# 481 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceRoot = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__185; f_Workspace_workspaceRoot = dtb__186; f_Workspace_workspaceMembers = dtb__187 } -> dtb__186
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceMembers = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__188; f_Workspace_workspaceRoot = dtb__189; f_Workspace_workspaceMembers = dtb__190 } -> dtb__190
  | _ -> failwith "DT: impossible branch"
))
