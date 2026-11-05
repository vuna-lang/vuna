open Vuna_runtime
let rec v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (dtb__0 = 47) then dtb__1 else (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash dtb__1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

let rec v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then 0 else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then 0 else (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then 0 else ((fun _u -> (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_makeDir dtio_0) path))) ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel (fuel - 1)) (v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath path)))))))

let v_Vuna_dCompiler_dDriver_dCompile_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel 256) path))

let v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles = (fun ctxDir outDir -> ((fun ffiDir -> ((fun exists -> (if exists then ((fun cs -> ((fun _u -> ((fun _u -> ((Base_dList.v_Base_dList_dmap (fun n -> ("ffi/" ^ n))) cs)) ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFile dtio_0 dtio_1) (String.concat "" [outDir; "/ffi/"; n])) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) (String.concat "" [ffiDir; "/"; n]))))))) cs))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/ffi")))) ((Base_dList.v_Base_dList_dfilter (fun n -> ((Base_dString.v_Base_dString_dendsWith ".c") n))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0) ffiDir)))) else Base_dList.C_Base_dList_dList_Base_dList_dNil)) (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) ffiDir)) then (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) ffiDir)) else false))) (ctxDir ^ "/ffi")))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled = (fun ctx outDir files -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged outDir) files)) (fun n -> ((fun graph -> ((fun cFiles -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (n))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFile dtio_0 dtio_1) (outDir ^ "/build.sh")) ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dbuildScript graph) cFiles))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx)) outDir))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo files)))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath outDir)))

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

let v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath = ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_CACHE_MTIME")) = "1")

let v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged = (fun path si -> (if v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath then (if (if ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) path)) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si)) then ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) path)) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf si)) else false) then true else ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si))) else ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si))))

let rec v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__34)) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged dtb__36) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__34)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid dtb__35) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceSourcesValid = (fun roots p pi -> ((fun pkgRoots -> ((fun walked -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) walked)) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf (match pi with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__37, dtb__38, dtb__39, dtb__40) -> dtb__40
  | _ -> failwith "DT: impossible branch"
))) then ((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid (match pi with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__41, dtb__42, dtb__43, dtb__44) -> dtb__44
  | _ -> failwith "DT: impossible branch"
)) walked) else false)) (v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots pkgRoots))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p)))) roots)))

let rec v_Vuna_dCompiler_dDriver_dCompile_ddepHashListOk = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__45, dtb__46) -> (match dtb__45 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__47, dtb__48) -> (match ((Base_dList.v_Base_dList_dlookupPair dtb__47) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__49) -> (if (dtb__49 = dtb__48) then ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashListOk mc0) dtb__46) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_ddepHashesAllOk = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (if ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashListOk mc0) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__50)) then ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashesAllOk mc0) dtb__51) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceChainValid = (fun ifaces -> ((fun tbl -> ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashesAllOk tbl) ifaces)) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m), (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m))))) ifaces)))

let rec v_Vuna_dCompiler_dDriver_dCompile_dallEntriesValid = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__52, dtb__53) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry dtb__52)) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__54) -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged dtb__54) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeSourceOfEntry dtb__52)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallEntriesValid dtb__53) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dmanifestSourcesValid = (fun roots p mf -> ((fun pkgRoots -> ((fun walked -> ((fun entries -> (if ((v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) walked)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry) entries)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallEntriesValid entries) walked) else false)) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf mf))) (v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots pkgRoots))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p)))) roots)))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (match dtb__55 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry e), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, e)))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf dtb__58))) (v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable dtb__56))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolFindEntry = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__59, dtb__60) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__59) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__59)) else ((v_Vuna_dCompiler_dDriver_dCompile_dtoolFindEntry dtb__60) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (if (mc0 <= 0) then mc2 else (if ((Base_dList.v_Base_dList_dmemName dtb__61) mc2) then ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo mc0) mc1) mc2) dtb__62) else (match ((v_Vuna_dCompiler_dDriver_dCompile_dtoolFindEntry mc1) dtb__61) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo (mc0 - 1)) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__61, mc2))) dtb__62)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__63) -> ((fun e -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo (mc0 - 1)) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__61, mc2))) ((Base_dList.v_Base_dList_dappend dtb__62) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeImportsOfEntry e)) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmeDepsOfEntry e)))))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__63)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolClosure = (fun table starts -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo 8192) table) Base_dList.C_Base_dList_dList_Base_dList_dNil) starts))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolChainValid = (fun ifaces -> ((fun tbl -> ((v_Vuna_dCompiler_dDriver_dCompile_ddepHashesAllOk tbl) ifaces)) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m), (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m))))) ifaces)))

let v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__64, dtb__65, dtb__66, dtb__67) -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf = (fun ctx current imports -> (match ((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) current) imports) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__68) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) imports)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__69) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) ((Base_dList.v_Base_dList_dappend imports) dtb__69))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource = (fun ctx label source -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__70) -> (match dtb__70 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSourceFile (dtb__71, dtb__72, dtb__73, dtb__74) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf ctx) "") dtb__72)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__75) -> (match dtb__75 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__76, dtb__77, dtb__78, dtb__79) -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf ctx) dtb__76) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__71)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__80) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)))

let v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested = ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_ELAB_FULL")) = "1")

let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__81) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__81))) else ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf dtb__82) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84) -> (match dtb__83 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__85, dtb__86) -> (if (dtb__86 = (0 - 1)) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__84) else (match ((Base_dList.v_Base_dList_dlookupPair dtb__85) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__87) -> (if (dtb__87 = dtb__86) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__84) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf mc1) dtb__85) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__88) -> (if (dtb__88 = dtb__86) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__84) else false)
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

let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> ((fun sameSource -> ((fun keep -> (if keep then ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo mc0) mc1) dtb__90) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__89, mc3))) else ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo mc0) mc1) dtb__90) mc3))) (if (if sameSource then (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__89)) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc1) mc3) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__89)) else false))) (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__89)) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91) -> ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf dtb__91) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__89)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc3), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceSchema

let v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag = (String.concat "" [Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "/"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint)])

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceOf = (fun dep -> (match ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceDirOf dep)) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (if (if (if ((match dtb__92 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__93, dtb__94, dtb__95, dtb__96) -> dtb__93
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag) then ((match dtb__92 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__97, dtb__98, dtb__99, dtb__100) -> dtb__98
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) else false) then ((match dtb__92 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__101, dtb__102, dtb__103, dtb__104) -> dtb__103
  | _ -> failwith "DT: impossible branch"
) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dep)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceOf dtb__105) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-dep-miss " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__105))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107) -> (if (((v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceSourcesValid mc0) dtb__105) dtb__107) then ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesGo mc0) dtb__106) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((match dtb__107 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__108, dtb__109, dtb__110, dtb__111) -> dtb__111
  | _ -> failwith "DT: impossible branch"
), mc2)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-dep-ok " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__105)))) else ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-dep-invalid " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__105)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((fun all -> (if (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceChainValid all) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (all)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) (Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf = (fun ctx -> (match (match ctx with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> dtb__113
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__117) -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesGo (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Base_dList_dNil) (match dtb__117 with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__118, dtb__119, dtb__120) -> dtb__119
  | _ -> failwith "DT: impossible branch"
)))) Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForCheck = (fun ctx -> (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolManifestsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> ((fun dir -> (match ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadManifest dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-tool-manifest-miss " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__121))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123) -> (if (if (if (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf dtb__123) = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceSchema) then ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf dtb__123) = v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) else false) then ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf dtb__123) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__121)) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dmanifestSourcesValid mc0) dtb__121) dtb__123) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dtoolManifestsGo mc0) dtb__122) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dir, dtb__123)), mc2))) else ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-tool-manifest-invalid " ^ (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__121)))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceDirOf dtb__121))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolDepManifests = (fun ctx -> (match (match ctx with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> dtb__125
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129) -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolManifestsGo (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Base_dList_dNil) (match dtb__129 with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__130, dtb__131, dtb__132) -> dtb__131
  | _ -> failwith "DT: impossible branch"
)))) Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfacesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (if ((Base_dList.v_Base_dList_dmemName (Base_dPair.v_Base_dPair_dfirstOf dtb__133)) mc1) then ((fun d -> ((fun dir -> ((fun e -> (match (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) e) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__135) -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfacesGo dtb__134) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__135, mc2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dsecondOf d))) (Base_dPair.v_Base_dPair_dfirstOf d))) (Base_dPair.v_Base_dPair_dsecondOf dtb__133)) else (((v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfacesGo dtb__134) mc1) mc2))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfaces = (fun table needed -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfacesGo table) needed) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource = (fun ctx label source -> (if ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_IFACE_TOOL")) = "1") then (match (v_Vuna_dCompiler_dDriver_dCompile_dtoolDepManifests ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__136) -> ((fun table -> ((fun needed -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfaces table) needed) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (if (v_Vuna_dCompiler_dDriver_dCompile_dtoolChainValid dtb__137) then ((fun _u -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-tool-lazy modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__137))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dCompile_dtoolClosure table) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource ctx) label) source)))) (v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable dtb__136))
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolProgram = (fun ctx program -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource ctx) "<repl>") program))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForTool = (fun ctx -> (if ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_IFACE_TOOL")) = "1") then (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dDriver_dCompile_dhashTableOf = (fun dep -> (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceOf dep) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m), (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m))))) (match dtb__138 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__139, dtb__140, dtb__141, dtb__142) -> dtb__142
  | _ -> failwith "DT: impossible branch"
))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable = (fun ctx -> (match (match ctx with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackageContext_Vuna_dCompiler_dPackages_dPkg_dPackageContext (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> dtb__144
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_dhashTableOf) (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Base_dList_dNil) (match dtb__148 with
  | Vuna_dCompiler_dPackages_dPkg.C_Vuna_dCompiler_dPackages_dPkg_dPackage_Vuna_dCompiler_dPackages_dPkg_dPackage (dtb__149, dtb__150, dtb__151) -> dtb__150
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf = (fun ctx -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/iface-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))]))

let v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos = (fun ctx -> ((Base_dList.v_Base_dList_dconcatMap (fun root -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p), (Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dSourceInfo_Vuna_dCompiler_dDriver_dIface_dSourceInfo (p, (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) p))), (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) p)), (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) p)))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root))))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))))

let v_Vuna_dCompiler_dDriver_dCompile_downCleanModules = (fun ctx depTbl -> (match ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface (v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx)) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152) -> (if (if (if ((match dtb__152 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__153, dtb__154, dtb__155, dtb__156) -> dtb__153
  | _ -> failwith "DT: impossible branch"
) <> v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag) then true else ((match dtb__152 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__157, dtb__158, dtb__159, dtb__160) -> dtb__158
  | _ -> failwith "DT: impossible branch"
) <> v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag)) then true else ((match dtb__152 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__161, dtb__162, dtb__163, dtb__164) -> dtb__163
  | _ -> failwith "DT: impossible branch"
) <> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun clean -> (if ((Base_dList.v_Base_dList_dlength clean) = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (clean)))) (Base_dPair.v_Base_dPair_dfirstOf ((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo (v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos ctx)) depTbl) (match dtb__152 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__165, dtb__166, dtb__167, dtb__168) -> dtb__168
  | _ -> failwith "DT: impossible branch"
)) Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty = (fun ctx -> (match ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__169) -> dtb__169
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested = ((Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "VUNA_IFACE_SELFTEST")) = "1")

let rec v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__170, dtb__171) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__170) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__170))) else ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName dtb__171) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__172, dtb__173) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName mc1) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__172)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__174) -> (if (dtb__174 = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__172)) then ((v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes dtb__173) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTest = (fun dir modules -> (match ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: written iface cannot be read back"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__175) -> (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpackageIfaceValid dtb__175)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: package iface invalid")) else (if ((match dtb__175 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__176, dtb__177, dtb__178, dtb__179) -> dtb__177
  | _ -> failwith "DT: impossible branch"
) <> v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: compiler tag mismatch")) else (if ((match dtb__175 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__180, dtb__181, dtb__182, dtb__183) -> dtb__180
  | _ -> failwith "DT: impossible branch"
) <> v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: schema mismatch")) else (if ((Base_dList.v_Base_dList_dlength (match dtb__175 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__184, dtb__185, dtb__186, dtb__187) -> dtb__187
  | _ -> failwith "DT: impossible branch"
)) <> (Base_dList.v_Base_dList_dlength modules)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: module count mismatch")) else (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf (match dtb__175 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__188, dtb__189, dtb__190, dtb__191) -> dtb__191
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf modules))) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: module name set mismatch")) else (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes (match dtb__175 with
  | Vuna_dCompiler_dDriver_dIface.C_Vuna_dCompiler_dDriver_dIface_dPackageIface_Vuna_dCompiler_dDriver_dIface_dPackageIface (dtb__192, dtb__193, dtb__194, dtb__195) -> dtb__195
  | _ -> failwith "DT: impossible branch"
)) modules)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("iface selftest: iface hash mismatch")) else ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-selftest=ok modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength modules)))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceNow = (fun ctx modules -> (if ((Base_dList.v_Base_dList_dlength modules) = 0) then ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote "iface-skip empty-package")) else ((fun dir -> ((fun _u -> ((fun _u -> ((fun n -> ((fun _u -> (if v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested then ((v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTest dir) modules) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (n)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["iface-write="; (bi_strFromInt n); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength modules))])))) ((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dwritePackageIface dir) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules))) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_removeFile dtio_0) (dir ^ "/iface.pkg"))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath dir))) (v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf ctx))))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow = (fun ctx checked -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx) = "") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)) else (match ((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos ctx)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__196, dtb__197, dtb__198, dtb__199) -> dtb__199
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty ctx)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__200, dtb__201, dtb__202, dtb__203) -> dtb__201
  | _ -> failwith "DT: impossible branch"
)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__204, dtb__205, dtb__206, dtb__207) -> dtb__206
  | _ -> failwith "DT: impossible branch"
)) (match checked with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__208, dtb__209, dtb__210, dtb__211) -> dtb__208
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__212) -> (if v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__212)) else ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("iface-skip " ^ dtb__212))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__213) -> ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceNow ctx) dtb__213)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache = (fun ctx path checked -> ((Base_dResult.v_Base_dResult_dandThen checked) (fun r -> ((fun _u -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow ctx) (Base_dPair.v_Base_dPair_dsecondOf r))) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.v_Base_dPair_dfirstOf r)))))) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) (dtp_marshal (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram (match (Base_dPair.v_Base_dPair_dsecondOf r) with
  | Vuna_dCompiler_dDriver_dDt.C_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_Vuna_dCompiler_dDriver_dDt_dCheckedPackage (dtb__214, dtb__215, dtb__216, dtb__217) -> dtb__214
  | _ -> failwith "DT: impossible branch"
))))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir ctx))))))

let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe = (fun ctx entry path -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts ctx) entry))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote "cache-path=full")))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe = (fun ctx entry path -> (if v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested then (((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe ctx) entry) path) else (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe ctx) entry) path)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__218) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__219) -> ((fun _u -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageIncrementalParts ctx) entry) dtb__218) dtb__219))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__219)))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithIfacesParts ctx) entry) dtb__218))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe = (fun ctx entry -> ((fun key -> ((fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe ctx) entry) path))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath ctx) key))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyExe ctx) entry)))

let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib = (fun ctx names path -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts ctx) names))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote "cache-path=full")))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib = (fun ctx names path -> (if v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested then (((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib ctx) names) path) else (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib ctx) names) path)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__220) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__221) -> ((fun _u -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageIncrementalParts ctx) names) dtb__220) dtb__221))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__221)))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun _u -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) path) (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageWithIfacesParts ctx) names) dtb__220))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib = (fun ctx names -> ((fun key -> ((fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib ctx) names) path))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath ctx) key))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyLib ctx) names)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage = (fun pkg -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) then ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) else (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["check: library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); " has no app/Main.vuna (executable) and no [export].modules (library)"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__222) -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) dtb__222)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheSchema = "vuna-split-cache 3"

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir = (fun ctx -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))); "/split"]))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCachePath = (fun ctx key -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir ctx); "/"; key]))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheKey = (fun ctx entry printResult -> ((fun srcHash -> ((fun depsHash -> ((fun verHash -> ((fun prHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (verHash + prHash))])) (if printResult then 1 else 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) 0)))

let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitCache = (fun path -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((dtp_unmarshal (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitCache = (fun ctx path files -> ((fun _u -> (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) path) (dtp_marshal files)))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir ctx))))

let v_Vuna_dCompiler_dDriver_dCompile_dfinishBuild = (fun ctx outDir cachePath files checked -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled ctx) outDir) files)) (fun n -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow ctx) checked)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (n))))) (((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitCache ctx) cachePath) files)))))

let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir = (fun ctx entry printResult outDir -> ((fun key -> ((fun path -> (match (v_Vuna_dCompiler_dDriver_dCompile_dreadSplitCache path) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__223) -> (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled ctx) outDir) dtb__223)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__224) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__225) -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectIncremental ctx) entry) printResult) dtb__224) dtb__225)) (fun p -> (((((v_Vuna_dCompiler_dDriver_dCompile_dfinishBuild ctx) outDir) path) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__225)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectWithIfaces ctx) entry) printResult) dtb__224)) (fun p -> (((((v_Vuna_dCompiler_dDriver_dCompile_dfinishBuild ctx) outDir) path) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts ctx) entry) printResult)) (fun p -> (((((v_Vuna_dCompiler_dDriver_dCompile_dfinishBuild ctx) outDir) path) (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitCachePath ctx) key))) (((v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheKey ctx) entry) printResult)))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun dir outDir -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) true) outDir))))
