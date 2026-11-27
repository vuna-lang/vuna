open Vuna_runtime
# 25 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_skipSourceDir = (fun (name : string) -> (if (if (if (if (if (if (if (if (if (name = ".git") then true else (name = ".local")) then true else (name = ".output")) then true else (name = ".vuna")) then true else (name = ".direnv")) then true else (name = "node_modules")) then true else (name = "seed")) then true else (name = "_scratch")) then true else (name = "result")) then true else (name = "corpus")))

# 42 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_normalizeHash = (fun (h : string) -> (if ((B_dData_dString.v_startsWith "sha256:") h) then (((B_dData_dString.v_substring 7) 64) h) else h))

# 46 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_verifyHash = (fun (expected : string) (actual : string) -> ((v_normalizeHash expected) = (v_normalizeHash actual)))

# 76 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_pkgSourceDepth = 4096

# 79 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_readManifestFile = (fun (nFs : string) (root : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (let dtb__1 = Obj.obj ((k (dtb__0 u))) in (dtb__1 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) (root ^ "/vuna.toml"))) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__2 = Obj.obj (e) in (let dtb__3 = Obj.obj ((k (dtb__2 u))) in (dtb__3 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) (root ^ "/vuna.toml"))) (fun content -> (let x = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dCanonical_dPkg.f_PackageFile_pfPath = "vuna.toml"; Frontend_dCanonical_dPkg.f_PackageFile_pfContent = content }, B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 90 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let rec v_collectDirFiles = (fun (nFs : string) (ctx : Base_dIgnore.t_IgnoreContext) (fuel : int) (root : string) (rel : string) -> (if (fuel <= 0) then (let x = (Base_dDiag.v_icFuel "package file collection") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let dir = (if (rel = "") then root else (String.concat "" [root; "/"; rel])) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__4 = Obj.obj (e) in (let dtb__5 = Obj.obj ((k (dtb__4 u))) in (dtb__5 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) dir)) (fun exists -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__6 = Obj.obj (e) in (let dtb__7 = Obj.obj ((k (dtb__6 u))) in (dtb__7 u)))))) (if exists then ((B_dEffect_dFs.v_fsIsDirectory nFs) dir) else (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun isDir -> (if (if exists then isDir else false) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__8 = Obj.obj (e) in (let dtb__9 = Obj.obj ((k (dtb__8 u))) in (dtb__9 u)))))) ((((Base_dIgnore.v_loadIgnoreFile nFs) dir) ((Base_dIgnore.v_ignorePathOf ctx) rel)) ctx)) (fun ctx2 -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__10 = Obj.obj (e) in (let dtb__11 = Obj.obj ((k (dtb__10 u))) in (dtb__11 u)))))) ((B_dEffect_dFs.v_fsReadDir nFs) dir)) (fun names -> ((((((v_collectNames nFs) ctx2) fuel) root) rel) names))))) else (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))
# 108 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_collectNames = (fun (nFs : string) (mc0 : Base_dIgnore.t_IgnoreContext) (mc1 : int) (mc2 : string) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (if (mc1 <= 0) then (let x = (Base_dDiag.v_icFuel "package file collection") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__14 = Obj.obj (e) in (let dtb__15 = Obj.obj ((k (dtb__14 u))) in (dtb__15 u)))))) ((((((v_walkName nFs) mc0) mc1) mc2) mc3) dtb__12)) (fun hereR -> (match hereR with
  | Base_dDiag.C_Check_ErrC (dtb__16) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__16)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__17) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__18 = Obj.obj (e) in (let dtb__19 = Obj.obj ((k (dtb__18 u))) in (dtb__19 u)))))) ((((((v_collectNames nFs) mc0) mc1) mc2) mc3) dtb__13)) (fun thereR -> (match thereR with
  | Base_dDiag.C_Check_ErrC (dtb__20) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__20)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__21) -> (let x = (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb__17) dtb__21))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))
# 125 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_walkName = (fun (nFs : string) (ctx : Base_dIgnore.t_IgnoreContext) (fuel : int) (root : string) (rel : string) (name : string) -> (if (fuel <= 0) then (let x = (Base_dDiag.v_icFuel "package file collection") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (name = ".") then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (name = "..") then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (v_skipSourceDir name) then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let childRel = (if (rel = "") then name else (String.concat "" [rel; "/"; name])) in (let childPath = (String.concat "" [root; "/"; childRel]) in (if (((Base_dIgnore.v_isIgnored ctx) childRel) false) then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__22 = Obj.obj (e) in (let dtb__23 = Obj.obj ((k (dtb__22 u))) in (dtb__23 u)))))) ((B_dEffect_dFs.v_fsIsDirectory nFs) childPath)) (fun isDir -> (if isDir then (if (((Base_dIgnore.v_isIgnored ctx) childRel) true) then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((((v_collectDirFiles nFs) ctx) (fuel - 1)) root) childRel)) else (if ((B_dData_dString.v_endsWith ".vuna") name) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__24 = Obj.obj (e) in (let dtb__25 = Obj.obj ((k (dtb__24 u))) in (dtb__25 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) childPath)) (fun content -> (let x = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dCanonical_dPkg.f_PackageFile_pfPath = childRel; Frontend_dCanonical_dPkg.f_PackageFile_pfContent = content }, B_dData_dList.C_List_Nil)))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))))))

# 154 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_filePathLe = (fun (a : Frontend_dCanonical_dPkg.t_PackageFile) (b : Frontend_dCanonical_dPkg.t_PackageFile) -> ((a).Frontend_dCanonical_dPkg.f_PackageFile_pfPath <= (b).Frontend_dCanonical_dPkg.f_PackageFile_pfPath))

# 157 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_sortByPath = (fun (files : Frontend_dCanonical_dPkg.t_PackageFile B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_filePathLe) files))

# 52 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageFilesEff = (fun (nFs : string) (root : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__26 = Obj.obj (e) in (let dtb__27 = Obj.obj ((k (dtb__26 u))) in (dtb__27 u)))))) ((Base_dIgnore.v_ignoreContextEff nFs) root)) (fun ignoreCtx0 -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__28 = Obj.obj (e) in (let dtb__29 = Obj.obj ((k (dtb__28 u))) in (dtb__29 u)))))) ((((Base_dIgnore.v_loadIgnoreFile nFs) root) ((Base_dIgnore.v_ignorePathOf ignoreCtx0) "")) ignoreCtx0)) (fun ignoreCtx -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__30 = Obj.obj (e) in (let dtb__31 = Obj.obj ((k (dtb__30 u))) in (dtb__31 u)))))) ((v_readManifestFile nFs) root)) (fun manifestFiles -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__32 = Obj.obj (e) in (let dtb__33 = Obj.obj ((k (dtb__32 u))) in (dtb__33 u)))))) (((((v_collectDirFiles nFs) ignoreCtx) v_pkgSourceDepth) root) "lib")) (fun libR -> (match libR with
  | Base_dDiag.C_Check_ErrC (dtb__34) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__34)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__35) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__36 = Obj.obj (e) in (let dtb__37 = Obj.obj ((k (dtb__36 u))) in (dtb__37 u)))))) (((((v_collectDirFiles nFs) ignoreCtx) v_pkgSourceDepth) root) "app")) (fun appR -> (match appR with
  | Base_dDiag.C_Check_ErrC (dtb__38) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__38)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__39) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__40 = Obj.obj (e) in (let dtb__41 = Obj.obj ((k (dtb__40 u))) in (dtb__41 u)))))) (((((v_collectDirFiles nFs) ignoreCtx) v_pkgSourceDepth) root) "test")) (fun testR -> (match testR with
  | Base_dDiag.C_Check_ErrC (dtb__42) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__42)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__43) -> (let x = (Base_dDiag.C_Check_OkC ((v_sortByPath ((B_dData_dList.v_append manifestFiles) ((B_dData_dList.v_append dtb__35) ((B_dData_dList.v_append dtb__39) dtb__43)))))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 169 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageNameOf = (fun (manifest : Frontend_dManifest.t_Manifest) -> (match (manifest).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__44) -> dtb__44
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_exportsOf = (fun (manifest : Frontend_dManifest.t_Manifest) -> (match (manifest).Frontend_dManifest.f_Manifest_manifestExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_depKeyOf = (fun (dep : Frontend_dManifest.t_Dependency) -> (let key = (match (Frontend_dManifest.v_depIdentityOf dep) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> (v_normalizeHash dtb__46)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Frontend_dManifest.v_depHashOf dep) with
  | B_dData_dMaybe.C_Maybe_Nothing -> "path"
  | B_dData_dMaybe.C_Maybe_Just (dtb__47) -> (v_normalizeHash dtb__47)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in { B_dData_dPair.f_Pair_first = (Frontend_dManifest.v_depAliasOf dep); B_dData_dPair.f_Pair_second = key }))

# 161 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageSourceEff = (fun (nFs : string) (root : string) (manifest : Frontend_dManifest.t_Manifest) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__48 = Obj.obj (e) in (let dtb__49 = Obj.obj ((k (dtb__48 u))) in (dtb__49 u)))))) ((v_packageFilesEff nFs) root)) (fun filesR -> (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__50) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__50)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__51) -> (let x = (Base_dDiag.C_Check_OkC ({ Frontend_dCanonical_dPkg.f_PackageSource_psName = (v_packageNameOf manifest); Frontend_dCanonical_dPkg.f_PackageSource_psExports = (v_exportsOf manifest); Frontend_dCanonical_dPkg.f_PackageSource_psDeps = ((B_dData_dList.v_map v_depKeyOf) (manifest).Frontend_dManifest.f_Manifest_manifestDependencies); Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb__51 })) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))))

# 196 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_contentHashOf = (fun (ps : Frontend_dCanonical_dPkg.t_PackageSource) -> (Base_dHash.v_contentAddress (Frontend_dCanonical_dPkg.v_encPackageContent (ps).Frontend_dCanonical_dPkg.f_PackageSource_psFiles)))

# 200 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_identityHashOf = (fun (ps : Frontend_dCanonical_dPkg.t_PackageSource) -> (Base_dHash.v_contentAddress (Frontend_dCanonical_dPkg.v_encPackageIdentity (Frontend_dCanonical_dPkg.v_identityOfSource ps))))
