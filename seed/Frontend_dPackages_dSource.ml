open Vuna_runtime
# 25 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_skipSourceDir = (fun (name : string) -> (if (if (if (if (if (if (if (if (name = ".git") then true else (name = ".local")) then true else (name = ".output")) then true else (name = ".direnv")) then true else (name = "node_modules")) then true else (name = "seed")) then true else (name = "_scratch")) then true else (name = "result")) then true else (name = "corpus")))

# 40 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_normalizeHash = (fun (h : string) -> (if ((B_dData_dString.v_startsWith "sha256:") h) then (((B_dData_dString.v_substring 7) 64) h) else h))

# 44 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_verifyHash = (fun (expected : string) (actual : string) -> ((v_normalizeHash expected) = (v_normalizeHash actual)))

# 74 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_pkgSourceDepth = 4096

# 77 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_readManifestFile = (fun (nFs : string) (root : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (root ^ "/vuna.toml"))) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) (root ^ "/vuna.toml"))) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dCanonical_dPkg.f_PackageFile_pfPath = "vuna.toml"; Frontend_dCanonical_dPkg.f_PackageFile_pfContent = content }, B_dData_dList.C_List_Nil))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)))))

# 88 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let rec v_collectDirFiles = (fun (nFs : string) (ctx : Base_dIgnore.t_IgnoreContext) (fuel : int) (root : string) (rel : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "package file collection")) else (let dir = (if (rel = "") then root else (String.concat "" [root; "/"; rel])) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) dir)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then ((B_dEffect_dFs.v_fsIsDirectory nFs) dir) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Base_dIgnore.v_loadIgnoreFile nFs) dir) ((Base_dIgnore.v_ignorePathOf ctx) rel)) ctx)) (fun ctx2 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadDir nFs) dir)) (fun names -> ((((((v_collectNames nFs) ctx2) fuel) root) rel) names))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))))))))))
# 106 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_collectNames = (fun (nFs : string) (mc0 : Base_dIgnore.t_IgnoreContext) (mc1 : int) (mc2 : string) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (mc1 <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "package file collection")) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_walkName nFs) mc0) mc1) mc2) mc3) dtb__0)) (fun hereR -> (match hereR with
  | Base_dDiag.C_Check_ErrC (dtb__2) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__2)))
  | Base_dDiag.C_Check_OkC (dtb__3) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_collectNames nFs) mc0) mc1) mc2) mc3) dtb__1)) (fun thereR -> (match thereR with
  | Base_dDiag.C_Check_ErrC (dtb__4) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__4)))
  | Base_dDiag.C_Check_OkC (dtb__5) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb__3) dtb__5))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 123 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_walkName = (fun (nFs : string) (ctx : Base_dIgnore.t_IgnoreContext) (fuel : int) (root : string) (rel : string) (name : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "package file collection")) else (if (name = ".") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if (name = "..") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if (v_skipSourceDir name) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (let childRel = (if (rel = "") then name else (String.concat "" [rel; "/"; name])) in (let childPath = (String.concat "" [root; "/"; childRel]) in (if (((Base_dIgnore.v_isIgnored ctx) childRel) false) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) childPath)) (fun isDir -> (if isDir then (if (((Base_dIgnore.v_isIgnored ctx) childRel) true) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (((((v_collectDirFiles nFs) ctx) (fuel - 1)) root) childRel)) else (if ((B_dData_dString.v_endsWith ".vuna") name) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) childPath)) (fun content -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dCanonical_dPkg.f_PackageFile_pfPath = childRel; Frontend_dCanonical_dPkg.f_PackageFile_pfContent = content }, B_dData_dList.C_List_Nil))))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))))))))))))))

# 152 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_filePathLe = (fun (a : Frontend_dCanonical_dPkg.t_PackageFile) (b : Frontend_dCanonical_dPkg.t_PackageFile) -> ((a).Frontend_dCanonical_dPkg.f_PackageFile_pfPath <= (b).Frontend_dCanonical_dPkg.f_PackageFile_pfPath))

# 155 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_sortByPath = (fun (files : Frontend_dCanonical_dPkg.t_PackageFile B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_filePathLe) files))

# 50 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageFilesEff = (fun (nFs : string) (root : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dIgnore.v_ignoreContextEff nFs) root)) (fun ignoreCtx0 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Base_dIgnore.v_loadIgnoreFile nFs) root) ((Base_dIgnore.v_ignorePathOf ignoreCtx0) "")) ignoreCtx0)) (fun ignoreCtx -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_readManifestFile nFs) root)) (fun manifestFiles -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_collectDirFiles nFs) ignoreCtx) v_pkgSourceDepth) root) "lib")) (fun libR -> (match libR with
  | Base_dDiag.C_Check_ErrC (dtb__6) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__6)))
  | Base_dDiag.C_Check_OkC (dtb__7) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_collectDirFiles nFs) ignoreCtx) v_pkgSourceDepth) root) "app")) (fun appR -> (match appR with
  | Base_dDiag.C_Check_ErrC (dtb__8) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__8)))
  | Base_dDiag.C_Check_OkC (dtb__9) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_collectDirFiles nFs) ignoreCtx) v_pkgSourceDepth) root) "test")) (fun testR -> (match testR with
  | Base_dDiag.C_Check_ErrC (dtb__10) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__10)))
  | Base_dDiag.C_Check_OkC (dtb__11) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((v_sortByPath ((B_dData_dList.v_append manifestFiles) ((B_dData_dList.v_append dtb__7) ((B_dData_dList.v_append dtb__9) dtb__11)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 167 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageNameOf = (fun (manifest : Frontend_dManifest.t_Manifest) -> (match (manifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_exportsOf = (fun (manifest : Frontend_dManifest.t_Manifest) -> (match (manifest).Frontend_dManifest.f_Manifest_manifestExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__13) -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_depKeyOf = (fun (dep : Frontend_dManifest.t_Dependency) -> (let key = (match (Frontend_dManifest.v_depIdentityOf dep) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> (v_normalizeHash dtb__14)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> "path"
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (v_normalizeHash dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in { B_dData_dPair.f_Pair_first = (Frontend_dManifest.v_depAliasOf dep); B_dData_dPair.f_Pair_second = key }))

# 159 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageSourceEff = (fun (nFs : string) (root : string) (manifest : Frontend_dManifest.t_Manifest) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_packageFilesEff nFs) root)) (fun filesR -> (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__16) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__16)))
  | Base_dDiag.C_Check_OkC (dtb__17) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ({ Frontend_dCanonical_dPkg.f_PackageSource_psName = (v_packageNameOf manifest); Frontend_dCanonical_dPkg.f_PackageSource_psExports = (v_exportsOf manifest); Frontend_dCanonical_dPkg.f_PackageSource_psDeps = ((B_dData_dList.v_map v_depKeyOf) (manifest).Frontend_dManifest.f_Manifest_manifestDependencies); Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb__17 })))
  | _ -> failwith "DT: impossible branch"
))))

# 194 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_contentHashOf = (fun (ps : Frontend_dCanonical_dPkg.t_PackageSource) -> (Base_dHash.v_contentAddress (Frontend_dCanonical_dPkg.v_encPackageContent (ps).Frontend_dCanonical_dPkg.f_PackageSource_psFiles)))

# 198 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_identityHashOf = (fun (ps : Frontend_dCanonical_dPkg.t_PackageSource) -> (Base_dHash.v_contentAddress (Frontend_dCanonical_dPkg.v_encPackageIdentity (Frontend_dCanonical_dPkg.v_identityOfSource ps))))
