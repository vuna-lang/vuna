open Vuna_runtime
let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema = "vuna-unit-cache 1"

let v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf = (fun s -> ((((dtp_strHash s) * 1000003) + (dtp_strHash ("unit:" ^ s))) + (bi_strLength s)))

let v_Vuna_dCompiler_dDriver_dPerfCache_dbinaryFingerprint = ((fun argv -> (match argv with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) dtb__0)) then (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) dtb__0))) else (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion))
  | _ -> failwith "DT: impossible branch"
)) (Base_dIO.v_Base_dIO_drunIO (fun (_ : int) -> (Base_dList.dtp_listOf (dtp_getArgs ())))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag = (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema; "/"; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "/"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dPerfCache_dbinaryFingerprint)])

let v_Vuna_dCompiler_dDriver_dPerfCache_dcacheBaseOf = (if ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "TMPDIR")) = "") then "/tmp" else ((fun t -> t) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "TMPDIR"))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf = (fun s -> (bi_strFromInt (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf s)))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir = (fun pkg -> (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dcacheBaseOf; "/vuna-cache/"; (v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf pkg); "/split-units"]))

let v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe = (fun c -> (if (c = 46) then 95 else c))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath = (fun dir name key -> ((fun h1 -> ((fun h2 -> ((fun h3 -> (String.concat "" [dir; "/"; (v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe name); "-"; (bi_strFromInt h1); "-"; (bi_strFromInt h2); "-"; (bi_strFromInt h3); ".unit"])) (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf ("k3:" ^ key)))) (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf ("k2:" ^ key)))) (v_Vuna_dCompiler_dDriver_dPerfCache_dtextHashOf ("k1:" ^ key))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_dbreakFirstNewline = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (if (dtb__2 = 10) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (Base_dList.dtp_pack dtb__3))))) else ((v_Vuna_dCompiler_dDriver_dPerfCache_dbreakFirstNewline dtb__3) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, mc1))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead = (fun dir name key -> ((fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then ((fun raw -> (match ((v_Vuna_dCompiler_dDriver_dPerfCache_dbreakFirstNewline (Base_dList.dtp_unpack raw)) Base_dList.C_Base_dList_dList_Base_dList_dNil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__4) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__4) = v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((dtp_unmarshal (Base_dPair.v_Base_dPair_dsecondOf dtb__4)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key)))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (if (dtb__5 = 47) then dtb__6 else (v_Vuna_dCompiler_dDriver_dPerfCache_ddropPastSlash dtb__6))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dPerfCache_dparentOf = (fun path -> ((fun chars -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength chars)) then "." else ((fun p -> (if (p = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") p)) else false) then ("/" ^ p) else p))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dPerfCache_ddropPastSlash chars))) (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))))

let rec v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then 0 else ((fun parent -> (if (if (if (path = "") then true else (path = "/")) then true else (path = ".")) then 0 else ((fun _u -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then 0 else (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_makeDir dtio_0) path)))) (if (parent = path) then 0 else ((v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPathFuel (fuel - 1)) parent))))) (v_Vuna_dCompiler_dDriver_dPerfCache_dparentOf path))))

let v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPathFuel 64) path))

let v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite = (fun dir name key sf -> ((fun _u -> ((fun payload -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) (((v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath dir) name) key)) payload))) (String.concat "" [v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag; "\n"; (dtp_marshal sf)]))) (v_Vuna_dCompiler_dDriver_dPerfCache_densureDirPath dir)))
