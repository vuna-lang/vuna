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
  | { B_dData_dPair.f_Pair_first = dtb__9; B_dData_dPair.f_Pair_second = dtb__10 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_fsReadFileRange n) dtb__7) dtb__9) dtb__10)) (fun (s : string) -> (if ((bi_strLength s) <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc0 }) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (s)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__7; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb__9 + (bi_strLength s)); B_dData_dPair.f_Pair_second = dtb__10 } } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 134 "Base/Effect/Fs.vuna"
let v_fsFileCursor = (fun (n : string) (path : string) (chunk : int) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dCursor.v_cursorOfState { B_dData_dPair.f_Pair_first = path; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (if (chunk <= 0) then 65536 else chunk) } }) (v_fsChunkStep n))))

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
let v_fsHostStatus = (B_dEffect_dHost.v_hostSync (B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 225 "Base/Effect/Fs.vuna"
let v_fsFailAt = (fun (e : t_FsError) -> (((((B_dEffect_dCore.v_sendCoreId "fs-error") "fs-error") 1044473165) 1044473165) (C_FsErrorOp_FsFail (e))))

# 229 "Base/Effect/Fs.vuna"
let v_fsOpHIOHost = (fun (op : t_FsOp) k -> (match op with
  | C_FsOp_ReadFile (dtb__11) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFile dtio_0)) dtb__11))) (fun s -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("readFile " ^ dtb__11)) ok)) else ((Obj.magic k) s))))))
  | C_FsOp_ReadFileRange (dtb__12, dtb__13, dtb__14) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((((fun dtio_0 dtio_1 dtio_2 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFileRange dtio_0 dtio_1 dtio_2)) dtb__12) dtb__13) dtb__14))) (fun s -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("readFileRange " ^ dtb__12)) ok)) else ((Obj.magic k) s))))))
  | C_FsOp_WriteFile (dtb__15, dtb__16) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFile dtio_0 dtio_1)) dtb__15) dtb__16))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("writeFile " ^ dtb__15)) ok)) else ((Obj.magic k) (bi_natFromInt (bi_strLength dtb__16))))))))
  | C_FsOp_WriteFileAtomic (dtb__17, dtb__18) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFileAtomic dtio_0 dtio_1)) dtb__17) dtb__18))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("writeFileAtomic " ^ dtb__17)) ok)) else ((Obj.magic k) (bi_strLength dtb__18)))))))
  | C_FsOp_ReadDir (dtb__19) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun p -> B_dData_dList.dtp_listOf (dtp_tryReadDir p)) dtio_0)) dtb__19))) (fun xs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("readDir " ^ dtb__19)) ok)) else ((Obj.magic k) (v_sortEntries xs)))))))
  | C_FsOp_IsDirectory (dtb__20) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryIsDirectory dtio_0)) dtb__20))) (fun b -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("isDirectory " ^ dtb__20)) ok)) else ((Obj.magic k) b))))))
  | C_FsOp_MakeDir (dtb__21) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDir dtio_0)) dtb__21))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("makeDir " ^ dtb__21)) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_RemoveFile (dtb__22) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveFile dtio_0)) dtb__22))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("removeFile " ^ dtb__22)) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_RemoveTree (dtb__23) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveTree dtio_0)) dtb__23))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode ("removeTree " ^ dtb__23)) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_Rename (dtb__24, dtb__25) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRename dtio_0 dtio_1)) dtb__24) dtb__25))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["rename "; dtb__24; " -> "; dtb__25])) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_Symlink (dtb__26, dtb__27) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_trySymlink dtio_0 dtio_1)) dtb__26) dtb__27))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["symlink "; dtb__26; " -> "; dtb__27])) ok)) else ((Obj.magic k) 0))))))
  | C_FsOp_MakeDirExclusive (dtb__28) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDirExclusive dtio_0)) dtb__28))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok = 0) then ((Obj.magic k) true) else (if (ok = 6) then ((Obj.magic k) false) else (v_fsFailAt ((v_fsErrorOfCode ("makeDirExclusive " ^ dtb__28)) ok))))))))
  | C_FsOp_FileExists (dtb__29) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileExists dtio_0)) dtb__29))) (fun b -> ((Obj.magic k) b)))
  | C_FsOp_FileMtime (dtb__30) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileMtime dtio_0)) dtb__30))) (fun n -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (n))))))))
  | C_FsOp_FileSize (dtb__31) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) bi_natFromInt) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileSize dtio_0)) dtb__31)))) (fun n -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) v_fsHostStatus) (fun ok -> (if (ok <> 0) then ((Obj.magic k) B_dData_dMaybe.C_Maybe_Nothing) else ((Obj.magic k) (B_dData_dMaybe.C_Maybe_Just (n))))))))
  | _ -> failwith "DT: impossible branch"
))

# 313 "Base/Effect/Fs.vuna"
let v_handleFsHostHost = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs") n) 371381598) (dtp_effectId n)) (fun a -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) a))) v_fsOpHIOHost) comp))

# 317 "Base/Effect/Fs.vuna"
let v_runFsHost = (fun comp -> (B_dEffect_dCore.v_joinEff ((v_handleFsHostHost "default") comp)))

# 321 "Base/Effect/Fs.vuna"
let v_fsErrorRet = (fun a -> (B_dData_dResult.C_Result_Ok (a)))

# 325 "Base/Effect/Fs.vuna"
let v_fsErrorOpHR = (fun (op : t_FsErrorOp) _u -> (match op with
  | C_FsErrorOp_FsFail (dtb__32) -> (B_dData_dResult.C_Result_Err ((v_fsErrorText dtb__32)))
  | _ -> failwith "DT: impossible branch"
))

# 331 "Base/Effect/Fs.vuna"
let v_runFsError = (fun (n : string) comp -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs-error") n) 1044473165) (dtp_effectId n)) v_fsErrorRet) v_fsErrorOpHR) comp))

# 335 "Base/Effect/Fs.vuna"
let v_runFsErrorHost = (fun comp -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_runFsError "fs-error") comp)) (fun res -> (match res with
  | B_dData_dResult.C_Result_Ok (dtb__33) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) dtb__33)
  | B_dData_dResult.C_Result_Err (dtb__34) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun s -> (try prerr_string s; flush stderr; String.length s with _ -> 0)) dtio_0)) (String.concat "" ["vuna: "; dtb__34; "\n"])))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> B_dEffect_dCore.C_Eff_MkEff (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1))) (fun _u -> ((fun msg -> failwith msg) "unreachable: fs error handler")))))
  | _ -> failwith "DT: impossible branch"
))))
