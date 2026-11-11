open Vuna_runtime
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema = "vuna-unit-cache 1"

let v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey s))

let v_Vuna_dCompiler_dDriver_dPerfCache_dbinaryFingerprint = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_execPath ())))) (fun exe -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) exe)) (fun size -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) exe)) (fun mtime -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (size > 0) then (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf (String.concat "" [exe; ":"; (bi_strFromInt size); ":"; (bi_strFromInt mtime)])) else (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)))))))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dPerfCache_dbinaryFingerprint) (fun fp -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema; "/"; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "/"; (bi_strFromInt fp)]))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dcacheBaseOf = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "TMPDIR")) (fun t -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (t = "") then "/tmp" else ((fun tmp -> tmp) t)))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf = (fun s -> (bi_strFromInt (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf s)))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir = (fun pkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dPerfCache_dcacheBaseOf) (fun base -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [base; "/vuna-cache/"; (v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf pkg); "/split-units"])))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe = (fun c -> (if (c = 46) then 95 else c))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName = (fun name key -> ((fun h1 -> ((fun h2 -> ((fun h3 -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe name); "-"; (bi_strFromInt h1); "-"; (bi_strFromInt h2); "-"; (bi_strFromInt h3); ".unit"])) (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf ("k3:" ^ key)))) (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf ("k2:" ^ key)))) (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf ("k1:" ^ key))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath = (fun dir name key -> (String.concat "" [dir; "/"; ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName name) key)]))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryDir = (fun base entryKey -> (String.concat "" [base; "/e-"; (bi_strFromInt (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf ("entry:" ^ entryKey))); "-"; (bi_strFromInt (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf ("entry2:" ^ entryKey)))]))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryKeyOf = (fun keys -> (match ((Base_dList.v_Base_dList_dlookupPair "__entry__") keys) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_removeFile dtio_0)) (String.concat "" [mc0; "/"; dtb__1]))) (fun _u -> ((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles mc0) dtb__2)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles = (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dir)) (fun names -> ((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles dir) names))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun path -> (if (path = mc1) then (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries mc0) mc1) dtb__4) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) path)) (fun isDir -> (if isDir then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles path)) (fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries mc0) mc1) dtb__4))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_removeFile dtio_0)) path)) (fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries mc0) mc1) dtb__4)))))))) (String.concat "" [mc0; "/"; dtb__3]))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> ((fun path -> (if ((Base_dList.v_Base_dList_dmemName dtb__5) mc1) then (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo mc0) mc1) dtb__6) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo mc0) mc1) dtb__6) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_removeFile dtio_0)) path)) (fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo mc0) mc1) dtb__6)))))))))) (String.concat "" [mc0; "/"; dtb__5]))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead = (fun dir name key -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dreadFramedEff tag) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key))) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtp_unmarshal dtb__7)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if (dtb__8 = 47) then dtb__9 else (v_Vuna_dCompiler_dDriver_dPerfCache_ddropPastSlash dtb__9))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_dparentOf = (fun path -> ((fun chars -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength chars)) then "." else ((fun p -> (if (p = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") p)) else false) then ("/" ^ p) else p))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dPerfCache_ddropPastSlash chars))) (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (if (if (if (path = "") then true else (path = "/")) then true else (path = ".")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else ((fun parent -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if (parent = path) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else ((v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPathFuel (fuel - 1)) parent))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_makeDir dtio_0)) path))))))) (v_Vuna_dCompiler_dDriver_dPerfCache_dparentOf path)))))

let v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPathFuel 64) path))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheGc = (fun base keepDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath base)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) base)) (fun names -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries base) keepDir) names))))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc = (fun dir keepNames -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath dir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dir)) (fun names -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo dir) keepNames) names))))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite = (fun dir name key sf -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath dir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag) (fun tag -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key)) ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dframeEncode tag) (dtp_marshal sf))))))))
