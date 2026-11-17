open Vuna_runtime
type t_Base_dEffFs_dFsOp = C_Base_dEffFs_dFsOp_ReadFile of (string) | C_Base_dEffFs_dFsOp_WriteFile of (string) * (string) | C_Base_dEffFs_dFsOp_WriteFileAtomic of (string) * (string) | C_Base_dEffFs_dFsOp_ReadDir of (string) | C_Base_dEffFs_dFsOp_IsDirectory of (string) | C_Base_dEffFs_dFsOp_MakeDir of (string) | C_Base_dEffFs_dFsOp_RemoveFile of (string) | C_Base_dEffFs_dFsOp_FileExists of (string) | C_Base_dEffFs_dFsOp_FileMtime of (string) | C_Base_dEffFs_dFsOp_FileSize of (string) | C_Base_dEffFs_dFsOp_RemoveTree of (string) | C_Base_dEffFs_dFsOp_Rename of (string) * (string) | C_Base_dEffFs_dFsOp_Symlink of (string) * (string) | C_Base_dEffFs_dFsOp_MakeDirExclusive of (string)
and t_Base_dEffFs_dFsError = C_Base_dEffFs_dFsError_FsMissing of (string) | C_Base_dEffFs_dFsError_FsDenied of (string) | C_Base_dEffFs_dFsError_FsNoSpace of (string) | C_Base_dEffFs_dFsError_FsNotDir of (string) | C_Base_dEffFs_dFsError_FsIsDir of (string) | C_Base_dEffFs_dFsError_FsExists of (string) | C_Base_dEffFs_dFsError_FsIo of (string)
and t_Base_dEffFs_dFsErrorOp = C_Base_dEffFs_dFsErrorOp_FsFail of (t_Base_dEffFs_dFsError)

# 80 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsFail = (fun n e -> (((Base_dEff.v_Base_dEff_dsendCore "fs-error") n) (C_Base_dEffFs_dFsErrorOp_FsFail (e))))

# 84 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsErrorOfCode = (fun mc0 mc1 -> (if (mc1 = 1) then (C_Base_dEffFs_dFsError_FsMissing (mc0)) else (if (mc1 = 2) then (C_Base_dEffFs_dFsError_FsDenied (mc0)) else (if (mc1 = 3) then (C_Base_dEffFs_dFsError_FsNoSpace (mc0)) else (if (mc1 = 4) then (C_Base_dEffFs_dFsError_FsNotDir (mc0)) else (if (mc1 = 5) then (C_Base_dEffFs_dFsError_FsIsDir (mc0)) else (if (mc1 = 6) then (C_Base_dEffFs_dFsError_FsExists (mc0)) else (C_Base_dEffFs_dFsError_FsIo (mc0)))))))))

# 94 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsErrorText = (fun mc0 -> (match mc0 with
  | C_Base_dEffFs_dFsError_FsIo (dtb__0) -> (String.concat "" ["fs: "; dtb__0; ": host I/O error"])
  | C_Base_dEffFs_dFsError_FsExists (dtb__1) -> (String.concat "" ["fs: "; dtb__1; ": already exists"])
  | C_Base_dEffFs_dFsError_FsIsDir (dtb__2) -> (String.concat "" ["fs: "; dtb__2; ": is a directory"])
  | C_Base_dEffFs_dFsError_FsNotDir (dtb__3) -> (String.concat "" ["fs: "; dtb__3; ": not a directory"])
  | C_Base_dEffFs_dFsError_FsNoSpace (dtb__4) -> (String.concat "" ["fs: "; dtb__4; ": no space left on device"])
  | C_Base_dEffFs_dFsError_FsDenied (dtb__5) -> (String.concat "" ["fs: "; dtb__5; ": permission denied"])
  | C_Base_dEffFs_dFsError_FsMissing (dtb__6) -> (String.concat "" ["fs: "; dtb__6; ": no such file or directory"])
  | _ -> failwith "DT: impossible branch"
))

# 103 "Base/EffFs.vuna"
let v_Base_dEffFs_dsortEntries = (fun xs -> ((Base_dSort.v_Base_dSort_dsortBy (fun a b -> (((Base_dOrd.v_Base_dOrd_d_x60__x61_ Base_dString.v_Ord_uString) a) b))) xs))

# 107 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsReadFile = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_ReadFile (p))))

# 112 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsWriteFile = (fun n p s -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_WriteFile (p, s))))

# 117 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsWriteFileAtomic = (fun n p s -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_WriteFileAtomic (p, s))))

# 122 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsReadDir = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_ReadDir (p))))

# 127 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsIsDirectory = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_IsDirectory (p))))

# 132 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsMakeDir = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_MakeDir (p))))

# 137 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsRemoveFile = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_RemoveFile (p))))

# 142 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsFileExists = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_FileExists (p))))

# 146 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsFileMtime = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_FileMtime (p))))

# 150 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsFileSize = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_FileSize (p))))

# 154 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsRemoveTree = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_RemoveTree (p))))

# 158 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsRename = (fun n src dst -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_Rename (src, dst))))

# 162 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsSymlink = (fun n target link -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_Symlink (target, link))))

# 166 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsMakeDirExclusive = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_MakeDirExclusive (p))))

# 170 "Base/EffFs.vuna"
let v_Base_dEffFs_dhandleFs = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "fs") n) ret) (Obj.magic opH)) comp))

# 177 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsHostStatus = (Base_dEff.v_Base_dEff_draise (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_hostStatus ()))))

# 181 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsFailAt = (fun e -> (((Base_dEff.v_Base_dEff_dsendCore "fs-error") "fs-error") (C_Base_dEffFs_dFsErrorOp_FsFail (e))))

# 185 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffFs_dFsOp_ReadFile (dtb__7) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_tryReadFile dtio_0)) dtb__7))) (fun s -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode ("readFile " ^ dtb__7)) ok)) else ((Obj.magic k) s))))))
  | C_Base_dEffFs_dFsOp_WriteFile (dtb__8, dtb__9) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_tryWriteFile dtio_0 dtio_1)) dtb__8) dtb__9))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode ("writeFile " ^ dtb__8)) ok)) else ((Obj.magic k) (bi_natFromInt (bi_strLength dtb__9))))))))
  | C_Base_dEffFs_dFsOp_WriteFileAtomic (dtb__10, dtb__11) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_tryWriteFileAtomic dtio_0 dtio_1)) dtb__10) dtb__11))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode ("writeFileAtomic " ^ dtb__10)) ok)) else ((Obj.magic k) (bi_strLength dtb__11)))))))
  | C_Base_dEffFs_dFsOp_ReadDir (dtb__12) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_tryReadDir p)) dtio_0)) dtb__12))) (fun xs -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode ("readDir " ^ dtb__12)) ok)) else ((Obj.magic k) (v_Base_dEffFs_dsortEntries xs)))))))
  | C_Base_dEffFs_dFsOp_IsDirectory (dtb__13) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_tryIsDirectory dtio_0)) dtb__13))) (fun b -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode ("isDirectory " ^ dtb__13)) ok)) else ((Obj.magic k) b))))))
  | C_Base_dEffFs_dFsOp_MakeDir (dtb__14) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_tryMakeDir dtio_0)) dtb__14))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode ("makeDir " ^ dtb__14)) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffFs_dFsOp_RemoveFile (dtb__15) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_tryRemoveFile dtio_0)) dtb__15))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode ("removeFile " ^ dtb__15)) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffFs_dFsOp_RemoveTree (dtb__16) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_tryRemoveTree dtio_0)) dtb__16))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode ("removeTree " ^ dtb__16)) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffFs_dFsOp_Rename (dtb__17, dtb__18) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_tryRename dtio_0 dtio_1)) dtb__17) dtb__18))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode (String.concat "" ["rename "; dtb__17; " -> "; dtb__18])) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffFs_dFsOp_Symlink (dtb__19, dtb__20) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_trySymlink dtio_0 dtio_1)) dtb__19) dtb__20))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode (String.concat "" ["symlink "; dtb__19; " -> "; dtb__20])) ok)) else ((Obj.magic k) 0))))))
  | C_Base_dEffFs_dFsOp_MakeDirExclusive (dtb__21) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_tryMakeDirExclusive dtio_0)) dtb__21))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) true) else (if (ok = 6) then ((Obj.magic k) false) else (v_Base_dEffFs_dfsFailAt ((v_Base_dEffFs_dfsErrorOfCode ("makeDirExclusive " ^ dtb__21)) ok))))))))
  | C_Base_dEffFs_dFsOp_FileExists (dtb__22) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dtb__22))) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffFs_dFsOp_FileMtime (dtb__23) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) dtb__23))) (fun n -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (n))))))))
  | C_Base_dEffFs_dFsOp_FileSize (dtb__24) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dFunctor.v_Base_dFunctor_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) dtb__24)))) (fun n -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Base_dEffFs_dfsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((Obj.magic k) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (n))))))))
  | _ -> failwith "DT: impossible branch"
))

# 245 "Base/EffFs.vuna"
let v_Base_dEffFs_dhandleFsHostHost = (fun n comp -> (((((Base_dEff.v_Base_dEff_dhandleCoreAt "fs") n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffFs_dfsOpHIOHost) comp))

# 249 "Base/EffFs.vuna"
let v_Base_dEffFs_drunFsHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffFs_dhandleFsHostHost "default") comp)))

# 253 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsErrorRet = (fun a -> (Base_dResult.C_Base_dResult_dResult_Ok (a)))

# 257 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsErrorOpHR = (fun op _u -> (match op with
  | C_Base_dEffFs_dFsErrorOp_FsFail (dtb__25) -> (Base_dResult.C_Base_dResult_dResult_Err ((v_Base_dEffFs_dfsErrorText dtb__25)))
  | _ -> failwith "DT: impossible branch"
))

# 262 "Base/EffFs.vuna"
let v_Base_dEffFs_drunFsError = (fun n comp -> (((((Base_dEff.v_Base_dEff_dhandleCoreAt "fs-error") n) v_Base_dEffFs_dfsErrorRet) v_Base_dEffFs_dfsErrorOpHR) comp))

# 266 "Base/EffFs.vuna"
let v_Base_dEffFs_drunFsErrorHost = (fun comp -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Base_dEffFs_drunFsError "fs-error") comp)) (fun res -> (match res with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__26) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) dtb__26)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__27) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__27; "\n"])))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: fs error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
