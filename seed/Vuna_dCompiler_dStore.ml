open Vuna_runtime
type t_Vuna_dCompiler_dStore_dFrame = { f_Vuna_dCompiler_dStore_dFrame_fTag : string; f_Vuna_dCompiler_dStore_dFrame_fCodec : string; f_Vuna_dCompiler_dStore_dFrame_fPayload : string }

# 47 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreMagic = "vuna-cache-frame 2"

# 56 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dfTagOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dStore_dFrame_fTag = dtb__0; f_Vuna_dCompiler_dStore_dFrame_fCodec = dtb__1; f_Vuna_dCompiler_dStore_dFrame_fPayload = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dfCodecOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dStore_dFrame_fTag = dtb__3; f_Vuna_dCompiler_dStore_dFrame_fCodec = dtb__4; f_Vuna_dCompiler_dStore_dFrame_fPayload = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dfPayloadOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dStore_dFrame_fTag = dtb__6; f_Vuna_dCompiler_dStore_dFrame_fCodec = dtb__7; f_Vuna_dCompiler_dStore_dFrame_fPayload = dtb__8 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dframeHeader = (fun tag codec len digest -> (String.concat "" [v_Vuna_dCompiler_dStore_dstoreMagic; "|"; tag; "|"; codec; "|"; (bi_strFromInt len); "|"; digest; "\n"]))

# 70 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreEncode = (fun tag codec payload -> (((((v_Vuna_dCompiler_dStore_dframeHeader tag) codec) (bi_strLength payload)) (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress payload)) ^ payload))

# 77 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreEncodeAs = (fun tag codec digest payload -> (((((v_Vuna_dCompiler_dStore_dframeHeader tag) codec) (bi_strLength payload)) digest) ^ payload))

# 81 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dheaderFields = (fun line -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__9, dtb__10) -> (match dtb__10 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (match dtb__12 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (match dtb__16 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (match dtb__18 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__9; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__11; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__13; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__15; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } } } }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Base_dString.v_Base_dString_dsplit "|") line)))

# 86 "Vuna/Compiler/Store.vuna"
let rec v_Vuna_dCompiler_dStore_dbreakFirstNewline = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (if (dtb__19 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack dtb__20) })) else ((v_Vuna_dCompiler_dStore_dbreakFirstNewline dtb__20) (Base_dList.C_Base_dList_dList_Cons (dtb__19, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dframeSplit = (fun raw -> ((fun n -> ((fun headLen -> (match ((v_Vuna_dCompiler_dStore_dbreakFirstNewline (Base_dList.dtp_unpack (((dtp_substring 0) headLen) raw))) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__21) -> ((fun header -> ((fun start -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = header; Base_dPair.f_Base_dPair_dPair_second = (((dtp_substring start) (n - start)) raw) }))) ((bi_strLength header) + 1))) (Base_dPair.v_Base_dPair_dfirstOf dtb__21))
  | _ -> failwith "DT: impossible branch"
)) (if (n < 512) then n else 512))) (bi_strLength raw)))

# 109 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dheaderOk = (fun tag codec header payload -> (match (v_Vuna_dCompiler_dStore_dheaderFields header) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22) -> ((fun magic -> ((fun rest1 -> ((fun gotTag -> ((fun rest2 -> ((fun gotCodec -> ((fun rest3 -> ((fun gotLen -> (if (if (if (magic = v_Vuna_dCompiler_dStore_dstoreMagic) then (gotTag = tag) else false) then (gotCodec = codec) else false) then (gotLen = (bi_strFromInt (bi_strLength payload))) else false)) (Base_dPair.v_Base_dPair_dfirstOf rest3))) (Base_dPair.v_Base_dPair_dsecondOf rest2))) (Base_dPair.v_Base_dPair_dfirstOf rest2))) (Base_dPair.v_Base_dPair_dsecondOf rest1))) (Base_dPair.v_Base_dPair_dfirstOf rest1))) (Base_dPair.v_Base_dPair_dsecondOf dtb__22))) (Base_dPair.v_Base_dPair_dfirstOf dtb__22))
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dheaderDigestOf = (fun header -> (match (v_Vuna_dCompiler_dStore_dheaderFields header) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__23) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__23))))))
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreDecode = (fun tag codec raw -> (match (v_Vuna_dCompiler_dStore_dframeSplit raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> ((fun payload -> (if (if ((((v_Vuna_dCompiler_dStore_dheaderOk tag) codec) (Base_dPair.v_Base_dPair_dfirstOf dtb__24)) payload) then (((Base_dEq.v_Base_dEq_deq (Base_dMaybe.v_Eq_uBase_uMaybe_uMaybe_ua Base_dString.v_Eq_uString)) (v_Vuna_dCompiler_dStore_dheaderDigestOf (Base_dPair.v_Base_dPair_dfirstOf dtb__24))) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress payload)))) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (payload)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Base_dPair.v_Base_dPair_dsecondOf dtb__24))
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreDecodeAs = (fun tag codec digest raw -> (match (v_Vuna_dCompiler_dStore_dframeSplit raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__25) -> ((fun payload -> (if (if ((((v_Vuna_dCompiler_dStore_dheaderOk tag) codec) (Base_dPair.v_Base_dPair_dfirstOf dtb__25)) payload) then (((Base_dEq.v_Base_dEq_deq (Base_dMaybe.v_Eq_uBase_uMaybe_uMaybe_ua Base_dString.v_Eq_uString)) (v_Vuna_dCompiler_dStore_dheaderDigestOf (Base_dPair.v_Base_dPair_dfirstOf dtb__25))) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (digest))) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (payload)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Base_dPair.v_Base_dPair_dsecondOf dtb__25))
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreDecodeFast = (fun tag codec raw -> (match (v_Vuna_dCompiler_dStore_dframeSplit raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (if ((((v_Vuna_dCompiler_dStore_dheaderOk tag) codec) (Base_dPair.v_Base_dPair_dfirstOf dtb__26)) (Base_dPair.v_Base_dPair_dsecondOf dtb__26)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__26))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreDataRootEff = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_STORE")) (fun override -> (if (override <> "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) override) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "XDG_DATA_HOME")) (fun xdg -> (if (xdg <> "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (xdg ^ "/vuna/store")) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "HOME")) (fun home -> (if (if (home <> "") then (home <> "/homeless-shelter") else false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (home ^ "/.vuna/store")) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "TMPDIR")) (fun tmp -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (tmp = "") then "/tmp/vuna-store" else (tmp ^ "/vuna-store")))))))))))))))

# 189 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreReadEff = (fun nFs tag codec path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreDecode tag) codec) raw)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 198 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreReadFastEff = (fun nFs tag codec path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreDecodeFast tag) codec) raw)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 207 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreReadAsEff = (fun nFs tag codec digest path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dStore_dstoreDecodeAs tag) codec) digest) raw)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 216 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreWriteEff = (fun nFs tag codec path payload -> (((Base_dEffFs.v_Base_dEffFs_dfsWriteFileAtomic nFs) path) (((v_Vuna_dCompiler_dStore_dstoreEncode tag) codec) payload)))

# 220 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreWriteAsEff = (fun nFs tag codec digest path payload -> (((Base_dEffFs.v_Base_dEffFs_dfsWriteFileAtomic nFs) path) ((((v_Vuna_dCompiler_dStore_dstoreEncodeAs tag) codec) digest) payload)))

# 225 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreWriteIfChangedEff = (fun nFs tag codec path payload -> ((fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun old -> (if (old = raw) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dEffFs.v_Base_dEffFs_dfsWriteFileAtomic nFs) path) raw)))) else (((Base_dEffFs.v_Base_dEffFs_dfsWriteFileAtomic nFs) path) raw))))) (((v_Vuna_dCompiler_dStore_dstoreEncode tag) codec) payload)))

# 237 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreWriteIfChangedAsEff = (fun nFs tag codec digest path payload -> ((fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun old -> (if (old = raw) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dEffFs.v_Base_dEffFs_dfsWriteFileAtomic nFs) path) raw)))) else (((Base_dEffFs.v_Base_dEffFs_dfsWriteFileAtomic nFs) path) raw))))) ((((v_Vuna_dCompiler_dStore_dstoreEncodeAs tag) codec) digest) payload)))

# 248 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreFileExistsEff = (fun nFs path -> ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path))

# 251 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreRemoveEff = (fun nFs path -> ((Base_dEffFs.v_Base_dEffFs_dfsRemoveFile nFs) path))

# 264 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreEnsureDirFuel = (fun nFs nProcess fuel path -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("mkdir", (Base_dList.C_Base_dList_dList_Cons ("-p", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))))))))))

# 255 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreEnsureDirEff = (fun nFs nProcess path -> ((((v_Vuna_dCompiler_dStore_dstoreEnsureDirFuel nFs) nProcess) 256) path))

# 287 "Vuna/Compiler/Store.vuna"
let rec v_Vuna_dCompiler_dStore_dstoreDropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (if (dtb__27 = 47) then dtb__28 else (v_Vuna_dCompiler_dStore_dstoreDropPastSlash dtb__28))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreParentOf = (fun path -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength (Base_dList.v_Base_dList_dreverse rev))) then "." else ((fun p -> (if (p = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") p)) else false) then ("/" ^ p) else p))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dStore_dstoreDropPastSlash (Base_dList.v_Base_dList_dreverse rev)))) (Base_dList.dtp_unpack path)))

# 284 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreParentPathOf = (fun _uarity0 -> (v_Vuna_dCompiler_dStore_dstoreParentOf _uarity0))

# 310 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreRootEff = (fun nEnv -> (v_Vuna_dCompiler_dStore_dstoreDataRootEff nEnv))

# 313 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dfallbackRootEff = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "TMPDIR")) (fun tmp -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (tmp = "") then "/tmp/vuna-store" else (tmp ^ "/vuna-store"))))))

# 330 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_ddirReady = (fun nFs nProcess path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if (Base_dBool.v_Base_dBool_dnot exists) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("mkdir", (Base_dList.C_Base_dList_dList_Cons ("-p", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))))) (fun code -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (code = 0)))) else ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) path)))))

# 319 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreRootReadyEff = (fun nFs nEnv nProcess -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dStore_dstoreDataRootEff nEnv)) (fun primary -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_ddirReady nFs) nProcess) primary)) (fun ok -> (if ok then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) primary) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dStore_dfallbackRootEff nEnv)) (fun alt -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_ddirReady nFs) nProcess) alt)) (fun ok2 -> (if ok2 then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) alt) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) alt))))))))))))

# 185 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreCacheBaseEff = (fun nFs nEnv nProcess -> (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess))

# 339 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreObjectTag = (fun kind -> ("vuna-object 1/" ^ kind))

# 342 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dobjectPathIn = (fun root kind digest -> (String.concat "" [root; "/objects/"; kind; "/"; digest]))

# 345 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreObjectPathEff = (fun nFs nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dobjectPathIn root) kind) digest)))))

# 351 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreObjectExistsEff = (fun nFs nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dStore_dstoreObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path))))

# 357 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreObjectReadEff = (fun nFs nEnv nProcess kind codec digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dStore_dstoreObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((((v_Vuna_dCompiler_dStore_dstoreReadEff nFs) (v_Vuna_dCompiler_dStore_dstoreObjectTag kind)) codec) path))))

# 363 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreObjectWriteEff = (fun nFs nEnv nProcess kind codec digest payload -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreEnsureDirEff nFs) nProcess) (String.concat "" [root; "/objects/"; kind]))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dStore_dstoreObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((((v_Vuna_dCompiler_dStore_dstoreWriteIfChangedEff nFs) (v_Vuna_dCompiler_dStore_dstoreObjectTag kind)) codec) path) payload))))))))

# 371 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreObjectListEff = (fun nFs nEnv nProcess kind -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_ddirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) dir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil))))) (String.concat "" [root; "/objects/"; kind])))))

# 381 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreObjectRemoveEff = (fun nFs nClock nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dStore_dstoreObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then ((Base_dEffFs.v_Base_dEffFs_dfsRemoveFile nFs) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)))))))

# 394 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreViewPathEff = (fun nFs nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [root; "/views/"; kind; "/"; digest])))))

# 399 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreViewValidEff = (fun nFs nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dStore_dstoreViewPathEff nFs) nEnv) nProcess) kind) digest)) (fun dir -> ((fun marker -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) marker)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) marker)) (fun text -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (text = digest)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))) (dir ^ "/.complete")))))

# 434 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreViewUnlockEff = (fun nFs nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons ((String.concat "" [root; "/.tmp/lock-"; kind; "-"; digest]), Base_dList.C_Base_dList_dList_Nil))))))))))

# 440 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreScratchPathIn = (fun root kind digest -> (String.concat "" [root; "/.tmp/"; kind; "-"; digest]))

# 443 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreScratchPathEff = (fun nFs nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreScratchPathIn root) kind) digest)))))

# 449 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dscratchStaleSec = 600

# 452 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dscratchStale = (fun nFs nClock path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileMtime nFs) path)) (fun mtime -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffClock.v_Base_dEffClock_dclockNow nClock)) (fun us -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((mtime + v_Vuna_dCompiler_dStore_dscratchStaleSec) < (if 1000000 = 0 then failwith "division by zero" else us / 1000000))))))))

# 422 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dclaimAt = (fun nFs nClock nProcess path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("mkdir", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))) (fun code -> (if (code = 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dscratchStale nFs) nClock) path)) (fun stale -> (if (Base_dBool.v_Base_dBool_dnot stale) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("mkdir", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))) (fun code2 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (code2 = 0)))))))))))))

# 413 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreViewLockEff = (fun nFs nClock nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreEnsureDirEff nFs) nProcess) (v_Vuna_dCompiler_dStore_dstoreParentPathOf path))) (fun _u -> ((((v_Vuna_dCompiler_dStore_dclaimAt nFs) nClock) nProcess) path)))) (String.concat "" [root; "/.tmp/lock-"; kind; "-"; digest])))))

# 459 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreScratchClaimEff = (fun nFs nClock nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dStore_dstoreScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreEnsureDirEff nFs) nProcess) (v_Vuna_dCompiler_dStore_dstoreParentPathOf path))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("mkdir", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))) (fun code -> (if (code = 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dscratchStale nFs) nClock) path)) (fun stale -> (if (Base_dBool.v_Base_dBool_dnot stale) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("mkdir", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))) (fun code2 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (code2 = 0)))))))))))))))))

# 473 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreScratchPathOfClaim = (fun nFs nEnv nProcess _uarity7 _uarity8 -> (((((v_Vuna_dCompiler_dStore_dstoreScratchPathEff nFs) nEnv) nProcess) _uarity7) _uarity8))

# 477 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreScratchDropEff = (fun nFs nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dStore_dstoreScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil))))))))))

# 483 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreViewPublishEff = (fun nFs nEnv nProcess kind digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dStore_dstoreScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun scratch -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dStore_dstoreViewPathEff nFs) nEnv) nProcess) kind) digest)) (fun view -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreEnsureDirEff nFs) nProcess) (v_Vuna_dCompiler_dStore_dstoreParentPathOf view))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffFs.v_Base_dEffFs_dfsWriteFileAtomic nFs) (scratch ^ "/.complete")) digest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("mv", (Base_dList.C_Base_dList_dList_Cons (scratch, (Base_dList.C_Base_dList_dList_Cons (view, Base_dList.C_Base_dList_dList_Nil)))))))) (fun code -> (if (code = 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (scratch, Base_dList.C_Base_dList_dList_Nil)))))))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)))))))))))))))

# 501 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreRootsPathEff = (fun nFs nEnv nProcess projectId -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [root; "/roots/"; projectId])))))

# 507 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dinsertRootLine = (fun line lines -> (if ((Base_dList.v_Base_dList_dmemName line) lines) then lines else (Base_dList.C_Base_dList_dList_Cons (line, lines))))

# 510 "Vuna/Compiler/Store.vuna"
let rec v_Vuna_dCompiler_dStore_dmergeRootLines = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> ((v_Vuna_dCompiler_dStore_dmergeRootLines ((v_Vuna_dCompiler_dStore_dinsertRootLine dtb__29) mc0)) dtb__30)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Store.vuna"
let rec v_Vuna_dCompiler_dStore_dwriteRootFiles = (fun nFs nProcess mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreEnsureDirEff nFs) nProcess) mc0)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffFs.v_Base_dEffFs_dfsWriteFileAtomic nFs) (String.concat "" [mc0; "/"; dtb__31])) "")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dStore_dwriteRootFiles nFs) nProcess) mc0) dtb__32)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (n + 1))))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreRootAppendEff = (fun nFs nEnv nProcess projectId digests -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dStore_dstoreRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) dir)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) dir)) (fun isDir -> (if isDir then ((((v_Vuna_dCompiler_dStore_dwriteRootFiles nFs) nProcess) dir) digests) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) dir)) (fun text -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsRemoveFile nFs) dir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dStore_dwriteRootFiles nFs) nProcess) dir) ((Base_dList.v_Base_dList_dfilter (fun l -> ((bi_strLength l) > 0))) ((Base_dString.v_Base_dString_dsplit "\n") text)))) (fun _u -> ((((v_Vuna_dCompiler_dStore_dwriteRootFiles nFs) nProcess) dir) digests)))))))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _u -> ((((v_Vuna_dCompiler_dStore_dwriteRootFiles nFs) nProcess) dir) digests)))))))))

# 544 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreRootLoadEff = (fun nFs nEnv nProcess projectId -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dStore_dstoreRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) path)) (fun isDir -> (if isDir then ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) path) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun text -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dfilter (fun l -> ((bi_strLength l) > 0))) ((Base_dString.v_Base_dString_dsplit "\n") text)))))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)))))))

# 557 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreRootProjectListEff = (fun nFs nEnv nProcess -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_ddirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((Base_dEffFs.v_Base_dEffFs_dfsReadDir nFs) dir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil))))) (root ^ "/roots")))))

# 567 "Vuna/Compiler/Store.vuna"
let v_Vuna_dCompiler_dStore_dstoreRootRemoveEff = (fun nFs nEnv nProcess projectId -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dStore_dstoreRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) path)) (fun isDir -> (if isDir then (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil))))))) else ((Base_dEffFs.v_Base_dEffFs_dfsRemoveFile nFs) path)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)))))))
