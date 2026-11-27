open Vuna_runtime
type t_FsOp = C_FsOp_ReadFile of (string) | C_FsOp_ReadFileRange of (string) * (int) * (int) | C_FsOp_WriteFile of (string) * (string) | C_FsOp_WriteFileAtomic of (string) * (string) | C_FsOp_ReadDir of (string) | C_FsOp_IsDirectory of (string) | C_FsOp_MakeDir of (string) | C_FsOp_RemoveFile of (string) | C_FsOp_FileExists of (string) | C_FsOp_FileMtime of (string) | C_FsOp_FileSize of (string) | C_FsOp_RemoveTree of (string) | C_FsOp_Rename of (string) * (string) | C_FsOp_Symlink of (string) * (string) | C_FsOp_MakeDirExclusive of (string)
and t_FsError = C_FsError_FsMissing of (string) | C_FsError_FsDenied of (string) | C_FsError_FsNoSpace of (string) | C_FsError_FsNotDir of (string) | C_FsError_FsIsDir of (string) | C_FsError_FsExists of (string) | C_FsError_FsIo of (string)
and t_FsErrorOp = C_FsErrorOp_FsFail of (t_FsError)

# 86 "Base/Effect/Fs.vuna"
let v_fsFail = (fun (n : string) (e : t_FsError) -> (((((B_dEffect_dCore.v_sendCoreId "fs-error") n) 1044473165) (dtp_effectId n)) (C_FsErrorOp_FsFail (e))))

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

# 126 "Base/Effect/Fs.vuna"
let v_fsReadFileRange = (fun (n : string) (p : string) (offset : int) (length : int) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadFileRange (p, offset, length))))

# 138 "Base/Effect/Fs.vuna"
let v_fsChunkStep = (fun (n : string) (mc0 : (string, (int, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = dtb__8 } -> (match dtb__8 with
  | { B_dData_dPair.f_Pair_first = dtb__9; B_dData_dPair.f_Pair_second = dtb__10 } -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__11 = Obj.obj (e) in (let dtb__12 = Obj.obj ((k (dtb__11 u))) in (dtb__12 u)))))) ((((v_fsReadFileRange n) dtb__7) dtb__9) dtb__10)) (fun (s : string) -> (if ((String.length s) <= 0) then (let x = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc0 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let x = { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (s)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__9 + (String.length s)); B_dData_dPair.f_Pair_second = dtb__10 } } } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 134 "Base/Effect/Fs.vuna"
let v_fsFileCursor = (fun (n : string) (path : string) (chunk : int) -> (let x = ((B_dEffect_dCursor.v_cursorOfState { B_dData_dPair.f_Pair_first = path; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (if (chunk <= 0) then 65536 else chunk) } }) (v_fsChunkStep n)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))

# 150 "Base/Effect/Fs.vuna"
let v_fsWriteFile = (fun (n : string) (p : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_WriteFile (p, s))))

# 156 "Base/Effect/Fs.vuna"
let v_fsWriteFileAtomic = (fun (n : string) (p : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_WriteFileAtomic (p, s))))

# 162 "Base/Effect/Fs.vuna"
let v_fsReadDir = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadDir (p))))

# 168 "Base/Effect/Fs.vuna"
let v_fsIsDirectory = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_IsDirectory (p))))

# 174 "Base/Effect/Fs.vuna"
let v_fsMakeDir = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_MakeDir (p))))

# 180 "Base/Effect/Fs.vuna"
let v_fsRemoveFile = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_RemoveFile (p))))

# 186 "Base/Effect/Fs.vuna"
let v_fsFileExists = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileExists (p))))

# 190 "Base/Effect/Fs.vuna"
let v_fsFileMtime = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileMtime (p))))

# 194 "Base/Effect/Fs.vuna"
let v_fsFileSize = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileSize (p))))

# 198 "Base/Effect/Fs.vuna"
let v_fsRemoveTree = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_RemoveTree (p))))

# 202 "Base/Effect/Fs.vuna"
let v_fsRename = (fun (n : string) (src : string) (dst : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_Rename (src, dst))))

# 206 "Base/Effect/Fs.vuna"
let v_fsSymlink = (fun (n : string) (target : string) (link : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_Symlink (target, link))))

# 210 "Base/Effect/Fs.vuna"
let v_fsMakeDirExclusive = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_MakeDirExclusive (p))))

# 214 "Base/Effect/Fs.vuna"
let v_handleFs = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "fs") n) 371381598) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 221 "Base/Effect/Fs.vuna"
let v_fsHostStatus = (B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 225 "Base/Effect/Fs.vuna"
let v_fsFailAt = (fun (e : t_FsError) -> (((((B_dEffect_dCore.v_sendCoreId "fs-error") "fs-error") 1044473165) 1044473165) (C_FsErrorOp_FsFail (e))))

# 229 "Base/Effect/Fs.vuna"
let v_fsOpHIOHost = (fun (op : t_FsOp) k -> (match op with
  | C_FsOp_ReadFile (dtb__13) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__14 = Obj.obj (e) in (let dtb__15 = Obj.obj ((k (dtb__14 u))) in (dtb__15 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFile dtio_0)) dtb__13))) (fun s -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__16 = Obj.obj (e) in (let dtb__17 = Obj.obj ((k (dtb__16 u))) in (dtb__17 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("readFile " ^ dtb__13)) ok)) else ((Obj.magic k) s))))))
  | C_FsOp_ReadFileRange (dtb__18, dtb__19, dtb__20) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__21 = Obj.obj (e) in (let dtb__22 = Obj.obj ((k (dtb__21 u))) in (dtb__22 u)))))) (B_dEffect_dHost.v_hostSync ((((fun dtio_0 dtio_1 dtio_2 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFileRange dtio_0 dtio_1 dtio_2)) dtb__18) dtb__19) dtb__20))) (fun s -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__23 = Obj.obj (e) in (let dtb__24 = Obj.obj ((k (dtb__23 u))) in (dtb__24 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("readFileRange " ^ dtb__18)) ok)) else ((Obj.magic k) s))))))
  | C_FsOp_WriteFile (dtb__25, dtb__26) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__27 = Obj.obj (e) in (let dtb__28 = Obj.obj ((k (dtb__27 u))) in (dtb__28 u)))))) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFile dtio_0 dtio_1)) dtb__25) dtb__26))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__29 = Obj.obj (e) in (let dtb__30 = Obj.obj ((k (dtb__29 u))) in (dtb__30 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("writeFile " ^ dtb__25)) ok)) else ((Obj.magic k) (bi_natFromInt (String.length dtb__26))))))))
  | C_FsOp_WriteFileAtomic (dtb__31, dtb__32) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__33 = Obj.obj (e) in (let dtb__34 = Obj.obj ((k (dtb__33 u))) in (dtb__34 u)))))) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFileAtomic dtio_0 dtio_1)) dtb__31) dtb__32))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__35 = Obj.obj (e) in (let dtb__36 = Obj.obj ((k (dtb__35 u))) in (dtb__36 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("writeFileAtomic " ^ dtb__31)) ok)) else ((Obj.magic k) (String.length dtb__32)))))))
  | C_FsOp_ReadDir (dtb__37) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__38 = Obj.obj (e) in (let dtb__39 = Obj.obj ((k (dtb__38 u))) in (dtb__39 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun p -> B_dData_dList.dtp_listOf (dtp_tryReadDir p)) dtio_0)) dtb__37))) (fun xs -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__40 = Obj.obj (e) in (let dtb__41 = Obj.obj ((k (dtb__40 u))) in (dtb__41 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("readDir " ^ dtb__37)) ok)) else ((Obj.magic k) (v_sortEntries xs)))))))
  | C_FsOp_IsDirectory (dtb__42) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__43 = Obj.obj (e) in (let dtb__44 = Obj.obj ((k (dtb__43 u))) in (dtb__44 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryIsDirectory dtio_0)) dtb__42))) (fun b -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__45 = Obj.obj (e) in (let dtb__46 = Obj.obj ((k (dtb__45 u))) in (dtb__46 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("isDirectory " ^ dtb__42)) ok)) else ((Obj.magic k) b))))))
  | C_FsOp_MakeDir (dtb__47) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__48 = Obj.obj (e) in (let dtb__49 = Obj.obj ((k (dtb__48 u))) in (dtb__49 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDir dtio_0)) dtb__47))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__50 = Obj.obj (e) in (let dtb__51 = Obj.obj ((k (dtb__50 u))) in (dtb__51 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("makeDir " ^ dtb__47)) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_RemoveFile (dtb__52) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__53 = Obj.obj (e) in (let dtb__54 = Obj.obj ((k (dtb__53 u))) in (dtb__54 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveFile dtio_0)) dtb__52))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__55 = Obj.obj (e) in (let dtb__56 = Obj.obj ((k (dtb__55 u))) in (dtb__56 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("removeFile " ^ dtb__52)) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_RemoveTree (dtb__57) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__58 = Obj.obj (e) in (let dtb__59 = Obj.obj ((k (dtb__58 u))) in (dtb__59 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveTree dtio_0)) dtb__57))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__60 = Obj.obj (e) in (let dtb__61 = Obj.obj ((k (dtb__60 u))) in (dtb__61 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("removeTree " ^ dtb__57)) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_Rename (dtb__62, dtb__63) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__64 = Obj.obj (e) in (let dtb__65 = Obj.obj ((k (dtb__64 u))) in (dtb__65 u)))))) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRename dtio_0 dtio_1)) dtb__62) dtb__63))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__66 = Obj.obj (e) in (let dtb__67 = Obj.obj ((k (dtb__66 u))) in (dtb__67 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["rename "; dtb__62; " -> "; dtb__63])) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_Symlink (dtb__68, dtb__69) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__70 = Obj.obj (e) in (let dtb__71 = Obj.obj ((k (dtb__70 u))) in (dtb__71 u)))))) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_trySymlink dtio_0 dtio_1)) dtb__68) dtb__69))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__72 = Obj.obj (e) in (let dtb__73 = Obj.obj ((k (dtb__72 u))) in (dtb__73 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["symlink "; dtb__68; " -> "; dtb__69])) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_MakeDirExclusive (dtb__74) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__75 = Obj.obj (e) in (let dtb__76 = Obj.obj ((k (dtb__75 u))) in (dtb__76 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDirExclusive dtio_0)) dtb__74))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__77 = Obj.obj (e) in (let dtb__78 = Obj.obj ((k (dtb__77 u))) in (dtb__78 u)))))) v_fsHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) true) else (if (ok = 6) then ((Obj.magic k) false) else (v_fsFailAt ((v_fsErrorOfCode ("makeDirExclusive " ^ dtb__74)) ok))))))))
  | C_FsOp_FileExists (dtb__79) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__80 = Obj.obj (e) in (let dtb__81 = Obj.obj ((k (dtb__80 u))) in (dtb__81 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileExists dtio_0)) dtb__79))) (fun b -> ((Obj.magic k) b)))
  | C_FsOp_FileMtime (dtb__82) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__83 = Obj.obj (e) in (let dtb__84 = Obj.obj ((k (dtb__83 u))) in (dtb__84 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileMtime dtio_0)) dtb__82))) (fun n -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__85 = Obj.obj (e) in (let dtb__86 = Obj.obj ((k (dtb__85 u))) in (dtb__86 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (n))))))))
  | C_FsOp_FileSize (dtb__87) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__88 = Obj.obj (e) in (let dtb__89 = Obj.obj ((k (dtb__88 u))) in (dtb__89 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__90 = Obj.obj (e) in (f (dtb__90 u)))))) bi_natFromInt) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileSize dtio_0)) dtb__87)))) (fun n -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__91 = Obj.obj (e) in (let dtb__92 = Obj.obj ((k (dtb__91 u))) in (dtb__92 u)))))) v_fsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (n))))))))
  | _ -> failwith "DT: impossible branch"
))

# 313 "Base/Effect/Fs.vuna"
let v_handleFsHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs") n) 371381598) (dtp_effectId n)) (fun a -> (let x = a in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) v_fsOpHIOHost) comp))

# 319 "Base/Effect/Fs.vuna"
let v_runFsHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleFsHostHost "default") comp)))

# 323 "Base/Effect/Fs.vuna"
let v_fsErrorRet = (fun a -> (B_dData_dResult.C_Result_Ok (a)))

# 327 "Base/Effect/Fs.vuna"
let v_fsErrorOpHR = (fun (op : t_FsErrorOp) _u -> (match op with
  | C_FsErrorOp_FsFail (dtb__93) -> (B_dData_dResult.C_Result_Err ((v_fsErrorText dtb__93)))
  | _ -> failwith "DT: impossible branch"
))

# 333 "Base/Effect/Fs.vuna"
let v_runFsError = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs-error") n) 1044473165) (dtp_effectId n)) v_fsErrorRet) v_fsErrorOpHR) comp))

# 337 "Base/Effect/Fs.vuna"
let v_runFsResult = (fun comp -> ((v_runFsError "fs-error") (v_runFsHost comp)))

# 341 "Base/Effect/Fs.vuna"
let v_runFsErrorHost = (fun comp -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__94 = Obj.obj (e) in (let dtb__95 = Obj.obj ((k (dtb__94 u))) in (dtb__95 u)))))) ((v_runFsError "fs-error") comp)) (fun res -> (match res with
  | B_dData_dResult.C_Result_Ok (dtb__96) -> (let x = dtb__96 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dResult.C_Result_Err (dtb__97) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__98 = Obj.obj (e) in (let dtb__99 = Obj.obj ((k (dtb__98 u))) in (dtb__99 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) (String.concat "" ["vuna: "; dtb__97; "\n"])))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__100 = Obj.obj (e) in (let dtb__101 = Obj.obj ((k (dtb__100 u))) in (dtb__101 u)))))) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: fs error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
