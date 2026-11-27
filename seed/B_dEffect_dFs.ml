open Vuna_runtime
type t_FsOp = C_FsOp_ReadFile of (string) | C_FsOp_ReadFileRange of (string) * (int) * (int) | C_FsOp_WriteFile of (string) * (string) | C_FsOp_WriteFileAtomic of (string) * (string) | C_FsOp_ReadDir of (string) | C_FsOp_IsDirectory of (string) | C_FsOp_MakeDir of (string) | C_FsOp_RemoveFile of (string) | C_FsOp_FileExists of (string) | C_FsOp_FileMtime of (string) | C_FsOp_FileSize of (string) | C_FsOp_RemoveTree of (string) | C_FsOp_Rename of (string) * (string) | C_FsOp_Symlink of (string) * (string) | C_FsOp_MakeDirExclusive of (string)
and t_FsError = C_FsError_FsMissing of (string) | C_FsError_FsDenied of (string) | C_FsError_FsNoSpace of (string) | C_FsError_FsNotDir of (string) | C_FsError_FsIsDir of (string) | C_FsError_FsExists of (string) | C_FsError_FsIo of (string)
and t_FsErrorOp = C_FsErrorOp_FsFail of (t_FsError)

# 86 "Base/Effect/Fs.vuna"
let v_fsFail = (fun (n : string) (e : t_FsError) -> (((((B_dEffect_dCore.v_sendCoreId "fs-error") n) 1044473165) (dtp_effectId n)) (C_FsErrorOp_FsFail (e))))

# 86 "Base/Effect/Fs.vuna"
let v_fsFail_u_udirect = (fun (n : string) (e : t_FsError) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs-error") n) 1044473165) (dtp_effectId n)) (C_FsErrorOp_FsFail (e)))) _u_ueffTok))

# 90 "Base/Effect/Fs.vuna"
let v_fsErrorOfCode = (fun (mc0 : string) (mc1 : int) -> (if (mc1 = 1) then (C_FsError_FsMissing (mc0)) else (if (mc1 = 2) then (C_FsError_FsDenied (mc0)) else (if (mc1 = 3) then (C_FsError_FsNoSpace (mc0)) else (if (mc1 = 4) then (C_FsError_FsNotDir (mc0)) else (if (mc1 = 5) then (C_FsError_FsIsDir (mc0)) else (if (mc1 = 6) then (C_FsError_FsExists (mc0)) else (C_FsError_FsIo (mc0)))))))))

# 100 "Base/Effect/Fs.vuna"
let v_fsErrorText = (fun (mc0 : t_FsError) -> (match mc0 with
  | C_FsError_FsIo (dtb__0) -> (String.concat "" ["fs: "; dtb__0; ": host I/O error"])
  | C_FsError_FsExists (dtb__1) -> (String.concat "" ["fs: "; dtb__1; ": already exists"])
  | C_FsError_FsIsDir (dtb__2) -> (String.concat "" ["fs: "; dtb__2; ": is a directory"])
  | C_FsError_FsNotDir (dtb__3) -> (String.concat "" ["fs: "; dtb__3; ": not a directory"])
  | C_FsError_FsNoSpace (dtb__4) -> (String.concat "" ["fs: "; dtb__4; ": no space left on device"])
  | C_FsError_FsDenied (dtb__5) -> (String.concat "" ["fs: "; dtb__5; ": permission denied"])
  | C_FsError_FsMissing (dtb__6) -> (String.concat "" ["fs: "; dtb__6; ": no such file or directory"])
  | _ -> failwith "DT: impossible branch"
))

# 113 "Base/Effect/Fs.vuna"
let v_isDotEntry = (fun (name : string) -> (if (name = ".") then true else (name = "..")))

# 116 "Base/Effect/Fs.vuna"
let v_sortEntries = (fun (xs : string B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (a : string) (b : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) a) b))) ((B_dData_dList.v_filter (fun (name : string) -> (B_dData_dBool.v_not (v_isDotEntry name)))) xs)))

# 120 "Base/Effect/Fs.vuna"
let v_fsReadFile = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadFile (p))))

# 120 "Base/Effect/Fs.vuna"
let v_fsReadFile_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadFile (p)))) _u_ueffTok))

# 126 "Base/Effect/Fs.vuna"
let v_fsReadFileRange = (fun (n : string) (p : string) (offset : int) (length : int) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadFileRange (p, offset, length))))

# 126 "Base/Effect/Fs.vuna"
let v_fsReadFileRange_u_udirect = (fun (n : string) (p : string) (offset : int) (length : int) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadFileRange (p, offset, length)))) _u_ueffTok))

# 138 "Base/Effect/Fs.vuna"
let v_fsChunkStep = (fun (dtb_u_u31 : string) (dtb_u_u34 : (string, (int, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match dtb_u_u34 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u35; B_dData_dPair.f_Pair_second = dtb_u_u36 } -> (match dtb_u_u36 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u37; B_dData_dPair.f_Pair_second = dtb_u_u38 } -> (Obj.repr ((fun (dtb_u_u43 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u46 = (((((v_fsReadFileRange_u_udirect dtb_u_u31) dtb_u_u35) dtb_u_u37) dtb_u_u38) dtb_u_u43) in (if ((String.length dtb_u_u46) <= 0) then (let dtb_u_u48 = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u34 } in dtb_u_u48) else (let dtb_u_u51 = { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u46)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u35; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb_u_u37 + (String.length dtb_u_u46)); B_dData_dPair.f_Pair_second = dtb_u_u38 } } } in dtb_u_u51))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 138 "Base/Effect/Fs.vuna"
let v_fsChunkStep_u_udirect = (fun (n : string) (mc0 : (string, (int, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) _u_ueffTok -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u35; B_dData_dPair.f_Pair_second = dtb_u_u36 } -> (match dtb_u_u36 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u37; B_dData_dPair.f_Pair_second = dtb_u_u38 } -> (let dtb_u_u46 = (((((v_fsReadFileRange_u_udirect n) dtb_u_u35) dtb_u_u37) dtb_u_u38) _u_ueffTok) in (if ((String.length dtb_u_u46) <= 0) then (let dtb_u_u48 = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc0 } in dtb_u_u48) else (let dtb_u_u51 = { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u46)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u35; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb_u_u37 + (String.length dtb_u_u46)); B_dData_dPair.f_Pair_second = dtb_u_u38 } } } in dtb_u_u51)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 134 "Base/Effect/Fs.vuna"
let v_fsFileCursor = (fun (dtb_u_u53 : string) (dtb_u_u56 : string) (dtb_u_u57 : int) -> (let dtb_u_u59 = ((B_dEffect_dCursor.v_cursorOfState { B_dData_dPair.f_Pair_first = dtb_u_u56; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (if (dtb_u_u57 <= 0) then 65536 else dtb_u_u57) } }) (v_fsChunkStep dtb_u_u53)) in (Obj.repr ((fun (dtb_u_u60 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u59)))))

# 134 "Base/Effect/Fs.vuna"
let v_fsFileCursor_u_udirect = (fun (n : string) (path : string) (chunk : int) _u_ueffTok -> (let dtb_u_u59 = ((B_dEffect_dCursor.v_cursorOfState { B_dData_dPair.f_Pair_first = path; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (if (chunk <= 0) then 65536 else chunk) } }) (v_fsChunkStep n)) in dtb_u_u59))

# 150 "Base/Effect/Fs.vuna"
let v_fsWriteFile = (fun (n : string) (p : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_WriteFile (p, s))))

# 150 "Base/Effect/Fs.vuna"
let v_fsWriteFile_u_udirect = (fun (n : string) (p : string) (s : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_WriteFile (p, s)))) _u_ueffTok))

# 156 "Base/Effect/Fs.vuna"
let v_fsWriteFileAtomic = (fun (n : string) (p : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_WriteFileAtomic (p, s))))

# 156 "Base/Effect/Fs.vuna"
let v_fsWriteFileAtomic_u_udirect = (fun (n : string) (p : string) (s : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_WriteFileAtomic (p, s)))) _u_ueffTok))

# 162 "Base/Effect/Fs.vuna"
let v_fsReadDir = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadDir (p))))

# 162 "Base/Effect/Fs.vuna"
let v_fsReadDir_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadDir (p)))) _u_ueffTok))

# 168 "Base/Effect/Fs.vuna"
let v_fsIsDirectory = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_IsDirectory (p))))

# 168 "Base/Effect/Fs.vuna"
let v_fsIsDirectory_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_IsDirectory (p)))) _u_ueffTok))

# 174 "Base/Effect/Fs.vuna"
let v_fsMakeDir = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_MakeDir (p))))

# 174 "Base/Effect/Fs.vuna"
let v_fsMakeDir_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_MakeDir (p)))) _u_ueffTok))

# 180 "Base/Effect/Fs.vuna"
let v_fsRemoveFile = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_RemoveFile (p))))

# 180 "Base/Effect/Fs.vuna"
let v_fsRemoveFile_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_RemoveFile (p)))) _u_ueffTok))

# 186 "Base/Effect/Fs.vuna"
let v_fsFileExists = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileExists (p))))

# 186 "Base/Effect/Fs.vuna"
let v_fsFileExists_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileExists (p)))) _u_ueffTok))

# 190 "Base/Effect/Fs.vuna"
let v_fsFileMtime = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileMtime (p))))

# 190 "Base/Effect/Fs.vuna"
let v_fsFileMtime_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileMtime (p)))) _u_ueffTok))

# 194 "Base/Effect/Fs.vuna"
let v_fsFileSize = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileSize (p))))

# 194 "Base/Effect/Fs.vuna"
let v_fsFileSize_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileSize (p)))) _u_ueffTok))

# 198 "Base/Effect/Fs.vuna"
let v_fsRemoveTree = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_RemoveTree (p))))

# 198 "Base/Effect/Fs.vuna"
let v_fsRemoveTree_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_RemoveTree (p)))) _u_ueffTok))

# 202 "Base/Effect/Fs.vuna"
let v_fsRename = (fun (n : string) (src : string) (dst : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_Rename (src, dst))))

# 202 "Base/Effect/Fs.vuna"
let v_fsRename_u_udirect = (fun (n : string) (src : string) (dst : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_Rename (src, dst)))) _u_ueffTok))

# 206 "Base/Effect/Fs.vuna"
let v_fsSymlink = (fun (n : string) (target : string) (link : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_Symlink (target, link))))

# 206 "Base/Effect/Fs.vuna"
let v_fsSymlink_u_udirect = (fun (n : string) (target : string) (link : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_Symlink (target, link)))) _u_ueffTok))

# 210 "Base/Effect/Fs.vuna"
let v_fsMakeDirExclusive = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_MakeDirExclusive (p))))

# 210 "Base/Effect/Fs.vuna"
let v_fsMakeDirExclusive_u_udirect = (fun (n : string) (p : string) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_MakeDirExclusive (p)))) _u_ueffTok))

# 214 "Base/Effect/Fs.vuna"
let v_handleFs = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "fs") n) 371381598) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 214 "Base/Effect/Fs.vuna"
let v_handleFs_u_udirect = (fun (n : string) ret opH comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreId "fs") n) 371381598) (dtp_effectId n)) ret) (Obj.magic opH)) comp)) _u_ueffTok))

# 221 "Base/Effect/Fs.vuna"
let v_fsHostStatus = (B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 225 "Base/Effect/Fs.vuna"
let v_fsFailAt = (fun (e : t_FsError) -> (((((B_dEffect_dCore.v_sendCoreId "fs-error") "fs-error") 1044473165) 1044473165) (C_FsErrorOp_FsFail (e))))

# 225 "Base/Effect/Fs.vuna"
let v_fsFailAt_u_udirect = (fun (e : t_FsError) _u_ueffTok -> ((Obj.magic (((((B_dEffect_dCore.v_sendCoreId "fs-error") "fs-error") 1044473165) 1044473165) (C_FsErrorOp_FsFail (e)))) _u_ueffTok))

# 229 "Base/Effect/Fs.vuna"
let v_fsOpHIOHost = (fun (dtb_u_u132 : t_FsOp) dtb_u_u133 -> (match dtb_u_u132 with
  | C_FsOp_ReadFile (dtb_u_u134) -> (Obj.repr ((fun (dtb_u_u139 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u142 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFile dtio_0)) dtb_u_u134)) dtb_u_u139) in (let dtb_u_u148 = Obj.obj (v_fsHostStatus) in (let dtb_u_u150 = (dtb_u_u148 dtb_u_u139) in (if (dtb_u_u150 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("readFile " ^ dtb_u_u134)) dtb_u_u150))) dtb_u_u139) else ((Obj.magic ((Obj.magic dtb_u_u133) dtb_u_u142)) dtb_u_u139))))))))
  | C_FsOp_ReadFileRange (dtb_u_u151, dtb_u_u152, dtb_u_u153) -> (Obj.repr ((fun (dtb_u_u158 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u161 = ((B_dEffect_dHost.v_hostSync_u_udirect ((((fun dtio_0 dtio_1 dtio_2 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFileRange dtio_0 dtio_1 dtio_2)) dtb_u_u151) dtb_u_u152) dtb_u_u153)) dtb_u_u158) in (let dtb_u_u167 = Obj.obj (v_fsHostStatus) in (let dtb_u_u169 = (dtb_u_u167 dtb_u_u158) in (if (dtb_u_u169 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("readFileRange " ^ dtb_u_u151)) dtb_u_u169))) dtb_u_u158) else ((Obj.magic ((Obj.magic dtb_u_u133) dtb_u_u161)) dtb_u_u158))))))))
  | C_FsOp_WriteFile (dtb_u_u170, dtb_u_u171) -> (Obj.repr ((fun (dtb_u_u176 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u179 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFile dtio_0 dtio_1)) dtb_u_u170) dtb_u_u171)) dtb_u_u176) in (let dtb_u_u185 = Obj.obj (v_fsHostStatus) in (let dtb_u_u187 = (dtb_u_u185 dtb_u_u176) in (if (dtb_u_u187 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("writeFile " ^ dtb_u_u170)) dtb_u_u187))) dtb_u_u176) else ((Obj.magic ((Obj.magic dtb_u_u133) (bi_natFromInt (String.length dtb_u_u171)))) dtb_u_u176))))))))
  | C_FsOp_WriteFileAtomic (dtb_u_u188, dtb_u_u189) -> (Obj.repr ((fun (dtb_u_u194 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u197 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFileAtomic dtio_0 dtio_1)) dtb_u_u188) dtb_u_u189)) dtb_u_u194) in (let dtb_u_u203 = Obj.obj (v_fsHostStatus) in (let dtb_u_u205 = (dtb_u_u203 dtb_u_u194) in (if (dtb_u_u205 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("writeFileAtomic " ^ dtb_u_u188)) dtb_u_u205))) dtb_u_u194) else ((Obj.magic ((Obj.magic dtb_u_u133) (String.length dtb_u_u189))) dtb_u_u194))))))))
  | C_FsOp_ReadDir (dtb_u_u206) -> (Obj.repr ((fun (dtb_u_u211 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u214 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun p -> B_dData_dList.dtp_listOf (dtp_tryReadDir p)) dtio_0)) dtb_u_u206)) dtb_u_u211) in (let dtb_u_u220 = Obj.obj (v_fsHostStatus) in (let dtb_u_u222 = (dtb_u_u220 dtb_u_u211) in (if (dtb_u_u222 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("readDir " ^ dtb_u_u206)) dtb_u_u222))) dtb_u_u211) else ((Obj.magic ((Obj.magic dtb_u_u133) (v_sortEntries dtb_u_u214))) dtb_u_u211))))))))
  | C_FsOp_IsDirectory (dtb_u_u223) -> (Obj.repr ((fun (dtb_u_u228 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u231 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryIsDirectory dtio_0)) dtb_u_u223)) dtb_u_u228) in (let dtb_u_u237 = Obj.obj (v_fsHostStatus) in (let dtb_u_u239 = (dtb_u_u237 dtb_u_u228) in (if (dtb_u_u239 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("isDirectory " ^ dtb_u_u223)) dtb_u_u239))) dtb_u_u228) else ((Obj.magic ((Obj.magic dtb_u_u133) dtb_u_u231)) dtb_u_u228))))))))
  | C_FsOp_MakeDir (dtb_u_u240) -> (Obj.repr ((fun (dtb_u_u245 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u248 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDir dtio_0)) dtb_u_u240)) dtb_u_u245) in (let dtb_u_u254 = Obj.obj (v_fsHostStatus) in (let dtb_u_u256 = (dtb_u_u254 dtb_u_u245) in (if (dtb_u_u256 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("makeDir " ^ dtb_u_u240)) dtb_u_u256))) dtb_u_u245) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u245))))))))
  | C_FsOp_RemoveFile (dtb_u_u257) -> (Obj.repr ((fun (dtb_u_u262 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u265 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveFile dtio_0)) dtb_u_u257)) dtb_u_u262) in (let dtb_u_u271 = Obj.obj (v_fsHostStatus) in (let dtb_u_u273 = (dtb_u_u271 dtb_u_u262) in (if (dtb_u_u273 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("removeFile " ^ dtb_u_u257)) dtb_u_u273))) dtb_u_u262) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u262))))))))
  | C_FsOp_RemoveTree (dtb_u_u274) -> (Obj.repr ((fun (dtb_u_u279 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u282 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveTree dtio_0)) dtb_u_u274)) dtb_u_u279) in (let dtb_u_u288 = Obj.obj (v_fsHostStatus) in (let dtb_u_u290 = (dtb_u_u288 dtb_u_u279) in (if (dtb_u_u290 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("removeTree " ^ dtb_u_u274)) dtb_u_u290))) dtb_u_u279) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u279))))))))
  | C_FsOp_Rename (dtb_u_u291, dtb_u_u292) -> (Obj.repr ((fun (dtb_u_u297 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u300 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRename dtio_0 dtio_1)) dtb_u_u291) dtb_u_u292)) dtb_u_u297) in (let dtb_u_u306 = Obj.obj (v_fsHostStatus) in (let dtb_u_u308 = (dtb_u_u306 dtb_u_u297) in (if (dtb_u_u308 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["rename "; dtb_u_u291; " -> "; dtb_u_u292])) dtb_u_u308))) dtb_u_u297) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u297))))))))
  | C_FsOp_Symlink (dtb_u_u309, dtb_u_u310) -> (Obj.repr ((fun (dtb_u_u315 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u318 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_trySymlink dtio_0 dtio_1)) dtb_u_u309) dtb_u_u310)) dtb_u_u315) in (let dtb_u_u324 = Obj.obj (v_fsHostStatus) in (let dtb_u_u326 = (dtb_u_u324 dtb_u_u315) in (if (dtb_u_u326 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["symlink "; dtb_u_u309; " -> "; dtb_u_u310])) dtb_u_u326))) dtb_u_u315) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u315))))))))
  | C_FsOp_MakeDirExclusive (dtb_u_u327) -> (Obj.repr ((fun (dtb_u_u332 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u335 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDirExclusive dtio_0)) dtb_u_u327)) dtb_u_u332) in (let dtb_u_u341 = Obj.obj (v_fsHostStatus) in (let dtb_u_u343 = (dtb_u_u341 dtb_u_u332) in (if (dtb_u_u343 = 0) then ((Obj.magic ((Obj.magic dtb_u_u133) true)) dtb_u_u332) else (if (dtb_u_u343 = 6) then ((Obj.magic ((Obj.magic dtb_u_u133) false)) dtb_u_u332) else ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("makeDirExclusive " ^ dtb_u_u327)) dtb_u_u343))) dtb_u_u332)))))))))
  | C_FsOp_FileExists (dtb_u_u344) -> (Obj.repr ((fun (dtb_u_u349 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u352 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileExists dtio_0)) dtb_u_u344)) dtb_u_u349) in ((Obj.magic ((Obj.magic dtb_u_u133) dtb_u_u352)) dtb_u_u349)))))
  | C_FsOp_FileMtime (dtb_u_u353) -> (Obj.repr ((fun (dtb_u_u358 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u361 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileMtime dtio_0)) dtb_u_u353)) dtb_u_u358) in (let dtb_u_u367 = Obj.obj (v_fsHostStatus) in (let dtb_u_u369 = (dtb_u_u367 dtb_u_u358) in (if (dtb_u_u369 <> 0) then ((Obj.magic ((Obj.magic dtb_u_u133) B_dData_dMaybe.C_Maybe_Nothing)) dtb_u_u358) else ((Obj.magic ((Obj.magic dtb_u_u133) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u361)))) dtb_u_u358))))))))
  | C_FsOp_FileSize (dtb_u_u370) -> (Obj.repr ((fun (dtb_u_u375 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u376 = Obj.obj ((((fun dtb_u_u380 dtb_u_u381 -> (Obj.repr ((fun (dtb_u_u382 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u383 = Obj.obj (dtb_u_u381) in (dtb_u_u380 (dtb_u_u383 dtb_u_u382))))))) bi_natFromInt) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileSize dtio_0)) dtb_u_u370)))) in (let dtb_u_u384 = (dtb_u_u376 dtb_u_u375) in (let dtb_u_u390 = Obj.obj (v_fsHostStatus) in (let dtb_u_u392 = (dtb_u_u390 dtb_u_u375) in (if (dtb_u_u392 <> 0) then ((Obj.magic ((Obj.magic dtb_u_u133) B_dData_dMaybe.C_Maybe_Nothing)) dtb_u_u375) else ((Obj.magic ((Obj.magic dtb_u_u133) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u384)))) dtb_u_u375)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 229 "Base/Effect/Fs.vuna"
let v_fsOpHIOHost_u_udirect = (fun (op : t_FsOp) k _u_ueffTok -> (match op with
  | C_FsOp_ReadFile (dtb_u_u134) -> (let dtb_u_u142 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFile dtio_0)) dtb_u_u134)) _u_ueffTok) in (let dtb_u_u148 = Obj.obj (v_fsHostStatus) in (let dtb_u_u150 = (dtb_u_u148 _u_ueffTok) in (if (dtb_u_u150 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("readFile " ^ dtb_u_u134)) dtb_u_u150))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) dtb_u_u142)) _u_ueffTok)))))
  | C_FsOp_ReadFileRange (dtb_u_u151, dtb_u_u152, dtb_u_u153) -> (let dtb_u_u161 = ((B_dEffect_dHost.v_hostSync_u_udirect ((((fun dtio_0 dtio_1 dtio_2 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFileRange dtio_0 dtio_1 dtio_2)) dtb_u_u151) dtb_u_u152) dtb_u_u153)) _u_ueffTok) in (let dtb_u_u167 = Obj.obj (v_fsHostStatus) in (let dtb_u_u169 = (dtb_u_u167 _u_ueffTok) in (if (dtb_u_u169 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("readFileRange " ^ dtb_u_u151)) dtb_u_u169))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) dtb_u_u161)) _u_ueffTok)))))
  | C_FsOp_WriteFile (dtb_u_u170, dtb_u_u171) -> (let dtb_u_u179 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFile dtio_0 dtio_1)) dtb_u_u170) dtb_u_u171)) _u_ueffTok) in (let dtb_u_u185 = Obj.obj (v_fsHostStatus) in (let dtb_u_u187 = (dtb_u_u185 _u_ueffTok) in (if (dtb_u_u187 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("writeFile " ^ dtb_u_u170)) dtb_u_u187))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) (bi_natFromInt (String.length dtb_u_u171)))) _u_ueffTok)))))
  | C_FsOp_WriteFileAtomic (dtb_u_u188, dtb_u_u189) -> (let dtb_u_u197 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFileAtomic dtio_0 dtio_1)) dtb_u_u188) dtb_u_u189)) _u_ueffTok) in (let dtb_u_u203 = Obj.obj (v_fsHostStatus) in (let dtb_u_u205 = (dtb_u_u203 _u_ueffTok) in (if (dtb_u_u205 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("writeFileAtomic " ^ dtb_u_u188)) dtb_u_u205))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) (String.length dtb_u_u189))) _u_ueffTok)))))
  | C_FsOp_ReadDir (dtb_u_u206) -> (let dtb_u_u214 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun p -> B_dData_dList.dtp_listOf (dtp_tryReadDir p)) dtio_0)) dtb_u_u206)) _u_ueffTok) in (let dtb_u_u220 = Obj.obj (v_fsHostStatus) in (let dtb_u_u222 = (dtb_u_u220 _u_ueffTok) in (if (dtb_u_u222 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("readDir " ^ dtb_u_u206)) dtb_u_u222))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) (v_sortEntries dtb_u_u214))) _u_ueffTok)))))
  | C_FsOp_IsDirectory (dtb_u_u223) -> (let dtb_u_u231 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryIsDirectory dtio_0)) dtb_u_u223)) _u_ueffTok) in (let dtb_u_u237 = Obj.obj (v_fsHostStatus) in (let dtb_u_u239 = (dtb_u_u237 _u_ueffTok) in (if (dtb_u_u239 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("isDirectory " ^ dtb_u_u223)) dtb_u_u239))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) dtb_u_u231)) _u_ueffTok)))))
  | C_FsOp_MakeDir (dtb_u_u240) -> (let dtb_u_u248 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDir dtio_0)) dtb_u_u240)) _u_ueffTok) in (let dtb_u_u254 = Obj.obj (v_fsHostStatus) in (let dtb_u_u256 = (dtb_u_u254 _u_ueffTok) in (if (dtb_u_u256 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("makeDir " ^ dtb_u_u240)) dtb_u_u256))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) 0)) _u_ueffTok)))))
  | C_FsOp_RemoveFile (dtb_u_u257) -> (let dtb_u_u265 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveFile dtio_0)) dtb_u_u257)) _u_ueffTok) in (let dtb_u_u271 = Obj.obj (v_fsHostStatus) in (let dtb_u_u273 = (dtb_u_u271 _u_ueffTok) in (if (dtb_u_u273 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("removeFile " ^ dtb_u_u257)) dtb_u_u273))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) 0)) _u_ueffTok)))))
  | C_FsOp_RemoveTree (dtb_u_u274) -> (let dtb_u_u282 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveTree dtio_0)) dtb_u_u274)) _u_ueffTok) in (let dtb_u_u288 = Obj.obj (v_fsHostStatus) in (let dtb_u_u290 = (dtb_u_u288 _u_ueffTok) in (if (dtb_u_u290 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("removeTree " ^ dtb_u_u274)) dtb_u_u290))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) 0)) _u_ueffTok)))))
  | C_FsOp_Rename (dtb_u_u291, dtb_u_u292) -> (let dtb_u_u300 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRename dtio_0 dtio_1)) dtb_u_u291) dtb_u_u292)) _u_ueffTok) in (let dtb_u_u306 = Obj.obj (v_fsHostStatus) in (let dtb_u_u308 = (dtb_u_u306 _u_ueffTok) in (if (dtb_u_u308 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["rename "; dtb_u_u291; " -> "; dtb_u_u292])) dtb_u_u308))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) 0)) _u_ueffTok)))))
  | C_FsOp_Symlink (dtb_u_u309, dtb_u_u310) -> (let dtb_u_u318 = ((B_dEffect_dHost.v_hostSync_u_udirect (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_trySymlink dtio_0 dtio_1)) dtb_u_u309) dtb_u_u310)) _u_ueffTok) in (let dtb_u_u324 = Obj.obj (v_fsHostStatus) in (let dtb_u_u326 = (dtb_u_u324 _u_ueffTok) in (if (dtb_u_u326 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["symlink "; dtb_u_u309; " -> "; dtb_u_u310])) dtb_u_u326))) _u_ueffTok) else ((Obj.magic ((Obj.magic k) 0)) _u_ueffTok)))))
  | C_FsOp_MakeDirExclusive (dtb_u_u327) -> (let dtb_u_u335 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDirExclusive dtio_0)) dtb_u_u327)) _u_ueffTok) in (let dtb_u_u341 = Obj.obj (v_fsHostStatus) in (let dtb_u_u343 = (dtb_u_u341 _u_ueffTok) in (if (dtb_u_u343 = 0) then ((Obj.magic ((Obj.magic k) true)) _u_ueffTok) else (if (dtb_u_u343 = 6) then ((Obj.magic ((Obj.magic k) false)) _u_ueffTok) else ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("makeDirExclusive " ^ dtb_u_u327)) dtb_u_u343))) _u_ueffTok))))))
  | C_FsOp_FileExists (dtb_u_u344) -> (let dtb_u_u352 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileExists dtio_0)) dtb_u_u344)) _u_ueffTok) in ((Obj.magic ((Obj.magic k) dtb_u_u352)) _u_ueffTok))
  | C_FsOp_FileMtime (dtb_u_u353) -> (let dtb_u_u361 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileMtime dtio_0)) dtb_u_u353)) _u_ueffTok) in (let dtb_u_u367 = Obj.obj (v_fsHostStatus) in (let dtb_u_u369 = (dtb_u_u367 _u_ueffTok) in (if (dtb_u_u369 <> 0) then ((Obj.magic ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing)) _u_ueffTok) else ((Obj.magic ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u361)))) _u_ueffTok)))))
  | C_FsOp_FileSize (dtb_u_u370) -> (let dtb_u_u376 = Obj.obj ((((fun dtb_u_u380 dtb_u_u381 -> (Obj.repr ((fun (dtb_u_u382 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u383 = Obj.obj (dtb_u_u381) in (dtb_u_u380 (dtb_u_u383 dtb_u_u382))))))) bi_natFromInt) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileSize dtio_0)) dtb_u_u370)))) in (let dtb_u_u384 = (dtb_u_u376 _u_ueffTok) in (let dtb_u_u390 = Obj.obj (v_fsHostStatus) in (let dtb_u_u392 = (dtb_u_u390 _u_ueffTok) in (if (dtb_u_u392 <> 0) then ((Obj.magic ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing)) _u_ueffTok) else ((Obj.magic ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u384)))) _u_ueffTok))))))
  | _ -> failwith "DT: impossible branch"
))

# 313 "Base/Effect/Fs.vuna"
let v_handleFsHostHost = (fun (dtb_u_u395 : string) dtb_u_u396 -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs") dtb_u_u395) 371381598) (dtp_effectId dtb_u_u395)) (fun dtb_u_u397 -> (let dtb_u_u399 = dtb_u_u397 in (Obj.repr ((fun (dtb_u_u400 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u399)))))) v_fsOpHIOHost) dtb_u_u396))

# 313 "Base/Effect/Fs.vuna"
let v_handleFsHostHost_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "fs") n) 371381598) (dtp_effectId n)) (fun dtb_u_u397 -> (let dtb_u_u399 = dtb_u_u397 in (Obj.repr ((fun (dtb_u_u400 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u399)))))) v_fsOpHIOHost) comp)) _u_ueffTok))

# 319 "Base/Effect/Fs.vuna"
let v_runFsHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleFsHostHost "default") comp)))

# 319 "Base/Effect/Fs.vuna"
let v_runFsHost_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic (B_dEffect_dCore.v_joinEff ((v_handleFsHostHost "default") comp))) _u_ueffTok))

# 323 "Base/Effect/Fs.vuna"
let v_fsErrorRet = (fun a -> (B_dData_dResult.C_Result_Ok (a)))

# 327 "Base/Effect/Fs.vuna"
let v_fsErrorOpHR = (fun (op : t_FsErrorOp) _u -> (match op with
  | C_FsErrorOp_FsFail (dtb__93) -> (B_dData_dResult.C_Result_Err ((v_fsErrorText dtb__93)))
  | _ -> failwith "DT: impossible branch"
))

# 333 "Base/Effect/Fs.vuna"
let v_runFsError = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs-error") n) 1044473165) (dtp_effectId n)) v_fsErrorRet) v_fsErrorOpHR) comp))

# 333 "Base/Effect/Fs.vuna"
let v_runFsError_u_udirect = (fun (n : string) comp _u_ueffTok -> ((Obj.magic (((((((B_dEffect_dCore.v_handleCoreAtId "fs-error") n) 1044473165) (dtp_effectId n)) v_fsErrorRet) v_fsErrorOpHR) comp)) _u_ueffTok))

# 337 "Base/Effect/Fs.vuna"
let v_runFsResult = (fun comp -> ((v_runFsError "fs-error") (v_runFsHost comp)))

# 337 "Base/Effect/Fs.vuna"
let v_runFsResult_u_udirect = (fun comp _u_ueffTok -> ((Obj.magic ((v_runFsError "fs-error") (v_runFsHost comp))) _u_ueffTok))

# 341 "Base/Effect/Fs.vuna"
let v_runFsErrorHost = (fun dtb_u_u419 -> (Obj.repr ((fun (dtb_u_u424 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u427 = (((v_runFsError_u_udirect "fs-error") dtb_u_u419) dtb_u_u424) in (match dtb_u_u427 with
  | B_dData_dResult.C_Result_Ok (dtb_u_u428) -> (let dtb_u_u430 = dtb_u_u428 in dtb_u_u430)
  | B_dData_dResult.C_Result_Err (dtb_u_u432) -> (let dtb_u_u440 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) (String.concat "" ["vuna: "; dtb_u_u432; "\n"]))) dtb_u_u424) in (let dtb_u_u448 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1)) dtb_u_u424) in ((Obj.magic ((fun msg -> failwith msg) "unreachable: fs error handler")) dtb_u_u424)))
  | _ -> failwith "DT: impossible branch"
))))))

# 341 "Base/Effect/Fs.vuna"
let v_runFsErrorHost_u_udirect = (fun comp _u_ueffTok -> (let dtb_u_u427 = (((v_runFsError_u_udirect "fs-error") comp) _u_ueffTok) in (match dtb_u_u427 with
  | B_dData_dResult.C_Result_Ok (dtb_u_u428) -> (let dtb_u_u430 = dtb_u_u428 in dtb_u_u430)
  | B_dData_dResult.C_Result_Err (dtb_u_u432) -> (let dtb_u_u440 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) (String.concat "" ["vuna: "; dtb_u_u432; "\n"]))) _u_ueffTok) in (let dtb_u_u448 = ((B_dEffect_dHost.v_hostSync_u_udirect ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1)) _u_ueffTok) in ((Obj.magic ((fun msg -> failwith msg) "unreachable: fs error handler")) _u_ueffTok)))
  | _ -> failwith "DT: impossible branch"
)))
