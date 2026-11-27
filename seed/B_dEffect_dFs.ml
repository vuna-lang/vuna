open Vuna_runtime
type t_FsOp = C_FsOp_ReadFile of (string) | C_FsOp_ReadFileRange of (string) * (int) * (int) | C_FsOp_WriteFile of (string) * (string) | C_FsOp_WriteFileAtomic of (string) * (string) | C_FsOp_ReadDir of (string) | C_FsOp_IsDirectory of (string) | C_FsOp_MakeDir of (string) | C_FsOp_RemoveFile of (string) | C_FsOp_FileExists of (string) | C_FsOp_FileMtime of (string) | C_FsOp_FileSize of (string) | C_FsOp_RemoveTree of (string) | C_FsOp_Rename of (string) * (string) | C_FsOp_Symlink of (string) * (string) | C_FsOp_MakeDirExclusive of (string)
and t_FsError = C_FsError_FsMissing of (string) | C_FsError_FsDenied of (string) | C_FsError_FsNoSpace of (string) | C_FsError_FsNotDir of (string) | C_FsError_FsIsDir of (string) | C_FsError_FsExists of (string) | C_FsError_FsIo of (string)
and t_FsErrorOp = C_FsErrorOp_FsFail of (t_FsError)

# 86 "Base/Effect/Fs.vuna"
let v_fsFail = (fun (dtb_u_u1 : string) (dtb_u_u5 : t_FsError) -> (((((B_dEffect_dCore.v_sendCoreId "fs-error") dtb_u_u1) 1044473165) (dtp_effectId dtb_u_u1)) (C_FsErrorOp_FsFail (dtb_u_u5))))

# 90 "Base/Effect/Fs.vuna"
let v_fsErrorOfCode = (fun (dtb_u_u6 : string) (dtb_u_u7 : int) -> (if (dtb_u_u7 = 1) then (C_FsError_FsMissing (dtb_u_u6)) else (if (dtb_u_u7 = 2) then (C_FsError_FsDenied (dtb_u_u6)) else (if (dtb_u_u7 = 3) then (C_FsError_FsNoSpace (dtb_u_u6)) else (if (dtb_u_u7 = 4) then (C_FsError_FsNotDir (dtb_u_u6)) else (if (dtb_u_u7 = 5) then (C_FsError_FsIsDir (dtb_u_u6)) else (if (dtb_u_u7 = 6) then (C_FsError_FsExists (dtb_u_u6)) else (C_FsError_FsIo (dtb_u_u6)))))))))

# 100 "Base/Effect/Fs.vuna"
let v_fsErrorText = (fun (dtb_u_u8 : t_FsError) -> (match dtb_u_u8 with
  | C_FsError_FsIo (dtb_u_u9) -> (String.concat "" ["fs: "; dtb_u_u9; ": host I/O error"])
  | C_FsError_FsExists (dtb_u_u10) -> (String.concat "" ["fs: "; dtb_u_u10; ": already exists"])
  | C_FsError_FsIsDir (dtb_u_u11) -> (String.concat "" ["fs: "; dtb_u_u11; ": is a directory"])
  | C_FsError_FsNotDir (dtb_u_u12) -> (String.concat "" ["fs: "; dtb_u_u12; ": not a directory"])
  | C_FsError_FsNoSpace (dtb_u_u13) -> (String.concat "" ["fs: "; dtb_u_u13; ": no space left on device"])
  | C_FsError_FsDenied (dtb_u_u14) -> (String.concat "" ["fs: "; dtb_u_u14; ": permission denied"])
  | C_FsError_FsMissing (dtb_u_u15) -> (String.concat "" ["fs: "; dtb_u_u15; ": no such file or directory"])
  | _ -> failwith "DT: impossible branch"
))

# 113 "Base/Effect/Fs.vuna"
let v_isDotEntry = (fun (dtb_u_u16 : string) -> (if (dtb_u_u16 = ".") then true else (dtb_u_u16 = "..")))

# 116 "Base/Effect/Fs.vuna"
let v_sortEntries = (fun (dtb_u_u17 : string B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (dtb_u_u18 : string) (dtb_u_u19 : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) dtb_u_u18) dtb_u_u19))) ((B_dData_dList.v_filter (fun (dtb_u_u20 : string) -> (B_dData_dBool.v_not (v_isDotEntry dtb_u_u20)))) dtb_u_u17)))

# 120 "Base/Effect/Fs.vuna"
let v_fsReadFile = (fun (dtb_u_u21 : string) (dtb_u_u24 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u21) 371381598) (dtp_effectId dtb_u_u21)) (C_FsOp_ReadFile (dtb_u_u24))))

# 126 "Base/Effect/Fs.vuna"
let v_fsReadFileRange = (fun (dtb_u_u25 : string) (dtb_u_u28 : string) (dtb_u_u29 : int) (dtb_u_u30 : int) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u25) 371381598) (dtp_effectId dtb_u_u25)) (C_FsOp_ReadFileRange (dtb_u_u28, dtb_u_u29, dtb_u_u30))))

# 138 "Base/Effect/Fs.vuna"
let v_fsChunkStep = (fun (dtb_u_u31 : string) (dtb_u_u34 : (string, (int, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match dtb_u_u34 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u35; B_dData_dPair.f_Pair_second = dtb_u_u36 } -> (match dtb_u_u36 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u37; B_dData_dPair.f_Pair_second = dtb_u_u38 } -> (Obj.repr ((fun (dtb_u_u43 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u44 = Obj.obj (((((v_fsReadFileRange dtb_u_u31) dtb_u_u35) dtb_u_u37) dtb_u_u38)) in (let dtb_u_u46 = (dtb_u_u44 dtb_u_u43) in (if ((String.length dtb_u_u46) <= 0) then (let dtb_u_u48 = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u34 } in dtb_u_u48) else (let dtb_u_u51 = { B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u46)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u35; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (dtb_u_u37 + (String.length dtb_u_u46)); B_dData_dPair.f_Pair_second = dtb_u_u38 } } } in dtb_u_u51)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 134 "Base/Effect/Fs.vuna"
let v_fsFileCursor = (fun (dtb_u_u53 : string) (dtb_u_u56 : string) (dtb_u_u57 : int) -> (let dtb_u_u59 = ((B_dEffect_dCursor.v_cursorOfState { B_dData_dPair.f_Pair_first = dtb_u_u56; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (if (dtb_u_u57 <= 0) then 65536 else dtb_u_u57) } }) (v_fsChunkStep dtb_u_u53)) in (Obj.repr ((fun (dtb_u_u60 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u59)))))

# 150 "Base/Effect/Fs.vuna"
let v_fsWriteFile = (fun (dtb_u_u61 : string) (dtb_u_u64 : string) (dtb_u_u65 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u61) 371381598) (dtp_effectId dtb_u_u61)) (C_FsOp_WriteFile (dtb_u_u64, dtb_u_u65))))

# 156 "Base/Effect/Fs.vuna"
let v_fsWriteFileAtomic = (fun (dtb_u_u66 : string) (dtb_u_u69 : string) (dtb_u_u70 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u66) 371381598) (dtp_effectId dtb_u_u66)) (C_FsOp_WriteFileAtomic (dtb_u_u69, dtb_u_u70))))

# 162 "Base/Effect/Fs.vuna"
let v_fsReadDir = (fun (dtb_u_u71 : string) (dtb_u_u74 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u71) 371381598) (dtp_effectId dtb_u_u71)) (C_FsOp_ReadDir (dtb_u_u74))))

# 168 "Base/Effect/Fs.vuna"
let v_fsIsDirectory = (fun (dtb_u_u75 : string) (dtb_u_u78 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u75) 371381598) (dtp_effectId dtb_u_u75)) (C_FsOp_IsDirectory (dtb_u_u78))))

# 174 "Base/Effect/Fs.vuna"
let v_fsMakeDir = (fun (dtb_u_u79 : string) (dtb_u_u82 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u79) 371381598) (dtp_effectId dtb_u_u79)) (C_FsOp_MakeDir (dtb_u_u82))))

# 180 "Base/Effect/Fs.vuna"
let v_fsRemoveFile = (fun (dtb_u_u83 : string) (dtb_u_u86 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u83) 371381598) (dtp_effectId dtb_u_u83)) (C_FsOp_RemoveFile (dtb_u_u86))))

# 186 "Base/Effect/Fs.vuna"
let v_fsFileExists = (fun (dtb_u_u87 : string) (dtb_u_u90 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u87) 371381598) (dtp_effectId dtb_u_u87)) (C_FsOp_FileExists (dtb_u_u90))))

# 190 "Base/Effect/Fs.vuna"
let v_fsFileMtime = (fun (dtb_u_u91 : string) (dtb_u_u94 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u91) 371381598) (dtp_effectId dtb_u_u91)) (C_FsOp_FileMtime (dtb_u_u94))))

# 194 "Base/Effect/Fs.vuna"
let v_fsFileSize = (fun (dtb_u_u95 : string) (dtb_u_u98 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u95) 371381598) (dtp_effectId dtb_u_u95)) (C_FsOp_FileSize (dtb_u_u98))))

# 198 "Base/Effect/Fs.vuna"
let v_fsRemoveTree = (fun (dtb_u_u99 : string) (dtb_u_u102 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u99) 371381598) (dtp_effectId dtb_u_u99)) (C_FsOp_RemoveTree (dtb_u_u102))))

# 202 "Base/Effect/Fs.vuna"
let v_fsRename = (fun (dtb_u_u103 : string) (dtb_u_u106 : string) (dtb_u_u107 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u103) 371381598) (dtp_effectId dtb_u_u103)) (C_FsOp_Rename (dtb_u_u106, dtb_u_u107))))

# 206 "Base/Effect/Fs.vuna"
let v_fsSymlink = (fun (dtb_u_u108 : string) (dtb_u_u111 : string) (dtb_u_u112 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u108) 371381598) (dtp_effectId dtb_u_u108)) (C_FsOp_Symlink (dtb_u_u111, dtb_u_u112))))

# 210 "Base/Effect/Fs.vuna"
let v_fsMakeDirExclusive = (fun (dtb_u_u113 : string) (dtb_u_u116 : string) -> (((((B_dEffect_dCore.v_sendCoreId "fs") dtb_u_u113) 371381598) (dtp_effectId dtb_u_u113)) (C_FsOp_MakeDirExclusive (dtb_u_u116))))

# 214 "Base/Effect/Fs.vuna"
let v_handleFs = (fun (dtb_u_u122 : string) dtb_u_u124 dtb_u_u125 dtb_u_u126 -> (((((((B_dEffect_dCore.v_handleCoreId "fs") dtb_u_u122) 371381598) (dtp_effectId dtb_u_u122)) dtb_u_u124) (Obj.magic dtb_u_u125)) dtb_u_u126))

# 221 "Base/Effect/Fs.vuna"
let v_fsHostStatus = (B_dEffect_dHost.v_hostSync (Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (dtp_hostStatus ()))))

# 225 "Base/Effect/Fs.vuna"
let v_fsFailAt = (fun (dtb_u_u129 : t_FsError) -> (((((B_dEffect_dCore.v_sendCoreId "fs-error") "fs-error") 1044473165) 1044473165) (C_FsErrorOp_FsFail (dtb_u_u129))))

# 229 "Base/Effect/Fs.vuna"
let v_fsOpHIOHost = (fun (dtb_u_u132 : t_FsOp) dtb_u_u133 -> (match dtb_u_u132 with
  | C_FsOp_ReadFile (dtb_u_u134) -> (Obj.repr ((fun (dtb_u_u139 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u140 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFile dtio_0)) dtb_u_u134))) in (let dtb_u_u142 = (dtb_u_u140 dtb_u_u139) in (let dtb_u_u148 = Obj.obj (v_fsHostStatus) in (let dtb_u_u150 = (dtb_u_u148 dtb_u_u139) in (if (dtb_u_u150 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("readFile " ^ dtb_u_u134)) dtb_u_u150))) dtb_u_u139) else ((Obj.magic ((Obj.magic dtb_u_u133) dtb_u_u142)) dtb_u_u139)))))))))
  | C_FsOp_ReadFileRange (dtb_u_u151, dtb_u_u152, dtb_u_u153) -> (Obj.repr ((fun (dtb_u_u158 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u159 = Obj.obj ((B_dEffect_dHost.v_hostSync ((((fun dtio_0 dtio_1 dtio_2 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryReadFileRange dtio_0 dtio_1 dtio_2)) dtb_u_u151) dtb_u_u152) dtb_u_u153))) in (let dtb_u_u161 = (dtb_u_u159 dtb_u_u158) in (let dtb_u_u167 = Obj.obj (v_fsHostStatus) in (let dtb_u_u169 = (dtb_u_u167 dtb_u_u158) in (if (dtb_u_u169 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("readFileRange " ^ dtb_u_u151)) dtb_u_u169))) dtb_u_u158) else ((Obj.magic ((Obj.magic dtb_u_u133) dtb_u_u161)) dtb_u_u158)))))))))
  | C_FsOp_WriteFile (dtb_u_u170, dtb_u_u171) -> (Obj.repr ((fun (dtb_u_u176 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u177 = Obj.obj ((B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFile dtio_0 dtio_1)) dtb_u_u170) dtb_u_u171))) in (let dtb_u_u179 = (dtb_u_u177 dtb_u_u176) in (let dtb_u_u185 = Obj.obj (v_fsHostStatus) in (let dtb_u_u187 = (dtb_u_u185 dtb_u_u176) in (if (dtb_u_u187 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("writeFile " ^ dtb_u_u170)) dtb_u_u187))) dtb_u_u176) else ((Obj.magic ((Obj.magic dtb_u_u133) (bi_natFromInt (String.length dtb_u_u171)))) dtb_u_u176)))))))))
  | C_FsOp_WriteFileAtomic (dtb_u_u188, dtb_u_u189) -> (Obj.repr ((fun (dtb_u_u194 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u195 = Obj.obj ((B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryWriteFileAtomic dtio_0 dtio_1)) dtb_u_u188) dtb_u_u189))) in (let dtb_u_u197 = (dtb_u_u195 dtb_u_u194) in (let dtb_u_u203 = Obj.obj (v_fsHostStatus) in (let dtb_u_u205 = (dtb_u_u203 dtb_u_u194) in (if (dtb_u_u205 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("writeFileAtomic " ^ dtb_u_u188)) dtb_u_u205))) dtb_u_u194) else ((Obj.magic ((Obj.magic dtb_u_u133) (String.length dtb_u_u189))) dtb_u_u194)))))))))
  | C_FsOp_ReadDir (dtb_u_u206) -> (Obj.repr ((fun (dtb_u_u211 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u212 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> (fun p -> B_dData_dList.dtp_listOf (dtp_tryReadDir p)) dtio_0)) dtb_u_u206))) in (let dtb_u_u214 = (dtb_u_u212 dtb_u_u211) in (let dtb_u_u220 = Obj.obj (v_fsHostStatus) in (let dtb_u_u222 = (dtb_u_u220 dtb_u_u211) in (if (dtb_u_u222 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("readDir " ^ dtb_u_u206)) dtb_u_u222))) dtb_u_u211) else ((Obj.magic ((Obj.magic dtb_u_u133) (v_sortEntries dtb_u_u214))) dtb_u_u211)))))))))
  | C_FsOp_IsDirectory (dtb_u_u223) -> (Obj.repr ((fun (dtb_u_u228 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u229 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryIsDirectory dtio_0)) dtb_u_u223))) in (let dtb_u_u231 = (dtb_u_u229 dtb_u_u228) in (let dtb_u_u237 = Obj.obj (v_fsHostStatus) in (let dtb_u_u239 = (dtb_u_u237 dtb_u_u228) in (if (dtb_u_u239 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("isDirectory " ^ dtb_u_u223)) dtb_u_u239))) dtb_u_u228) else ((Obj.magic ((Obj.magic dtb_u_u133) dtb_u_u231)) dtb_u_u228)))))))))
  | C_FsOp_MakeDir (dtb_u_u240) -> (Obj.repr ((fun (dtb_u_u245 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u246 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDir dtio_0)) dtb_u_u240))) in (let dtb_u_u248 = (dtb_u_u246 dtb_u_u245) in (let dtb_u_u254 = Obj.obj (v_fsHostStatus) in (let dtb_u_u256 = (dtb_u_u254 dtb_u_u245) in (if (dtb_u_u256 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("makeDir " ^ dtb_u_u240)) dtb_u_u256))) dtb_u_u245) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u245)))))))))
  | C_FsOp_RemoveFile (dtb_u_u257) -> (Obj.repr ((fun (dtb_u_u262 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u263 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveFile dtio_0)) dtb_u_u257))) in (let dtb_u_u265 = (dtb_u_u263 dtb_u_u262) in (let dtb_u_u271 = Obj.obj (v_fsHostStatus) in (let dtb_u_u273 = (dtb_u_u271 dtb_u_u262) in (if (dtb_u_u273 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("removeFile " ^ dtb_u_u257)) dtb_u_u273))) dtb_u_u262) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u262)))))))))
  | C_FsOp_RemoveTree (dtb_u_u274) -> (Obj.repr ((fun (dtb_u_u279 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u280 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRemoveTree dtio_0)) dtb_u_u274))) in (let dtb_u_u282 = (dtb_u_u280 dtb_u_u279) in (let dtb_u_u288 = Obj.obj (v_fsHostStatus) in (let dtb_u_u290 = (dtb_u_u288 dtb_u_u279) in (if (dtb_u_u290 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("removeTree " ^ dtb_u_u274)) dtb_u_u290))) dtb_u_u279) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u279)))))))))
  | C_FsOp_Rename (dtb_u_u291, dtb_u_u292) -> (Obj.repr ((fun (dtb_u_u297 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u298 = Obj.obj ((B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryRename dtio_0 dtio_1)) dtb_u_u291) dtb_u_u292))) in (let dtb_u_u300 = (dtb_u_u298 dtb_u_u297) in (let dtb_u_u306 = Obj.obj (v_fsHostStatus) in (let dtb_u_u308 = (dtb_u_u306 dtb_u_u297) in (if (dtb_u_u308 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["rename "; dtb_u_u291; " -> "; dtb_u_u292])) dtb_u_u308))) dtb_u_u297) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u297)))))))))
  | C_FsOp_Symlink (dtb_u_u309, dtb_u_u310) -> (Obj.repr ((fun (dtb_u_u315 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u316 = Obj.obj ((B_dEffect_dHost.v_hostSync (((fun dtio_0 dtio_1 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_trySymlink dtio_0 dtio_1)) dtb_u_u309) dtb_u_u310))) in (let dtb_u_u318 = (dtb_u_u316 dtb_u_u315) in (let dtb_u_u324 = Obj.obj (v_fsHostStatus) in (let dtb_u_u326 = (dtb_u_u324 dtb_u_u315) in (if (dtb_u_u326 <> 0) then ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode (String.concat "" ["symlink "; dtb_u_u309; " -> "; dtb_u_u310])) dtb_u_u326))) dtb_u_u315) else ((Obj.magic ((Obj.magic dtb_u_u133) 0)) dtb_u_u315)))))))))
  | C_FsOp_MakeDirExclusive (dtb_u_u327) -> (Obj.repr ((fun (dtb_u_u332 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u333 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_tryMakeDirExclusive dtio_0)) dtb_u_u327))) in (let dtb_u_u335 = (dtb_u_u333 dtb_u_u332) in (let dtb_u_u341 = Obj.obj (v_fsHostStatus) in (let dtb_u_u343 = (dtb_u_u341 dtb_u_u332) in (if (dtb_u_u343 = 0) then ((Obj.magic ((Obj.magic dtb_u_u133) true)) dtb_u_u332) else (if (dtb_u_u343 = 6) then ((Obj.magic ((Obj.magic dtb_u_u133) false)) dtb_u_u332) else ((Obj.magic (v_fsFailAt ((v_fsErrorOfCode ("makeDirExclusive " ^ dtb_u_u327)) dtb_u_u343))) dtb_u_u332))))))))))
  | C_FsOp_FileExists (dtb_u_u344) -> (Obj.repr ((fun (dtb_u_u349 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u350 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileExists dtio_0)) dtb_u_u344))) in (let dtb_u_u352 = (dtb_u_u350 dtb_u_u349) in ((Obj.magic ((Obj.magic dtb_u_u133) dtb_u_u352)) dtb_u_u349))))))
  | C_FsOp_FileMtime (dtb_u_u353) -> (Obj.repr ((fun (dtb_u_u358 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u359 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileMtime dtio_0)) dtb_u_u353))) in (let dtb_u_u361 = (dtb_u_u359 dtb_u_u358) in (let dtb_u_u367 = Obj.obj (v_fsHostStatus) in (let dtb_u_u369 = (dtb_u_u367 dtb_u_u358) in (if (dtb_u_u369 <> 0) then ((Obj.magic ((Obj.magic dtb_u_u133) B_dData_dMaybe.C_Maybe_Nothing)) dtb_u_u358) else ((Obj.magic ((Obj.magic dtb_u_u133) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u361)))) dtb_u_u358)))))))))
  | C_FsOp_FileSize (dtb_u_u370) -> (Obj.repr ((fun (dtb_u_u375 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u376 = Obj.obj ((((fun dtb_u_u380 dtb_u_u381 -> (Obj.repr ((fun (dtb_u_u382 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u383 = Obj.obj (dtb_u_u381) in (dtb_u_u380 (dtb_u_u383 dtb_u_u382))))))) bi_natFromInt) (B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_fileSize dtio_0)) dtb_u_u370)))) in (let dtb_u_u384 = (dtb_u_u376 dtb_u_u375) in (let dtb_u_u390 = Obj.obj (v_fsHostStatus) in (let dtb_u_u392 = (dtb_u_u390 dtb_u_u375) in (if (dtb_u_u392 <> 0) then ((Obj.magic ((Obj.magic dtb_u_u133) B_dData_dMaybe.C_Maybe_Nothing)) dtb_u_u375) else ((Obj.magic ((Obj.magic dtb_u_u133) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u384)))) dtb_u_u375)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 313 "Base/Effect/Fs.vuna"
let v_handleFsHostHost = (fun (dtb_u_u395 : string) dtb_u_u396 -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs") dtb_u_u395) 371381598) (dtp_effectId dtb_u_u395)) (fun dtb_u_u397 -> (let dtb_u_u399 = dtb_u_u397 in (Obj.repr ((fun (dtb_u_u400 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u399)))))) v_fsOpHIOHost) dtb_u_u396))

# 319 "Base/Effect/Fs.vuna"
let v_runFsHost = (fun dtb_u_u403 -> (B_dEffect_dCore.v_joinEff ((v_handleFsHostHost "default") dtb_u_u403)))

# 323 "Base/Effect/Fs.vuna"
let v_fsErrorRet = (fun dtb_u_u405 -> (B_dData_dResult.C_Result_Ok (dtb_u_u405)))

# 327 "Base/Effect/Fs.vuna"
let v_fsErrorOpHR = (fun (dtb_u_u408 : t_FsErrorOp) dtb_u_u409 -> (match dtb_u_u408 with
  | C_FsErrorOp_FsFail (dtb_u_u410) -> (B_dData_dResult.C_Result_Err ((v_fsErrorText dtb_u_u410)))
  | _ -> failwith "DT: impossible branch"
))

# 333 "Base/Effect/Fs.vuna"
let v_runFsError = (fun (dtb_u_u411 : string) dtb_u_u414 -> (((((((B_dEffect_dCore.v_handleCoreAtId "fs-error") dtb_u_u411) 1044473165) (dtp_effectId dtb_u_u411)) v_fsErrorRet) v_fsErrorOpHR) dtb_u_u414))

# 337 "Base/Effect/Fs.vuna"
let v_runFsResult = (fun dtb_u_u416 -> ((v_runFsError "fs-error") (v_runFsHost dtb_u_u416)))

# 341 "Base/Effect/Fs.vuna"
let v_runFsErrorHost = (fun dtb_u_u419 -> (Obj.repr ((fun (dtb_u_u424 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u425 = Obj.obj (((v_runFsError "fs-error") dtb_u_u419)) in (let dtb_u_u427 = (dtb_u_u425 dtb_u_u424) in (match dtb_u_u427 with
  | B_dData_dResult.C_Result_Ok (dtb_u_u428) -> (let dtb_u_u430 = dtb_u_u428 in dtb_u_u430)
  | B_dData_dResult.C_Result_Err (dtb_u_u432) -> (let dtb_u_u438 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_eprint dtio_0)) (String.concat "" ["vuna: "; dtb_u_u432; "\n"])))) in (let dtb_u_u440 = (dtb_u_u438 dtb_u_u424) in (let dtb_u_u446 = Obj.obj ((B_dEffect_dHost.v_hostSync ((fun dtio_0 -> Obj.repr (fun (_ : B_dEffect_dCore.t_EffUnit) -> dtp_exit dtio_0)) 1))) in (let dtb_u_u448 = (dtb_u_u446 dtb_u_u424) in ((Obj.magic ((fun msg -> failwith msg) "unreachable: fs error handler")) dtb_u_u424)))))
  | _ -> failwith "DT: impossible branch"
)))))))
