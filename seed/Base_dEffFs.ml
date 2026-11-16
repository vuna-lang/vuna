open Vuna_runtime
type t_Base_dEffFs_dFsOp = C_Base_dEffFs_dFsOp_ReadFile of (string) | C_Base_dEffFs_dFsOp_WriteFile of (string) * (string) | C_Base_dEffFs_dFsOp_WriteFileAtomic of (string) * (string) | C_Base_dEffFs_dFsOp_ReadDir of (string) | C_Base_dEffFs_dFsOp_IsDirectory of (string) | C_Base_dEffFs_dFsOp_MakeDir of (string) | C_Base_dEffFs_dFsOp_RemoveFile of (string) | C_Base_dEffFs_dFsOp_FileExists of (string) | C_Base_dEffFs_dFsOp_FileMtime of (string) | C_Base_dEffFs_dFsOp_FileSize of (string)
and t_Base_dEffFs_dFsError = C_Base_dEffFs_dFsError_FsMissing of (string) | C_Base_dEffFs_dFsError_FsDenied of (string) | C_Base_dEffFs_dFsError_FsNoSpace of (string) | C_Base_dEffFs_dFsError_FsNotDir of (string) | C_Base_dEffFs_dFsError_FsIsDir of (string) | C_Base_dEffFs_dFsError_FsExists of (string) | C_Base_dEffFs_dFsError_FsIo of (string)
and t_Base_dEffFs_dFsErrorOp = C_Base_dEffFs_dFsErrorOp_FsFail of (t_Base_dEffFs_dFsError)

# 76 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsFail = (fun n e -> (((Base_dEff.v_Base_dEff_dsendCore "fs-error") n) (C_Base_dEffFs_dFsErrorOp_FsFail (e))))

# 80 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsErrorOfCode = (fun mc0 mc1 -> (if (mc1 = 1) then (C_Base_dEffFs_dFsError_FsMissing (mc0)) else (if (mc1 = 2) then (C_Base_dEffFs_dFsError_FsDenied (mc0)) else (if (mc1 = 3) then (C_Base_dEffFs_dFsError_FsNoSpace (mc0)) else (if (mc1 = 4) then (C_Base_dEffFs_dFsError_FsNotDir (mc0)) else (if (mc1 = 5) then (C_Base_dEffFs_dFsError_FsIsDir (mc0)) else (if (mc1 = 6) then (C_Base_dEffFs_dFsError_FsExists (mc0)) else (C_Base_dEffFs_dFsError_FsIo (mc0)))))))))

# 90 "Base/EffFs.vuna"
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

# 100 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsReadFile = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_ReadFile (p))))

# 104 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsWriteFile = (fun n p s -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_WriteFile (p, s))))

# 108 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsWriteFileAtomic = (fun n p s -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_WriteFileAtomic (p, s))))

# 112 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsReadDir = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_ReadDir (p))))

# 116 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsIsDirectory = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_IsDirectory (p))))

# 120 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsMakeDir = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_MakeDir (p))))

# 124 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsRemoveFile = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_RemoveFile (p))))

# 128 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsFileExists = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_FileExists (p))))

# 132 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsFileMtime = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_FileMtime (p))))

# 136 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsFileSize = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_FileSize (p))))

# 140 "Base/EffFs.vuna"
let v_Base_dEffFs_dhandleFs = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "fs") n) ret) (Obj.magic opH)) comp))

# 144 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsOpHIO = (fun op k -> (match op with
  | C_Base_dEffFs_dFsOp_ReadFile (dtb__7) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) dtb__7)) (fun s -> ((Obj.magic k) s)))
  | C_Base_dEffFs_dFsOp_WriteFile (dtb__8, dtb__9) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) dtb__8) dtb__9))) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_WriteFileAtomic (dtb__10, dtb__11) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) dtb__10) dtb__11)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_ReadDir (dtb__12) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dtb__12)) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffFs_dFsOp_IsDirectory (dtb__13) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) dtb__13)) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffFs_dFsOp_MakeDir (dtb__14) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_makeDir dtio_0)) dtb__14)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_RemoveFile (dtb__15) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_removeFile dtio_0)) dtb__15)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_FileExists (dtb__16) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dtb__16)) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffFs_dFsOp_FileMtime (dtb__17) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) dtb__17)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_FileSize (dtb__18) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) dtb__18))) (fun n -> ((Obj.magic k) n)))
  | _ -> failwith "DT: impossible branch"
))

# 181 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffFs_dFsOp_ReadFile (dtb__19) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) dtb__19)) (fun s -> ((Obj.magic k) s)))
  | C_Base_dEffFs_dFsOp_WriteFile (dtb__20, dtb__21) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) dtb__20) dtb__21))) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_WriteFileAtomic (dtb__22, dtb__23) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) dtb__22) dtb__23)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_ReadDir (dtb__24) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dtb__24)) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffFs_dFsOp_IsDirectory (dtb__25) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) dtb__25)) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffFs_dFsOp_MakeDir (dtb__26) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_makeDir dtio_0)) dtb__26)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_RemoveFile (dtb__27) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_removeFile dtio_0)) dtb__27)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_FileExists (dtb__28) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dtb__28)) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffFs_dFsOp_FileMtime (dtb__29) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) dtb__29)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_FileSize (dtb__30) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) dtb__30))) (fun n -> ((Obj.magic k) n)))
  | _ -> failwith "DT: impossible branch"
))

# 215 "Base/EffFs.vuna"
let v_Base_dEffFs_dfsErrorOpH = (fun op _u -> (match op with
  | C_Base_dEffFs_dFsErrorOp_FsFail (dtb__31) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun s -> prerr_string s; flush stderr; String.length s) dtio_0)) (String.concat "" ["vuna: "; (v_Base_dEffFs_dfsErrorText dtb__31); "\n"])))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: fs error handler")))))
  | _ -> failwith "DT: impossible branch"
))

# 222 "Base/EffFs.vuna"
let v_Base_dEffFs_drunFsErrorHost = (fun comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "fs-error") "fs-error") (fun a -> a)) v_Base_dEffFs_dfsErrorOpH) comp))

# 226 "Base/EffFs.vuna"
let v_Base_dEffFs_dhandleFsHostHost = (fun n comp -> ((((v_Base_dEffFs_dhandleFs n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffFs_dfsOpHIOHost) comp))

# 230 "Base/EffFs.vuna"
let v_Base_dEffFs_drunFsHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffFs_dhandleFsHostHost "default") comp)))
