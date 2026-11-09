open Vuna_runtime
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema = "vuna-unit-cache 1"

let v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf = (fun s -> ((((dtp_strHash s) * 1000003) + (dtp_strHash ("unit:" ^ s))) + (bi_strLength s)))

let v_Vuna_dCompiler_dDriver_dPerfCache_dbinaryFingerprint = ((fun exe -> ((fun size -> ((fun mtime -> (if (size > 0) then (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf (String.concat "" [exe; ":"; (bi_strFromInt size); ":"; (bi_strFromInt mtime)])) else (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) exe)))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) exe)))) (Base_dIO.v_Base_dIO_drunIO (fun (_ : int) -> (dtp_execPath ()))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag = (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema; "/"; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "/"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dPerfCache_dbinaryFingerprint)])

let v_Vuna_dCompiler_dDriver_dPerfCache_dcacheBaseOf = (if ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "TMPDIR")) = "") then "/tmp" else ((fun t -> t) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "TMPDIR"))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf = (fun s -> (bi_strFromInt (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf s)))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir = (fun pkg -> (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dcacheBaseOf; "/vuna-cache/"; (v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf pkg); "/split-units"]))

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
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> ((fun _u -> ((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles mc0) dtb__2)) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_removeFile dtio_0) (String.concat "" [mc0; "/"; dtb__1]))))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles = (fun dir -> ((v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles dir) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0) dir))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun path -> (if (path = mc1) then (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries mc0) mc1) dtb__4) else (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) path)) then ((fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries mc0) mc1) dtb__4)) (v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles path)) else ((fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries mc0) mc1) dtb__4)) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_removeFile dtio_0) path)))))) (String.concat "" [mc0; "/"; dtb__3]))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> ((fun path -> (if ((Base_dList.v_Base_dList_dmemName dtb__5) mc1) then (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo mc0) mc1) dtb__6) else (if (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) path)) else false) then (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo mc0) mc1) dtb__6) else ((fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo mc0) mc1) dtb__6)) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_removeFile dtio_0) path)))))) (String.concat "" [mc0; "/"; dtb__5]))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead = (fun dir name key -> (match ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dreadFramed v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtp_unmarshal dtb__7)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if (dtb__8 = 47) then dtb__9 else (v_Vuna_dCompiler_dDriver_dPerfCache_ddropPastSlash dtb__9))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_dparentOf = (fun path -> ((fun chars -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength chars)) then "." else ((fun p -> (if (p = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") p)) else false) then ("/" ^ p) else p))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dPerfCache_ddropPastSlash chars))) (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then 0 else ((fun parent -> (if (if (if (path = "") then true else (path = "/")) then true else (path = ".")) then 0 else ((fun _u -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then 0 else (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_makeDir dtio_0) path)))) (if (parent = path) then 0 else ((v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPathFuel (fuel - 1)) parent))))) (v_Vuna_dCompiler_dDriver_dPerfCache_dparentOf path))))

let v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPathFuel 64) path))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheGc = (fun base keepDir -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries base) keepDir) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0) base)))) (v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath base)))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc = (fun dir keepNames -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo dir) keepNames) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0) dir)))) (v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath dir)))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite = (fun dir name key sf -> ((fun _u -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key)) ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dframeEncode v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag) (dtp_marshal sf))))) (v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath dir)))
