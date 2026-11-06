open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCompile_dToolContext = C_Vuna_dCompiler_dDriver_dCompile_dToolContext_Vuna_dCompiler_dDriver_dCompile_dToolContext of (Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dModuleIface Base_dList.t_Base_dList_dList) * ((string, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dPackageManifest Base_dMaybe.t_Base_dMaybe_dMaybe) * (string Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dSourceInfo Base_dList.t_Base_dList_dList) * ((string, (string, Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dManifestEntry) Base_dPair.t_Base_dPair_dPair) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)

let rec v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (dtb__0 = 47) then dtb__1 else (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash dtb__1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

let rec v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then 0 else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then 0 else (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then 0 else ((fun _u -> (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_makeDir dtio_0) path))) ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel (fuel - 1)) (v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath path)))))))

let v_Vuna_dCompiler_dDriver_dCompile_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel 256) path))

let v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles = (fun ctxDir outDir -> ((fun ffiDir -> ((fun exists -> (if exists then ((fun cs -> ((fun _u -> ((fun _u -> ((Base_dList.v_Base_dList_dmap (fun n -> ("ffi/" ^ ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)))) cs)) ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFile dtio_0 dtio_1) (String.concat "" [outDir; "/ffi/"; ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)])) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) (String.concat "" [ffiDir; "/"; ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)]))))))) cs))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/ffi")))) ((Base_dList.v_Base_dList_dfilter (fun n -> ((Base_dString.v_Base_dString_dendsWith ".c") n))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0) ffiDir)))) else Base_dList.C_Base_dList_dList_Base_dList_dNil)) (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) ffiDir)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) ffiDir)) else false))) (ctxDir ^ "/ffi")))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled = (fun ctx outDir files -> ((fun _u -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged outDir) files)) (fun n -> ((fun _u -> ((fun graph -> ((fun _u -> ((fun cFiles -> ((fun _u -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (n))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "build-script-done"))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFile dtio_0 dtio_1) (outDir ^ "/build.sh")) ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dbuildScript graph) cFiles))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx)) outDir))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "split-graph-done"))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo files)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "write-split-files-done"))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "write-compiled-start"))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath outDir)))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema = 1

let v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName = "build-meta.json"

let v_Vuna_dCompiler_dDriver_dCompile_dtextHash = (fun s -> ((((dtp_strHash s) * 1000003) + (dtp_strHash ("m30:" ^ s))) + (bi_strLength s)))

let v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint = ((fun exe -> ((fun size -> ((fun mtime -> (if (size > 0) then (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (String.concat "" [exe; ":"; (bi_strFromInt size); ":"; (bi_strFromInt mtime)])) else (v_Vuna_dCompiler_dDriver_dCompile_dtextHash Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) exe)))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) exe)))) (Base_dIO.v_Base_dIO_drunIO (fun (_ : int) -> (dtp_execPath ()))))

let v_Vuna_dCompiler_dDriver_dCompile_dcacheBase = ((fun tmp -> ((if (tmp = "") then "/tmp" else tmp) ^ "/vuna-cache")) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "TMPDIR")))

let v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir = (fun name -> (if (if (if (if (if (if (if (if (name = ".git") then true else (name = ".local")) then true else (name = ".output")) then true else (name = ".direnv")) then true else (name = "node_modules")) then true else (name = "seed")) then true else (name = "_scratch")) then true else (name = "result")) then true else (name = "corpus")))

let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta = (fun fuel dir -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (if (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) dir)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) dir)) else false) then ((Base_dList.v_Base_dList_dconcatMap ((v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta (fuel - 1)) dir)) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0) dir))) else Base_dList.C_Base_dList_dList_Base_dList_dNil)))
and v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta = (fun fuel dir name -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (if (name = ".") then Base_dList.C_Base_dList_dList_Base_dList_dNil else (if (name = "..") then Base_dList.C_Base_dList_dList_Base_dList_dNil else (if (v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir name) then Base_dList.C_Base_dList_dList_Base_dList_dNil else ((fun path -> (if (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) path)) else false) then ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta (fuel - 1)) path) else (if ((Base_dString.v_Base_dString_dendsWith ".vuna") name) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (path, Base_dList.C_Base_dList_dList_Base_dList_dNil)) else Base_dList.C_Base_dList_dList_Base_dList_dNil))) (String.concat "" [dir; "/"; name])))))))

let v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta = (fun prefix s -> (if ((Base_dString.v_Base_dString_dstartsWith prefix) s) then (((Base_dString.v_Base_dString_dsubstring (Base_dString.v_Base_dString_dbyteLength prefix)) (bi_natSub (Base_dString.v_Base_dString_dbyteLength s) (Base_dString.v_Base_dString_dbyteLength prefix))) s) else s))

let v_Vuna_dCompiler_dDriver_dCompile_dslashToDot = (fun c -> (if (c = 47) then 46 else c))

let v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dslashToDot) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath = (fun rootPath path -> ((fun rel0 -> ((fun rel -> (v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots rel)) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel0) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natSub (Base_dString.v_Base_dString_dbyteLength rel0) 5)) rel0) else rel0))) ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta (rootPath ^ "/")) path)))

let v_Vuna_dCompiler_dDriver_dCompile_drootSources = (fun root -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p), (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) p))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root))))

let rec v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match dtb__2 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf dtb__3) ((mc1 * 1000003) + dtb__5))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_drootHash = (fun root -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_drootSources root)) 0))

let v_Vuna_dCompiler_dDriver_dCompile_dentrySource = (fun entry -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("<entry>", (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) entry))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcontextSources = (fun ctx entry -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_drootSources) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dCompile_dentrySource entry), Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes = (fun ctx -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> ((Base_dList.v_Base_dList_dmap (fun r -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r), (v_Vuna_dCompiler_dDriver_dCompile_drootHash r))))) dtb__7)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, dtb__9) -> (String.concat "" ["{\"name\":\""; dtb__8; "\",\"hash\":"; (bi_strFromInt dtb__9); "}"])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> dtb__10
  | _ -> (String.concat "" [dtb__10; ","; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList dtb__11)])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (if (dtb__12 = 47) then (Base_dList.dtp_pack mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev dtb__13) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, mc1))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dlastSegment = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText = (fun ctx entry linked -> ((fun sources -> ((fun deps -> ((fun manifestHash -> ((fun entryName -> ((fun linkedText -> (String.concat "" ["{\"schema\":"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema); ",\"compiler\":\""; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "\",\"package\":\""; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (bi_strFromInt ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)); ",\"manifest\":"; (bi_strFromInt manifestHash); ",\"sources\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) sources)); "],\"dependencies\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) deps)); "]}\n"])) (if linked then "true" else "false"))) (v_Vuna_dCompiler_dDriver_dCompile_dlastSegment entry))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/vuna.toml")))))) (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx))) ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf = (fun outDir -> (String.concat "" [outDir; "/"; v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName]))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta = (fun outDir ctx entry linked -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFile dtio_0 dtio_1) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)) (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) linked))))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate = (fun outDir ctx entry binPath -> ((fun path -> (if (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) binPath)) else false) then ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path)) = (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) true)) else false)) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)))

let v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript = (fun dir out name -> ((fun code -> (if (code = 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["build: "; name; ": `sh build.sh "; out; "` failed in "; dir; " (exit "; (bi_strFromInt code); ")"]))))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1) dir) (Base_dList.C_Base_dList_dList_Base_dList_dCons ("sh", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("build.sh", (Base_dList.C_Base_dList_dList_Base_dList_dCons (out, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema = "vuna-check-cache 7"

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheTag = (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema; "/"; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion])

let v_Vuna_dCompiler_dDriver_dCompile_dhashText = (fun n -> (bi_strFromInt (n - ((if 1000000007 = 0 then failwith "division by zero" else n / 1000000007) * 1000000007))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir = (fun ctx -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))); "/check"]))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath = (fun ctx key -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir ctx); "/"; key]))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyExe = (fun ctx entry -> ((fun srcHash -> ((fun depsHash -> ((fun manHash -> ((fun verHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)])) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/vuna.toml")))))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) 0)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyLib = (fun ctx names -> ((fun srcHash -> ((fun depsHash -> ((fun manHash -> ((fun namesHash -> ((fun verHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText namesHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)])) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash ((Base_dString.v_Base_dString_djoin "\t") names)))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/vuna.toml")))))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_drootSources) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) 0)))

let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (if (mc0 <= 0) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15)))) else (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__14)) mc1) then (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) mc1) dtb__15) else (match (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__14), mc1))) (match dtb__14 with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__16, dtb__17, dtb__18) -> dtb__17
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, dtb__20) -> (match (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) dtb__19) dtb__15) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, ((Base_dList.v_Base_dList_dappend dtb__20) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__22)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages = (fun seen ps -> (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel 4096) seen) ps))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceDirOf = (fun dep -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/iface-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dep)))]))

let rec v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (if ((Base_dList.v_Base_dList_dmemName dtb__23) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn dtb__24) mc1) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn a) b) else false) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn b) a) else false))

let v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList = (fun ctx -> (match (match ctx with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> dtb__26
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__30) -> (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Base_dList_dNil) (match dtb__30 with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__31, dtb__32, dtb__33) -> dtb__32
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount = (fun ctx -> (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList ctx)))

let v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots = (fun roots -> ((Base_dList.v_Base_dList_dconcatMap (fun r -> ((Base_dList.v_Base_dList_dmap (fun path -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r)) path), path)))) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r))))) roots))

let v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec = 5

let v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath = ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_CACHE_MTIME")) = "1")

let rec v_Vuna_dCompiler_dDriver_dCompile_ddepHashListOk = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (match dtb__34 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, dtb__37) -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__36) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__38) -> (if (dtb__38 = dtb__37) then ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashListOk mc0) dtb__35) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_ddepHashesAllOk = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (if ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashListOk mc0) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__39)) then ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashesAllOk mc0) dtb__40) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceChainValid = (fun ifaces -> ((fun tbl -> ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashesAllOk tbl) ifaces)) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m), (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m))))) ifaces)))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__41, dtb__42) -> (match dtb__41 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__44) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry e), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, e)))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__44))) (v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable dtb__42))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolFindEntry = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__45, dtb__46) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__45) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__45)) else ((v_Vuna_dCompiler_dDriver_dCompile_dtoolFindEntry dtb__46) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__47, dtb__48) -> (if (mc0 <= 0) then mc2 else (if ((Base_dList.v_Base_dList_dmemName dtb__47) mc2) then ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo mc0) mc1) mc2) dtb__48) else (match ((v_Vuna_dCompiler_dDriver_dCompile_dtoolFindEntry mc1) dtb__47) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo (mc0 - 1)) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__47, mc2))) dtb__48)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__49) -> ((fun e -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo (mc0 - 1)) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__47, mc2))) ((Base_dList.v_Base_dList_dappend dtb__48) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeImportsOfEntry e)) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeDepsOfEntry e)))))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__49)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolClosure = (fun table starts -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo 8192) table) Base_dList.C_Base_dList_dList_Base_dList_dNil) starts))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolChainValid = (fun ifaces -> ((fun tbl -> ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashesAllOk tbl) ifaces)) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m), (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m))))) ifaces)))

let v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__50, dtb__51, dtb__52, dtb__53) -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf = (fun ctx current imports -> (match ((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) current) imports) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__54) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) imports)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__55) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) ((Base_dList.v_Base_dList_dappend imports) dtb__55))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource = (fun ctx label source -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__56) -> (match dtb__56 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSourceFile (dtb__57, dtb__58, dtb__59, dtb__60) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf ctx) "") dtb__58)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__61) -> (match dtb__61 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__62, dtb__63, dtb__64, dtb__65) -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf ctx) dtb__62) dtb__58)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__57)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__66) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled = ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_IFACE_TOOL")) <> "0")

let v_Vuna_dCompiler_dDriver_dCompile_dtableOfManifest = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__67, dtb__68) -> ((Base_dList.v_Base_dList_dmap (fun e -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry e), (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeIfaceHashOfEntry e))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__68))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dmanifestHashTable = (fun mans -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_dtableOfManifest) mans))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolTextHash = (fun _uarity0 -> (v_Vuna_dCompiler_dDriver_dCompile_dtextHash _uarity0))

let v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoForPath = (fun path -> ((fun raw -> (Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_Vuna_dCompiler_dDriver_dIface_dSourceInfo (path, (v_Vuna_dCompiler_dDriver_dCompile_dtextHash raw), (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) path)), (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) path))))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))))

let v_Vuna_dCompiler_dDriver_dCompile_dstatsOfManifest = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, dtb__70) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeSourceOfEntry) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__70))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoForPath (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf dtb__69)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec = (if 1000000 = 0 then failwith "division by zero" else (Base_dIO.v_Base_dIO_drunIO (fun (_ : int) -> (dtp_timeUs ()))) / 1000000)

let v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged = (fun path si -> (if v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath then ((fun m -> ((fun sz -> (if (if (if (m = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si)) then (sz = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf si)) else false) then ((m + v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec) < v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec) else false) then true else ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) path)))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) path))) else ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si))))

let rec v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__71)) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__73) -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged dtb__73) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__71)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid dtb__72) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceSourcesValid = (fun roots p pi -> ((fun pkgRoots -> ((fun walked -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) walked)) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf (match pi with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__74, dtb__75, dtb__76, dtb__77) -> dtb__77
  | _ -> failwith "DT: impossible branch"
))) then ((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid (match pi with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__78, dtb__79, dtb__80, dtb__81) -> dtb__81
  | _ -> failwith "DT: impossible branch"
)) walked) else false)) (v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots pkgRoots))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p)))) roots)))

let rec v_Vuna_dCompiler_dDriver_dCompile_dallEntriesValid = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__82)) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__84) -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged dtb__84) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeSourceOfEntry dtb__82)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallEntriesValid dtb__83) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dmanifestSourcesValid = (fun roots p mf -> ((fun pkgRoots -> ((fun walked -> ((fun entries -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) walked)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry) entries)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallEntriesValid entries) walked) else false)) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf mf))) (v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots pkgRoots))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p)))) roots)))

let v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh = (fun builtSec si -> ((fun path -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path))) false) then false else ((fun m -> ((fun sz -> (if (if (if (m = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si)) then (sz = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf si)) else false) then (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si) + v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec) <= builtSec) else false) then true else ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) path)))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) path))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiPathOf si)))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh mc0) dtb__85) then ((v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh mc0) dtb__86) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dfilterOwnEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, dtb__88) -> ((fun keep -> (if keep then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, (((v_Vuna_dCompiler_dDriver_dCompile_dfilterOwnEntries mc0) mc1) dtb__88))) else (((v_Vuna_dCompiler_dDriver_dCompile_dfilterOwnEntries mc0) mc1) dtb__88))) (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__87)) mc0) then (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__89) -> ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__87) <> dtb__89)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
) else false))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dentryHashOfEntries = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__90) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeSourceOfEntry dtb__90)))) else ((v_Vuna_dCompiler_dDriver_dCompile_dentryHashOfEntries dtb__91) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnEntrySourceHash = (fun tool name -> (match (match tool with
  | C_Vuna_dCompiler_dDriver_dCompile_dToolContext_Vuna_dCompiler_dDriver_dCompile_dToolContext (dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> dtb__94
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> ((v_Vuna_dCompiler_dDriver_dCompile_dentryHashOfEntries (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__98)) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolCompilerFingerprint = v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheHit = (fun path -> (match ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dreadFramed v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheTag) path) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__99) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested = ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_ELAB_FULL")) = "1")

let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__100) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__100))) else ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf dtb__101) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__102, dtb__103) -> (match dtb__102 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__104, dtb__105) -> (if (dtb__105 = (0 - 1)) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__103) else (match ((Base_dList.v_Base_dList_dlookupPair dtb__104) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__106) -> (if (dtb__106 = dtb__105) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__103) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf mc1) dtb__104) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107) -> (if (dtb__107 = dtb__105) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__103) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> (if (if (if ((v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh mc0) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__108)) then (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__108)) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc1) mc3) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__108)) else false) then ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo mc0) mc1) dtb__109) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__108, mc3))) else ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo mc0) mc1) dtb__109) mc3))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> ((fun sameSource -> ((fun keep -> (if keep then ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo mc0) mc1) dtb__111) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__110, mc3))) else ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo mc0) mc1) dtb__111) mc3))) (if (if sameSource then (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__110)) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc1) mc3) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__110)) else false))) (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__110)) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__112) -> ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf dtb__112) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__110)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc3), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceSchema

let v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag = (String.concat "" [Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "/"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint)])

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceOf = (fun dep -> (match ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceDirOf dep)) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__113) -> (if (if (if ((match dtb__113 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__114, dtb__115, dtb__116, dtb__117) -> dtb__114
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag) then ((match dtb__113 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__119
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) else false) then ((match dtb__113 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__122, dtb__123, dtb__124, dtb__125) -> dtb__124
  | _ -> failwith "DT: impossible branch"
) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dep)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__113)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceOf dtb__126) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-dep-miss " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__126))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__128) -> (if (((v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceSourcesValid mc0) dtb__126) dtb__128) then ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesGo mc0) dtb__127) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((match dtb__128 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__129, dtb__130, dtb__131, dtb__132) -> dtb__132
  | _ -> failwith "DT: impossible branch"
), mc2)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-dep-ok " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__126)))) else ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-dep-invalid " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__126)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((fun all -> (if (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceChainValid all) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (all)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) (Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf = (fun ctx -> (match (match ctx with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> dtb__134
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesGo (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Base_dList_dNil) (match dtb__138 with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__139, dtb__140, dtb__141) -> dtb__140
  | _ -> failwith "DT: impossible branch"
)))) Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForCheck = (fun ctx -> (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolManifestsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__142, dtb__143) -> ((fun dir -> (match ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadManifest dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-tool-manifest-miss " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__142))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> (if (if (if (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf dtb__144) = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf dtb__144) = v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) else false) then ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf dtb__144) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__142)) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dmanifestSourcesValid mc0) dtb__142) dtb__144) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dtoolManifestsGo mc0) dtb__143) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dir, dtb__144)), mc2))) else ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-tool-manifest-invalid " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__142)))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceDirOf dtb__142))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolDepManifests = (fun ctx -> (match (match ctx with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> dtb__146
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolManifestsGo (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Base_dList_dNil) (match dtb__150 with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__151, dtb__152, dtb__153) -> dtb__152
  | _ -> failwith "DT: impossible branch"
)))) Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfacesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> (if ((Base_dList.v_Base_dList_dmemName (Base_dPair.v_Base_dPair_dfirstOf dtb__154)) mc1) then ((fun d -> ((fun dir -> ((fun e -> (match (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) e) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__156) -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfacesGo dtb__155) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__156, mc2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dsecondOf d))) (Base_dPair.v_Base_dPair_dfirstOf d))) (Base_dPair.v_Base_dPair_dsecondOf dtb__154)) else (((v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfacesGo dtb__155) mc1) mc2))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfaces = (fun table needed -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfacesGo table) needed) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForTool = (fun ctx -> (if v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled then (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dDriver_dCompile_dhashTableOf = (fun dep -> (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceOf dep) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m), (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m))))) (match dtb__157 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__158, dtb__159, dtb__160, dtb__161) -> dtb__161
  | _ -> failwith "DT: impossible branch"
))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable = (fun ctx -> (match (match ctx with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> dtb__163
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__167) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_dhashTableOf) (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Base_dList_dNil) (match dtb__167 with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__168, dtb__169, dtb__170) -> dtb__169
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf = (fun ctx -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/iface-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))]))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnManifest = (fun ctx -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx) = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadManifest (v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx)) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171) -> (if (if (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf dtb__171) = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf dtb__171) = v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) else false) then ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf dtb__171) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnEntries = (fun ctx mf -> ((Base_dList.v_Base_dList_dmap (fun e -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry e), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx), e)))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf mf)))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource = (fun ctx label source -> (if v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled then (match (v_Vuna_dCompiler_dDriver_dCompile_dtoolDepManifests ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__172) -> (match (v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnManifest ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> ((fun ownNames -> ((fun table -> ((fun needed -> ((fun depNeeded -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfaces (v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable dtb__172)) depNeeded) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__174) -> (if (v_Vuna_dCompiler_dDriver_dCompile_dtoolChainValid dtb__174) then ((fun _u -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__174))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-tool-lazy modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__174))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dfilter (fun n -> (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) ((Base_dList.v_Base_dList_dmemName n) ownNames)) false))) needed))) ((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosure table) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource ctx) label) source)))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable dtb__172)) ((v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnEntries ctx) dtb__173)))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__173)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolProgram = (fun ctx program -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource ctx) "<repl>") program))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolContextTable = (fun ctx tool -> ((fun ownTable -> ((Base_dList.v_Base_dList_dappend (match tool with
  | C_Vuna_dCompiler_dDriver_dCompile_dToolContext_Vuna_dCompiler_dDriver_dCompile_dToolContext (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180) -> dtb__180
  | _ -> failwith "DT: impossible branch"
)) ownTable)) (match (match tool with
  | C_Vuna_dCompiler_dDriver_dCompile_dToolContext_Vuna_dCompiler_dDriver_dCompile_dToolContext (dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186) -> dtb__183
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__187) -> ((v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnEntries ctx) dtb__187)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolNeededOfImports = (fun ctx tool currentName imports -> ((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosure ((v_Vuna_dCompiler_dDriver_dCompile_dtoolContextTable ctx) tool)) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf ctx) currentName) imports)))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSourceDetailed = (fun ctx label source -> (if v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled then (match (v_Vuna_dCompiler_dDriver_dCompile_dtoolDepManifests ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__188) -> (match (v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnManifest ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__189) -> ((fun ownNames -> ((fun table -> ((fun needed -> ((fun depNeeded -> ((fun stats -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfaces (v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable dtb__188)) depNeeded) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__190) -> (if (v_Vuna_dCompiler_dDriver_dCompile_dtoolChainValid dtb__190) then ((fun _u -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dDriver_dCompile_dToolContext_Vuna_dCompiler_dDriver_dCompile_dToolContext (dtb__190, (v_Vuna_dCompiler_dDriver_dCompile_dmanifestHashTable dtb__188), (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__189)), needed, stats, (v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable dtb__188)))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-tool-lazy modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__190))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_dstatsOfManifest) dtb__188)) (v_Vuna_dCompiler_dDriver_dCompile_dstatsOfManifest (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx), dtb__189)))))) ((Base_dList.v_Base_dList_dfilter (fun n -> (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) ((Base_dList.v_Base_dList_dmemName n) ownNames)) false))) needed))) ((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosure table) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource ctx) label) source)))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable dtb__188)) ((v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnEntries ctx) dtb__189)))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__189)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanOwnModules = (fun ctx tool builtSec exclude needed -> (match (match tool with
  | C_Vuna_dCompiler_dDriver_dCompile_dToolContext_Vuna_dCompiler_dDriver_dCompile_dToolContext (dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196) -> dtb__193
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__197) -> ((fun entries -> ((fun cands -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo builtSec) (match tool with
  | C_Vuna_dCompiler_dDriver_dCompile_dToolContext_Vuna_dCompiler_dDriver_dCompile_dToolContext (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> dtb__199
  | _ -> failwith "DT: impossible branch"
)) cands) Base_dList.C_Base_dList_dList_Base_dList_dNil)) ((Base_dList.v_Base_dList_dmapMaybe ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile (v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx)) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag)) entries))) (((v_Vuna_dCompiler_dDriver_dCompile_dfilterOwnEntries needed) exclude) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__197)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIface = (fun ctx tool clean checked name si -> ((fun dir -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfModule (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) si) (match tool with
  | C_Vuna_dCompiler_dDriver_dCompile_dToolContext_Vuna_dCompiler_dDriver_dCompile_dToolContext (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> dtb__205
  | _ -> failwith "DT: impossible branch"
)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__210, dtb__211, dtb__212, dtb__213) -> dtb__213
  | _ -> failwith "DT: impossible branch"
)) clean) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__214, dtb__215, dtb__216, dtb__217) -> dtb__215
  | _ -> failwith "DT: impossible branch"
)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__218, dtb__219, dtb__220, dtb__221) -> dtb__220
  | _ -> failwith "DT: impossible branch"
)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__222, dtb__223, dtb__224, dtb__225) -> dtb__222
  | _ -> failwith "DT: impossible branch"
)) name)) (fun mi -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mi))) ((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dwriteModuleIfaceMerge dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) mi))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath dir))) (v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx)))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolHasOwnManifest = (fun ctx -> (match (v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnManifest ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__226) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos = (fun ctx -> ((Base_dList.v_Base_dList_dconcatMap (fun root -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p), (Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_Vuna_dCompiler_dDriver_dIface_dSourceInfo (p, (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) p))), (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) p)), (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) p)))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root))))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))))

let v_Vuna_dCompiler_dDriver_dCompile_downCleanModules = (fun ctx depTbl -> (match ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface (v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx)) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__227) -> (if (if (if ((match dtb__227 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__228, dtb__229, dtb__230, dtb__231) -> dtb__228
  | _ -> failwith "DT: impossible branch"
) <> v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag) then true else ((match dtb__227 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__232, dtb__233, dtb__234, dtb__235) -> dtb__233
  | _ -> failwith "DT: impossible branch"
) <> v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag)) then true else ((match dtb__227 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__236, dtb__237, dtb__238, dtb__239) -> dtb__238
  | _ -> failwith "DT: impossible branch"
) <> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun clean -> (if ((Base_dList.v_Base_dList_dlength clean) = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (clean)))) (Base_dPair.v_Base_dPair_dfirstOf ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo (v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos ctx)) depTbl) (match dtb__227 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__240, dtb__241, dtb__242, dtb__243) -> dtb__243
  | _ -> failwith "DT: impossible branch"
)) Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty = (fun ctx -> (match ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__244) -> dtb__244
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIfaceCold = (fun ctx checked name si -> ((fun dir -> ((fun _u -> ((fun clean -> ((Base_dResult.v_Base_dResult_dandThen (((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfModule (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) si) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__245, dtb__246, dtb__247, dtb__248) -> dtb__248
  | _ -> failwith "DT: impossible branch"
)) clean) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__249, dtb__250, dtb__251, dtb__252) -> dtb__250
  | _ -> failwith "DT: impossible branch"
)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__253, dtb__254, dtb__255, dtb__256) -> dtb__255
  | _ -> failwith "DT: impossible branch"
)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__257, dtb__258, dtb__259, dtb__260) -> dtb__257
  | _ -> failwith "DT: impossible branch"
)) name)) (fun mi -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mi))) ((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dwriteModuleIfaceMerge dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) mi))))) (v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty ctx))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath dir))) (v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx)))

let v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested = ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_IFACE_SELFTEST")) = "1")

let rec v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__261, dtb__262) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__261) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__261))) else ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName dtb__262) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__263, dtb__264) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName mc1) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__263)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__265) -> (if (dtb__265 = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__263)) then ((v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes dtb__264) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTest = (fun dir modules -> (match ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: written iface cannot be read back"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__266) -> (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpackageIfaceValid dtb__266)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: package iface invalid")) else (if ((match dtb__266 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__267, dtb__268, dtb__269, dtb__270) -> dtb__268
  | _ -> failwith "DT: impossible branch"
) <> v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: compiler tag mismatch")) else (if ((match dtb__266 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__271, dtb__272, dtb__273, dtb__274) -> dtb__271
  | _ -> failwith "DT: impossible branch"
) <> v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: schema mismatch")) else (if ((Base_dList.v_Base_dList_dlength (match dtb__266 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__275, dtb__276, dtb__277, dtb__278) -> dtb__278
  | _ -> failwith "DT: impossible branch"
)) <> (Base_dList.v_Base_dList_dlength modules)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: module count mismatch")) else (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf (match dtb__266 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__279, dtb__280, dtb__281, dtb__282) -> dtb__282
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf modules))) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: module name set mismatch")) else (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes (match dtb__266 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__283, dtb__284, dtb__285, dtb__286) -> dtb__286
  | _ -> failwith "DT: impossible branch"
)) modules)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: iface hash mismatch")) else ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-selftest=ok modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength modules)))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceNow = (fun ctx modules -> (if ((Base_dList.v_Base_dList_dlength modules) = 0) then ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote "iface-skip empty-package")) else ((fun dir -> ((fun _u -> ((fun _u -> ((fun n -> ((fun _u -> ((fun _u -> (if v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested then ((v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTest dir) modules) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (n)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "iface-write-done"))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["iface-write="; (bi_strFromInt n); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength modules))])))) ((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dwritePackageIface dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_removeFile dtio_0) (dir ^ "/iface.pkg"))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath dir))) (v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx))))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow = (fun ctx checked -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx) = "") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)) else ((fun _u -> (match ((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos ctx)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__287, dtb__288, dtb__289, dtb__290) -> dtb__290
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty ctx)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__291, dtb__292, dtb__293, dtb__294) -> dtb__292
  | _ -> failwith "DT: impossible branch"
)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__295, dtb__296, dtb__297, dtb__298) -> dtb__297
  | _ -> failwith "DT: impossible branch"
)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__299, dtb__300, dtb__301, dtb__302) -> dtb__299
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__303) -> (if v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__303)) else ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-skip " ^ dtb__303))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__304) -> ((fun _u -> ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceNow ctx) dtb__304)) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "iface-compute-done"))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "iface-shadow-start"))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache = (fun ctx path checked -> ((Base_dResult.v_Base_dResult_dandThen checked) (fun r -> ((fun _u -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow ctx) (Base_dPair.v_Base_dPair_dsecondOf r))) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.v_Base_dPair_dfirstOf r)))))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dframeEncode v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheTag) (dtp_marshal (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram (match (Base_dPair.v_Base_dPair_dsecondOf r) with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__305, dtb__306, dtb__307, dtb__308) -> dtb__305
  | _ -> failwith "DT: impossible branch"
)))))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir ctx))))))

let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe = (fun ctx entry path -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts ctx) entry))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote "cache-path=full")))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe = (fun ctx entry path -> (if v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested then (((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe ctx) entry) path) else (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe ctx) entry) path)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__309) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__310) -> ((fun _u -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageIncrementalParts ctx) entry) dtb__309) dtb__310))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__310)))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithIfacesParts ctx) entry) dtb__309))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe = (fun ctx entry -> ((fun key -> ((fun path -> (if (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheHit path) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe ctx) entry) path))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath ctx) key))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyExe ctx) entry)))

let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib = (fun ctx names path -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts ctx) names))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote "cache-path=full")))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib = (fun ctx names path -> (if v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested then (((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib ctx) names) path) else (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib ctx) names) path)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__311) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__312) -> ((fun _u -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageIncrementalParts ctx) names) dtb__311) dtb__312))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__312)))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageWithIfacesParts ctx) names) dtb__311))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib = (fun ctx names -> ((fun key -> ((fun path -> (if (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheHit path) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib ctx) names) path))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath ctx) key))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyLib ctx) names)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage = (fun pkg -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) then ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) else (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["check: library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); " has no app/Main.vuna (executable) and no [export].modules (library)"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__313) -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) dtb__313)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheSchema = "vuna-split-cache 3"

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheTag = (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheSchema; "/"; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion])

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir = (fun ctx -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))); "/split"]))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCachePath = (fun ctx key -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir ctx); "/"; key]))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheKey = (fun ctx entry printResult -> ((fun srcHash -> ((fun depsHash -> ((fun verHash -> ((fun prHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (verHash + prHash))])) (if printResult then 1 else 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) 0)))

let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitCache = (fun path -> (match ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dreadFramed v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheTag) path) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__314) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((dtp_unmarshal dtb__314)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitCache = (fun ctx path files -> ((fun _u -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dframeEncode v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheTag) (dtp_marshal files))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir ctx))))

let v_Vuna_dCompiler_dDriver_dCompile_dfinishBuild = (fun ctx outDir cachePath files checked -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled ctx) outDir) files)) (fun n -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow ctx) checked)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (n))))) (((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitCache ctx) cachePath) files)))))

let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir = (fun ctx entry printResult outDir -> ((fun key -> ((fun path -> ((fun _u -> (match (v_Vuna_dCompiler_dDriver_dCompile_dreadSplitCache path) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__315) -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled ctx) outDir) dtb__315)) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "split-cache-hit"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__316) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__317) -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectIncremental ctx) entry) printResult) dtb__316) dtb__317)) (fun p -> (((((v_Vuna_dCompiler_dDriver_dCompile_dfinishBuild ctx) outDir) path) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__317)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectWithIfaces ctx) entry) printResult) dtb__316)) (fun p -> (((((v_Vuna_dCompiler_dDriver_dCompile_dfinishBuild ctx) outDir) path) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts ctx) entry) printResult)) (fun p -> (((((v_Vuna_dCompiler_dDriver_dCompile_dfinishBuild ctx) outDir) path) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "split-cache-key-done"))) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitCachePath ctx) key))) (((v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheKey ctx) entry) printResult)))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun dir outDir -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) true) outDir))))
