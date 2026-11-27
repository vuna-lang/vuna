open Vuna_runtime
type t_Root = { f_Root_rootDir : string; f_Root_rootName : string; f_Root_rootExports : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe; f_Root_rootLayerRules : Frontend_dManifest.t_Layer B_dData_dList.t_List; f_Root_rootImplicitPrelude : bool }
and t_Package = { f_Package_packageManifest : Frontend_dManifest.t_Manifest; f_Package_packageDependencies : t_Package B_dData_dList.t_List; f_Package_packageDir : string }
and t_PackageContext = { f_PackageContext_contextDir : string; f_PackageContext_contextPackage : t_Package B_dData_dMaybe.t_Maybe; f_PackageContext_contextRoots : t_Root B_dData_dList.t_List; f_PackageContext_contextPackageName : string; f_PackageContext_contextRelease : bool }
and t_Workspace = { f_Workspace_workspaceDir : string; f_Workspace_workspaceRoot : t_Package B_dData_dMaybe.t_Maybe; f_Workspace_workspaceMembers : t_Package B_dData_dList.t_List }

# 67 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootLayers = (fun (mc0 : t_Root) -> (match mc0 with
  | { f_Root_rootDir = dtb__0; f_Root_rootName = dtb__1; f_Root_rootExports = dtb__2; f_Root_rootLayerRules = dtb__3; f_Root_rootImplicitPrelude = dtb__4 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackageOf = (fun (ctx : t_PackageContext) -> (ctx).f_PackageContext_contextPackage)

# 79 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextWithRelease = (fun (release : bool) (ctx : t_PackageContext) -> { ctx with f_PackageContext_contextRelease = release })

# 82 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageName = (fun (package : t_Package) -> (match ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageExports = (fun (package : t_Package) -> ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestExports)

# 91 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageLayers = (fun (package : t_Package) -> ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestLayers)

# 94 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageImplicitPrelude = (fun (package : t_Package) -> ((package).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestImplicitPrelude)

# 100 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_absolutePath = (fun (dtb_u_u15 : string) (dtb_u_u18 : string) -> (if ((B_dData_dString.v_startsWith "/") dtb_u_u18) then (let dtb_u_u20 = (Base_dSource.v_normalizePath dtb_u_u18) in (Obj.repr ((fun (dtb_u_u21 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u20)))) else (Obj.repr ((fun (dtb_u_u26 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u29 = ((B_dEffect_dEnv.v_envGetCwd_u_udirect dtb_u_u15) dtb_u_u26) in (let dtb_u_u31 = (Base_dSource.v_normalizePath (String.concat "" [dtb_u_u29; "/"; dtb_u_u18])) in dtb_u_u31)))))))

# 100 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_absolutePath_u_udirect = (fun (nEnv : string) (path : string) _u_ueffTok -> (if ((B_dData_dString.v_startsWith "/") path) then (let dtb_u_u20 = (Base_dSource.v_normalizePath path) in dtb_u_u20) else (let dtb_u_u29 = ((B_dEffect_dEnv.v_envGetCwd_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u31 = (Base_dSource.v_normalizePath (String.concat "" [dtb_u_u29; "/"; path])) in dtb_u_u31))))

# 109 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_joinPathsText = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__9 with
  | B_dData_dList.C_List_Nil -> dtb__8
  | _ -> (String.concat "" [dtb__8; ", "; (v_joinPathsText dtb__9)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadManifestAt = (fun (dtb_u_u36 : string) (dtb_u_u39 : string) -> (Obj.repr ((fun (dtb_u_u44 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u47 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u36) dtb_u_u39) dtb_u_u44) in (if dtb_u_u47 then (let dtb_u_u55 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u36) dtb_u_u39) dtb_u_u44) in (let dtb_u_u57 = (match ((Frontend_dManifest.v_parseManifest dtb_u_u39) dtb_u_u55) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u59) -> (Base_dDiag.C_Check_ErrC (dtb_u_u59))
  | Base_dDiag.C_Check_OkC (dtb_u_u60) -> (match (Frontend_dManifest.v_validateManifest dtb_u_u60) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u61) -> (Base_dDiag.C_Check_ErrC (dtb_u_u61))
  | Base_dDiag.C_Check_OkC (dtb_u_u62) -> (Base_dDiag.C_Check_OkC (dtb_u_u62))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u57)) else (let dtb_u_u64 = (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u39) (Base_dDiagnostics_dPkg.C_PkgErr_MissingManifest ((Base_dSource.v_normalizePath (Frontend_dManifest.v_manifestDir dtb_u_u39))))) (Base_dSource.v_normalizePath (Frontend_dManifest.v_manifestDir dtb_u_u39))) in dtb_u_u64)))))))

# 116 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadManifestAt_u_udirect = (fun (nFs : string) (path : string) _u_ueffTok -> (let dtb_u_u47 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) _u_ueffTok) in (if dtb_u_u47 then (let dtb_u_u55 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) path) _u_ueffTok) in (let dtb_u_u57 = (match ((Frontend_dManifest.v_parseManifest path) dtb_u_u55) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u59) -> (Base_dDiag.C_Check_ErrC (dtb_u_u59))
  | Base_dDiag.C_Check_OkC (dtb_u_u60) -> (match (Frontend_dManifest.v_validateManifest dtb_u_u60) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u61) -> (Base_dDiag.C_Check_ErrC (dtb_u_u61))
  | Base_dDiag.C_Check_OkC (dtb_u_u62) -> (Base_dDiag.C_Check_OkC (dtb_u_u62))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u57)) else (let dtb_u_u64 = (((Base_dDiagnostics_dPkg.v_pkgPath1 path) (Base_dDiagnostics_dPkg.C_PkgErr_MissingManifest ((Base_dSource.v_normalizePath (Frontend_dManifest.v_manifestDir path))))) (Base_dSource.v_normalizePath (Frontend_dManifest.v_manifestDir path))) in dtb_u_u64))))

# 134 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_manifestNameString = (fun (manifest : Frontend_dManifest.t_Manifest) -> (match (manifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_memStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) (B_dData_dPair.v_firstOf dtb__19)) mc0) then true else (((v_memStackDir _uctx0) mc0) dtb__20))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_cyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) (B_dData_dPair.v_firstOf dtb__21)) mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__21, B_dData_dList.C_List_Nil)))) else (match (((v_cyclePrefix _uctx0) mc0) dtb__22) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__23))))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 156 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_cycleMessage = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (match (((v_cyclePrefix B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) mc0) mc2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> ("pkg: dependency cycle: " ^ (Base_dSource.v_joinArrows ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (B_dData_dList.v_reverse dtb__25))) (B_dData_dList.C_List__x58__x58_ (dtb__24, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__26) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_mismatchMessage = (fun (mc0 : string B_dData_dMaybe.t_Maybe) (mc1 : string) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (String.concat "" ["pkg: dependency "; dtb__27; " expects package name "; dtb__27; " but found "; mc1])
  | B_dData_dMaybe.C_Maybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyIdentityEff = (fun (dtb_u_u96 : string) (dtb_u_u99 : Frontend_dManifest.t_Dependency) (dtb_u_u100 : string) (dtb_u_u101 : Frontend_dManifest.t_Manifest) -> (match (Frontend_dManifest.v_depIdentityOf dtb_u_u99) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u103 = (Base_dDiag.C_Check_OkC (0)) in (Obj.repr ((fun (dtb_u_u104 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u103))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u105) -> (Obj.repr ((fun (dtb_u_u110 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u113 = ((((Frontend_dPackages_dSource.v_packageSourceEff_u_udirect dtb_u_u96) dtb_u_u100) dtb_u_u101) dtb_u_u110) in (match dtb_u_u113 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u114) -> (let dtb_u_u116 = (Base_dDiag.C_Check_ErrC (dtb_u_u114)) in dtb_u_u116)
  | Base_dDiag.C_Check_OkC (dtb_u_u118) -> (let dtb_u_u119 = (Frontend_dPackages_dSource.v_identityHashOf dtb_u_u118) in (if ((Frontend_dPackages_dSource.v_normalizeHash dtb_u_u105) = dtb_u_u119) then (let dtb_u_u121 = (Base_dDiag.C_Check_OkC (0)) in dtb_u_u121) else (let dtb_u_u123 = (String.concat "" ["declared "; dtb_u_u105; ", actual "; dtb_u_u119]) in (let dtb_u_u125 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMismatch ((Frontend_dManifest.v_depAliasOf dtb_u_u99), dtb_u_u123))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dtb_u_u99), (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u123, B_dData_dVec.C_Vec_Nil))))) in dtb_u_u125))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyIdentityEff_u_udirect = (fun (nFs : string) (dep : Frontend_dManifest.t_Dependency) (dir : string) (manifest : Frontend_dManifest.t_Manifest) _u_ueffTok -> (match (Frontend_dManifest.v_depIdentityOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u103 = (Base_dDiag.C_Check_OkC (0)) in dtb_u_u103)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u105) -> (let dtb_u_u113 = ((((Frontend_dPackages_dSource.v_packageSourceEff_u_udirect nFs) dir) manifest) _u_ueffTok) in (match dtb_u_u113 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u114) -> (let dtb_u_u116 = (Base_dDiag.C_Check_ErrC (dtb_u_u114)) in dtb_u_u116)
  | Base_dDiag.C_Check_OkC (dtb_u_u118) -> (let dtb_u_u119 = (Frontend_dPackages_dSource.v_identityHashOf dtb_u_u118) in (if ((Frontend_dPackages_dSource.v_normalizeHash dtb_u_u105) = dtb_u_u119) then (let dtb_u_u121 = (Base_dDiag.C_Check_OkC (0)) in dtb_u_u121) else (let dtb_u_u123 = (String.concat "" ["declared "; dtb_u_u105; ", actual "; dtb_u_u119]) in (let dtb_u_u125 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMismatch ((Frontend_dManifest.v_depAliasOf dep), dtb_u_u123))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dep), (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u123, B_dData_dVec.C_Vec_Nil))))) in dtb_u_u125))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyPathHashEff = (fun (dtb_u_u127 : string) (dtb_u_u130 : Frontend_dManifest.t_Dependency) (dtb_u_u131 : string) -> (match (Frontend_dManifest.v_depHashOf dtb_u_u130) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u133 = (Base_dDiag.C_Check_OkC (0)) in (Obj.repr ((fun (dtb_u_u134 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u133))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u135) -> (Obj.repr ((fun (dtb_u_u140 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u143 = (((Frontend_dPackages_dSource.v_packageFilesEff_u_udirect dtb_u_u127) dtb_u_u131) dtb_u_u140) in (match dtb_u_u143 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u144) -> (let dtb_u_u146 = (Base_dDiag.C_Check_ErrC (dtb_u_u144)) in dtb_u_u146)
  | Base_dDiag.C_Check_OkC (dtb_u_u148) -> (let dtb_u_u149 = (Frontend_dPackages_dSource.v_contentHashOf { Frontend_dCanonical_dPkg.f_PackageSource_psName = ""; Frontend_dCanonical_dPkg.f_PackageSource_psExports = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psDeps = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb_u_u148 }) in (if ((Frontend_dPackages_dSource.v_verifyHash dtb_u_u135) dtb_u_u149) then (let dtb_u_u151 = (Base_dDiag.C_Check_OkC (0)) in dtb_u_u151) else (let dtb_u_u153 = (String.concat "" ["declared "; dtb_u_u135; ", actual "; dtb_u_u149]) in (let dtb_u_u155 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_HashMismatch ((Frontend_dManifest.v_depAliasOf dtb_u_u130), dtb_u_u153))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dtb_u_u130), (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u153, B_dData_dVec.C_Vec_Nil))))) in dtb_u_u155))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyPathHashEff_u_udirect = (fun (nFs : string) (dep : Frontend_dManifest.t_Dependency) (dir : string) _u_ueffTok -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u133 = (Base_dDiag.C_Check_OkC (0)) in dtb_u_u133)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u135) -> (let dtb_u_u143 = (((Frontend_dPackages_dSource.v_packageFilesEff_u_udirect nFs) dir) _u_ueffTok) in (match dtb_u_u143 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u144) -> (let dtb_u_u146 = (Base_dDiag.C_Check_ErrC (dtb_u_u144)) in dtb_u_u146)
  | Base_dDiag.C_Check_OkC (dtb_u_u148) -> (let dtb_u_u149 = (Frontend_dPackages_dSource.v_contentHashOf { Frontend_dCanonical_dPkg.f_PackageSource_psName = ""; Frontend_dCanonical_dPkg.f_PackageSource_psExports = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psDeps = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb_u_u148 }) in (if ((Frontend_dPackages_dSource.v_verifyHash dtb_u_u135) dtb_u_u149) then (let dtb_u_u151 = (Base_dDiag.C_Check_OkC (0)) in dtb_u_u151) else (let dtb_u_u153 = (String.concat "" ["declared "; dtb_u_u135; ", actual "; dtb_u_u149]) in (let dtb_u_u155 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_HashMismatch ((Frontend_dManifest.v_depAliasOf dep), dtb_u_u153))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dep), (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u153, B_dData_dVec.C_Vec_Nil))))) in dtb_u_u155))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_emptyPackageMemo = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)

# 301 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoLookup = (fun (dtb_u_u159 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u160 : string) -> (Obj.repr ((fun (dtb_u_u165 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u168 = ((B_dContainer_dMutRef.v_read_u_udirect dtb_u_u159) dtb_u_u165) in (let dtb_u_u170 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u160) dtb_u_u168) in dtb_u_u170))))))

# 301 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoLookup_u_udirect = (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dir : string) _u_ueffTok -> (let dtb_u_u168 = ((B_dContainer_dMutRef.v_read_u_udirect memo) _u_ueffTok) in (let dtb_u_u170 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dir) dtb_u_u168) in dtb_u_u170)))

# 307 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoInsert = (fun (dtb_u_u174 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u175 : string) (dtb_u_u176 : t_Package) -> (Obj.repr ((fun (dtb_u_u181 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u184 = ((B_dContainer_dMutRef.v_read_u_udirect dtb_u_u174) dtb_u_u181) in ((Obj.magic ((B_dContainer_dMutRef.v_write dtb_u_u174) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u175) dtb_u_u176) dtb_u_u184))) dtb_u_u181))))))

# 307 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoInsert_u_udirect = (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dir : string) (pkg : t_Package) _u_ueffTok -> (let dtb_u_u184 = ((B_dContainer_dMutRef.v_read_u_udirect memo) _u_ueffTok) in ((Obj.magic ((B_dContainer_dMutRef.v_write memo) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dir) pkg) dtb_u_u184))) _u_ueffTok)))

# 175 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadStoreDependency = (fun (dtb_u_u185 : string) (dtb_u_u186 : string) (dtb_u_u191 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u192 : int) (dtb_u_u193 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u194 : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depHashOf dtb_u_u194) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u196 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dtb_u_u194)))) (Frontend_dManifest.v_depAliasOf dtb_u_u194)) in (Obj.repr ((fun (dtb_u_u197 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u196))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u198) -> (Obj.repr ((fun (dtb_u_u203 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u206 = ((Base_dStore.v_storeDataRootEff_u_udirect dtb_u_u186) dtb_u_u203) in (let dtb_u_u207 = (Frontend_dPackages_dSource.v_normalizeHash dtb_u_u198) in (let dtb_u_u208 = (String.concat "" [dtb_u_u206; "/pkgs/"; dtb_u_u207]) in (let dtb_u_u216 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u185) (dtb_u_u208 ^ "/.complete")) dtb_u_u203) in (if dtb_u_u216 then (let dtb_u_u224 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u185) (dtb_u_u208 ^ "/.complete")) dtb_u_u203) in (if (dtb_u_u224 = dtb_u_u207) then (let dtb_u_u232 = ((((((((v_loadPackageWalk_u_udirect dtb_u_u185) dtb_u_u186) dtb_u_u191) dtb_u_u192) dtb_u_u193) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dtb_u_u194)))) dtb_u_u208) dtb_u_u203) in (match dtb_u_u232 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u233) -> (let dtb_u_u235 = (Base_dDiag.C_Check_ErrC (dtb_u_u233)) in dtb_u_u235)
  | Base_dDiag.C_Check_OkC (dtb_u_u237) -> (let dtb_u_u245 = (((((v_verifyIdentityEff_u_udirect dtb_u_u185) dtb_u_u194) dtb_u_u208) (dtb_u_u237).f_Package_packageManifest) dtb_u_u203) in (match dtb_u_u245 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u246) -> (let dtb_u_u248 = (Base_dDiag.C_Check_ErrC (dtb_u_u246)) in dtb_u_u248)
  | Base_dDiag.C_Check_OkC (dtb_u_u250) -> (let dtb_u_u252 = (Base_dDiag.C_Check_OkC (dtb_u_u237)) in dtb_u_u252)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u255 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dtb_u_u194)))) (Frontend_dManifest.v_depAliasOf dtb_u_u194)) in dtb_u_u255))) else (let dtb_u_u258 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dtb_u_u194)))) (Frontend_dManifest.v_depAliasOf dtb_u_u194)) in dtb_u_u258)))))))))
  | _ -> failwith "DT: impossible branch"
))
# 248 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadDependencyList = (fun (dtb_u_u260 : string) (dtb_u_u261 : string) (dtb_u_u266 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u267 : int) (dtb_u_u268 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u269 : string) (dtb_u_u270 : Frontend_dManifest.t_Dependency B_dData_dList.t_List) -> (if (dtb_u_u267 <= 0) then (let dtb_u_u272 = (Base_dDiag.v_icFuel "pkg") in (Obj.repr ((fun (dtb_u_u273 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u272)))) else (match dtb_u_u270 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u275 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u276 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u275))))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u277, dtb_u_u278) -> (Obj.repr ((fun (dtb_u_u283 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u286 = ((((((((v_loadOneDependency_u_udirect dtb_u_u260) dtb_u_u261) dtb_u_u266) (dtb_u_u267 - 1)) dtb_u_u268) dtb_u_u269) dtb_u_u277) dtb_u_u283) in (match dtb_u_u286 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u287) -> (let dtb_u_u289 = (Base_dDiag.C_Check_ErrC (dtb_u_u287)) in dtb_u_u289)
  | Base_dDiag.C_Check_OkC (dtb_u_u291) -> (let dtb_u_u299 = ((((((((v_loadDependencyList_u_udirect dtb_u_u260) dtb_u_u261) dtb_u_u266) (dtb_u_u267 - 1)) dtb_u_u268) dtb_u_u269) dtb_u_u278) dtb_u_u283) in (let dtb_u_u301 = (match dtb_u_u299 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u303) -> (Base_dDiag.C_Check_ErrC (dtb_u_u303))
  | Base_dDiag.C_Check_OkC (dtb_u_u304) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u291, dtb_u_u304))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u301))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
# 270 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadOneDependency = (fun (dtb_u_u305 : string) (dtb_u_u306 : string) (dtb_u_u311 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u312 : int) (dtb_u_u313 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u314 : string) (dtb_u_u315 : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depSourceOf dtb_u_u315) with
  | Frontend_dManifest.C_DependencySource_DepPath (dtb_u_u316) -> (let dtb_u_u317 = ((Base_dSource.v_joinPath dtb_u_u314) dtb_u_u316) in (Obj.repr ((fun (dtb_u_u322 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u325 = ((((((((v_loadPackageWalk_u_udirect dtb_u_u305) dtb_u_u306) dtb_u_u311) dtb_u_u312) dtb_u_u313) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dtb_u_u315)))) dtb_u_u317) dtb_u_u322) in (match dtb_u_u325 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u326) -> (let dtb_u_u328 = (Base_dDiag.C_Check_ErrC (dtb_u_u326)) in dtb_u_u328)
  | Base_dDiag.C_Check_OkC (dtb_u_u330) -> (let dtb_u_u338 = ((((v_verifyPathHashEff_u_udirect dtb_u_u305) dtb_u_u315) dtb_u_u317) dtb_u_u322) in (match dtb_u_u338 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u339) -> (let dtb_u_u341 = (Base_dDiag.C_Check_ErrC (dtb_u_u339)) in dtb_u_u341)
  | Base_dDiag.C_Check_OkC (dtb_u_u343) -> (let dtb_u_u351 = (((((v_verifyIdentityEff_u_udirect dtb_u_u305) dtb_u_u315) dtb_u_u317) (dtb_u_u330).f_Package_packageManifest) dtb_u_u322) in (match dtb_u_u351 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u352) -> (let dtb_u_u354 = (Base_dDiag.C_Check_ErrC (dtb_u_u352)) in dtb_u_u354)
  | Base_dDiag.C_Check_OkC (dtb_u_u356) -> (let dtb_u_u358 = (Base_dDiag.C_Check_OkC (dtb_u_u330)) in dtb_u_u358)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
  | Frontend_dManifest.C_DependencySource_DepGit (dtb_u_u360, dtb_u_u361) -> ((((((v_loadStoreDependency dtb_u_u305) dtb_u_u306) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u315)
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb_u_u362) -> ((((((v_loadStoreDependency dtb_u_u305) dtb_u_u306) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u315)
  | _ -> failwith "DT: impossible branch"
))
# 313 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadPackageWalk = (fun (dtb_u_u363 : string) (dtb_u_u364 : string) (dtb_u_u369 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u370 : int) (dtb_u_u371 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u372 : string B_dData_dMaybe.t_Maybe) (dtb_u_u373 : string) -> (if (dtb_u_u370 <= 0) then (let dtb_u_u375 = (Base_dDiag.v_icFuel "pkg") in (Obj.repr ((fun (dtb_u_u376 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u375)))) else (let dtb_u_u377 = (Base_dSource.v_normalizePath dtb_u_u373) in (if (((v_memStackDir B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u377) dtb_u_u371) then (let dtb_u_u379 = (Base_dDiagnostics_dPkg.v_pkgInvalid (((v_cycleMessage dtb_u_u377) dtb_u_u372) dtb_u_u371)) in (Obj.repr ((fun (dtb_u_u380 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u379)))) else (Obj.repr ((fun (dtb_u_u385 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u388 = (((v_memoLookup_u_udirect dtb_u_u369) dtb_u_u377) dtb_u_u385) in (match dtb_u_u388 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u389) -> (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u372) (v_packageName dtb_u_u389)) then (let dtb_u_u391 = (Base_dDiag.C_Check_OkC (dtb_u_u389)) in dtb_u_u391) else (let dtb_u_u394 = (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage dtb_u_u372) (v_packageName dtb_u_u389))) in dtb_u_u394))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u403 = (((v_loadManifestAt_u_udirect dtb_u_u363) (dtb_u_u377 ^ "/vuna.toml")) dtb_u_u385) in (match dtb_u_u403 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u404) -> (let dtb_u_u406 = (Base_dDiag.C_Check_ErrC (dtb_u_u404)) in dtb_u_u406)
  | Base_dDiag.C_Check_OkC (dtb_u_u408) -> (match (dtb_u_u408).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u410 = ((Base_dDiagnostics_dPkg.v_pkgPath0 (dtb_u_u408).Frontend_dManifest.f_Manifest_manifestPath) Base_dDiagnostics_dPkg.C_PkgErr_NotPackage) in dtb_u_u410)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u412) -> (let dtb_u_u413 = (v_manifestNameString dtb_u_u408) in (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u372) dtb_u_u413) then (let dtb_u_u421 = ((((((((v_loadDependencyList_u_udirect dtb_u_u363) dtb_u_u364) dtb_u_u369) (dtb_u_u370 - 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u377; B_dData_dPair.f_Pair_second = dtb_u_u413 }, dtb_u_u371))) dtb_u_u377) (dtb_u_u408).Frontend_dManifest.f_Manifest_manifestDependencies) dtb_u_u385) in (match dtb_u_u421 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u422) -> (let dtb_u_u424 = (Base_dDiag.C_Check_ErrC (dtb_u_u422)) in dtb_u_u424)
  | Base_dDiag.C_Check_OkC (dtb_u_u426) -> (let dtb_u_u427 = { f_Package_packageManifest = dtb_u_u408; f_Package_packageDependencies = dtb_u_u426; f_Package_packageDir = dtb_u_u377 } in (let dtb_u_u435 = ((((v_memoInsert_u_udirect dtb_u_u369) dtb_u_u377) dtb_u_u427) dtb_u_u385) in (let dtb_u_u437 = (Base_dDiag.C_Check_OkC (dtb_u_u427)) in dtb_u_u437)))
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u440 = (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage dtb_u_u372) dtb_u_u413)) in dtb_u_u440)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))))
# 175 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadStoreDependency_u_udirect = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dep : Frontend_dManifest.t_Dependency) _u_ueffTok -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u196 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)) in dtb_u_u196)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u198) -> (let dtb_u_u206 = ((Base_dStore.v_storeDataRootEff_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u207 = (Frontend_dPackages_dSource.v_normalizeHash dtb_u_u198) in (let dtb_u_u208 = (String.concat "" [dtb_u_u206; "/pkgs/"; dtb_u_u207]) in (let dtb_u_u216 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) (dtb_u_u208 ^ "/.complete")) _u_ueffTok) in (if dtb_u_u216 then (let dtb_u_u224 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) (dtb_u_u208 ^ "/.complete")) _u_ueffTok) in (if (dtb_u_u224 = dtb_u_u207) then (let dtb_u_u232 = ((((((((v_loadPackageWalk_u_udirect nFs) nEnv) memo) fuel) stack) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dep)))) dtb_u_u208) _u_ueffTok) in (match dtb_u_u232 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u233) -> (let dtb_u_u235 = (Base_dDiag.C_Check_ErrC (dtb_u_u233)) in dtb_u_u235)
  | Base_dDiag.C_Check_OkC (dtb_u_u237) -> (let dtb_u_u245 = (((((v_verifyIdentityEff_u_udirect nFs) dep) dtb_u_u208) (dtb_u_u237).f_Package_packageManifest) _u_ueffTok) in (match dtb_u_u245 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u246) -> (let dtb_u_u248 = (Base_dDiag.C_Check_ErrC (dtb_u_u246)) in dtb_u_u248)
  | Base_dDiag.C_Check_OkC (dtb_u_u250) -> (let dtb_u_u252 = (Base_dDiag.C_Check_OkC (dtb_u_u237)) in dtb_u_u252)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u255 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)) in dtb_u_u255))) else (let dtb_u_u258 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)) in dtb_u_u258))))))
  | _ -> failwith "DT: impossible branch"
))
# 248 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadDependencyList_u_udirect = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (baseDir : string) (deps : Frontend_dManifest.t_Dependency B_dData_dList.t_List) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u272 = (Base_dDiag.v_icFuel "pkg") in dtb_u_u272) else (match deps with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u275 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u275)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u277, dtb_u_u278) -> (let dtb_u_u286 = ((((((((v_loadOneDependency_u_udirect nFs) nEnv) memo) (fuel - 1)) stack) baseDir) dtb_u_u277) _u_ueffTok) in (match dtb_u_u286 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u287) -> (let dtb_u_u289 = (Base_dDiag.C_Check_ErrC (dtb_u_u287)) in dtb_u_u289)
  | Base_dDiag.C_Check_OkC (dtb_u_u291) -> (let dtb_u_u299 = ((((((((v_loadDependencyList_u_udirect nFs) nEnv) memo) (fuel - 1)) stack) baseDir) dtb_u_u278) _u_ueffTok) in (let dtb_u_u301 = (match dtb_u_u299 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u303) -> (Base_dDiag.C_Check_ErrC (dtb_u_u303))
  | Base_dDiag.C_Check_OkC (dtb_u_u304) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u291, dtb_u_u304))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u301))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 270 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadOneDependency_u_udirect = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (baseDir : string) (dep : Frontend_dManifest.t_Dependency) _u_ueffTok -> (match (Frontend_dManifest.v_depSourceOf dep) with
  | Frontend_dManifest.C_DependencySource_DepPath (dtb_u_u316) -> (let dtb_u_u317 = ((Base_dSource.v_joinPath baseDir) dtb_u_u316) in (let dtb_u_u325 = ((((((((v_loadPackageWalk_u_udirect nFs) nEnv) memo) fuel) stack) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dep)))) dtb_u_u317) _u_ueffTok) in (match dtb_u_u325 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u326) -> (let dtb_u_u328 = (Base_dDiag.C_Check_ErrC (dtb_u_u326)) in dtb_u_u328)
  | Base_dDiag.C_Check_OkC (dtb_u_u330) -> (let dtb_u_u338 = ((((v_verifyPathHashEff_u_udirect nFs) dep) dtb_u_u317) _u_ueffTok) in (match dtb_u_u338 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u339) -> (let dtb_u_u341 = (Base_dDiag.C_Check_ErrC (dtb_u_u339)) in dtb_u_u341)
  | Base_dDiag.C_Check_OkC (dtb_u_u343) -> (let dtb_u_u351 = (((((v_verifyIdentityEff_u_udirect nFs) dep) dtb_u_u317) (dtb_u_u330).f_Package_packageManifest) _u_ueffTok) in (match dtb_u_u351 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u352) -> (let dtb_u_u354 = (Base_dDiag.C_Check_ErrC (dtb_u_u352)) in dtb_u_u354)
  | Base_dDiag.C_Check_OkC (dtb_u_u356) -> (let dtb_u_u358 = (Base_dDiag.C_Check_OkC (dtb_u_u330)) in dtb_u_u358)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dManifest.C_DependencySource_DepGit (dtb_u_u360, dtb_u_u361) -> ((Obj.magic ((((((v_loadStoreDependency nFs) nEnv) memo) fuel) stack) dep)) _u_ueffTok)
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb_u_u362) -> ((Obj.magic ((((((v_loadStoreDependency nFs) nEnv) memo) fuel) stack) dep)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
# 313 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadPackageWalk_u_udirect = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (depName : string B_dData_dMaybe.t_Maybe) (dir : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u375 = (Base_dDiag.v_icFuel "pkg") in dtb_u_u375) else (let dtb_u_u377 = (Base_dSource.v_normalizePath dir) in (if (((v_memStackDir B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u377) stack) then (let dtb_u_u379 = (Base_dDiagnostics_dPkg.v_pkgInvalid (((v_cycleMessage dtb_u_u377) depName) stack)) in dtb_u_u379) else (let dtb_u_u388 = (((v_memoLookup_u_udirect memo) dtb_u_u377) _u_ueffTok) in (match dtb_u_u388 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u389) -> (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) depName) (v_packageName dtb_u_u389)) then (let dtb_u_u391 = (Base_dDiag.C_Check_OkC (dtb_u_u389)) in dtb_u_u391) else (let dtb_u_u394 = (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage depName) (v_packageName dtb_u_u389))) in dtb_u_u394))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u403 = (((v_loadManifestAt_u_udirect nFs) (dtb_u_u377 ^ "/vuna.toml")) _u_ueffTok) in (match dtb_u_u403 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u404) -> (let dtb_u_u406 = (Base_dDiag.C_Check_ErrC (dtb_u_u404)) in dtb_u_u406)
  | Base_dDiag.C_Check_OkC (dtb_u_u408) -> (match (dtb_u_u408).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u410 = ((Base_dDiagnostics_dPkg.v_pkgPath0 (dtb_u_u408).Frontend_dManifest.f_Manifest_manifestPath) Base_dDiagnostics_dPkg.C_PkgErr_NotPackage) in dtb_u_u410)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u412) -> (let dtb_u_u413 = (v_manifestNameString dtb_u_u408) in (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) depName) dtb_u_u413) then (let dtb_u_u421 = ((((((((v_loadDependencyList_u_udirect nFs) nEnv) memo) (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u377; B_dData_dPair.f_Pair_second = dtb_u_u413 }, stack))) dtb_u_u377) (dtb_u_u408).Frontend_dManifest.f_Manifest_manifestDependencies) _u_ueffTok) in (match dtb_u_u421 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u422) -> (let dtb_u_u424 = (Base_dDiag.C_Check_ErrC (dtb_u_u422)) in dtb_u_u424)
  | Base_dDiag.C_Check_OkC (dtb_u_u426) -> (let dtb_u_u427 = { f_Package_packageManifest = dtb_u_u408; f_Package_packageDependencies = dtb_u_u426; f_Package_packageDir = dtb_u_u377 } in (let dtb_u_u435 = ((((v_memoInsert_u_udirect memo) dtb_u_u377) dtb_u_u427) _u_ueffTok) in (let dtb_u_u437 = (Base_dDiag.C_Check_OkC (dtb_u_u427)) in dtb_u_u437)))
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u440 = (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage depName) dtb_u_u413)) in dtb_u_u440)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 366 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_lookupPackageDir = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> (if (dtb__99 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__100)) else ((v_lookupPackageDir mc0) dtb__98))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_checkUniqueNamesGo = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (match dtb__101 with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> (match ((v_lookupPackageDir dtb__103) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkUniqueNamesGo (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 }, mc0))) dtb__102)
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (if (dtb__105 = dtb__104) then ((v_checkUniqueNamesGo mc0) dtb__102) else ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_DuplicatePackageName (dtb__103, dtb__105, dtb__104))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__103, (B_dData_dVec.C_Vec__x58__x58_ (dtb__105, (B_dData_dVec.C_Vec__x58__x58_ (dtb__104, B_dData_dVec.C_Vec_Nil))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_pkgFuelBound = 1048576

# 439 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceRootOf = (fun (workspace : t_Workspace) -> (workspace).f_Workspace_workspaceRoot)

# 442 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceMembersOf = (fun (workspace : t_Workspace) -> (workspace).f_Workspace_workspaceMembers)

# 446 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceAllPackages = (fun (workspace : t_Workspace) -> (match (workspace).f_Workspace_workspaceRoot with
  | B_dData_dMaybe.C_Maybe_Nothing -> (workspace).f_Workspace_workspaceMembers
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> (B_dData_dList.C_List__x58__x58_ (dtb__106, (workspace).f_Workspace_workspaceMembers))
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_findManifestUpMaybe = (fun (dtb_u_u459 : string) (dtb_u_u462 : int) (dtb_u_u463 : string) -> (if (dtb_u_u462 <= 0) then (let dtb_u_u465 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u466 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u465)))) else (Obj.repr ((fun (dtb_u_u471 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u474 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u459) (dtb_u_u463 ^ "/vuna.toml")) dtb_u_u471) in (if dtb_u_u474 then (let dtb_u_u476 = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u463)) in dtb_u_u476) else ((Obj.magic ((((v_findManifestUpMaybeStep dtb_u_u459) (dtb_u_u462 - 1)) dtb_u_u463) (Frontend_dManifest.v_manifestDir dtb_u_u463))) dtb_u_u471))))))))
# 579 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_findManifestUpMaybeStep = (fun (dtb_u_u478 : string) (dtb_u_u481 : int) (dtb_u_u482 : string) (dtb_u_u483 : string) -> (if (dtb_u_u481 <= 0) then (let dtb_u_u485 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u486 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u485)))) else (if (dtb_u_u483 = dtb_u_u482) then (let dtb_u_u488 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u489 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u488)))) else (((v_findManifestUpMaybe dtb_u_u478) (dtb_u_u481 - 1)) dtb_u_u483))))
# 570 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_findManifestUpMaybe_u_udirect = (fun (nFs : string) (fuel : int) (dir : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u465 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u465) else (let dtb_u_u474 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) (dir ^ "/vuna.toml")) _u_ueffTok) in (if dtb_u_u474 then (let dtb_u_u476 = (B_dData_dMaybe.C_Maybe_Just (dir)) in dtb_u_u476) else ((Obj.magic ((((v_findManifestUpMaybeStep nFs) (fuel - 1)) dir) (Frontend_dManifest.v_manifestDir dir))) _u_ueffTok)))))
# 579 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_findManifestUpMaybeStep_u_udirect = (fun (nFs : string) (fuel : int) (dir : string) (parent : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u485 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u485) else (if (parent = dir) then (let dtb_u_u488 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u488) else ((Obj.magic (((v_findManifestUpMaybe nFs) (fuel - 1)) parent)) _u_ueffTok))))

# 590 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDirMaybe = (fun (nFs : string) (startDir : string) -> (let start = (Base_dSource.v_normalizePath startDir) in (((v_findManifestUpMaybe nFs) ((2 * (String.length start)) + 4)) start)))

# 590 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDirMaybe_u_udirect = (fun (nFs : string) (startDir : string) _u_ueffTok -> (let dtb_u_u494 = (Base_dSource.v_normalizePath startDir) in ((Obj.magic (((v_findManifestUpMaybe nFs) ((2 * (String.length dtb_u_u494)) + 4)) dtb_u_u494)) _u_ueffTok)))

# 598 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDir = (fun (dtb_u_u495 : string) (dtb_u_u498 : string) -> (Obj.repr ((fun (dtb_u_u503 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u506 = (((v_findManifestDirMaybe_u_udirect dtb_u_u495) dtb_u_u498) dtb_u_u503) in (let dtb_u_u508 = (match dtb_u_u506 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u510) -> (Base_dDiag.C_Check_OkC (dtb_u_u510))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_NoManifestUpward ((Base_dSource.v_normalizePath dtb_u_u498)))) (B_dData_dVec.C_Vec__x58__x58_ ((Base_dSource.v_normalizePath dtb_u_u498), B_dData_dVec.C_Vec_Nil)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u508))))))

# 598 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDir_u_udirect = (fun (nFs : string) (startDir : string) _u_ueffTok -> (let dtb_u_u506 = (((v_findManifestDirMaybe_u_udirect nFs) startDir) _u_ueffTok) in (let dtb_u_u508 = (match dtb_u_u506 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u510) -> (Base_dDiag.C_Check_OkC (dtb_u_u510))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_NoManifestUpward ((Base_dSource.v_normalizePath startDir)))) (B_dData_dVec.C_Vec__x58__x58_ ((Base_dSource.v_normalizePath startDir), B_dData_dVec.C_Vec_Nil)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u508)))

# 612 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_hasManifest = (fun (nFs : string) (dir : string) -> ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/vuna.toml")))

# 612 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_hasManifest_u_udirect = (fun (nFs : string) (dir : string) _u_ueffTok -> ((Obj.magic ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/vuna.toml"))) _u_ueffTok))

# 615 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseCandidates = (fun (exeDir : string) -> (B_dData_dList.C_List__x58__x58_ (((Base_dSource.v_joinPath exeDir) "base"), (B_dData_dList.C_List__x58__x58_ (((Base_dSource.v_joinPath exeDir) "../base"), (B_dData_dList.C_List__x58__x58_ (((Base_dSource.v_joinPath exeDir) "../../base"), (B_dData_dList.C_List__x58__x58_ (((Base_dSource.v_joinPath exeDir) "../../../base"), B_dData_dList.C_List_Nil)))))))))

# 624 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseNotFound = (fun (tried : string B_dData_dList.t_List) -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_MissingBase ((v_joinPathsText tried)))) (v_joinPathsText tried)))

# 627 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_firstExistingBase = (fun (dtb_u_u518 : string) (dtb_u_u521 : string B_dData_dList.t_List) (dtb_u_u522 : string B_dData_dList.t_List) -> (match dtb_u_u522 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u523, dtb_u_u524) -> (Obj.repr ((fun (dtb_u_u529 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u532 = (((v_hasManifest_u_udirect dtb_u_u518) dtb_u_u523) dtb_u_u529) in (if dtb_u_u532 then (let dtb_u_u534 = (Base_dDiag.C_Check_OkC (dtb_u_u523)) in dtb_u_u534) else ((Obj.magic (((v_firstExistingBase dtb_u_u518) dtb_u_u521) dtb_u_u524)) dtb_u_u529))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u537 = (v_baseNotFound dtb_u_u521) in (Obj.repr ((fun (dtb_u_u538 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u537))))
  | _ -> failwith "DT: impossible branch"
))
# 627 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_firstExistingBase_u_udirect = (fun (nFs : string) (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u523, dtb_u_u524) -> (let dtb_u_u532 = (((v_hasManifest_u_udirect nFs) dtb_u_u523) _u_ueffTok) in (if dtb_u_u532 then (let dtb_u_u534 = (Base_dDiag.C_Check_OkC (dtb_u_u523)) in dtb_u_u534) else ((Obj.magic (((v_firstExistingBase nFs) mc0) dtb_u_u524)) _u_ueffTok)))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u537 = (v_baseNotFound mc0) in dtb_u_u537)
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_locateBase = (fun (dtb_u_u539 : string) (dtb_u_u540 : string) (dtb_u_u544 : B_dData_dUnit.t_Unit) -> (Obj.repr ((fun (dtb_u_u549 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u552 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u540) "VUNA_BASE") dtb_u_u549) in (if (dtb_u_u552 = "") then (let dtb_u_u560 = ((B_dEffect_dEnv.v_envExecPath_u_udirect dtb_u_u540) dtb_u_u549) in (let dtb_u_u568 = (((v_absolutePath_u_udirect dtb_u_u540) dtb_u_u560) dtb_u_u549) in (let dtb_u_u569 = (v_baseCandidates (Frontend_dManifest.v_manifestDir dtb_u_u568)) in ((Obj.magic (((v_firstExistingBase dtb_u_u539) dtb_u_u569) dtb_u_u569)) dtb_u_u549)))) else (let dtb_u_u577 = (((v_absolutePath_u_udirect dtb_u_u540) dtb_u_u552) dtb_u_u549) in (let dtb_u_u585 = (((v_hasManifest_u_udirect dtb_u_u539) dtb_u_u577) dtb_u_u549) in (if dtb_u_u585 then (let dtb_u_u587 = (Base_dDiag.C_Check_OkC (dtb_u_u577)) in dtb_u_u587) else (let dtb_u_u590 = (v_baseNotFound (B_dData_dList.C_List__x58__x58_ (dtb_u_u577, B_dData_dList.C_List_Nil))) in dtb_u_u590))))))))))

# 636 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_locateBase_u_udirect = (fun (nFs : string) (nEnv : string) (_u : B_dData_dUnit.t_Unit) _u_ueffTok -> (let dtb_u_u552 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_BASE") _u_ueffTok) in (if (dtb_u_u552 = "") then (let dtb_u_u560 = ((B_dEffect_dEnv.v_envExecPath_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u568 = (((v_absolutePath_u_udirect nEnv) dtb_u_u560) _u_ueffTok) in (let dtb_u_u569 = (v_baseCandidates (Frontend_dManifest.v_manifestDir dtb_u_u568)) in ((Obj.magic (((v_firstExistingBase nFs) dtb_u_u569) dtb_u_u569)) _u_ueffTok)))) else (let dtb_u_u577 = (((v_absolutePath_u_udirect nEnv) dtb_u_u552) _u_ueffTok) in (let dtb_u_u585 = (((v_hasManifest_u_udirect nFs) dtb_u_u577) _u_ueffTok) in (if dtb_u_u585 then (let dtb_u_u587 = (Base_dDiag.C_Check_OkC (dtb_u_u577)) in dtb_u_u587) else (let dtb_u_u590 = (v_baseNotFound (B_dData_dList.C_List__x58__x58_ (dtb_u_u577, B_dData_dList.C_List_Nil))) in dtb_u_u590)))))))

# 38 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootDir = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__126; f_Root_rootName = dtb__127; f_Root_rootExports = dtb__128; f_Root_rootLayerRules = dtb__129; f_Root_rootImplicitPrelude = dtb__130 } -> dtb__126
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootName = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__131; f_Root_rootName = dtb__132; f_Root_rootExports = dtb__133; f_Root_rootLayerRules = dtb__134; f_Root_rootImplicitPrelude = dtb__135 } -> dtb__132
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootPackage = (fun (root : t_Root) -> (v_rootName root))

# 40 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootExports = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__136; f_Root_rootName = dtb__137; f_Root_rootExports = dtb__138; f_Root_rootLayerRules = dtb__139; f_Root_rootImplicitPrelude = dtb__140 } -> dtb__138
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootLayerRules = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__141; f_Root_rootName = dtb__142; f_Root_rootExports = dtb__143; f_Root_rootLayerRules = dtb__144; f_Root_rootImplicitPrelude = dtb__145 } -> dtb__144
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootImplicitPrelude = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__146; f_Root_rootName = dtb__147; f_Root_rootExports = dtb__148; f_Root_rootLayerRules = dtb__149; f_Root_rootImplicitPrelude = dtb__150 } -> dtb__150
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageManifest = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__151; f_Package_packageDependencies = dtb__152; f_Package_packageDir = dtb__153 } -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDependencies = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__154; f_Package_packageDependencies = dtb__155; f_Package_packageDir = dtb__156 } -> dtb__155
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDir = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__157; f_Package_packageDependencies = dtb__158; f_Package_packageDir = dtb__159 } -> dtb__159
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_collectPackageIds = (fun (package : t_Package) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_packageName package); B_dData_dPair.f_Pair_second = (v_packageDir package) }, (v_collectDependencyIds (v_packageDependencies package)))))
# 361 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_collectDependencyIds = (fun (mc0 : t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> ((B_dData_dList.v_append (v_collectPackageIds dtb__160)) (v_collectDependencyIds dtb__161))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_checkUniquePackageNames = (fun (packages : t_Package B_dData_dList.t_List) -> ((v_checkUniqueNamesGo B_dData_dList.C_List_Nil) (v_collectDependencyIds packages)))

# 397 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadPackage = (fun (dtb_u_u640 : string) (dtb_u_u641 : string) (dtb_u_u645 : string) -> ((B_dContainer_dMutRef.v_withMutRef v_emptyPackageMemo) (fun (dtb_u_u646 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) -> (Obj.repr ((fun (dtb_u_u651 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u654 = ((((((((v_loadPackageWalk_u_udirect dtb_u_u640) dtb_u_u641) dtb_u_u646) v_pkgFuelBound) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u645) dtb_u_u651) in (let dtb_u_u656 = (match dtb_u_u654 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u658) -> (Base_dDiag.C_Check_ErrC (dtb_u_u658))
  | Base_dDiag.C_Check_OkC (dtb_u_u659) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb_u_u659, B_dData_dList.C_List_Nil))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u660) -> (Base_dDiag.C_Check_ErrC (dtb_u_u660))
  | Base_dDiag.C_Check_OkC (dtb_u_u661) -> (Base_dDiag.C_Check_OkC (dtb_u_u659))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u656))))))))

# 397 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadPackage_u_udirect = (fun (nFs : string) (nEnv : string) (dir : string) _u_ueffTok -> ((Obj.magic ((B_dContainer_dMutRef.v_withMutRef v_emptyPackageMemo) (fun (dtb_u_u646 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) -> (Obj.repr ((fun (dtb_u_u651 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u654 = ((((((((v_loadPackageWalk_u_udirect nFs) nEnv) dtb_u_u646) v_pkgFuelBound) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing) dir) dtb_u_u651) in (let dtb_u_u656 = (match dtb_u_u654 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u658) -> (Base_dDiag.C_Check_ErrC (dtb_u_u658))
  | Base_dDiag.C_Check_OkC (dtb_u_u659) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb_u_u659, B_dData_dList.C_List_Nil))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u660) -> (Base_dDiag.C_Check_ErrC (dtb_u_u660))
  | Base_dDiag.C_Check_OkC (dtb_u_u661) -> (Base_dDiag.C_Check_OkC (dtb_u_u659))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u656)))))))) _u_ueffTok))

# 414 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadMembers = (fun (dtb_u_u662 : string) (dtb_u_u663 : string) (dtb_u_u667 : string) (dtb_u_u668 : string B_dData_dList.t_List) -> (match dtb_u_u668 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u669, dtb_u_u670) -> (Obj.repr ((fun (dtb_u_u675 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u678 = ((((v_loadPackage_u_udirect dtb_u_u662) dtb_u_u663) ((Base_dSource.v_joinPath dtb_u_u667) dtb_u_u669)) dtb_u_u675) in (match dtb_u_u678 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u679) -> (let dtb_u_u681 = (Base_dDiag.C_Check_ErrC (dtb_u_u679)) in dtb_u_u681)
  | Base_dDiag.C_Check_OkC (dtb_u_u683) -> (let dtb_u_u691 = (((((v_loadMembers_u_udirect dtb_u_u662) dtb_u_u663) dtb_u_u667) dtb_u_u670) dtb_u_u675) in (let dtb_u_u693 = (match dtb_u_u691 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u695) -> (Base_dDiag.C_Check_ErrC (dtb_u_u695))
  | Base_dDiag.C_Check_OkC (dtb_u_u696) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u683, dtb_u_u696))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u693))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u698 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u699 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u698))))
  | _ -> failwith "DT: impossible branch"
))
# 414 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadMembers_u_udirect = (fun (nFs : string) (nEnv : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u669, dtb_u_u670) -> (let dtb_u_u678 = ((((v_loadPackage_u_udirect nFs) nEnv) ((Base_dSource.v_joinPath mc0) dtb_u_u669)) _u_ueffTok) in (match dtb_u_u678 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u679) -> (let dtb_u_u681 = (Base_dDiag.C_Check_ErrC (dtb_u_u679)) in dtb_u_u681)
  | Base_dDiag.C_Check_OkC (dtb_u_u683) -> (let dtb_u_u691 = (((((v_loadMembers_u_udirect nFs) nEnv) mc0) dtb_u_u670) _u_ueffTok) in (let dtb_u_u693 = (match dtb_u_u691 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u695) -> (Base_dDiag.C_Check_ErrC (dtb_u_u695))
  | Base_dDiag.C_Check_OkC (dtb_u_u696) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u683, dtb_u_u696))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u693))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u698 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u698)
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadWorkspace = (fun (dtb_u_u700 : string) (dtb_u_u701 : string) (dtb_u_u705 : string) -> (let dtb_u_u706 = (Base_dSource.v_normalizePath dtb_u_u705) in (Obj.repr ((fun (dtb_u_u711 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u714 = (((v_loadManifestAt_u_udirect dtb_u_u700) (dtb_u_u706 ^ "/vuna.toml")) dtb_u_u711) in (match dtb_u_u714 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u715) -> (let dtb_u_u717 = (Base_dDiag.C_Check_ErrC (dtb_u_u715)) in dtb_u_u717)
  | Base_dDiag.C_Check_OkC (dtb_u_u719) -> (match (dtb_u_u719).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u727 = (((((v_loadMembers_u_udirect dtb_u_u700) dtb_u_u701) dtb_u_u706) (dtb_u_u719).Frontend_dManifest.f_Manifest_manifestMembers) dtb_u_u711) in (let dtb_u_u729 = (match dtb_u_u727 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u731) -> (Base_dDiag.C_Check_ErrC (dtb_u_u731))
  | Base_dDiag.C_Check_OkC (dtb_u_u732) -> (match (v_checkUniquePackageNames dtb_u_u732) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u733) -> (Base_dDiag.C_Check_ErrC (dtb_u_u733))
  | Base_dDiag.C_Check_OkC (dtb_u_u734) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = dtb_u_u706; f_Workspace_workspaceRoot = B_dData_dMaybe.C_Maybe_Nothing; f_Workspace_workspaceMembers = dtb_u_u732 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u729))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u735) -> (let dtb_u_u743 = ((((v_loadPackage_u_udirect dtb_u_u700) dtb_u_u701) dtb_u_u706) dtb_u_u711) in (match dtb_u_u743 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u744) -> (let dtb_u_u746 = (Base_dDiag.C_Check_ErrC (dtb_u_u744)) in dtb_u_u746)
  | Base_dDiag.C_Check_OkC (dtb_u_u748) -> (let dtb_u_u756 = (((((v_loadMembers_u_udirect dtb_u_u700) dtb_u_u701) dtb_u_u706) (dtb_u_u719).Frontend_dManifest.f_Manifest_manifestMembers) dtb_u_u711) in (let dtb_u_u758 = (match dtb_u_u756 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u760) -> (Base_dDiag.C_Check_ErrC (dtb_u_u760))
  | Base_dDiag.C_Check_OkC (dtb_u_u761) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb_u_u748, dtb_u_u761))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u762) -> (Base_dDiag.C_Check_ErrC (dtb_u_u762))
  | Base_dDiag.C_Check_OkC (dtb_u_u763) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = dtb_u_u706; f_Workspace_workspaceRoot = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u748)); f_Workspace_workspaceMembers = dtb_u_u761 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u758))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 454 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadWorkspace_u_udirect = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) _u_ueffTok -> (let dtb_u_u706 = (Base_dSource.v_normalizePath rootBaseDir) in (let dtb_u_u714 = (((v_loadManifestAt_u_udirect nFs) (dtb_u_u706 ^ "/vuna.toml")) _u_ueffTok) in (match dtb_u_u714 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u715) -> (let dtb_u_u717 = (Base_dDiag.C_Check_ErrC (dtb_u_u715)) in dtb_u_u717)
  | Base_dDiag.C_Check_OkC (dtb_u_u719) -> (match (dtb_u_u719).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u727 = (((((v_loadMembers_u_udirect nFs) nEnv) dtb_u_u706) (dtb_u_u719).Frontend_dManifest.f_Manifest_manifestMembers) _u_ueffTok) in (let dtb_u_u729 = (match dtb_u_u727 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u731) -> (Base_dDiag.C_Check_ErrC (dtb_u_u731))
  | Base_dDiag.C_Check_OkC (dtb_u_u732) -> (match (v_checkUniquePackageNames dtb_u_u732) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u733) -> (Base_dDiag.C_Check_ErrC (dtb_u_u733))
  | Base_dDiag.C_Check_OkC (dtb_u_u734) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = dtb_u_u706; f_Workspace_workspaceRoot = B_dData_dMaybe.C_Maybe_Nothing; f_Workspace_workspaceMembers = dtb_u_u732 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u729))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u735) -> (let dtb_u_u743 = ((((v_loadPackage_u_udirect nFs) nEnv) dtb_u_u706) _u_ueffTok) in (match dtb_u_u743 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u744) -> (let dtb_u_u746 = (Base_dDiag.C_Check_ErrC (dtb_u_u744)) in dtb_u_u746)
  | Base_dDiag.C_Check_OkC (dtb_u_u748) -> (let dtb_u_u756 = (((((v_loadMembers_u_udirect nFs) nEnv) dtb_u_u706) (dtb_u_u719).Frontend_dManifest.f_Manifest_manifestMembers) _u_ueffTok) in (let dtb_u_u758 = (match dtb_u_u756 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u760) -> (Base_dDiag.C_Check_ErrC (dtb_u_u760))
  | Base_dDiag.C_Check_OkC (dtb_u_u761) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb_u_u748, dtb_u_u761))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u762) -> (Base_dDiag.C_Check_ErrC (dtb_u_u762))
  | Base_dDiag.C_Check_OkC (dtb_u_u763) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = dtb_u_u706; f_Workspace_workspaceRoot = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u748)); f_Workspace_workspaceMembers = dtb_u_u761 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u758))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 492 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspacePackages = (fun (dtb_u_u764 : string) (dtb_u_u765 : string) (dtb_u_u769 : string) -> (Obj.repr ((fun (dtb_u_u774 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u777 = ((((v_loadWorkspace_u_udirect dtb_u_u764) dtb_u_u765) dtb_u_u769) dtb_u_u774) in (let dtb_u_u779 = (match dtb_u_u777 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u781) -> (Base_dDiag.C_Check_ErrC (dtb_u_u781))
  | Base_dDiag.C_Check_OkC (dtb_u_u782) -> (Base_dDiag.C_Check_OkC ((v_workspaceAllPackages dtb_u_u782)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u779))))))

# 492 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspacePackages_u_udirect = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) _u_ueffTok -> (let dtb_u_u777 = ((((v_loadWorkspace_u_udirect nFs) nEnv) rootBaseDir) _u_ueffTok) in (let dtb_u_u779 = (match dtb_u_u777 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u781) -> (Base_dDiag.C_Check_ErrC (dtb_u_u781))
  | Base_dDiag.C_Check_OkC (dtb_u_u782) -> (Base_dDiag.C_Check_OkC ((v_workspaceAllPackages dtb_u_u782)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u779)))

# 515 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyRootOf = (fun (package : t_Package) -> { f_Root_rootDir = ((v_packageDir package) ^ "/lib"); f_Root_rootName = (v_packageName package); f_Root_rootExports = (v_packageExports package); f_Root_rootLayerRules = (v_packageLayers package); f_Root_rootImplicitPrelude = (v_packageImplicitPrelude package) })

# 505 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceContext = (fun (workspace : t_Workspace) -> { f_PackageContext_contextDir = (workspace).f_Workspace_workspaceDir; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = ((B_dData_dList.v_map v_dependencyRootOf) (v_workspaceMembersOf workspace)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false })

# 528 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_dependencyRoots = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (if ((B_dData_dList.v_memName (v_packageName dtb__203)) mc0) then ((v_dependencyRoots mc0) dtb__204) else (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ ((v_packageName dtb__203), mc0))) (v_packageDependencies dtb__203)) with
  | { B_dData_dPair.f_Pair_first = dtb__205; B_dData_dPair.f_Pair_second = dtb__206 } -> (match ((v_dependencyRoots dtb__205) dtb__204) with
  | { B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = dtb__208 } -> { B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__206) (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb__203), dtb__208))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 541 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageRoots = (fun (package : t_Package) -> (let selfName = (v_packageName package) in (let selfRoot = { f_Root_rootDir = ((v_packageDir package) ^ "/lib"); f_Root_rootName = selfName; f_Root_rootExports = B_dData_dMaybe.C_Maybe_Nothing; f_Root_rootLayerRules = (v_packageLayers package); f_Root_rootImplicitPrelude = (v_packageImplicitPrelude package) } in (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ (selfName, B_dData_dList.C_List_Nil))) (package).f_Package_packageDependencies) with
  | { B_dData_dPair.f_Pair_first = dtb__209; B_dData_dPair.f_Pair_second = dtb__210 } -> (B_dData_dList.C_List__x58__x58_ (selfRoot, dtb__210))
  | _ -> failwith "DT: impossible branch"
))))

# 556 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageEntry = (fun (package : t_Package) -> ((v_packageDir package) ^ "/app/Main.vuna"))

# 560 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageContext = (fun (package : t_Package) -> { f_PackageContext_contextDir = (v_packageDir package); f_PackageContext_contextPackage = (B_dData_dMaybe.C_Maybe_Just (package)); f_PackageContext_contextRoots = (v_packageRoots package); f_PackageContext_contextPackageName = (v_packageName package); f_PackageContext_contextRelease = false })

# 657 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseOnlyContext = (fun (dtb_u_u800 : string) (dtb_u_u801 : string) (dtb_u_u805 : string) -> (Obj.repr ((fun (dtb_u_u810 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u813 = ((((v_loadPackage_u_udirect dtb_u_u800) dtb_u_u801) dtb_u_u805) dtb_u_u810) in (let dtb_u_u815 = (match dtb_u_u813 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u817) -> (Base_dDiag.C_Check_ErrC (dtb_u_u817))
  | Base_dDiag.C_Check_OkC (dtb_u_u818) -> (Base_dDiag.C_Check_OkC ({ f_PackageContext_contextDir = ""; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb_u_u818), B_dData_dList.C_List_Nil)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u815))))))

# 657 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseOnlyContext_u_udirect = (fun (nFs : string) (nEnv : string) (base : string) _u_ueffTok -> (let dtb_u_u813 = ((((v_loadPackage_u_udirect nFs) nEnv) base) _u_ueffTok) in (let dtb_u_u815 = (match dtb_u_u813 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u817) -> (Base_dDiag.C_Check_ErrC (dtb_u_u817))
  | Base_dDiag.C_Check_OkC (dtb_u_u818) -> (Base_dDiag.C_Check_OkC ({ f_PackageContext_contextDir = ""; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb_u_u818), B_dData_dList.C_List_Nil)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u815)))

# 670 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextAt = (fun (dtb_u_u819 : string) (dtb_u_u820 : string) (dtb_u_u824 : string) -> (Obj.repr ((fun (dtb_u_u829 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u832 = (((v_findManifestDirMaybe_u_udirect dtb_u_u819) dtb_u_u824) dtb_u_u829) in (match dtb_u_u832 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u833) -> (let dtb_u_u841 = (((v_loadManifestAt_u_udirect dtb_u_u819) (dtb_u_u833 ^ "/vuna.toml")) dtb_u_u829) in (match dtb_u_u841 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u842) -> (let dtb_u_u844 = (Base_dDiag.C_Check_ErrC (dtb_u_u842)) in dtb_u_u844)
  | Base_dDiag.C_Check_OkC (dtb_u_u846) -> (match (dtb_u_u846).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u854 = ((((v_loadWorkspace_u_udirect dtb_u_u819) dtb_u_u820) dtb_u_u833) dtb_u_u829) in (let dtb_u_u856 = (match dtb_u_u854 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u858) -> (Base_dDiag.C_Check_ErrC (dtb_u_u858))
  | Base_dDiag.C_Check_OkC (dtb_u_u859) -> (Base_dDiag.C_Check_OkC ((v_workspaceContext dtb_u_u859)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u856))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u860) -> (let dtb_u_u868 = ((((v_loadPackage_u_udirect dtb_u_u819) dtb_u_u820) dtb_u_u833) dtb_u_u829) in (let dtb_u_u870 = (match dtb_u_u868 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u872) -> (Base_dDiag.C_Check_ErrC (dtb_u_u872))
  | Base_dDiag.C_Check_OkC (dtb_u_u873) -> (Base_dDiag.C_Check_OkC ((v_packageContext dtb_u_u873)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u870))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u881 = ((((v_locateBase_u_udirect dtb_u_u819) dtb_u_u820) B_dData_dUnit.C_Unit_MkUnit) dtb_u_u829) in (match dtb_u_u881 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u882) -> (let dtb_u_u884 = (Base_dDiag.C_Check_ErrC (dtb_u_u882)) in dtb_u_u884)
  | Base_dDiag.C_Check_OkC (dtb_u_u886) -> ((Obj.magic (((v_baseOnlyContext dtb_u_u819) dtb_u_u820) dtb_u_u886)) dtb_u_u829)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 670 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextAt_u_udirect = (fun (nFs : string) (nEnv : string) (start : string) _u_ueffTok -> (let dtb_u_u832 = (((v_findManifestDirMaybe_u_udirect nFs) start) _u_ueffTok) in (match dtb_u_u832 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u833) -> (let dtb_u_u841 = (((v_loadManifestAt_u_udirect nFs) (dtb_u_u833 ^ "/vuna.toml")) _u_ueffTok) in (match dtb_u_u841 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u842) -> (let dtb_u_u844 = (Base_dDiag.C_Check_ErrC (dtb_u_u842)) in dtb_u_u844)
  | Base_dDiag.C_Check_OkC (dtb_u_u846) -> (match (dtb_u_u846).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u854 = ((((v_loadWorkspace_u_udirect nFs) nEnv) dtb_u_u833) _u_ueffTok) in (let dtb_u_u856 = (match dtb_u_u854 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u858) -> (Base_dDiag.C_Check_ErrC (dtb_u_u858))
  | Base_dDiag.C_Check_OkC (dtb_u_u859) -> (Base_dDiag.C_Check_OkC ((v_workspaceContext dtb_u_u859)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u856))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u860) -> (let dtb_u_u868 = ((((v_loadPackage_u_udirect nFs) nEnv) dtb_u_u833) _u_ueffTok) in (let dtb_u_u870 = (match dtb_u_u868 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u872) -> (Base_dDiag.C_Check_ErrC (dtb_u_u872))
  | Base_dDiag.C_Check_OkC (dtb_u_u873) -> (Base_dDiag.C_Check_OkC ((v_packageContext dtb_u_u873)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u870))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u881 = ((((v_locateBase_u_udirect nFs) nEnv) B_dData_dUnit.C_Unit_MkUnit) _u_ueffTok) in (match dtb_u_u881 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u882) -> (let dtb_u_u884 = (Base_dDiag.C_Check_ErrC (dtb_u_u882)) in dtb_u_u884)
  | Base_dDiag.C_Check_OkC (dtb_u_u886) -> ((Obj.magic (((v_baseOnlyContext nFs) nEnv) dtb_u_u886)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 706 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForFile = (fun (dtb_u_u887 : string) (dtb_u_u888 : string) (dtb_u_u892 : string) -> (Obj.repr ((fun (dtb_u_u897 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u900 = (((v_absolutePath_u_udirect dtb_u_u888) dtb_u_u892) dtb_u_u897) in ((Obj.magic (((v_contextAt dtb_u_u887) dtb_u_u888) (Frontend_dManifest.v_manifestDir dtb_u_u900))) dtb_u_u897))))))

# 706 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForFile_u_udirect = (fun (nFs : string) (nEnv : string) (path : string) _u_ueffTok -> (let dtb_u_u900 = (((v_absolutePath_u_udirect nEnv) path) _u_ueffTok) in ((Obj.magic (((v_contextAt nFs) nEnv) (Frontend_dManifest.v_manifestDir dtb_u_u900))) _u_ueffTok)))

# 715 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForDir = (fun (dtb_u_u901 : string) (dtb_u_u902 : string) (dtb_u_u906 : string) -> (Obj.repr ((fun (dtb_u_u911 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u914 = (((v_absolutePath_u_udirect dtb_u_u902) dtb_u_u906) dtb_u_u911) in ((Obj.magic (((v_contextAt dtb_u_u901) dtb_u_u902) dtb_u_u914)) dtb_u_u911))))))

# 715 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForDir_u_udirect = (fun (nFs : string) (nEnv : string) (dir : string) _u_ueffTok -> (let dtb_u_u914 = (((v_absolutePath_u_udirect nEnv) dir) _u_ueffTok) in ((Obj.magic (((v_contextAt nFs) nEnv) dtb_u_u914)) _u_ueffTok)))

# 60 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextDir = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__239; f_PackageContext_contextPackage = dtb__240; f_PackageContext_contextRoots = dtb__241; f_PackageContext_contextPackageName = dtb__242; f_PackageContext_contextRelease = dtb__243 } -> dtb__239
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackage = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__244; f_PackageContext_contextPackage = dtb__245; f_PackageContext_contextRoots = dtb__246; f_PackageContext_contextPackageName = dtb__247; f_PackageContext_contextRelease = dtb__248 } -> dtb__245
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRoots = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__249; f_PackageContext_contextPackage = dtb__250; f_PackageContext_contextRoots = dtb__251; f_PackageContext_contextPackageName = dtb__252; f_PackageContext_contextRelease = dtb__253 } -> dtb__251
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackageName = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__254; f_PackageContext_contextPackage = dtb__255; f_PackageContext_contextRoots = dtb__256; f_PackageContext_contextPackageName = dtb__257; f_PackageContext_contextRelease = dtb__258 } -> dtb__257
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRelease = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__259; f_PackageContext_contextPackage = dtb__260; f_PackageContext_contextRoots = dtb__261; f_PackageContext_contextPackageName = dtb__262; f_PackageContext_contextRelease = dtb__263 } -> dtb__263
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceDir = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__264; f_Workspace_workspaceRoot = dtb__265; f_Workspace_workspaceMembers = dtb__266 } -> dtb__264
  | _ -> failwith "DT: impossible branch"
))

# 435 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceRoot = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__267; f_Workspace_workspaceRoot = dtb__268; f_Workspace_workspaceMembers = dtb__269 } -> dtb__268
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceMembers = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__270; f_Workspace_workspaceRoot = dtb__271; f_Workspace_workspaceMembers = dtb__272 } -> dtb__272
  | _ -> failwith "DT: impossible branch"
))
