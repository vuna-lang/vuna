open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCompile_dPkgEntry = { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName : string; f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir : string; f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey : string; f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv : string }
and t_Vuna_dCompiler_dDriver_dCompile_dClosureMod = { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc : string; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr : string }
and t_Vuna_dCompiler_dDriver_dCompile_dToolContext = { f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepIfaces : Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dModuleIface Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcNeeded : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcOwnNames : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcStats : Vuna_dCompiler_dDriver_dIface.t_Vuna_dCompiler_dDriver_dIface_dSourceInfo Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dCompile_dCheckMods = { f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer : string; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags : string }

# 45 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__0)) (fun y -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff mc0) dtb__1)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (y, ys)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__2)) (fun xs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff mc0) dtb__3)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dappend xs) ys))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmapMaybeEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__4)) (fun y -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapMaybeEff mc0) dtb__5)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match y with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> (Base_dList.C_Base_dList_dList_Cons (dtb__6, ys))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ys
  | _ -> failwith "DT: impossible branch"
))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path))) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) ".") (Base_dList.C_Base_dList_dList_Cons ("mkdir", (Base_dList.C_Base_dList_dList_Cons ("-p", (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)))))))))))))

# 119 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel 256) path))

# 131 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (if (dtb__7 = 47) then dtb__8 else (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash dtb__8))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

# 332 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles = (fun ctxDir outDir -> ((fun ffiDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) ffiDir))) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) ffiDir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) ffiDir))) (fun names -> ((fun cs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/ffi"))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun n -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) (String.concat "" [ffiDir; "/"; ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)])))) (fun content -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) (String.concat "" [outDir; "/ffi/"; ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)])) content))))) cs)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dmap (fun n -> ("ffi/" ^ ((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) n)))) cs))))))) ((Base_dList.v_Base_dList_dfilter (fun n -> ((Base_dString.v_Base_dString_dendsWith ".c") n))) names)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil))))))) (ctxDir ^ "/ffi")))

# 306 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized = (fun ctx outDir files -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_densureDirPath outDir)) (fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged outDir) files)) (fun written -> (match written with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__9) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__9)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__10) -> ((fun _u -> ((fun graph -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx)) outDir)) (fun cFiles -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) (outDir ^ "/build.sh")) ((Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dbuildScript graph) cFiles)))) (fun _u -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__10)))) (if (dtp_debug_on 0) then (dtp_debug_line "build-script-done") else 0))))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-graph-done") else 0))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph files))) (if (dtp_debug_on 0) then (dtp_debug_line "write-split-files-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "write-compiled-start") else 0)))))

# 373 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema = 1

# 376 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName = "build-meta.json"

# 380 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtextHash = (fun s -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentKey s))

# 389 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint = Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerFingerprintEff

# 394 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcacheBase = Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreRootReadyEff

# 399 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir = (fun name -> (Vuna_dCompiler_dPackages_dSource.v_Vuna_dCompiler_dPackages_dSource_dskipSourceDir name))

# 402 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta = (fun fuel dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dir))) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) dir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) dir))) (fun names -> ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff ((v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta (fuel - 1)) dir)) names))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil))))))))
# 412 "Vuna/Compiler/Driver/Compile.vuna"
and v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta = (fun fuel dir name -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (if (name = ".") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (if (name = "..") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else (if (v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir name) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil) else ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path))) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun isDir -> (if (if exists then isDir else false) then ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta (fuel - 1)) path) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") name) then (Base_dList.C_Base_dList_dList_Cons (path, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)))))))) (String.concat "" [dir; "/"; name])))))))

# 427 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta = (fun prefix s -> (if ((Base_dString.v_Base_dString_dstartsWith prefix) s) then (((Base_dString.v_Base_dString_dsubstring (Base_dString.v_Base_dString_dbyteLength prefix)) (bi_natSub (Base_dString.v_Base_dString_dbyteLength s) (Base_dString.v_Base_dString_dbyteLength prefix))) s) else s))

# 435 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dslashToDot = (fun c -> (if (c = 47) then 46 else c))

# 432 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dslashToDot) (Base_dList.dtp_unpack s))))

# 438 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath = (fun rootPath path -> ((fun rel0 -> ((fun rel -> (v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots rel)) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel0) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natSub (Base_dString.v_Base_dString_dbyteLength rel0) 5)) rel0) else rel0))) ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta (rootPath ^ "/")) path)))

# 445 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootSources = (fun root -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root))) (fun paths -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) p))) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dCompile_dtextHash content) }))))) paths))))

# 458 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (match dtb__11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__13; Base_dPair.f_Base_dPair_dPair_second = dtb__14 } -> ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf dtb__12) ((mc1 * 1000003) + dtb__14))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootHash = (fun root -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_drootSources root)) (fun sources -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)))))

# 463 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dentrySource = (fun entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) entry))) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = "<entry>"; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dCompile_dtextHash content) }))))

# 469 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downRootsOf = (fun ctx -> ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)))

# 472 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcontextSources = (fun ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff v_Vuna_dCompiler_dDriver_dCompile_drootSources) (v_Vuna_dCompiler_dDriver_dCompile_downRootsOf ctx))) (fun own -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dentrySource entry)) (fun es -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dappend own) (Base_dList.C_Base_dList_dList_Cons (es, Base_dList.C_Base_dList_dList_Nil)))))))))

# 479 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes = (fun ctx -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_drootHash r)) (fun h -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r); Base_dPair.f_Base_dPair_dPair_second = h }))))) dtb__16)
  | _ -> failwith "DT: impossible branch"
))

# 497 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind = "pkgiface"

# 500 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec = "pkg-iface-summary 1"

# 503 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf = (fun pkg srcClosure tag -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("pkgiface", (Base_dList.C_Base_dList_dList_Cons (pkg, (Base_dList.C_Base_dList_dList_Cons (srcClosure, (Base_dList.C_Base_dList_dList_Cons (tag, Base_dList.C_Base_dList_dList_Nil))))))))))

# 507 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepRootIdentityEff = (fun root -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_drootHash root)) (fun h -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff) (fun tag -> ((fun key -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec) key)) (fun saved -> ((fun verdict -> ((fun _u -> (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__17) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root); Base_dPair.f_Base_dPair_dPair_second = ("iface:" ^ dtb__17) })
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun tomlPath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) tomlPath))) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) tomlPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ""))) (fun toml -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root); Base_dPair.f_Base_dPair_dPair_second = ("manifest:" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash toml))) })))))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root) ^ "/vuna.toml"))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["dep-identity="; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root); " verdict="; verdict])) else 0))) (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> "iface"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "manifest"
  | _ -> failwith "DT: impossible branch"
))))) (((v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root)) (bi_strFromInt h)) tag)))))))

# 530 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff = (fun ctx -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff v_Vuna_dCompiler_dDriver_dCompile_ddepRootIdentityEff) dtb__20)
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpairText = (fun p -> (String.concat "" [(Base_dPair.v_Base_dPair_dfirstOf p); "="; (Base_dPair.v_Base_dPair_dsecondOf p)]))

# 535 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash = (fun pairs -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("dep-identities", ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dpairText) pairs)))))

# 542 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwritePkgIfaceSummaryEff = (fun ctx modules -> (match ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_drootHash dtb__21)) (fun h -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff) (fun tag -> ((fun key -> ((fun payload -> ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind) v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec) key) payload)) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpkgIfaceHashOfModules (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules))) (((v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (bi_strFromInt h)) tag))))))
  | _ -> failwith "DT: impossible branch"
))

# 553 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__23; Base_dPair.f_Base_dPair_dPair_second = dtb__24 } -> (String.concat "" ["{\"name\":\""; dtb__23; "\",\"hash\":"; (bi_strFromInt dtb__24); "}"])
  | _ -> failwith "DT: impossible branch"
))

# 556 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__25
  | _ -> (String.concat "" [dtb__25; ","; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList dtb__26)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (if (dtb__27 = 47) then (Base_dList.dtp_pack mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev dtb__28) (Base_dList.C_Base_dList_dList_Cons (dtb__27, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.dtp_pack mc1)
  | _ -> failwith "DT: impossible branch"
))

# 567 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dlastSegment = (fun path -> ((v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))) Base_dList.C_Base_dList_dList_Nil))

# 582 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf = (fun outDir -> (String.concat "" [outDir; "/"; v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName]))

# 606 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript = (fun dir out name -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) dir) (Base_dList.C_Base_dList_dList_Cons ("sh", (Base_dList.C_Base_dList_dList_Cons ("build.sh", (Base_dList.C_Base_dList_dList_Cons (out, Base_dList.C_Base_dList_dList_Nil))))))))) (fun code -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (code = 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["build: "; name; ": `sh build.sh "; out; "` failed in "; dir; " (exit "; (bi_strFromInt code); ")"])))))))

# 617 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema = "vuna-check-node 2"

# 620 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dhashText = (fun n -> (bi_strFromInt n))

# 631 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> dtb__29
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepSourceText = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepUrl (dtb__30) -> ("url:" ^ dtb__30)
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepGit (dtb__31, dtb__32) -> (String.concat "" ["git:"; dtb__31; "@"; dtb__32])
  | Vuna_dCompiler_dFrontend_dManifest.C_Vuna_dCompiler_dFrontend_dManifest_dDependencySource_DepPath (dtb__33) -> ("path:" ^ dtb__33)
  | _ -> failwith "DT: impossible branch"
))

# 640 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepSemanticText = (fun d -> (String.concat "" [(d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depAlias; "|"; (v_Vuna_dCompiler_dDriver_dCompile_ddepSourceText (d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depSource); "|"; (v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText (d).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dDependency_depHash)]))

# 643 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__34) -> ((fun man -> ((fun exportsText -> ((Base_dString.v_Base_dString_djoin "\n") (Base_dList.C_Base_dList_dList_Cons (("name:" ^ (v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName)), (Base_dList.C_Base_dList_dList_Cons (("exports:" ^ exportsText), ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_ddepSemanticText) (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies))))))) (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> ((Base_dString.v_Base_dString_djoin ",") dtb__35)
  | _ -> failwith "DT: impossible branch"
))) (dtb__34).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText = (fun ctx entry linked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) (fun sources -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes ctx)) (fun deps -> ((fun manifestHash -> ((fun entryName -> ((fun linkedText -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" ["{\"schema\":"; (bi_strFromInt v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema); ",\"compiler\":\""; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "\",\"package\":\""; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); "\",\"entry\":\""; entryName; "\",\"linked\":"; linkedText; ",\"closure\":"; (bi_strFromInt ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)); ",\"manifest\":"; (bi_strFromInt manifestHash); ",\"sources\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) sources)); "],\"dependencies\":["; (v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText) deps)); "]}\n"]))) (if linked then "true" else "false"))) (v_Vuna_dCompiler_dDriver_dCompile_dlastSegment entry))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage))))))))

# 585 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta = (fun outDir ctx entry linked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) linked)) (fun text -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)) text))))

# 591 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate = (fun outDir ctx entry binPath -> ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path))) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) binPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun binExists -> (if (if exists then binExists else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path))) (fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText ctx) entry) true)) (fun expected -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (raw = expected)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))))) (v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf outDir)))

# 655 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf = (fun ctx -> (if (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx) then "release" else "debug"))

# 691 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (mc0 <= 0) then { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37)) } else (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__36)) mc1) then (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) mc1) dtb__37) else (match (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__36), mc1))) (dtb__36).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__38; Base_dPair.f_Base_dPair_dPair_second = dtb__39 } -> (match (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel (mc0 - 1)) dtb__38) dtb__37) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = dtb__41 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__39) (Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__41))) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 688 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages = (fun seen ps -> (((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel 4096) seen) ps))

# 702 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if ((Base_dList.v_Base_dList_dmemName dtb__42) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn dtb__43) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 699 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet = (fun a b -> (if (if ((Base_dList.v_Base_dList_dlength a) = (Base_dList.v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn a) b) else false) then ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn b) a) else false))

# 713 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList = (fun ctx -> (match (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__44) -> (Base_dPair.v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages Base_dList.C_Base_dList_dList_Nil) (dtb__44).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageDependencies))
  | _ -> failwith "DT: impossible branch"
))

# 718 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount = (fun ctx -> (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList ctx)))

# 732 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec = "module-iface 3"

# 756 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf = (fun name -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("pkg", (Base_dList.C_Base_dList_dList_Cons (name, Base_dList.C_Base_dList_dList_Nil))))))

# 773 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (if ((dtb__45).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45)) else ((v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry mc0) dtb__46))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 777 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (if ((dtb__47).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47)) else ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod mc0) dtb__48))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 781 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dclosureModsEff = (fun ctx pkgs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r)) pkgs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r))) (fun paths -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) p))) (fun raw -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (dtb__49).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (dtb__49).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (dtb__49).f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r)) p); f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = p; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress raw); f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = "" }))))) paths)))
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) (fun per -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) per)))))

# 796 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dheaderAddrOfMod = (fun m -> (((Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dheaderAddrOf (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc))

# 824 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwithPrelude = (fun hasPrelude m h -> (if (if (if hasPrelude then ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName <> "Prelude") else false) then (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName "Prelude") (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhImports)) else false) then ((Base_dList.v_Base_dList_dappend (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhImports) (Base_dList.C_Base_dList_dList_Cons ("Prelude", Base_dList.C_Base_dList_dList_Nil))) else (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhImports))

# 803 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dloadHeaderEff = (fun hasPrelude m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dreadHeaderEff (v_Vuna_dCompiler_dDriver_dCompile_dheaderAddrOfMod m))) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__50) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = (((v_Vuna_dCompiler_dDriver_dCompile_dwithPrelude hasPrelude) m) dtb__50); f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = "" })
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath))) (fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath) raw)) (fun parsed -> (match parsed with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__51) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) m)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__52) -> ((fun h -> ((fun imports -> ((fun h2 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dwriteHeaderEff (v_Vuna_dCompiler_dDriver_dCompile_dheaderAddrOfMod m)) h2)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = imports; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = "" })))) { Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhName = (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhName; Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhImports = imports; Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhFixities = (h).Vuna_dCompiler_dAddr.f_Vuna_dCompiler_dAddr_dModHeader_mhFixities })) (((v_Vuna_dCompiler_dDriver_dCompile_dwithPrelude hasPrelude) m) h))) ((Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dheaderOfSource (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) dtb__52))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 829 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodGraphEntry = (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; Base_dPair.f_Base_dPair_dPair_second = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports })

# 832 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf = (fun m -> (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName)

# 835 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disDepModOf = (fun ctx m -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg <> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

# 838 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disSelfModOf = (fun ctx m -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

# 841 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmoduleGraphOf = (fun mods -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodGraphEntry) mods))

# 845 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepAddrOf = (fun assign name -> (match ((Base_dList.v_Base_dList_dlookupPair name) assign) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53) -> dtb__53
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("ext:" ^ name)
  | _ -> failwith "DT: impossible branch"
))

# 857 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceAddrIn = (fun assign m -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ("iface", (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv, Base_dList.C_Base_dList_dList_Nil))))))))))))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_ddepAddrOf assign)) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports))))

# 862 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_daddrOfModIn = (fun assign m -> (match ((Base_dList.v_Base_dList_dlookupPair (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) assign) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> dtb__54
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ("ext:" ^ (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName)
  | _ -> failwith "DT: impossible branch"
))

# 867 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwithAddr = (fun assign m -> { f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports; f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr = ((v_Vuna_dCompiler_dDriver_dCompile_daddrOfModIn assign) m) })

# 876 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dinsertName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (if (mc0 <= dtb__55) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__55, ((v_Vuna_dCompiler_dDriver_dCompile_dinsertName mc0) dtb__56))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 872 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dsortNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> ((v_Vuna_dCompiler_dDriver_dCompile_dinsertName dtb__57) (v_Vuna_dCompiler_dDriver_dCompile_dsortNames dtb__58))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 889 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__59) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered dtb__60) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> ((fun a -> (((v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered dtb__60) mc1) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__59; Base_dPair.f_Base_dPair_dPair_second = a }, mc2)))) ((v_Vuna_dCompiler_dDriver_dCompile_difaceAddrIn mc2) dtb__61))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 880 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dassignGo = (fun _u mods _u _u -> ((fun assign -> ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dwithAddr assign)) mods)) (((v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered (v_Vuna_dCompiler_dDriver_dCompile_dsortNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) mods))) mods) Base_dList.C_Base_dList_dList_Nil)))

# 934 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodsKind = "mods"

# 937 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodsCodec = "mods-order 1"

# 940 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodKeyOf = (fun m -> (String.concat "" [(m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgKey; "|"; (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; "|"; (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; "|"; (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkgEnv; "|"; ((Base_dString.v_Base_dString_djoin ",") (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports)]))

# 943 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodsKeyOf = (fun mods -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("mods", (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dDriver_dCompile_dmodsCodec, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodKeyOf) mods)))))))

# 946 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dencMods = (fun ps -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencPair Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr) Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr))) ps))

# 949 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddecMods = (fun bytes -> (match (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecPair Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr)) 65536) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf bytes)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd (Base_dPair.v_Base_dPair_dsecondOf dtb__62)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__62))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 954 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_daddrsVia = (fun table mods -> ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dwithAddr table)) mods))

# 957 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dassignAndWriteMods = (fun key mods ta tb tc -> ((fun table -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff v_Vuna_dCompiler_dDriver_dCompile_dmodsKind) v_Vuna_dCompiler_dDriver_dCompile_dmodsCodec) key) (v_Vuna_dCompiler_dDriver_dCompile_dencMods table))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun td -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-mods-phases n="; (bi_strFromInt (Base_dList.v_Base_dList_dlength mods)); " closure="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tb - ta) / 1000)); "ms headers="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tc - tb) / 1000)); "ms assign="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (td - tc) / 1000)); "ms"])) else 0))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_daddrsVia table) mods))))))))) (((v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered (v_Vuna_dCompiler_dDriver_dCompile_dsortNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) mods))) mods) Base_dList.C_Base_dList_dList_Nil)))

# 904 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff = (fun ctx pkgs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun ta -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureModsEff ctx) pkgs)) (fun mods0 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun tb -> ((fun hasPrelude -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (v_Vuna_dCompiler_dDriver_dCompile_dloadHeaderEff hasPrelude)) mods0)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun tc -> ((fun key -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff v_Vuna_dCompiler_dDriver_dCompile_dmodsKind) v_Vuna_dCompiler_dDriver_dCompile_dmodsCodec) key)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__63) -> (match (v_Vuna_dCompiler_dDriver_dCompile_ddecMods dtb__63) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun td -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-mods-phases n="; (bi_strFromInt (Base_dList.v_Base_dList_dlength mods)); " closure="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tb - ta) / 1000)); "ms headers="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (tc - tb) / 1000)); "ms assign=cached total="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (td - ta) / 1000)); "ms"])) else 0))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_daddrsVia dtb__64) mods))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompile_dassignAndWriteMods key) mods) ta) tb) tc)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompile_dassignAndWriteMods key) mods) ta) tb) tc)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dmodsKeyOf mods))))))) ((Base_dList.v_Base_dList_dmemName "Prelude") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) mods0))))))))))

# 999 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff = (fun a -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff "iface") v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec) a)) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65) -> (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceComplete dtb__65)
  | _ -> failwith "DT: impossible branch"
)))))

# 1007 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff (dtb__66).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr)) (fun mi -> (match mi with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-miss "; (dtb__66).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; " "; (dtb__66).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr; " pkg="; (dtb__66).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg; " src="; (dtb__66).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc])) else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__68) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff dtb__67)) (fun xs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match xs with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 1024 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf = (fun ctx mods -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_disDepModOf ctx)) mods))

# 1027 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf = (fun ctx mods -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_disSelfModOf ctx)) mods))

# 1052 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderKind = "order"

# 1055 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderCodec = "module-order 1"

# 1058 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dencOrderNames = (fun names -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencStr)) names))

# 1061 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddecOrderNamesComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> (match dtb__70 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__71; Base_dPair.f_Base_dPair_dPair_second = dtb__72 } -> (if (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd dtb__72) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecList Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_ddecStr) (bi_strLength s)) (Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dcurOf s))))

# 1067 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteOrderEff = (fun pkgKey names -> ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff v_Vuna_dCompiler_dDriver_dCompile_dorderKind) v_Vuna_dCompiler_dDriver_dCompile_dorderCodec) (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("order", (Base_dList.C_Base_dList_dList_Cons (pkgKey, Base_dList.C_Base_dList_dList_Nil)))))) (v_Vuna_dCompiler_dDriver_dCompile_dencOrderNames names)))

# 1072 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff = (fun pkgKey -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff v_Vuna_dCompiler_dDriver_dCompile_dorderKind) v_Vuna_dCompiler_dDriver_dCompile_dorderCodec) (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("order", (Base_dList.C_Base_dList_dList_Cons (pkgKey, Base_dList.C_Base_dList_dList_Nil))))))) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (v_Vuna_dCompiler_dDriver_dCompile_ddecOrderNamesComplete dtb__73)
  | _ -> failwith "DT: impossible branch"
)))))

# 1081 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dorderCoversEff = (fun pkg names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf pkg))) (fun ord -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match ord with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__74) -> ((v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn names) dtb__74)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))))

# 1089 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__75) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> (Base_dList.C_Base_dList_dList_Cons (dtb__77, ((v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder mc0) dtb__76)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder mc0) dtb__76)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1095 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgEq = (fun p m -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg = p))

# 1098 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (if ((Base_dList.v_Base_dList_dmemName (dtb__78).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs dtb__79) mc1) else ((v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs dtb__79) (Base_dList.C_Base_dList_dList_Cons ((dtb__78).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1103 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf dtb__80))) (fun ord -> (match ord with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> ((fun picked -> ((fun expect -> (if ((Base_dList.v_Base_dList_dlength picked) = expect) then (((v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs mc0) dtb__81) ((Base_dList.v_Base_dList_dappend mc2) picked)) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) (Base_dList.v_Base_dList_dlength ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_dpkgEq dtb__80)) mc0)))) ((v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder mc0) dtb__82))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 1116 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepModsByOrderEff = (fun ctx mods -> (((v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs mods) ((v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods)) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

# 1122 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (if ((Base_dList.v_Base_dList_dmemName dtb__83) mc3) then ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__84) mc3) else (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__83) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> (if ((dtb__85).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPkg <> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName mc0)) then (Base_dList.C_Base_dList_dList_Cons (dtb__85, ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__84) (Base_dList.C_Base_dList_dList_Cons (dtb__83, mc3))))) else ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__84) (Base_dList.C_Base_dList_dList_Cons (dtb__83, mc3))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods mc0) mc1) dtb__84) mc3)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1131 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepModsOrdered = (fun ctx mods -> ((((v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods ctx) mods) (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dtopoModules (v_Vuna_dCompiler_dDriver_dCompile_dmoduleGraphOf mods))) Base_dList.C_Base_dList_dList_Nil))

# 1150 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots = (fun roots -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r))) (fun paths -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dmap (fun path -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r)) path); Base_dPair.f_Base_dPair_dPair_second = path })) paths)))))) roots)) (fun walked -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) walked)))))

# 1170 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec = 5

# 1196 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_CACHE_MTIME"))) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1"))))

# 1209 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__86; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = dtb__87; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__88; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__89 } -> dtb__86
  | _ -> failwith "DT: impossible branch"
))

# 1221 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf = (fun ctx current imports -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) current) imports)) (fun implicitR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match implicitR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__90) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) imports)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__91) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr) ((Base_dList.v_Base_dList_dappend imports) dtb__91))
  | _ -> failwith "DT: impossible branch"
)))))

# 1212 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource = (fun ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun parsed -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__92) -> (match dtb__92 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__93; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__94; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__95; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__96; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__97; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__98; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__99 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf ctx) "") dtb__94)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__100) -> (match dtb__100 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__101; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__102; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__103; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__104; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__105; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__106; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__107 } -> (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf ctx) dtb__101) dtb__94)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__93)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__108) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 1234 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_IFACE_TOOL"))) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v <> "0"))))

# 1239 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (if (mc0 <= 0) then mc3 else (if ((Base_dList.v_Base_dList_dmemName dtb__109) mc3) then ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo (mc0 - 1)) mc1) dtb__110) mc3) else (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod dtb__109) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo (mc0 - 1)) mc1) dtb__110) (Base_dList.C_Base_dList_dList_Cons (dtb__109, mc3)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo (mc0 - 1)) mc1) ((Base_dList.v_Base_dList_dappend (dtb__111).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmImports) dtb__110)) (Base_dList.C_Base_dList_dList_Cons (dtb__109, mc3)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1249 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf = (fun mods starts -> ((((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo 8192) mods) starts) Base_dList.C_Base_dList_dList_Nil))

# 1252 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disNeededMod = (fun needed m -> ((Base_dList.v_Base_dList_dmemName (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) needed))

# 1256 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf = (fun ctx mods needed -> ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompile_disNeededMod needed)) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods)))

# 1316 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolTextHash = (fun _uarity0 -> (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest _uarity0))

# 1319 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoForPath = (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path))) (fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) path))) (fun mtime -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) path))) (fun size -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = path; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest raw); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size }))))))))

# 1326 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))) (fun us -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if 1000000 = 0 then failwith "division by zero" else us / 1000000))))

# 1173 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged = (fun path si -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath) (fun fast -> (if fast then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) path))) (fun m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) path))) (fun sz -> (if (if (m = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si)) then (sz = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf si)) else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec) (fun now -> (if ((m + v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec) < now) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path))) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path))) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path))) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))))

# 1158 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__112)) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__114) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged dtb__114) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__112))) (fun unchanged -> (if unchanged then ((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid dtb__113) mc1) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true)
  | _ -> failwith "DT: impossible branch"
))

# 1142 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceSourcesValid = (fun roots p pi -> ((fun pkgRoots -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots pkgRoots)) (fun walked -> ((v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid (pi).Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules) walked)))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p)))) roots)))

# 1334 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh = (fun builtSec si -> ((fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path))) (fun exists -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) exists) false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) path))) (fun m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) path))) (fun sz -> (if (if (if (m = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si)) then (sz = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf si)) else false) then (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf si) + v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec) <= builtSec) else false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path))) (fun content -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest content) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf si)))))))))))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiPathOf si)))

# 1349 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh mc0) dtb__115)) (fun fresh -> (if fresh then ((v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh mc0) dtb__116) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) true)
  | _ -> failwith "DT: impossible branch"
))

# 1386 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair = (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName; Base_dPair.f_Base_dPair_dPair_second = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr })

# 1389 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dstatOfClosureMod = (fun m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath))) (fun mtime -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath))) (fun size -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmPath; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmSrc; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size }))))))

# 1412 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downCleanWanted = (fun needed exclude m -> (if ((Base_dList.v_Base_dList_dmemName (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) needed) then (match exclude with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> ((m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName <> dtb__117)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
) else false))

# 1473 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolCompilerFingerprint = v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint

# 1484 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir = (fun dir -> (if ((Base_dString.v_Base_dString_dendsWith "/") dir) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt ((bi_strLength dir) - 1))) dir) else dir))

# 1488 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcanonicalPath = (fun dir file -> ((fun d -> (if (if (d = ".") then true else (d = "")) then file else (if ((Base_dString.v_Base_dString_dstartsWith (d ^ "/")) file) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt ((bi_strLength d) + 1))) (bi_natFromInt (((bi_strLength file) - (bi_strLength d)) - 1))) file) else file))) (v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir dir)))

# 1496 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredPath = (fun dir file -> ((fun d -> (if (if (file = "") then true else ((Base_dString.v_Base_dString_dstartsWith "/") file)) then file else (if (if (d = ".") then true else (d = "")) then file else (String.concat "" [d; "/"; file])))) (v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir dir)))

# 1503 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dabsoluteSpanLabel = (fun l -> (match (l).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> ((Base_dString.v_Base_dString_dstartsWith "/") (dtb__118).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile)
  | _ -> failwith "DT: impossible branch"
))

# 1508 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__119, dtb__120) -> (if (v_Vuna_dCompiler_dDriver_dCompile_dabsoluteSpanLabel dtb__119) then true else (v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels dtb__120))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1512 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (if (v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath dtb__121) then true else (v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild dtb__122))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1516 "Vuna/Compiler/Driver/Compile.vuna"
and v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagId = dtb__123; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity = dtb__124; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagPhase = dtb__125; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCategory = dtb__126; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagCode = dtb__127; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage = dtb__128; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels = dtb__129; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagFields = dtb__130; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagTrace = dtb__131; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagNotes = dtb__132; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSuggestions = dtb__133; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin = dtb__134; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren = dtb__135; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal = dtb__136; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagIce = dtb__137; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagAbsent = dtb__138; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability = dtb__139 } -> (if (v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels dtb__129) then true else (v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild dtb__135))
  | _ -> failwith "DT: impossible branch"
))

# 1520 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_disStableDiag = (fun d -> (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagStability with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Stable -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Volatile -> false
  | _ -> failwith "DT: impossible branch"
))

# 1525 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dallStableDiags = (fun ds -> ((Base_dList.v_Base_dList_dlength ((Base_dList.v_Base_dList_dfilter (fun d -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompile_disStableDiag d)))) ds)) = 0))

# 1529 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore = (fun ctx d -> ((fun d2 -> (if (v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath d2) then ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithStability Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Volatile) d2) else (if (v_Vuna_dCompiler_dDriver_dCompile_disStableDiag d2) then ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithStability Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dStability_Stable) d2) else d2))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dmapSpanFile (v_Vuna_dCompiler_dDriver_dCompile_dcanonicalPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))) d)))

# 1536 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag = (fun ctx d -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dmapSpanFile (v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))) d))

# 1539 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreplayFailure = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (match dtb__141 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__140))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithChildren dtb__141) dtb__140)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1564 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf = (fun pkg kind manifest sources deps ver flags -> { f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg = pkg; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind = kind; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest = manifest; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources = sources; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps = deps; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer = ver; f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags = flags })

# 659 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckModsExe = (fun ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) (fun sources -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint) (fun fp -> ((fun srcHash -> ((fun manHash -> ((fun verHash -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "exe") (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)) (v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf ctx)))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + fp))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage)))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)))))))))

# 672 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckModsLib = (fun ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff v_Vuna_dCompiler_dDriver_dCompile_drootSources) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx))) (fun rootSourcesAll -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint) (fun fp -> ((fun srcHash -> ((fun manHash -> ((fun namesHash -> ((fun verHash -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) ("lib:" ^ (v_Vuna_dCompiler_dDriver_dCompile_dhashText namesHash))) (v_Vuna_dCompiler_dDriver_dCompile_dhashText manHash)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText verHash)) (v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf ctx)))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + fp))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash ((Base_dString.v_Base_dString_djoin "\t") names)))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage)))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf rootSourcesAll) 0)))))))))

# 1571 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dprojectIdOf = (fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))) (fun abs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_dprojectIdAddrOf abs)))))

# 1577 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff = (fun ctx digests -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dprojectIdOf ctx)) (fun pid -> ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreRootAppendEff pid) digests))))

# 1544 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload = (fun ctx dig outcome -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff "check") Vuna_dCompiler_dDiag_dCodec.v_Vuna_dCompiler_dDiag_dCodec_dcheckResultCodec) dig) (Vuna_dCompiler_dDiag_dCodec.v_Vuna_dCompiler_dDiag_dCodec_dencCheckOutcome outcome))) (fun _u -> ((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff ctx) (Base_dList.C_Base_dList_dList_Cons (dig, Base_dList.C_Base_dList_dList_Nil))))))

# 1614 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drunAndStore = (fun ctx dig run -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) run) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__142) -> ((fun stored -> ((fun _u -> (if (v_Vuna_dCompiler_dDriver_dCompile_dallStableDiags stored) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload ctx) dig) (Vuna_dCompiler_dDiag_dCodec.C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckFailed (stored)))) (fun n -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__142)))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-store write=" ^ (bi_strFromInt n))) else 0)))) else ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__142)))) (if (dtp_debug_on 0) then (dtp_debug_line "check-cache=skip volatile") else 0)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["check-store stable="; (bi_strFromInt (Base_dList.v_Base_dList_dlength ((Base_dList.v_Base_dList_dfilter (fun d -> (v_Vuna_dCompiler_dDriver_dCompile_disStableDiag d))) stored))); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength stored))])) else 0))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore ctx)) (Base_dList.C_Base_dList_dList_Cons (dtb__142, Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__143) -> ((fun allStored -> ((fun stored -> ((fun dropped -> ((fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload ctx) dig) (Vuna_dCompiler_dDiag_dCodec.C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckPassed (stored)))) (fun n -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__143)))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-store write=" ^ (bi_strFromInt n))) else 0))))) (if (dropped > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("check-store dropped=" ^ (bi_strFromInt dropped))) else 0) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["check-store pass stable="; (bi_strFromInt (Base_dList.v_Base_dList_dlength stored)); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength allStored))])) else 0))) (bi_natSub (Base_dList.v_Base_dList_dlength allStored) (Base_dList.v_Base_dList_dlength stored)))) ((Base_dList.v_Base_dList_dfilter v_Vuna_dCompiler_dDriver_dCompile_disStableDiag) allStored))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore ctx)) dtb__143))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=miss") else 0)))

# 1722 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_ELAB_FULL"))) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1"))))

# 1729 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_IFACE_AUDIT"))) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1"))))

# 1738 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__144) -> ("err\n" ^ (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__144))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__145) -> "ok\n"
  | _ -> failwith "DT: impossible branch"
))

# 1744 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__146) -> ("err\n" ^ (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__146))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__147) -> ("ok\n" ^ ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles) (Base_dPair.v_Base_dPair_dfirstOf dtb__147)))
  | _ -> failwith "DT: impossible branch"
))

# 1748 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_djoinLines = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (if (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) dtb__149) Base_dList.C_Base_dList_dList_Nil) then dtb__148 else (String.concat "" [dtb__148; "\n"; (v_Vuna_dCompiler_dDriver_dCompile_djoinLines dtb__149)]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1754 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCompare = (fun subject at s f -> (if (s = f) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["iface-audit-mismatch subject="; subject; " at="; at; " summary="; (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash s)); "/"; (bi_strFromInt (bi_strLength s)); " full="; (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash f)); "/"; (bi_strFromInt (bi_strLength f))]))))

# 1793 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadOneModIface = (fun m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff (m).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr)) (fun mi -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = mi }))))

# 1806 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcollectClean = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__150) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompile_dcollectClean dtb__151)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__152) -> (Base_dList.C_Base_dList_dList_Cons (dtb__152, (v_Vuna_dCompiler_dDriver_dCompile_dcollectClean dtb__151)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1872 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__153) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__153))) else ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf dtb__154) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1863 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (match dtb__155 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__157; Base_dPair.f_Base_dPair_dPair_second = dtb__158 } -> (if (dtb__158 = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__156) else (match ((Base_dList.v_Base_dList_dlookupPair dtb__157) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__159) -> (if (dtb__159 = dtb__158) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__156) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf mc1) dtb__157) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160) -> (if (dtb__160 = dtb__158) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc0) mc1) dtb__156) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 1881 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag = Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceSchema

# 1884 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag = Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff

# 971 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootEnvHashOf = (fun dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (dir ^ "/vuna.toml"))) (fun tomlPath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) tomlPath))) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) tomlPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ""))) (fun toml -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (String.concat "" [(bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_dtextHash toml)); "|"; tag; "|"]))))))))))))

# 979 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drootPkgTableEff = (fun ctx -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun r -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_drootEnvHashOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r))) (fun env -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir r); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey = (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r)); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv = (bi_strFromInt env) }))))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)))

# 992 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difacesForRootsEff = (fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_drootPkgTableEff ctx)) (fun pkgs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff ctx) pkgs)) (fun mods -> (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff mods))))))

# 1286 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbaseDepIfacesOf = (fun ctx -> (match (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompile_difacesForRootsEff ctx)
  | _ -> failwith "DT: impossible branch"
))

# 1772 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash = (fun ctx -> ((fun own -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (String.concat "" [(bi_strFromInt own); "|"; tag; "|"; (v_Vuna_dCompiler_dDriver_dCompile_djoinLines ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dpairText) deps))])))))))) (v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage))))

# 759 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpkgTableEff = (fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash ctx)) (fun ownEnv -> ((fun own -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext p))) (fun e -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir p); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey = (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName p)); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv = (bi_strFromInt e) }))))) (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList ctx))) (fun deps -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (own, deps)))))) { f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peName = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peDir = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peKey = (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)); f_Vuna_dCompiler_dDriver_dCompile_dPkgEntry_peEnv = (bi_strFromInt ownEnv) }))))

# 899 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff = (fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dpkgTableEff ctx)) (fun pkgs -> ((v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff ctx) pkgs))))

# 986 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difacesForContextEff = (fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff mods))))

# 1030 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf = (fun ctx -> (match (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__162) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsByOrderEff ctx) mods)) (fun ordered -> (match ordered with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (if (dtp_debug_on 0) then (dtp_debug_line "iface-reject=module-order") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__163) -> (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff dtb__163)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 1203 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForCheck = (fun ctx -> (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx))

# 1259 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource = (fun ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled) (fun enabled -> (if enabled then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource ctx) label) source)) (fun starts -> ((fun needed -> ((fun depMods -> ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff depMods)) (if (dtp_debug_on 0) then (dtp_debug_line ("tool-closure modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength depMods)))) else 0))) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf ctx) mods) needed))) ((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf mods) starts)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 1274 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolProgram = (fun ctx program -> (((v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource ctx) "<repl>") program))

# 1277 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForTool = (fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled) (fun enabled -> (if enabled then (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 1356 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolNeededOfImports = (fun ctx tool currentName imports -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf ctx) currentName) imports)) (fun importNames -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf mods) importNames)))))))

# 1364 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSourceDetailed = (fun ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled) (fun enabled -> (if enabled then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource ctx) label) source)) (fun starts -> ((fun needed -> ((fun depMods -> ((fun depHashes -> ((fun ownNames -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff depMods)) (fun ifaces -> (match ifaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__164) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff v_Vuna_dCompiler_dDriver_dCompile_dstatOfClosureMod) depMods)) (fun stats -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepIfaces = dtb__164; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes = depHashes; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcNeeded = needed; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcOwnNames = ownNames; f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcStats = stats })))) (if (dtp_debug_on 0) then (dtp_debug_line ("tool-closure modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__164)))) else 0))))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair) depMods))) (((v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf ctx) mods) needed))) ((v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf mods) starts)))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 1446 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded = (fun ctx mi -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx) = "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) mods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165) -> ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff "iface") v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec) (dtb__165).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dencModuleIface mi))
  | _ -> failwith "DT: impossible branch"
)))))

# 1432 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIface = (fun ctx tool clean checked name si -> ((fun miResult -> (match miResult with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__166) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__166)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__167) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded ctx) dtb__167)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__167)))))
  | _ -> failwith "DT: impossible branch"
)) (((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfModule (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) si) (tool).f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited) clean) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) name)))

# 1762 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable = (fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods))))))

# 1798 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downCleanInfo = (fun ctx _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff v_Vuna_dCompiler_dDriver_dCompile_dreadOneModIface) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))) (fun reads -> ((fun clean -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = (if ((Base_dList.v_Base_dList_dlength clean) = 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (clean))) })) (v_Vuna_dCompiler_dDriver_dCompile_dcollectClean reads)))))))

# 1812 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downCleanModules = (fun ctx depTbl -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_downCleanInfo ctx) depTbl)) (fun info -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dPair.v_Base_dPair_dsecondOf info)))))

# 168 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts = (fun ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx)) (fun depIfaces -> (match depIfaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__168) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) (fun depTbl -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) depTbl)) (fun clean -> ((fun _u -> ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectWithIfaces ctx) entry) printResult) dtb__168)) (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__169) -> (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__169)))) else 0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts ctx) entry) printResult)
  | _ -> failwith "DT: impossible branch"
))))

# 1675 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts = (fun wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx)) (fun depIfaces -> (match depIfaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts ctx) entry)) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__170) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) (fun depTbl -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) depTbl)) (fun clean -> (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> ((fun cleanReal -> ((fun _u -> ((fun _u -> ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageIncrementalParts ctx) entry) dtb__170) cleanReal)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength cleanReal)))) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))) (if wantWarnings then Base_dList.C_Base_dList_dList_Nil else dtb__171))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithIfacesParts ctx) entry) dtb__170)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 1820 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty = (fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) (fun depTbl -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) depTbl)) (fun clean -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__172) -> dtb__172
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))))

# 1456 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIfaceCold = (fun ctx checked name si -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty ctx)) (fun clean -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) (fun depTbl -> ((fun miResult -> (match miResult with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__173) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__173)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__174) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded ctx) dtb__174)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__174)))))
  | _ -> failwith "DT: impossible branch"
)) (((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfModule (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) si) depTbl) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited) clean) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) name)))))))

# 1890 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos = (fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun root -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root))) (fun paths -> ((v_Vuna_dCompiler_dDriver_dCompile_dmapEff (fun p -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath p)) (fun abs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) abs))) (fun raw -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) abs))) (fun mtime -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) abs))) (fun size -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) p); Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siPath = abs; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest raw); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siMtime = mtime; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dSourceInfo_siSize = size } }))))))))))) paths))))) ((Base_dList.v_Base_dList_dfilter (fun r -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName r) = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)))) (fun walked -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Base_dList.v_Base_dList_dconcatMap (fun xs -> xs)) walked)))))

# 1908 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dresyncCleanSources = (fun sources clean -> ((Base_dList.v_Base_dList_dmap (fun m -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m)) sources) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__175) -> { Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miName = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPackage = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miSource = dtb__175; Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miIfaceHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplHash = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImplHashOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDepHashes = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImports = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miImplicitImports = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miExports = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miFixities = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDecls = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miRecords = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miPrepared = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miCached = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf m); Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dModuleIface_miDefLocs = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf m) }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))) clean))

# 1922 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dshadowAllowed = (fun ctx -> (match (ctx).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackageContext_contextPackage with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__176) -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports dtb__176) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__177) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1985 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__178, dtb__179) -> (if ((Base_dList.v_Base_dList_dmemName (dtb__178).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName) mc1) then ((v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf dtb__179) mc1) else (Base_dList.C_Base_dList_dList_Cons ((dtb__178).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmName, ((v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf dtb__179) mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1994 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__180, dtb__181) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__180)) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects mc0) dtb__181)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__182) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff "iface") v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec) (dtb__182).f_Vuna_dCompiler_dDriver_dCompile_dClosureMod_cmAddr) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dencModuleIface dtb__180))) (fun bytes -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects mc0) dtb__181)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if (bytes > 0) then (n + 1) else n))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1929 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow = (fun ctx checked -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx) = "") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompile_dshadowAllowed ctx)) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun t0 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun t1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos ctx)) (fun sources -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun t2 -> ((fun depTbl -> ((fun own -> (match ((((((((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) sources) depTbl) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited) Base_dList.C_Base_dList_dList_Nil) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls) (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__183) -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=compute iface-skip " ^ (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText dtb__183))) else 0))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__184) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun t3 -> ((fun unwritten -> (if ((Base_dList.v_Base_dList_dlength unwritten) > 0) then ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-skip partial closure="; (bi_strFromInt (Base_dList.v_Base_dList_dlength own)); " covered="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__184)); " missing="; ((Base_dString.v_Base_dString_djoin ",") unwritten)])) else 0)) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteOrderEff (v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) dtb__184))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects own) dtb__184)) (fun n -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwritePkgIfaceSummaryEff ctx) dtb__184)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ()))))) (fun t4 -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__184)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["iface-write="; (bi_strFromInt n); "/"; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__184)); " closure="; (bi_strFromInt (Base_dList.v_Base_dList_dlength own)); " phases mods="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t1 - t0) / 1000)); "ms sources="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t2 - t1) / 1000)); "ms compute="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t3 - t2) / 1000)); "ms write="; (bi_strFromInt (if 1000 = 0 then failwith "division by zero" else (t4 - t3) / 1000)); "ms"])) else 0)))))))))))) ((v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf own) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) dtb__184)))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair) ((v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf ctx) mods)))))))))))))) (if (dtp_debug_on 0) then (dtp_debug_line "iface-shadow-start") else 0)))))

# 2008 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_IFACE_SELFTEST"))) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v = "1"))))

# 1858 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk = (fun m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested) (fun self -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if self then ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhashOfIface m) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m)) else true)))))

# 1418 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__185, dtb__186) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk dtb__185)) (fun selfOk -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh mc0) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__185))) (fun fresh -> (if (if (if (if (if fresh then (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__185)) else false) then selfOk else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__185))) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc1) mc3) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__185)) else false) then ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo mc0) mc1) dtb__186) (Base_dList.C_Base_dList_dList_Cons (dtb__185, mc3))) else ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo mc0) mc1) dtb__186) mc3))))) (if selfOk then 0 else (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=self-hash " ^ (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__185))) else 0)))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.v_Base_dList_dreverse mc3))
  | _ -> failwith "DT: impossible branch"
))

# 1401 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanOwnModules = (fun ctx tool builtSec exclude needed -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff ctx)) (fun mods -> ((fun cands -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff cands)) (fun ifs -> (match ifs with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__187) -> ((((v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo builtSec) (tool).f_Vuna_dCompiler_dDriver_dCompile_dToolContext_tcDepHashes) dtb__187) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dfilter ((v_Vuna_dCompiler_dDriver_dCompile_downCleanWanted needed) exclude)) ((v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf ctx) mods))))))

# 1829 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__188, dtb__189) -> ((fun pkgOrigin -> ((fun _u -> ((fun sameSource -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk dtb__188)) (fun selfOk -> ((fun _u -> ((fun keep -> (if keep then (((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo mc0) mc1) mc2) dtb__189) (Base_dList.C_Base_dList_dList_Cons (dtb__188, mc4))) else (((((v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo mc0) mc1) mc2) dtb__189) mc4))) (if (if (if (if (if pkgOrigin then sameSource else false) then (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__188)) else false) then selfOk else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__188))) else false) then (((v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk mc2) mc4) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf dtb__188)) else false))) (if selfOk then 0 else (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=self-hash " ^ (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__188))) else 0)))))) (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__188)) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__190) -> ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf dtb__190) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsiHashOf (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf dtb__188)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (if pkgOrigin then 0 else (if (dtp_debug_on 0) then (dtp_debug_line ("iface-reject=tool-origin " ^ (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__188))) else 0)))) (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__188)) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__191) -> (dtb__191 = "pkg")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })
  | _ -> failwith "DT: impossible branch"
))

# 2013 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__192, dtb__193) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__192) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__192))) else ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName dtb__193) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2018 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dallSelfHashesOk = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__194, dtb__195) -> (if ((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhashOfIface dtb__194) = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__194)) then (v_Vuna_dCompiler_dDriver_dCompile_dallSelfHashesOk dtb__195) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2022 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (match ((v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName mc1) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__196)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__198) -> (if (dtb__198 = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf dtb__196)) then ((v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes dtb__197) mc1) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 2029 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow = (fun ctx checked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) checked) (fun checkedR -> (match checkedR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__199) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__199)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__200) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow ctx) (Base_dPair.v_Base_dPair_dsecondOf dtb__200))) (fun shadow -> (match shadow with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__201) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__201)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__202) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__200))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

# 1701 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe = (fun ctx entry -> ((fun _u -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow ctx) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts ctx) entry))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0)))

# 1709 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCheckExe = (fun wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts wantWarnings) ctx) entry)) (fun summary -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts ctx) entry)) (fun full -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompare "check") entry) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf summary)) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf full)))) (fun compared -> (match compared with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__203) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__203)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__204) -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=check entry=" ^ entry)) else 0)))))))

# 1662 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe = (fun wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested) (fun full -> (if full then ((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe ctx) entry) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested) (fun audit -> (if audit then (((v_Vuna_dCompiler_dDriver_dCompile_dauditCheckExe wantWarnings) ctx) entry) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts wantWarnings) ctx) entry)) (fun summary -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary)))))))))))

# 2057 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts = (fun wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx)) (fun depIfaces -> (match depIfaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts ctx) names)) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__205) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable ctx)) (fun depTbl -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_downCleanModules ctx) depTbl)) (fun clean -> (match clean with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__206) -> ((fun cleanReal -> ((fun _u -> ((fun _u -> ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageIncrementalParts ctx) names) dtb__205) cleanReal)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-own-clean=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength cleanReal)))) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))) (if wantWarnings then Base_dList.C_Base_dList_dList_Nil else dtb__206))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun _u -> (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageWithIfacesParts ctx) names) dtb__205)) (if (dtp_debug_on 0) then (dtp_debug_line ("cache-path=summary deps=" ^ (bi_strFromInt (v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount ctx)))) else 0))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 2083 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib = (fun ctx names -> ((fun _u -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow ctx) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts ctx) names))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=full") else 0)))

# 2089 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCheckLib = (fun wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts wantWarnings) ctx) names)) (fun summary -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts ctx) names)) (fun full -> ((fun subject -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompare "check-lib") subject) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf summary)) (v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf full)))) (fun compared -> (match compared with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__207) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__207)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__208) -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=check-lib entry=" ^ subject)) else 0))) (v_Vuna_dCompiler_dDriver_dCompile_djoinLines names)))))))

# 2046 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib = (fun wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested) (fun full -> (if full then ((v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib ctx) names) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested) (fun audit -> (if audit then (((v_Vuna_dCompiler_dDriver_dCompile_dauditCheckLib wantWarnings) ctx) names) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts wantWarnings) ctx) names)) (fun summary -> ((v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow ctx) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) summary)))))))))))

# 2111 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema = "vuna-split-node 2"

# 2117 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec = "split-files 2"

# 2121 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff) (fun tag -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema; "/"; tag]))))

# 2127 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf = (fun ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcontextSources ctx) entry)) (fun sources -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff ctx)) (fun deps -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint) (fun fp -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf ctx)) (fun ifaces -> ((fun srcHash -> ((fun verHash -> ((fun prHash -> ((fun mode -> ((fun kind -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) kind) "") (v_Vuna_dCompiler_dDriver_dCompile_dhashText srcHash)) (v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash deps)) (v_Vuna_dCompiler_dDriver_dCompile_dhashText (verHash + prHash))) (v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf ctx)))) (String.concat "" [mode; ":"; (if printResult then "pr1" else "pr0")]))) (match ifaces with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__209) -> "s"
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "f"
  | _ -> failwith "DT: impossible branch"
))) (if printResult then 1 else 0))) ((v_Vuna_dCompiler_dDriver_dCompile_dtextHash (v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema ^ Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion)) + fp))) ((v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf sources) 0)))))))))))

# 2148 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath = (fun digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dcacheBase) (fun base -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [base; "/blobs/"; digest])))))

# 2155 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt = (fun digest files -> ((fun payload -> ((fun contentDigest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dcacheBase) (fun base -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff (base ^ "/blobs"))) (fun _u -> (((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreWriteIfChangedAsEff tag) v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec) contentDigest) path) payload)))))))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest payload))) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles) files)))

# 2169 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf = (fun m -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("split", (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))

# 2180 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind = "splitptr"

# 2183 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec = "split-pointer 1"

# 2186 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitPointer = (fun fast -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec) fast)) (fun saved -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match saved with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> (if (dtb__210 = "") then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

# 2194 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer = (fun fast sem -> ((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectWriteEff v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind) v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec) fast) sem))

# 2197 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_ddefLocLine = (fun ctx p -> (String.concat "" [(Base_dPair.v_Base_dPair_dfirstOf p); "|"; ((v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx) ^ "/")) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf p))); "|"; (bi_strFromInt (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p)))]))

# 2203 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dlayoutDigestOf = (fun ctx modules -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("split-layout", ((Base_dList.v_Base_dList_dconcatMap (fun m -> ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" [(Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m); "|"; ((v_Vuna_dCompiler_dDriver_dCompile_ddefLocLine ctx) p)]))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf m)))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dsortModuleIfaces modules))))))

# 2208 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf = (fun ctx printResult tag modules -> ((fun pkg -> ((fun pr -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("split-identity", (Base_dList.C_Base_dList_dList_Cons (v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema, (Base_dList.C_Base_dList_dList_Cons (pkg, (Base_dList.C_Base_dList_dList_Cons (pr, (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpkgIfaceHashOfModules pkg) modules), (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpkgImplHashOfModules pkg) modules), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dCompile_dlayoutDigestOf ctx) modules), (Base_dList.C_Base_dList_dList_Cons (tag, Base_dList.C_Base_dList_dList_Nil)))))))))))))))))) (if printResult then "1" else "0"))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

# 262 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dauditCompile = (fun ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf ctx) entry) printResult)) (fun mods -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts ctx) entry) printResult)) (fun summary -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts ctx) entry) printResult)) (fun full -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompare "compile") entry) (v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf summary)) (v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf full)))) (fun compared -> (match compared with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__211) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__211)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__212) -> (match summary with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__213) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__213)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__214) -> ((fun files -> ((fun checked -> ((fun canon -> ((fun fast -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow ctx) checked)) (fun shadow -> (match shadow with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__215) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__215)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__216) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff) (fun tag -> ((fun sem -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt sem) canon)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer fast) sem)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff ctx) (Base_dList.C_Base_dList_dList_Cons (fast, (Base_dList.C_Base_dList_dList_Cons (sem, Base_dList.C_Base_dList_dList_Nil)))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized ctx) outDir) canon)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__217) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__217))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__218) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__218; Base_dPair.f_Base_dPair_dPair_second = (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))))))))) (match dtb__216 with
  | Base_dList.C_Base_dList_dList_Nil -> fast
  | _ -> ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf ctx) printResult) tag) dtb__216)
))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf mods))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo files))) (Base_dPair.v_Base_dPair_dsecondOf dtb__214))) (Base_dPair.v_Base_dPair_dfirstOf dtb__214))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-audit subject=compile entry=" ^ entry)) else 0)))))))))

# 2218 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildViewAddrOf = (fun ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf ctx) entry) printResult)) (fun mods -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf mods)))))

# 2224 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckInOf = (fun m -> (Vuna_dCompiler_dAddr.v_Vuna_dCompiler_dAddr_daddrOf (Base_dList.C_Base_dList_dList_Cons ("check", (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmPkg, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmKind, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmManifest, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmSources, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmDeps, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmVer, (Base_dList.C_Base_dList_dList_Cons ((m).f_Vuna_dCompiler_dDriver_dCompile_dCheckMods_cmFlags, Base_dList.C_Base_dList_dList_Nil))))))))))))))))))

# 1587 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph = (fun ctx mods run -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested) (fun full -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested) (fun audit -> (if (if full then true else audit) then run else ((fun dig -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreObjectReadEff "check") Vuna_dCompiler_dDiag_dCodec.v_Vuna_dCompiler_dDiag_dCodec_dcheckResultCodec) dig)) (fun payload -> (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__219) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dCompile_drunAndStore ctx) dig) run)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> (match dtb__220 with
  | Vuna_dCompiler_dDiag_dCodec.C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckFailed (dtb__221) -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreplayFailure ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag ctx)) dtb__221)))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=hit") else 0))
  | Vuna_dCompiler_dDiag_dCodec.C_Vuna_dCompiler_dDiag_dCodec_dCheckOutcome_CheckPassed (dtb__222) -> ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag ctx)) dtb__222))))) (if (dtp_debug_on 0) then (dtp_debug_line "cache-path=hit") else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dDiag_dCodec.v_Vuna_dCompiler_dDiag_dCodec_ddecCheckOutcome dtb__219))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dCompile_drunAndStore ctx) dig) run)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dcheckInOf mods))))))))

# 1653 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe = (fun wantWarnings ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsExe ctx) entry)) (fun mods -> (if wantWarnings then (((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe wantWarnings) ctx) entry) else (((v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph ctx) mods) (((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe wantWarnings) ctx) entry))))))

# 2040 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib = (fun wantWarnings ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dcheckModsLib ctx) names)) (fun mods -> (if wantWarnings then (((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib wantWarnings) ctx) names) else (((v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph ctx) mods) (((v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib wantWarnings) ctx) names))))))

# 74 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage = (fun release wantWarnings pkg -> ((fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe wantWarnings) ctx) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (fun exeR -> (match exeR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__223) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__223)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__224) -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__224)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__225) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested) (fun full -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if full then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else ((v_Vuna_dCompiler_dDriver_dCompile_dorderCoversEff (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)) dtb__225))) (fun covered -> (if covered then ((fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__224)))) (if (dtp_debug_on 0) then (dtp_debug_line ("check-lib-skip covered=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__225)))) else 0)) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib false) ctx) dtb__225)) (fun libR -> (match libR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__226) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__226)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__227) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend dtb__224) dtb__227))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/vuna.toml")) 1) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_LibraryWithoutEntry ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228) -> (((v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib wantWarnings) ctx) dtb__228)
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease release) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))))

# 2230 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlob = (fun files -> ((fun payload -> ((fun digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dcacheBase) (fun base -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreEnsureDirEff (base ^ "/blobs"))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreWriteIfChangedAsEff tag) v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec) digest) path) payload)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) digest)))))))))))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest payload))) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles) files)))

# 2250 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob = (fun digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag) (fun tag -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath digest)) (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreReadEff tag) v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec) path)) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229) -> (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFilesComplete dtb__229)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))))))

# 215 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit = (fun ctx entry printResult outDir fast -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts ctx) entry) printResult)) (fun summary -> (match summary with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__230) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__230)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__231) -> ((fun canon -> ((fun checked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow ctx) checked)) (fun shadow -> (match shadow with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__232) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__232)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__233) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dcompilerTagEff) (fun tag -> ((fun sem -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob sem)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__234) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer fast) sem)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff ctx) (Base_dList.C_Base_dList_dList_Cons (fast, (Base_dList.C_Base_dList_dList_Cons (sem, Base_dList.C_Base_dList_dList_Nil)))))) (fun _u -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized ctx) outDir) dtb__234)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__235) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__235))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__236) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__236; Base_dPair.f_Base_dPair_dPair_second = (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-identity-hit cache-path=hit") else 0))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt sem) canon)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer fast) sem)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff ctx) (Base_dList.C_Base_dList_dList_Cons (fast, (Base_dList.C_Base_dList_dList_Cons (sem, Base_dList.C_Base_dList_dList_Nil)))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized ctx) outDir) canon)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__237) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__237))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__238) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__238; Base_dPair.f_Base_dPair_dPair_second = (checked).Vuna_dCompiler_dDriver_dDt.f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings }))
  | _ -> failwith "DT: impossible branch"
))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (match dtb__233 with
  | Base_dList.C_Base_dList_dList_Nil -> fast
  | _ -> ((((v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf ctx) printResult) tag) dtb__233)
))))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__231))) (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo (Base_dPair.v_Base_dPair_dfirstOf dtb__231)))
  | _ -> failwith "DT: impossible branch"
))))

# 190 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDirNormal = (fun ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf ctx) entry) printResult)) (fun mods -> ((fun fast -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadSplitPointer fast)) (fun ptr -> (match ptr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__239) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob dtb__239)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__240) -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized ctx) outDir) dtb__240)) (fun n -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match n with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__241) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__241))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__242) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__242; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "split-pointer-hit cache-path=hit") else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit ctx) entry) printResult) outDir) fast)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf mods)))))

# 151 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir = (fun ctx entry printResult outDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested) (fun audit -> (if audit then ((((v_Vuna_dCompiler_dDriver_dCompile_dauditCompile ctx) entry) printResult) outDir) else ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDirNormal ctx) entry) printResult) outDir)))))

# 353 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit = (fun dir outDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__243) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__243)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__244) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__244)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__244)) true) outDir)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__245) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__245))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__246) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__246)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 2266 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dpmModulesOfIface = (fun p -> (p).Vuna_dCompiler_dDriver_dIface.f_Vuna_dCompiler_dDriver_dIface_dPackageIface_piModules)

# 2269 "Vuna/Compiler/Driver/Compile.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> (if (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__247)) then (v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo dtb__248) else (String.concat "" [(Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__247); ":"; (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedProgramIssue (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__247))]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2263 "Vuna/Compiler/Driver/Compile.vuna"
let v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidModule = (fun p -> (v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo (v_Vuna_dCompiler_dDriver_dCompile_dpmModulesOfIface p)))
