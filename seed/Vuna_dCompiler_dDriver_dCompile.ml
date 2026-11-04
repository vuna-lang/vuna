open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
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
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
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
open Vuna_dCompiler_dVersion
let v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage = (fun pkg -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) then ((v_Vuna_dCompiler_dDriver_dDt_ddtCheck (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) else (match (v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "check: library package ") ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)) " has no app/Main.vuna (executable) and no [export].modules (library)"))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibrary (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) dtb__0)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__1, dtb__2) -> (if ((bi_eq_int dtb__1) 47) then dtb__2 else (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash dtb__2))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((bi_eq_int (v_Base_dList_dlength after)) (v_Base_dList_dlength rev)) then "." else ((fun parent -> (if ((bi_eq_str parent) "") then (if ((v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((v_Base_dString_dstartsWith "/") path) then (v_Base_dBool_dnot ((v_Base_dString_dstartsWith "/") parent)) else false) then ((bi_concat "/") parent) else parent))) (dtp_pack (v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash rev))) (v_Base_dList_dreverse chars))) (dtp_unpack path)))

let rec v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel = (fun fuel -> (fun path -> (if ((bi_le_int fuel) 0) then 0 else (if (if (if ((bi_eq_str path) "") then true else ((bi_eq_str path) ".")) then true else ((bi_eq_str path) "/")) then 0 else (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then 0 else ((fun _u -> (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_makeDir dtio_0)) path))) ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel ((bi_sub fuel) 1)) (v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath path))))))))

let v_Vuna_dCompiler_dDriver_dCompile_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel 256) path))

let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir = (fun ctx -> (fun entry -> (fun printResult -> (fun outDir -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDriver_dDt_ddtSplitProject ctx) entry) printResult)) (fun files -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged outDir) files)) (fun n -> ((fun order -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (n))) (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) ((bi_concat outDir) "/build.sh")) (v_Vuna_dCompiler_dDriver_dSplit_dbuildScript order))))) (v_Vuna_dCompiler_dDriver_dSplit_dsplitCompileOrder (v_Vuna_dCompiler_dDriver_dSplit_dsplitInitFiles files)))))) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath outDir))))))))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun dir -> (fun outDir -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) true) outDir)))))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema = 1

let v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName = "build-meta.json"

let v_Vuna_dCompiler_dDriver_dCompile_dtextHash = (fun s -> ((bi_add ((bi_add ((bi_mul (dtp_strHash s)) 1000003)) (dtp_strHash ((bi_concat "m30:") s)))) (bi_strLength s)))

let v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir = (fun name -> (if (if (if (if (if (if (if (if ((bi_eq_str name) ".git") then true else ((bi_eq_str name) ".local")) then true else ((bi_eq_str name) ".output")) then true else ((bi_eq_str name) ".direnv")) then true else ((bi_eq_str name) "node_modules")) then true else ((bi_eq_str name) "seed")) then true else ((bi_eq_str name) "_scratch")) then true else ((bi_eq_str name) "result")) then true else ((bi_eq_str name) "corpus")))

let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta = (fun fuel -> (fun dir -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Base_dList_dNil else (if (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) dir)) then (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) dir)) else false) then ((v_Base_dList_dconcatMap ((v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta ((bi_sub fuel) 1)) dir)) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (fun p -> dtp_listOf (dtp_readDir p)) dtio_0)) dir))) else C_Base_dList_dList_Base_dList_dNil))))
and v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta = (fun fuel -> (fun dir -> (fun name -> (if ((bi_le_int fuel) 0) then C_Base_dList_dList_Base_dList_dNil else (if ((bi_eq_str name) ".") then C_Base_dList_dList_Base_dList_dNil else (if ((bi_eq_str name) "..") then C_Base_dList_dList_Base_dList_dNil else (if (v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir name) then C_Base_dList_dList_Base_dList_dNil else ((fun path -> (if (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) path)) else false) then ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta ((bi_sub fuel) 1)) path) else (if ((v_Base_dString_dendsWith ".vuna") name) then (C_Base_dList_dList_Base_dList_dCons (path, C_Base_dList_dList_Base_dList_dNil)) else C_Base_dList_dList_Base_dList_dNil))) ((bi_concat dir) ((bi_concat "/") name))))))))))

let v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta = (fun prefix -> (fun s -> (if ((v_Base_dString_dstartsWith prefix) s) then (((v_Base_dString_dsubstring (bi_strLength prefix)) ((bi_sub (bi_strLength s)) (bi_strLength prefix))) s) else s)))

let v_Vuna_dCompiler_dDriver_dCompile_dslashToDot = (fun c -> (if ((bi_eq_int c) 47) then 46 else c))

let v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots = (fun s -> (dtp_pack ((v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dslashToDot) (dtp_unpack s))))

let v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath = (fun rootPath -> (fun path -> ((fun rel0 -> ((fun rel -> (v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots rel)) (if ((v_Base_dString_dendsWith ".vuna") rel0) then (((v_Base_dString_dsubstring 0) ((bi_sub (bi_strLength rel0)) 5)) rel0) else rel0))) ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta ((bi_concat rootPath) "/")) path))))

let v_Vuna_dCompiler_dDriver_dCompile_drootSources = (fun root -> ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p), (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) p))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (v_Vuna_dCompiler_dPackages_dPkg_drootDir root))))

let rec v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__4) -> (match dtb__3 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__5, dtb__6) -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf dtb__4) ((bi_add ((bi_mul mc1) 1000003)) dtb__6))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_drootHash = (fun root -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf (v_Vuna_dCompiler_dDriver_dCompile_drootSources root)) 0))

let v_Vuna_dCompiler_dDriver_dCompile_dentrySource = (fun entry -> (C_Base_dPair_dPair_Base_dPair_dPair ("<entry>", (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) entry))))))

let v_Vuna_dCompiler_dDriver_dCompile_dcontextSources = (fun ctx -> (fun entry -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dCompile_drootSources) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dCompile_dentrySource entry), C_Base_dList_dList_Base_dList_dNil)))))

let v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes = (fun ctx -> (match (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx) with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> ((v_Base_dList_dmap (fun r -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dPackages_dPkg_drootName r), (v_Vuna_dCompiler_dDriver_dCompile_drootHash r))))) dtb__8)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText = (fun mc0 -> (match mc0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> ((bi_concat "{\"name\":\"") ((bi_concat dtb__9) ((bi_concat "\",\"hash\":") ((bi_concat (bi_strFromInt dtb__10)) "}"))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> (match dtb__12 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__11
  | _ -> ((bi_concat dtb__11) ((bi_concat ",") (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList dtb__12)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if ((bi_eq_int dtb__13) 47) then (dtp_pack mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev dtb__14) (C_Base_dList_dList_Base_dList_dCons (dtb__13, mc1))))
  | C_Base_dList_dList_Base_dList_dNil -> (dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dCompile_dlastSegment = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev (v_Base_dList_dreverse (dtp_unpack path))) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText = (fun ctx -> (fun entry -> (fun linked -> ((fun sources -> ((fun deps -> ((fun entryName -> ((fun linkedText -> ((bi_concat "{\"schema\":") ((bi_concat (bi_strFromInt v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema)) ((bi_concat ",\"compiler\":\"") ((bi_concat v_Vuna_dCompiler_dVersion_dvunaVersion) ((bi_concat "\",\"package\":\"") ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) ((bi_concat "\",\"entry\":\"") ((bi_concat entryName) ((bi_concat "\",\"linked\":") ((bi_concat linkedText) ((bi_concat ",\"closure\":") ((bi_concat (bi_strFromInt ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0))) ((bi_concat ",\"sources\":[") ((bi_concat (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) sources))) ((bi_concat "],\"dependencies\":[") ((bi_concat (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) deps))) "]}\n"))))))))))))))))) (if linked then "true" else "false"))) (v_Vuna_dCompiler_dDriver_dCompile_dlastSegment entry))) (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx))) ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)))))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf = (fun outDir -> ((bi_concat outDir) ((bi_concat "/") v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName)))

let v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta = (fun outDir -> (fun ctx -> (fun entry -> (fun linked -> (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)) (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) linked)))))))

let v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate = (fun outDir -> (fun ctx -> (fun entry -> (fun binPath -> ((fun path -> (if (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) binPath)) else false) then ((bi_eq_str (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path))) (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) true)) else false)) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir))))))

let v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript = (fun dir -> (fun out -> (fun name -> ((fun code -> (if ((bi_eq_int code) 0) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "build: ") ((bi_concat name) ((bi_concat ": `sh build.sh ") ((bi_concat out) ((bi_concat "` failed in ") ((bi_concat dir) ((bi_concat " (exit ") ((bi_concat (bi_strFromInt code)) ")")))))))))))) (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (fun dir args -> dtp_runIn dir (dtp_ocamlOf args)) dtio_0 dtio_1)) dir) (C_Base_dList_dList_Base_dList_dCons ("sh", (C_Base_dList_dList_Base_dList_dCons ("build.sh", (C_Base_dList_dList_Base_dList_dCons (out, C_Base_dList_dList_Base_dList_dNil))))))))))))
