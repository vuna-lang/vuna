open Vuna_runtime
let rec v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (dtb__0 = 47) then dtb__1 else (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash dtb__1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

let rec v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then 0 else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then 0 else (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then 0 else ((fun _u -> (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_makeDir dtio_0)) path))) ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel (fuel - 1)) (v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath path)))))))

let v_Vuna_dCompiler_dDriver_dCompile_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel 256) path))

let v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles = (fun ctxDir outDir -> ((fun ffiDir -> ((fun exists -> (if exists then ((fun cs -> ((fun _u -> ((fun _u -> ((Base_dList.v_Base_dList_dmap (fun n -> ("ffi/" ^ n))) cs)) ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) (String.concat "" [outDir; "/ffi/"; n])) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) (String.concat "" [ffiDir; "/"; n]))))))) cs))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/ffi")))) ((Base_dList.v_Base_dList_dfilter (fun n -> ((Base_dString.v_Base_dString_dendsWith ".c") n))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) ffiDir)))) else Base_dList.C_Base_dList_dList_Base_dList_dNil)) (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) ffiDir)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) ffiDir)) else false))) (ctxDir ^ "/ffi")))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled = (fun ctx outDir files -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged outDir) files)) (fun n -> ((fun graph -> ((fun cFiles -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (n))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) (outDir ^ "/build.sh")) ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dbuildScript graph) cFiles))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx)) outDir))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph files))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath outDir)))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema = 1

let v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName = "build-meta.json"

let v_Vuna_dCompiler_dDriver_dCompile_dtextHash = (fun s -> ((((dtp_strHash s) * 1000003) + (dtp_strHash ("m30:" ^ s))) + (bi_strLength s)))

let v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint = ((fun argv -> (match argv with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompile_dtextHash Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) dtb__2)) then (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) dtb__2))) else (v_Vuna_dCompiler_dDriver_dCompile_dtextHash Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion))
  | _ -> failwith "DT: impossible branch"
)) (Base_dIO.v_Base_dIO_drunIO (Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (Base_dList.dtp_listOf (dtp_getArgs ()))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcacheBase = ((fun tmp -> ((if (tmp = "") then "/tmp" else tmp) ^ "/vuna-cache")) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_getenv dtio_0)) "TMPDIR")))

let v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir = (fun name -> (if (if (if (if (if (if (if (if (name = ".git") then true else (name = ".local")) then true else (name = ".output")) then true else (name = ".direnv")) then true else (name = "node_modules")) then true else (name = "seed")) then true else (name = "_scratch")) then true else (name = "result")) then true else (name = "corpus")))

let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta = (fun fuel dir -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (if (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) dir)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) dir)) else false) then ((Base_dList.v_Base_dList_dconcatMap ((v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta (fuel - 1)) dir)) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dir))) else Base_dList.C_Base_dList_dList_Base_dList_dNil)))
and v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta = (fun fuel dir name -> (if (fuel <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (if (name = ".") then Base_dList.C_Base_dList_dList_Base_dList_dNil else (if (name = "..") then Base_dList.C_Base_dList_dList_Base_dList_dNil else (if (v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir name) then Base_dList.C_Base_dList_dList_Base_dList_dNil else ((fun path -> (if (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) path)) else false) then ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta (fuel - 1)) path) else (if ((Base_dString.v_Base_dString_dendsWith ".vuna") name) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (path, Base_dList.C_Base_dList_dList_Base_dList_dNil)) else Base_dList.C_Base_dList_dList_Base_dList_dNil))) (String.concat "" [dir; "/"; name])))))))

let v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta = (fun prefix s -> (if ((Base_dString.v_Base_dString_dstartsWith prefix) s) then (((Base_dString.v_Base_dString_dsubstring (Base_dString.v_Base_dString_dbyteLength prefix)) (bi_natSub (Base_dString.v_Base_dString_dbyteLength s) (Base_dString.v_Base_dString_dbyteLength prefix))) s) else s))

let v_Vuna_dCompiler_dDriver_dCompile_dslashToDot = (fun c -> (if (c = 47) then 46 else c))

let v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dslashToDot) (Base_dList.dtp_unpack s))))

let v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath = (fun rootPath path -> ((fun rel0 -> ((fun rel -> (v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots rel)) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel0) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natSub (Base_dString.v_Base_dString_dbyteLength rel0) 5)) rel0) else rel0))) ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta (rootPath ^ "/")) path)))

let v_Vuna_dCompiler_dDriver_dCompile_drootSources = (fun root -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p), (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) p))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root))))

let rec v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match dtb__4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf dtb__5) ((mc1 * 1000003) + dtb__7))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_drootHash = (fun root -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_drootSources root)) 0))

let v_Vuna_dCompiler_dDriver_dCompile_dentrySource = (fun entry -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("<entry>", (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) entry))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcontextSources = (fun ctx entry -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_drootSources) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dCompile_dentrySource entry), Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes = (fun ctx -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> ((Base_dList.v_Base_dList_dmap (fun r -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r), (v_Vuna_dCompiler_dDriver_dCompile_drootHash r))))) dtb__9)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (String.concat "" ["{\"name\":\""; dtb__10; "\",\"hash\":"; (bi_strFromInt dtb__11); "}"])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> dtb__12
  | _ -> (String.concat "" [dtb__12; ","; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList dtb__13)])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (if (dtb__14 = 47) then (Base_dList.dtp_pack mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev dtb__15) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__14, mc1))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dlastSegment = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText = (fun ctx entry linked -> ((fun sources -> ((fun deps -> ((fun manifestHash -> ((fun entryName -> ((fun linkedText -> (String.concat "" ["{\"schema\":"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema); ",\"compiler\":\""; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "\",\"package\":\""; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (bi_strFromInt ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)); ",\"manifest\":"; (bi_strFromInt manifestHash); ",\"sources\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) sources)); "],\"dependencies\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) deps)); "]}\n"])) (if linked then "true" else "false"))) (v_Vuna_dCompiler_dDriver_dCompile_dlastSegment entry))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/vuna.toml")))))) (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx))) ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf = (fun outDir -> (String.concat "" [outDir; "/"; v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName]))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta = (fun outDir ctx entry linked -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)) (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) linked))))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate = (fun outDir ctx entry binPath -> ((fun path -> (if (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) binPath)) else false) then ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path)) = (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) true)) else false)) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)))

let v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript = (fun dir out name -> ((fun code -> (if (code = 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["build: "; name; ": `sh build.sh "; out; "` failed in "; dir; " (exit "; (bi_strFromInt code); ")"]))))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dir) (Base_dList.C_Base_dList_dList_Base_dList_dCons ("sh", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("build.sh", (Base_dList.C_Base_dList_dList_Base_dList_dCons (out, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema = "vuna-check-cache 4"

let v_Vuna_dCompiler_dDriver_dCompile_dhashText = (fun n -> (bi_strFromInt (n - ((if 1000000007 = 0 then failwith "division by zero" else n / 1000000007) * 1000000007))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir = (fun ctx -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))); "/check"]))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath = (fun ctx key -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir ctx); "/"; key]))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyExe = (fun ctx entry -> ((fun srcHash -> ((fun depsHash -> ((fun manHash -> ((fun verHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)])) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/vuna.toml")))))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) 0)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyLib = (fun ctx names -> ((fun srcHash -> ((fun depsHash -> ((fun manHash -> ((fun namesHash -> ((fun verHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText namesHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)])) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash ((Base_dString.v_Base_dString_djoin "\t") names)))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/vuna.toml")))))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_drootSources) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) 0)))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaSegment = 1073741824

let v_Vuna_dCompiler_dDriver_dCompile_dreadProgramCache = (fun dep -> ((fun dctx -> ((fun key -> ((fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((dtp_unmarshal (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath dctx) key))) (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dep))) then ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyExe dctx) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dep)) else (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports dep) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16) -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyLib dctx) dtb__16)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dep)))

let rec v_Vuna_dCompiler_dDriver_dCompile_ddepProgramsOfGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (match (v_Vuna_dCompiler_dDriver_dCompile_dreadProgramCache dtb__17) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> ((fun prog -> (if (Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtProgramHasMetas prog) then ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnoteInt "cache-dep-metas") mc0)) else ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepProgramsOfGo (mc0 + 1)) dtb__18) (Base_dList.C_Base_dList_dList_Base_dList_dCons (prog, mc2)))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnoteInt "cache-dep-ok") mc0)))) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dprogramOfCached ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram (mc0 * v_Vuna_dCompiler_dDriver_dCompile_dmetaSegment)) dtb__19)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnoteInt "cache-dep-miss") mc0))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepProgramsOf = (fun ctx -> (match (match ctx with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__21
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__25) -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepProgramsOfGo 0) (match dtb__25 with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__26, dtb__27, dtb__28) -> dtb__27
  | _ -> failwith "DT: impossible branch"
)) Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache = (fun ctx entry path checked -> ((Base_dResult.v_Base_dResult_dandThen checked) (fun r -> ((fun _u -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.v_Base_dPair_dfirstOf r)))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) path) (dtp_marshal (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram (Base_dPair.v_Base_dPair_dsecondOf r))))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir ctx))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib = (fun ctx names -> ((fun key -> ((fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgram ctx) names)) (fun r -> ((fun _u -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.v_Base_dPair_dfirstOf r)))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) path) (dtp_marshal (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram (Base_dPair.v_Base_dPair_dsecondOf r))))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir ctx))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath ctx) key))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyLib ctx) names)))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheSchema = "vuna-split-cache 2"

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir = (fun ctx -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))); "/split"]))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCachePath = (fun ctx key -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir ctx); "/"; key]))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheKey = (fun ctx entry printResult -> ((fun srcHash -> ((fun depsHash -> ((fun verHash -> ((fun prHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (verHash + prHash))])) (if printResult then 1 else 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) 0)))

let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitCache = (fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((dtp_unmarshal (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitCache = (fun ctx path files -> ((fun _u -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) path) (dtp_marshal files)))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir ctx))))

let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir = (fun ctx entry printResult outDir -> ((fun key -> ((fun path -> (match (v_Vuna_dCompiler_dDriver_dCompile_dreadSplitCache path) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29) -> (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled ctx) outDir) dtb__29)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProject ctx) entry) printResult)) (fun files -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled ctx) outDir) files)) (fun n -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (n))) (((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitCache ctx) path) files))))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitCachePath ctx) key))) (((v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheKey ctx) entry) printResult)))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun dir outDir -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) true) outDir))))

let v_Vuna_dCompiler_dDriver_dCompile_dnoteAndCheck = (fun ctx entry path -> ((fun _u -> ((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) entry) path) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgram ctx) entry))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote "cache-path-full")))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe = (fun ctx entry -> ((fun key -> ((fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (((v_Vuna_dCompiler_dDriver_dCompile_dnoteAndCheck ctx) entry) path))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath ctx) key))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyExe ctx) entry)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage = (fun pkg -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) then ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) else (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["check: library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); " has no app/Main.vuna (executable) and no [export].modules (library)"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__30) -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) dtb__30)
  | _ -> failwith "DT: impossible branch"
)))
