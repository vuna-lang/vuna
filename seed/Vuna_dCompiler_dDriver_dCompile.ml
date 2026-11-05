open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dInstName
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
open Vuna_dCompiler_dCodegen_dTerm
open Vuna_dCompiler_dCodegen_dAssembly
open Vuna_dCompiler_dDriver_dSplit
open Vuna_dCompiler_dCodegen_dSplit
open Vuna_dCompiler_dCodegen
open Vuna_dCompiler_dDriver_dDt
open Vuna_dCompiler_dDriver_dCache
open Vuna_dCompiler_dVersion
let rec v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (dtb__0 = 47) then dtb__1 else (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash dtb__1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((v_Base_dList_dlength after) = (v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((v_Base_dString_dstartsWith "/") path) then (v_Base_dBool_dnot ((v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (dtp_pack (v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash rev))) (v_Base_dList_dreverse chars))) (dtp_unpack path)))

let rec v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then 0 else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then 0 else (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then 0 else ((fun _u -> (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_makeDir dtio_0)) path))) ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel (fuel - 1)) (v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath path)))))))

let v_Vuna_dCompiler_dDriver_dCompile_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel 256) path))

let v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles = (fun ctxDir outDir -> ((fun ffiDir -> ((fun exists -> (if exists then ((fun cs -> ((fun _u -> ((fun _u -> ((v_Base_dList_dmap (fun n -> ("ffi/" ^ n))) cs)) ((v_Base_dList_dmap (fun n -> (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) (String.concat "" [outDir; "/ffi/"; n])) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) (String.concat "" [ffiDir; "/"; n]))))))) cs))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/ffi")))) ((v_Base_dList_dfilter (fun n -> ((v_Base_dString_dendsWith ".c") n))) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (fun p -> dtp_listOf (dtp_readDir p)) dtio_0)) ffiDir)))) else C_Base_dList_dList_Base_dList_dNil)) (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) ffiDir)) then (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) ffiDir)) else false))) (ctxDir ^ "/ffi")))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled = (fun ctx outDir files -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged outDir) files)) (fun n -> ((fun order -> ((fun cFiles -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (n))) (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) (outDir ^ "/build.sh")) ((v_Vuna_dCompiler_dDriver_dSplit_dbuildScript order) cFiles))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles (v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx)) outDir))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder (v_Vuna_dCompiler_dDriver_dSplit_dsplitInitFiles files)))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath outDir)))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema = 1

let v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName = "build-meta.json"

let v_Vuna_dCompiler_dDriver_dCompile_dtextHash = (fun s -> ((((dtp_strHash s) * 1000003) + (dtp_strHash ("m30:" ^ s))) + (bi_strLength s)))

let v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint = ((fun argv -> (match argv with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dCompile_dtextHash v_Vuna_dCompiler_dVersion_dvunaVersion)
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) dtb__2)) then (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) dtb__2))) else (v_Vuna_dCompiler_dDriver_dCompile_dtextHash v_Vuna_dCompiler_dVersion_dvunaVersion))
  | _ -> failwith "DT: impossible branch"
)) (v_Base_dIO_drunIO (C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (dtp_listOf (dtp_getArgs ()))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcacheBase = ((fun tmp -> ((if (tmp = "") then "/tmp" else tmp) ^ "/vuna-cache")) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_getenv dtio_0)) "TMPDIR")))

let v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir = (fun name -> (if (if (if (if (if (if (if (if (name = ".git") then true else (name = ".local")) then true else (name = ".output")) then true else (name = ".direnv")) then true else (name = "node_modules")) then true else (name = "seed")) then true else (name = "_scratch")) then true else (name = "result")) then true else (name = "corpus")))

let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta = (fun fuel dir -> (if (fuel <= 0) then C_Base_dList_dList_Base_dList_dNil else (if (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) dir)) then (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) dir)) else false) then ((v_Base_dList_dconcatMap ((v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta (fuel - 1)) dir)) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (fun p -> dtp_listOf (dtp_readDir p)) dtio_0)) dir))) else C_Base_dList_dList_Base_dList_dNil)))
and v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta = (fun fuel dir name -> (if (fuel <= 0) then C_Base_dList_dList_Base_dList_dNil else (if (name = ".") then C_Base_dList_dList_Base_dList_dNil else (if (name = "..") then C_Base_dList_dList_Base_dList_dNil else (if (v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir name) then C_Base_dList_dList_Base_dList_dNil else ((fun path -> (if (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) path)) else false) then ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta (fuel - 1)) path) else (if ((v_Base_dString_dendsWith ".vuna") name) then (C_Base_dList_dList_Base_dList_dCons (path, C_Base_dList_dList_Base_dList_dNil)) else C_Base_dList_dList_Base_dList_dNil))) (String.concat "" [dir; "/"; name])))))))

let v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta = (fun prefix s -> (if ((v_Base_dString_dstartsWith prefix) s) then (((v_Base_dString_dsubstring (bi_strLength prefix)) ((bi_strLength s) - (bi_strLength prefix))) s) else s))

let v_Vuna_dCompiler_dDriver_dCompile_dslashToDot = (fun c -> (if (c = 47) then 46 else c))

let v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots = (fun s -> (dtp_pack ((v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dslashToDot) (dtp_unpack s))))

let v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath = (fun rootPath path -> ((fun rel0 -> ((fun rel -> (v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots rel)) (if ((v_Base_dString_dendsWith ".vuna") rel0) then (((v_Base_dString_dsubstring 0) ((bi_strLength rel0) - 5)) rel0) else rel0))) ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta (rootPath ^ "/")) path)))

let v_Vuna_dCompiler_dDriver_dCompile_drootSources = (fun root -> ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p), (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) p))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (v_Vuna_dCompiler_dPackages_dPkg_drootDir root))))

let rec v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match dtb__4 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf dtb__5) ((mc1 * 1000003) + dtb__7))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_drootHash = (fun root -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_drootSources root)) 0))

let v_Vuna_dCompiler_dDriver_dCompile_dentrySource = (fun entry -> (C_Base_dPair_dPair_Base_dPair_dPair ("<entry>", (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) entry))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcontextSources = (fun ctx entry -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_drootSources) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dCompile_dentrySource entry), C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes = (fun ctx -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx) with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> ((v_Base_dList_dmap (fun r -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dPackages_dPkg_drootName r), (v_Vuna_dCompiler_dDriver_dCompile_drootHash r))))) dtb__9)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText = (fun mc0 -> (match mc0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (String.concat "" ["{\"name\":\""; dtb__10; "\",\"hash\":"; (bi_strFromInt dtb__11); "}"])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (match dtb__13 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__12
  | _ -> (String.concat "" [dtb__12; ","; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList dtb__13)])
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (if (dtb__14 = 47) then (dtp_pack mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev dtb__15) (C_Base_dList_dList_Base_dList_dCons (dtb__14, mc1))))
  | C_Base_dList_dList_Base_dList_dNil -> (dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dlastSegment = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev (v_Base_dList_dreverse (dtp_unpack path))) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText = (fun ctx entry linked -> ((fun sources -> ((fun deps -> ((fun manifestHash -> ((fun entryName -> ((fun linkedText -> (String.concat "" ["{\"schema\":"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema); ",\"compiler\":\""; v_Vuna_dCompiler_dVersion_dvunaVersion; "\",\"package\":\""; (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (bi_strFromInt ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)); ",\"manifest\":"; (bi_strFromInt manifestHash); ",\"sources\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) sources)); "],\"dependencies\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) deps)); "]}\n"])) (if linked then "true" else "false"))) (v_Vuna_dCompiler_dDriver_dCompile_dlastSegment entry))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) ((v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/vuna.toml")))))) (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx))) ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf = (fun outDir -> (String.concat "" [outDir; "/"; v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName]))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta = (fun outDir ctx entry linked -> (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)) (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) linked))))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate = (fun outDir ctx entry binPath -> ((fun path -> (if (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) binPath)) else false) then ((v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path)) = (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) true)) else false)) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)))

let v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript = (fun dir out name -> ((fun code -> (if (code = 0) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["build: "; name; ": `sh build.sh "; out; "` failed in "; dir; " (exit "; (bi_strFromInt code); ")"]))))) (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (fun dir args -> dtp_runIn dir (dtp_ocamlOf args)) dtio_0 dtio_1)) dir) (C_Base_dList_dList_Base_dList_dCons ("sh", (C_Base_dList_dList_Base_dList_dCons ("build.sh", (C_Base_dList_dList_Base_dList_dCons (out, C_Base_dList_dList_Base_dList_dNil))))))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema = "vuna-check-cache 4"

let v_Vuna_dCompiler_dDriver_dCompile_dhashText = (fun n -> (bi_strFromInt (n - ((if 1000000007 = 0 then failwith "division by zero" else n / 1000000007) * 1000000007))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir = (fun ctx -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))); "/check"]))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath = (fun ctx key -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir ctx); "/"; key]))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyExe = (fun ctx entry -> ((fun srcHash -> ((fun depsHash -> ((fun manHash -> ((fun verHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)])) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema ^ v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) ((v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/vuna.toml")))))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) 0)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyLib = (fun ctx names -> ((fun srcHash -> ((fun depsHash -> ((fun manHash -> ((fun namesHash -> ((fun verHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText namesHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)])) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheSchema ^ v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash ((v_Base_dString_djoin "\t") names)))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) ((v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/vuna.toml")))))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_drootSources) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) 0)))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaSegment = 1073741824

let v_Vuna_dCompiler_dDriver_dCompile_dreadProgramCache = (fun dep -> ((fun dctx -> ((fun key -> ((fun path -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((dtp_unmarshal (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path))))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath dctx) key))) (match (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports dep) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16) -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyLib dctx) dtb__16)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyExe dctx) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dep))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dep)))

let rec v_Vuna_dCompiler_dDriver_dCompile_ddepProgramsOfGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (match (v_Vuna_dCompiler_dDriver_dCompile_dreadProgramCache dtb__17) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> ((fun prog -> (if (v_Vuna_dCompiler_dDriver_dDt_ddtProgramHasMetas prog) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (((v_Vuna_dCompiler_dDriver_dCompile_ddepProgramsOfGo (mc0 + 1)) dtb__18) (C_Base_dList_dList_Base_dList_dCons (prog, mc2))))) (v_Vuna_dCompiler_dDriver_dCache_dprogramOfCached ((v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram (mc0 * v_Vuna_dCompiler_dDriver_dCompile_dmetaSegment)) dtb__19)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_ddepProgramsOf = (fun ctx -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackage ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__20) -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepProgramsOfGo 0) (v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies dtb__20)) C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache = (fun ctx entry path checked -> ((v_Base_dResult_dandThen checked) (fun r -> ((fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dPair_dfirstOf r)))) (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) path) (dtp_marshal (v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram (v_Base_dPair_dsecondOf r))))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir ctx))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe = (fun ctx entry -> ((fun key -> ((fun path -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else ((((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndCache ctx) entry) path) ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgram ctx) entry)))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath ctx) key))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyExe ctx) entry)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib = (fun ctx names -> ((fun key -> ((fun path -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgram ctx) names)) (fun r -> ((fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dPair_dfirstOf r)))) (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) path) (dtp_marshal (v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram (v_Base_dPair_dsecondOf r))))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheDir ctx))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachePath ctx) key))) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCacheKeyLib ctx) names)))

let v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage = (fun pkg -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) then ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) else (match (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["check: library package "; (v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); " has no app/Main.vuna (executable) and no [export].modules (library)"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__21) -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) dtb__21)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheSchema = "vuna-split-cache 1"

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir = (fun ctx -> (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dcacheBase; "/"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))); "/split"]))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCachePath = (fun ctx key -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir ctx); "/"; key]))

let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheKey = (fun ctx entry printResult -> ((fun srcHash -> ((fun depsHash -> ((fun verHash -> ((fun prHash -> (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText depsHash); "-"; (v_Vuna_dCompiler_dDriver_dCompile_dhashText (verHash + prHash))])) (if printResult then 1 else 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheSchema ^ v_Vuna_dCompiler_dVersion_dvunaVersion)) + v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) 0)))

let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitCache = (fun path -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((dtp_unmarshal (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path))))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitCache = (fun ctx path files -> ((fun _u -> (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) path) (dtp_marshal files)))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheDir ctx))))

let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir = (fun ctx entry printResult outDir -> ((fun key -> ((fun path -> (match (v_Vuna_dCompiler_dDriver_dCompile_dreadSplitCache path) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__22) -> (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled ctx) outDir) dtb__22)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDriver_dDt_ddtSplitProject ctx) entry) printResult)) (fun files -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiled ctx) outDir) files)) (fun n -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (n))) (((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitCache ctx) path) files))))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dCompile_dsplitCachePath ctx) key))) (((v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheKey ctx) entry) printResult)))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun dir outDir -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) true) outDir))))
