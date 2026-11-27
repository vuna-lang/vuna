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
let v_frameHeader = (fun (tag : string) (codec : string) (len : int) (digest : string) -> (String.concat "" [v_storeMagic; "|"; tag; "|"; codec; "|"; (string_of_int len); "|"; digest; "\n"]))

# 70 "Vuna/Compiler/Base/Store.vuna"
let v_storeEncode = (fun (tag : string) (codec : string) (payload : string) -> (((((v_frameHeader tag) codec) (String.length payload)) (Base_dHash.v_contentAddress payload)) ^ payload))

# 78 "Vuna/Compiler/Base/Store.vuna"
let v_storeEncodeAs = (fun (tag : string) (codec : string) (digest : string) (payload : string) -> (((((v_frameHeader tag) codec) (String.length payload)) digest) ^ payload))

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
let v_frameSplit = (fun (raw : string) -> (let n = (String.length raw) in (let headLen = (if (n < 512) then n else 512) in (match ((v_breakFirstNewline (B_dData_dList.dtp_unpack (((dtp_substring 0) headLen) raw))) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__21) -> (let header = (B_dData_dPair.v_firstOf dtb__21) in (let start = ((String.length header) + 1) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = header; B_dData_dPair.f_Pair_second = (((dtp_substring start) (n - start)) raw) }))))
  | _ -> failwith "DT: impossible branch"
))))

# 110 "Vuna/Compiler/Base/Store.vuna"
let v_headerOk = (fun (tag : string) (codec : string) (header : string) (payload : string) -> (match (v_headerFields header) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (let magic = (B_dData_dPair.v_firstOf dtb__22) in (let rest1 = (B_dData_dPair.v_secondOf dtb__22) in (let gotTag = (B_dData_dPair.v_firstOf rest1) in (let rest2 = (B_dData_dPair.v_secondOf rest1) in (let gotCodec = (B_dData_dPair.v_firstOf rest2) in (let rest3 = (B_dData_dPair.v_secondOf rest2) in (let gotLen = (B_dData_dPair.v_firstOf rest3) in (if (if (if (magic = v_storeMagic) then (gotTag = tag) else false) then (gotCodec = codec) else false) then (gotLen = (string_of_int (String.length payload))) else false))))))))
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
let v_homeStoreRootEff = (fun (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__27 = Obj.obj (e) in (let dtb__28 = Obj.obj ((k (dtb__27 u))) in (dtb__28 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "HOME")) (fun home -> (let x = (if (if (home <> "") then (home <> "/homeless-shelter") else false) then (B_dData_dMaybe.C_Maybe_Just ((home ^ "/.vuna/store"))) else B_dData_dMaybe.C_Maybe_Nothing) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 193 "Vuna/Compiler/Base/Store.vuna"
let v_tmpStoreRootEff = (fun (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__29 = Obj.obj (e) in (let dtb__30 = Obj.obj ((k (dtb__29 u))) in (dtb__30 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__31 = Obj.obj (e) in (f (dtb__31 u)))))) (v_dirUnder "vuna-store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "TMPDIR"))) (fun found -> (let x = ((B_dData_dMaybe.v_fromMaybe "/tmp/vuna-store") found) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 170 "Vuna/Compiler/Base/Store.vuna"
let v_storeDataRootEff = (fun (nEnv : string) -> (let override = ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "VUNA_STORE") in (let xdg = (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__34 = Obj.obj (e) in (f (dtb__34 u)))))) (v_dirUnder "vuna/store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "XDG_DATA_HOME")) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__32 = Obj.obj (e) in (let dtb__33 = Obj.obj ((k (dtb__32 u))) in (dtb__33 u)))))) (((B_dData_dList.v_firstSuccess B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (override, (B_dData_dList.C_List__x58__x58_ (xdg, (B_dData_dList.C_List__x58__x58_ ((v_homeStoreRootEff nEnv), B_dData_dList.C_List_Nil)))))))) (fun found -> (((B_dData_dMaybe.v_maybe (v_tmpStoreRootEff nEnv)) (fun x -> Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))) found))))))

# 205 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadEff = (fun (nFs : string) (tag : string) (codec : string) (path : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__35 = Obj.obj (e) in (let dtb__36 = Obj.obj ((k (dtb__35 u))) in (dtb__36 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__37 = Obj.obj (e) in (let dtb__38 = Obj.obj ((k (dtb__37 u))) in (dtb__38 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (let x = (((v_storeDecode tag) codec) raw) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 217 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadAsEff = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__39 = Obj.obj (e) in (let dtb__40 = Obj.obj ((k (dtb__39 u))) in (dtb__40 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__41 = Obj.obj (e) in (let dtb__42 = Obj.obj ((k (dtb__41 u))) in (dtb__42 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun raw -> (let x = ((((v_storeDecodeAs tag) codec) digest) raw) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 231 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteEff = (fun (nFs : string) (tag : string) (codec : string) (path : string) (payload : string) -> (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) (((v_storeEncode tag) codec) payload)))

# 235 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteAsEff = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) (payload : string) -> (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) ((((v_storeEncodeAs tag) codec) digest) payload)))

# 240 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedEff = (fun (nFs : string) (tag : string) (codec : string) (path : string) (payload : string) -> (let raw = (((v_storeEncode tag) codec) payload) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__43 = Obj.obj (e) in (let dtb__44 = Obj.obj ((k (dtb__43 u))) in (dtb__44 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__45 = Obj.obj (e) in (let dtb__46 = Obj.obj ((k (dtb__45 u))) in (dtb__46 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = raw) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw)))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw))))))

# 254 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedAsEff = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) (payload : string) -> (let raw = ((((v_storeEncodeAs tag) codec) digest) payload) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__47 = Obj.obj (e) in (let dtb__48 = Obj.obj ((k (dtb__47 u))) in (dtb__48 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__49 = Obj.obj (e) in (let dtb__50 = Obj.obj ((k (dtb__49 u))) in (dtb__50 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if (old = raw) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw)))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) raw))))))

# 267 "Vuna/Compiler/Base/Store.vuna"
let v_storeFileExistsEff = (fun (nFs : string) (path : string) -> ((B_dEffect_dFs.v_fsFileExists nFs) path))

# 270 "Vuna/Compiler/Base/Store.vuna"
let v_storeRemoveEff = (fun (nFs : string) (path : string) -> ((B_dEffect_dFs.v_fsRemoveFile nFs) path))

# 314 "Vuna/Compiler/Base/Store.vuna"
let rec v_storeDropPastSlash = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if (dtb__51 = 47) then dtb__52 else (v_storeDropPastSlash dtb__52))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Base/Store.vuna"
let v_storeParentOf = (fun (path : string) -> (let rev = (B_dData_dList.dtp_unpack path) in (let after = (v_storeDropPastSlash (B_dData_dList.v_reverse rev)) in (if ((B_dData_dList.v_length after) = (B_dData_dList.v_length (B_dData_dList.v_reverse rev))) then "." else (let p = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse after)) in (if (p = "") then (if ((B_dData_dString.v_startsWith "/") path) then "/" else ".") else (if (if ((B_dData_dString.v_startsWith "/") path) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "/") p)) else false) then ("/" ^ p) else p)))))))

# 282 "Vuna/Compiler/Base/Store.vuna"
let rec v_storeEnsureDirFuel = (fun (nFs : string) (nProcess : string) (fuel : int) (path : string) -> (if (fuel <= 0) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__53 = Obj.obj (e) in (let dtb__54 = Obj.obj ((k (dtb__53 u))) in (dtb__54 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__55 = Obj.obj (e) in (let dtb__56 = Obj.obj ((k (dtb__55 u))) in (dtb__56 u)))))) ((((v_storeEnsureDirFuel nFs) nProcess) (fuel - 1)) (v_storeParentOf path))) (fun _u -> ((B_dEffect_dFs.v_fsMakeDir nFs) path)))))))))

# 274 "Vuna/Compiler/Base/Store.vuna"
let v_storeEnsureDirEff = (fun (nFs : string) (nProcess : string) (path : string) -> ((((v_storeEnsureDirFuel nFs) nProcess) 256) path))

# 311 "Vuna/Compiler/Base/Store.vuna"
let v_storeParentPathOf = v_storeParentOf

# 335 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootEff = (fun (nEnv : string) -> (v_storeDataRootEff nEnv))

# 353 "Vuna/Compiler/Base/Store.vuna"
let v_dirReady = (fun (nFs : string) (nProcess : string) (path : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__57 = Obj.obj (e) in (let dtb__58 = Obj.obj ((k (dtb__57 u))) in (dtb__58 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if (B_dData_dBool.v_not exists) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__59 = Obj.obj (e) in (let dtb__60 = Obj.obj ((k (dtb__59 u))) in (dtb__60 u)))))) (((B_dEffect_dProcess.v_processRunIn nProcess) ".") (B_dData_dList.C_List__x58__x58_ ("mkdir", (B_dData_dList.C_List__x58__x58_ ("-p", (B_dData_dList.C_List__x58__x58_ (path, B_dData_dList.C_List_Nil)))))))) (fun code -> (let x = (code = 0) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else ((B_dEffect_dFs.v_fsIsDirectory nFs) path)))))

# 339 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootReadyEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__61 = Obj.obj (e) in (let dtb__62 = Obj.obj ((k (dtb__61 u))) in (dtb__62 u)))))) (v_storeDataRootEff nEnv)) (fun primary -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__63 = Obj.obj (e) in (let dtb__64 = Obj.obj ((k (dtb__63 u))) in (dtb__64 u)))))) (((v_dirReady nFs) nProcess) primary)) (fun ok -> (if ok then (let x = primary in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__65 = Obj.obj (e) in (let dtb__66 = Obj.obj ((k (dtb__65 u))) in (dtb__66 u)))))) (v_tmpStoreRootEff nEnv)) (fun alt -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__67 = Obj.obj (e) in (let dtb__68 = Obj.obj ((k (dtb__67 u))) in (dtb__68 u)))))) (((v_dirReady nFs) nProcess) alt)) (fun _u -> (let x = alt in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))))

# 201 "Vuna/Compiler/Base/Store.vuna"
let v_storeCacheBaseEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((v_storeRootReadyEff nFs) nEnv) nProcess))

# 365 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectTag = (fun (kind : string) -> ("vuna-object 1/" ^ kind))

# 368 "Vuna/Compiler/Base/Store.vuna"
let v_objectPathIn = (fun (root : string) (kind : string) (digest : string) -> (String.concat "" [root; "/objects/"; kind; "/"; digest]))

# 371 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__69 = Obj.obj (e) in (let dtb__70 = Obj.obj ((k (dtb__69 u))) in (dtb__70 u)))))) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (let x = (((v_objectPathIn root) kind) digest) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 378 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectReadEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (codec : string) (digest : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__71 = Obj.obj (e) in (let dtb__72 = Obj.obj ((k (dtb__71 u))) in (dtb__72 u)))))) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> ((((v_storeReadEff nFs) (v_storeObjectTag kind)) codec) path)))))

# 387 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectWriteEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (codec : string) (digest : string) (payload : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.write") "vuna.cache") (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__73 = Obj.obj (e) in (let dtb__74 = Obj.obj ((k (dtb__73 u))) in (dtb__74 u)))))) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__75 = Obj.obj (e) in (let dtb__76 = Obj.obj ((k (dtb__75 u))) in (dtb__76 u)))))) (((v_storeEnsureDirEff nFs) nProcess) (String.concat "" [root; "/objects/"; kind]))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__77 = Obj.obj (e) in (let dtb__78 = Obj.obj ((k (dtb__77 u))) in (dtb__78 u)))))) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((((v_storeWriteIfChangedEff nFs) (v_storeObjectTag kind)) codec) path) payload)))))))))

# 398 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectListEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__79 = Obj.obj (e) in (let dtb__80 = Obj.obj ((k (dtb__79 u))) in (dtb__80 u)))))) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (let dir = (String.concat "" [root; "/objects/"; kind]) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__81 = Obj.obj (e) in (let dtb__82 = Obj.obj ((k (dtb__81 u))) in (dtb__82 u)))))) (((v_dirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((B_dEffect_dFs.v_fsReadDir nFs) dir) else (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))

# 409 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectRemoveEff = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__83 = Obj.obj (e) in (let dtb__84 = Obj.obj ((k (dtb__83 u))) in (dtb__84 u)))))) (((((v_storeObjectPathEff nFs) nEnv) nProcess) kind) digest)) (fun path -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__85 = Obj.obj (e) in (let dtb__86 = Obj.obj ((k (dtb__85 u))) in (dtb__86 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then ((B_dEffect_dFs.v_fsRemoveFile nFs) path) else (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 422 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootsPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__87 = Obj.obj (e) in (let dtb__88 = Obj.obj ((k (dtb__87 u))) in (dtb__88 u)))))) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (let x = (String.concat "" [root; "/roots/"; projectId]) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 429 "Vuna/Compiler/Base/Store.vuna"
let v_insertRootLine = (fun (line : string) (lines : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName line) lines) then lines else (B_dData_dList.C_List__x58__x58_ (line, lines))))

# 432 "Vuna/Compiler/Base/Store.vuna"
let rec v_mergeRootLines = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> ((v_mergeRootLines ((v_insertRootLine dtb__89) mc0)) dtb__90)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Base/Store.vuna"
let v_projectPathFileName = ".project"

# 442 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathRecordEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) (projectPath : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__91 = Obj.obj (e) in (let dtb__92 = Obj.obj ((k (dtb__91 u))) in (dtb__92 u)))))) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__93 = Obj.obj (e) in (let dtb__94 = Obj.obj ((k (dtb__93 u))) in (dtb__94 u)))))) (((v_storeEnsureDirEff nFs) nProcess) dir)) (fun _u -> (let path = (String.concat "" [dir; "/"; v_projectPathFileName]) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__95 = Obj.obj (e) in (let dtb__96 = Obj.obj ((k (dtb__95 u))) in (dtb__96 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__97 = Obj.obj (e) in (let dtb__98 = Obj.obj ((k (dtb__97 u))) in (dtb__98 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun old -> (if ((B_dData_dString.v_trim old) = projectPath) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) projectPath)))) else (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) projectPath))))))))))

# 459 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__99 = Obj.obj (e) in (let dtb__100 = Obj.obj ((k (dtb__99 u))) in (dtb__100 u)))))) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (let path = (String.concat "" [dir; "/"; v_projectPathFileName]) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__101 = Obj.obj (e) in (let dtb__102 = Obj.obj ((k (dtb__101 u))) in (dtb__102 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__103 = Obj.obj (e) in (let dtb__104 = Obj.obj ((k (dtb__103 u))) in (dtb__104 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (let x = (B_dData_dMaybe.C_Maybe_Just ((B_dData_dString.v_trim text))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))

# 484 "Vuna/Compiler/Base/Store.vuna"
let rec v_writeRootFiles = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__107 = Obj.obj (e) in (let dtb__108 = Obj.obj ((k (dtb__107 u))) in (dtb__108 u)))))) (((v_storeEnsureDirEff nFs) nProcess) mc0)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__109 = Obj.obj (e) in (let dtb__110 = Obj.obj ((k (dtb__109 u))) in (dtb__110 u)))))) (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) (String.concat "" [mc0; "/"; dtb__105])) "")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__111 = Obj.obj (e) in (let dtb__112 = Obj.obj ((k (dtb__111 u))) in (dtb__112 u)))))) ((((v_writeRootFiles nFs) nProcess) mc0) dtb__106)) (fun n -> (let x = (n + 1) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))
  | B_dData_dList.C_List_Nil -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootAppendEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) (projectPath : string) (digests : string B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__113 = Obj.obj (e) in (let dtb__114 = Obj.obj ((k (dtb__113 u))) in (dtb__114 u)))))) (((((v_storeProjectPathRecordEff nFs) nEnv) nProcess) projectId) projectPath)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__115 = Obj.obj (e) in (let dtb__116 = Obj.obj ((k (dtb__115 u))) in (dtb__116 u)))))) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun dir -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__117 = Obj.obj (e) in (let dtb__118 = Obj.obj ((k (dtb__117 u))) in (dtb__118 u)))))) (((v_storeEnsureDirEff nFs) nProcess) dir)) (fun _u -> ((((v_writeRootFiles nFs) nProcess) dir) digests))))))))

# 494 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootLoadEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__119 = Obj.obj (e) in (let dtb__120 = Obj.obj ((k (dtb__119 u))) in (dtb__120 u)))))) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__121 = Obj.obj (e) in (let dtb__122 = Obj.obj ((k (dtb__121 u))) in (dtb__122 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__123 = Obj.obj (e) in (let dtb__124 = Obj.obj ((k (dtb__123 u))) in (dtb__124 u)))))) ((B_dEffect_dFs.v_fsReadDir nFs) path)) (fun names -> (let x = ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not ((B_dData_dString.v_startsWith ".") n)))) names) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 507 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootProjectListEff = (fun (nFs : string) (nEnv : string) (nProcess : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__125 = Obj.obj (e) in (let dtb__126 = Obj.obj ((k (dtb__125 u))) in (dtb__126 u)))))) (((v_storeRootReadyEff nFs) nEnv) nProcess)) (fun root -> (let dir = (root ^ "/roots") in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__127 = Obj.obj (e) in (let dtb__128 = Obj.obj ((k (dtb__127 u))) in (dtb__128 u)))))) (((v_dirReady nFs) nProcess) dir)) (fun isDir -> (if isDir then ((B_dEffect_dFs.v_fsReadDir nFs) dir) else (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))

# 518 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootRemoveEff = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__129 = Obj.obj (e) in (let dtb__130 = Obj.obj ((k (dtb__129 u))) in (dtb__130 u)))))) ((((v_storeRootsPathEff nFs) nEnv) nProcess) projectId)) (fun path -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__131 = Obj.obj (e) in (let dtb__132 = Obj.obj ((k (dtb__131 u))) in (dtb__132 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__133 = Obj.obj (e) in (let dtb__134 = Obj.obj ((k (dtb__133 u))) in (dtb__134 u)))))) ((B_dEffect_dFs.v_fsIsDirectory nFs) path)) (fun isDir -> (if isDir then ((B_dEffect_dFs.v_fsRemoveTree nFs) path) else ((B_dEffect_dFs.v_fsRemoveFile nFs) path)))) else (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 51 "Vuna/Compiler/Base/Store.vuna"
let v_fTag = (fun (p : t_Frame) -> (match p with
  | { f_Frame_fTag = dtb__135; f_Frame_fCodec = dtb__136; f_Frame_fPayload = dtb__137 } -> dtb__135
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Base/Store.vuna"
let v_fCodec = (fun (p : t_Frame) -> (match p with
  | { f_Frame_fTag = dtb__138; f_Frame_fCodec = dtb__139; f_Frame_fPayload = dtb__140 } -> dtb__139
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Base/Store.vuna"
let v_fPayload = (fun (p : t_Frame) -> (match p with
  | { f_Frame_fTag = dtb__141; f_Frame_fCodec = dtb__142; f_Frame_fPayload = dtb__143 } -> dtb__143
  | _ -> failwith "DT: impossible branch"
))
