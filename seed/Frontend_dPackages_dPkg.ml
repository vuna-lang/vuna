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
let v_absolutePath = (fun (nEnv : string) (path : string) -> (if ((B_dData_dString.v_startsWith "/") path) then (let x = (v_normalizeDir path) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__14 = Obj.obj (e) in (let dtb__15 = Obj.obj ((k (dtb__14 u))) in (dtb__15 u)))))) (B_dEffect_dEnv.v_envGetCwd nEnv)) (fun cwd -> (let x = (v_normalizeDir (String.concat "" [cwd; "/"; path])) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 152 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_joinPath = (fun (base : string) (rel : string) -> (if ((B_dData_dString.v_startsWith "/") rel) then (v_normalizeDir rel) else (v_normalizeDir (String.concat "" [base; "/"; rel]))))

# 155 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_joinPathsText = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match dtb__17 with
  | B_dData_dList.C_List_Nil -> dtb__16
  | _ -> (String.concat "" [dtb__16; ", "; (v_joinPathsText dtb__17)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadManifestAt = (fun (nFs : string) (path : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__18 = Obj.obj (e) in (let dtb__19 = Obj.obj ((k (dtb__18 u))) in (dtb__19 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__20 = Obj.obj (e) in (let dtb__21 = Obj.obj ((k (dtb__20 u))) in (dtb__21 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (let x = (match ((Frontend_dManifest.v_parseManifest path) text) with
  | Base_dDiag.C_Check_ErrC (dtb__22) -> (Base_dDiag.C_Check_ErrC (dtb__22))
  | Base_dDiag.C_Check_OkC (dtb__23) -> (match (Frontend_dManifest.v_validateManifest dtb__23) with
  | Base_dDiag.C_Check_ErrC (dtb__24) -> (Base_dDiag.C_Check_ErrC (dtb__24))
  | Base_dDiag.C_Check_OkC (dtb__25) -> (Base_dDiag.C_Check_OkC (dtb__25))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = (((Base_dDiagnostics_dPkg.v_pkgPath1 path) (Base_dDiagnostics_dPkg.C_PkgErr_MissingManifest ((v_normalizeDir (Frontend_dManifest.v_manifestDir path))))) (v_normalizeDir (Frontend_dManifest.v_manifestDir path))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 180 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_manifestNameString = (fun (manifest : Frontend_dManifest.t_Manifest) -> (match (manifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> dtb__26
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_memStackDir = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) (B_dData_dPair.v_firstOf dtb__27)) mc0) then true else (((v_memStackDir _uctx0) mc0) dtb__28))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_cyclePrefix = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) (B_dData_dPair.v_firstOf dtb__29)) mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__29, B_dData_dList.C_List_Nil)))) else (match (((v_cyclePrefix _uctx0) mc0) dtb__30) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__31))))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_cycleMessage = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (match (((v_cyclePrefix B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) mc0) mc2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> ("pkg: dependency cycle: " ^ (Base_dSource.v_joinArrows ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_secondOf) (B_dData_dList.v_reverse dtb__33))) (B_dData_dList.C_List__x58__x58_ (dtb__32, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ("pkg: dependency cycle at " ^ mc0)
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyNameOk = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__34) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_mismatchMessage = (fun (mc0 : string B_dData_dMaybe.t_Maybe) (mc1 : string) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__35) -> (String.concat "" ["pkg: dependency "; dtb__35; " expects package name "; dtb__35; " but found "; mc1])
  | B_dData_dMaybe.C_Maybe_Nothing -> "pkg: package name mismatch"
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyIdentityEff = (fun (nFs : string) (dep : Frontend_dManifest.t_Dependency) (dir : string) (manifest : Frontend_dManifest.t_Manifest) -> (match (Frontend_dManifest.v_depIdentityOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = (Base_dDiag.C_Check_OkC (0)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__37 = Obj.obj (e) in (let dtb__38 = Obj.obj ((k (dtb__37 u))) in (dtb__38 u)))))) (((Frontend_dPackages_dSource.v_packageSourceEff nFs) dir) manifest)) (fun psR -> (match psR with
  | Base_dDiag.C_Check_ErrC (dtb__39) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__39)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__40) -> (let actual = (Frontend_dPackages_dSource.v_identityHashOf dtb__40) in (if ((Frontend_dPackages_dSource.v_normalizeHash dtb__36) = actual) then (let x = (Base_dDiag.C_Check_OkC (0)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let detail = (String.concat "" ["declared "; dtb__36; ", actual "; actual]) in (let x = ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_IdentityMismatch ((Frontend_dManifest.v_depAliasOf dep), detail))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dep), (B_dData_dVec.C_Vec__x58__x58_ (detail, B_dData_dVec.C_Vec_Nil))))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_verifyPathHashEff = (fun (nFs : string) (dep : Frontend_dManifest.t_Dependency) (dir : string) -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = (Base_dDiag.C_Check_OkC (0)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__41) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__42 = Obj.obj (e) in (let dtb__43 = Obj.obj ((k (dtb__42 u))) in (dtb__43 u)))))) ((Frontend_dPackages_dSource.v_packageFilesEff nFs) dir)) (fun filesR -> (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__44) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__44)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__45) -> (let actual = (Frontend_dPackages_dSource.v_contentHashOf { Frontend_dCanonical_dPkg.f_PackageSource_psName = ""; Frontend_dCanonical_dPkg.f_PackageSource_psExports = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psDeps = B_dData_dList.C_List_Nil; Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb__45 }) in (if ((Frontend_dPackages_dSource.v_verifyHash dtb__41) actual) then (let x = (Base_dDiag.C_Check_OkC (0)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let detail = (String.concat "" ["declared "; dtb__41; ", actual "; actual]) in (let x = ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_HashMismatch ((Frontend_dManifest.v_depAliasOf dep), detail))) (B_dData_dVec.C_Vec__x58__x58_ ((Frontend_dManifest.v_depAliasOf dep), (B_dData_dVec.C_Vec__x58__x58_ (detail, B_dData_dVec.C_Vec_Nil))))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_emptyPackageMemo = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)

# 347 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoLookup = (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__46 = Obj.obj (e) in (let dtb__47 = Obj.obj ((k (dtb__46 u))) in (dtb__47 u)))))) (B_dContainer_dMutRef.v_read memo)) (fun tbl -> (let x = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dir) tbl) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 353 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_memoInsert = (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (dir : string) (pkg : t_Package) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__48 = Obj.obj (e) in (let dtb__49 = Obj.obj ((k (dtb__48 u))) in (dtb__49 u)))))) (B_dContainer_dMutRef.v_read memo)) (fun tbl -> ((B_dContainer_dMutRef.v_write memo) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dir) pkg) tbl)))))

# 221 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadStoreDependency = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dep : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__51 = Obj.obj (e) in (let dtb__52 = Obj.obj ((k (dtb__51 u))) in (dtb__52 u)))))) (Base_dStore.v_storeDataRootEff nEnv)) (fun root -> (let digest = (Frontend_dPackages_dSource.v_normalizeHash dtb__50) in (let dir = (String.concat "" [root; "/pkgs/"; digest]) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__53 = Obj.obj (e) in (let dtb__54 = Obj.obj ((k (dtb__53 u))) in (dtb__54 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/.complete"))) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__55 = Obj.obj (e) in (let dtb__56 = Obj.obj ((k (dtb__55 u))) in (dtb__56 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) (dir ^ "/.complete"))) (fun text -> (if (text = digest) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__57 = Obj.obj (e) in (let dtb__58 = Obj.obj ((k (dtb__57 u))) in (dtb__58 u)))))) (((((((v_loadPackageWalk nFs) nEnv) memo) fuel) stack) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dep)))) dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__59) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__59)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__60) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__61 = Obj.obj (e) in (let dtb__62 = Obj.obj ((k (dtb__61 u))) in (dtb__62 u)))))) ((((v_verifyIdentityEff nFs) dep) dir) (dtb__60).f_Package_packageManifest)) (fun idR -> (match idR with
  | Base_dDiag.C_Check_ErrC (dtb__63) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__63)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__64) -> (let x = (Base_dDiag.C_Check_OkC (dtb__60)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (let x = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))) else (let x = ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_NotMaterialized ((Frontend_dManifest.v_depAliasOf dep)))) (Frontend_dManifest.v_depAliasOf dep)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))
  | _ -> failwith "DT: impossible branch"
))
# 294 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadDependencyList = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (baseDir : string) (deps : Frontend_dManifest.t_Dependency B_dData_dList.t_List) -> (if (fuel <= 0) then (let x = (Base_dDiag.v_icFuel "pkg") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (match deps with
  | B_dData_dList.C_List_Nil -> (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__67 = Obj.obj (e) in (let dtb__68 = Obj.obj ((k (dtb__67 u))) in (dtb__68 u)))))) (((((((v_loadOneDependency nFs) nEnv) memo) (fuel - 1)) stack) baseDir) dtb__65)) (fun depR -> (match depR with
  | Base_dDiag.C_Check_ErrC (dtb__69) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__69)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__70) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__71 = Obj.obj (e) in (let dtb__72 = Obj.obj ((k (dtb__71 u))) in (dtb__72 u)))))) (((((((v_loadDependencyList nFs) nEnv) memo) (fuel - 1)) stack) baseDir) dtb__66)) (fun restR -> (let x = (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__73) -> (Base_dDiag.C_Check_ErrC (dtb__73))
  | Base_dDiag.C_Check_OkC (dtb__74) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__74))))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 316 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadOneDependency = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (baseDir : string) (dep : Frontend_dManifest.t_Dependency) -> (match (Frontend_dManifest.v_depSourceOf dep) with
  | Frontend_dManifest.C_DependencySource_DepPath (dtb__75) -> (let dir = ((v_joinPath baseDir) dtb__75) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__76 = Obj.obj (e) in (let dtb__77 = Obj.obj ((k (dtb__76 u))) in (dtb__77 u)))))) (((((((v_loadPackageWalk nFs) nEnv) memo) fuel) stack) (B_dData_dMaybe.C_Maybe_Just ((Frontend_dManifest.v_depAliasOf dep)))) dir)) (fun depR -> (match depR with
  | Base_dDiag.C_Check_ErrC (dtb__78) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__78)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__79) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__80 = Obj.obj (e) in (let dtb__81 = Obj.obj ((k (dtb__80 u))) in (dtb__81 u)))))) (((v_verifyPathHashEff nFs) dep) dir)) (fun hashR -> (match hashR with
  | Base_dDiag.C_Check_ErrC (dtb__82) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__82)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__83) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__84 = Obj.obj (e) in (let dtb__85 = Obj.obj ((k (dtb__84 u))) in (dtb__85 u)))))) ((((v_verifyIdentityEff nFs) dep) dir) (dtb__79).f_Package_packageManifest)) (fun idR -> (match idR with
  | Base_dDiag.C_Check_ErrC (dtb__86) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__86)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__87) -> (let x = (Base_dDiag.C_Check_OkC (dtb__79)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Frontend_dManifest.C_DependencySource_DepGit (dtb__88, dtb__89) -> ((((((v_loadStoreDependency nFs) nEnv) memo) fuel) stack) dep)
  | Frontend_dManifest.C_DependencySource_DepUrl (dtb__90) -> ((((((v_loadStoreDependency nFs) nEnv) memo) fuel) stack) dep)
  | _ -> failwith "DT: impossible branch"
))
# 359 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_loadPackageWalk = (fun (nFs : string) (nEnv : string) (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) (fuel : int) (stack : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (depName : string B_dData_dMaybe.t_Maybe) (dir : string) -> (if (fuel <= 0) then (let x = (Base_dDiag.v_icFuel "pkg") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let normalized = (v_normalizeDir dir) in (if (((v_memStackDir B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) normalized) stack) then (let x = (Base_dDiagnostics_dPkg.v_pkgInvalid (((v_cycleMessage normalized) depName) stack)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__91 = Obj.obj (e) in (let dtb__92 = Obj.obj ((k (dtb__91 u))) in (dtb__92 u)))))) ((v_memoLookup memo) normalized)) (fun cached -> (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) depName) (v_packageName dtb__93)) then (let x = (Base_dDiag.C_Check_OkC (dtb__93)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let x = (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage depName) (v_packageName dtb__93))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__94 = Obj.obj (e) in (let dtb__95 = Obj.obj ((k (dtb__94 u))) in (dtb__95 u)))))) ((v_loadManifestAt nFs) (normalized ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Base_dDiag.C_Check_ErrC (dtb__96) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__96)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__97) -> (match (dtb__97).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = ((Base_dDiagnostics_dPkg.v_pkgPath0 (dtb__97).Frontend_dManifest.f_Manifest_manifestPath) Base_dDiagnostics_dPkg.C_PkgErr_NotPackage) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (let name = (v_manifestNameString dtb__97) in (if (((v_dependencyNameOk B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) depName) name) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__99 = Obj.obj (e) in (let dtb__100 = Obj.obj ((k (dtb__99 u))) in (dtb__100 u)))))) (((((((v_loadDependencyList nFs) nEnv) memo) (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = normalized; B_dData_dPair.f_Pair_second = name }, stack))) normalized) (dtb__97).Frontend_dManifest.f_Manifest_manifestDependencies)) (fun dependencyR -> (match dependencyR with
  | Base_dDiag.C_Check_ErrC (dtb__101) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__101)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__102) -> (let pkg = { f_Package_packageManifest = dtb__97; f_Package_packageDependencies = dtb__102; f_Package_packageDir = normalized } in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__103 = Obj.obj (e) in (let dtb__104 = Obj.obj ((k (dtb__103 u))) in (dtb__104 u)))))) (((v_memoInsert memo) normalized) pkg)) (fun _u -> (let x = (Base_dDiag.C_Check_OkC (pkg)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | _ -> failwith "DT: impossible branch"
))) else (let x = (Base_dDiagnostics_dPkg.v_pkgInvalid ((v_mismatchMessage depName) name)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

# 412 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_lookupPackageDir = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__107; B_dData_dPair.f_Pair_second = dtb__108 } -> (if (dtb__107 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__108)) else ((v_lookupPackageDir mc0) dtb__106))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_checkUniqueNamesGo = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (match dtb__109 with
  | { B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 } -> (match ((v_lookupPackageDir dtb__111) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_checkUniqueNamesGo (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 }, mc0))) dtb__110)
  | B_dData_dMaybe.C_Maybe_Just (dtb__113) -> (if (dtb__113 = dtb__112) then ((v_checkUniqueNamesGo mc0) dtb__110) else ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_DuplicatePackageName (dtb__111, dtb__113, dtb__112))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__111, (B_dData_dVec.C_Vec__x58__x58_ (dtb__113, (B_dData_dVec.C_Vec__x58__x58_ (dtb__112, B_dData_dVec.C_Vec_Nil))))))))
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
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (B_dData_dList.C_List__x58__x58_ (dtb__114, (workspace).f_Workspace_workspaceMembers))
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_findManifestUpMaybe = (fun (nFs : string) (fuel : int) (dir : string) -> (if (fuel <= 0) then (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__115 = Obj.obj (e) in (let dtb__116 = Obj.obj ((k (dtb__115 u))) in (dtb__116 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/vuna.toml"))) (fun exists -> (if exists then (let x = (B_dData_dMaybe.C_Maybe_Just (dir)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else ((((v_findManifestUpMaybeStep nFs) (fuel - 1)) dir) (Frontend_dManifest.v_manifestDir dir)))))))
# 625 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_findManifestUpMaybeStep = (fun (nFs : string) (fuel : int) (dir : string) (parent : string) -> (if (fuel <= 0) then (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (parent = dir) then (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((v_findManifestUpMaybe nFs) (fuel - 1)) parent))))

# 636 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDirMaybe = (fun (nFs : string) (startDir : string) -> (let start = (v_normalizeDir startDir) in (((v_findManifestUpMaybe nFs) ((2 * (String.length start)) + 4)) start)))

# 644 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_findManifestDir = (fun (nFs : string) (startDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__117 = Obj.obj (e) in (let dtb__118 = Obj.obj ((k (dtb__117 u))) in (dtb__118 u)))))) ((v_findManifestDirMaybe nFs) startDir)) (fun found -> (let x = (match found with
  | B_dData_dMaybe.C_Maybe_Just (dtb__119) -> (Base_dDiag.C_Check_OkC (dtb__119))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc (Base_dDiagnostics_dPkg.C_PkgErr_NoManifestUpward ((v_normalizeDir startDir)))) (B_dData_dVec.C_Vec__x58__x58_ ((v_normalizeDir startDir), B_dData_dVec.C_Vec_Nil)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 658 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_hasManifest = (fun (nFs : string) (dir : string) -> ((B_dEffect_dFs.v_fsFileExists nFs) (dir ^ "/vuna.toml")))

# 661 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseCandidates = (fun (exeDir : string) -> (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "base"), (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "../base"), (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "../../base"), (B_dData_dList.C_List__x58__x58_ (((v_joinPath exeDir) "../../../base"), B_dData_dList.C_List_Nil)))))))))

# 670 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseNotFound = (fun (tried : string B_dData_dList.t_List) -> ((Base_dDiagnostics_dPkg.v_pkgNoLoc1 (Base_dDiagnostics_dPkg.C_PkgErr_MissingBase ((v_joinPathsText tried)))) (v_joinPathsText tried)))

# 673 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_firstExistingBase = (fun (nFs : string) (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__122 = Obj.obj (e) in (let dtb__123 = Obj.obj ((k (dtb__122 u))) in (dtb__123 u)))))) ((v_hasManifest nFs) dtb__120)) (fun exists -> (if exists then (let x = (Base_dDiag.C_Check_OkC (dtb__120)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((v_firstExistingBase nFs) mc0) dtb__121))))
  | B_dData_dList.C_List_Nil -> (let x = (v_baseNotFound mc0) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 682 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_locateBase = (fun (nFs : string) (nEnv : string) (_u : B_dData_dUnit.t_Unit) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__124 = Obj.obj (e) in (let dtb__125 = Obj.obj ((k (dtb__124 u))) in (dtb__125 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_BASE")) (fun env -> (if (env = "") then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__126 = Obj.obj (e) in (let dtb__127 = Obj.obj ((k (dtb__126 u))) in (dtb__127 u)))))) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__128 = Obj.obj (e) in (let dtb__129 = Obj.obj ((k (dtb__128 u))) in (dtb__129 u)))))) ((v_absolutePath nEnv) exe)) (fun cwd -> (let candidates = (v_baseCandidates (Frontend_dManifest.v_manifestDir cwd)) in (((v_firstExistingBase nFs) candidates) candidates)))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__130 = Obj.obj (e) in (let dtb__131 = Obj.obj ((k (dtb__130 u))) in (dtb__131 u)))))) ((v_absolutePath nEnv) env)) (fun dir -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__132 = Obj.obj (e) in (let dtb__133 = Obj.obj ((k (dtb__132 u))) in (dtb__133 u)))))) ((v_hasManifest nFs) dir)) (fun exists -> (if exists then (let x = (Base_dDiag.C_Check_OkC (dir)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let x = (v_baseNotFound (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))

# 37 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootDir = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__134; f_Root_rootName = dtb__135; f_Root_rootExports = dtb__136; f_Root_rootLayerRules = dtb__137; f_Root_rootImplicitPrelude = dtb__138 } -> dtb__134
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootName = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__139; f_Root_rootName = dtb__140; f_Root_rootExports = dtb__141; f_Root_rootLayerRules = dtb__142; f_Root_rootImplicitPrelude = dtb__143 } -> dtb__140
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootPackage = (fun (root : t_Root) -> (v_rootName root))

# 39 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootExports = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__144; f_Root_rootName = dtb__145; f_Root_rootExports = dtb__146; f_Root_rootLayerRules = dtb__147; f_Root_rootImplicitPrelude = dtb__148 } -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootLayerRules = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__149; f_Root_rootName = dtb__150; f_Root_rootExports = dtb__151; f_Root_rootLayerRules = dtb__152; f_Root_rootImplicitPrelude = dtb__153 } -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_rootImplicitPrelude = (fun (p : t_Root) -> (match p with
  | { f_Root_rootDir = dtb__154; f_Root_rootName = dtb__155; f_Root_rootExports = dtb__156; f_Root_rootLayerRules = dtb__157; f_Root_rootImplicitPrelude = dtb__158 } -> dtb__158
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageManifest = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__159; f_Package_packageDependencies = dtb__160; f_Package_packageDir = dtb__161 } -> dtb__159
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDependencies = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__162; f_Package_packageDependencies = dtb__163; f_Package_packageDir = dtb__164 } -> dtb__163
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageDir = (fun (p : t_Package) -> (match p with
  | { f_Package_packageManifest = dtb__165; f_Package_packageDependencies = dtb__166; f_Package_packageDir = dtb__167 } -> dtb__167
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_collectPackageIds = (fun (package : t_Package) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (v_packageName package); B_dData_dPair.f_Pair_second = (v_packageDir package) }, (v_collectDependencyIds (v_packageDependencies package)))))
# 407 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
and v_collectDependencyIds = (fun (mc0 : t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> ((B_dData_dList.v_append (v_collectPackageIds dtb__168)) (v_collectDependencyIds dtb__169))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 428 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_checkUniquePackageNames = (fun (packages : t_Package B_dData_dList.t_List) -> ((v_checkUniqueNamesGo B_dData_dList.C_List_Nil) (v_collectDependencyIds packages)))

# 443 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadPackage = (fun (nFs : string) (nEnv : string) (dir : string) -> ((B_dContainer_dMutRef.v_withMutRef v_emptyPackageMemo) (fun (memo : (string, t_Package) B_dContainer_dHashMap.t_HashMap B_dContainer_dMutRef.t_MutRef) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__170 = Obj.obj (e) in (let dtb__171 = Obj.obj ((k (dtb__170 u))) in (dtb__171 u)))))) (((((((v_loadPackageWalk nFs) nEnv) memo) v_pkgFuelBound) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing) dir)) (fun packageR -> (let x = (match packageR with
  | Base_dDiag.C_Check_ErrC (dtb__172) -> (Base_dDiag.C_Check_ErrC (dtb__172))
  | Base_dDiag.C_Check_OkC (dtb__173) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb__173, B_dData_dList.C_List_Nil))) with
  | Base_dDiag.C_Check_ErrC (dtb__174) -> (Base_dDiag.C_Check_ErrC (dtb__174))
  | Base_dDiag.C_Check_OkC (dtb__175) -> (Base_dDiag.C_Check_OkC (dtb__173))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 460 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_loadMembers = (fun (nFs : string) (nEnv : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__178 = Obj.obj (e) in (let dtb__179 = Obj.obj ((k (dtb__178 u))) in (dtb__179 u)))))) (((v_loadPackage nFs) nEnv) ((v_joinPath mc0) dtb__176))) (fun memberR -> (match memberR with
  | Base_dDiag.C_Check_ErrC (dtb__180) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__180)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__181) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__182 = Obj.obj (e) in (let dtb__183 = Obj.obj ((k (dtb__182 u))) in (dtb__183 u)))))) ((((v_loadMembers nFs) nEnv) mc0) dtb__177)) (fun restR -> (let x = (match restR with
  | Base_dDiag.C_Check_ErrC (dtb__184) -> (Base_dDiag.C_Check_ErrC (dtb__184))
  | Base_dDiag.C_Check_OkC (dtb__185) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__185))))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_loadWorkspace = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) -> (let base = (v_normalizeDir rootBaseDir) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__186 = Obj.obj (e) in (let dtb__187 = Obj.obj ((k (dtb__186 u))) in (dtb__187 u)))))) ((v_loadManifestAt nFs) (base ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Base_dDiag.C_Check_ErrC (dtb__188) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__188)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__189) -> (match (dtb__189).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__190 = Obj.obj (e) in (let dtb__191 = Obj.obj ((k (dtb__190 u))) in (dtb__191 u)))))) ((((v_loadMembers nFs) nEnv) base) (dtb__189).Frontend_dManifest.f_Manifest_manifestMembers)) (fun membersR -> (let x = (match membersR with
  | Base_dDiag.C_Check_ErrC (dtb__192) -> (Base_dDiag.C_Check_ErrC (dtb__192))
  | Base_dDiag.C_Check_OkC (dtb__193) -> (match (v_checkUniquePackageNames dtb__193) with
  | Base_dDiag.C_Check_ErrC (dtb__194) -> (Base_dDiag.C_Check_ErrC (dtb__194))
  | Base_dDiag.C_Check_OkC (dtb__195) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = base; f_Workspace_workspaceRoot = B_dData_dMaybe.C_Maybe_Nothing; f_Workspace_workspaceMembers = dtb__193 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__197 = Obj.obj (e) in (let dtb__198 = Obj.obj ((k (dtb__197 u))) in (dtb__198 u)))))) (((v_loadPackage nFs) nEnv) base)) (fun rootR -> (match rootR with
  | Base_dDiag.C_Check_ErrC (dtb__199) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__199)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__200) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__201 = Obj.obj (e) in (let dtb__202 = Obj.obj ((k (dtb__201 u))) in (dtb__202 u)))))) ((((v_loadMembers nFs) nEnv) base) (dtb__189).Frontend_dManifest.f_Manifest_manifestMembers)) (fun membersR -> (let x = (match membersR with
  | Base_dDiag.C_Check_ErrC (dtb__203) -> (Base_dDiag.C_Check_ErrC (dtb__203))
  | Base_dDiag.C_Check_OkC (dtb__204) -> (match (v_checkUniquePackageNames (B_dData_dList.C_List__x58__x58_ (dtb__200, dtb__204))) with
  | Base_dDiag.C_Check_ErrC (dtb__205) -> (Base_dDiag.C_Check_ErrC (dtb__205))
  | Base_dDiag.C_Check_OkC (dtb__206) -> (Base_dDiag.C_Check_OkC ({ f_Workspace_workspaceDir = base; f_Workspace_workspaceRoot = (B_dData_dMaybe.C_Maybe_Just (dtb__200)); f_Workspace_workspaceMembers = dtb__204 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 538 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspacePackages = (fun (nFs : string) (nEnv : string) (rootBaseDir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__207 = Obj.obj (e) in (let dtb__208 = Obj.obj ((k (dtb__207 u))) in (dtb__208 u)))))) (((v_loadWorkspace nFs) nEnv) rootBaseDir)) (fun workspaceR -> (let x = (match workspaceR with
  | Base_dDiag.C_Check_ErrC (dtb__209) -> (Base_dDiag.C_Check_ErrC (dtb__209))
  | Base_dDiag.C_Check_OkC (dtb__210) -> (Base_dDiag.C_Check_OkC ((v_workspaceAllPackages dtb__210)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 561 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_dependencyRootOf = (fun (package : t_Package) -> { f_Root_rootDir = ((v_packageDir package) ^ "/lib"); f_Root_rootName = (v_packageName package); f_Root_rootExports = (v_packageExports package); f_Root_rootLayerRules = (v_packageLayers package); f_Root_rootImplicitPrelude = (v_packageImplicitPrelude package) })

# 551 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceContext = (fun (workspace : t_Workspace) -> { f_PackageContext_contextDir = (workspace).f_Workspace_workspaceDir; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = ((B_dData_dList.v_map v_dependencyRootOf) (v_workspaceMembersOf workspace)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false })

# 574 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let rec v_dependencyRoots = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (if ((B_dData_dList.v_memName (v_packageName dtb__211)) mc0) then ((v_dependencyRoots mc0) dtb__212) else (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ ((v_packageName dtb__211), mc0))) (v_packageDependencies dtb__211)) with
  | { B_dData_dPair.f_Pair_first = dtb__213; B_dData_dPair.f_Pair_second = dtb__214 } -> (match ((v_dependencyRoots dtb__213) dtb__212) with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__214) (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb__211), dtb__216))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageRoots = (fun (package : t_Package) -> (let selfName = (v_packageName package) in (let selfRoot = { f_Root_rootDir = ((v_packageDir package) ^ "/lib"); f_Root_rootName = selfName; f_Root_rootExports = B_dData_dMaybe.C_Maybe_Nothing; f_Root_rootLayerRules = (v_packageLayers package); f_Root_rootImplicitPrelude = (v_packageImplicitPrelude package) } in (match ((v_dependencyRoots (B_dData_dList.C_List__x58__x58_ (selfName, B_dData_dList.C_List_Nil))) (package).f_Package_packageDependencies) with
  | { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = dtb__218 } -> (B_dData_dList.C_List__x58__x58_ (selfRoot, dtb__218))
  | _ -> failwith "DT: impossible branch"
))))

# 602 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageEntry = (fun (package : t_Package) -> ((v_packageDir package) ^ "/app/Main.vuna"))

# 606 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_packageContext = (fun (package : t_Package) -> { f_PackageContext_contextDir = (v_packageDir package); f_PackageContext_contextPackage = (B_dData_dMaybe.C_Maybe_Just (package)); f_PackageContext_contextRoots = (v_packageRoots package); f_PackageContext_contextPackageName = (v_packageName package); f_PackageContext_contextRelease = false })

# 703 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_baseOnlyContext = (fun (nFs : string) (nEnv : string) (base : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__219 = Obj.obj (e) in (let dtb__220 = Obj.obj ((k (dtb__219 u))) in (dtb__220 u)))))) (((v_loadPackage nFs) nEnv) base)) (fun packageR -> (let x = (match packageR with
  | Base_dDiag.C_Check_ErrC (dtb__221) -> (Base_dDiag.C_Check_ErrC (dtb__221))
  | Base_dDiag.C_Check_OkC (dtb__222) -> (Base_dDiag.C_Check_OkC ({ f_PackageContext_contextDir = ""; f_PackageContext_contextPackage = B_dData_dMaybe.C_Maybe_Nothing; f_PackageContext_contextRoots = (B_dData_dList.C_List__x58__x58_ ((v_dependencyRootOf dtb__222), B_dData_dList.C_List_Nil)); f_PackageContext_contextPackageName = ""; f_PackageContext_contextRelease = false }))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 716 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextAt = (fun (nFs : string) (nEnv : string) (start : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__223 = Obj.obj (e) in (let dtb__224 = Obj.obj ((k (dtb__223 u))) in (dtb__224 u)))))) ((v_findManifestDirMaybe nFs) start)) (fun found -> (match found with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__226 = Obj.obj (e) in (let dtb__227 = Obj.obj ((k (dtb__226 u))) in (dtb__227 u)))))) ((v_loadManifestAt nFs) (dtb__225 ^ "/vuna.toml"))) (fun manifestR -> (match manifestR with
  | Base_dDiag.C_Check_ErrC (dtb__228) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__228)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__229) -> (match (dtb__229).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__230 = Obj.obj (e) in (let dtb__231 = Obj.obj ((k (dtb__230 u))) in (dtb__231 u)))))) (((v_loadWorkspace nFs) nEnv) dtb__225)) (fun workspaceR -> (let x = (match workspaceR with
  | Base_dDiag.C_Check_ErrC (dtb__232) -> (Base_dDiag.C_Check_ErrC (dtb__232))
  | Base_dDiag.C_Check_OkC (dtb__233) -> (Base_dDiag.C_Check_OkC ((v_workspaceContext dtb__233)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__234) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__235 = Obj.obj (e) in (let dtb__236 = Obj.obj ((k (dtb__235 u))) in (dtb__236 u)))))) (((v_loadPackage nFs) nEnv) dtb__225)) (fun packageR -> (let x = (match packageR with
  | Base_dDiag.C_Check_ErrC (dtb__237) -> (Base_dDiag.C_Check_ErrC (dtb__237))
  | Base_dDiag.C_Check_OkC (dtb__238) -> (Base_dDiag.C_Check_OkC ((v_packageContext dtb__238)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__239 = Obj.obj (e) in (let dtb__240 = Obj.obj ((k (dtb__239 u))) in (dtb__240 u)))))) (((v_locateBase nFs) nEnv) B_dData_dUnit.C_Unit_MkUnit)) (fun baseR -> (match baseR with
  | Base_dDiag.C_Check_ErrC (dtb__241) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__241)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__242) -> (((v_baseOnlyContext nFs) nEnv) dtb__242)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 752 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForFile = (fun (nFs : string) (nEnv : string) (path : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__243 = Obj.obj (e) in (let dtb__244 = Obj.obj ((k (dtb__243 u))) in (dtb__244 u)))))) ((v_absolutePath nEnv) path)) (fun absolute -> (((v_contextAt nFs) nEnv) (Frontend_dManifest.v_manifestDir absolute)))))

# 761 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextForDir = (fun (nFs : string) (nEnv : string) (dir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__245 = Obj.obj (e) in (let dtb__246 = Obj.obj ((k (dtb__245 u))) in (dtb__246 u)))))) ((v_absolutePath nEnv) dir)) (fun absolute -> (((v_contextAt nFs) nEnv) absolute))))

# 59 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextDir = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__247; f_PackageContext_contextPackage = dtb__248; f_PackageContext_contextRoots = dtb__249; f_PackageContext_contextPackageName = dtb__250; f_PackageContext_contextRelease = dtb__251 } -> dtb__247
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackage = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__252; f_PackageContext_contextPackage = dtb__253; f_PackageContext_contextRoots = dtb__254; f_PackageContext_contextPackageName = dtb__255; f_PackageContext_contextRelease = dtb__256 } -> dtb__253
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRoots = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__257; f_PackageContext_contextPackage = dtb__258; f_PackageContext_contextRoots = dtb__259; f_PackageContext_contextPackageName = dtb__260; f_PackageContext_contextRelease = dtb__261 } -> dtb__259
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextPackageName = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__262; f_PackageContext_contextPackage = dtb__263; f_PackageContext_contextRoots = dtb__264; f_PackageContext_contextPackageName = dtb__265; f_PackageContext_contextRelease = dtb__266 } -> dtb__265
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_contextRelease = (fun (p : t_PackageContext) -> (match p with
  | { f_PackageContext_contextDir = dtb__267; f_PackageContext_contextPackage = dtb__268; f_PackageContext_contextRoots = dtb__269; f_PackageContext_contextPackageName = dtb__270; f_PackageContext_contextRelease = dtb__271 } -> dtb__271
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceDir = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__272; f_Workspace_workspaceRoot = dtb__273; f_Workspace_workspaceMembers = dtb__274 } -> dtb__272
  | _ -> failwith "DT: impossible branch"
))

# 481 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceRoot = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__275; f_Workspace_workspaceRoot = dtb__276; f_Workspace_workspaceMembers = dtb__277 } -> dtb__276
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Frontend/Packages/Pkg.vuna"
let v_workspaceMembers = (fun (p : t_Workspace) -> (match p with
  | { f_Workspace_workspaceDir = dtb__278; f_Workspace_workspaceRoot = dtb__279; f_Workspace_workspaceMembers = dtb__280 } -> dtb__280
  | _ -> failwith "DT: impossible branch"
))
