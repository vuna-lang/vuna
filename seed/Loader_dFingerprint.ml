open Vuna_runtime
# 38 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_buildIdFileName = "build-id"

# 42 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_buildIdSchema = "vuna-compiler-id 1"

# 53 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_sourceFrag = (fun (p : (string, int) B_dData_dPair.t_Pair) -> (String.concat "" [(B_dData_dPair.v_firstOf p); "="; (string_of_int (B_dData_dPair.v_secondOf p))]))

# 48 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerIdOf = (fun (own : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (depsDigest : string) -> (Loader_dAddr.v_addrOf (B_dData_dList.C_List__x58__x58_ (v_buildIdSchema, (B_dData_dList.C_List__x58__x58_ (depsDigest, ((B_dData_dList.v_map v_sourceFrag) ((B_dData_dSort.v_sortBy (fun (a : (string, int) B_dData_dPair.t_Pair) (b : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))) own))))))))

# 60 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_textHashOf = (fun (s : string) -> (Base_dHash.v_contentKey s))

# 57 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_fingerprintOfStat = (fun (exe : string) (size : int) (mtime : int) -> (v_textHashOf (String.concat "" [exe; ":"; (string_of_int size); ":"; (string_of_int mtime)])))

# 104 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_cacheTagFileName = "cache-tag"

# 120 "Vuna/Compiler/Loader/Fingerprint.vuna"
let rec v_readFirstBuildId = (fun (nFs : string) (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__2 = Obj.obj (e) in (let dtb__3 = Obj.obj ((k (dtb__2 u))) in (dtb__3 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) dtb__0)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__4 = Obj.obj (e) in (let dtb__5 = Obj.obj ((k (dtb__4 u))) in (dtb__5 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) dtb__0)) (fun raw -> (let x = (if ((B_dData_dString.v_trim raw) = "") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dString.v_trim raw)))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else ((v_readFirstBuildId nFs) dtb__1))))
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_readNamedNear = (fun (nFs : string) (exe : string) (name : string) -> (let binDir = (Base_dSource.v_parentOfPath exe) in (let outDir = (Base_dSource.v_parentOfPath binDir) in ((v_readFirstBuildId nFs) (B_dData_dList.C_List__x58__x58_ ((String.concat "" [outDir; "/"; name]), (B_dData_dList.C_List__x58__x58_ ((String.concat "" [binDir; "/"; name]), B_dData_dList.C_List_Nil))))))))

# 109 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_readBuildIdNear = (fun (nFs : string) (exe : string) -> (((v_readNamedNear nFs) exe) v_buildIdFileName))

# 64 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerTagEff = (fun (nFs : string) (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__6 = Obj.obj (e) in (let dtb__7 = Obj.obj ((k (dtb__6 u))) in (dtb__7 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_COMPILER_TAG")) (fun override -> (if (override <> "") then (let x = override in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__8 = Obj.obj (e) in (let dtb__9 = Obj.obj ((k (dtb__8 u))) in (dtb__9 u)))))) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__10 = Obj.obj (e) in (let dtb__11 = Obj.obj ((k (dtb__10 u))) in (dtb__11 u)))))) ((v_readBuildIdNear nFs) exe)) (fun saved -> (match saved with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> (let x = dtb__12 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__13 = Obj.obj (e) in (let dtb__14 = Obj.obj ((k (dtb__13 u))) in (dtb__14 u)))))) ((B_dEffect_dFs.v_fsFileSize nFs) exe)) (fun sizeOpt -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__15 = Obj.obj (e) in (let dtb__16 = Obj.obj ((k (dtb__15 u))) in (dtb__16 u)))))) (((fun f e -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__17 = Obj.obj (e) in (f (dtb__17 u)))))) (B_dData_dMaybe.v_fromMaybe 0)) ((B_dEffect_dFs.v_fsFileMtime nFs) exe))) (fun mtime -> (match sizeOpt with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = Base_dVersion.v_vunaVersion in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (let x = ("stat:" ^ (string_of_int (((v_fingerprintOfStat exe) dtb__18) mtime))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 89 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_cacheTagEff = (fun (nFs : string) (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__19 = Obj.obj (e) in (let dtb__20 = Obj.obj ((k (dtb__19 u))) in (dtb__20 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_CACHE_TAG")) (fun override -> (if (override <> "") then (let x = override in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__21 = Obj.obj (e) in (let dtb__22 = Obj.obj ((k (dtb__21 u))) in (dtb__22 u)))))) (B_dEffect_dEnv.v_envExecPath nEnv)) (fun exe -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__23 = Obj.obj (e) in (let dtb__24 = Obj.obj ((k (dtb__23 u))) in (dtb__24 u)))))) (((v_readNamedNear nFs) exe) v_cacheTagFileName)) (fun found -> (match found with
  | B_dData_dMaybe.C_Maybe_Just (dtb__25) -> (let x = dtb__25 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_compilerTagEff nFs) nEnv)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 133 "Vuna/Compiler/Loader/Fingerprint.vuna"
let v_compilerFingerprintEff = (fun (nFs : string) (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__26 = Obj.obj (e) in (let dtb__27 = Obj.obj ((k (dtb__26 u))) in (dtb__27 u)))))) ((v_compilerTagEff nFs) nEnv)) (fun tag -> (let x = (v_textHashOf tag) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
