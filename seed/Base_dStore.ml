open Vuna_runtime
type t_Frame = { f_Frame_fTag : string; f_Frame_fCodec : string; f_Frame_fPayload : string }

# 47 "Vuna/Compiler/Base/Store.vuna"
let v_storeMagic = "vuna-cache-frame 2"

# 56 "Vuna/Compiler/Base/Store.vuna"
let v_fTagOf = (fun (dtb_u_u1 : t_Frame) -> (match dtb_u_u1 with
  | { f_Frame_fTag = dtb_u_u2; f_Frame_fCodec = dtb_u_u3; f_Frame_fPayload = dtb_u_u4 } -> dtb_u_u2
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Base/Store.vuna"
let v_fCodecOf = (fun (dtb_u_u5 : t_Frame) -> (match dtb_u_u5 with
  | { f_Frame_fTag = dtb_u_u6; f_Frame_fCodec = dtb_u_u7; f_Frame_fPayload = dtb_u_u8 } -> dtb_u_u7
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Base/Store.vuna"
let v_fPayloadOf = (fun (dtb_u_u9 : t_Frame) -> (match dtb_u_u9 with
  | { f_Frame_fTag = dtb_u_u10; f_Frame_fCodec = dtb_u_u11; f_Frame_fPayload = dtb_u_u12 } -> dtb_u_u12
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Base/Store.vuna"
let v_frameHeader = (fun (dtb_u_u13 : string) (dtb_u_u14 : string) (dtb_u_u15 : int) (dtb_u_u16 : string) -> (String.concat "" [v_storeMagic; "|"; dtb_u_u13; "|"; dtb_u_u14; "|"; (string_of_int dtb_u_u15); "|"; dtb_u_u16; "\n"]))

# 70 "Vuna/Compiler/Base/Store.vuna"
let v_storeEncode = (fun (dtb_u_u17 : string) (dtb_u_u18 : string) (dtb_u_u19 : string) -> (((((v_frameHeader dtb_u_u17) dtb_u_u18) (String.length dtb_u_u19)) (Base_dHash.v_contentAddress dtb_u_u19)) ^ dtb_u_u19))

# 78 "Vuna/Compiler/Base/Store.vuna"
let v_storeEncodeAs = (fun (dtb_u_u20 : string) (dtb_u_u21 : string) (dtb_u_u22 : string) (dtb_u_u23 : string) -> (((((v_frameHeader dtb_u_u20) dtb_u_u21) (String.length dtb_u_u23)) dtb_u_u22) ^ dtb_u_u23))

# 82 "Vuna/Compiler/Base/Store.vuna"
let v_headerFields = (fun (dtb_u_u24 : string) -> (let dtb_u_u25 = ((B_dData_dString.v_split "|") dtb_u_u24) in (match dtb_u_u25 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u26, dtb_u_u27) -> (match dtb_u_u27 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29) -> (match dtb_u_u29 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u30, dtb_u_u31) -> (match dtb_u_u31 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u33) -> (match dtb_u_u33 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u35) -> (match dtb_u_u35 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u26; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u28; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u30; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u32; B_dData_dPair.f_Pair_second = dtb_u_u34 } } } }))
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
let rec v_breakFirstNewline = (fun (dtb_u_u36 : int B_dData_dList.t_List) (dtb_u_u37 : int B_dData_dList.t_List) -> (match dtb_u_u36 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u38, dtb_u_u39) -> (if (dtb_u_u38 = 10) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u37)); B_dData_dPair.f_Pair_second = (B_dData_dList.dtp_pack dtb_u_u39) })) else ((v_breakFirstNewline dtb_u_u39) (B_dData_dList.C_List__x58__x58_ (dtb_u_u38, dtb_u_u37))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Base/Store.vuna"
let v_frameSplit = (fun (dtb_u_u40 : string) -> (let dtb_u_u41 = (String.length dtb_u_u40) in (let dtb_u_u42 = (if (dtb_u_u41 < 512) then dtb_u_u41 else 512) in (match ((v_breakFirstNewline (B_dData_dList.dtp_unpack (((dtp_substring 0) dtb_u_u42) dtb_u_u40))) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u43) -> (let dtb_u_u44 = (B_dData_dPair.v_firstOf dtb_u_u43) in (let dtb_u_u45 = ((String.length dtb_u_u44) + 1) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u44; B_dData_dPair.f_Pair_second = (((dtp_substring dtb_u_u45) (dtb_u_u41 - dtb_u_u45)) dtb_u_u40) }))))
  | _ -> failwith "DT: impossible branch"
))))

# 110 "Vuna/Compiler/Base/Store.vuna"
let v_headerOk = (fun (dtb_u_u46 : string) (dtb_u_u47 : string) (dtb_u_u48 : string) (dtb_u_u49 : string) -> (match (v_headerFields dtb_u_u48) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u50) -> (let dtb_u_u51 = (B_dData_dPair.v_firstOf dtb_u_u50) in (let dtb_u_u52 = (B_dData_dPair.v_secondOf dtb_u_u50) in (let dtb_u_u53 = (B_dData_dPair.v_firstOf dtb_u_u52) in (let dtb_u_u54 = (B_dData_dPair.v_secondOf dtb_u_u52) in (let dtb_u_u55 = (B_dData_dPair.v_firstOf dtb_u_u54) in (let dtb_u_u56 = (B_dData_dPair.v_secondOf dtb_u_u54) in (let dtb_u_u57 = (B_dData_dPair.v_firstOf dtb_u_u56) in (if (if (if (dtb_u_u51 = v_storeMagic) then (dtb_u_u53 = dtb_u_u46) else false) then (dtb_u_u55 = dtb_u_u47) else false) then (dtb_u_u57 = (string_of_int (String.length dtb_u_u49))) else false))))))))
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Base/Store.vuna"
let v_headerDigestOf = (fun (dtb_u_u58 : string) -> (match (v_headerFields dtb_u_u58) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u59) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u59))))))
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Base/Store.vuna"
let v_storeDecode = (fun (dtb_u_u60 : string) (dtb_u_u61 : string) (dtb_u_u62 : string) -> (match (v_frameSplit dtb_u_u62) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u63) -> (let dtb_u_u64 = (B_dData_dPair.v_secondOf dtb_u_u63) in (if (if ((((v_headerOk dtb_u_u60) dtb_u_u61) (B_dData_dPair.v_firstOf dtb_u_u63)) dtb_u_u64) then (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) (v_headerDigestOf (B_dData_dPair.v_firstOf dtb_u_u63))) (B_dData_dMaybe.C_Maybe_Just ((Base_dHash.v_contentAddress dtb_u_u64)))) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u64)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Base/Store.vuna"
let v_storeDecodeAs = (fun (dtb_u_u65 : string) (dtb_u_u66 : string) (dtb_u_u67 : string) (dtb_u_u68 : string) -> (match (v_frameSplit dtb_u_u68) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u69) -> (let dtb_u_u70 = (B_dData_dPair.v_secondOf dtb_u_u69) in (if (if ((((v_headerOk dtb_u_u65) dtb_u_u66) (B_dData_dPair.v_firstOf dtb_u_u69)) dtb_u_u70) then (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) (v_headerDigestOf (B_dData_dPair.v_firstOf dtb_u_u69))) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u67))) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u70)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Base/Store.vuna"
let v_dirUnder = (fun (dtb_u_u71 : string) (dtb_u_u72 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u72 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u73) -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" [dtb_u_u73; "/"; dtb_u_u71])))
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Base/Store.vuna"
let v_homeStoreRootEff = (fun (dtb_u_u74 : string) -> (Obj.repr ((fun (dtb_u_u81 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u84 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u74) "HOME") dtb_u_u81) in (let dtb_u_u86 = (if (if (dtb_u_u84 <> "") then (dtb_u_u84 <> "/homeless-shelter") else false) then (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u84 ^ "/.vuna/store"))) else B_dData_dMaybe.C_Maybe_Nothing) in dtb_u_u86))))))

# 186 "Vuna/Compiler/Base/Store.vuna"
let v_homeStoreRootEff_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u84 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "HOME") _u_ueffTok) in (let dtb_u_u86 = (if (if (dtb_u_u84 <> "") then (dtb_u_u84 <> "/homeless-shelter") else false) then (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u84 ^ "/.vuna/store"))) else B_dData_dMaybe.C_Maybe_Nothing) in dtb_u_u86)))

# 193 "Vuna/Compiler/Base/Store.vuna"
let v_tmpStoreRootEff = (fun (dtb_u_u88 : string) -> (Obj.repr ((fun (dtb_u_u95 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u96 = Obj.obj ((((fun dtb_u_u100 dtb_u_u101 -> (Obj.repr ((fun (dtb_u_u102 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u103 = Obj.obj (dtb_u_u101) in (dtb_u_u100 (dtb_u_u103 dtb_u_u102))))))) (v_dirUnder "vuna-store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty dtb_u_u88) "TMPDIR"))) in (let dtb_u_u104 = (dtb_u_u96 dtb_u_u95) in (let dtb_u_u106 = ((B_dData_dMaybe.v_fromMaybe "/tmp/vuna-store") dtb_u_u104) in dtb_u_u106)))))))

# 193 "Vuna/Compiler/Base/Store.vuna"
let v_tmpStoreRootEff_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u96 = Obj.obj ((((fun dtb_u_u100 dtb_u_u101 -> (Obj.repr ((fun (dtb_u_u102 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u103 = Obj.obj (dtb_u_u101) in (dtb_u_u100 (dtb_u_u103 dtb_u_u102))))))) (v_dirUnder "vuna-store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "TMPDIR"))) in (let dtb_u_u104 = (dtb_u_u96 _u_ueffTok) in (let dtb_u_u106 = ((B_dData_dMaybe.v_fromMaybe "/tmp/vuna-store") dtb_u_u104) in dtb_u_u106))))

# 170 "Vuna/Compiler/Base/Store.vuna"
let v_storeDataRootEff = (fun (dtb_u_u108 : string) -> (let dtb_u_u111 = ((B_dEffect_dEnv.v_envGetEnvNonEmpty dtb_u_u108) "VUNA_STORE") in (let dtb_u_u112 = (((fun dtb_u_u126 dtb_u_u127 -> (Obj.repr ((fun (dtb_u_u128 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u129 = Obj.obj (dtb_u_u127) in (dtb_u_u126 (dtb_u_u129 dtb_u_u128))))))) (v_dirUnder "vuna/store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty dtb_u_u108) "XDG_DATA_HOME")) in (Obj.repr ((fun (dtb_u_u117 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u118 = Obj.obj ((((B_dData_dList.v_firstSuccess B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (dtb_u_u111, (B_dData_dList.C_List__x58__x58_ (dtb_u_u112, (B_dData_dList.C_List__x58__x58_ ((v_homeStoreRootEff dtb_u_u108), B_dData_dList.C_List_Nil)))))))) in (let dtb_u_u120 = (dtb_u_u118 dtb_u_u117) in ((Obj.magic (((B_dData_dMaybe.v_maybe (v_tmpStoreRootEff dtb_u_u108)) (fun dtb_u_u122 -> (Obj.repr ((fun (dtb_u_u123 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u122))))) dtb_u_u120)) dtb_u_u117)))))))))

# 170 "Vuna/Compiler/Base/Store.vuna"
let v_storeDataRootEff_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u111 = ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "VUNA_STORE") in (let dtb_u_u112 = (((fun dtb_u_u126 dtb_u_u127 -> (Obj.repr ((fun (dtb_u_u128 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u129 = Obj.obj (dtb_u_u127) in (dtb_u_u126 (dtb_u_u129 dtb_u_u128))))))) (v_dirUnder "vuna/store")) ((B_dEffect_dEnv.v_envGetEnvNonEmpty nEnv) "XDG_DATA_HOME")) in (let dtb_u_u118 = Obj.obj ((((B_dData_dList.v_firstSuccess B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (dtb_u_u111, (B_dData_dList.C_List__x58__x58_ (dtb_u_u112, (B_dData_dList.C_List__x58__x58_ ((v_homeStoreRootEff nEnv), B_dData_dList.C_List_Nil)))))))) in (let dtb_u_u120 = (dtb_u_u118 _u_ueffTok) in ((Obj.magic (((B_dData_dMaybe.v_maybe (v_tmpStoreRootEff nEnv)) (fun dtb_u_u122 -> (Obj.repr ((fun (dtb_u_u123 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u122))))) dtb_u_u120)) _u_ueffTok))))))

# 205 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadEff = (fun (dtb_u_u130 : string) (dtb_u_u133 : string) (dtb_u_u134 : string) (dtb_u_u135 : string) -> (Obj.repr ((fun (dtb_u_u140 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u143 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u130) dtb_u_u135) dtb_u_u140) in (if dtb_u_u143 then (let dtb_u_u151 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u130) dtb_u_u135) dtb_u_u140) in (let dtb_u_u153 = (((v_storeDecode dtb_u_u133) dtb_u_u134) dtb_u_u151) in dtb_u_u153)) else (let dtb_u_u156 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u156)))))))

# 205 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadEff_u_udirect = (fun (nFs : string) (tag : string) (codec : string) (path : string) _u_ueffTok -> (let dtb_u_u143 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) _u_ueffTok) in (if dtb_u_u143 then (let dtb_u_u151 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) path) _u_ueffTok) in (let dtb_u_u153 = (((v_storeDecode tag) codec) dtb_u_u151) in dtb_u_u153)) else (let dtb_u_u156 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u156))))

# 217 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadAsEff = (fun (dtb_u_u158 : string) (dtb_u_u161 : string) (dtb_u_u162 : string) (dtb_u_u163 : string) (dtb_u_u164 : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (Obj.repr ((fun (dtb_u_u169 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u172 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u158) dtb_u_u164) dtb_u_u169) in (if dtb_u_u172 then (let dtb_u_u180 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u158) dtb_u_u164) dtb_u_u169) in (let dtb_u_u182 = ((((v_storeDecodeAs dtb_u_u161) dtb_u_u162) dtb_u_u163) dtb_u_u180) in dtb_u_u182)) else (let dtb_u_u185 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u185))))))))

# 217 "Vuna/Compiler/Base/Store.vuna"
let v_storeReadAsEff_u_udirect = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) _u_ueffTok -> ((Obj.magic (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (Obj.repr ((fun (dtb_u_u169 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u172 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) dtb_u_u169) in (if dtb_u_u172 then (let dtb_u_u180 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) path) dtb_u_u169) in (let dtb_u_u182 = ((((v_storeDecodeAs tag) codec) digest) dtb_u_u180) in dtb_u_u182)) else (let dtb_u_u185 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u185)))))))) _u_ueffTok))

# 231 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteEff = (fun (dtb_u_u187 : string) (dtb_u_u190 : string) (dtb_u_u191 : string) (dtb_u_u192 : string) (dtb_u_u193 : string) -> (((B_dEffect_dFs.v_fsWriteFileAtomic dtb_u_u187) dtb_u_u192) (((v_storeEncode dtb_u_u190) dtb_u_u191) dtb_u_u193)))

# 231 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteEff_u_udirect = (fun (nFs : string) (tag : string) (codec : string) (path : string) (payload : string) _u_ueffTok -> ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) (((v_storeEncode tag) codec) payload))) _u_ueffTok))

# 235 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteAsEff = (fun (dtb_u_u194 : string) (dtb_u_u197 : string) (dtb_u_u198 : string) (dtb_u_u199 : string) (dtb_u_u200 : string) (dtb_u_u201 : string) -> (((B_dEffect_dFs.v_fsWriteFileAtomic dtb_u_u194) dtb_u_u200) ((((v_storeEncodeAs dtb_u_u197) dtb_u_u198) dtb_u_u199) dtb_u_u201)))

# 235 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteAsEff_u_udirect = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) (payload : string) _u_ueffTok -> ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) ((((v_storeEncodeAs tag) codec) digest) payload))) _u_ueffTok))

# 240 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedEff = (fun (dtb_u_u202 : string) (dtb_u_u205 : string) (dtb_u_u206 : string) (dtb_u_u207 : string) (dtb_u_u208 : string) -> (let dtb_u_u209 = (((v_storeEncode dtb_u_u205) dtb_u_u206) dtb_u_u208) in (Obj.repr ((fun (dtb_u_u214 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u217 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u202) dtb_u_u207) dtb_u_u214) in (if dtb_u_u217 then (let dtb_u_u225 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u202) dtb_u_u207) dtb_u_u214) in (if (dtb_u_u225 = dtb_u_u209) then (let dtb_u_u227 = 0 in dtb_u_u227) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic dtb_u_u202) dtb_u_u207) dtb_u_u209)) dtb_u_u214))) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic dtb_u_u202) dtb_u_u207) dtb_u_u209)) dtb_u_u214))))))))

# 240 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedEff_u_udirect = (fun (nFs : string) (tag : string) (codec : string) (path : string) (payload : string) _u_ueffTok -> (let dtb_u_u209 = (((v_storeEncode tag) codec) payload) in (let dtb_u_u217 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) _u_ueffTok) in (if dtb_u_u217 then (let dtb_u_u225 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) path) _u_ueffTok) in (if (dtb_u_u225 = dtb_u_u209) then (let dtb_u_u227 = 0 in dtb_u_u227) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) dtb_u_u209)) _u_ueffTok))) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) dtb_u_u209)) _u_ueffTok)))))

# 254 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedAsEff = (fun (dtb_u_u229 : string) (dtb_u_u232 : string) (dtb_u_u233 : string) (dtb_u_u234 : string) (dtb_u_u235 : string) (dtb_u_u236 : string) -> (let dtb_u_u237 = ((((v_storeEncodeAs dtb_u_u232) dtb_u_u233) dtb_u_u234) dtb_u_u236) in (Obj.repr ((fun (dtb_u_u242 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u245 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u229) dtb_u_u235) dtb_u_u242) in (if dtb_u_u245 then (let dtb_u_u253 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u229) dtb_u_u235) dtb_u_u242) in (if (dtb_u_u253 = dtb_u_u237) then (let dtb_u_u255 = 0 in dtb_u_u255) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic dtb_u_u229) dtb_u_u235) dtb_u_u237)) dtb_u_u242))) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic dtb_u_u229) dtb_u_u235) dtb_u_u237)) dtb_u_u242))))))))

# 254 "Vuna/Compiler/Base/Store.vuna"
let v_storeWriteIfChangedAsEff_u_udirect = (fun (nFs : string) (tag : string) (codec : string) (digest : string) (path : string) (payload : string) _u_ueffTok -> (let dtb_u_u237 = ((((v_storeEncodeAs tag) codec) digest) payload) in (let dtb_u_u245 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) _u_ueffTok) in (if dtb_u_u245 then (let dtb_u_u253 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) path) _u_ueffTok) in (if (dtb_u_u253 = dtb_u_u237) then (let dtb_u_u255 = 0 in dtb_u_u255) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) dtb_u_u237)) _u_ueffTok))) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) path) dtb_u_u237)) _u_ueffTok)))))

# 267 "Vuna/Compiler/Base/Store.vuna"
let v_storeFileExistsEff = (fun (dtb_u_u257 : string) (dtb_u_u260 : string) -> ((B_dEffect_dFs.v_fsFileExists dtb_u_u257) dtb_u_u260))

# 267 "Vuna/Compiler/Base/Store.vuna"
let v_storeFileExistsEff_u_udirect = (fun (nFs : string) (path : string) _u_ueffTok -> ((Obj.magic ((B_dEffect_dFs.v_fsFileExists nFs) path)) _u_ueffTok))

# 270 "Vuna/Compiler/Base/Store.vuna"
let v_storeRemoveEff = (fun (dtb_u_u261 : string) (dtb_u_u264 : string) -> ((B_dEffect_dFs.v_fsRemoveFile dtb_u_u261) dtb_u_u264))

# 270 "Vuna/Compiler/Base/Store.vuna"
let v_storeRemoveEff_u_udirect = (fun (nFs : string) (path : string) _u_ueffTok -> ((Obj.magic ((B_dEffect_dFs.v_fsRemoveFile nFs) path)) _u_ueffTok))

# 314 "Vuna/Compiler/Base/Store.vuna"
let rec v_storeDropPastSlash = (fun (dtb_u_u265 : int B_dData_dList.t_List) -> (match dtb_u_u265 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u266, dtb_u_u267) -> (if (dtb_u_u266 = 47) then dtb_u_u267 else (v_storeDropPastSlash dtb_u_u267))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Base/Store.vuna"
let v_storeParentOf = (fun (dtb_u_u268 : string) -> (let dtb_u_u269 = (B_dData_dList.dtp_unpack dtb_u_u268) in (let dtb_u_u270 = (v_storeDropPastSlash (B_dData_dList.v_reverse dtb_u_u269)) in (if ((B_dData_dList.v_length dtb_u_u270) = (B_dData_dList.v_length (B_dData_dList.v_reverse dtb_u_u269))) then "." else (let dtb_u_u271 = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u270)) in (if (dtb_u_u271 = "") then (if ((B_dData_dString.v_startsWith "/") dtb_u_u268) then "/" else ".") else (if (if ((B_dData_dString.v_startsWith "/") dtb_u_u268) then (B_dData_dBool.v_not ((B_dData_dString.v_startsWith "/") dtb_u_u271)) else false) then ("/" ^ dtb_u_u271) else dtb_u_u271)))))))

# 282 "Vuna/Compiler/Base/Store.vuna"
let rec v_storeEnsureDirFuel = (fun (dtb_u_u272 : string) (dtb_u_u273 : string) (dtb_u_u277 : int) (dtb_u_u278 : string) -> (if (dtb_u_u277 <= 0) then (let dtb_u_u280 = 0 in (Obj.repr ((fun (dtb_u_u281 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u280)))) else (if (if (if (dtb_u_u278 = "") then true else (dtb_u_u278 = ".")) then true else (dtb_u_u278 = "/")) then (let dtb_u_u283 = 0 in (Obj.repr ((fun (dtb_u_u284 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u283)))) else (Obj.repr ((fun (dtb_u_u289 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u292 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u272) dtb_u_u278) dtb_u_u289) in (if dtb_u_u292 then (let dtb_u_u294 = 0 in dtb_u_u294) else (let dtb_u_u303 = (((((v_storeEnsureDirFuel_u_udirect dtb_u_u272) dtb_u_u273) (dtb_u_u277 - 1)) (v_storeParentOf dtb_u_u278)) dtb_u_u289) in ((Obj.magic ((B_dEffect_dFs.v_fsMakeDir dtb_u_u272) dtb_u_u278)) dtb_u_u289))))))))))
# 282 "Vuna/Compiler/Base/Store.vuna"
and v_storeEnsureDirFuel_u_udirect = (fun (nFs : string) (nProcess : string) (fuel : int) (path : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u280 = 0 in dtb_u_u280) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then (let dtb_u_u283 = 0 in dtb_u_u283) else (let dtb_u_u292 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) _u_ueffTok) in (if dtb_u_u292 then (let dtb_u_u294 = 0 in dtb_u_u294) else (let dtb_u_u303 = (((((v_storeEnsureDirFuel_u_udirect nFs) nProcess) (fuel - 1)) (v_storeParentOf path)) _u_ueffTok) in ((Obj.magic ((B_dEffect_dFs.v_fsMakeDir nFs) path)) _u_ueffTok)))))))

# 274 "Vuna/Compiler/Base/Store.vuna"
let v_storeEnsureDirEff = (fun (dtb_u_u304 : string) (dtb_u_u305 : string) (dtb_u_u309 : string) -> ((((v_storeEnsureDirFuel dtb_u_u304) dtb_u_u305) 256) dtb_u_u309))

# 274 "Vuna/Compiler/Base/Store.vuna"
let v_storeEnsureDirEff_u_udirect = (fun (nFs : string) (nProcess : string) (path : string) _u_ueffTok -> ((Obj.magic ((((v_storeEnsureDirFuel nFs) nProcess) 256) path)) _u_ueffTok))

# 311 "Vuna/Compiler/Base/Store.vuna"
let v_storeParentPathOf = v_storeParentOf

# 335 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootEff = (fun (dtb_u_u310 : string) -> (v_storeDataRootEff dtb_u_u310))

# 335 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootEff_u_udirect = (fun (nEnv : string) _u_ueffTok -> ((Obj.magic (v_storeDataRootEff nEnv)) _u_ueffTok))

# 353 "Vuna/Compiler/Base/Store.vuna"
let v_dirReady = (fun (dtb_u_u313 : string) (dtb_u_u314 : string) (dtb_u_u318 : string) -> (Obj.repr ((fun (dtb_u_u323 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u326 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u313) dtb_u_u318) dtb_u_u323) in (if (B_dData_dBool.v_not dtb_u_u326) then (let dtb_u_u334 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect dtb_u_u314) ".") (B_dData_dList.C_List__x58__x58_ ("mkdir", (B_dData_dList.C_List__x58__x58_ ("-p", (B_dData_dList.C_List__x58__x58_ (dtb_u_u318, B_dData_dList.C_List_Nil))))))) dtb_u_u323) in (let dtb_u_u336 = (dtb_u_u334 = 0) in dtb_u_u336)) else ((Obj.magic ((B_dEffect_dFs.v_fsIsDirectory dtb_u_u313) dtb_u_u318)) dtb_u_u323)))))))

# 353 "Vuna/Compiler/Base/Store.vuna"
let v_dirReady_u_udirect = (fun (nFs : string) (nProcess : string) (path : string) _u_ueffTok -> (let dtb_u_u326 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) _u_ueffTok) in (if (B_dData_dBool.v_not dtb_u_u326) then (let dtb_u_u334 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect nProcess) ".") (B_dData_dList.C_List__x58__x58_ ("mkdir", (B_dData_dList.C_List__x58__x58_ ("-p", (B_dData_dList.C_List__x58__x58_ (path, B_dData_dList.C_List_Nil))))))) _u_ueffTok) in (let dtb_u_u336 = (dtb_u_u334 = 0) in dtb_u_u336)) else ((Obj.magic ((B_dEffect_dFs.v_fsIsDirectory nFs) path)) _u_ueffTok))))

# 339 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootReadyEff = (fun (dtb_u_u338 : string) (dtb_u_u339 : string) (dtb_u_u340 : string) -> (Obj.repr ((fun (dtb_u_u349 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u352 = ((v_storeDataRootEff_u_udirect dtb_u_u339) dtb_u_u349) in (let dtb_u_u360 = ((((v_dirReady_u_udirect dtb_u_u338) dtb_u_u340) dtb_u_u352) dtb_u_u349) in (if dtb_u_u360 then (let dtb_u_u362 = dtb_u_u352 in dtb_u_u362) else (let dtb_u_u371 = ((v_tmpStoreRootEff_u_udirect dtb_u_u339) dtb_u_u349) in (let dtb_u_u379 = ((((v_dirReady_u_udirect dtb_u_u338) dtb_u_u340) dtb_u_u371) dtb_u_u349) in (let dtb_u_u381 = dtb_u_u371 in dtb_u_u381))))))))))

# 339 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootReadyEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) _u_ueffTok -> (let dtb_u_u352 = ((v_storeDataRootEff_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u360 = ((((v_dirReady_u_udirect nFs) nProcess) dtb_u_u352) _u_ueffTok) in (if dtb_u_u360 then (let dtb_u_u362 = dtb_u_u352 in dtb_u_u362) else (let dtb_u_u371 = ((v_tmpStoreRootEff_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u379 = ((((v_dirReady_u_udirect nFs) nProcess) dtb_u_u371) _u_ueffTok) in (let dtb_u_u381 = dtb_u_u371 in dtb_u_u381)))))))

# 201 "Vuna/Compiler/Base/Store.vuna"
let v_storeCacheBaseEff = (fun (dtb_u_u383 : string) (dtb_u_u384 : string) (dtb_u_u385 : string) -> (((v_storeRootReadyEff dtb_u_u383) dtb_u_u384) dtb_u_u385))

# 201 "Vuna/Compiler/Base/Store.vuna"
let v_storeCacheBaseEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) _u_ueffTok -> ((Obj.magic (((v_storeRootReadyEff nFs) nEnv) nProcess)) _u_ueffTok))

# 365 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectTag = (fun (dtb_u_u390 : string) -> ("vuna-object 1/" ^ dtb_u_u390))

# 368 "Vuna/Compiler/Base/Store.vuna"
let v_objectPathIn = (fun (dtb_u_u391 : string) (dtb_u_u392 : string) (dtb_u_u393 : string) -> (String.concat "" [dtb_u_u391; "/objects/"; dtb_u_u392; "/"; dtb_u_u393]))

# 371 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectPathEff = (fun (dtb_u_u394 : string) (dtb_u_u395 : string) (dtb_u_u396 : string) (dtb_u_u401 : string) (dtb_u_u402 : string) -> (Obj.repr ((fun (dtb_u_u407 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u410 = ((((v_storeRootReadyEff_u_udirect dtb_u_u394) dtb_u_u395) dtb_u_u396) dtb_u_u407) in (let dtb_u_u412 = (((v_objectPathIn dtb_u_u410) dtb_u_u401) dtb_u_u402) in dtb_u_u412))))))

# 371 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectPathEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) _u_ueffTok -> (let dtb_u_u410 = ((((v_storeRootReadyEff_u_udirect nFs) nEnv) nProcess) _u_ueffTok) in (let dtb_u_u412 = (((v_objectPathIn dtb_u_u410) kind) digest) in dtb_u_u412)))

# 378 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectReadEff = (fun (dtb_u_u414 : string) (dtb_u_u415 : string) (dtb_u_u416 : string) (dtb_u_u421 : string) (dtb_u_u422 : string) (dtb_u_u423 : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (Obj.repr ((fun (dtb_u_u428 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u431 = ((((((v_storeObjectPathEff_u_udirect dtb_u_u414) dtb_u_u415) dtb_u_u416) dtb_u_u421) dtb_u_u423) dtb_u_u428) in ((Obj.magic ((((v_storeReadEff dtb_u_u414) (v_storeObjectTag dtb_u_u421)) dtb_u_u422) dtb_u_u431)) dtb_u_u428)))))))

# 378 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectReadEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (codec : string) (digest : string) _u_ueffTok -> ((Obj.magic (((Base_dObs.v_obsSpanEff "vuna.cache.lookup") "vuna.cache") (Obj.repr ((fun (dtb_u_u428 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u431 = ((((((v_storeObjectPathEff_u_udirect nFs) nEnv) nProcess) kind) digest) dtb_u_u428) in ((Obj.magic ((((v_storeReadEff nFs) (v_storeObjectTag kind)) codec) dtb_u_u431)) dtb_u_u428))))))) _u_ueffTok))

# 387 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectWriteEff = (fun (dtb_u_u432 : string) (dtb_u_u433 : string) (dtb_u_u434 : string) (dtb_u_u439 : string) (dtb_u_u440 : string) (dtb_u_u441 : string) (dtb_u_u442 : string) -> (((Base_dObs.v_obsSpanEff "vuna.cache.write") "vuna.cache") (Obj.repr ((fun (dtb_u_u447 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u450 = ((((v_storeRootReadyEff_u_udirect dtb_u_u432) dtb_u_u433) dtb_u_u434) dtb_u_u447) in (let dtb_u_u458 = ((((v_storeEnsureDirEff_u_udirect dtb_u_u432) dtb_u_u434) (String.concat "" [dtb_u_u450; "/objects/"; dtb_u_u439])) dtb_u_u447) in (let dtb_u_u466 = ((((((v_storeObjectPathEff_u_udirect dtb_u_u432) dtb_u_u433) dtb_u_u434) dtb_u_u439) dtb_u_u441) dtb_u_u447) in ((Obj.magic (((((v_storeWriteIfChangedEff dtb_u_u432) (v_storeObjectTag dtb_u_u439)) dtb_u_u440) dtb_u_u466) dtb_u_u442)) dtb_u_u447)))))))))

# 387 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectWriteEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) (codec : string) (digest : string) (payload : string) _u_ueffTok -> ((Obj.magic (((Base_dObs.v_obsSpanEff "vuna.cache.write") "vuna.cache") (Obj.repr ((fun (dtb_u_u447 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u450 = ((((v_storeRootReadyEff_u_udirect nFs) nEnv) nProcess) dtb_u_u447) in (let dtb_u_u458 = ((((v_storeEnsureDirEff_u_udirect nFs) nProcess) (String.concat "" [dtb_u_u450; "/objects/"; kind])) dtb_u_u447) in (let dtb_u_u466 = ((((((v_storeObjectPathEff_u_udirect nFs) nEnv) nProcess) kind) digest) dtb_u_u447) in ((Obj.magic (((((v_storeWriteIfChangedEff nFs) (v_storeObjectTag kind)) codec) dtb_u_u466) payload)) dtb_u_u447))))))))) _u_ueffTok))

# 398 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectListEff = (fun (dtb_u_u467 : string) (dtb_u_u468 : string) (dtb_u_u469 : string) (dtb_u_u474 : string) -> (Obj.repr ((fun (dtb_u_u479 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u482 = ((((v_storeRootReadyEff_u_udirect dtb_u_u467) dtb_u_u468) dtb_u_u469) dtb_u_u479) in (let dtb_u_u483 = (String.concat "" [dtb_u_u482; "/objects/"; dtb_u_u474]) in (let dtb_u_u491 = ((((v_dirReady_u_udirect dtb_u_u467) dtb_u_u469) dtb_u_u483) dtb_u_u479) in (if dtb_u_u491 then ((Obj.magic ((B_dEffect_dFs.v_fsReadDir dtb_u_u467) dtb_u_u483)) dtb_u_u479) else (let dtb_u_u493 = B_dData_dList.C_List_Nil in dtb_u_u493)))))))))

# 398 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectListEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (kind : string) _u_ueffTok -> (let dtb_u_u482 = ((((v_storeRootReadyEff_u_udirect nFs) nEnv) nProcess) _u_ueffTok) in (let dtb_u_u483 = (String.concat "" [dtb_u_u482; "/objects/"; kind]) in (let dtb_u_u491 = ((((v_dirReady_u_udirect nFs) nProcess) dtb_u_u483) _u_ueffTok) in (if dtb_u_u491 then ((Obj.magic ((B_dEffect_dFs.v_fsReadDir nFs) dtb_u_u483)) _u_ueffTok) else (let dtb_u_u493 = B_dData_dList.C_List_Nil in dtb_u_u493))))))

# 409 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectRemoveEff = (fun (dtb_u_u495 : string) (dtb_u_u496 : string) (dtb_u_u497 : string) (dtb_u_u498 : string) (dtb_u_u504 : string) (dtb_u_u505 : string) -> (Obj.repr ((fun (dtb_u_u510 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u513 = ((((((v_storeObjectPathEff_u_udirect dtb_u_u495) dtb_u_u497) dtb_u_u498) dtb_u_u504) dtb_u_u505) dtb_u_u510) in (let dtb_u_u521 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u495) dtb_u_u513) dtb_u_u510) in (if dtb_u_u521 then ((Obj.magic ((B_dEffect_dFs.v_fsRemoveFile dtb_u_u495) dtb_u_u513)) dtb_u_u510) else (let dtb_u_u523 = 0 in dtb_u_u523))))))))

# 409 "Vuna/Compiler/Base/Store.vuna"
let v_storeObjectRemoveEff_u_udirect = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) _u_ueffTok -> (let dtb_u_u513 = ((((((v_storeObjectPathEff_u_udirect nFs) nEnv) nProcess) kind) digest) _u_ueffTok) in (let dtb_u_u521 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u513) _u_ueffTok) in (if dtb_u_u521 then ((Obj.magic ((B_dEffect_dFs.v_fsRemoveFile nFs) dtb_u_u513)) _u_ueffTok) else (let dtb_u_u523 = 0 in dtb_u_u523)))))

# 422 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootsPathEff = (fun (dtb_u_u525 : string) (dtb_u_u526 : string) (dtb_u_u527 : string) (dtb_u_u532 : string) -> (Obj.repr ((fun (dtb_u_u537 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u540 = ((((v_storeRootReadyEff_u_udirect dtb_u_u525) dtb_u_u526) dtb_u_u527) dtb_u_u537) in (let dtb_u_u542 = (String.concat "" [dtb_u_u540; "/roots/"; dtb_u_u532]) in dtb_u_u542))))))

# 422 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootsPathEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) _u_ueffTok -> (let dtb_u_u540 = ((((v_storeRootReadyEff_u_udirect nFs) nEnv) nProcess) _u_ueffTok) in (let dtb_u_u542 = (String.concat "" [dtb_u_u540; "/roots/"; projectId]) in dtb_u_u542)))

# 429 "Vuna/Compiler/Base/Store.vuna"
let v_insertRootLine = (fun (dtb_u_u544 : string) (dtb_u_u545 : string B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName dtb_u_u544) dtb_u_u545) then dtb_u_u545 else (B_dData_dList.C_List__x58__x58_ (dtb_u_u544, dtb_u_u545))))

# 432 "Vuna/Compiler/Base/Store.vuna"
let rec v_mergeRootLines = (fun (dtb_u_u546 : string B_dData_dList.t_List) (dtb_u_u547 : string B_dData_dList.t_List) -> (match dtb_u_u547 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u548, dtb_u_u549) -> ((v_mergeRootLines ((v_insertRootLine dtb_u_u548) dtb_u_u546)) dtb_u_u549)
  | B_dData_dList.C_List_Nil -> dtb_u_u546
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Base/Store.vuna"
let v_projectPathFileName = ".project"

# 442 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathRecordEff = (fun (dtb_u_u550 : string) (dtb_u_u551 : string) (dtb_u_u552 : string) (dtb_u_u557 : string) (dtb_u_u558 : string) -> (Obj.repr ((fun (dtb_u_u563 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u566 = (((((v_storeRootsPathEff_u_udirect dtb_u_u550) dtb_u_u551) dtb_u_u552) dtb_u_u557) dtb_u_u563) in (let dtb_u_u574 = ((((v_storeEnsureDirEff_u_udirect dtb_u_u550) dtb_u_u552) dtb_u_u566) dtb_u_u563) in (let dtb_u_u575 = (String.concat "" [dtb_u_u566; "/"; v_projectPathFileName]) in (let dtb_u_u583 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u550) dtb_u_u575) dtb_u_u563) in (if dtb_u_u583 then (let dtb_u_u591 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u550) dtb_u_u575) dtb_u_u563) in (if ((B_dData_dString.v_trim dtb_u_u591) = dtb_u_u558) then (let dtb_u_u593 = 0 in dtb_u_u593) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic dtb_u_u550) dtb_u_u575) dtb_u_u558)) dtb_u_u563))) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic dtb_u_u550) dtb_u_u575) dtb_u_u558)) dtb_u_u563))))))))))

# 442 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathRecordEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) (projectPath : string) _u_ueffTok -> (let dtb_u_u566 = (((((v_storeRootsPathEff_u_udirect nFs) nEnv) nProcess) projectId) _u_ueffTok) in (let dtb_u_u574 = ((((v_storeEnsureDirEff_u_udirect nFs) nProcess) dtb_u_u566) _u_ueffTok) in (let dtb_u_u575 = (String.concat "" [dtb_u_u566; "/"; v_projectPathFileName]) in (let dtb_u_u583 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u575) _u_ueffTok) in (if dtb_u_u583 then (let dtb_u_u591 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u575) _u_ueffTok) in (if ((B_dData_dString.v_trim dtb_u_u591) = projectPath) then (let dtb_u_u593 = 0 in dtb_u_u593) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) dtb_u_u575) projectPath)) _u_ueffTok))) else ((Obj.magic (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) dtb_u_u575) projectPath)) _u_ueffTok)))))))

# 459 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathEff = (fun (dtb_u_u595 : string) (dtb_u_u596 : string) (dtb_u_u597 : string) (dtb_u_u602 : string) -> (Obj.repr ((fun (dtb_u_u607 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u610 = (((((v_storeRootsPathEff_u_udirect dtb_u_u595) dtb_u_u596) dtb_u_u597) dtb_u_u602) dtb_u_u607) in (let dtb_u_u611 = (String.concat "" [dtb_u_u610; "/"; v_projectPathFileName]) in (let dtb_u_u619 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u595) dtb_u_u611) dtb_u_u607) in (if dtb_u_u619 then (let dtb_u_u627 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u595) dtb_u_u611) dtb_u_u607) in (let dtb_u_u629 = (B_dData_dMaybe.C_Maybe_Just ((B_dData_dString.v_trim dtb_u_u627))) in dtb_u_u629)) else (let dtb_u_u632 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u632)))))))))

# 459 "Vuna/Compiler/Base/Store.vuna"
let v_storeProjectPathEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) _u_ueffTok -> (let dtb_u_u610 = (((((v_storeRootsPathEff_u_udirect nFs) nEnv) nProcess) projectId) _u_ueffTok) in (let dtb_u_u611 = (String.concat "" [dtb_u_u610; "/"; v_projectPathFileName]) in (let dtb_u_u619 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u611) _u_ueffTok) in (if dtb_u_u619 then (let dtb_u_u627 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u611) _u_ueffTok) in (let dtb_u_u629 = (B_dData_dMaybe.C_Maybe_Just ((B_dData_dString.v_trim dtb_u_u627))) in dtb_u_u629)) else (let dtb_u_u632 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u632))))))

# 484 "Vuna/Compiler/Base/Store.vuna"
let rec v_writeRootFiles = (fun (dtb_u_u634 : string) (dtb_u_u635 : string) (dtb_u_u639 : string) (dtb_u_u640 : string B_dData_dList.t_List) -> (match dtb_u_u640 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u641, dtb_u_u642) -> (Obj.repr ((fun (dtb_u_u647 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u650 = ((((v_storeEnsureDirEff_u_udirect dtb_u_u634) dtb_u_u635) dtb_u_u639) dtb_u_u647) in (let dtb_u_u658 = ((((B_dEffect_dFs.v_fsWriteFileAtomic_u_udirect dtb_u_u634) (String.concat "" [dtb_u_u639; "/"; dtb_u_u641])) "") dtb_u_u647) in (let dtb_u_u666 = (((((v_writeRootFiles_u_udirect dtb_u_u634) dtb_u_u635) dtb_u_u639) dtb_u_u642) dtb_u_u647) in (let dtb_u_u668 = (dtb_u_u666 + 1) in dtb_u_u668)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u671 = 0 in (Obj.repr ((fun (dtb_u_u672 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u671))))
  | _ -> failwith "DT: impossible branch"
))
# 484 "Vuna/Compiler/Base/Store.vuna"
and v_writeRootFiles_u_udirect = (fun (nFs : string) (nProcess : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u641, dtb_u_u642) -> (let dtb_u_u650 = ((((v_storeEnsureDirEff_u_udirect nFs) nProcess) mc0) _u_ueffTok) in (let dtb_u_u658 = ((((B_dEffect_dFs.v_fsWriteFileAtomic_u_udirect nFs) (String.concat "" [mc0; "/"; dtb_u_u641])) "") _u_ueffTok) in (let dtb_u_u666 = (((((v_writeRootFiles_u_udirect nFs) nProcess) mc0) dtb_u_u642) _u_ueffTok) in (let dtb_u_u668 = (dtb_u_u666 + 1) in dtb_u_u668))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u671 = 0 in dtb_u_u671)
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootAppendEff = (fun (dtb_u_u673 : string) (dtb_u_u674 : string) (dtb_u_u675 : string) (dtb_u_u680 : string) (dtb_u_u681 : string) (dtb_u_u682 : string B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u687 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u690 = ((((((v_storeProjectPathRecordEff_u_udirect dtb_u_u673) dtb_u_u674) dtb_u_u675) dtb_u_u680) dtb_u_u681) dtb_u_u687) in (let dtb_u_u698 = (((((v_storeRootsPathEff_u_udirect dtb_u_u673) dtb_u_u674) dtb_u_u675) dtb_u_u680) dtb_u_u687) in (let dtb_u_u706 = ((((v_storeEnsureDirEff_u_udirect dtb_u_u673) dtb_u_u675) dtb_u_u698) dtb_u_u687) in ((Obj.magic ((((v_writeRootFiles dtb_u_u673) dtb_u_u675) dtb_u_u698) dtb_u_u682)) dtb_u_u687))))))))

# 476 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootAppendEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) (projectPath : string) (digests : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u690 = ((((((v_storeProjectPathRecordEff_u_udirect nFs) nEnv) nProcess) projectId) projectPath) _u_ueffTok) in (let dtb_u_u698 = (((((v_storeRootsPathEff_u_udirect nFs) nEnv) nProcess) projectId) _u_ueffTok) in (let dtb_u_u706 = ((((v_storeEnsureDirEff_u_udirect nFs) nProcess) dtb_u_u698) _u_ueffTok) in ((Obj.magic ((((v_writeRootFiles nFs) nProcess) dtb_u_u698) digests)) _u_ueffTok)))))

# 494 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootLoadEff = (fun (dtb_u_u707 : string) (dtb_u_u708 : string) (dtb_u_u709 : string) (dtb_u_u714 : string) -> (Obj.repr ((fun (dtb_u_u719 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u722 = (((((v_storeRootsPathEff_u_udirect dtb_u_u707) dtb_u_u708) dtb_u_u709) dtb_u_u714) dtb_u_u719) in (let dtb_u_u730 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u707) dtb_u_u722) dtb_u_u719) in (if dtb_u_u730 then (let dtb_u_u738 = (((B_dEffect_dFs.v_fsReadDir_u_udirect dtb_u_u707) dtb_u_u722) dtb_u_u719) in (let dtb_u_u740 = ((B_dData_dList.v_filter (fun (dtb_u_u742 : string) -> (B_dData_dBool.v_not ((B_dData_dString.v_startsWith ".") dtb_u_u742)))) dtb_u_u738) in dtb_u_u740)) else (let dtb_u_u744 = B_dData_dList.C_List_Nil in dtb_u_u744))))))))

# 494 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootLoadEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) _u_ueffTok -> (let dtb_u_u722 = (((((v_storeRootsPathEff_u_udirect nFs) nEnv) nProcess) projectId) _u_ueffTok) in (let dtb_u_u730 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u722) _u_ueffTok) in (if dtb_u_u730 then (let dtb_u_u738 = (((B_dEffect_dFs.v_fsReadDir_u_udirect nFs) dtb_u_u722) _u_ueffTok) in (let dtb_u_u740 = ((B_dData_dList.v_filter (fun (dtb_u_u742 : string) -> (B_dData_dBool.v_not ((B_dData_dString.v_startsWith ".") dtb_u_u742)))) dtb_u_u738) in dtb_u_u740)) else (let dtb_u_u744 = B_dData_dList.C_List_Nil in dtb_u_u744)))))

# 507 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootProjectListEff = (fun (dtb_u_u746 : string) (dtb_u_u747 : string) (dtb_u_u748 : string) -> (Obj.repr ((fun (dtb_u_u757 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u760 = ((((v_storeRootReadyEff_u_udirect dtb_u_u746) dtb_u_u747) dtb_u_u748) dtb_u_u757) in (let dtb_u_u761 = (dtb_u_u760 ^ "/roots") in (let dtb_u_u769 = ((((v_dirReady_u_udirect dtb_u_u746) dtb_u_u748) dtb_u_u761) dtb_u_u757) in (if dtb_u_u769 then ((Obj.magic ((B_dEffect_dFs.v_fsReadDir dtb_u_u746) dtb_u_u761)) dtb_u_u757) else (let dtb_u_u771 = B_dData_dList.C_List_Nil in dtb_u_u771)))))))))

# 507 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootProjectListEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) _u_ueffTok -> (let dtb_u_u760 = ((((v_storeRootReadyEff_u_udirect nFs) nEnv) nProcess) _u_ueffTok) in (let dtb_u_u761 = (dtb_u_u760 ^ "/roots") in (let dtb_u_u769 = ((((v_dirReady_u_udirect nFs) nProcess) dtb_u_u761) _u_ueffTok) in (if dtb_u_u769 then ((Obj.magic ((B_dEffect_dFs.v_fsReadDir nFs) dtb_u_u761)) _u_ueffTok) else (let dtb_u_u771 = B_dData_dList.C_List_Nil in dtb_u_u771))))))

# 518 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootRemoveEff = (fun (dtb_u_u773 : string) (dtb_u_u774 : string) (dtb_u_u775 : string) (dtb_u_u780 : string) -> (Obj.repr ((fun (dtb_u_u785 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u788 = (((((v_storeRootsPathEff_u_udirect dtb_u_u773) dtb_u_u774) dtb_u_u775) dtb_u_u780) dtb_u_u785) in (let dtb_u_u796 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u773) dtb_u_u788) dtb_u_u785) in (if dtb_u_u796 then (let dtb_u_u804 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect dtb_u_u773) dtb_u_u788) dtb_u_u785) in (if dtb_u_u804 then ((Obj.magic ((B_dEffect_dFs.v_fsRemoveTree dtb_u_u773) dtb_u_u788)) dtb_u_u785) else ((Obj.magic ((B_dEffect_dFs.v_fsRemoveFile dtb_u_u773) dtb_u_u788)) dtb_u_u785))) else (let dtb_u_u806 = 0 in dtb_u_u806))))))))

# 518 "Vuna/Compiler/Base/Store.vuna"
let v_storeRootRemoveEff_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (projectId : string) _u_ueffTok -> (let dtb_u_u788 = (((((v_storeRootsPathEff_u_udirect nFs) nEnv) nProcess) projectId) _u_ueffTok) in (let dtb_u_u796 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u788) _u_ueffTok) in (if dtb_u_u796 then (let dtb_u_u804 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect nFs) dtb_u_u788) _u_ueffTok) in (if dtb_u_u804 then ((Obj.magic ((B_dEffect_dFs.v_fsRemoveTree nFs) dtb_u_u788)) _u_ueffTok) else ((Obj.magic ((B_dEffect_dFs.v_fsRemoveFile nFs) dtb_u_u788)) _u_ueffTok))) else (let dtb_u_u806 = 0 in dtb_u_u806)))))

# 51 "Vuna/Compiler/Base/Store.vuna"
let v_fTag = (fun (dtb_u_u808 : t_Frame) -> (match dtb_u_u808 with
  | { f_Frame_fTag = dtb_u_u809; f_Frame_fCodec = dtb_u_u810; f_Frame_fPayload = dtb_u_u811 } -> dtb_u_u809
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Base/Store.vuna"
let v_fCodec = (fun (dtb_u_u812 : t_Frame) -> (match dtb_u_u812 with
  | { f_Frame_fTag = dtb_u_u813; f_Frame_fCodec = dtb_u_u814; f_Frame_fPayload = dtb_u_u815 } -> dtb_u_u814
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Base/Store.vuna"
let v_fPayload = (fun (dtb_u_u816 : t_Frame) -> (match dtb_u_u816 with
  | { f_Frame_fTag = dtb_u_u817; f_Frame_fCodec = dtb_u_u818; f_Frame_fPayload = dtb_u_u819 } -> dtb_u_u819
  | _ -> failwith "DT: impossible branch"
))
