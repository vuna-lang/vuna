open Vuna_runtime
type t_Frame = { f_Frame_fTag : string; f_Frame_fCodec : string; f_Frame_fPayload : string }

# 47 "Vuna/Compiler/Base/Store.vuna"
let v_storeMagic = "vuna-cache-frame 2"

# 56 "Vuna/Compiler/Base/Store.vuna"
let v_fTagOf = (fun (mc0 : t_Frame) -> (match mc0 with
  | { f_Frame_fTag = dtb__0; f_Frame_fCodec = dtb__1; f_Frame_fPayload = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Base/Store.vuna"
let v_fCodecOf = (fun (mc0 : t_Frame) -> (match mc0 with
  | { f_Frame_fTag = dtb__3; f_Frame_fCodec = dtb__4; f_Frame_fPayload = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Base/Store.vuna"
let v_fPayloadOf = (fun (mc0 : t_Frame) -> (match mc0 with
  | { f_Frame_fTag = dtb__6; f_Frame_fCodec = dtb__7; f_Frame_fPayload = dtb__8 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Base/Store.vuna"
let v_frameHeader = (fun (tag : string) (codec : string) (len : int) (digest : string) -> (String.concat "" [v_storeMagic; "|"; tag; "|"; codec; "|"; (bi_strFromInt len); "|"; digest; "\n"]))

# 70 "Vuna/Compiler/Base/Store.vuna"
let v_storeEncode = (fun (tag : string) (codec : string) (payload : string) -> (((((v_frameHeader tag) codec) (bi_strLength payload)) (Base_dHash.v_contentAddress payload)) ^ payload))

# 78 "Vuna/Compiler/Base/Store.vuna"
let v_storeEncodeAs = (fun (tag : string) (codec : string) (digest : string) (payload : string) -> (((((v_frameHeader tag) codec) (bi_strLength payload)) digest) ^ payload))

# 82 "Vuna/Compiler/Base/Store.vuna"
let v_headerFields = (fun (line : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match dtb__10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match dtb__12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (match dtb__14 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (match dtb__16 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__9; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__11; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__13; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = dtb__17 } } } }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) ((B_dData_dString.v_split "|") line)))

# 88 "Vuna/Compiler/Base/Store.vuna"
let rec v_breakFirstNewline = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (if (dtb__19 = 10) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)); B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack dtb__20) })) else ((v_breakFirstNewline dtb__20) (B_dData_dList.C_List__x58__x58_ (dtb__19, mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Base/Store.vuna"
let v_frameSplit = (fun (raw : string) -> ((fun n -> ((fun headLen -> (match ((v_breakFirstNewline (B_dData_dList.dtp_unpack (((dtp_substring 0) headLen) raw))) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> ((fun header -> ((fun start -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = header; B_dData_dPair.f_Pair_second = (((dtp_substring start) (n - start)) raw) }))) ((bi_strLength header) + 1))) (B_dData_dPair.v_firstOf dtb__21))
  | _ -> failwith "DT: impossible branch"
)) (if (n < 512) then n else 512))) (bi_strLength raw)))

# 113 "Vuna/Compiler/Base/Store.vuna"
let v_headerOk = (fun (tag : string) (codec : string) (header : string) (payload : string) -> (match (v_headerFields header) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> ((fun magic -> ((fun rest1 -> ((fun gotTag -> ((fun rest2 -> ((fun gotCodec -> ((fun rest3 -> ((fun gotLen -> (if (if (if (magic = v_storeMagic) then (gotTag = tag) else false) then (gotCodec = codec) else false) then (gotLen = (bi_strFromInt (bi_strLength payload))) else false)) (B_dData_dPair.v_firstOf rest3))) (B_dData_dPair.v_secondOf rest2))) (B_dData_dPair.v_firstOf rest2))) (B_dData_dPair.v_secondOf rest1))) (B_dData_dPair.v_firstOf rest1))) (B_dData_dPair.v_secondOf dtb__22))) (B_dData_dPair.v_firstOf dtb__22))
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Base/Store.vuna"
let v_headerDigestOf = (fun (header : string) -> (match (v_headerFields header) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__23))))))
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Base/Store.vuna"
let v_storeDecode = (fun (tag : string) (codec : string) (raw : string) -> (match (v_frameSplit raw) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> ((fun payload -> (if (if ((((v_headerOk tag) codec) (B_dData_dPair.v_firstOf dtb__24)) payload) then (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_uBase_uData_uMaybe_uMaybe_ua B_dData_dString.v_Eq_uString)) (v_headerDigestOf (B_dData_dPair.v_firstOf dtb__24))) (B_dData_dMaybe.C_Maybe_Just ((Base_dHash.v_contentAddress payload)))) else false) then (B_dData_dMaybe.C_Maybe_Just (payload)) else B_dData_dMaybe.C_Maybe_Nothing)) (B_dData_dPair.v_secondOf dtb__24))
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Base/Store.vuna"
let v_storeDecodeAs = (fun (tag : string) (codec : string) (digest : string) (raw : string) -> (match (v_frameSplit raw) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> ((fun payload -> (if (if ((((v_headerOk tag) codec) (B_dData_dPair.v_firstOf dtb__25)) payload) then (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_uBase_uData_uMaybe_uMaybe_ua B_dData_dString.v_Eq_uString)) (v_headerDigestOf (B_dData_dPair.v_firstOf dtb__25))) (B_dData_dMaybe.C_Maybe_Just (digest))) else false) then (B_dData_dMaybe.C_Maybe_Just (payload)) else B_dData_dMaybe.C_Maybe_Nothing)) (B_dData_dPair.v_secondOf dtb__25))
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Base/Store.vuna"
let v_dirUnder = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" [dtb__26; "/"; mc0])))
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Base/Store.vuna"
let v_homeStoreRootEff = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "HOME")) (fun home -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (if (if (home <> "") then (home <> "/homeless-shelter") else false) then (B_dData_dMaybe.C_Maybe_Just ((home ^ "/.vuna/store"))) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 196 "Vuna/Compiler/Base/Store.vuna"
let v_tmpStoreRootEff = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (v_dirUnder "vuna-store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "TMPDIR"))) (fun found -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((B_dData_dMaybe.v_fromMaybe "/tmp/vuna-store") found)))))

# 173 "Vuna/Compiler/Base/Store.vuna"
let v_storeDataRootEff = (fun (nEnv : string) -> ((fun override -> ((fun xdg -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dData_dList.v_firstSuccess B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dList.C_List__x58__x58_ (override, (B_dData_dList.C_List__x58__x58_ (xdg, (B_dData_dList.C_List__x58__x58_ ((v_homeStoreRootEff nEnv), B_dData_dList.C_List_Nil)))))))) (fun found -> (((B_dData_dMaybe.v_maybe (v_tmpStoreRootEff nEnv)) (B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur)) found)))) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (v_dirUnder "vuna/store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "XDG_DATA_HOME")))) ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "VUNA_STORE")))

# 208 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadEff = (fun (nFs : string) (tag : string) (codec : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((v_storeDecode tag) codec) raw)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))

# 220 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadAsEff = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) -> (((B_dData_dObs_dSpan.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((((v_storeDecodeAs tag) codec) digest) raw)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing))))))

# 234 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteEff = (fun (nFs : string) (tag : string) (codec : string) (path : string) (payload : string) -> (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) (((v_storeEncode tag) codec) payload)))

# 238 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteAsEff = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) (payload : string) -> (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) ((((v_storeEncodeAs tag) codec) digest) payload)))

# 243 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedEff = (fun (nFs : string) (tag : string) (codec : string) (path : string) (payload : string) -> ((fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = raw) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw)))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw))))) (((v_storeEncode tag) codec) payload)))

# 257 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedAsEff = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) (payload : string) -> ((fun raw -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = raw) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw)))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw))))) ((((v_storeEncodeAs tag) codec) digest) payload)))

# 270 "Vuna/Compiler/Base/Store.vuna"
let v_storeFileExistsEff = (fun (nFs : string) (path : string) -> ((B_dEffect_dFs.v_fsFileExists nFs) path))

# 273 "Vuna/Compiler/Base/Store.vuna"
let v_storeRemoveEff = (fun (nFs : string) (path : string) -> ((B_dEffect_dFs.v_fsRemoveFile nFs) path))

# 317 "Vuna/Compiler/Base/Store.vuna"
let rec v_storeDropPastSlash = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (if (dtb__27 = 47) then dtb__28 else (v_storeDropPastSlash dtb__28))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Base/Store.vuna"
let v_storeParentOf = (fun (path : string) -> ((fun rev -> ((fun after -> (if ((B_dData_dList.v_length after) = (B_dData_dList.v_length (B_dData_dList.v_reverse rev))) then "." else ((fun p -> (if (p = "") then (if ((B_dData_dString.v_startsWith "/") path) then "/" else ".") else (if (if ((B_dData_dString.v_startsWith "/") path) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "/") p)) else false) then ("/" ^ p) else p))) (B_dData_dList.dtp_pack (B_dData_dList.v_reverse after))))) (v_storeDropPastSlash (B_dData_dList.v_reverse rev)))) (B_dData_dList.dtp_unpack path)))

# 285 "Vuna/Compiler/Base/Store.vuna"
let rec v_storeEnsureDirFuel = (fun (nFs : string) (nProcess : string) (fuel : int) (path : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_storeEnsureDirFuel nFs) nProcess) (fuel - 1)) (v_storeParentOf path))) (fun _u -> ((B_dEffect_dFs.v_fsMakeDir nFs) path)))))))))

# 277 "Vuna/Compiler/Base/Store.vuna"
let v_storeEnsureDirEff = (fun (nFs : string) (nProcess : string) (path : string) -> ((((v_storeEnsureDirFuel nFs) nProcess) 256) path))

# 314 "Vuna/Compiler/Base/Store.vuna"
let v_storeParentPathOf = (fun (_uarity0 : string) -> (v_storeParentOf _uarity0))

# 340 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootEff = (fun (nEnv : string) -> (v_storeDataRootEff nEnv))

# 358 "Vuna/Compiler/Base/Store.vuna"
let v_dirReady = (fun (nFs : string) (nProcess : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if (B_dData_dBool.v_not exists) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") (B_dData_dList.C_List__x58__x58_ ("mkdir", (B_dData_dList.C_List__x58__x58_ ("-p", (B_dData_dList.C_List__x58__x58_ (path, B_dData_dList.C_List_Nil)))))))) (fun code -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (code = 0)))) else ((B_dEffect_dFs.v_fsIsDirectory nFs) path)))))

# 344 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootReadyEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_storeDataRootEff nEnv)) (fun primary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_dirReady nFs) nProcess) primary)) (fun ok -> (if ok then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) primary) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_tmpStoreRootEff nEnv)) (fun alt -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_dirReady nFs) nProcess) alt)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) alt)))))))))))

# 204 "Vuna/Compiler/Base/Store.vuna"
let v_storeCacheBaseEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((v_storeRootReadyEff nFs) nEnv) nProcess))

# 370 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectTag = (fun (kind : string) -> ("vuna-object 1/" ^ kind))

# 373 "Vuna/Compiler/Base/Store.vuna"
let v_objectPathIn = (fun (root : string) (kind : string) (digest : string) -> (String.concat "" [root; "/objects/"; kind; "/"; digest]))

# 376 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((v_objectPathIn root) kind) digest)))))

# 383 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectExistsEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((B_dEffect_dFs.v_fsFileExists nFs) path))))

# 390 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectReadEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (codec : string) (digest : string) -> (((B_dData_dObs_dSpan.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((((v_storeReadEff nFs) (v_storeObjectTag kind)) codec) path)))))

# 399 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectWriteEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (codec : string) (digest : string) (payload : string) -> (((B_dData_dObs_dSpan.v_obsSpanEff "vuna.cache.write") "vuna.cache") (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeEnsureDirEff nFs) nProcess) (String.concat "" [root; "/objects/"; kind]))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((((v_storeWriteIfChangedEff nFs) (v_storeObjectTag kind)) codec) path) payload)))))))))

# 410 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectListEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((fun dir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_dirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((B_dEffect_dFs.v_fsReadDir nFs) dir) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil))))) (String.concat "" [root; "/objects/"; kind])))))

# 421 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectRemoveEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dEffect_dFs.v_fsRemoveFile nFs) path) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)))))))

# 435 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [root; "/views/"; kind; "/"; digest])))))

# 441 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewValidEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeViewPathEff nFs) nEnv) nProcess) kind) digest)) (fun dir -> ((fun marker -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) marker)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) marker)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (text = digest)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false))))) (dir ^ "/.complete")))))

# 484 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewUnlockEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dEffect_dFs.v_fsRemoveTree nFs) (String.concat "" [root; "/.tmp/lock-"; kind; "-"; digest])))))

# 491 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchPathIn = (fun (root : string) (kind : string) (digest : string) -> (String.concat "" [root; "/.tmp/"; kind; "-"; digest]))

# 494 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((v_storeScratchPathIn root) kind) digest)))))

# 501 "Vuna/Compiler/Base/Store.vuna"
let v_scratchStaleSec = 600

# 504 "Vuna/Compiler/Base/Store.vuna"
let v_scratchStale = (fun (nFs : string) (nClock : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun us -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((mtime + v_scratchStaleSec) < (if 1000000 = 0 then failwith "division by zero" else us / 1000000))))))))

# 468 "Vuna/Compiler/Base/Store.vuna"
let v_claimAt = (fun (nFs : string) (nClock : string) (nProcess : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsMakeDirExclusive nFs) path)) (fun ok -> (if ok then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) true) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_scratchStale nFs) nClock) path)) (fun stale -> (if (B_dData_dBool.v_not stale) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsRemoveTree nFs) path)) (fun _u -> ((B_dEffect_dFs.v_fsMakeDirExclusive nFs) path))))))))))

# 458 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewLockEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeEnsureDirEff nFs) nProcess) (v_storeParentPathOf path))) (fun _u -> ((((v_claimAt nFs) nClock) nProcess) path)))) (String.concat "" [root; "/.tmp/lock-"; kind; "-"; digest])))))

# 512 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchClaimEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeEnsureDirEff nFs) nProcess) (v_storeParentPathOf path))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsMakeDirExclusive nFs) path)) (fun ok -> (if ok then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) true) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_scratchStale nFs) nClock) path)) (fun stale -> (if (B_dData_dBool.v_not stale) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) false) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsRemoveTree nFs) path)) (fun _u -> ((B_dEffect_dFs.v_fsMakeDirExclusive nFs) path))))))))))))))

# 530 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchPathOfClaim = (fun (nFs : string) (nEnv : string) (nProcess : string) (_uarity7 : string) (_uarity8 : string) -> (((((v_storeScratchPathEff nFs) nEnv) nProcess) _uarity7) _uarity8))

# 534 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchDropEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((B_dEffect_dFs.v_fsRemoveTree nFs) path))))

# 541 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewPublishEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun scratch -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeViewPathEff nFs) nEnv) nProcess) kind) digest)) (fun view -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeEnsureDirEff nFs) nProcess) (v_storeParentPathOf view))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) (scratch ^ "/.complete")) digest)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dFs.v_fsRename nFs) scratch) view)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0))))))))))))

# 557 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootsPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (String.concat "" [root; "/roots/"; projectId])))))

# 564 "Vuna/Compiler/Base/Store.vuna"
let v_insertRootLine = (fun (line : string) (lines : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName line) lines) then lines else (B_dData_dList.C_List__x58__x58_ (line, lines))))

# 567 "Vuna/Compiler/Base/Store.vuna"
let rec v_mergeRootLines = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> ((v_mergeRootLines ((v_insertRootLine dtb__29) mc0)) dtb__30)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 573 "Vuna/Compiler/Base/Store.vuna"
let v_projectPathFileName = ".project"

# 577 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathRecordEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) (projectPath : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeEnsureDirEff nFs) nProcess) dir)) (fun _u -> ((fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if ((B_dData_dString.v_trim old) = projectPath) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) projectPath)))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) projectPath))))) (String.concat "" [dir; "/"; v_projectPathFileName])))))))

# 594 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> ((fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dString.v_trim text)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing))))) (String.concat "" [dir; "/"; v_projectPathFileName])))))

# 619 "Vuna/Compiler/Base/Store.vuna"
let rec v_writeRootFiles = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeEnsureDirEff nFs) nProcess) mc0)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) (String.concat "" [mc0; "/"; dtb__31])) "")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_writeRootFiles nFs) nProcess) mc0) dtb__32)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (n + 1))))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 611 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootAppendEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) (projectPath : string) (digests : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_storeProjectPathRecordEff nFs) nEnv) nProcess) projectId) projectPath)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeEnsureDirEff nFs) nProcess) dir)) (fun _u -> ((((v_writeRootFiles nFs) nProcess) dir) digests))))))))

# 629 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootLoadEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadDir nFs) path)) (fun names -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dString.v_startsWith ".") n)))) names)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil)))))))

# 642 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootProjectListEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((fun dir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((v_dirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((B_dEffect_dFs.v_fsReadDir nFs) dir) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dList.C_List_Nil))))) (root ^ "/roots")))))

# 653 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootRemoveEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) path)) (fun isDir -> (if isDir then ((B_dEffect_dFs.v_fsRemoveTree nFs) path) else ((B_dEffect_dFs.v_fsRemoveFile nFs) path)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)))))))
