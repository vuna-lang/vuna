open Vuna_runtime
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema = "vuna-unit-cache 2"

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec = "split-file 1"

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema; "/"; tag]))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dcacheBaseOf = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "TMPDIR")) (fun t -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (t = "") then "/tmp" else ((fun tmp -> tmp) t)))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf = (fun s -> (bi_strFromInt (Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dtextHashOf s)))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir = (fun pkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dPerfCache_dcacheBaseOf) (fun base -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [base; "/vuna-cache/"; (v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf pkg); "/split-units"])))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe = (fun c -> (if (c = 46) then 95 else c))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName = (fun name key -> ((fun h1 -> ((fun h2 -> ((fun h3 -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe name); "-"; (bi_strFromInt h1); "-"; (bi_strFromInt h2); "-"; (bi_strFromInt h3); ".unit"])) (Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dtextHashOf ("k3:" ^ key)))) (Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dtextHashOf ("k2:" ^ key)))) (Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dtextHashOf ("k1:" ^ key))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath = (fun dir name key -> (String.concat "" [dir; "/"; ((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName name) key)]))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryDir = (fun base entryKey -> (String.concat "" [base; "/e-"; (bi_strFromInt (Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dtextHashOf ("entry:" ^ entryKey))); "-"; (bi_strFromInt (Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dtextHashOf ("entry2:" ^ entryKey)))]))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryKeyOf = (fun keys -> (match ((Base_dList.v_Base_dList_dlookupPair "__entry__") keys) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile = (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) "/") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-f", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil))))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile (String.concat "" [mc0; "/"; dtb__1]))) (fun _u -> ((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles mc0) dtb__2)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles = (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dir)) (fun names -> ((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles dir) names))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun path -> (if (path = mc1) then (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries mc0) mc1) dtb__4) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) path)) (fun isDir -> (if isDir then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles path)) (fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries mc0) mc1) dtb__4))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile path)) (fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries mc0) mc1) dtb__4)))))))) (String.concat "" [mc0; "/"; dtb__3]))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheGc = (fun base keepDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff base)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) base)) (fun names -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries base) keepDir) names))))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> ((fun path -> (if ((Base_dList.v_Base_dList_dmemName dtb__5) mc1) then (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo mc0) mc1) dtb__6) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo mc0) mc1) dtb__6) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile path)) (fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo mc0) mc1) dtb__6)))))))))) (String.concat "" [mc0; "/"; dtb__5]))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc = (fun dir keepNames -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff dir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dir)) (fun names -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo dir) keepNames) names))))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead = (fun dir name key -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreReadEff tag) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key))) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFileComplete dtb__7)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite = (fun dir name key sf -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff dir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag) (fun tag -> ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreWriteEff tag) v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key)) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFile) sf)))))))
