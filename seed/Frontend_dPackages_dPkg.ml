open Vuna_runtime
type t_Root = { f_Root_rootDir : string; f_Root_rootName : string; f_Root_rootExports : string B_dData_dList.t_List B_dData_dMaybe.t_Maybe; f_Root_rootLayerRules : Frontend_dManifest.t_Layer B_dData_dList.t_List; f_Root_rootImplicitPrelude : bool }
and t_Package = { f_Package_packageManifest : Frontend_dManifest.t_Manifest; f_Package_packageDependencies : t_Package B_dData_dList.t_List; f_Package_packageDir : string }
and t_PackageContext = { f_PackageContext_contextDir : string; f_PackageContext_contextPackage : t_Package B_dData_dMaybe.t_Maybe; f_PackageContext_contextRoots : t_Root B_dData_dList.t_List; f_PackageContext_contextPackageName : string; f_PackageContext_contextRelease : bool }
and t_Workspace = { f_Workspace_workspaceDir : string; f_Workspace_workspaceRoot : t_Package B_dData_dMaybe.t_Maybe; f_Workspace_workspaceMembers : t_Package B_dData_dList.t_List }

# 67 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootLayers = (fun (dtb_u_u1 : t_Root) -> (match dtb_u_u1 with
  | { f_Root_rootDir = dtb_u_u2; f_Root_rootName = dtb_u_u3; f_Root_rootExports = dtb_u_u4; f_Root_rootLayerRules = dtb_u_u5; f_Root_rootImplicitPrelude = dtb_u_u6 } -> dtb_u_u5
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackageOf = (fun (dtb_u_u7 : t_PackageContext) -> (dtb_u_u7).f_PackageContext_contextPackage)

# 79 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextWithRelease = (fun (dtb_u_u8 : bool) (dtb_u_u9 : t_PackageContext) -> { dtb_u_u9 with f_PackageContext_contextRelease = dtb_u_u8 })

# 82 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageName = (fun (dtb_u_u10 : t_Package) -> (match ((dtb_u_u10).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u11) -> dtb_u_u11
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageExports = (fun (dtb_u_u12 : t_Package) -> ((dtb_u_u12).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestExports)

# 91 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageLayers = (fun (dtb_u_u13 : t_Package) -> ((dtb_u_u13).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestLayers)

# 94 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageImplicitPrelude = (fun (dtb_u_u14 : t_Package) -> ((dtb_u_u14).f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestImplicitPrelude)

# 100 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_absolutePath = (fun (dtb_u_u15 : string) (dtb_u_u18 : string) -> (if ((B_dData_dString.v_startsWith "/") dtb_u_u18) then (let dtb_u_u20 = (Base_dSource.v_normalizePath dtb_u_u18) in (Obj.repr ((fun (dtb_u_u21 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u20)))) else (Obj.repr ((fun (dtb_u_u26 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u27 = Obj.obj ((B_dEffect_dEnv.v_envGetCwd dtb_u_u15)) in (let dtb_u_u29 = (dtb_u_u27 dtb_u_u26) in (let dtb_u_u31 = (Base_dSource.v_normalizePath (String.concat "" [dtb_u_u29; "/"; dtb_u_u18])) in dtb_u_u31))))))))

# 109 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_joinPathsText = (fun (dtb_u_u33 : string B_dData_dList.t_List) -> (match dtb_u_u33 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u35) -> (match dtb_u_u35 with
  | B_dData_dList.C_List_Nil -> dtb_u_u34
  | _ -> (String.concat "" [dtb_u_u34; ", "; (v_joinPathsText dtb_u_u35)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 116 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadManifestAt = (fun (dtb_u_u36 : string) (dtb_u_u39 : string) -> (Obj.repr ((fun (dtb_u_u44 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u45 = Obj.obj (((B_dEffect_dFs.v_fsFileExists dtb_u_u36) dtb_u_u39)) in (let dtb_u_u47 = (dtb_u_u45 dtb_u_u44) in (if dtb_u_u47 then (let dtb_u_u53 = Obj.obj (((B_dEffect_dFs.v_fsReadFile dtb_u_u36) dtb_u_u39)) in (let dtb_u_u55 = (dtb_u_u53 dtb_u_u44) in (let dtb_u_u57 = (match ((Frontend_dManifest.v_parseManifest dtb_u_u39) dtb_u_u55) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u59) -> (Base_dDiag.C_Check_ErrC (dtb_u_u59))
  | Base_dDiag.C_Check_OkC (dtb_u_u60) -> (match (Frontend_dManifest.v_validateManifest dtb_u_u60) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u61) -> (Base_dDiag.C_Check_ErrC (dtb_u_u61))
  | Base_dDiag.C_Check_OkC (dtb_u_u62) -> (Base_dDiag.C_Check_OkC (dtb_u_u62))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u57))) else (let dtb_u_u64 = (((Base_dDiagnostics_dPkg.v_pkgPath1 dtb_u_u39) (Base_dDiagnostics_dPkg.C_PkgErr_MissingManifest ((Base_dSource.v_normalizePath (Frontend_dManifest.v_manifestDir dtb_u_u39))))) (Base_dSource.v_normalizePath (Frontend_dManifest.v_manifestDir dtb_u_u39))) in dtb_u_u64))))))))

# 134 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_manifestNameString = (fun (dtb_u_u66 : Frontend_dManifest.t_Manifest) -> (match (dtb_u_u66).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u67) -> dtb_u_u67
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_memStackDir = (fun dtb_u_u70 dtb_u_u71 dtb_u_u72 -> (match dtb_u_u72 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u73, dtb_u_u74) -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u70) (B_dData_dPair.v_firstOf dtb_u_u73)) dtb_u_u71) then true else (((v_memStackDir dtb_u_u70) dtb_u_u71) dtb_u_u74))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_cyclePrefix = (fun dtb_u_u77 dtb_u_u78 dtb_u_u79 -> (match dtb_u_u79 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u77) (B_dData_dPair.v_firstOf dtb_u_u80)) dtb_u_u78) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u80, B_dData_dList.C_List_Nil)))) else (match (((v_cyclePrefix dtb_u_u77) dtb_u_u78) dtb_u_u81) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u82) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u82))))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 156 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_cycleMessage = (fun (dtb_u_u83 : string) (dtb_u_u84 : string B_dData_dMaybe.t_Maybe) (dtb_u_u85 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u84 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u86) -> (match (((v_cyclePrefix B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u83) dtb_u_u85) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ dtb_u_u83)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u87) -> ("pkg: dependency cycle: " ^ (Base_dSource.v_joinArrows ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (B_dData_dList.v_reverse dtb_u_u87))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u86, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ dtb_u_u83)
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyNameOk = (fun dtb_u_u89 dtb_u_u90 dtb_u_u91 -> (match dtb_u_u90 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u92) -> (((B_dTrait_dEq.v__x61__x61_ dtb_u_u89) dtb_u_u92) dtb_u_u91)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_mismatchMessage = (fun (dtb_u_u93 : string B_dData_dMaybe.t_Maybe) (dtb_u_u94 : string) -> (match dtb_u_u93 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u95) -> (String.concat "" ["pkg: dependency "; dtb_u_u95; " expects package name "; dtb_u_u95; " but found "; dtb_u_u94])
  | B_dData_dMaybe.C_Maybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyIdentityEff = (fun (dtb_u_u96 : string) (dtb_u_u99 : Frontend_dManifest.t_Dependency) (dtb_u_u100 : string) (dtb_u_u101 : Frontend_dManifest.t_Manifest) -> (match (Frontend_dManifest.v_depIdentityOf dtb_u_u99) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u103 = (Base_dDiag.C_Check_OkC (0)) in (Obj.repr ((fun (dtb_u_u104 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u103))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u105) -> (Obj.repr ((fun (dtb_u_u110 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u111 = Obj.obj ((((Frontend_dPackages_dSource.v_packageSourceEff dtb_u_u96) dtb_u_u100) dtb_u_u101)) in (let dtb_u_u113 = (dtb_u_u111 dtb_u_u110) in (match dtb_u_u113 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u114) -> (let dtb_u_u116 = (Base_dDiag.C_Check_ErrC (dtb_u_u114)) in dtb_u_u116)
  | Base_dDiag.C_Check_OkC (dtb_u_u118) -> (let dtb_u_u119 = (Frontend_dPackages_dSource.v_identityHashOf dtb_u_u118) in (if ((Frontend_dPackages_dSource.v_normalizeHash dtb_u_u105) = dtb_u_u119) then (let dtb_u_u121 = (Base_dDiag.C_Check_OkC (0)) in dtb_u_u121) else (let dtb_u_u123 = (String.concat "" ["declared "; dtb_u_u105; ", actual "; dtb_u_u119]) in (let dtb_u_u125 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMismatch ((Frontend_dManifest.v_depAliasOf dtb_u_u99), dtb_u_u123))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dtb_u_u99), (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u123, B_dData_dVec.C_Vec_Nil))))) in dtb_u_u125))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyPathHashEff = (fun (dtb_u_u127 : string) (dtb_u_u130 : Frontend_dManifest.t_Dependency) (dtb_u_u131 : string) -> (match (Frontend_dManifest.v_depHashOf dtb_u_u130) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u133 = (Base_dDiag.C_Check_OkC (0)) in (Obj.repr ((fun (dtb_u_u134 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u133))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u135) -> (Obj.repr ((fun (dtb_u_u140 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u141 = Obj.obj (((Frontend_dPackages_dSource.v_packageFilesEff dtb_u_u127) dtb_u_u131)) in (let dtb_u_u143 = (dtb_u_u141 dtb_u_u140) in (match dtb_u_u143 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u144) -> (let dtb_u_u146 = (Base_dDiag.C_Check_ErrC (dtb_u_u144)) in dtb_u_u146)
  | Base_dDiag.C_Check_OkC (dtb_u_u148) -> (let dtb_u_u149 = (Frontend_dPackages_dSource.v_contentHashOf { Frontend_dCanonical_dPkg.f_PackageSource_psName = ""; Frontend_dCanonical_dPkg.f_PackageSource_psExports = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psDeps = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb_u_u148 }) in (if ((Frontend_dPackages_dSource.v_verifyHash dtb_u_u135) dtb_u_u149) then (let dtb_u_u151 = (Base_dDiag.C_Check_OkC (0)) in dtb_u_u151) else (let dtb_u_u153 = (String.concat "" ["declared "; dtb_u_u135; ", actual "; dtb_u_u149]) in (let dtb_u_u155 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_HashMismatch ((Frontend_dManifest.v_depAliasOf dtb_u_u130), dtb_u_u153))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dtb_u_u130), (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u153, B_dData_dVec.C_Vec_Nil))))) in dtb_u_u155))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_emptyPackageMemo = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)

# 301 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoLookup = (fun (dtb_u_u159 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u160 : string) -> (Obj.repr ((fun (dtb_u_u165 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u166 = Obj.obj ((B_dContainer_dMutRef.v_read dtb_u_u159)) in (let dtb_u_u168 = (dtb_u_u166 dtb_u_u165) in (let dtb_u_u170 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u160) dtb_u_u168) in dtb_u_u170)))))))

# 307 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoInsert = (fun (dtb_u_u174 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u175 : string) (dtb_u_u176 : t_Package) -> (Obj.repr ((fun (dtb_u_u181 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u182 = Obj.obj ((B_dContainer_dMutRef.v_read dtb_u_u174)) in (let dtb_u_u184 = (dtb_u_u182 dtb_u_u181) in ((Obj.magic ((B_dContainer_dMutRef.v_write dtb_u_u174) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u175) dtb_u_u176) dtb_u_u184))) dtb_u_u181)))))))

# 175 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadStoreDependency = (fun (dtb_u_u185 : string) (dtb_u_u186 : string) (dtb_u_u191 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u192 : int) (dtb_u_u193 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u194 : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depHashOf dtb_u_u194) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u196 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dtb_u_u194)))) (Frontend_dManifest.v_depAliasOf dtb_u_u194)) in (Obj.repr ((fun (dtb_u_u197 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u196))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u198) -> (Obj.repr ((fun (dtb_u_u203 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u204 = Obj.obj ((Base_dStore.v_storeDataRootEff dtb_u_u186)) in (let dtb_u_u206 = (dtb_u_u204 dtb_u_u203) in (let dtb_u_u207 = (Frontend_dPackages_dSource.v_normalizeHash dtb_u_u198) in (let dtb_u_u208 = (String.concat "" [dtb_u_u206; "/pkgs/"; dtb_u_u207]) in (let dtb_u_u214 = Obj.obj (((B_dEffect_dFs.v_fsFileExists dtb_u_u185) (dtb_u_u208 ^ "/.complete"))) in (let dtb_u_u216 = (dtb_u_u214 dtb_u_u203) in (if dtb_u_u216 then (let dtb_u_u222 = Obj.obj (((B_dEffect_dFs.v_fsReadFile dtb_u_u185) (dtb_u_u208 ^ "/.complete"))) in (let dtb_u_u224 = (dtb_u_u222 dtb_u_u203) in (if (dtb_u_u224 = dtb_u_u207) then (let dtb_u_u230 = Obj.obj ((((((((v_loadPackageWalk dtb_u_u185) dtb_u_u186) dtb_u_u191) dtb_u_u192) dtb_u_u193) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dtb_u_u194)))) dtb_u_u208)) in (let dtb_u_u232 = (dtb_u_u230 dtb_u_u203) in (match dtb_u_u232 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u233) -> (let dtb_u_u235 = (Base_dDiag.C_Check_ErrC (dtb_u_u233)) in dtb_u_u235)
  | Base_dDiag.C_Check_OkC (dtb_u_u237) -> (let dtb_u_u243 = Obj.obj (((((v_verifyIdentityEff dtb_u_u185) dtb_u_u194) dtb_u_u208) (dtb_u_u237).f_Package_packageManifest)) in (let dtb_u_u245 = (dtb_u_u243 dtb_u_u203) in (match dtb_u_u245 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u246) -> (let dtb_u_u248 = (Base_dDiag.C_Check_ErrC (dtb_u_u246)) in dtb_u_u248)
  | Base_dDiag.C_Check_OkC (dtb_u_u250) -> (let dtb_u_u252 = (Base_dDiag.C_Check_OkC (dtb_u_u237)) in dtb_u_u252)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (let dtb_u_u255 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dtb_u_u194)))) (Frontend_dManifest.v_depAliasOf dtb_u_u194)) in dtb_u_u255)))) else (let dtb_u_u258 = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dtb_u_u194)))) (Frontend_dManifest.v_depAliasOf dtb_u_u194)) in dtb_u_u258)))))))))))
  | _ -> failwith "DT: impossible branch"
))
# 248 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadDependencyList = (fun (dtb_u_u260 : string) (dtb_u_u261 : string) (dtb_u_u266 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u267 : int) (dtb_u_u268 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u269 : string) (dtb_u_u270 : Frontend_dManifest.t_Dependency B_dData_dList.t_List) -> (if (dtb_u_u267 <= 0) then (let dtb_u_u272 = (Base_dDiag.v_icFuel "pkg") in (Obj.repr ((fun (dtb_u_u273 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u272)))) else (match dtb_u_u270 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u275 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u276 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u275))))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u277, dtb_u_u278) -> (Obj.repr ((fun (dtb_u_u283 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u284 = Obj.obj ((((((((v_loadOneDependency dtb_u_u260) dtb_u_u261) dtb_u_u266) (dtb_u_u267 - 1)) dtb_u_u268) dtb_u_u269) dtb_u_u277)) in (let dtb_u_u286 = (dtb_u_u284 dtb_u_u283) in (match dtb_u_u286 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u287) -> (let dtb_u_u289 = (Base_dDiag.C_Check_ErrC (dtb_u_u287)) in dtb_u_u289)
  | Base_dDiag.C_Check_OkC (dtb_u_u291) -> (let dtb_u_u297 = Obj.obj ((((((((v_loadDependencyList dtb_u_u260) dtb_u_u261) dtb_u_u266) (dtb_u_u267 - 1)) dtb_u_u268) dtb_u_u269) dtb_u_u278)) in (let dtb_u_u299 = (dtb_u_u297 dtb_u_u283) in (let dtb_u_u301 = (match dtb_u_u299 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u303) -> (Base_dDiag.C_Check_ErrC (dtb_u_u303))
  | Base_dDiag.C_Check_OkC (dtb_u_u304) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u291, dtb_u_u304))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u301)))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)))
# 270 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadOneDependency = (fun (dtb_u_u305 : string) (dtb_u_u306 : string) (dtb_u_u311 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u312 : int) (dtb_u_u313 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u314 : string) (dtb_u_u315 : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depSourceOf dtb_u_u315) with
  | Frontend_dManifest.C_DependencySource_DepPath (dtb_u_u316) -> (let dtb_u_u317 = ((Base_dSource.v_joinPath dtb_u_u314) dtb_u_u316) in (Obj.repr ((fun (dtb_u_u322 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u323 = Obj.obj ((((((((v_loadPackageWalk dtb_u_u305) dtb_u_u306) dtb_u_u311) dtb_u_u312) dtb_u_u313) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dtb_u_u315)))) dtb_u_u317)) in (let dtb_u_u325 = (dtb_u_u323 dtb_u_u322) in (match dtb_u_u325 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u326) -> (let dtb_u_u328 = (Base_dDiag.C_Check_ErrC (dtb_u_u326)) in dtb_u_u328)
  | Base_dDiag.C_Check_OkC (dtb_u_u330) -> (let dtb_u_u336 = Obj.obj ((((v_verifyPathHashEff dtb_u_u305) dtb_u_u315) dtb_u_u317)) in (let dtb_u_u338 = (dtb_u_u336 dtb_u_u322) in (match dtb_u_u338 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u339) -> (let dtb_u_u341 = (Base_dDiag.C_Check_ErrC (dtb_u_u339)) in dtb_u_u341)
  | Base_dDiag.C_Check_OkC (dtb_u_u343) -> (let dtb_u_u349 = Obj.obj (((((v_verifyIdentityEff dtb_u_u305) dtb_u_u315) dtb_u_u317) (dtb_u_u330).f_Package_packageManifest)) in (let dtb_u_u351 = (dtb_u_u349 dtb_u_u322) in (match dtb_u_u351 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u352) -> (let dtb_u_u354 = (Base_dDiag.C_Check_ErrC (dtb_u_u352)) in dtb_u_u354)
  | Base_dDiag.C_Check_OkC (dtb_u_u356) -> (let dtb_u_u358 = (Base_dDiag.C_Check_OkC (dtb_u_u330)) in dtb_u_u358)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | Frontend_dManifest.C_DependencySource_DepGit (dtb_u_u360, dtb_u_u361) -> ((((((v_loadStoreDependency dtb_u_u305) dtb_u_u306) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u315)
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb_u_u362) -> ((((((v_loadStoreDependency dtb_u_u305) dtb_u_u306) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u315)
  | _ -> failwith "DT: impossible branch"
))
# 313 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadPackageWalk = (fun (dtb_u_u363 : string) (dtb_u_u364 : string) (dtb_u_u369 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dtb_u_u370 : int) (dtb_u_u371 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u372 : string B_dData_dMaybe.t_Maybe) (dtb_u_u373 : string) -> (if (dtb_u_u370 <= 0) then (let dtb_u_u375 = (Base_dDiag.v_icFuel "pkg") in (Obj.repr ((fun (dtb_u_u376 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u375)))) else (let dtb_u_u377 = (Base_dSource.v_normalizePath dtb_u_u373) in (if (((v_memStackDir B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u377) dtb_u_u371) then (let dtb_u_u379 = (Base_dDiagnostics_dPkg.v_pkgInvalid (((v_cycleMessage dtb_u_u377) dtb_u_u372) dtb_u_u371)) in (Obj.repr ((fun (dtb_u_u380 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u379)))) else (Obj.repr ((fun (dtb_u_u385 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u386 = Obj.obj (((v_memoLookup dtb_u_u369) dtb_u_u377)) in (let dtb_u_u388 = (dtb_u_u386 dtb_u_u385) in (match dtb_u_u388 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u389) -> (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u372) (v_packageName dtb_u_u389)) then (let dtb_u_u391 = (Base_dDiag.C_Check_OkC (dtb_u_u389)) in dtb_u_u391) else (let dtb_u_u394 = (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage dtb_u_u372) (v_packageName dtb_u_u389))) in dtb_u_u394))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u401 = Obj.obj (((v_loadManifestAt dtb_u_u363) (dtb_u_u377 ^ "/vuna.toml"))) in (let dtb_u_u403 = (dtb_u_u401 dtb_u_u385) in (match dtb_u_u403 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u404) -> (let dtb_u_u406 = (Base_dDiag.C_Check_ErrC (dtb_u_u404)) in dtb_u_u406)
  | Base_dDiag.C_Check_OkC (dtb_u_u408) -> (match (dtb_u_u408).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u410 = ((Base_dDiagnostics_dPkg.v_pkgPath0 (dtb_u_u408).Frontend_dManifest.f_Manifest_manifestPath) Base_dDiagnostics_dPkg.C_PkgErr_NotPackage) in dtb_u_u410)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u412) -> (let dtb_u_u413 = (v_manifestNameString dtb_u_u408) in (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u372) dtb_u_u413) then (let dtb_u_u419 = Obj.obj ((((((((v_loadDependencyList dtb_u_u363) dtb_u_u364) dtb_u_u369) (dtb_u_u370 - 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u377; B_dData_dPair.f_Pair_second = dtb_u_u413 }, dtb_u_u371))) dtb_u_u377) (dtb_u_u408).Frontend_dManifest.f_Manifest_manifestDependencies)) in (let dtb_u_u421 = (dtb_u_u419 dtb_u_u385) in (match dtb_u_u421 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u422) -> (let dtb_u_u424 = (Base_dDiag.C_Check_ErrC (dtb_u_u422)) in dtb_u_u424)
  | Base_dDiag.C_Check_OkC (dtb_u_u426) -> (let dtb_u_u427 = { f_Package_packageManifest = dtb_u_u408; f_Package_packageDependencies = dtb_u_u426; f_Package_packageDir = dtb_u_u377 } in (let dtb_u_u433 = Obj.obj ((((v_memoInsert dtb_u_u369) dtb_u_u377) dtb_u_u427)) in (let dtb_u_u435 = (dtb_u_u433 dtb_u_u385) in (let dtb_u_u437 = (Base_dDiag.C_Check_OkC (dtb_u_u427)) in dtb_u_u437))))
  | _ -> failwith "DT: impossible branch"
))) else (let dtb_u_u440 = (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage dtb_u_u372) dtb_u_u413)) in dtb_u_u440)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 366 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_lookupPackageDir = (fun (dtb_u_u442 : string) (dtb_u_u443 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u443 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u444, dtb_u_u445) -> (match dtb_u_u444 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u446; B_dData_dPair.f_Pair_second = dtb_u_u447 } -> (if (dtb_u_u446 = dtb_u_u442) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u447)) else ((v_lookupPackageDir dtb_u_u442) dtb_u_u445))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_checkUniqueNamesGo = (fun (dtb_u_u448 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u449 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u449 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u450, dtb_u_u451) -> (match dtb_u_u450 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u452; B_dData_dPair.f_Pair_second = dtb_u_u453 } -> (match ((v_lookupPackageDir dtb_u_u452) dtb_u_u448) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkUniqueNamesGo (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u452; B_dData_dPair.f_Pair_second = dtb_u_u453 }, dtb_u_u448))) dtb_u_u451)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u454) -> (if (dtb_u_u454 = dtb_u_u453) then ((v_checkUniqueNamesGo dtb_u_u448) dtb_u_u451) else ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_DuplicatePackageName (dtb_u_u452, dtb_u_u454, dtb_u_u453))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u452, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u454, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u453, B_dData_dVec.C_Vec_Nil))))))))
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
let v_workspaceRootOf = (fun (dtb_u_u455 : t_Workspace) -> (dtb_u_u455).f_Workspace_workspaceRoot)

# 442 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceMembersOf = (fun (dtb_u_u456 : t_Workspace) -> (dtb_u_u456).f_Workspace_workspaceMembers)

# 446 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceAllPackages = (fun (dtb_u_u457 : t_Workspace) -> (match (dtb_u_u457).f_Workspace_workspaceRoot with
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb_u_u457).f_Workspace_workspaceMembers
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u458) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u458, (dtb_u_u457).f_Workspace_workspaceMembers))
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_findManifestUpMaybe = (fun (dtb_u_u459 : string) (dtb_u_u462 : int) (dtb_u_u463 : string) -> (if (dtb_u_u462 <= 0) then (let dtb_u_u465 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u466 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u465)))) else (Obj.repr ((fun (dtb_u_u471 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u472 = Obj.obj (((B_dEffect_dFs.v_fsFileExists dtb_u_u459) (dtb_u_u463 ^ "/vuna.toml"))) in (let dtb_u_u474 = (dtb_u_u472 dtb_u_u471) in (if dtb_u_u474 then (let dtb_u_u476 = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u463)) in dtb_u_u476) else ((Obj.magic ((((v_findManifestUpMaybeStep dtb_u_u459) (dtb_u_u462 - 1)) dtb_u_u463) (Frontend_dManifest.v_manifestDir dtb_u_u463))) dtb_u_u471)))))))))
# 579 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_findManifestUpMaybeStep = (fun (dtb_u_u478 : string) (dtb_u_u481 : int) (dtb_u_u482 : string) (dtb_u_u483 : string) -> (if (dtb_u_u481 <= 0) then (let dtb_u_u485 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u486 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u485)))) else (if (dtb_u_u483 = dtb_u_u482) then (let dtb_u_u488 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u489 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u488)))) else (((v_findManifestUpMaybe dtb_u_u478) (dtb_u_u481 - 1)) dtb_u_u483))))

# 590 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDirMaybe = (fun (dtb_u_u490 : string) (dtb_u_u493 : string) -> (let dtb_u_u494 = (Base_dSource.v_normalizePath dtb_u_u493) in (((v_findManifestUpMaybe dtb_u_u490) ((2 * (String.length dtb_u_u494)) + 4)) dtb_u_u494)))

# 598 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDir = (fun (dtb_u_u495 : string) (dtb_u_u498 : string) -> (Obj.repr ((fun (dtb_u_u503 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u504 = Obj.obj (((v_findManifestDirMaybe dtb_u_u495) dtb_u_u498)) in (let dtb_u_u506 = (dtb_u_u504 dtb_u_u503) in (let dtb_u_u508 = (match dtb_u_u506 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u510) -> (Base_dDiag.C_Check_OkC (dtb_u_u510))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_NoManifestUpward ((Base_dSource.v_normalizePath dtb_u_u498)))) (B_dData_dVec.C_Vec__x58__x58_ ((Base_dSource.v_normalizePath dtb_u_u498), B_dData_dVec.C_Vec_Nil)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u508)))))))

# 612 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_hasManifest = (fun (dtb_u_u511 : string) (dtb_u_u514 : string) -> ((B_dEffect_dFs.v_fsFileExists dtb_u_u511) (dtb_u_u514 ^ "/vuna.toml")))

# 615 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseCandidates = (fun (dtb_u_u515 : string) -> (B_dData_dList.C_List__x58__x58_ (((Base_dSource.v_joinPath dtb_u_u515) "base"), (B_dData_dList.C_List__x58__x58_ (((Base_dSource.v_joinPath dtb_u_u515) "../base"), (B_dData_dList.C_List__x58__x58_ (((Base_dSource.v_joinPath dtb_u_u515) "../../base"), (B_dData_dList.C_List__x58__x58_ (((Base_dSource.v_joinPath dtb_u_u515) "../../../base"), B_dData_dList.C_List_Nil)))))))))

# 624 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseNotFound = (fun (dtb_u_u517 : string B_dData_dList.t_List) -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_MissingBase ((v_joinPathsText dtb_u_u517)))) (v_joinPathsText dtb_u_u517)))

# 627 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_firstExistingBase = (fun (dtb_u_u518 : string) (dtb_u_u521 : string B_dData_dList.t_List) (dtb_u_u522 : string B_dData_dList.t_List) -> (match dtb_u_u522 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u523, dtb_u_u524) -> (Obj.repr ((fun (dtb_u_u529 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u530 = Obj.obj (((v_hasManifest dtb_u_u518) dtb_u_u523)) in (let dtb_u_u532 = (dtb_u_u530 dtb_u_u529) in (if dtb_u_u532 then (let dtb_u_u534 = (Base_dDiag.C_Check_OkC (dtb_u_u523)) in dtb_u_u534) else ((Obj.magic (((v_firstExistingBase dtb_u_u518) dtb_u_u521) dtb_u_u524)) dtb_u_u529)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u537 = (v_baseNotFound dtb_u_u521) in (Obj.repr ((fun (dtb_u_u538 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u537))))
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_locateBase = (fun (dtb_u_u539 : string) (dtb_u_u540 : string) (dtb_u_u544 : B_dData_dUnit.t_Unit) -> (Obj.repr ((fun (dtb_u_u549 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u550 = Obj.obj (((B_dEffect_dEnv.v_envGetEnv dtb_u_u540) "VUNA_BASE")) in (let dtb_u_u552 = (dtb_u_u550 dtb_u_u549) in (if (dtb_u_u552 = "") then (let dtb_u_u558 = Obj.obj ((B_dEffect_dEnv.v_envExecPath dtb_u_u540)) in (let dtb_u_u560 = (dtb_u_u558 dtb_u_u549) in (let dtb_u_u566 = Obj.obj (((v_absolutePath dtb_u_u540) dtb_u_u560)) in (let dtb_u_u568 = (dtb_u_u566 dtb_u_u549) in (let dtb_u_u569 = (v_baseCandidates (Frontend_dManifest.v_manifestDir dtb_u_u568)) in ((Obj.magic (((v_firstExistingBase dtb_u_u539) dtb_u_u569) dtb_u_u569)) dtb_u_u549)))))) else (let dtb_u_u575 = Obj.obj (((v_absolutePath dtb_u_u540) dtb_u_u552)) in (let dtb_u_u577 = (dtb_u_u575 dtb_u_u549) in (let dtb_u_u583 = Obj.obj (((v_hasManifest dtb_u_u539) dtb_u_u577)) in (let dtb_u_u585 = (dtb_u_u583 dtb_u_u549) in (if dtb_u_u585 then (let dtb_u_u587 = (Base_dDiag.C_Check_OkC (dtb_u_u577)) in dtb_u_u587) else (let dtb_u_u590 = (v_baseNotFound (B_dData_dList.C_List__x58__x58_ (dtb_u_u577, B_dData_dList.C_List_Nil))) in dtb_u_u590)))))))))))))

# 38 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootDir = (fun (dtb_u_u592 : t_Root) -> (match dtb_u_u592 with
  | { f_Root_rootDir = dtb_u_u593; f_Root_rootName = dtb_u_u594; f_Root_rootExports = dtb_u_u595; f_Root_rootLayerRules = dtb_u_u596; f_Root_rootImplicitPrelude = dtb_u_u597 } -> dtb_u_u593
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootName = (fun (dtb_u_u598 : t_Root) -> (match dtb_u_u598 with
  | { f_Root_rootDir = dtb_u_u599; f_Root_rootName = dtb_u_u600; f_Root_rootExports = dtb_u_u601; f_Root_rootLayerRules = dtb_u_u602; f_Root_rootImplicitPrelude = dtb_u_u603 } -> dtb_u_u600
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootPackage = (fun (dtb_u_u604 : t_Root) -> (v_rootName dtb_u_u604))

# 40 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootExports = (fun (dtb_u_u605 : t_Root) -> (match dtb_u_u605 with
  | { f_Root_rootDir = dtb_u_u606; f_Root_rootName = dtb_u_u607; f_Root_rootExports = dtb_u_u608; f_Root_rootLayerRules = dtb_u_u609; f_Root_rootImplicitPrelude = dtb_u_u610 } -> dtb_u_u608
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootLayerRules = (fun (dtb_u_u611 : t_Root) -> (match dtb_u_u611 with
  | { f_Root_rootDir = dtb_u_u612; f_Root_rootName = dtb_u_u613; f_Root_rootExports = dtb_u_u614; f_Root_rootLayerRules = dtb_u_u615; f_Root_rootImplicitPrelude = dtb_u_u616 } -> dtb_u_u615
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootImplicitPrelude = (fun (dtb_u_u617 : t_Root) -> (match dtb_u_u617 with
  | { f_Root_rootDir = dtb_u_u618; f_Root_rootName = dtb_u_u619; f_Root_rootExports = dtb_u_u620; f_Root_rootLayerRules = dtb_u_u621; f_Root_rootImplicitPrelude = dtb_u_u622 } -> dtb_u_u622
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageManifest = (fun (dtb_u_u623 : t_Package) -> (match dtb_u_u623 with
  | { f_Package_packageManifest = dtb_u_u624; f_Package_packageDependencies = dtb_u_u625; f_Package_packageDir = dtb_u_u626 } -> dtb_u_u624
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDependencies = (fun (dtb_u_u627 : t_Package) -> (match dtb_u_u627 with
  | { f_Package_packageManifest = dtb_u_u628; f_Package_packageDependencies = dtb_u_u629; f_Package_packageDir = dtb_u_u630 } -> dtb_u_u629
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDir = (fun (dtb_u_u631 : t_Package) -> (match dtb_u_u631 with
  | { f_Package_packageManifest = dtb_u_u632; f_Package_packageDependencies = dtb_u_u633; f_Package_packageDir = dtb_u_u634 } -> dtb_u_u634
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_collectPackageIds = (fun (dtb_u_u635 : t_Package) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_packageName dtb_u_u635); B_dData_dPair.f_Pair_second = (v_packageDir dtb_u_u635) }, (v_collectDependencyIds (v_packageDependencies dtb_u_u635)))))
# 361 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_collectDependencyIds = (fun (dtb_u_u636 : t_Package B_dData_dList.t_List) -> (match dtb_u_u636 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u637, dtb_u_u638) -> ((B_dData_dList.v_append (v_collectPackageIds dtb_u_u637)) (v_collectDependencyIds dtb_u_u638))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_checkUniquePackageNames = (fun (dtb_u_u639 : t_Package B_dData_dList.t_List) -> ((v_checkUniqueNamesGo B_dData_dList.C_List_Nil) (v_collectDependencyIds dtb_u_u639)))

# 397 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadPackage = (fun (dtb_u_u640 : string) (dtb_u_u641 : string) (dtb_u_u645 : string) -> ((B_dContainer_dMutRef.v_withMutRef v_emptyPackageMemo) (fun (dtb_u_u646 : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) -> (Obj.repr ((fun (dtb_u_u651 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u652 = Obj.obj ((((((((v_loadPackageWalk dtb_u_u640) dtb_u_u641) dtb_u_u646) v_pkgFuelBound) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u645)) in (let dtb_u_u654 = (dtb_u_u652 dtb_u_u651) in (let dtb_u_u656 = (match dtb_u_u654 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u658) -> (Base_dDiag.C_Check_ErrC (dtb_u_u658))
  | Base_dDiag.C_Check_OkC (dtb_u_u659) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb_u_u659, B_dData_dList.C_List_Nil))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u660) -> (Base_dDiag.C_Check_ErrC (dtb_u_u660))
  | Base_dDiag.C_Check_OkC (dtb_u_u661) -> (Base_dDiag.C_Check_OkC (dtb_u_u659))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u656)))))))))

# 414 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadMembers = (fun (dtb_u_u662 : string) (dtb_u_u663 : string) (dtb_u_u667 : string) (dtb_u_u668 : string B_dData_dList.t_List) -> (match dtb_u_u668 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u669, dtb_u_u670) -> (Obj.repr ((fun (dtb_u_u675 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u676 = Obj.obj ((((v_loadPackage dtb_u_u662) dtb_u_u663) ((Base_dSource.v_joinPath dtb_u_u667) dtb_u_u669))) in (let dtb_u_u678 = (dtb_u_u676 dtb_u_u675) in (match dtb_u_u678 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u679) -> (let dtb_u_u681 = (Base_dDiag.C_Check_ErrC (dtb_u_u679)) in dtb_u_u681)
  | Base_dDiag.C_Check_OkC (dtb_u_u683) -> (let dtb_u_u689 = Obj.obj (((((v_loadMembers dtb_u_u662) dtb_u_u663) dtb_u_u667) dtb_u_u670)) in (let dtb_u_u691 = (dtb_u_u689 dtb_u_u675) in (let dtb_u_u693 = (match dtb_u_u691 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u695) -> (Base_dDiag.C_Check_ErrC (dtb_u_u695))
  | Base_dDiag.C_Check_OkC (dtb_u_u696) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u683, dtb_u_u696))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u693)))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u698 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u699 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u698))))
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadWorkspace = (fun (dtb_u_u700 : string) (dtb_u_u701 : string) (dtb_u_u705 : string) -> (let dtb_u_u706 = (Base_dSource.v_normalizePath dtb_u_u705) in (Obj.repr ((fun (dtb_u_u711 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u712 = Obj.obj (((v_loadManifestAt dtb_u_u700) (dtb_u_u706 ^ "/vuna.toml"))) in (let dtb_u_u714 = (dtb_u_u712 dtb_u_u711) in (match dtb_u_u714 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u715) -> (let dtb_u_u717 = (Base_dDiag.C_Check_ErrC (dtb_u_u715)) in dtb_u_u717)
  | Base_dDiag.C_Check_OkC (dtb_u_u719) -> (match (dtb_u_u719).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u725 = Obj.obj (((((v_loadMembers dtb_u_u700) dtb_u_u701) dtb_u_u706) (dtb_u_u719).Frontend_dManifest.f_Manifest_manifestMembers)) in (let dtb_u_u727 = (dtb_u_u725 dtb_u_u711) in (let dtb_u_u729 = (match dtb_u_u727 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u731) -> (Base_dDiag.C_Check_ErrC (dtb_u_u731))
  | Base_dDiag.C_Check_OkC (dtb_u_u732) -> (match (v_checkUniquePackageNames dtb_u_u732) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u733) -> (Base_dDiag.C_Check_ErrC (dtb_u_u733))
  | Base_dDiag.C_Check_OkC (dtb_u_u734) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = dtb_u_u706; f_Workspace_workspaceRoot = B_dData_dMaybe.C_Maybe_Nothing; f_Workspace_workspaceMembers = dtb_u_u732 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u729)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u735) -> (let dtb_u_u741 = Obj.obj ((((v_loadPackage dtb_u_u700) dtb_u_u701) dtb_u_u706)) in (let dtb_u_u743 = (dtb_u_u741 dtb_u_u711) in (match dtb_u_u743 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u744) -> (let dtb_u_u746 = (Base_dDiag.C_Check_ErrC (dtb_u_u744)) in dtb_u_u746)
  | Base_dDiag.C_Check_OkC (dtb_u_u748) -> (let dtb_u_u754 = Obj.obj (((((v_loadMembers dtb_u_u700) dtb_u_u701) dtb_u_u706) (dtb_u_u719).Frontend_dManifest.f_Manifest_manifestMembers)) in (let dtb_u_u756 = (dtb_u_u754 dtb_u_u711) in (let dtb_u_u758 = (match dtb_u_u756 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u760) -> (Base_dDiag.C_Check_ErrC (dtb_u_u760))
  | Base_dDiag.C_Check_OkC (dtb_u_u761) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb_u_u748, dtb_u_u761))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u762) -> (Base_dDiag.C_Check_ErrC (dtb_u_u762))
  | Base_dDiag.C_Check_OkC (dtb_u_u763) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = dtb_u_u706; f_Workspace_workspaceRoot = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u748)); f_Workspace_workspaceMembers = dtb_u_u761 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u758)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 492 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspacePackages = (fun (dtb_u_u764 : string) (dtb_u_u765 : string) (dtb_u_u769 : string) -> (Obj.repr ((fun (dtb_u_u774 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u775 = Obj.obj ((((v_loadWorkspace dtb_u_u764) dtb_u_u765) dtb_u_u769)) in (let dtb_u_u777 = (dtb_u_u775 dtb_u_u774) in (let dtb_u_u779 = (match dtb_u_u777 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u781) -> (Base_dDiag.C_Check_ErrC (dtb_u_u781))
  | Base_dDiag.C_Check_OkC (dtb_u_u782) -> (Base_dDiag.C_Check_OkC ((v_workspaceAllPackages dtb_u_u782)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u779)))))))

# 515 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyRootOf = (fun (dtb_u_u783 : t_Package) -> { f_Root_rootDir = ((v_packageDir dtb_u_u783) ^ "/lib"); f_Root_rootName = (v_packageName dtb_u_u783); f_Root_rootExports = (v_packageExports dtb_u_u783); f_Root_rootLayerRules = (v_packageLayers dtb_u_u783); f_Root_rootImplicitPrelude = (v_packageImplicitPrelude dtb_u_u783) })

# 505 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceContext = (fun (dtb_u_u784 : t_Workspace) -> { f_PackageContext_contextDir = (dtb_u_u784).f_Workspace_workspaceDir; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = ((B_dData_dList.v_map v_dependencyRootOf) (v_workspaceMembersOf dtb_u_u784)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false })

# 528 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_dependencyRoots = (fun (dtb_u_u785 : string B_dData_dList.t_List) (dtb_u_u786 : t_Package B_dData_dList.t_List) -> (match dtb_u_u786 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u787, dtb_u_u788) -> (if ((B_dData_dList.v_memName (v_packageName dtb_u_u787)) dtb_u_u785) then ((v_dependencyRoots dtb_u_u785) dtb_u_u788) else (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ ((v_packageName dtb_u_u787), dtb_u_u785))) (v_packageDependencies dtb_u_u787)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u789; B_dData_dPair.f_Pair_second = dtb_u_u790 } -> (match ((v_dependencyRoots dtb_u_u789) dtb_u_u788) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u791; B_dData_dPair.f_Pair_second = dtb_u_u792 } -> { B_dData_dPair.f_Pair_first = dtb_u_u791; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u790) (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb_u_u787), dtb_u_u792))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u785; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 541 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageRoots = (fun (dtb_u_u793 : t_Package) -> (let dtb_u_u794 = (v_packageName dtb_u_u793) in (let dtb_u_u795 = { f_Root_rootDir = ((v_packageDir dtb_u_u793) ^ "/lib"); f_Root_rootName = dtb_u_u794; f_Root_rootExports = B_dData_dMaybe.C_Maybe_Nothing; f_Root_rootLayerRules = (v_packageLayers dtb_u_u793); f_Root_rootImplicitPrelude = (v_packageImplicitPrelude dtb_u_u793) } in (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ (dtb_u_u794, B_dData_dList.C_List_Nil))) (dtb_u_u793).f_Package_packageDependencies) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u796; B_dData_dPair.f_Pair_second = dtb_u_u797 } -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u795, dtb_u_u797))
  | _ -> failwith "DT: impossible branch"
))))

# 556 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageEntry = (fun (dtb_u_u798 : t_Package) -> ((v_packageDir dtb_u_u798) ^ "/app/Main.vuna"))

# 560 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageContext = (fun (dtb_u_u799 : t_Package) -> { f_PackageContext_contextDir = (v_packageDir dtb_u_u799); f_PackageContext_contextPackage = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u799)); f_PackageContext_contextRoots = (v_packageRoots dtb_u_u799); f_PackageContext_contextPackageName = (v_packageName dtb_u_u799); f_PackageContext_contextRelease = false })

# 657 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseOnlyContext = (fun (dtb_u_u800 : string) (dtb_u_u801 : string) (dtb_u_u805 : string) -> (Obj.repr ((fun (dtb_u_u810 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u811 = Obj.obj ((((v_loadPackage dtb_u_u800) dtb_u_u801) dtb_u_u805)) in (let dtb_u_u813 = (dtb_u_u811 dtb_u_u810) in (let dtb_u_u815 = (match dtb_u_u813 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u817) -> (Base_dDiag.C_Check_ErrC (dtb_u_u817))
  | Base_dDiag.C_Check_OkC (dtb_u_u818) -> (Base_dDiag.C_Check_OkC ({ f_PackageContext_contextDir = ""; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb_u_u818), B_dData_dList.C_List_Nil)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u815)))))))

# 670 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextAt = (fun (dtb_u_u819 : string) (dtb_u_u820 : string) (dtb_u_u824 : string) -> (Obj.repr ((fun (dtb_u_u829 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u830 = Obj.obj (((v_findManifestDirMaybe dtb_u_u819) dtb_u_u824)) in (let dtb_u_u832 = (dtb_u_u830 dtb_u_u829) in (match dtb_u_u832 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u833) -> (let dtb_u_u839 = Obj.obj (((v_loadManifestAt dtb_u_u819) (dtb_u_u833 ^ "/vuna.toml"))) in (let dtb_u_u841 = (dtb_u_u839 dtb_u_u829) in (match dtb_u_u841 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u842) -> (let dtb_u_u844 = (Base_dDiag.C_Check_ErrC (dtb_u_u842)) in dtb_u_u844)
  | Base_dDiag.C_Check_OkC (dtb_u_u846) -> (match (dtb_u_u846).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u852 = Obj.obj ((((v_loadWorkspace dtb_u_u819) dtb_u_u820) dtb_u_u833)) in (let dtb_u_u854 = (dtb_u_u852 dtb_u_u829) in (let dtb_u_u856 = (match dtb_u_u854 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u858) -> (Base_dDiag.C_Check_ErrC (dtb_u_u858))
  | Base_dDiag.C_Check_OkC (dtb_u_u859) -> (Base_dDiag.C_Check_OkC ((v_workspaceContext dtb_u_u859)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u856)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u860) -> (let dtb_u_u866 = Obj.obj ((((v_loadPackage dtb_u_u819) dtb_u_u820) dtb_u_u833)) in (let dtb_u_u868 = (dtb_u_u866 dtb_u_u829) in (let dtb_u_u870 = (match dtb_u_u868 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u872) -> (Base_dDiag.C_Check_ErrC (dtb_u_u872))
  | Base_dDiag.C_Check_OkC (dtb_u_u873) -> (Base_dDiag.C_Check_OkC ((v_packageContext dtb_u_u873)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u870)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u879 = Obj.obj ((((v_locateBase dtb_u_u819) dtb_u_u820) B_dData_dUnit.C_Unit_MkUnit)) in (let dtb_u_u881 = (dtb_u_u879 dtb_u_u829) in (match dtb_u_u881 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u882) -> (let dtb_u_u884 = (Base_dDiag.C_Check_ErrC (dtb_u_u882)) in dtb_u_u884)
  | Base_dDiag.C_Check_OkC (dtb_u_u886) -> ((Obj.magic (((v_baseOnlyContext dtb_u_u819) dtb_u_u820) dtb_u_u886)) dtb_u_u829)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

# 706 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForFile = (fun (dtb_u_u887 : string) (dtb_u_u888 : string) (dtb_u_u892 : string) -> (Obj.repr ((fun (dtb_u_u897 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u898 = Obj.obj (((v_absolutePath dtb_u_u888) dtb_u_u892)) in (let dtb_u_u900 = (dtb_u_u898 dtb_u_u897) in ((Obj.magic (((v_contextAt dtb_u_u887) dtb_u_u888) (Frontend_dManifest.v_manifestDir dtb_u_u900))) dtb_u_u897)))))))

# 715 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForDir = (fun (dtb_u_u901 : string) (dtb_u_u902 : string) (dtb_u_u906 : string) -> (Obj.repr ((fun (dtb_u_u911 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u912 = Obj.obj (((v_absolutePath dtb_u_u902) dtb_u_u906)) in (let dtb_u_u914 = (dtb_u_u912 dtb_u_u911) in ((Obj.magic (((v_contextAt dtb_u_u901) dtb_u_u902) dtb_u_u914)) dtb_u_u911)))))))

# 60 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextDir = (fun (dtb_u_u915 : t_PackageContext) -> (match dtb_u_u915 with
  | { f_PackageContext_contextDir = dtb_u_u916; f_PackageContext_contextPackage = dtb_u_u917; f_PackageContext_contextRoots = dtb_u_u918; f_PackageContext_contextPackageName = dtb_u_u919; f_PackageContext_contextRelease = dtb_u_u920 } -> dtb_u_u916
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackage = (fun (dtb_u_u921 : t_PackageContext) -> (match dtb_u_u921 with
  | { f_PackageContext_contextDir = dtb_u_u922; f_PackageContext_contextPackage = dtb_u_u923; f_PackageContext_contextRoots = dtb_u_u924; f_PackageContext_contextPackageName = dtb_u_u925; f_PackageContext_contextRelease = dtb_u_u926 } -> dtb_u_u923
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRoots = (fun (dtb_u_u927 : t_PackageContext) -> (match dtb_u_u927 with
  | { f_PackageContext_contextDir = dtb_u_u928; f_PackageContext_contextPackage = dtb_u_u929; f_PackageContext_contextRoots = dtb_u_u930; f_PackageContext_contextPackageName = dtb_u_u931; f_PackageContext_contextRelease = dtb_u_u932 } -> dtb_u_u930
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackageName = (fun (dtb_u_u933 : t_PackageContext) -> (match dtb_u_u933 with
  | { f_PackageContext_contextDir = dtb_u_u934; f_PackageContext_contextPackage = dtb_u_u935; f_PackageContext_contextRoots = dtb_u_u936; f_PackageContext_contextPackageName = dtb_u_u937; f_PackageContext_contextRelease = dtb_u_u938 } -> dtb_u_u937
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRelease = (fun (dtb_u_u939 : t_PackageContext) -> (match dtb_u_u939 with
  | { f_PackageContext_contextDir = dtb_u_u940; f_PackageContext_contextPackage = dtb_u_u941; f_PackageContext_contextRoots = dtb_u_u942; f_PackageContext_contextPackageName = dtb_u_u943; f_PackageContext_contextRelease = dtb_u_u944 } -> dtb_u_u944
  | _ -> failwith "DT: impossible branch"
))

# 434 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceDir = (fun (dtb_u_u945 : t_Workspace) -> (match dtb_u_u945 with
  | { f_Workspace_workspaceDir = dtb_u_u946; f_Workspace_workspaceRoot = dtb_u_u947; f_Workspace_workspaceMembers = dtb_u_u948 } -> dtb_u_u946
  | _ -> failwith "DT: impossible branch"
))

# 435 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceRoot = (fun (dtb_u_u949 : t_Workspace) -> (match dtb_u_u949 with
  | { f_Workspace_workspaceDir = dtb_u_u950; f_Workspace_workspaceRoot = dtb_u_u951; f_Workspace_workspaceMembers = dtb_u_u952 } -> dtb_u_u951
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceMembers = (fun (dtb_u_u953 : t_Workspace) -> (match dtb_u_u953 with
  | { f_Workspace_workspaceDir = dtb_u_u954; f_Workspace_workspaceRoot = dtb_u_u955; f_Workspace_workspaceMembers = dtb_u_u956 } -> dtb_u_u956
  | _ -> failwith "DT: impossible branch"
))
