open Vuna_runtime
type t_Base_dEffFs_dFsOp = C_Base_dEffFs_dFsOp_ReadFile of (string) | C_Base_dEffFs_dFsOp_WriteFile of (string) * (string) | C_Base_dEffFs_dFsOp_WriteFileAtomic of (string) * (string) | C_Base_dEffFs_dFsOp_ReadDir of (string) | C_Base_dEffFs_dFsOp_IsDirectory of (string) | C_Base_dEffFs_dFsOp_MakeDir of (string) | C_Base_dEffFs_dFsOp_RemoveFile of (string) | C_Base_dEffFs_dFsOp_FileExists of (string) | C_Base_dEffFs_dFsOp_FileMtime of (string) | C_Base_dEffFs_dFsOp_FileSize of (string)

let v_Base_dEffFs_dfsReadFile = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_ReadFile (p))))

let v_Base_dEffFs_dfsWriteFile = (fun n p s -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_WriteFile (p, s))))

let v_Base_dEffFs_dfsWriteFileAtomic = (fun n p s -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_WriteFileAtomic (p, s))))

let v_Base_dEffFs_dfsReadDir = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_ReadDir (p))))

let v_Base_dEffFs_dfsIsDirectory = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_IsDirectory (p))))

let v_Base_dEffFs_dfsMakeDir = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_MakeDir (p))))

let v_Base_dEffFs_dfsRemoveFile = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_RemoveFile (p))))

let v_Base_dEffFs_dfsFileExists = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_FileExists (p))))

let v_Base_dEffFs_dfsFileMtime = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_FileMtime (p))))

let v_Base_dEffFs_dfsFileSize = (fun n p -> (((Base_dEff.v_Base_dEff_dsendCore "fs") n) (C_Base_dEffFs_dFsOp_FileSize (p))))

let v_Base_dEffFs_dhandleFs = (fun n ret opH comp -> (((((Base_dEff.v_Base_dEff_dhandleCore "fs") n) ret) (Obj.magic opH)) comp))

let v_Base_dEffFs_dfsOpHIO = (fun op k -> (match op with
  | C_Base_dEffFs_dFsOp_ReadFile (dtb__0) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) dtb__0)) (fun s -> ((Obj.magic k) s)))
  | C_Base_dEffFs_dFsOp_WriteFile (dtb__1, dtb__2) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) dtb__1) dtb__2))) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_WriteFileAtomic (dtb__3, dtb__4) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) dtb__3) dtb__4)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_ReadDir (dtb__5) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dtb__5)) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffFs_dFsOp_IsDirectory (dtb__6) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) dtb__6)) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffFs_dFsOp_MakeDir (dtb__7) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_makeDir dtio_0)) dtb__7)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_RemoveFile (dtb__8) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_removeFile dtio_0)) dtb__8)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_FileExists (dtb__9) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dtb__9)) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffFs_dFsOp_FileMtime (dtb__10) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) dtb__10)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_FileSize (dtb__11) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) dtb__11))) (fun n -> ((Obj.magic k) n)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffFs_dfsOpHIOHost = (fun op k -> (match op with
  | C_Base_dEffFs_dFsOp_ReadFile (dtb__12) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) dtb__12)) (fun s -> ((Obj.magic k) s)))
  | C_Base_dEffFs_dFsOp_WriteFile (dtb__13, dtb__14) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) dtb__13) dtb__14))) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_WriteFileAtomic (dtb__15, dtb__16) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) dtb__15) dtb__16)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_ReadDir (dtb__17) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dtb__17)) (fun xs -> ((Obj.magic k) xs)))
  | C_Base_dEffFs_dFsOp_IsDirectory (dtb__18) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) dtb__18)) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffFs_dFsOp_MakeDir (dtb__19) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_makeDir dtio_0)) dtb__19)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_RemoveFile (dtb__20) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_removeFile dtio_0)) dtb__20)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_FileExists (dtb__21) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dtb__21)) (fun b -> ((Obj.magic k) b)))
  | C_Base_dEffFs_dFsOp_FileMtime (dtb__22) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) dtb__22)) (fun n -> ((Obj.magic k) n)))
  | C_Base_dEffFs_dFsOp_FileSize (dtb__23) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) dtb__23))) (fun n -> ((Obj.magic k) n)))
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dEffFs_dhandleFsHostHost = (fun n comp -> ((((v_Base_dEffFs_dhandleFs n) (fun a -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) a))) v_Base_dEffFs_dfsOpHIOHost) comp))

let v_Base_dEffFs_drunFsHost = (fun comp -> (Base_dEff.v_Base_dEff_djoinEff ((v_Base_dEffFs_dhandleFsHostHost "default") comp)))
