open Vuna_runtime
# 25 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_skipSourceDir = (fun (dtb_u_u1 : string) -> (if (if (if (if (if (if (if (if (if (dtb_u_u1 = ".git") then true else (dtb_u_u1 = ".local")) then true else (dtb_u_u1 = ".output")) then true else (dtb_u_u1 = ".vuna")) then true else (dtb_u_u1 = ".direnv")) then true else (dtb_u_u1 = "node_modules")) then true else (dtb_u_u1 = "seed")) then true else (dtb_u_u1 = "_scratch")) then true else (dtb_u_u1 = "result")) then true else (dtb_u_u1 = "corpus")))

# 42 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_normalizeHash = (fun (dtb_u_u2 : string) -> (if ((B_dData_dString.v_startsWith "sha256:") dtb_u_u2) then (((B_dData_dString.v_substring 7) 64) dtb_u_u2) else dtb_u_u2))

# 46 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_verifyHash = (fun (dtb_u_u3 : string) (dtb_u_u4 : string) -> ((v_normalizeHash dtb_u_u3) = (v_normalizeHash dtb_u_u4)))

# 76 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_pkgSourceDepth = 4096

# 79 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_readManifestFile = (fun (dtb_u_u5 : string) (dtb_u_u8 : string) -> (Obj.repr ((fun (dtb_u_u13 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u16 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u5) (dtb_u_u8 ^ "/vuna.toml")) dtb_u_u13) in (if dtb_u_u16 then (let dtb_u_u24 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u5) (dtb_u_u8 ^ "/vuna.toml")) dtb_u_u13) in (let dtb_u_u26 = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dCanonical_dPkg.f_PackageFile_pfPath = "vuna.toml"; Frontend_dCanonical_dPkg.f_PackageFile_pfContent = dtb_u_u24 }, B_dData_dList.C_List_Nil)) in dtb_u_u26)) else (let dtb_u_u29 = B_dData_dList.C_List_Nil in dtb_u_u29)))))))

# 79 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_readManifestFile_u_udirect = (fun (nFs : string) (root : string) _u_ueffTok -> (let dtb_u_u16 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) (root ^ "/vuna.toml")) _u_ueffTok) in (if dtb_u_u16 then (let dtb_u_u24 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) (root ^ "/vuna.toml")) _u_ueffTok) in (let dtb_u_u26 = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dCanonical_dPkg.f_PackageFile_pfPath = "vuna.toml"; Frontend_dCanonical_dPkg.f_PackageFile_pfContent = dtb_u_u24 }, B_dData_dList.C_List_Nil)) in dtb_u_u26)) else (let dtb_u_u29 = B_dData_dList.C_List_Nil in dtb_u_u29))))

# 90 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let rec v_collectDirFiles = (fun (dtb_u_u31 : string) (dtb_u_u34 : Base_dIgnore.t_IgnoreContext) (dtb_u_u35 : int) (dtb_u_u36 : string) (dtb_u_u37 : string) -> (if (dtb_u_u35 <= 0) then (let dtb_u_u39 = (Base_dDiag.v_icFuel "package file collection") in (Obj.repr ((fun (dtb_u_u40 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u39)))) else (let dtb_u_u41 = (if (dtb_u_u37 = "") then dtb_u_u36 else (String.concat "" [dtb_u_u36; "/"; dtb_u_u37])) in (Obj.repr ((fun (dtb_u_u46 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u49 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u31) dtb_u_u41) dtb_u_u46) in (let dtb_u_u55 = Obj.obj ((if dtb_u_u49 then ((B_dEffect_dFs.v_fsIsDirectory dtb_u_u31) dtb_u_u41) else (let dtb_u_u58 = false in (Obj.repr ((fun (dtb_u_u59 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u58)))))) in (let dtb_u_u60 = (dtb_u_u55 dtb_u_u46) in (if (if dtb_u_u49 then dtb_u_u60 else false) then (let dtb_u_u68 = (((((Base_dIgnore.v_loadIgnoreFile_u_udirect dtb_u_u31) dtb_u_u41) ((Base_dIgnore.v_ignorePathOf dtb_u_u34) dtb_u_u37)) dtb_u_u34) dtb_u_u46) in (let dtb_u_u76 = (((B_dEffect_dFs.v_fsReadDir_u_udirect dtb_u_u31) dtb_u_u41) dtb_u_u46) in ((Obj.magic ((((((v_collectNames dtb_u_u31) dtb_u_u68) dtb_u_u35) dtb_u_u36) dtb_u_u37) dtb_u_u76)) dtb_u_u46))) else (let dtb_u_u78 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u78)))))))))))
# 108 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_collectNames = (fun (dtb_u_u80 : string) (dtb_u_u83 : Base_dIgnore.t_IgnoreContext) (dtb_u_u84 : int) (dtb_u_u85 : string) (dtb_u_u86 : string) (dtb_u_u87 : string B_dData_dList.t_List) -> (match dtb_u_u87 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u88, dtb_u_u89) -> (if (dtb_u_u84 <= 0) then (let dtb_u_u91 = (Base_dDiag.v_icFuel "package file collection") in (Obj.repr ((fun (dtb_u_u92 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u91)))) else (Obj.repr ((fun (dtb_u_u97 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u100 = (((((((v_walkName_u_udirect dtb_u_u80) dtb_u_u83) dtb_u_u84) dtb_u_u85) dtb_u_u86) dtb_u_u88) dtb_u_u97) in (match dtb_u_u100 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u101) -> (let dtb_u_u103 = (Base_dDiag.C_Check_ErrC (dtb_u_u101)) in dtb_u_u103)
  | Base_dDiag.C_Check_OkC (dtb_u_u105) -> (let dtb_u_u113 = (((((((v_collectNames_u_udirect dtb_u_u80) dtb_u_u83) dtb_u_u84) dtb_u_u85) dtb_u_u86) dtb_u_u89) dtb_u_u97) in (match dtb_u_u113 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u114) -> (let dtb_u_u116 = (Base_dDiag.C_Check_ErrC (dtb_u_u114)) in dtb_u_u116)
  | Base_dDiag.C_Check_OkC (dtb_u_u118) -> (let dtb_u_u120 = (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u105) dtb_u_u118))) in dtb_u_u120)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u123 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u124 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u123))))
  | _ -> failwith "DT: impossible branch"
))
# 125 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_walkName = (fun (dtb_u_u125 : string) (dtb_u_u128 : Base_dIgnore.t_IgnoreContext) (dtb_u_u129 : int) (dtb_u_u130 : string) (dtb_u_u131 : string) (dtb_u_u132 : string) -> (if (dtb_u_u129 <= 0) then (let dtb_u_u134 = (Base_dDiag.v_icFuel "package file collection") in (Obj.repr ((fun (dtb_u_u135 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u134)))) else (if (dtb_u_u132 = ".") then (let dtb_u_u137 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u138 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u137)))) else (if (dtb_u_u132 = "..") then (let dtb_u_u140 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u141 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u140)))) else (if (v_skipSourceDir dtb_u_u132) then (let dtb_u_u143 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u144 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u143)))) else (let dtb_u_u145 = (if (dtb_u_u131 = "") then dtb_u_u132 else (String.concat "" [dtb_u_u131; "/"; dtb_u_u132])) in (let dtb_u_u146 = (String.concat "" [dtb_u_u130; "/"; dtb_u_u145]) in (if (((Base_dIgnore.v_isIgnored dtb_u_u128) dtb_u_u145) false) then (let dtb_u_u148 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u149 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u148)))) else (Obj.repr ((fun (dtb_u_u154 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u157 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect dtb_u_u125) dtb_u_u146) dtb_u_u154) in (if dtb_u_u157 then (if (((Base_dIgnore.v_isIgnored dtb_u_u128) dtb_u_u145) true) then (let dtb_u_u159 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u159) else ((Obj.magic (((((v_collectDirFiles dtb_u_u125) dtb_u_u128) (dtb_u_u129 - 1)) dtb_u_u130) dtb_u_u145)) dtb_u_u154)) else (if ((B_dData_dString.v_endsWith ".vuna") dtb_u_u132) then (let dtb_u_u168 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u125) dtb_u_u146) dtb_u_u154) in (let dtb_u_u170 = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dCanonical_dPkg.f_PackageFile_pfPath = dtb_u_u145; Frontend_dCanonical_dPkg.f_PackageFile_pfContent = dtb_u_u168 }, B_dData_dList.C_List_Nil)))) in dtb_u_u170)) else (let dtb_u_u173 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u173)))))))))))))))
# 90 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_collectDirFiles_u_udirect = (fun (nFs : string) (ctx : Base_dIgnore.t_IgnoreContext) (fuel : int) (root : string) (rel : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u39 = (Base_dDiag.v_icFuel "package file collection") in dtb_u_u39) else (let dtb_u_u41 = (if (rel = "") then root else (String.concat "" [root; "/"; rel])) in (let dtb_u_u49 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u41) _u_ueffTok) in (let dtb_u_u55 = Obj.obj ((if dtb_u_u49 then ((B_dEffect_dFs.v_fsIsDirectory nFs) dtb_u_u41) else (let dtb_u_u58 = false in (Obj.repr ((fun (dtb_u_u59 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u58)))))) in (let dtb_u_u60 = (dtb_u_u55 _u_ueffTok) in (if (if dtb_u_u49 then dtb_u_u60 else false) then (let dtb_u_u68 = (((((Base_dIgnore.v_loadIgnoreFile_u_udirect nFs) dtb_u_u41) ((Base_dIgnore.v_ignorePathOf ctx) rel)) ctx) _u_ueffTok) in (let dtb_u_u76 = (((B_dEffect_dFs.v_fsReadDir_u_udirect nFs) dtb_u_u41) _u_ueffTok) in ((Obj.magic ((((((v_collectNames nFs) dtb_u_u68) fuel) root) rel) dtb_u_u76)) _u_ueffTok))) else (let dtb_u_u78 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u78))))))))
# 108 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_collectNames_u_udirect = (fun (nFs : string) (mc0 : Base_dIgnore.t_IgnoreContext) (mc1 : int) (mc2 : string) (mc3 : string) (mc4 : string B_dData_dList.t_List) _u_ueffTok -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u88, dtb_u_u89) -> (if (mc1 <= 0) then (let dtb_u_u91 = (Base_dDiag.v_icFuel "package file collection") in dtb_u_u91) else (let dtb_u_u100 = (((((((v_walkName_u_udirect nFs) mc0) mc1) mc2) mc3) dtb_u_u88) _u_ueffTok) in (match dtb_u_u100 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u101) -> (let dtb_u_u103 = (Base_dDiag.C_Check_ErrC (dtb_u_u101)) in dtb_u_u103)
  | Base_dDiag.C_Check_OkC (dtb_u_u105) -> (let dtb_u_u113 = (((((((v_collectNames_u_udirect nFs) mc0) mc1) mc2) mc3) dtb_u_u89) _u_ueffTok) in (match dtb_u_u113 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u114) -> (let dtb_u_u116 = (Base_dDiag.C_Check_ErrC (dtb_u_u114)) in dtb_u_u116)
  | Base_dDiag.C_Check_OkC (dtb_u_u118) -> (let dtb_u_u120 = (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u105) dtb_u_u118))) in dtb_u_u120)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u123 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u123)
  | _ -> failwith "DT: impossible branch"
))
# 125 "Vuna/Compiler/Frontend/Packages/Source.vuna"
and v_walkName_u_udirect = (fun (nFs : string) (ctx : Base_dIgnore.t_IgnoreContext) (fuel : int) (root : string) (rel : string) (name : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u134 = (Base_dDiag.v_icFuel "package file collection") in dtb_u_u134) else (if (name = ".") then (let dtb_u_u137 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u137) else (if (name = "..") then (let dtb_u_u140 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u140) else (if (v_skipSourceDir name) then (let dtb_u_u143 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u143) else (let dtb_u_u145 = (if (rel = "") then name else (String.concat "" [rel; "/"; name])) in (let dtb_u_u146 = (String.concat "" [root; "/"; dtb_u_u145]) in (if (((Base_dIgnore.v_isIgnored ctx) dtb_u_u145) false) then (let dtb_u_u148 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u148) else (let dtb_u_u157 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect nFs) dtb_u_u146) _u_ueffTok) in (if dtb_u_u157 then (if (((Base_dIgnore.v_isIgnored ctx) dtb_u_u145) true) then (let dtb_u_u159 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u159) else ((Obj.magic (((((v_collectDirFiles nFs) ctx) (fuel - 1)) root) dtb_u_u145)) _u_ueffTok)) else (if ((B_dData_dString.v_endsWith ".vuna") name) then (let dtb_u_u168 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u146) _u_ueffTok) in (let dtb_u_u170 = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dCanonical_dPkg.f_PackageFile_pfPath = dtb_u_u145; Frontend_dCanonical_dPkg.f_PackageFile_pfContent = dtb_u_u168 }, B_dData_dList.C_List_Nil)))) in dtb_u_u170)) else (let dtb_u_u173 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u173))))))))))))

# 154 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_filePathLe = (fun (dtb_u_u175 : Frontend_dCanonical_dPkg.t_PackageFile) (dtb_u_u176 : Frontend_dCanonical_dPkg.t_PackageFile) -> ((dtb_u_u175).Frontend_dCanonical_dPkg.f_PackageFile_pfPath <= (dtb_u_u176).Frontend_dCanonical_dPkg.f_PackageFile_pfPath))

# 157 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_sortByPath = (fun (dtb_u_u177 : Frontend_dCanonical_dPkg.t_PackageFile B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_filePathLe) dtb_u_u177))

# 52 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageFilesEff = (fun (dtb_u_u178 : string) (dtb_u_u181 : string) -> (Obj.repr ((fun (dtb_u_u186 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u189 = (((Base_dIgnore.v_ignoreContextEff_u_udirect dtb_u_u178) dtb_u_u181) dtb_u_u186) in (let dtb_u_u197 = (((((Base_dIgnore.v_loadIgnoreFile_u_udirect dtb_u_u178) dtb_u_u181) ((Base_dIgnore.v_ignorePathOf dtb_u_u189) "")) dtb_u_u189) dtb_u_u186) in (let dtb_u_u205 = (((v_readManifestFile_u_udirect dtb_u_u178) dtb_u_u181) dtb_u_u186) in (let dtb_u_u213 = ((((((v_collectDirFiles_u_udirect dtb_u_u178) dtb_u_u197) v_pkgSourceDepth) dtb_u_u181) "lib") dtb_u_u186) in (match dtb_u_u213 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u214) -> (let dtb_u_u216 = (Base_dDiag.C_Check_ErrC (dtb_u_u214)) in dtb_u_u216)
  | Base_dDiag.C_Check_OkC (dtb_u_u218) -> (let dtb_u_u226 = ((((((v_collectDirFiles_u_udirect dtb_u_u178) dtb_u_u197) v_pkgSourceDepth) dtb_u_u181) "app") dtb_u_u186) in (match dtb_u_u226 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u227) -> (let dtb_u_u229 = (Base_dDiag.C_Check_ErrC (dtb_u_u227)) in dtb_u_u229)
  | Base_dDiag.C_Check_OkC (dtb_u_u231) -> (let dtb_u_u239 = ((((((v_collectDirFiles_u_udirect dtb_u_u178) dtb_u_u197) v_pkgSourceDepth) dtb_u_u181) "test") dtb_u_u186) in (match dtb_u_u239 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u240) -> (let dtb_u_u242 = (Base_dDiag.C_Check_ErrC (dtb_u_u240)) in dtb_u_u242)
  | Base_dDiag.C_Check_OkC (dtb_u_u244) -> (let dtb_u_u246 = (Base_dDiag.C_Check_OkC ((v_sortByPath ((B_dData_dList.v_append dtb_u_u205) ((B_dData_dList.v_append dtb_u_u218) ((B_dData_dList.v_append dtb_u_u231) dtb_u_u244)))))) in dtb_u_u246)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 52 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageFilesEff_u_udirect = (fun (nFs : string) (root : string) _u_ueffTok -> (let dtb_u_u189 = (((Base_dIgnore.v_ignoreContextEff_u_udirect nFs) root) _u_ueffTok) in (let dtb_u_u197 = (((((Base_dIgnore.v_loadIgnoreFile_u_udirect nFs) root) ((Base_dIgnore.v_ignorePathOf dtb_u_u189) "")) dtb_u_u189) _u_ueffTok) in (let dtb_u_u205 = (((v_readManifestFile_u_udirect nFs) root) _u_ueffTok) in (let dtb_u_u213 = ((((((v_collectDirFiles_u_udirect nFs) dtb_u_u197) v_pkgSourceDepth) root) "lib") _u_ueffTok) in (match dtb_u_u213 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u214) -> (let dtb_u_u216 = (Base_dDiag.C_Check_ErrC (dtb_u_u214)) in dtb_u_u216)
  | Base_dDiag.C_Check_OkC (dtb_u_u218) -> (let dtb_u_u226 = ((((((v_collectDirFiles_u_udirect nFs) dtb_u_u197) v_pkgSourceDepth) root) "app") _u_ueffTok) in (match dtb_u_u226 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u227) -> (let dtb_u_u229 = (Base_dDiag.C_Check_ErrC (dtb_u_u227)) in dtb_u_u229)
  | Base_dDiag.C_Check_OkC (dtb_u_u231) -> (let dtb_u_u239 = ((((((v_collectDirFiles_u_udirect nFs) dtb_u_u197) v_pkgSourceDepth) root) "test") _u_ueffTok) in (match dtb_u_u239 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u240) -> (let dtb_u_u242 = (Base_dDiag.C_Check_ErrC (dtb_u_u240)) in dtb_u_u242)
  | Base_dDiag.C_Check_OkC (dtb_u_u244) -> (let dtb_u_u246 = (Base_dDiag.C_Check_OkC ((v_sortByPath ((B_dData_dList.v_append dtb_u_u205) ((B_dData_dList.v_append dtb_u_u218) ((B_dData_dList.v_append dtb_u_u231) dtb_u_u244)))))) in dtb_u_u246)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 169 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageNameOf = (fun (dtb_u_u248 : Frontend_dManifest.t_Manifest) -> (match (dtb_u_u248).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u249) -> dtb_u_u249
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_exportsOf = (fun (dtb_u_u250 : Frontend_dManifest.t_Manifest) -> (match (dtb_u_u250).Frontend_dManifest.f_Manifest_manifestExports with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u251) -> dtb_u_u251
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_depKeyOf = (fun (dtb_u_u252 : Frontend_dManifest.t_Dependency) -> (let dtb_u_u253 = (match (Frontend_dManifest.v_depIdentityOf dtb_u_u252) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u254) -> (v_normalizeHash dtb_u_u254)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Frontend_dManifest.v_depHashOf dtb_u_u252) with
  | B_dData_dMaybe.C_Maybe_Nothing -> "path"
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u255) -> (v_normalizeHash dtb_u_u255)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in { B_dData_dPair.f_Pair_first = (Frontend_dManifest.v_depAliasOf dtb_u_u252); B_dData_dPair.f_Pair_second = dtb_u_u253 }))

# 161 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageSourceEff = (fun (dtb_u_u256 : string) (dtb_u_u259 : string) (dtb_u_u260 : Frontend_dManifest.t_Manifest) -> (Obj.repr ((fun (dtb_u_u265 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u268 = (((v_packageFilesEff_u_udirect dtb_u_u256) dtb_u_u259) dtb_u_u265) in (match dtb_u_u268 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u269) -> (let dtb_u_u271 = (Base_dDiag.C_Check_ErrC (dtb_u_u269)) in dtb_u_u271)
  | Base_dDiag.C_Check_OkC (dtb_u_u273) -> (let dtb_u_u275 = (Base_dDiag.C_Check_OkC ({ Frontend_dCanonical_dPkg.f_PackageSource_psName = (v_packageNameOf dtb_u_u260); Frontend_dCanonical_dPkg.f_PackageSource_psExports = (v_exportsOf dtb_u_u260); Frontend_dCanonical_dPkg.f_PackageSource_psDeps = ((B_dData_dList.v_map v_depKeyOf) (dtb_u_u260).Frontend_dManifest.f_Manifest_manifestDependencies); Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb_u_u273 })) in dtb_u_u275)
  | _ -> failwith "DT: impossible branch"
))))))

# 161 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_packageSourceEff_u_udirect = (fun (nFs : string) (root : string) (manifest : Frontend_dManifest.t_Manifest) _u_ueffTok -> (let dtb_u_u268 = (((v_packageFilesEff_u_udirect nFs) root) _u_ueffTok) in (match dtb_u_u268 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u269) -> (let dtb_u_u271 = (Base_dDiag.C_Check_ErrC (dtb_u_u269)) in dtb_u_u271)
  | Base_dDiag.C_Check_OkC (dtb_u_u273) -> (let dtb_u_u275 = (Base_dDiag.C_Check_OkC ({ Frontend_dCanonical_dPkg.f_PackageSource_psName = (v_packageNameOf manifest); Frontend_dCanonical_dPkg.f_PackageSource_psExports = (v_exportsOf manifest); Frontend_dCanonical_dPkg.f_PackageSource_psDeps = ((B_dData_dList.v_map v_depKeyOf) (manifest).Frontend_dManifest.f_Manifest_manifestDependencies); Frontend_dCanonical_dPkg.f_PackageSource_psFiles = dtb_u_u273 })) in dtb_u_u275)
  | _ -> failwith "DT: impossible branch"
)))

# 196 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_contentHashOf = (fun (dtb_u_u277 : Frontend_dCanonical_dPkg.t_PackageSource) -> (Base_dHash.v_contentAddress (Frontend_dCanonical_dPkg.v_encPackageContent (dtb_u_u277).Frontend_dCanonical_dPkg.f_PackageSource_psFiles)))

# 200 "Vuna/Compiler/Frontend/Packages/Source.vuna"
let v_identityHashOf = (fun (dtb_u_u278 : Frontend_dCanonical_dPkg.t_PackageSource) -> (Base_dHash.v_contentAddress (Frontend_dCanonical_dPkg.v_encPackageIdentity (Frontend_dCanonical_dPkg.v_identityOfSource dtb_u_u278))))
