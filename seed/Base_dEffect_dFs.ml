open Vuna_runtime
type t_Base_dEffect_dFs_dFsOp = C_Base_dEffect_dFs_dFsOp_ReadFile of (string) | C_Base_dEffect_dFs_dFsOp_WriteFile of (string) * (string) | C_Base_dEffect_dFs_dFsOp_WriteFileAtomic of (string) * (string) | C_Base_dEffect_dFs_dFsOp_ReadDir of (string) | C_Base_dEffect_dFs_dFsOp_IsDirectory of (string) | C_Base_dEffect_dFs_dFsOp_MakeDir of (string) | C_Base_dEffect_dFs_dFsOp_RemoveFile of (string) | C_Base_dEffect_dFs_dFsOp_FileExists of (string) | C_Base_dEffect_dFs_dFsOp_FileMtime of (string) | C_Base_dEffect_dFs_dFsOp_FileSize of (string) | C_Base_dEffect_dFs_dFsOp_RemoveTree of (string) | C_Base_dEffect_dFs_dFsOp_Rename of (string) * (string) | C_Base_dEffect_dFs_dFsOp_Symlink of (string) * (string) | C_Base_dEffect_dFs_dFsOp_MakeDirExclusive of (string)
and t_Base_dEffect_dFs_dFsError = C_Base_dEffect_dFs_dFsError_FsMissing of (string) | C_Base_dEffect_dFs_dFsError_FsDenied of (string) | C_Base_dEffect_dFs_dFsError_FsNoSpace of (string) | C_Base_dEffect_dFs_dFsError_FsNotDir of (string) | C_Base_dEffect_dFs_dFsError_FsIsDir of (string) | C_Base_dEffect_dFs_dFsError_FsExists of (string) | C_Base_dEffect_dFs_dFsError_FsIo of (string)
and t_Base_dEffect_dFs_dFsErrorOp = C_Base_dEffect_dFs_dFsErrorOp_FsFail of (t_Base_dEffect_dFs_dFsError)

# 80 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsFail = (fun n e -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs-error") n) (C_Base_dEffect_dFs_dFsErrorOp_FsFail (e))))

# 84 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsErrorOfCode = (fun mc0 mc1 -> (if (mc1 = 1) then (C_Base_dEffect_dFs_dFsError_FsMissing (mc0)) else (if (mc1 = 2) then (C_Base_dEffect_dFs_dFsError_FsDenied (mc0)) else (if (mc1 = 3) then (C_Base_dEffect_dFs_dFsError_FsNoSpace (mc0)) else (if (mc1 = 4) then (C_Base_dEffect_dFs_dFsError_FsNotDir (mc0)) else (if (mc1 = 5) then (C_Base_dEffect_dFs_dFsError_FsIsDir (mc0)) else (if (mc1 = 6) then (C_Base_dEffect_dFs_dFsError_FsExists (mc0)) else (C_Base_dEffect_dFs_dFsError_FsIo (mc0)))))))))

# 94 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsErrorText = (fun mc0 -> (match mc0 with
  | C_Base_dEffect_dFs_dFsError_FsIo (dtb__0) -> (String.concat "" ["fs: "; dtb__0; ": host I/O error"])
  | C_Base_dEffect_dFs_dFsError_FsExists (dtb__1) -> (String.concat "" ["fs: "; dtb__1; ": already exists"])
  | C_Base_dEffect_dFs_dFsError_FsIsDir (dtb__2) -> (String.concat "" ["fs: "; dtb__2; ": is a directory"])
  | C_Base_dEffect_dFs_dFsError_FsNotDir (dtb__3) -> (String.concat "" ["fs: "; dtb__3; ": not a directory"])
  | C_Base_dEffect_dFs_dFsError_FsNoSpace (dtb__4) -> (String.concat "" ["fs: "; dtb__4; ": no space left on device"])
  | C_Base_dEffect_dFs_dFsError_FsDenied (dtb__5) -> (String.concat "" ["fs: "; dtb__5; ": permission denied"])
  | C_Base_dEffect_dFs_dFsError_FsMissing (dtb__6) -> (String.concat "" ["fs: "; dtb__6; ": no such file or directory"])
  | _ -> failwith "DT: impossible branch"
))

# 107 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_disDotEntry = (fun name -> (if (name = ".") then true else (name = "..")))

# 110 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dsortEntries = (fun xs -> ((Base_dData_dSort.v_Base_dData_dSort_dsortBy (fun a b -> (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60__x61_ Base_dData_dString.v_Ord_uString) a) b))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun name -> (Base_dData_dBool.v_Base_dData_dBool_dnot (v_Base_dEffect_dFs_disDotEntry name)))) xs)))

# 114 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsReadFile = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_ReadFile (p))))

# 119 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsWriteFile = (fun n p s -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_WriteFile (p, s))))

# 124 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsWriteFileAtomic = (fun n p s -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_WriteFileAtomic (p, s))))

# 129 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsReadDir = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_ReadDir (p))))

# 134 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsIsDirectory = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_IsDirectory (p))))

# 139 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsMakeDir = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_MakeDir (p))))

# 144 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsRemoveFile = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_RemoveFile (p))))

# 149 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsFileExists = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_FileExists (p))))

# 153 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsFileMtime = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_FileMtime (p))))

# 157 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsFileSize = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_FileSize (p))))

# 161 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsRemoveTree = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_RemoveTree (p))))

# 165 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsRename = (fun n src dst -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_Rename (src, dst))))

# 169 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsSymlink = (fun n target link -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_Symlink (target, link))))

# 173 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsMakeDirExclusive = (fun n p -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs") n) (C_Base_dEffect_dFs_dFsOp_MakeDirExclusive (p))))

# 177 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dhandleFs = (fun n ret opH comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCore "fs") n) ret) (Obj.magic opH)) comp))

# 184 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsHostStatus = (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (dtp_hostStatus ()))))

# 188 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsFailAt = (fun e -> (((Base_dEffect_dCore.v_Base_dEffect_dCore_dsendCore "fs-error") "fs-error") (C_Base_dEffect_dFs_dFsErrorOp_FsFail (e))))

# 192 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffect_dFs_dFsOp_ReadFile (dtb__7) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_tryReadFile dtio_0)) dtb__7))) (fun s -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode ("readFile " ^ dtb__7)) ok)) else ((Obj.magic k) s))))))
  | C_Base_dEffect_dFs_dFsOp_WriteFile (dtb__8, dtb__9) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_tryWriteFile dtio_0 dtio_1)) dtb__8) dtb__9))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode ("writeFile " ^ dtb__8)) ok)) else ((Obj.magic k) (bi_natFromInt (bi_strLength dtb__9))))))))
  | C_Base_dEffect_dFs_dFsOp_WriteFileAtomic (dtb__10, dtb__11) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_tryWriteFileAtomic dtio_0 dtio_1)) dtb__10) dtb__11))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode ("writeFileAtomic " ^ dtb__10)) ok)) else ((Obj.magic k) (bi_strLength dtb__11)))))))
  | C_Base_dEffect_dFs_dFsOp_ReadDir (dtb__12) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun p -> Base_dData_dList.dtp_listOf (dtp_tryReadDir p)) dtio_0)) dtb__12))) (fun xs -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode ("readDir " ^ dtb__12)) ok)) else ((Obj.magic k) (v_Base_dEffect_dFs_dsortEntries xs)))))))
  | C_Base_dEffect_dFs_dFsOp_IsDirectory (dtb__13) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_tryIsDirectory dtio_0)) dtb__13))) (fun b -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode ("isDirectory " ^ dtb__13)) ok)) else ((Obj.magic k) b))))))
  | C_Base_dEffect_dFs_dFsOp_MakeDir (dtb__14) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_tryMakeDir dtio_0)) dtb__14))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode ("makeDir " ^ dtb__14)) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffect_dFs_dFsOp_RemoveFile (dtb__15) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_tryRemoveFile dtio_0)) dtb__15))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode ("removeFile " ^ dtb__15)) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffect_dFs_dFsOp_RemoveTree (dtb__16) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_tryRemoveTree dtio_0)) dtb__16))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode ("removeTree " ^ dtb__16)) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffect_dFs_dFsOp_Rename (dtb__17, dtb__18) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_tryRename dtio_0 dtio_1)) dtb__17) dtb__18))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode (String.concat "" ["rename "; dtb__17; " -> "; dtb__18])) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffect_dFs_dFsOp_Symlink (dtb__19, dtb__20) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise (((fun dtio_0 dtio_1 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_trySymlink dtio_0 dtio_1)) dtb__19) dtb__20))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode (String.concat "" ["symlink "; dtb__19; " -> "; dtb__20])) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffect_dFs_dFsOp_MakeDirExclusive (dtb__21) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_tryMakeDirExclusive dtio_0)) dtb__21))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) true) else (if (ok = 6) then ((Obj.magic k) false) else (v_Base_dEffect_dFs_dfsFailAt ((v_Base_dEffect_dFs_dfsErrorOfCode ("makeDirExclusive " ^ dtb__21)) ok))))))))
  | C_Base_dEffect_dFs_dFsOp_FileExists (dtb__22) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_fileExists dtio_0)) dtb__22))) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffect_dFs_dFsOp_FileMtime (dtb__23) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_fileMtime dtio_0)) dtb__23))) (fun n -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (n))))))))
  | C_Base_dEffect_dFs_dFsOp_FileSize (dtb__24) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dTrait_dFunctor.v_Base_dTrait_dFunctor_dfmap Base_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) bi_natFromInt) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_fileSize dtio_0)) dtb__24)))) (fun n -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_Base_dEffect_dFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (n))))))))
  | _ -> failwith "DT: impossible branch"
))

# 252 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dhandleFsHostHost = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "fs") n) (fun a -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_Base_dEffect_dFs_dfsOpHIOHost) comp))

# 256 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_drunFsHost = (fun comp -> (Base_dEffect_dCore.v_Base_dEffect_dCore_djoinEff ((v_Base_dEffect_dFs_dhandleFsHostHost "default") comp)))

# 260 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsErrorRet = (fun a -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (a)))

# 264 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_dfsErrorOpHR = (fun op _u -> (match op with
  | C_Base_dEffect_dFs_dFsErrorOp_FsFail (dtb__25) -> (Base_dData_dResult.C_Base_dData_dResult_dResult_Err ((v_Base_dEffect_dFs_dfsErrorText dtb__25)))
  | _ -> failwith "DT: impossible branch"
))

# 269 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_drunFsError = (fun n comp -> (((((Base_dEffect_dCore.v_Base_dEffect_dCore_dhandleCoreAt "fs-error") n) v_Base_dEffect_dFs_dfsErrorRet) v_Base_dEffect_dFs_dfsErrorOpHR) comp))

# 273 "Base/Effect/Fs.vuna"
let v_Base_dEffect_dFs_drunFsErrorHost = (fun comp -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_Base_dEffect_dFs_drunFsError "fs-error") comp)) (fun res -> (match res with
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Ok (dtb__26) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__26)
  | Base_dData_dResult.C_Base_dData_dResult_dResult_Err (dtb__27) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__27; "\n"])))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dCore.v_Base_dEffect_dCore_draise ((fun dtio_0 -> Base_dEffect_dCore.C_Base_dEffect_dCore_dEff_MkEff (fun (_ : Base_dEffect_dCore.t_Base_dEffect_dCore_dEffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: fs error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
