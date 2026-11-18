open Vuna_runtime
type t_Vuna_dCompiler_dBase_dStore_dFrame = { f_Vuna_dCompiler_dBase_dStore_dFrame_fTag : string; f_Vuna_dCompiler_dBase_dStore_dFrame_fCodec : string; f_Vuna_dCompiler_dBase_dStore_dFrame_fPayload : string }

# 47 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreMagic = "vuna-cache-frame 2"

# 56 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dfTagOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dStore_dFrame_fTag = dtb__0; f_Vuna_dCompiler_dBase_dStore_dFrame_fCodec = dtb__1; f_Vuna_dCompiler_dBase_dStore_dFrame_fPayload = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dfCodecOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dStore_dFrame_fTag = dtb__3; f_Vuna_dCompiler_dBase_dStore_dFrame_fCodec = dtb__4; f_Vuna_dCompiler_dBase_dStore_dFrame_fPayload = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dfPayloadOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dBase_dStore_dFrame_fTag = dtb__6; f_Vuna_dCompiler_dBase_dStore_dFrame_fCodec = dtb__7; f_Vuna_dCompiler_dBase_dStore_dFrame_fPayload = dtb__8 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dframeHeader = (fun tag codec len digest -> (String.concat "" [v_Vuna_dCompiler_dBase_dStore_dstoreMagic; "|"; tag; "|"; codec; "|"; (bi_strFromInt len); "|"; digest; "\n"]))

# 70 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreEncode = (fun tag codec payload -> (((((v_Vuna_dCompiler_dBase_dStore_dframeHeader tag) codec) (bi_strLength payload)) (Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_dcontentAddress payload)) ^ payload))

# 78 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreEncodeAs = (fun tag codec digest payload -> (((((v_Vuna_dCompiler_dBase_dStore_dframeHeader tag) codec) (bi_strLength payload)) digest) ^ payload))

# 82 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dheaderFields = (fun line -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (match dtb__10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__11, dtb__12) -> (match dtb__12 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (match dtb__16 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__9; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__11; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__13; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__15; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__17 } } } }))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Base_dData_dString.v_Base_dData_dString_dsplit "|") line)))

# 87 "Vuna/Compiler/Base/Store.vuna"
let rec v_Vuna_dCompiler_dBase_dStore_dbreakFirstNewline = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__19, dtb__20) -> (if (dtb__19 = 10) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.dtp_pack dtb__20) })) else ((v_Vuna_dCompiler_dBase_dStore_dbreakFirstNewline dtb__20) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__19, mc1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dframeSplit = (fun raw -> ((fun n -> ((fun headLen -> (match ((v_Vuna_dCompiler_dBase_dStore_dbreakFirstNewline (Base_dData_dList.dtp_unpack (((dtp_substring 0) headLen) raw))) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__21) -> ((fun header -> ((fun start -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = header; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((dtp_substring start) (n - start)) raw) }))) ((bi_strLength header) + 1))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__21))
  | _ -> failwith "DT: impossible branch"
)) (if (n < 512) then n else 512))) (bi_strLength raw)))

# 110 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dheaderOk = (fun tag codec header payload -> (match (v_Vuna_dCompiler_dBase_dStore_dheaderFields header) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22) -> ((fun magic -> ((fun rest1 -> ((fun gotTag -> ((fun rest2 -> ((fun gotCodec -> ((fun rest3 -> ((fun gotLen -> (if (if (if (magic = v_Vuna_dCompiler_dBase_dStore_dstoreMagic) then (gotTag = tag) else false) then (gotCodec = codec) else false) then (gotLen = (bi_strFromInt (bi_strLength payload))) else false)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf rest3))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf rest2))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf rest2))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf rest1))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf rest1))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__22))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__22))
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dheaderDigestOf = (fun header -> (match (v_Vuna_dCompiler_dBase_dStore_dheaderFields header) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__23) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__23))))))
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreDecode = (fun tag codec raw -> (match (v_Vuna_dCompiler_dBase_dStore_dframeSplit raw) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__24) -> ((fun payload -> (if (if ((((v_Vuna_dCompiler_dBase_dStore_dheaderOk tag) codec) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__24)) payload) then (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ (Base_dData_dMaybe.v_Eq_uBase_uData_uMaybe_uMaybe_ua Base_dData_dString.v_Eq_uString)) (v_Vuna_dCompiler_dBase_dStore_dheaderDigestOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__24))) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_dcontentAddress payload)))) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (payload)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__24))
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreDecodeAs = (fun tag codec digest raw -> (match (v_Vuna_dCompiler_dBase_dStore_dframeSplit raw) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__25) -> ((fun payload -> (if (if ((((v_Vuna_dCompiler_dBase_dStore_dheaderOk tag) codec) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__25)) payload) then (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ (Base_dData_dMaybe.v_Eq_uBase_uData_uMaybe_uMaybe_ua Base_dData_dString.v_Eq_uString)) (v_Vuna_dCompiler_dBase_dStore_dheaderDigestOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__25))) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (digest))) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (payload)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__25))
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_ddirUnder = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__26) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" [dtb__26; "/"; mc0])))
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dhomeStoreRootEff = (fun nEnv -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dEnv.v_Base_dEffect_dEnv_denvGetEnv nEnv) "HOME")) (fun home -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if (if (home <> "") then (home <> "/homeless-shelter") else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((home ^ "/.vuna/store"))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))))

# 187 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dtmpStoreRootEff = (fun nEnv -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dTrait_dFunctor.v_Base_dTrait_dFunctor_dfmap Base_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (v_Vuna_dCompiler_dBase_dStore_ddirUnder "vuna-store")) ((Base_dEffect_dEnv.v_Base_dEffect_dEnv_denvGetEnvNonEmpty nEnv) "TMPDIR"))) (fun found -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dData_dMaybe.v_Base_dData_dMaybe_dfromMaybe "/tmp/vuna-store") found)))))

# 165 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreDataRootEff = (fun nEnv -> ((fun override -> ((fun xdg -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dData_dList.v_Base_dData_dList_dfirstSuccess Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (override, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (xdg, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dBase_dStore_dhomeStoreRootEff nEnv), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))) (fun found -> (((Base_dData_dMaybe.v_Base_dData_dMaybe_dmaybe (v_Vuna_dCompiler_dBase_dStore_dtmpStoreRootEff nEnv)) (Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur)) found)))) (((Base_dTrait_dFunctor.v_Base_dTrait_dFunctor_dfmap Base_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (v_Vuna_dCompiler_dBase_dStore_ddirUnder "vuna/store")) ((Base_dEffect_dEnv.v_Base_dEffect_dEnv_denvGetEnvNonEmpty nEnv) "XDG_DATA_HOME")))) ((Base_dEffect_dEnv.v_Base_dEffect_dEnv_denvGetEnvNonEmpty nEnv) "VUNA_STORE")))

# 198 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreReadEff = (fun nFs tag codec path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) path)) (fun raw -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreDecode tag) codec) raw)))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))))

# 207 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreReadAsEff = (fun nFs tag codec digest path -> (((Base_dData_dObs_dSpan.v_Base_dData_dObs_dSpan_dobsSpanEff "vuna.cache.lookup") "vuna.cache") (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) path)) (fun raw -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dBase_dStore_dstoreDecodeAs tag) codec) digest) raw)))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))

# 217 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreWriteEff = (fun nFs tag codec path payload -> (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) path) (((v_Vuna_dCompiler_dBase_dStore_dstoreEncode tag) codec) payload)))

# 221 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreWriteAsEff = (fun nFs tag codec digest path payload -> (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) path) ((((v_Vuna_dCompiler_dBase_dStore_dstoreEncodeAs tag) codec) digest) payload)))

# 226 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreWriteIfChangedEff = (fun nFs tag codec path payload -> ((fun raw -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) path)) (fun old -> (if (old = raw) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) path) raw)))) else (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) path) raw))))) (((v_Vuna_dCompiler_dBase_dStore_dstoreEncode tag) codec) payload)))

# 238 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreWriteIfChangedAsEff = (fun nFs tag codec digest path payload -> ((fun raw -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) path)) (fun old -> (if (old = raw) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) path) raw)))) else (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) path) raw))))) ((((v_Vuna_dCompiler_dBase_dStore_dstoreEncodeAs tag) codec) digest) payload)))

# 249 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreFileExistsEff = (fun nFs path -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path))

# 252 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreRemoveEff = (fun nFs path -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveFile nFs) path))

# 290 "Vuna/Compiler/Base/Store.vuna"
let rec v_Vuna_dCompiler_dBase_dStore_dstoreDropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__27, dtb__28) -> (if (dtb__27 = 47) then dtb__28 else (v_Vuna_dCompiler_dBase_dStore_dstoreDropPastSlash dtb__28))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreParentOf = (fun path -> ((fun rev -> ((fun after -> (if ((Base_dData_dList.v_Base_dData_dList_dlength after) = (Base_dData_dList.v_Base_dData_dList_dlength (Base_dData_dList.v_Base_dData_dList_dreverse rev))) then "." else ((fun p -> (if (p = "") then (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") path) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dString.v_Base_dData_dString_dstartsWith "/") p)) else false) then ("/" ^ p) else p))) (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse after))))) (v_Vuna_dCompiler_dBase_dStore_dstoreDropPastSlash (Base_dData_dList.v_Base_dData_dList_dreverse rev)))) (Base_dData_dList.dtp_unpack path)))

# 264 "Vuna/Compiler/Base/Store.vuna"
let rec v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirFuel = (fun nFs nProcess fuel path -> (if (fuel <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirFuel nFs) nProcess) (fuel - 1)) (v_Vuna_dCompiler_dBase_dStore_dstoreParentOf path))) (fun _u -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsMakeDir nFs) path)))))))))

# 256 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff = (fun nFs nProcess path -> ((((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirFuel nFs) nProcess) 256) path))

# 287 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreParentPathOf = (fun _uarity0 -> (v_Vuna_dCompiler_dBase_dStore_dstoreParentOf _uarity0))

# 313 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreRootEff = (fun nEnv -> (v_Vuna_dCompiler_dBase_dStore_dstoreDataRootEff nEnv))

# 328 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_ddirReady = (fun nFs nProcess path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot exists) then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dEffect_dProcess.v_Base_dEffect_dProcess_dprocessRunIn nProcess) ".") (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("mkdir", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("-p", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (path, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))) (fun code -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (code = 0)))) else ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) path)))))

# 317 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff = (fun nFs nEnv nProcess -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_Vuna_dCompiler_dBase_dStore_dstoreDataRootEff nEnv)) (fun primary -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_ddirReady nFs) nProcess) primary)) (fun ok -> (if ok then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) primary) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_Vuna_dCompiler_dBase_dStore_dtmpStoreRootEff nEnv)) (fun alt -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_ddirReady nFs) nProcess) alt)) (fun _u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) alt)))))))))))

# 194 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreCacheBaseEff = (fun nFs nEnv nProcess -> (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess))

# 337 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreObjectTag = (fun kind -> ("vuna-object 1/" ^ kind))

# 340 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dobjectPathIn = (fun root kind digest -> (String.concat "" [root; "/objects/"; kind; "/"; digest]))

# 343 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreObjectPathEff = (fun nFs nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dobjectPathIn root) kind) digest)))))

# 349 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreObjectExistsEff = (fun nFs nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path))))

# 355 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreObjectReadEff = (fun nFs nEnv nProcess kind codec digest -> (((Base_dData_dObs_dSpan.v_Base_dData_dObs_dSpan_dobsSpanEff "vuna.cache.lookup") "vuna.cache") (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((((v_Vuna_dCompiler_dBase_dStore_dstoreReadEff nFs) (v_Vuna_dCompiler_dBase_dStore_dstoreObjectTag kind)) codec) path)))))

# 362 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreObjectWriteEff = (fun nFs nEnv nProcess kind codec digest payload -> (((Base_dData_dObs_dSpan.v_Base_dData_dObs_dSpan_dobsSpanEff "vuna.cache.write") "vuna.cache") (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) (String.concat "" [root; "/objects/"; kind]))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((((v_Vuna_dCompiler_dBase_dStore_dstoreWriteIfChangedEff nFs) (v_Vuna_dCompiler_dBase_dStore_dstoreObjectTag kind)) codec) path) payload)))))))))

# 371 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreObjectListEff = (fun nFs nEnv nProcess kind -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((fun dir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_ddirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) dir) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (String.concat "" [root; "/objects/"; kind])))))

# 381 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreObjectRemoveEff = (fun nFs nClock nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveFile nFs) path) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)))))))

# 394 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreViewPathEff = (fun nFs nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [root; "/views/"; kind; "/"; digest])))))

# 399 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreViewValidEff = (fun nFs nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreViewPathEff nFs) nEnv) nProcess) kind) digest)) (fun dir -> ((fun marker -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) marker)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) marker)) (fun text -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (text = digest)))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false))))) (dir ^ "/.complete")))))

# 433 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreViewUnlockEff = (fun nFs nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveTree nFs) (String.concat "" [root; "/.tmp/lock-"; kind; "-"; digest])))))

# 439 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathIn = (fun root kind digest -> (String.concat "" [root; "/.tmp/"; kind; "-"; digest]))

# 442 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathEff = (fun nFs nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathIn root) kind) digest)))))

# 448 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dscratchStaleSec = 600

# 451 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dscratchStale = (fun nFs nClock path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dTrait_dFunctor.v_Base_dTrait_dFunctor_dfmap Base_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (Base_dData_dMaybe.v_Base_dData_dMaybe_dfromMaybe 0)) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileMtime nFs) path))) (fun mtime -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dEffect_dClock.v_Base_dEffect_dClock_dclockNow nClock)) (fun us -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((mtime + v_Vuna_dCompiler_dBase_dStore_dscratchStaleSec) < (if 1000000 = 0 then failwith "division by zero" else us / 1000000))))))))

# 422 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dclaimAt = (fun nFs nClock nProcess path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsMakeDirExclusive nFs) path)) (fun ok -> (if ok then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) true) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dscratchStale nFs) nClock) path)) (fun stale -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot stale) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveTree nFs) path)) (fun _u -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsMakeDirExclusive nFs) path))))))))))

# 413 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreViewLockEff = (fun nFs nClock nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((fun path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) (v_Vuna_dCompiler_dBase_dStore_dstoreParentPathOf path))) (fun _u -> ((((v_Vuna_dCompiler_dBase_dStore_dclaimAt nFs) nClock) nProcess) path)))) (String.concat "" [root; "/.tmp/lock-"; kind; "-"; digest])))))

# 458 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreScratchClaimEff = (fun nFs nClock nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) (v_Vuna_dCompiler_dBase_dStore_dstoreParentPathOf path))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsMakeDirExclusive nFs) path)) (fun ok -> (if ok then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) true) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dscratchStale nFs) nClock) path)) (fun stale -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot stale) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveTree nFs) path)) (fun _u -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsMakeDirExclusive nFs) path))))))))))))))

# 471 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathOfClaim = (fun nFs nEnv nProcess _uarity7 _uarity8 -> (((((v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathEff nFs) nEnv) nProcess) _uarity7) _uarity8))

# 475 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreScratchDropEff = (fun nFs nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveTree nFs) path))))

# 481 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreViewPublishEff = (fun nFs nEnv nProcess kind digest -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun scratch -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreViewPathEff nFs) nEnv) nProcess) kind) digest)) (fun view -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) (v_Vuna_dCompiler_dBase_dStore_dstoreParentPathOf view))) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) (scratch ^ "/.complete")) digest)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRename nFs) scratch) view)) (fun _u -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0))))))))))))

# 496 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreRootsPathEff = (fun nFs nEnv nProcess projectId -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [root; "/roots/"; projectId])))))

# 502 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dinsertRootLine = (fun line lines -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName line) lines) then lines else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (line, lines))))

# 505 "Vuna/Compiler/Base/Store.vuna"
let rec v_Vuna_dCompiler_dBase_dStore_dmergeRootLines = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__29, dtb__30) -> ((v_Vuna_dCompiler_dBase_dStore_dmergeRootLines ((v_Vuna_dCompiler_dBase_dStore_dinsertRootLine dtb__29) mc0)) dtb__30)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dprojectPathFileName = ".project"

# 515 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreProjectPathRecordEff = (fun nFs nEnv nProcess projectId projectPath -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dBase_dStore_dstoreRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _u -> ((fun path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) path)) (fun old -> (if ((Base_dData_dString.v_Base_dData_dString_dtrim old) = projectPath) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) path) projectPath)))) else (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) path) projectPath))))) (String.concat "" [dir; "/"; v_Vuna_dCompiler_dBase_dStore_dprojectPathFileName])))))))

# 529 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreProjectPathEff = (fun nFs nEnv nProcess projectId -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dBase_dStore_dstoreRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> ((fun path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) path)) (fun text -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dString.v_Base_dData_dString_dtrim text)))))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))) (String.concat "" [dir; "/"; v_Vuna_dCompiler_dBase_dStore_dprojectPathFileName])))))

# 563 "Vuna/Compiler/Base/Store.vuna"
let rec v_Vuna_dCompiler_dBase_dStore_dwriteRootFiles = (fun nFs nProcess mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__31, dtb__32) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) mc0)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsWriteFileAtomic nFs) (String.concat "" [mc0; "/"; dtb__31])) "")) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dBase_dStore_dwriteRootFiles nFs) nProcess) mc0) dtb__32)) (fun n -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (n + 1))))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 544 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreRootAppendEff = (fun nFs nEnv nProcess projectId projectPath digests -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dBase_dStore_dstoreProjectPathRecordEff nFs) nEnv) nProcess) projectId) projectPath)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dBase_dStore_dstoreRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) dir)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) dir)) (fun isDir -> (if isDir then ((((v_Vuna_dCompiler_dBase_dStore_dwriteRootFiles nFs) nProcess) dir) digests) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) dir)) (fun text -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveFile nFs) dir)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dBase_dStore_dwriteRootFiles nFs) nProcess) dir) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun l -> ((bi_strLength l) > 0))) ((Base_dData_dString.v_Base_dData_dString_dsplit "\n") text)))) (fun _u -> ((((v_Vuna_dCompiler_dBase_dStore_dwriteRootFiles nFs) nProcess) dir) digests)))))))))))) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff nFs) nProcess) dir)) (fun _u -> ((((v_Vuna_dCompiler_dBase_dStore_dwriteRootFiles nFs) nProcess) dir) digests)))))))))))

# 573 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreRootLoadEff = (fun nFs nEnv nProcess projectId -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dBase_dStore_dstoreRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) path)) (fun isDir -> (if isDir then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) path)) (fun names -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun n -> (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dString.v_Base_dData_dString_dstartsWith ".") n)))) names)))) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) path)) (fun text -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun l -> ((bi_strLength l) > 0))) ((Base_dData_dString.v_Base_dData_dString_dsplit "\n") text)))))))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))

# 588 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreRootProjectListEff = (fun nFs nEnv nProcess -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((fun dir -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dBase_dStore_ddirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadDir nFs) dir) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (root ^ "/roots")))))

# 598 "Vuna/Compiler/Base/Store.vuna"
let v_Vuna_dCompiler_dBase_dStore_dstoreRootRemoveEff = (fun nFs nEnv nProcess projectId -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_Vuna_dCompiler_dBase_dStore_dstoreRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsIsDirectory nFs) path)) (fun isDir -> (if isDir then ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveTree nFs) path) else ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsRemoveFile nFs) path)))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)))))))
