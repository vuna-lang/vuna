open Vuna_runtime
type t_Vuna_dCompiler_dStore_dFrame = { f_Vuna_dCompiler_dStore_dFrame_fTag : string; f_Vuna_dCompiler_dStore_dFrame_fCodec : string; f_Vuna_dCompiler_dStore_dFrame_fPayload : string }

let v_Vuna_dCompiler_dStore_dstoreMagic = "vuna-cache-frame 2"

let v_Vuna_dCompiler_dStore_dfTagOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dStore_dFrame_fTag = dtb__0; f_Vuna_dCompiler_dStore_dFrame_fCodec = dtb__1; f_Vuna_dCompiler_dStore_dFrame_fPayload = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dfCodecOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dStore_dFrame_fTag = dtb__3; f_Vuna_dCompiler_dStore_dFrame_fCodec = dtb__4; f_Vuna_dCompiler_dStore_dFrame_fPayload = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dfPayloadOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dStore_dFrame_fTag = dtb__6; f_Vuna_dCompiler_dStore_dFrame_fCodec = dtb__7; f_Vuna_dCompiler_dStore_dFrame_fPayload = dtb__8 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dframeHeader = (fun tag codec len digest -> (String.concat "" [v_Vuna_dCompiler_dStore_dstoreMagic; "|"; tag; "|"; codec; "|"; (bi_strFromInt len); "|"; digest; "\n"]))

let v_Vuna_dCompiler_dStore_dstoreEncode = (fun tag codec payload -> (((((v_Vuna_dCompiler_dStore_dframeHeader tag) codec) (bi_strLength payload)) (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress payload)) ^ payload))

let v_Vuna_dCompiler_dStore_dstoreEncodeAs = (fun tag codec digest payload -> (((((v_Vuna_dCompiler_dStore_dframeHeader tag) codec) (bi_strLength payload)) digest) ^ payload))

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

let rec v_Vuna_dCompiler_dStore_dbreakFirstNewline = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> (if (dtb__19 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.dtp_pack dtb__20) })) else ((v_Vuna_dCompiler_dStore_dbreakFirstNewline dtb__20) (Base_dList.C_Base_dList_dList_Cons (dtb__19, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dframeSplit = (fun raw -> ((fun n -> ((fun headLen -> (match ((v_Vuna_dCompiler_dStore_dbreakFirstNewline (Base_dList.dtp_unpack (((dtp_substring 0) headLen) raw))) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__21) -> ((fun header -> ((fun start -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = header; Base_dPair.f_Base_dPair_dPair_second = (((dtp_substring start) (n - start)) raw) }))) ((bi_strLength header) + 1))) (Base_dPair.v_Base_dPair_dfirstOf dtb__21))
  | _ -> failwith "DT: impossible branch"
)) (if (n < 512) then n else 512))) (bi_strLength raw)))

let v_Vuna_dCompiler_dStore_dheaderOk = (fun tag codec header payload -> (match (v_Vuna_dCompiler_dStore_dheaderFields header) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22) -> ((fun magic -> ((fun rest1 -> ((fun gotTag -> ((fun rest2 -> ((fun gotCodec -> ((fun rest3 -> ((fun gotLen -> (if (if (if (magic = v_Vuna_dCompiler_dStore_dstoreMagic) then (gotTag = tag) else false) then (gotCodec = codec) else false) then (gotLen = (bi_strFromInt (bi_strLength payload))) else false)) (Base_dPair.v_Base_dPair_dfirstOf rest3))) (Base_dPair.v_Base_dPair_dsecondOf rest2))) (Base_dPair.v_Base_dPair_dfirstOf rest2))) (Base_dPair.v_Base_dPair_dsecondOf rest1))) (Base_dPair.v_Base_dPair_dfirstOf rest1))) (Base_dPair.v_Base_dPair_dsecondOf dtb__22))) (Base_dPair.v_Base_dPair_dfirstOf dtb__22))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dheaderDigestOf = (fun header -> (match (v_Vuna_dCompiler_dStore_dheaderFields header) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__23) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__23))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dstoreDecode = (fun tag codec raw -> (match (v_Vuna_dCompiler_dStore_dframeSplit raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> ((fun payload -> (if (if ((((v_Vuna_dCompiler_dStore_dheaderOk tag) codec) (Base_dPair.v_Base_dPair_dfirstOf dtb__24)) payload) then (((Base_dEq.v_Base_dEq_deq (Base_dMaybe.v_Eq_uBase_uMaybe_uMaybe_ua Base_dString.v_Eq_uString)) (v_Vuna_dCompiler_dStore_dheaderDigestOf (Base_dPair.v_Base_dPair_dfirstOf dtb__24))) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress payload)))) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (payload)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Base_dPair.v_Base_dPair_dsecondOf dtb__24))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dstoreDecodeAs = (fun tag codec digest raw -> (match (v_Vuna_dCompiler_dStore_dframeSplit raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__25) -> ((fun payload -> (if (if ((((v_Vuna_dCompiler_dStore_dheaderOk tag) codec) (Base_dPair.v_Base_dPair_dfirstOf dtb__25)) payload) then (((Base_dEq.v_Base_dEq_deq (Base_dMaybe.v_Eq_uBase_uMaybe_uMaybe_ua Base_dString.v_Eq_uString)) (v_Vuna_dCompiler_dStore_dheaderDigestOf (Base_dPair.v_Base_dPair_dfirstOf dtb__25))) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (digest))) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (payload)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Base_dPair.v_Base_dPair_dsecondOf dtb__25))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dstoreDecodeFast = (fun tag codec raw -> (match (v_Vuna_dCompiler_dStore_dframeSplit raw) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (if ((((v_Vuna_dCompiler_dStore_dheaderOk tag) codec) (Base_dPair.v_Base_dPair_dfirstOf dtb__26)) (Base_dPair.v_Base_dPair_dsecondOf dtb__26)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__26))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dstoreDataRootEff = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_STORE")) (fun override -> (if (override <> "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) override) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "XDG_DATA_HOME")) (fun xdg -> (if (xdg <> "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (xdg ^ "/vuna/store")) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "HOME")) (fun home -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (home = "") then "/tmp/vuna-store" else (home ^ "/.vuna/store")))))))))))

let v_Vuna_dCompiler_dStore_dstoreCacheBaseEff = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_CACHE_DIR")) (fun override -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "TMPDIR")) (fun tmp -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (override <> "") then override else ((if (tmp = "") then "/tmp" else tmp) ^ "/vuna-cache")))))))

let v_Vuna_dCompiler_dStore_dstoreReadEff = (fun tag codec path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreDecode tag) codec) raw)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

let v_Vuna_dCompiler_dStore_dstoreReadFastEff = (fun tag codec path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dStore_dstoreDecodeFast tag) codec) raw)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

let v_Vuna_dCompiler_dStore_dstoreReadAsEff = (fun tag codec digest path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dStore_dstoreDecodeAs tag) codec) digest) raw)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

let v_Vuna_dCompiler_dStore_dstoreWriteEff = (fun tag codec path payload -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) path) (((v_Vuna_dCompiler_dStore_dstoreEncode tag) codec) payload)))

let v_Vuna_dCompiler_dStore_dstoreWriteAsEff = (fun tag codec digest path payload -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) path) ((((v_Vuna_dCompiler_dStore_dstoreEncodeAs tag) codec) digest) payload)))

let v_Vuna_dCompiler_dStore_dstoreWriteIfChangedEff = (fun tag codec path payload -> ((fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun old -> (if (old = raw) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) path) raw)))) else (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) path) raw))))) (((v_Vuna_dCompiler_dStore_dstoreEncode tag) codec) payload)))

let v_Vuna_dCompiler_dStore_dstoreWriteIfChangedAsEff = (fun tag codec digest path payload -> ((fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun old -> (if (old = raw) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) path) raw)))) else (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) path) raw))))) ((((v_Vuna_dCompiler_dStore_dstoreEncodeAs tag) codec) digest) payload)))

let v_Vuna_dCompiler_dStore_dstoreFileExistsEff = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) _uarity0))

let v_Vuna_dCompiler_dStore_dstoreRemoveEff = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_removeFile dtio_0)) _uarity0))

let v_Vuna_dCompiler_dStore_dstoreEnsureDirFuel = (fun fuel path -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) ".") (Base_dList.C_Base_dList_dList_Cons ("mkdir", (Base_dList.C_Base_dList_dList_Cons ("-p", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))))))))))

let v_Vuna_dCompiler_dStore_dstoreEnsureDirEff = (fun path -> ((v_Vuna_dCompiler_dStore_dstoreEnsureDirFuel 256) path))

let rec v_Vuna_dCompiler_dStore_dstoreDropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (if (dtb__27 = 47) then dtb__28 else (v_Vuna_dCompiler_dStore_dstoreDropPastSlash dtb__28))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dStore_dstoreParentOf = (fun path -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength (Base_dList.v_Base_dList_dreverse rev))) then "." else ((fun p -> (if (p = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") p)) else false) then ("/" ^ p) else p))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dStore_dstoreDropPastSlash (Base_dList.v_Base_dList_dreverse rev)))) (Base_dList.dtp_unpack path)))

let v_Vuna_dCompiler_dStore_dstoreParentPathOf = (fun _uarity0 -> (v_Vuna_dCompiler_dStore_dstoreParentOf _uarity0))
