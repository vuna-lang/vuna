open Vuna_runtime
# 38 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_buildIdFileName = "build-id"

# 42 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_buildIdSchema = "vuna-compiler-id 1"

# 53 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_sourceFrag = (fun (dtb_u_u1 : (string, int) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf dtb_u_u1); "="; (string_of_int (B_dData_dPair.v_secondOf dtb_u_u1))]))

# 48 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerIdOf = (fun (dtb_u_u2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u3 : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ (v_buildIdSchema, (B_dData_dList.C_List__x58__x58_ (dtb_u_u3, ((B_dData_dList.v_map v_sourceFrag) ((B_dData_dSort.v_sortBy (fun (dtb_u_u4 : (string, int) B_dData_dPair.t_Pair) (dtb_u_u5 : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf dtb_u_u4)) (B_dData_dPair.v_firstOf dtb_u_u5)))) dtb_u_u2))))))))

# 60 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_textHashOf = (fun (dtb_u_u6 : string) -> (Base_dHash.v_contentKey dtb_u_u6))

# 57 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_fingerprintOfStat = (fun (dtb_u_u7 : string) (dtb_u_u8 : int) (dtb_u_u9 : int) -> (v_textHashOf (String.concat "" [dtb_u_u7; ":"; (string_of_int dtb_u_u8); ":"; (string_of_int dtb_u_u9)])))

# 104 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_cacheTagFileName = "cache-tag"

# 120 "Vuna/Compiler/Loader/Fingerprint.vuna"
let rec v_readFirstBuildId = (fun (dtb_u_u10 : string) (dtb_u_u13 : string B_dData_dList.t_List) -> (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (Obj.repr ((fun (dtb_u_u20 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u23 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u10) dtb_u_u14) dtb_u_u20) in (if dtb_u_u23 then (let dtb_u_u31 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u10) dtb_u_u14) dtb_u_u20) in (let dtb_u_u33 = (if ((B_dData_dString.v_trim dtb_u_u31) = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dString.v_trim dtb_u_u31)))) in dtb_u_u33)) else ((Obj.magic ((v_readFirstBuildId dtb_u_u10) dtb_u_u15)) dtb_u_u20))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u36 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u37 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u36))))
  | _ -> failwith "DT: impossible branch"
))
# 120 "Vuna/Compiler/Loader/Fingerprint.vuna"
and v_readFirstBuildId_u_udirect = (fun (nFs : string) (mc0 : string B_dData_dList.t_List) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (let dtb_u_u23 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u14) _u_ueffTok) in (if dtb_u_u23 then (let dtb_u_u31 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u14) _u_ueffTok) in (let dtb_u_u33 = (if ((B_dData_dString.v_trim dtb_u_u31) = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dString.v_trim dtb_u_u31)))) in dtb_u_u33)) else ((Obj.magic ((v_readFirstBuildId nFs) dtb_u_u15)) _u_ueffTok)))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u36 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u36)
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_readNamedNear = (fun (dtb_u_u38 : string) (dtb_u_u41 : string) (dtb_u_u42 : string) -> (let dtb_u_u43 = (Base_dSource.v_parentOfPath dtb_u_u41) in (let dtb_u_u44 = (Base_dSource.v_parentOfPath dtb_u_u43) in ((v_readFirstBuildId dtb_u_u38) (B_dData_dList.C_List__x58__x58_ ((String.concat "" [dtb_u_u44; "/"; dtb_u_u42]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [dtb_u_u43; "/"; dtb_u_u42]), B_dData_dList.C_List_Nil))))))))

# 113 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_readNamedNear_u_udirect = (fun (nFs : string) (exe : string) (name : string) _u_ueffTok -> (let dtb_u_u43 = (Base_dSource.v_parentOfPath exe) in (let dtb_u_u44 = (Base_dSource.v_parentOfPath dtb_u_u43) in ((Obj.magic ((v_readFirstBuildId nFs) (B_dData_dList.C_List__x58__x58_ ((String.concat "" [dtb_u_u44; "/"; name]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [dtb_u_u43; "/"; name]), B_dData_dList.C_List_Nil)))))) _u_ueffTok))))

# 109 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_readBuildIdNear = (fun (dtb_u_u45 : string) (dtb_u_u48 : string) -> (((v_readNamedNear dtb_u_u45) dtb_u_u48) v_buildIdFileName))

# 109 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_readBuildIdNear_u_udirect = (fun (nFs : string) (exe : string) _u_ueffTok -> ((Obj.magic (((v_readNamedNear nFs) exe) v_buildIdFileName)) _u_ueffTok))

# 64 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerTagEff = (fun (dtb_u_u49 : string) (dtb_u_u50 : string) -> (Obj.repr ((fun (dtb_u_u58 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u61 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u50) "VUNA_COMPILER_TAG") dtb_u_u58) in (if (dtb_u_u61 <> "") then (let dtb_u_u63 = dtb_u_u61 in dtb_u_u63) else (let dtb_u_u72 = ((B_dEffect_dEnv.v_envExecPath_u_udirect dtb_u_u50) dtb_u_u58) in (let dtb_u_u80 = (((v_readBuildIdNear_u_udirect dtb_u_u49) dtb_u_u72) dtb_u_u58) in (match dtb_u_u80 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u81) -> (let dtb_u_u83 = dtb_u_u81 in dtb_u_u83)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u92 = (((B_dEffect_dFs.v_fsFileSize_u_udirect dtb_u_u49) dtb_u_u72) dtb_u_u58) in (let dtb_u_u98 = Obj.obj ((((fun dtb_u_u102 dtb_u_u103 -> (Obj.repr ((fun (dtb_u_u104 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u105 = Obj.obj (dtb_u_u103) in (dtb_u_u102 (dtb_u_u105 dtb_u_u104))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime dtb_u_u49) dtb_u_u72))) in (let dtb_u_u106 = (dtb_u_u98 dtb_u_u58) in (match dtb_u_u92 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u108 = Base_dVersion.v_vunaVersion in dtb_u_u108)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u110) -> (let dtb_u_u112 = ("stat:" ^ (string_of_int (((v_fingerprintOfStat dtb_u_u72) dtb_u_u110) dtb_u_u106))) in dtb_u_u112)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 64 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerTagEff_u_udirect = (fun (nFs : string) (nEnv : string) _u_ueffTok -> (let dtb_u_u61 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_COMPILER_TAG") _u_ueffTok) in (if (dtb_u_u61 <> "") then (let dtb_u_u63 = dtb_u_u61 in dtb_u_u63) else (let dtb_u_u72 = ((B_dEffect_dEnv.v_envExecPath_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u80 = (((v_readBuildIdNear_u_udirect nFs) dtb_u_u72) _u_ueffTok) in (match dtb_u_u80 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u81) -> (let dtb_u_u83 = dtb_u_u81 in dtb_u_u83)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u92 = (((B_dEffect_dFs.v_fsFileSize_u_udirect nFs) dtb_u_u72) _u_ueffTok) in (let dtb_u_u98 = Obj.obj ((((fun dtb_u_u102 dtb_u_u103 -> (Obj.repr ((fun (dtb_u_u104 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u105 = Obj.obj (dtb_u_u103) in (dtb_u_u102 (dtb_u_u105 dtb_u_u104))))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) dtb_u_u72))) in (let dtb_u_u106 = (dtb_u_u98 _u_ueffTok) in (match dtb_u_u92 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u108 = Base_dVersion.v_vunaVersion in dtb_u_u108)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u110) -> (let dtb_u_u112 = ("stat:" ^ (string_of_int (((v_fingerprintOfStat dtb_u_u72) dtb_u_u110) dtb_u_u106))) in dtb_u_u112)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))

# 89 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_cacheTagEff = (fun (dtb_u_u114 : string) (dtb_u_u115 : string) -> (Obj.repr ((fun (dtb_u_u123 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u126 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u115) "VUNA_CACHE_TAG") dtb_u_u123) in (if (dtb_u_u126 <> "") then (let dtb_u_u128 = dtb_u_u126 in dtb_u_u128) else (let dtb_u_u137 = ((B_dEffect_dEnv.v_envExecPath_u_udirect dtb_u_u115) dtb_u_u123) in (let dtb_u_u145 = ((((v_readNamedNear_u_udirect dtb_u_u114) dtb_u_u137) v_cacheTagFileName) dtb_u_u123) in (match dtb_u_u145 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u146) -> (let dtb_u_u148 = dtb_u_u146 in dtb_u_u148)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((v_compilerTagEff dtb_u_u114) dtb_u_u115)) dtb_u_u123)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 89 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_cacheTagEff_u_udirect = (fun (nFs : string) (nEnv : string) _u_ueffTok -> (let dtb_u_u126 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_CACHE_TAG") _u_ueffTok) in (if (dtb_u_u126 <> "") then (let dtb_u_u128 = dtb_u_u126 in dtb_u_u128) else (let dtb_u_u137 = ((B_dEffect_dEnv.v_envExecPath_u_udirect nEnv) _u_ueffTok) in (let dtb_u_u145 = ((((v_readNamedNear_u_udirect nFs) dtb_u_u137) v_cacheTagFileName) _u_ueffTok) in (match dtb_u_u145 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u146) -> (let dtb_u_u148 = dtb_u_u146 in dtb_u_u148)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((v_compilerTagEff nFs) nEnv)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))))))

# 133 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerFingerprintEff = (fun (dtb_u_u150 : string) (dtb_u_u151 : string) -> (Obj.repr ((fun (dtb_u_u159 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u162 = (((v_compilerTagEff_u_udirect dtb_u_u150) dtb_u_u151) dtb_u_u159) in (let dtb_u_u164 = (v_textHashOf dtb_u_u162) in dtb_u_u164))))))

# 133 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerFingerprintEff_u_udirect = (fun (nFs : string) (nEnv : string) _u_ueffTok -> (let dtb_u_u162 = (((v_compilerTagEff_u_udirect nFs) nEnv) _u_ueffTok) in (let dtb_u_u164 = (v_textHashOf dtb_u_u162) in dtb_u_u164)))
