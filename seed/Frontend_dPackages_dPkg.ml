open Vuna_runtime
type t_Root = { f_Root_rootDir : string; f_Root_rootName : string; f_Root_rootExports : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe; f_Root_rootLayerRules : Frontend_dManifest.t_Layer B_dData_dList.t_List }
and t_Package = { f_Package_packageManifest : Frontend_dManifest.t_Manifest; f_Package_packageDependencies : t_Package B_dData_dList.t_List; f_Package_packageDir : string }
and t_PackageContext = { f_PackageContext_contextDir : string; f_PackageContext_contextPackage : t_Package B_dData_dMaybe.t_Maybe; f_PackageContext_contextRoots : t_Root B_dData_dList.t_List; f_PackageContext_contextPackageName : string; f_PackageContext_contextRelease : bool }
and t_Workspace = { f_Workspace_workspaceDir : string; f_Workspace_workspaceRoot : t_Package B_dData_dMaybe.t_Maybe; f_Workspace_workspaceMembers : t_Package B_dData_dList.t_List }

# 64 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootLayers = (fun (mc0 : t_Root) -> (match mc0 with
  | { f_Root_rootDir = dtb__0; f_Root_rootName = dtb__1; f_Root_rootExports = dtb__2; f_Root_rootLayerRules = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackageOf = (fun (ctx : t_PackageContext) -> (ctx).f_PackageContext_contextPackage)

# 76 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextWithRelease = (fun (release : bool) (ctx : t_PackageContext) -> { ctx with f_PackageContext_contextRelease = release })

# 79 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageName = (fun (package : t_Package) -> (match ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageExports = (fun (package : t_Package) -> ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestExports)

# 88 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageLayers = (fun (package : t_Package) -> ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestLayers)

# 92 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_splitSlashChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (if (dtb__5 = 47) then (((v_splitSlashChars dtb__6) (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc2)), mc1))) B_dData_dList.C_List_Nil) else (((v_splitSlashChars dtb__6) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__5, mc2))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc2)), mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_splitOnSlash = (fun (path : string) -> (((v_splitSlashChars (B_dData_dList.dtp_unpack path)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 106 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_normalizeAcc = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (if (dtb__7 = "") then (((v_normalizeAcc mc0) dtb__8) mc2) else (if (dtb__7 = ".") then (((v_normalizeAcc mc0) dtb__8) mc2) else (if (dtb__7 = "..") then (match mc2 with
  | B_dData_dList.C_List_Nil -> (if mc0 then (((v_normalizeAcc mc0) dtb__8) B_dData_dList.C_List_Nil) else (((v_normalizeAcc mc0) dtb__8) (B_dData_dList.C_List__x58__x58_ ("..", B_dData_dList.C_List_Nil))))
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (if (dtb__9 = "..") then (((v_normalizeAcc mc0) dtb__8) (B_dData_dList.C_List__x58__x58_ ("..", mc2))) else (((v_normalizeAcc mc0) dtb__8) dtb__10))
  | _ -> failwith "DT: impossible branch"
) else (((v_normalizeAcc mc0) dtb__8) (B_dData_dList.C_List__x58__x58_ (dtb__7, mc2))))))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_normalizeDir = (fun (path : string) -> (if ((B_dData_dString.v_startsWith "/") path) then (match (((v_normalizeAcc true) (v_splitOnSlash path)) B_dData_dList.C_List_Nil) with
  | B_dData_dList.C_List_Nil -> "/"
  | dtb__11 -> ("/" ^ (Base_dSource.v_joinSlashes (B_dData_dList.v_reverse dtb__11)))
) else (match (((v_normalizeAcc false) (v_splitOnSlash path)) B_dData_dList.C_List_Nil) with
  | B_dData_dList.C_List_Nil -> "."
  | dtb__12 -> (Base_dSource.v_joinSlashes (B_dData_dList.v_reverse dtb__12))
)))

# 137 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_absolutePath = (fun (nEnv : string) (path : string) -> (if ((B_dData_dString.v_startsWith "/") path) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_normalizeDir path)) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dEnv.v_envGetCwd nEnv)) (fun cwd -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_normalizeDir (String.concat "" [cwd; "/"; path])))))))

# 147 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_joinPath = (fun (base : string) (rel : string) -> (if ((B_dData_dString.v_startsWith "/") rel) then (v_normalizeDir rel) else (v_normalizeDir (String.concat "" [base; "/"; rel]))))

# 150 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_joinPathsText = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (match dtb__14 with
  | B_dData_dList.C_List_Nil -> dtb__13
  | _ -> (String.concat "" [dtb__13; ", "; (v_joinPathsText dtb__14)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 157 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadManifestAt = (fun (nFs : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match ((Frontend_dManifest.v_parseManifest path) text) with
  | Base_dDiag.C_Check_ErrC (dtb__15) -> (Base_dDiag.C_Check_ErrC (dtb__15))
  | Base_dDiag.C_Check_OkC (dtb__16) -> (match (Frontend_dManifest.v_validateManifest dtb__16) with
  | Base_dDiag.C_Check_ErrC (dtb__17) -> (Base_dDiag.C_Check_ErrC (dtb__17))
  | Base_dDiag.C_Check_OkC (dtb__18) -> (Base_dDiag.C_Check_OkC (dtb__18))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dDiagnostics_dPkg.v_pkgPath1 path) (Base_dDiagnostics_dPkg.C_PkgErr_MissingManifest ((v_normalizeDir (Frontend_dManifest.v_manifestDir path))))) (v_normalizeDir (Frontend_dManifest.v_manifestDir path))))))))

# 175 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_manifestNameString = (fun (manifest : Frontend_dManifest.t_Manifest) -> (match (manifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_memStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) (B_dData_dPair.v_firstOf dtb__20)) mc0) then true else (((v_memStackDir _uctx0) mc0) dtb__21))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_cyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) (B_dData_dPair.v_firstOf dtb__22)) mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__22, B_dData_dList.C_List_Nil)))) else (match (((v_cyclePrefix _uctx0) mc0) dtb__23) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__24))))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_cycleMessage = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (match (((v_cyclePrefix B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) mc0) mc2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> ("pkg: dependency cycle: " ^ (Base_dSource.v_joinArrows ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (B_dData_dList.v_reverse dtb__26))) (B_dData_dList.C_List__x58__x58_ (dtb__25, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__27) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_mismatchMessage = (fun (mc0 : string B_dData_dMaybe.t_Maybe) (mc1 : string) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> (String.concat "" ["pkg: dependency "; dtb__28; " expects package name "; dtb__28; " but found "; mc1])
  | B_dData_dMaybe.C_Maybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyIdentityEff = (fun (nFs : string) (dep : Frontend_dManifest.t_Dependency) (dir : string) (manifest : Frontend_dManifest.t_Manifest) -> (match (Frontend_dManifest.v_depIdentityOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dSource.v_packageSourceEff nFs) dir) manifest)) (fun psR -> (match psR with
  | Base_dDiag.C_Check_ErrC (dtb__30) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__30)))
  | Base_dDiag.C_Check_OkC (dtb__31) -> (let actual = (Frontend_dPackages_dSource.v_identityHashOf dtb__31) in (if ((Frontend_dPackages_dSource.v_normalizeHash dtb__29) = actual) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0))) else (let detail = (String.concat "" ["declared "; dtb__29; ", actual "; actual]) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMismatch ((Frontend_dManifest.v_depAliasOf dep), detail))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dep), (B_dData_dVec.C_Vec__x58__x58_ (detail, B_dData_dVec.C_Vec_Nil)))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyPathHashEff = (fun (nFs : string) (dep : Frontend_dManifest.t_Dependency) (dir : string) -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dSource.v_packageFilesEff nFs) dir)) (fun filesR -> (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__33) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__33)))
  | Base_dDiag.C_Check_OkC (dtb__34) -> (let actual = (Frontend_dPackages_dSource.v_contentHashOf { Frontend_dCanonical_dPkg.f_PackageSource_psName = ""; Frontend_dCanonical_dPkg.f_PackageSource_psExports = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psDeps = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb__34 }) in (if ((Frontend_dPackages_dSource.v_verifyHash dtb__32) actual) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (0))) else (let detail = (String.concat "" ["declared "; dtb__32; ", actual "; actual]) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_HashMismatch ((Frontend_dManifest.v_depAliasOf dep), detail))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dep), (B_dData_dVec.C_Vec__x58__x58_ (detail, B_dData_dVec.C_Vec_Nil)))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_emptyPackageMemo = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)

# 342 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoLookup = (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dContainer_dMutRef.v_read memo)) (fun tbl -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dir) tbl)))))

# 348 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoInsert = (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dir : string) (pkg : t_Package) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dContainer_dMutRef.v_read memo)) (fun tbl -> ((B_dContainer_dMutRef.v_write memo) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dir) pkg) tbl)))))

# 216 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadStoreDependency = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dep : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__35) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dStore.v_storeDataRootEff nEnv)) (fun root -> (let digest = (Frontend_dPackages_dSource.v_normalizeHash dtb__35) in (let dir = (String.concat "" [root; "/pkgs/"; digest]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/.complete"))) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) (dir ^ "/.complete"))) (fun text -> (if (text = digest) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadPackageWalk nFs) nEnv) memo) fuel) stack) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dep)))) dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__36) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__36)))
  | Base_dDiag.C_Check_OkC (dtb__37) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_verifyIdentityEff nFs) dep) dir) (dtb__37).f_Package_packageManifest)) (fun idR -> (match idR with
  | Base_dDiag.C_Check_ErrC (dtb__38) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__38)))
  | Base_dDiag.C_Check_OkC (dtb__39) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__37)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep))))))))))
  | _ -> failwith "DT: impossible branch"
))
# 289 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadDependencyList = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (baseDir : string) (deps : Frontend_dManifest.t_Dependency B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "pkg")) else (match deps with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadOneDependency nFs) nEnv) memo) (fuel - 1)) stack) baseDir) dtb__40)) (fun depR -> (match depR with
  | Base_dDiag.C_Check_ErrC (dtb__42) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__42)))
  | Base_dDiag.C_Check_OkC (dtb__43) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadDependencyList nFs) nEnv) memo) (fuel - 1)) stack) baseDir) dtb__41)) (fun restR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__44) -> (Base_dDiag.C_Check_ErrC (dtb__44))
  | Base_dDiag.C_Check_OkC (dtb__45) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__45))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 311 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadOneDependency = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (baseDir : string) (dep : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depSourceOf dep) with
  | Frontend_dManifest.C_DependencySource_DepPath (dtb__46) -> (let dir = ((v_joinPath baseDir) dtb__46) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadPackageWalk nFs) nEnv) memo) fuel) stack) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dep)))) dir)) (fun depR -> (match depR with
  | Base_dDiag.C_Check_ErrC (dtb__47) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__47)))
  | Base_dDiag.C_Check_OkC (dtb__48) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_verifyPathHashEff nFs) dep) dir)) (fun hashR -> (match hashR with
  | Base_dDiag.C_Check_ErrC (dtb__49) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__49)))
  | Base_dDiag.C_Check_OkC (dtb__50) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_verifyIdentityEff nFs) dep) dir) (dtb__48).f_Package_packageManifest)) (fun idR -> (match idR with
  | Base_dDiag.C_Check_ErrC (dtb__51) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__51)))
  | Base_dDiag.C_Check_OkC (dtb__52) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__48)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Frontend_dManifest.C_DependencySource_DepGit (dtb__53, dtb__54) -> ((((((v_loadStoreDependency nFs) nEnv) memo) fuel) stack) dep)
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb__55) -> ((((((v_loadStoreDependency nFs) nEnv) memo) fuel) stack) dep)
  | _ -> failwith "DT: impossible branch"
))
# 354 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadPackageWalk = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (depName : string B_dData_dMaybe.t_Maybe) (dir : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "pkg")) else (let normalized = (v_normalizeDir dir) in (if (((v_memStackDir B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) normalized) stack) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiagnostics_dPkg.v_pkgInvalid (((v_cycleMessage normalized) depName) stack))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_memoLookup memo) normalized)) (fun cached -> (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) depName) (v_packageName dtb__56)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__56))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage depName) (v_packageName dtb__56)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_loadManifestAt nFs) (normalized ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Base_dDiag.C_Check_ErrC (dtb__57) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__57)))
  | Base_dDiag.C_Check_OkC (dtb__58) -> (match (dtb__58).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dPkg.v_pkgPath0 (dtb__58).Frontend_dManifest.f_Manifest_manifestPath) Base_dDiagnostics_dPkg.C_PkgErr_NotPackage))
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (let name = (v_manifestNameString dtb__58) in (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) depName) name) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadDependencyList nFs) nEnv) memo) (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = normalized; B_dData_dPair.f_Pair_second = name }, stack))) normalized) (dtb__58).Frontend_dManifest.f_Manifest_manifestDependencies)) (fun dependencyR -> (match dependencyR with
  | Base_dDiag.C_Check_ErrC (dtb__60) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__60)))
  | Base_dDiag.C_Check_OkC (dtb__61) -> (let pkg = { f_Package_packageManifest = dtb__58; f_Package_packageDependencies = dtb__61; f_Package_packageDir = normalized } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_memoInsert memo) normalized) pkg)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (pkg))))))
  | _ -> failwith "DT: impossible branch"
))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage depName) name)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

# 407 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_lookupPackageDir = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__62 with
  | { B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = dtb__65 } -> (if (dtb__64 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__65)) else ((v_lookupPackageDir mc0) dtb__63))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_checkUniqueNamesGo = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__66 with
  | { B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 } -> (match ((v_lookupPackageDir dtb__68) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkUniqueNamesGo (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 }, mc0))) dtb__67)
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (if (dtb__70 = dtb__69) then ((v_checkUniqueNamesGo mc0) dtb__67) else ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_DuplicatePackageName (dtb__68, dtb__70, dtb__69))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__68, (B_dData_dVec.C_Vec__x58__x58_ (dtb__70, (B_dData_dVec.C_Vec__x58__x58_ (dtb__69, B_dData_dVec.C_Vec_Nil))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_pkgFuelBound = 1048576

# 480 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceRootOf = (fun (workspace : t_Workspace) -> (workspace).f_Workspace_workspaceRoot)

# 483 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceMembersOf = (fun (workspace : t_Workspace) -> (workspace).f_Workspace_workspaceMembers)

# 487 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceAllPackages = (fun (workspace : t_Workspace) -> (match (workspace).f_Workspace_workspaceRoot with
  | B_dData_dMaybe.C_Maybe_Nothing -> (workspace).f_Workspace_workspaceMembers
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> (B_dData_dList.C_List__x58__x58_ (dtb__71, (workspace).f_Workspace_workspaceMembers))
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_findManifestUpMaybe = (fun (nFs : string) (fuel : int) (dir : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/vuna.toml"))) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just (dir))) else ((((v_findManifestUpMaybeStep nFs) (fuel - 1)) dir) (Frontend_dManifest.v_manifestDir dir)))))))
# 613 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_findManifestUpMaybeStep = (fun (nFs : string) (fuel : int) (dir : string) (parent : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (if (parent = dir) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((v_findManifestUpMaybe nFs) (fuel - 1)) parent))))

# 624 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDirMaybe = (fun (nFs : string) (startDir : string) -> (let start = (v_normalizeDir startDir) in (((v_findManifestUpMaybe nFs) ((2 * (bi_strLength start)) + 4)) start)))

# 632 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDir = (fun (nFs : string) (startDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_findManifestDirMaybe nFs) startDir)) (fun found -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match found with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (Base_dDiag.C_Check_OkC (dtb__72))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_NoManifestUpward ((v_normalizeDir startDir)))) (B_dData_dVec.C_Vec__x58__x58_ ((v_normalizeDir startDir), B_dData_dVec.C_Vec_Nil)))
  | _ -> failwith "DT: impossible branch"
)))))

# 646 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_hasManifest = (fun (nFs : string) (dir : string) -> ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/vuna.toml")))

# 649 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseCandidates = (fun (exeDir : string) -> (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "base"), (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "../base"), (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "../../base"), (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "../../../base"), B_dData_dList.C_List_Nil)))))))))

# 658 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseNotFound = (fun (tried : string B_dData_dList.t_List) -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_MissingBase ((v_joinPathsText tried)))) (v_joinPathsText tried)))

# 661 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_firstExistingBase = (fun (nFs : string) (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_hasManifest nFs) dtb__73)) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__73))) else (((v_firstExistingBase nFs) mc0) dtb__74))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_baseNotFound mc0))
  | _ -> failwith "DT: impossible branch"
))

# 670 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_locateBase = (fun (nFs : string) (nEnv : string) (_u : B_dData_dUnit.t_Unit) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_BASE")) (fun env -> (if (env = "") then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_absolutePath nEnv) exe)) (fun cwd -> (let candidates = (v_baseCandidates (Frontend_dManifest.v_manifestDir cwd)) in (((v_firstExistingBase nFs) candidates) candidates)))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_absolutePath nEnv) env)) (fun dir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_hasManifest nFs) dir)) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dir))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_baseNotFound (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)))))))))))))

# 37 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootDir = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__75; f_Root_rootName = dtb__76; f_Root_rootExports = dtb__77; f_Root_rootLayerRules = dtb__78 } -> dtb__75
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootName = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__79; f_Root_rootName = dtb__80; f_Root_rootExports = dtb__81; f_Root_rootLayerRules = dtb__82 } -> dtb__80
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootPackage = (fun (root : t_Root) -> (v_rootName root))

# 39 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootExports = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__83; f_Root_rootName = dtb__84; f_Root_rootExports = dtb__85; f_Root_rootLayerRules = dtb__86 } -> dtb__85
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootLayerRules = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__87; f_Root_rootName = dtb__88; f_Root_rootExports = dtb__89; f_Root_rootLayerRules = dtb__90 } -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageManifest = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__91; f_Package_packageDependencies = dtb__92; f_Package_packageDir = dtb__93 } -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDependencies = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__94; f_Package_packageDependencies = dtb__95; f_Package_packageDir = dtb__96 } -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDir = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__97; f_Package_packageDependencies = dtb__98; f_Package_packageDir = dtb__99 } -> dtb__99
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_collectPackageIds = (fun (package : t_Package) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_packageName package); B_dData_dPair.f_Pair_second = (v_packageDir package) }, (v_collectDependencyIds (v_packageDependencies package)))))
# 402 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_collectDependencyIds = (fun (mc0 : t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> ((B_dData_dList.v_append (v_collectPackageIds dtb__100)) (v_collectDependencyIds dtb__101))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_checkUniquePackageNames = (fun (packages : t_Package B_dData_dList.t_List) -> ((v_checkUniqueNamesGo B_dData_dList.C_List_Nil) (v_collectDependencyIds packages)))

# 438 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadPackage = (fun (nFs : string) (nEnv : string) (dir : string) -> ((B_dContainer_dMutRef.v_withMutRef v_emptyPackageMemo) (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadPackageWalk nFs) nEnv) memo) v_pkgFuelBound) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing) dir)) (fun packageR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match packageR with
  | Base_dDiag.C_Check_ErrC (dtb__102) -> (Base_dDiag.C_Check_ErrC (dtb__102))
  | Base_dDiag.C_Check_OkC (dtb__103) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb__103, B_dData_dList.C_List_Nil))) with
  | Base_dDiag.C_Check_ErrC (dtb__104) -> (Base_dDiag.C_Check_ErrC (dtb__104))
  | Base_dDiag.C_Check_OkC (dtb__105) -> (Base_dDiag.C_Check_OkC (dtb__103))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 455 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadMembers = (fun (nFs : string) (nEnv : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadPackage nFs) nEnv) ((v_joinPath mc0) dtb__106))) (fun memberR -> (match memberR with
  | Base_dDiag.C_Check_ErrC (dtb__108) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__108)))
  | Base_dDiag.C_Check_OkC (dtb__109) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_loadMembers nFs) nEnv) mc0) dtb__107)) (fun restR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__110) -> (Base_dDiag.C_Check_ErrC (dtb__110))
  | Base_dDiag.C_Check_OkC (dtb__111) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__111))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadWorkspace = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) -> (let base = (v_normalizeDir rootBaseDir) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_loadManifestAt nFs) (base ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Base_dDiag.C_Check_ErrC (dtb__112) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__112)))
  | Base_dDiag.C_Check_OkC (dtb__113) -> (match (dtb__113).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_loadMembers nFs) nEnv) base) (dtb__113).Frontend_dManifest.f_Manifest_manifestMembers)) (fun membersR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match membersR with
  | Base_dDiag.C_Check_ErrC (dtb__114) -> (Base_dDiag.C_Check_ErrC (dtb__114))
  | Base_dDiag.C_Check_OkC (dtb__115) -> (match (v_checkUniquePackageNames dtb__115) with
  | Base_dDiag.C_Check_ErrC (dtb__116) -> (Base_dDiag.C_Check_ErrC (dtb__116))
  | Base_dDiag.C_Check_OkC (dtb__117) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = base; f_Workspace_workspaceRoot = B_dData_dMaybe.C_Maybe_Nothing; f_Workspace_workspaceMembers = dtb__115 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__118) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadPackage nFs) nEnv) base)) (fun rootR -> (match rootR with
  | Base_dDiag.C_Check_ErrC (dtb__119) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__119)))
  | Base_dDiag.C_Check_OkC (dtb__120) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_loadMembers nFs) nEnv) base) (dtb__113).Frontend_dManifest.f_Manifest_manifestMembers)) (fun membersR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match membersR with
  | Base_dDiag.C_Check_ErrC (dtb__121) -> (Base_dDiag.C_Check_ErrC (dtb__121))
  | Base_dDiag.C_Check_OkC (dtb__122) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__122))) with
  | Base_dDiag.C_Check_ErrC (dtb__123) -> (Base_dDiag.C_Check_ErrC (dtb__123))
  | Base_dDiag.C_Check_OkC (dtb__124) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = base; f_Workspace_workspaceRoot = (B_dData_dMaybe.C_Maybe_Just (dtb__120)); f_Workspace_workspaceMembers = dtb__122 }))
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

# 533 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspacePackages = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadWorkspace nFs) nEnv) rootBaseDir)) (fun workspaceR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match workspaceR with
  | Base_dDiag.C_Check_ErrC (dtb__125) -> (Base_dDiag.C_Check_ErrC (dtb__125))
  | Base_dDiag.C_Check_OkC (dtb__126) -> (Base_dDiag.C_Check_OkC ((v_workspaceAllPackages dtb__126)))
  | _ -> failwith "DT: impossible branch"
)))))

# 556 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyRootOf = (fun (package : t_Package) -> { f_Root_rootDir = ((v_packageDir package) ^ "/lib"); f_Root_rootName = (v_packageName package); f_Root_rootExports = (v_packageExports package); f_Root_rootLayerRules = (v_packageLayers package) })

# 546 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceContext = (fun (workspace : t_Workspace) -> { f_PackageContext_contextDir = (workspace).f_Workspace_workspaceDir; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = ((B_dData_dList.v_map v_dependencyRootOf) (v_workspaceMembersOf workspace)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false })

# 568 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_dependencyRoots = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (if ((B_dData_dList.v_memName (v_packageName dtb__127)) mc0) then ((v_dependencyRoots mc0) dtb__128) else (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ ((v_packageName dtb__127), mc0))) (v_packageDependencies dtb__127)) with
  | { B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = dtb__130 } -> (match ((v_dependencyRoots dtb__129) dtb__128) with
  | { B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = dtb__132 } -> { B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__130) (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb__127), dtb__132))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageRoots = (fun (package : t_Package) -> (let selfName = (v_packageName package) in (let selfRoot = { f_Root_rootDir = ((v_packageDir package) ^ "/lib"); f_Root_rootName = selfName; f_Root_rootExports = B_dData_dMaybe.C_Maybe_Nothing; f_Root_rootLayerRules = (v_packageLayers package) } in (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ (selfName, B_dData_dList.C_List_Nil))) (package).f_Package_packageDependencies) with
  | { B_dData_dPair.f_Pair_first = dtb__133; B_dData_dPair.f_Pair_second = dtb__134 } -> (B_dData_dList.C_List__x58__x58_ (selfRoot, dtb__134))
  | _ -> failwith "DT: impossible branch"
))))

# 590 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageEntry = (fun (package : t_Package) -> ((v_packageDir package) ^ "/app/Main.vuna"))

# 594 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageContext = (fun (package : t_Package) -> { f_PackageContext_contextDir = (v_packageDir package); f_PackageContext_contextPackage = (B_dData_dMaybe.C_Maybe_Just (package)); f_PackageContext_contextRoots = (v_packageRoots package); f_PackageContext_contextPackageName = (v_packageName package); f_PackageContext_contextRelease = false })

# 691 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseOnlyContext = (fun (nFs : string) (nEnv : string) (base : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadPackage nFs) nEnv) base)) (fun packageR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match packageR with
  | Base_dDiag.C_Check_ErrC (dtb__135) -> (Base_dDiag.C_Check_ErrC (dtb__135))
  | Base_dDiag.C_Check_OkC (dtb__136) -> (Base_dDiag.C_Check_OkC ({ f_PackageContext_contextDir = ""; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb__136), B_dData_dList.C_List_Nil)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false }))
  | _ -> failwith "DT: impossible branch"
)))))

# 704 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextAt = (fun (nFs : string) (nEnv : string) (start : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_findManifestDirMaybe nFs) start)) (fun found -> (match found with
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_loadManifestAt nFs) (dtb__137 ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Base_dDiag.C_Check_ErrC (dtb__138) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__138)))
  | Base_dDiag.C_Check_OkC (dtb__139) -> (match (dtb__139).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadWorkspace nFs) nEnv) dtb__137)) (fun workspaceR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match workspaceR with
  | Base_dDiag.C_Check_ErrC (dtb__140) -> (Base_dDiag.C_Check_ErrC (dtb__140))
  | Base_dDiag.C_Check_OkC (dtb__141) -> (Base_dDiag.C_Check_OkC ((v_workspaceContext dtb__141)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_loadPackage nFs) nEnv) dtb__137)) (fun packageR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match packageR with
  | Base_dDiag.C_Check_ErrC (dtb__143) -> (Base_dDiag.C_Check_ErrC (dtb__143))
  | Base_dDiag.C_Check_OkC (dtb__144) -> (Base_dDiag.C_Check_OkC ((v_packageContext dtb__144)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_locateBase nFs) nEnv) B_dData_dUnit.C_Unit_MkUnit)) (fun baseR -> (match baseR with
  | Base_dDiag.C_Check_ErrC (dtb__145) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__145)))
  | Base_dDiag.C_Check_OkC (dtb__146) -> (((v_baseOnlyContext nFs) nEnv) dtb__146)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 740 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForFile = (fun (nFs : string) (nEnv : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_absolutePath nEnv) path)) (fun absolute -> (((v_contextAt nFs) nEnv) (Frontend_dManifest.v_manifestDir absolute)))))

# 749 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForDir = (fun (nFs : string) (nEnv : string) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_absolutePath nEnv) dir)) (fun absolute -> (((v_contextAt nFs) nEnv) absolute))))

# 57 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextDir = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__147; f_PackageContext_contextPackage = dtb__148; f_PackageContext_contextRoots = dtb__149; f_PackageContext_contextPackageName = dtb__150; f_PackageContext_contextRelease = dtb__151 } -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackage = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__152; f_PackageContext_contextPackage = dtb__153; f_PackageContext_contextRoots = dtb__154; f_PackageContext_contextPackageName = dtb__155; f_PackageContext_contextRelease = dtb__156 } -> dtb__153
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRoots = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__157; f_PackageContext_contextPackage = dtb__158; f_PackageContext_contextRoots = dtb__159; f_PackageContext_contextPackageName = dtb__160; f_PackageContext_contextRelease = dtb__161 } -> dtb__159
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackageName = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__162; f_PackageContext_contextPackage = dtb__163; f_PackageContext_contextRoots = dtb__164; f_PackageContext_contextPackageName = dtb__165; f_PackageContext_contextRelease = dtb__166 } -> dtb__165
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRelease = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__167; f_PackageContext_contextPackage = dtb__168; f_PackageContext_contextRoots = dtb__169; f_PackageContext_contextPackageName = dtb__170; f_PackageContext_contextRelease = dtb__171 } -> dtb__171
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceDir = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__172; f_Workspace_workspaceRoot = dtb__173; f_Workspace_workspaceMembers = dtb__174 } -> dtb__172
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceRoot = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__175; f_Workspace_workspaceRoot = dtb__176; f_Workspace_workspaceMembers = dtb__177 } -> dtb__176
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceMembers = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__178; f_Workspace_workspaceRoot = dtb__179; f_Workspace_workspaceMembers = dtb__180 } -> dtb__180
  | _ -> failwith "DT: impossible branch"
))
