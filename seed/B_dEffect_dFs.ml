open Vuna_runtime
type t_FsOp = C_FsOp_ReadFile of (string) | C_FsOp_WriteFile of (string) * (string) | C_FsOp_WriteFileAtomic of (string) * (string) | C_FsOp_ReadDir of (string) | C_FsOp_IsDirectory of (string) | C_FsOp_MakeDir of (string) | C_FsOp_RemoveFile of (string) | C_FsOp_FileExists of (string) | C_FsOp_FileMtime of (string) | C_FsOp_FileSize of (string) | C_FsOp_RemoveTree of (string) | C_FsOp_Rename of (string) * (string) | C_FsOp_Symlink of (string) * (string) | C_FsOp_MakeDirExclusive of (string)
and t_FsError = C_FsError_FsMissing of (string) | C_FsError_FsDenied of (string) | C_FsError_FsNoSpace of (string) | C_FsError_FsNotDir of (string) | C_FsError_FsIsDir of (string) | C_FsError_FsExists of (string) | C_FsError_FsIo of (string)
and t_FsErrorOp = C_FsErrorOp_FsFail of (t_FsError)

# 80 "Base/Effect/Fs.vuna"
let v_fsFail = (fun (n : string) (e : t_FsError) -> (((((B_dEffect_dCore.v_sendCoreId "fs-error") n) 1044473165) (dtp_effectId n)) (C_FsErrorOp_FsFail (e))))

# 84 "Base/Effect/Fs.vuna"
let v_fsErrorOfCode = (fun (mc0 : string) (mc1 : int) -> (if (mc1 = 1) then (C_FsError_FsMissing (mc0)) else (if (mc1 = 2) then (C_FsError_FsDenied (mc0)) else (if (mc1 = 3) then (C_FsError_FsNoSpace (mc0)) else (if (mc1 = 4) then (C_FsError_FsNotDir (mc0)) else (if (mc1 = 5) then (C_FsError_FsIsDir (mc0)) else (if (mc1 = 6) then (C_FsError_FsExists (mc0)) else (C_FsError_FsIo (mc0)))))))))

# 94 "Base/Effect/Fs.vuna"
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

# 107 "Base/Effect/Fs.vuna"
let v_isDotEntry = (fun (name : string) -> (if (name = ".") then true else (name = "..")))

# 110 "Base/Effect/Fs.vuna"
let v_sortEntries = (fun (xs : string B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (a : string) (b : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_uString) a) b))) ((B_dData_dList.v_filter (fun (name : string) -> (B_dData_dBool.v_not (v_isDotEntry name)))) xs)))

# 114 "Base/Effect/Fs.vuna"
let v_fsReadFile = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadFile (p))))

# 120 "Base/Effect/Fs.vuna"
let v_fsWriteFile = (fun (n : string) (p : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_WriteFile (p, s))))

# 126 "Base/Effect/Fs.vuna"
let v_fsWriteFileAtomic = (fun (n : string) (p : string) (s : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_WriteFileAtomic (p, s))))

# 132 "Base/Effect/Fs.vuna"
let v_fsReadDir = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_ReadDir (p))))

# 138 "Base/Effect/Fs.vuna"
let v_fsIsDirectory = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_IsDirectory (p))))

# 144 "Base/Effect/Fs.vuna"
let v_fsMakeDir = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_MakeDir (p))))

# 150 "Base/Effect/Fs.vuna"
let v_fsRemoveFile = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_RemoveFile (p))))

# 156 "Base/Effect/Fs.vuna"
let v_fsFileExists = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileExists (p))))

# 160 "Base/Effect/Fs.vuna"
let v_fsFileMtime = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileMtime (p))))

# 164 "Base/Effect/Fs.vuna"
let v_fsFileSize = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_FileSize (p))))

# 168 "Base/Effect/Fs.vuna"
let v_fsRemoveTree = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_RemoveTree (p))))

# 172 "Base/Effect/Fs.vuna"
let v_fsRename = (fun (n : string) (src : string) (dst : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_Rename (src, dst))))

# 176 "Base/Effect/Fs.vuna"
let v_fsSymlink = (fun (n : string) (target : string) (link : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_Symlink (target, link))))

# 180 "Base/Effect/Fs.vuna"
let v_fsMakeDirExclusive = (fun (n : string) (p : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") n) 371381598) (dtp_effectId n)) (C_FsOp_MakeDirExclusive (p))))

# 184 "Base/Effect/Fs.vuna"
let v_handleFs = (fun (n : string) ret opH comp -> (((((((B_dEffect_dCore.v_handleCoreId "fs") n) 371381598) (dtp_effectId n)) ret) (Obj.magic opH)) comp))

# 191 "Base/Effect/Fs.vuna"
let v_fsHostStatus = (B_dEffect_dCore.v_raise (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 195 "Base/Effect/Fs.vuna"
let v_fsFailAt = (fun (e : t_FsError) -> (((((B_dEffect_dCore.v_sendCoreId "fs-error") "fs-error") 1044473165) 1044473165) (C_FsErrorOp_FsFail (e))))

# 199 "Base/Effect/Fs.vuna"
let v_fsOpHIOHost = (fun (op : t_FsOp) k -> (match op with
  | C_FsOp_ReadFile (dtb__7) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFile dtio_0)) dtb__7))) (fun s -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("readFile " ^ dtb__7)) ok)) else ((Obj.magic k) s))))))
  | C_FsOp_WriteFile (dtb__8, dtb__9) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFile dtio_0 dtio_1)) dtb__8) dtb__9))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("writeFile " ^ dtb__8)) ok)) else ((Obj.magic k) (bi_natFromInt (bi_strLength dtb__9))))))))
  | C_FsOp_WriteFileAtomic (dtb__10, dtb__11) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFileAtomic dtio_0 dtio_1)) dtb__10) dtb__11))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("writeFileAtomic " ^ dtb__10)) ok)) else ((Obj.magic k) (bi_strLength dtb__11)))))))
  | C_FsOp_ReadDir (dtb__12) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun p -> B_dData_dList.dtp_listOf (dtp_tryReadDir p)) dtio_0)) dtb__12))) (fun xs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("readDir " ^ dtb__12)) ok)) else ((Obj.magic k) (v_sortEntries xs)))))))
  | C_FsOp_IsDirectory (dtb__13) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryIsDirectory dtio_0)) dtb__13))) (fun b -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("isDirectory " ^ dtb__13)) ok)) else ((Obj.magic k) b))))))
  | C_FsOp_MakeDir (dtb__14) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDir dtio_0)) dtb__14))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("makeDir " ^ dtb__14)) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_RemoveFile (dtb__15) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveFile dtio_0)) dtb__15))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("removeFile " ^ dtb__15)) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_RemoveTree (dtb__16) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveTree dtio_0)) dtb__16))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("removeTree " ^ dtb__16)) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_Rename (dtb__17, dtb__18) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRename dtio_0 dtio_1)) dtb__17) dtb__18))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["rename "; dtb__17; " -> "; dtb__18])) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_Symlink (dtb__19, dtb__20) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_trySymlink dtio_0 dtio_1)) dtb__19) dtb__20))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["symlink "; dtb__19; " -> "; dtb__20])) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_MakeDirExclusive (dtb__21) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDirExclusive dtio_0)) dtb__21))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) true) else (if (ok = 6) then ((Obj.magic k) false) else (v_fsFailAt ((v_fsErrorOfCode ("makeDirExclusive " ^ dtb__21)) ok))))))))
  | C_FsOp_FileExists (dtb__22) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileExists dtio_0)) dtb__22))) (fun b -> ((Obj.magic k) b)))
  | C_FsOp_FileMtime (dtb__23) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileMtime dtio_0)) dtb__23))) (fun n -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (n))))))))
  | C_FsOp_FileSize (dtb__24) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) bi_natFromInt) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileSize dtio_0)) dtb__24)))) (fun n -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (n))))))))
  | _ -> failwith "DT: impossible branch"
))

# 278 "Base/Effect/Fs.vuna"
let v_handleFsHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs") n) 371381598) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) a))) v_fsOpHIOHost) comp))

# 282 "Base/Effect/Fs.vuna"
let v_runFsHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleFsHostHost "default") comp)))

# 286 "Base/Effect/Fs.vuna"
let v_fsErrorRet = (fun a -> (B_dData_dResult.C_Result_Ok (a)))

# 290 "Base/Effect/Fs.vuna"
let v_fsErrorOpHR = (fun (op : t_FsErrorOp) _u -> (match op with
  | C_FsErrorOp_FsFail (dtb__25) -> (B_dData_dResult.C_Result_Err ((v_fsErrorText dtb__25)))
  | _ -> failwith "DT: impossible branch"
))

# 296 "Base/Effect/Fs.vuna"
let v_runFsError = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs-error") n) 1044473165) (dtp_effectId n)) v_fsErrorRet) v_fsErrorOpHR) comp))

# 300 "Base/Effect/Fs.vuna"
let v_runFsErrorHost = (fun comp -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((v_runFsError "fs-error") comp)) (fun res -> (match res with
  | B_dData_dResult.C_Result_Ok (dtb__26) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) dtb__26)
  | B_dData_dResult.C_Result_Err (dtb__27) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__27; "\n"])))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dCore.v_raise ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: fs error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
