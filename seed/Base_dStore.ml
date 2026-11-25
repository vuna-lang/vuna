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
let v_headerFields = (fun (line : string) -> (let nd_uscrut1 = ((B_dData_dString.v_split "|") line) in (match nd_uscrut1 with
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
)))

# 88 "Vuna/Compiler/Base/Store.vuna"
let rec v_breakFirstNewline = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (if (dtb__19 = 10) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)); B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack dtb__20) })) else ((v_breakFirstNewline dtb__20) (B_dData_dList.C_List__x58__x58_ (dtb__19, mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Base/Store.vuna"
let v_frameSplit = (fun (raw : string) -> (let n = (bi_strLength raw) in (let headLen = (if (n < 512) then n else 512) in (match ((v_breakFirstNewline (B_dData_dList.dtp_unpack (((dtp_substring 0) headLen) raw))) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (let header = (B_dData_dPair.v_firstOf dtb__21) in (let start = ((bi_strLength header) + 1) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = header; B_dData_dPair.f_Pair_second = (((dtp_substring start) (n - start)) raw) }))))
  | _ -> failwith "DT: impossible branch"
))))

# 110 "Vuna/Compiler/Base/Store.vuna"
let v_headerOk = (fun (tag : string) (codec : string) (header : string) (payload : string) -> (match (v_headerFields header) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (let magic = (B_dData_dPair.v_firstOf dtb__22) in (let rest1 = (B_dData_dPair.v_secondOf dtb__22) in (let gotTag = (B_dData_dPair.v_firstOf rest1) in (let rest2 = (B_dData_dPair.v_secondOf rest1) in (let gotCodec = (B_dData_dPair.v_firstOf rest2) in (let rest3 = (B_dData_dPair.v_secondOf rest2) in (let gotLen = (B_dData_dPair.v_firstOf rest3) in (if (if (if (magic = v_storeMagic) then (gotTag = tag) else false) then (gotCodec = codec) else false) then (gotLen = (bi_strFromInt (bi_strLength payload))) else false))))))))
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Base/Store.vuna"
let v_headerDigestOf = (fun (header : string) -> (match (v_headerFields header) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__23))))))
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Base/Store.vuna"
let v_storeDecode = (fun (tag : string) (codec : string) (raw : string) -> (match (v_frameSplit raw) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (let payload = (B_dData_dPair.v_secondOf dtb__24) in (if (if ((((v_headerOk tag) codec) (B_dData_dPair.v_firstOf dtb__24)) payload) then (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) (v_headerDigestOf (B_dData_dPair.v_firstOf dtb__24))) (B_dData_dMaybe.C_Maybe_Just ((Base_dHash.v_contentAddress payload)))) else false) then (B_dData_dMaybe.C_Maybe_Just (payload)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Base/Store.vuna"
let v_storeDecodeAs = (fun (tag : string) (codec : string) (digest : string) (raw : string) -> (match (v_frameSplit raw) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (let payload = (B_dData_dPair.v_secondOf dtb__25) in (if (if ((((v_headerOk tag) codec) (B_dData_dPair.v_firstOf dtb__25)) payload) then (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) (v_headerDigestOf (B_dData_dPair.v_firstOf dtb__25))) (B_dData_dMaybe.C_Maybe_Just (digest))) else false) then (B_dData_dMaybe.C_Maybe_Just (payload)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Base/Store.vuna"
let v_dirUnder = (fun (mc0 : string) (mc1 : string B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" [dtb__26; "/"; mc0])))
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Base/Store.vuna"
let v_homeStoreRootEff = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "HOME")) (fun home -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if (if (home <> "") then (home <> "/homeless-shelter") else false) then (B_dData_dMaybe.C_Maybe_Just ((home ^ "/.vuna/store"))) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 193 "Vuna/Compiler/Base/Store.vuna"
let v_tmpStoreRootEff = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_dirUnder "vuna-store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "TMPDIR"))) (fun found -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dMaybe.v_fromMaybe "/tmp/vuna-store") found)))))

# 170 "Vuna/Compiler/Base/Store.vuna"
let v_storeDataRootEff = (fun (nEnv : string) -> (let override = ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "VUNA_STORE") in (let xdg = (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_dirUnder "vuna/store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "XDG_DATA_HOME")) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dData_dList.v_firstSuccess B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (override, (B_dData_dList.C_List__x58__x58_ (xdg, (B_dData_dList.C_List__x58__x58_ ((v_homeStoreRootEff nEnv), B_dData_dList.C_List_Nil)))))))) (fun found -> (((B_dData_dMaybe.v_maybe (v_tmpStoreRootEff nEnv)) (B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur)) found))))))

# 205 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadEff = (fun (nFs : string) (tag : string) (codec : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeDecode tag) codec) raw)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)))))

# 217 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadAsEff = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_storeDecodeAs tag) codec) digest) raw)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing))))))

# 231 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteEff = (fun (nFs : string) (tag : string) (codec : string) (path : string) (payload : string) -> (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) (((v_storeEncode tag) codec) payload)))

# 235 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteAsEff = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) (payload : string) -> (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) ((((v_storeEncodeAs tag) codec) digest) payload)))

# 240 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedEff = (fun (nFs : string) (tag : string) (codec : string) (path : string) (payload : string) -> (let raw = (((v_storeEncode tag) codec) payload) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = raw) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw)))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw))))))

# 254 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedAsEff = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) (payload : string) -> (let raw = ((((v_storeEncodeAs tag) codec) digest) payload) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = raw) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw)))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw))))))

# 267 "Vuna/Compiler/Base/Store.vuna"
let v_storeFileExistsEff = (fun (nFs : string) (path : string) -> ((B_dEffect_dFs.v_fsFileExists nFs) path))

# 270 "Vuna/Compiler/Base/Store.vuna"
let v_storeRemoveEff = (fun (nFs : string) (path : string) -> ((B_dEffect_dFs.v_fsRemoveFile nFs) path))

# 314 "Vuna/Compiler/Base/Store.vuna"
let rec v_storeDropPastSlash = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__27, dtb__28) -> (if (dtb__27 = 47) then dtb__28 else (v_storeDropPastSlash dtb__28))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Base/Store.vuna"
let v_storeParentOf = (fun (path : string) -> (let rev = (B_dData_dList.dtp_unpack path) in (let after = (v_storeDropPastSlash (B_dData_dList.v_reverse rev)) in (if ((B_dData_dList.v_length after) = (B_dData_dList.v_length (B_dData_dList.v_reverse rev))) then "." else (let p = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse after)) in (if (p = "") then (if ((B_dData_dString.v_startsWith "/") path) then "/" else ".") else (if (if ((B_dData_dString.v_startsWith "/") path) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "/") p)) else false) then ("/" ^ p) else p)))))))

# 282 "Vuna/Compiler/Base/Store.vuna"
let rec v_storeEnsureDirFuel = (fun (nFs : string) (nProcess : string) (fuel : int) (path : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_storeEnsureDirFuel nFs) nProcess) (fuel - 1)) (v_storeParentOf path))) (fun _u -> ((B_dEffect_dFs.v_fsMakeDir nFs) path)))))))))

# 274 "Vuna/Compiler/Base/Store.vuna"
let v_storeEnsureDirEff = (fun (nFs : string) (nProcess : string) (path : string) -> ((((v_storeEnsureDirFuel nFs) nProcess) 256) path))

# 311 "Vuna/Compiler/Base/Store.vuna"
let v_storeParentPathOf = v_storeParentOf

# 337 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootEff = (fun (nEnv : string) -> (v_storeDataRootEff nEnv))

# 355 "Vuna/Compiler/Base/Store.vuna"
let v_dirReady = (fun (nFs : string) (nProcess : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if (B_dData_dBool.v_not exists) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") (B_dData_dList.C_List__x58__x58_ ("mkdir", (B_dData_dList.C_List__x58__x58_ ("-p", (B_dData_dList.C_List__x58__x58_ (path, B_dData_dList.C_List_Nil)))))))) (fun code -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (code = 0)))) else ((B_dEffect_dFs.v_fsIsDirectory nFs) path)))))

# 341 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootReadyEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_storeDataRootEff nEnv)) (fun primary -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_dirReady nFs) nProcess) primary)) (fun ok -> (if ok then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) primary) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_tmpStoreRootEff nEnv)) (fun alt -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_dirReady nFs) nProcess) alt)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) alt)))))))))))

# 201 "Vuna/Compiler/Base/Store.vuna"
let v_storeCacheBaseEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((v_storeRootReadyEff nFs) nEnv) nProcess))

# 367 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectTag = (fun (kind : string) -> ("vuna-object 1/" ^ kind))

# 370 "Vuna/Compiler/Base/Store.vuna"
let v_objectPathIn = (fun (root : string) (kind : string) (digest : string) -> (String.concat "" [root; "/objects/"; kind; "/"; digest]))

# 373 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_objectPathIn root) kind) digest)))))

# 380 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectExistsEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((B_dEffect_dFs.v_fsFileExists nFs) path))))

# 387 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectReadEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (codec : string) (digest : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((((v_storeReadEff nFs) (v_storeObjectTag kind)) codec) path)))))

# 396 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectWriteEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (codec : string) (digest : string) (payload : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.write") "vuna.cache") (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeEnsureDirEff nFs) nProcess) (String.concat "" [root; "/objects/"; kind]))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((((v_storeWriteIfChangedEff nFs) (v_storeObjectTag kind)) codec) path) payload)))))))))

# 407 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectListEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (let dir = (String.concat "" [root; "/objects/"; kind]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_dirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((B_dEffect_dFs.v_fsReadDir nFs) dir) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil))))))))

# 418 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectRemoveEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dEffect_dFs.v_fsRemoveFile nFs) path) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)))))))

# 432 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (String.concat "" [root; "/views/"; kind; "/"; digest])))))

# 438 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewValidEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeViewPathEff nFs) nEnv) nProcess) kind) digest)) (fun dir -> (let marker = (dir ^ "/.complete") in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) marker)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) marker)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (text = digest)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))))))))

# 481 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewUnlockEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dEffect_dFs.v_fsRemoveTree nFs) (String.concat "" [root; "/.tmp/lock-"; kind; "-"; digest])))))

# 488 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchPathIn = (fun (root : string) (kind : string) (digest : string) -> (String.concat "" [root; "/.tmp/"; kind; "-"; digest]))

# 491 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeScratchPathIn root) kind) digest)))))

# 498 "Vuna/Compiler/Base/Store.vuna"
let v_scratchStaleSec = 600

# 501 "Vuna/Compiler/Base/Store.vuna"
let v_scratchStale = (fun (nFs : string) (nClock : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dTrait_dFunctor.v_fmap B_dEffect_dCore.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) path))) (fun mtime -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dClock.v_clockNow nClock)) (fun us -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((mtime + v_scratchStaleSec) < (if 1000000 = 0 then failwith "division by zero" else us / 1000000))))))))

# 465 "Vuna/Compiler/Base/Store.vuna"
let v_claimAt = (fun (nFs : string) (nClock : string) (nProcess : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsMakeDirExclusive nFs) path)) (fun ok -> (if ok then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) true) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_scratchStale nFs) nClock) path)) (fun stale -> (if (B_dData_dBool.v_not stale) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsRemoveTree nFs) path)) (fun _u -> ((B_dEffect_dFs.v_fsMakeDirExclusive nFs) path))))))))))

# 455 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewLockEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (let path = (String.concat "" [root; "/.tmp/lock-"; kind; "-"; digest]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeEnsureDirEff nFs) nProcess) (v_storeParentPathOf path))) (fun _u -> ((((v_claimAt nFs) nClock) nProcess) path)))))))

# 509 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchClaimEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeEnsureDirEff nFs) nProcess) (v_storeParentPathOf path))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsMakeDirExclusive nFs) path)) (fun ok -> (if ok then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) true) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_scratchStale nFs) nClock) path)) (fun stale -> (if (B_dData_dBool.v_not stale) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsRemoveTree nFs) path)) (fun _u -> ((B_dEffect_dFs.v_fsMakeDirExclusive nFs) path))))))))))))))

# 527 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchPathOfClaim = (fun nFs nEnv nProcess -> (((v_storeScratchPathEff nFs) nEnv) nProcess))

# 531 "Vuna/Compiler/Base/Store.vuna"
let v_storeScratchDropEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((B_dEffect_dFs.v_fsRemoveTree nFs) path))))

# 538 "Vuna/Compiler/Base/Store.vuna"
let v_storeViewPublishEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeScratchPathEff nFs) nEnv) nProcess) kind) digest)) (fun scratch -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeViewPathEff nFs) nEnv) nProcess) kind) digest)) (fun view -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeEnsureDirEff nFs) nProcess) (v_storeParentPathOf view))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) (scratch ^ "/.complete")) digest)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsRename nFs) scratch) view)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))))))))))))

# 554 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootsPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (String.concat "" [root; "/roots/"; projectId])))))

# 561 "Vuna/Compiler/Base/Store.vuna"
let v_insertRootLine = (fun (line : string) (lines : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName line) lines) then lines else (B_dData_dList.C_List__x58__x58_ (line, lines))))

# 564 "Vuna/Compiler/Base/Store.vuna"
let rec v_mergeRootLines = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> ((v_mergeRootLines ((v_insertRootLine dtb__29) mc0)) dtb__30)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Base/Store.vuna"
let v_projectPathFileName = ".project"

# 574 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathRecordEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) (projectPath : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeEnsureDirEff nFs) nProcess) dir)) (fun _u -> (let path = (String.concat "" [dir; "/"; v_projectPathFileName]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if ((B_dData_dString.v_trim old) = projectPath) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) projectPath)))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) projectPath))))))))))

# 591 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (let path = (String.concat "" [dir; "/"; v_projectPathFileName]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just ((B_dData_dString.v_trim text)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing))))))))

# 616 "Vuna/Compiler/Base/Store.vuna"
let rec v_writeRootFiles = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeEnsureDirEff nFs) nProcess) mc0)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) (String.concat "" [mc0; "/"; dtb__31])) "")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_writeRootFiles nFs) nProcess) mc0) dtb__32)) (fun n -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (n + 1))))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootAppendEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) (projectPath : string) (digests : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_storeProjectPathRecordEff nFs) nEnv) nProcess) projectId) projectPath)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeEnsureDirEff nFs) nProcess) dir)) (fun _u -> ((((v_writeRootFiles nFs) nProcess) dir) digests))))))))

# 626 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootLoadEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadDir nFs) path)) (fun names -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dString.v_startsWith ".") n)))) names)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)))))))

# 639 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootProjectListEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (let dir = (root ^ "/roots") in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_dirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((B_dEffect_dFs.v_fsReadDir nFs) dir) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil))))))))

# 650 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootRemoveEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) path)) (fun isDir -> (if isDir then ((B_dEffect_dFs.v_fsRemoveTree nFs) path) else ((B_dEffect_dFs.v_fsRemoveFile nFs) path)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)))))))

# 51 "Vuna/Compiler/Base/Store.vuna"
let v_fTag = (fun (p : t_Frame) -> (p).f_Frame_fTag)

# 52 "Vuna/Compiler/Base/Store.vuna"
let v_fCodec = (fun (p : t_Frame) -> (p).f_Frame_fCodec)

# 53 "Vuna/Compiler/Base/Store.vuna"
let v_fPayload = (fun (p : t_Frame) -> (p).f_Frame_fPayload)
