open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dDt_dCheckedPackage = { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtProgram; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules : Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dModule Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dDt_dGenMeta = { f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaId : int; f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaName : string; f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaKind : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dDriver_dDt_dAuxCache = { f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheKey : string; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheStart : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc, (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDepCps : Vuna_dCompiler_dDriver_dCache.t_Vuna_dCompiler_dDriver_dCache_dCachedProgram Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheCleanCps : Vuna_dCompiler_dDriver_dCache.t_Vuna_dCompiler_dDriver_dCache_dCachedProgram Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls = (fun parts -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Base_dPair.v_Base_dPair_dfirstOf parts)))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoad = (fun ctx entry -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProject ctx) entry)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1) -> ((fun _u -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__1) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__3) -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__3)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dfirstOf dtb__3) }))) (if (dtp_debug_on 0) then (dtp_debug_line "resolve-done") else 0))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line "load-modules-done") else 0))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "load-start") else 0)))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck = (fun ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProject ctx) entry)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__4) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__4))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__5) -> ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__5)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesParts = (fun ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules ctx) names)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__6) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__6))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__7) -> ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__7)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_dsealSpan = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = "<seal>"; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 1 }

let rec v_Vuna_dCompiler_dDriver_dDt_dopaqueSigType = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__10, dtb__11, dtb__12, dtb__13) -> (if (dtb__10 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12)) else ((v_Vuna_dCompiler_dDriver_dDt_dopaqueSigType mc0) dtb__9))
  | _ -> ((v_Vuna_dCompiler_dDriver_dDt_dopaqueSigType mc0) dtb__9)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dsealDeclOf = (fun decls name -> ((fun ty -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (("vuna_seal_" ^ name), ty, v_Vuna_dCompiler_dDriver_dDt_dsealSpan))) (match ((v_Vuna_dCompiler_dDriver_dDt_dopaqueSigType name) decls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> dtb__14
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", v_Vuna_dCompiler_dDriver_dDt_dsealSpan))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (match dtb__15 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__17, dtb__18, dtb__19, dtb__20) -> (if ((Base_dList.v_Base_dList_dmemName dtb__17) mc1) then (Base_dList.C_Base_dList_dList_Cons (dtb__15, (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dDt_dsealDeclOf (Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16))) dtb__17), ((v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter dtb__16) mc1))))) else (Base_dList.C_Base_dList_dList_Cons (dtb__15, ((v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter dtb__16) mc1))))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__15, ((v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter dtb__16) mc1)))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dsealModule = (fun m -> ((fun decls -> ((fun names -> ((fun abstracts -> ((fun opaques -> ((fun body -> ((Base_dList.v_Base_dList_dappend body) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dDt_dsealDeclOf decls)) opaques))) ((v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter decls) abstracts))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName) ((Base_dList.v_Base_dList_dfilter (fun n -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_disAbstractOpaqueName n)))) names)))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName) ((Base_dList.v_Base_dList_dfilter Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_disAbstractOpaqueName) names)))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleOpaqueOf m))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m)))

let v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls = (fun modules entryDecls -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_dsealModule) (Base_dList.v_Base_dList_dreverse modules))) entryDecls))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram = (fun pkg loaded -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) loaded) (fun loadedR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match loadedR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__21) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__21))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__22) -> ((fun parts -> ((fun loaderWarns -> ((fun decls -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__23) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__23))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__24) -> ((fun _u -> ((fun warns -> (match (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas dtb__24); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__24) }) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__25) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__25))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__26) -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = warns; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = dtb__24; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns } }))) (if (dtp_debug_on 0) then (dtp_debug_line "codegen-check-done") else 0))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__24)))) (if (dtp_debug_on 0) then (dtp_debug_line "elab-done") else 0))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls (Base_dPair.v_Base_dPair_dsecondOf parts)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__22))) (Base_dPair.v_Base_dPair_dsecondOf dtb__22))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts = (fun ctx entry -> ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck ctx) entry)))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts = (fun ctx names -> ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesParts ctx) names)))

let v_Vuna_dCompiler_dDriver_dDt_ddtFileHasModuleHeader = (fun path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun text -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath path) text)) (fun parsed -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__27) -> (match dtb__27 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__28; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__29; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__30; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__31; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__32; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__33; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__34 } -> (match dtb__28 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) parsed)))))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSource = (fun ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource ctx) label) source)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__36) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__36))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__37) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__37) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__38) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__38))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__39) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__39))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__39)))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__40) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__40))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__41) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__39)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__41))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__42) <> mc0) then (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__42)) mc2)) false) else false) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__42), (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules mc0) dtb__43) mc2))) else (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules mc0) dtb__43) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dallocMetas = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc0) mc1) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocMetas mc0) dtb__47) dtb__45) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = dtb__49 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__48)); Base_dPair.f_Base_dPair_dPair_second = dtb__49 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dbuildPi = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, dtb__50, ((v_Vuna_dCompiler_dDriver_dDt_dbuildPi dtb__51) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dallocTelescopes = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match dtb__52 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__54; Base_dPair.f_Base_dPair_dPair_second = dtb__55 } -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocMetas mc0) mc1) ((Base_dList.v_Base_dList_drange 0) dtb__55)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__56; Base_dPair.f_Base_dPair_dPair_second = dtb__57 } -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocMetas mc0) dtb__57) ((Base_dList.v_Base_dList_drange 0) 1)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__58; Base_dPair.f_Base_dPair_dPair_second = dtb__59 } -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__61 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocTelescopes mc0) dtb__59) dtb__53) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__62; Base_dPair.f_Base_dPair_dPair_second = dtb__63 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__54; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dDt_dbuildPi dtb__56) dtb__60) }, dtb__62)); Base_dPair.f_Base_dPair_dPair_second = dtb__63 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = dtb__59 }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = dtb__59 }
)) dtb__58)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dfindDtDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__64) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64)) else ((v_Vuna_dCompiler_dDriver_dDt_dfindDtDef mc0) dtb__65))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dloadReplDecls = (fun ctx source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) "<repl>") source)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__66) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__66))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__67) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__67) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__68) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__68))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__69) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__69))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtBindingTypes = (fun ctx program -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dDt_dloadReplDecls ctx) program)) (fun declsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match declsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__70) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__70))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__71) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull dtb__71) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__72) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__72))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__73) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_decOfProgram dtb__73) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__74; Base_dPair.f_Base_dPair_dPair_second = dtb__75 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__74) 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__73))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDriver_dDt_dpickFreshName = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> ((fun cand -> (if ((Base_dList.v_Base_dList_dmemName cand) mc1) then (((v_Vuna_dCompiler_dDriver_dDt_dpickFreshName mc0) mc1) dtb__77) else cand)) (if (dtb__76 = 0) then mc0 else (String.concat "" [mc0; "_"; (bi_strFromInt dtb__76)])))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dfreshMetaName = (fun base taken -> (((v_Vuna_dCompiler_dDriver_dDt_dpickFreshName base) taken) (Base_dList.C_Base_dList_dList_Cons (0, ((Base_dList.v_Base_dList_drange 1) 64)))))

let rec v_Vuna_dCompiler_dDriver_dDt_dsubstGenMetas = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> ((((v_Vuna_dCompiler_dDriver_dDt_dsubstGenMetas ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar (dtb__78).f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaId) (dtb__78).f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaName) ((mc2 + 1) - mc3)) mc0)) dtb__79) (mc2 + 1)) mc3)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dwrapGenMetas = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((dtb__80).f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaName, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (dtb__80).f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaKind, ((v_Vuna_dCompiler_dDriver_dDt_dwrapGenMetas dtb__81) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dkindArrows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (v_Vuna_dCompiler_dDriver_dDt_dkindArrows dtb__83)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dkindOfArity = (fun k -> (v_Vuna_dCompiler_dDriver_dDt_dkindArrows ((Base_dList.v_Base_dList_drange 0) k)))

let rec v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__84, dtb__85, dtb__86) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__84)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__85)) (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__86)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__87, dtb__88) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__87)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfAlt) dtb__88))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__89, dtb__90) -> (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfArgs dtb__90)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__91, dtb__92, dtb__93) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__91)) (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__92))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__94, dtb__95, dtb__96) -> (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__96)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__100)) (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__101))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__102) -> (Base_dList.C_Base_dList_dList_Cons (dtb__102, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))
and v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (match dtb__103 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__105; Base_dPair.f_Base_dPair_dPair_second = dtb__106 } -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__105)) (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfArgs dtb__104))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfAlt = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__107; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__108; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__109 } -> (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__109)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_ddedupInts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmemMetaId dtb__110) dtb__111) then (v_Vuna_dCompiler_dDriver_dDt_ddedupInts dtb__111) else (Base_dList.C_Base_dList_dList_Cons (dtb__110, (v_Vuna_dCompiler_dDriver_dDt_ddedupInts dtb__111))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dheadIsMeta = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__112) -> (mc0 = dtb__112)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__113, dtb__114, dtb__115) -> ((v_Vuna_dCompiler_dDriver_dDt_dheadIsMeta mc0) dtb__113)
  | _ -> false
))

let rec v_Vuna_dCompiler_dDriver_dDt_dspineLen = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__116, dtb__117, dtb__118) -> (1 + (v_Vuna_dCompiler_dDriver_dDt_dspineLen dtb__116))
  | _ -> 0
))

let v_Vuna_dCompiler_dDriver_dDt_dapplyArity = (fun m t -> (if ((v_Vuna_dCompiler_dDriver_dDt_dheadIsMeta m) t) then (v_Vuna_dCompiler_dDriver_dDt_dspineLen t) else 0))

let v_Vuna_dCompiler_dDriver_dDt_dimax = (fun a b -> (if (a >= b) then a else b))

let rec v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__119, dtb__120, dtb__121) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__119)) ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__120)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__121)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__122, dtb__123) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__122)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityAlts mc0) dtb__123))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__124, dtb__125) -> ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityArgs mc0) dtb__125)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__126, dtb__127, dtb__128) -> ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__128)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__132)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__133))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__134, dtb__135, dtb__136) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dapplyArity mc0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__134, dtb__135, dtb__136)))) ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__134)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__135)))
  | _ -> 0
))
and v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (match dtb__137 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__139; Base_dPair.f_Base_dPair_dPair_second = dtb__140 } -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__139)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityArgs mc0) dtb__138))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__141))) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityAlts mc0) dtb__142))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dbuildGenMetas = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> ((fun name -> ((fun kind -> (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaId = dtb__143; f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaName = name; f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaKind = kind }, ((((v_Vuna_dCompiler_dDriver_dDt_dbuildGenMetas dtb__144) (Base_dList.C_Base_dList_dList_Cons (name, mc1))) (mc2 + 1)) mc3)))) (v_Vuna_dCompiler_dDriver_dDt_dkindOfArity ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity dtb__143) mc3)))) ((v_Vuna_dCompiler_dDriver_dDt_dfreshMetaName ("t" ^ (bi_strFromInt mc2))) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dlistLen = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (1 + (v_Vuna_dCompiler_dDriver_dDt_dlistLen dtb__146))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dfindArity = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match dtb__147 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__149, dtb__150, dtb__151, dtb__152) -> (if (dtb__149 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dDriver_dDt_dlistLen dtb__150))) else ((v_Vuna_dCompiler_dDriver_dDt_dfindArity mc0) dtb__148))
  | _ -> ((v_Vuna_dCompiler_dDriver_dDt_dfindArity mc0) dtb__148)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_daritiesOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfindArity dtb__153) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["\232\135\170\229\138\168\231\173\190\229\144\141: \230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 "; dtb__153; "\239\188\136\233\156\128\232\166\129 DFun\239\188\137"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dDt_daritiesOf dtb__154) mc1)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__153; Base_dPair.f_Base_dPair_dPair_second = dtb__155 }, more))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dgeneralizeSignature = (fun ty taken -> ((fun metas -> (if ((Base_dList.v_Base_dList_dlength metas) = 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig ty))) else (if ((Base_dList.v_Base_dList_dlength metas) > 8) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr "\232\135\170\229\138\168\230\142\168\230\150\173\229\135\186\231\154\132\231\177\187\229\158\139\229\143\130\230\149\176\232\182\133\232\191\135 8 \228\184\170\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else ((fun entries -> ((fun total -> ((fun body -> ((fun sigText -> (if ((Base_dString.v_Base_dString_dcontains "?") sigText) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr "\232\135\170\229\138\168\230\142\168\230\150\173\231\154\132\231\173\190\229\144\141\228\187\141\229\144\171\230\156\170\232\167\163\229\133\131\229\143\152\233\135\143\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sigText)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig ((v_Vuna_dCompiler_dDriver_dDt_dwrapGenMetas entries) body)))) ((((v_Vuna_dCompiler_dDriver_dDt_dsubstGenMetas ty) entries) 0) total))) (v_Vuna_dCompiler_dDriver_dDt_dlistLen entries))) ((((v_Vuna_dCompiler_dDriver_dDt_dbuildGenMetas metas) taken) 0) ty))))) (v_Vuna_dCompiler_dDriver_dDt_ddedupInts (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf ty))))

let rec v_Vuna_dCompiler_dDriver_dDt_dinferEachType = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfindDtDef dtb__156) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs mc1)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr ("\232\135\170\229\138\168\231\173\190\229\144\141: \231\178\190\229\140\150\231\187\147\230\158\156\233\135\140\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 " ^ dtb__156))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__158) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dDt_dgeneralizeSignature (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm mc2) 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__158))) mc3)) (fun sigText -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dDriver_dDt_dinferEachType dtb__157) mc1) mc2) mc3)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__156; Base_dPair.f_Base_dPair_dPair_second = sigText }, more))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddtInferDefTypes = (fun ctx program targets defSource -> (if ((Base_dList.v_Base_dList_dlength targets) = 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__159) -> (match dtb__159 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__160; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__161; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__162; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__163; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__164; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__165; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__166 } -> (match dtb__160 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr "\232\135\170\229\138\168\231\173\190\229\144\141\228\184\141\230\148\175\230\140\129\230\168\161\229\157\151\230\150\135\228\187\182"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dDt_daritiesOf targets) dtb__163) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__168) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__168)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__169) -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocTelescopes Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) dtb__169) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__170; Base_dPair.f_Base_dPair_dPair_second = dtb__171 } -> ((fun startGlobals -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dDt_dloadReplDecls ctx) (String.concat "" [program; "\n"; defSource; "\n"]))) (fun allDeclsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match allDeclsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__172) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__172))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__173) -> (match (((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith dtb__171) startGlobals) dtb__173) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__174) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__174))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__175) -> ((fun taken -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_decOfProgram dtb__175) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__176; Base_dPair.f_Base_dPair_dPair_second = dtb__177 } -> ((((v_Vuna_dCompiler_dDriver_dDt_dinferEachType targets) dtb__175) dtb__176) taken)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtopNames dtb__173))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dappend dtb__170) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__178) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__178)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dFrontend_dParser.v_Vuna_dCompiler_dFrontend_dParser_dparseSource "<repl>") defSource))))

let v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSource = (fun ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource ctx) label) source)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__179) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__179))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__180) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__180) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__181) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__181))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__182) -> (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__182)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSourceTolerant = (fun ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource ctx) label) source)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__183) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__183))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__184) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__184) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__185) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__185))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__186) -> (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgramTolerant (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__186)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_dmainKindForName = (fun g -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Int")) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Nat")) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("String")) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Bool")) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Other")))))))

let v_Vuna_dCompiler_dDriver_dDt_dreplExprName = "vuna_repl_expr"

let v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr = (fun decls -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__187, dtb__188) -> (match dtb__187 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__189, dtb__190, dtb__191, dtb__192) -> (if (dtb__189 = v_Vuna_dCompiler_dDriver_dDt_dreplExprName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse dtb__188); Base_dPair.f_Base_dPair_dPair_second = dtb__191 })) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "REPL expression definition is not last"))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "REPL expression was not parsed as a definition")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "REPL expression was not parsed as a definition")
)) (Base_dList.v_Base_dList_dreverse decls)))

let v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull = (fun ctx program exprSource -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) "<repl>") (String.concat "" [program; "\n"; v_Vuna_dCompiler_dDriver_dDt_dreplExprName; " = "; exprSource; "\n"]))) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__193) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__193))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__194) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__194) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__195) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__195))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__196) -> (match (v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__196))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__196)))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__197) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__197))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__198) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull (Base_dPair.v_Base_dPair_dfirstOf dtb__198)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__199) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__199))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__200) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__200; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__198) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExpr = (fun ctx program exprSource -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull ctx) program) exprSource)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__201) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__201))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__202) -> ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn (Base_dPair.v_Base_dPair_dfirstOf dtb__202)) (Base_dPair.v_Base_dPair_dsecondOf dtb__202))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfo = (fun ctx program exprSource -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull ctx) program) exprSource)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__203) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__203))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__204) -> ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo (Base_dPair.v_Base_dPair_dfirstOf dtb__204)) (Base_dPair.v_Base_dPair_dsecondOf dtb__204))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_dinterpMainShow = (fun table sols mainVal -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) table)) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName, (Base_dList.C_Base_dList_dList_Cons (mainVal, Base_dList.C_Base_dList_dList_Nil))))))) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__205) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__205))
  | _ -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_MainNotValue)
))

let v_Vuna_dCompiler_dDriver_dDt_disNilRowTermDt = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__206, dtb__207) -> (match dtb__207 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__206 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__208) -> (dtb__208 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

let v_Vuna_dCompiler_dDriver_dDt_dmainActionKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__209, dtb__210, dtb__211) -> (match dtb__209 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__212, dtb__213, dtb__214) -> (match dtb__212 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__215) -> (if (dtb__215 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then (if (v_Vuna_dCompiler_dDriver_dDt_disNilRowTermDt dtb__213) then "Eff" else "") else "")
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

let rec v_Vuna_dCompiler_dDriver_dDt_dfindMainDef = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__216, dtb__217) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__216) = "main") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__216)) else (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef dtb__217))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_ddefTableOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__218, dtb__219) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__218) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__218); Base_dPair.f_Base_dPair_dPair_second = dtb__220 }, (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf dtb__219)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf dtb__219)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddtMainKind = (fun ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dDt_ddtLoad ctx) entry)) (fun declsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match declsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__221) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__221))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__222) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgram (Base_dPair.v_Base_dPair_dfirstOf dtb__222)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__223) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__223))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__224) -> (match (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef (Base_dPair.v_Base_dPair_dsecondOf dtb__224)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_NoMain)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__225) -> (if ((v_Vuna_dCompiler_dDriver_dDt_dmainActionKind (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__225)) = "Eff") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Eff")) else (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf (Base_dPair.v_Base_dPair_dsecondOf dtb__224)))) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__225))) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__226) -> (match dtb__226 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__227, dtb__228) -> (match dtb__228 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dDt_dmainKindForName dtb__227)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Other"))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Other"))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Other"))
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_devalDtMainCore = (fun program -> (match (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs program)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_NoMain)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229) -> ((fun table -> ((fun sols -> ((fun mainVal -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dDriver_dDt_dmainActionKind (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__229)) = "")) then (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_InterpCannotExecuteEffects) else (match mainVal with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__230) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((bi_strFromInt dtb__230)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__231) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mainVal)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__232) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mainVal)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__233) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__233))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__234, dtb__235) -> (match (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnatValueToInt mainVal) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__236) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((bi_strFromInt dtb__236)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dDt_dinterpMainShow table) sols) mainVal)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dDriver_dDt_dinterpMainShow table) sols) mainVal)
))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) table)) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("main", Base_dList.C_Base_dList_dList_Nil))))))) ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) (program).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals))) (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs program)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_devalDtMain = (fun program -> (v_Vuna_dCompiler_dDriver_dDt_devalDtMainCore program))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalFile = (fun ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck ctx) entry)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__237) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__237))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__238) -> ((fun parts -> ((fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) v_Vuna_dCompiler_dDriver_dDt_devalDtMain)) ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls (Base_dPair.v_Base_dPair_dsecondOf parts)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__238))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadParts = (fun ctx entry -> ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck ctx) entry))

let v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOne = (fun cp -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp))))))))

let v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf = (fun progs -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOne) progs))

let rec v_Vuna_dCompiler_dDriver_dDt_dmaxMetaList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__239, dtb__240) -> ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaList (if (dtb__239 > mc0) then dtb__239 else mc0)) dtb__240)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dmaxMetaDef = (fun m d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241) -> ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaList m) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__241))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCached = (fun m cp -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dDriver_dDt_dmaxMetaDef) m) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp)))

let v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCps = (fun cps -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCached) (0 - 1)) cps))

let v_Vuna_dCompiler_dDriver_dDt_dcleanStartNext = (fun cps -> ((fun m -> (if (m < 0) then 0 else (m + 1))) (v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCps cps)))

let rec v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__242, dtb__243) -> ((fun k -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) k) mc2) then ((((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo mc0) dtb__243) mc2) mc3) else ((((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo mc0) dtb__243) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) k) true) mc2)) (Base_dList.C_Base_dList_dList_Cons (dtb__242, mc3))))) (mc0 dtb__242))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast = (fun key xs -> ((((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo key) (Base_dList.v_Base_dList_dreverse xs)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dDriver_dDt_ddedupDefs = (fun ds -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) ds))

let rec v_Vuna_dCompiler_dDriver_dDt_dbodyPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__244, dtb__245) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__244) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__246) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__244); Base_dPair.f_Base_dPair_dPair_second = dtb__246 }, (v_Vuna_dCompiler_dDriver_dDt_dbodyPairs dtb__245)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_dbodyPairs dtb__245)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddedupDefBodies = (fun ds -> (v_Vuna_dCompiler_dDriver_dDt_dbodyPairs (v_Vuna_dCompiler_dDriver_dDt_ddedupDefs ds)))

let v_Vuna_dCompiler_dDriver_dDt_ddedupDatas = (fun ds -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) ds))

let v_Vuna_dCompiler_dDriver_dDt_ddedupInsts = (fun ds -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) ds))

let v_Vuna_dCompiler_dDriver_dDt_ddedupClasses = (fun ds -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) ds))

let v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals = (fun gs -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast (fun g -> (Base_dPair.v_Base_dPair_dfirstOf g))) gs))

let v_Vuna_dCompiler_dDriver_dDt_ddepStartOfAt = (fun next progs -> ((fun datas -> ((fun dataKeys -> ((fun defGlobals -> ((fun globals -> ((fun opaqueNames -> ((fun bodies -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> { Base_dPair.f_Base_dPair_dPair_first = ec6; Base_dPair.f_Base_dPair_dPair_second = globals }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl ec5) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec4) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) globals)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutNext ec3) next))) ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ec2) (v_Vuna_dCompiler_dDriver_dDt_ddedupClasses ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses) progs))))) ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ec1) (v_Vuna_dCompiler_dDriver_dDt_ddedupInsts ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts) progs))))) ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ec0) datas))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty)) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName (Base_dPair.v_Base_dPair_dfirstOf p)) opaqueNames)))) (v_Vuna_dCompiler_dDriver_dDt_ddedupDefBodies ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) progs))))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOpaqueOf) progs)))) ((Base_dList.v_Base_dList_dappend defGlobals) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind d) })) datas)))) ((Base_dList.v_Base_dList_dfilter (fun p -> (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) ((Base_dList.v_Base_dList_dmemName (Base_dPair.v_Base_dPair_dfirstOf p)) dataKeys)) false))) (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals) progs)))))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas)) ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas)))) (v_Vuna_dCompiler_dDriver_dDt_ddedupDatas ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) progs))))

let v_Vuna_dCompiler_dDriver_dDt_ddepStartOf = (fun progs -> ((v_Vuna_dCompiler_dDriver_dDt_ddepStartOfAt 0) progs))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts = (fun ctx resolved deps -> ((fun parts -> ((fun loaderWarns -> ((fun pkgName -> ((fun modules -> ((fun ours -> ((fun depsOnly -> ((fun decls -> ((fun termAux -> ((fun start -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux (Base_dPair.v_Base_dPair_dfirstOf start)) (Base_dPair.v_Base_dPair_dsecondOf start)) termAux) decls)) (fun prog -> ((fun allDatas -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram { Base_dPair.f_Base_dPair_dPair_first = allDatas; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog) })) (fun _u -> ((fun warns -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = warns; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = prog; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = (v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf deps); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns } }))) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog)))))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) deps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))))) (v_Vuna_dCompiler_dDriver_dDt_ddepStartOf deps))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) depsOnly))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) ours)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkgName))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkgName))) modules))) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))) (Base_dPair.v_Base_dPair_dfirstOf resolved))) (Base_dPair.v_Base_dPair_dsecondOf resolved)))

let rec v_Vuna_dCompiler_dDriver_dDt_dinsertName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> (if (mc0 <= dtb__247) then (Base_dList.C_Base_dList_dList_Cons (mc0, (Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248)))) else (Base_dList.C_Base_dList_dList_Cons (dtb__247, ((v_Vuna_dCompiler_dDriver_dDt_dinsertName mc0) dtb__248))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dsortNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__249, dtb__250) -> ((v_Vuna_dCompiler_dDriver_dDt_dinsertName dtb__249) (v_Vuna_dCompiler_dDriver_dDt_dsortNames dtb__250))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__251, dtb__252) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo dtb__252) (Base_dList.C_Base_dList_dList_Cons (dtb__251, mc1)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__253, dtb__254) -> (if (dtb__251 = dtb__253) then ((v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo dtb__252) mc1) else ((v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo dtb__252) (Base_dList.C_Base_dList_dList_Cons (dtb__251, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddedupSortedNames = (fun xs -> (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo xs) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dDriver_dDt_dnameSlotTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__255, dtb__256) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = mc1 }, ((v_Vuna_dCompiler_dDriver_dDt_dnameSlotTbl dtb__256) (mc1 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dshiftedDepProgramsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__257, dtb__258) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__257)) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("iface: dependency module missing from shift table: " ^ (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__257)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__259) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram ((dtb__259 + 1) * Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dsummaryMetaSegment)) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__257))) (fun cp -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dDt_dshiftedDepProgramsGo mc0) dtb__258)) (fun rest2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (cp, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms = (fun ifaces -> ((fun names -> (if ((Base_dList.v_Base_dList_dlength names) <> (Base_dList.v_Base_dList_dlength ifaces)) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "iface: duplicate dependency module name") else ((v_Vuna_dCompiler_dDriver_dDt_dshiftedDepProgramsGo ((v_Vuna_dCompiler_dDriver_dDt_dnameSlotTbl names) 0)) ifaces))) (v_Vuna_dCompiler_dDriver_dDt_ddedupSortedNames (v_Vuna_dCompiler_dDriver_dDt_dsortNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) ifaces)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtPrepareTermAux = (fun aux -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls aux)) (fun p -> (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings (Base_dPair.v_Base_dPair_dsecondOf p)))))

let rec v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__260, dtb__261) -> (match dtb__260 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__262, dtb__263, dtb__264, dtb__265) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef { Base_dPair.f_Base_dPair_dPair_first = dtb__262; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = dtb__264 }, Base_dList.C_Base_dList_dList_Nil)) }) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__266) -> (Base_dList.C_Base_dList_dList_Cons (dtb__260, (v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination dtb__261)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination dtb__261)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__260, (v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination dtb__261)))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddtElabFullWithPrepared = (fun startEc startGlobals termAux preparedAux decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances startGlobals) decls))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__267; Base_dPair.f_Base_dPair_dPair_second = dtb__268 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__268)) (fun ds2 -> (((((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) dtb__267) (v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination preparedAux)) ds2)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dDt_dauxKeyOne = (fun m -> (String.concat "" [(Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m); ":"; (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m)]))

let v_Vuna_dCompiler_dDriver_dDt_ddtAuxKey = (fun pkg deps clean -> (bi_strFromInt (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" ["aux|"; pkg; "|"; ((Base_dString.v_Base_dString_djoin ";") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dauxKeyOne) deps)); "|"; ((Base_dString.v_Base_dString_djoin ";") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dauxKeyOne) clean))]))))

let v_Vuna_dCompiler_dDriver_dDt_ddtAuxOfCache = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__269) -> (if ((dtb__269).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheKey = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__269)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dreplCheckPartsAux = (fun start pkgName deps parts ifaces cache -> ((fun modules -> ((fun depsOnly -> ((fun oursOnly -> ((fun termAux -> ((fun ownDecls -> ((fun sourceDecls -> ((fun key -> ((fun cacheable -> ((fun cachedDecls -> ((fun prepared -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind prepared) (fun preparedAux -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr sourceDecls)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dDriver_dDt_ddtElabFullWithPrepared (Base_dPair.v_Base_dPair_dfirstOf start)) (Base_dPair.v_Base_dPair_dsecondOf start)) termAux) preparedAux) (Base_dPair.v_Base_dPair_dfirstOf p))) (fun prog -> ((fun depDatas -> ((fun depDefs -> ((fun depGlobals -> ((fun assembled -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = assembled; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) }; Base_dPair.f_Base_dPair_dPair_second = (if cacheable then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheKey = key; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls = preparedAux; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheStart = { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDepCps = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheCleanCps = Base_dList.C_Base_dList_dList_Nil })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) }))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = ((Base_dList.v_Base_dList_dappend depDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = ((Base_dList.v_Base_dList_dappend depDefs) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals ((Base_dList.v_Base_dList_dappend depGlobals) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog) })) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals) deps))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) deps))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) deps))))))))) (match cachedDecls with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__270) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__270).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_ddtPrepareTermAux termAux)
  | _ -> failwith "DT: impossible branch"
))) (if cacheable then ((v_Vuna_dCompiler_dDriver_dDt_ddtAuxOfCache key) cache) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) ((Base_dList.v_Base_dList_dlength ifaces) > 0))) (((v_Vuna_dCompiler_dDriver_dDt_ddtAuxKey pkgName) ifaces) Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend ownDecls) (Base_dPair.v_Base_dPair_dfirstOf parts)))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) oursOnly))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) depsOnly))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkgName))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkgName))) modules))) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts))))

let v_Vuna_dCompiler_dDriver_dDt_dreplCheckParts = (fun start pkgName deps parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dDriver_dDt_dreplCheckPartsAux start) pkgName) deps) parts) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun r -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf r))))))

let v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackage = (fun loaderWarns depCps cleanCps prog parts next -> ((fun assembled -> ((fun warns -> ((fun checked -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas assembled); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs assembled) })) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (checked)); Base_dPair.f_Base_dPair_dPair_second = next }))))) { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = assembled; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = (v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf depCps); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns })) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog) }))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckScoped = (fun allDatas unitDatas defs -> ((fun program -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram program)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__271; Base_dPair.f_Base_dPair_dPair_second = dtb__272 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas allDatas))) Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dnoQual) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas allDatas)) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas unitDatas)) dtb__272)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))))
  | _ -> failwith "DT: impossible branch"
)))) { Base_dPair.f_Base_dPair_dPair_first = allDatas; Base_dPair.f_Base_dPair_dPair_second = defs }))

let v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackageScoped = (fun loaderWarns depCps cleanCps prog parts next -> ((fun assembled -> ((fun warns -> ((fun checked -> ((fun allDatas -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckScoped allDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (checked)); Base_dPair.f_Base_dPair_dPair_second = next }))))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))) { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = assembled; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = (v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf depCps); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns })) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog) }))

let v_Vuna_dCompiler_dDriver_dDt_ddtFinishScoped = (fun depCps cleanCps prog cache -> ((fun allDatas -> ((fun newDatas -> ((fun newDefs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckScoped allDatas) newDatas) newDefs)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = cache }))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalCheckedCore = (fun ctx resolved depIfaces cleanIfaces cache needPackage -> ((fun parts -> ((fun loaderWarns -> ((fun pkgName -> ((fun modules -> ((fun ours -> ((fun depsOnly -> ((fun cleanNames -> ((fun dirtyOurs -> ((fun decls -> ((fun termAux -> ((fun key -> ((fun cacheable -> ((fun hit -> ((fun depCpsR -> ((fun ifacePrepared -> ((fun missingPrepared -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind depCpsR) (fun depCps -> ((fun cleanCps -> ((fun start -> ((fun prepared -> ((fun startGlobals -> ((fun startEc -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind prepared) (fun preparedAux -> ((fun next -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dDriver_dDt_ddtElabFullWithPrepared startEc) startGlobals) termAux) preparedAux) decls)) (fun prog -> ((fun warns -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (if needPackage then ((((((v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackageScoped loaderWarns) depCps) cleanCps) prog) parts) next) else ((((v_Vuna_dCompiler_dDriver_dDt_ddtFinishScoped depCps) cleanCps) prog) next))) (fun r -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = warns; Base_dPair.f_Base_dPair_dPair_second = r }))))) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog)))))) (if cacheable then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheKey = key; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls = preparedAux; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheStart = start; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDepCps = depCps; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheCleanCps = cleanCps })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))) (Base_dPair.v_Base_dPair_dfirstOf start))) (Base_dPair.v_Base_dPair_dsecondOf start))) (match hit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__273) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__273).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if ((Base_dList.v_Base_dList_dlength ifacePrepared) > 0) then ((Base_dList.v_Base_dList_dlength missingPrepared) = 0) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ifacePrepared)) else (v_Vuna_dCompiler_dDriver_dDt_ddtPrepareTermAux termAux))
  | _ -> failwith "DT: impossible branch"
))) (match hit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274) -> (dtb__274).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheStart
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dDt_ddepStartOfAt (v_Vuna_dCompiler_dDriver_dDt_dcleanStartNext cleanCps)) ((Base_dList.v_Base_dList_dappend depCps) cleanCps))
  | _ -> failwith "DT: impossible branch"
))) (match hit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__275) -> (dtb__275).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheCleanCps
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf) cleanIfaces)
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dfilter (fun mi -> ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf mi)) = 0))) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces)))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces)))) (match hit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__276) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__276).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDepCps))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms depIfaces)
  | _ -> failwith "DT: impossible branch"
))) (if cacheable then ((v_Vuna_dCompiler_dDriver_dDt_ddtAuxOfCache key) cache) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) ((bi_natAdd (Base_dList.v_Base_dList_dlength depIfaces) (Base_dList.v_Base_dList_dlength cleanIfaces)) > 0))) (((v_Vuna_dCompiler_dDriver_dDt_ddtAuxKey pkgName) depIfaces) cleanIfaces))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) depsOnly)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf) cleanIfaces)))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) dirtyOurs)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) ((Base_dList.v_Base_dList_dfilter (fun m -> (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m)) cleanNames)) false))) ours))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf cleanIfaces))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkgName))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkgName))) modules))) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))) (Base_dPair.v_Base_dPair_dfirstOf resolved))) (Base_dPair.v_Base_dPair_dsecondOf resolved)))

let v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked = (fun ctx resolved depIfaces cleanIfaces -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalCheckedCore ctx) resolved) depIfaces) cleanIfaces) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) true)) (fun r -> (match (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf r)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__277) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__277))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "incremental check produced no package")
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceChecked = (fun ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource ctx) label) source)) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__278) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__278)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__279) -> ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__279)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckModuleFile = (fun ctx path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun text -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceChecked ctx) path) text)) (fun checked -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match checked with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__280) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__280))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__281) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__281)))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField = (fun i -> (i).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName)

let rec v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__282, dtb__283) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__282) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__282)) else ((v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed dtb__283) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dtopoDepsOf = (fun mods m -> ((Base_dList.v_Base_dList_dfilter (fun n -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed mods) n) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__284) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField) ((Base_dList.v_Base_dList_dappend (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf))))

let rec v_Vuna_dCompiler_dDriver_dDt_dtopoVisit = (fun fuel mods name visited acc -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = acc } else (if ((Base_dList.v_Base_dList_dmemName name) visited) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = acc } else (match ((v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed mods) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (name, visited)); Base_dPair.f_Base_dPair_dPair_second = acc }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__285) -> ((fun step -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf step); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dsecondOf step)) (Base_dList.C_Base_dList_dList_Cons (dtb__285, Base_dList.C_Base_dList_dList_Nil))) }) (((((v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll (fuel - 1)) mods) ((v_Vuna_dCompiler_dDriver_dDt_dtopoDepsOf mods) dtb__285)) (Base_dList.C_Base_dList_dList_Cons (name, visited))) acc))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__286, dtb__287) -> ((fun step -> (((((v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll mc0) mc1) dtb__287) (Base_dPair.v_Base_dPair_dfirstOf step)) (Base_dPair.v_Base_dPair_dsecondOf step))) (((((v_Vuna_dCompiler_dDriver_dDt_dtopoVisit mc0) mc1) dtb__286) mc3) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc3; Base_dPair.f_Base_dPair_dPair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dtopoModules = (fun mods -> (Base_dPair.v_Base_dPair_dsecondOf (((((v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll 8192) mods) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) mods)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dDriver_dDt_dunitDeclsHash = (fun m -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dCanonical_dAst.v_Vuna_dCompiler_dCanonical_dAst_dencDecls) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m)))

let v_Vuna_dCompiler_dDriver_dDt_dpairKeyValue = (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))

let v_Vuna_dCompiler_dDriver_dDt_dunitImportsOf = (fun m -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField) ((Base_dList.v_Base_dList_dappend (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf)))

let rec v_Vuna_dCompiler_dDriver_dDt_dconcatKeys = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__288, dtb__289) -> (String.concat "" [dtb__288; ";"; (v_Vuna_dCompiler_dDriver_dDt_dconcatKeys dtb__289)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dunitImportKey = (fun acc n -> (match ((Base_dList.v_Base_dList_dlookupPair n) acc) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__290) -> dtb__290
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "?"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dunitKeyOne = (fun acc m -> ((fun deps -> (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dshaText (String.concat "" ["u|"; (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); "|"; (v_Vuna_dCompiler_dDriver_dDt_dunitDeclsHash m); "|"; (v_Vuna_dCompiler_dDriver_dDt_dconcatKeys deps)]))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dDt_dunitImportKey acc)) (v_Vuna_dCompiler_dDriver_dDt_dunitImportsOf m))))

let rec v_Vuna_dCompiler_dDriver_dDt_dunitKeysGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__291, dtb__292) -> ((v_Vuna_dCompiler_dDriver_dDt_dunitKeysGo dtb__292) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__291); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dDt_dunitKeyOne mc1) dtb__291) }, mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dunitKeysOf = (fun modules entryDecls printResult -> ((fun modKeys -> ((fun entryHash -> ((fun entryKey -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "__entry__"; Base_dPair.f_Base_dPair_dPair_second = entryKey }, modKeys))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dshaText (String.concat "" ["e|"; entryHash; "|"; (if printResult then "prim_eff_print" else "noprint"); "|"; (v_Vuna_dCompiler_dDriver_dDt_dconcatKeys ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dpairKeyValue) modKeys))])))) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dCanonical_dAst.v_Vuna_dCompiler_dCanonical_dAst_dencDecls) entryDecls))) ((v_Vuna_dCompiler_dDriver_dDt_dunitKeysGo modules) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dDriver_dDt_dunitCacheLookup = (fun dir keys name -> (match ((Base_dList.v_Base_dList_dlookupPair name) keys) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__293) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead dir) name) dtb__293)) (fun cached -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__294) -> ((fun _u -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__294))) (if (dtp_debug_on 0) then (dtp_debug_line ("unit-cache-hit " ^ name)) else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dunitCacheStore = (fun dir keys name sf -> (match ((Base_dList.v_Base_dList_dlookupPair name) keys) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__295) -> ((((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite dir) name) dtb__295) sf)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dunitCacheEnabled = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_UNIT_CACHE")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v <> "0"))))

let v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached = (fun ctx entry modules moduleParts entryDecls prog printResult extraDefLocs -> ((fun pkg -> ((fun keys -> ((fun bucketKey -> ((fun roots -> ((fun cdir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dDt_dunitCacheEnabled) (fun enabled -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir pkg)) (fun base -> ((fun dir -> ((fun keepNames -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if (if enabled then (pkg <> "") else false) then ((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheGc base) dir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if (if enabled then (pkg <> "") else false) then ((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc dir) keepNames) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))) (fun _u -> (if (if (pkg = "") then true else (Base_dBool.v_Base_dBool_dnot enabled)) then (((((((Vuna_dCompiler_dCodegen_dSplit.v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram moduleParts) entryDecls) prog) printResult) roots) cdir) extraDefLocs) else (((((((((Vuna_dCompiler_dCodegen_dSplit.v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgramWith ((v_Vuna_dCompiler_dDriver_dDt_dunitCacheLookup dir) keys)) ((v_Vuna_dCompiler_dDriver_dDt_dunitCacheStore dir) keys)) moduleParts) entryDecls) prog) printResult) roots) cdir) extraDefLocs))))))) ((Base_dList.v_Base_dList_dmap (fun p -> ((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p)))) keys))) ((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryDir base) bucketKey))))))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)))) (String.concat "" [pkg; "|"; entry]))) (((v_Vuna_dCompiler_dDriver_dDt_dunitKeysOf modules) entryDecls) printResult))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

let v_Vuna_dCompiler_dDriver_dDt_ddtGenerateIncremental = (fun ctx entry parts checked printResult extraDefLocs -> ((fun modules -> ((fun moduleParts -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached ctx) entry) modules) moduleParts) (Base_dPair.v_Base_dPair_dfirstOf parts)) (checked).f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) printResult) extraDefLocs)) (fun filesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match filesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__296) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__296))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__297) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__297; Base_dPair.f_Base_dPair_dPair_second = checked }))
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules))) (v_Vuna_dCompiler_dDriver_dDt_dtopoModules (Base_dPair.v_Base_dPair_dsecondOf parts))))

let v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface = (fun mi -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOpaqueOf (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf mi)) })

let v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces = (fun ifaces -> (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface) ifaces)))

let v_Vuna_dCompiler_dDriver_dDt_dimportsOfModuleNames = (fun m -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField) ((Base_dList.v_Base_dList_dappend (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf)))

let rec v_Vuna_dCompiler_dDriver_dDt_dclosureGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__298, dtb__299) -> (if (mc0 <= 0) then mc2 else (if ((Base_dList.v_Base_dList_dmemName dtb__298) mc2) then ((((v_Vuna_dCompiler_dDriver_dDt_dclosureGo mc0) mc1) mc2) dtb__299) else (match ((v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed mc1) dtb__298) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dDt_dclosureGo (mc0 - 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__298, mc2))) dtb__299)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__300) -> ((((v_Vuna_dCompiler_dDriver_dDt_dclosureGo (mc0 - 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__298, mc2))) ((Base_dList.v_Base_dList_dappend dtb__299) (v_Vuna_dCompiler_dDriver_dDt_dimportsOfModuleNames dtb__300)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__301; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__302; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__303; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__304; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__305; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__306 } -> ((fun entryStarts -> ((fun ownNames -> ((fun starts -> ((fun closed -> ((fun kept -> { Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__301; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__302; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__303; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = kept; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__305; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__306 }; Base_dPair.f_Base_dPair_dPair_second = kept }) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m)) closed))) dtb__304))) ((((v_Vuna_dCompiler_dDriver_dDt_dclosureGo 8192) dtb__304) Base_dList.C_Base_dList_dList_Nil) starts))) ((Base_dList.v_Base_dList_dappend entryStarts) ownNames))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = mc0))) dtb__304)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField) ((Base_dList.v_Base_dList_dappend dtb__302) dtb__303)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf = (fun ifaces mods -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) ((Base_dList.v_Base_dList_dfilter (fun mi -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) mods)))) ifaces)))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsIncremental = (fun ctx entry depIfaces cleanIfaces -> ((fun preloaded -> ((fun allIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded ctx) entry) preloaded)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__307) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__307))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__308) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__308) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__309; Base_dPair.f_Base_dPair_dPair_second = dtb__310 } -> (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf allIfaces) dtb__310)) dtb__309)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces depIfaces)) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface) cleanIfaces)))))

let v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps = (fun pkg parts ifaces -> ((fun depNames -> ((Base_dList.v_Base_dList_dfilter (fun mi -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) depNames))) ifaces)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkg))) (Base_dPair.v_Base_dPair_dsecondOf parts)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceWithIfaces = (fun ctx label source ifaces -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded ctx) label) source) (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__311) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__311)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__312) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__312) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__313; Base_dPair.f_Base_dPair_dPair_second = dtb__314 } -> ((fun missing -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength missing) = 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf ifaces) dtb__314)) dtb__313) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__315) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__315))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__316) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__316)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__317) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__317))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__318) -> (match (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts ctx) dtb__316) dtb__318) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__319) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__319))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__320) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__320)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckSource ctx) label) source))) (if ((Base_dList.v_Base_dList_dlength missing) > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("iface-fallback=check missing=" ^ ((Base_dString.v_Base_dString_djoin ",") missing))) else 0) else 0))) (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__314) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) ifaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-source=check modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength ifaces)))) else 0)))

let v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux = (fun ctx program exprSource ifaces cache -> ((fun _u -> ((fun src -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded ctx) "<repl>") src) (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces ifaces))) (fun loaded -> (match loaded with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__321) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__321)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__322) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__322) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__323; Base_dPair.f_Base_dPair_dPair_second = dtb__324 } -> ((fun missing -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength missing) = 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf ifaces) dtb__324)) dtb__323) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__325) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__325))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__326) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__326)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__327) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__327))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__328) -> ((fun parts -> ((((((v_Vuna_dCompiler_dDriver_dDt_dreplCheckPartsAux (v_Vuna_dCompiler_dDriver_dDt_ddepStartOf dtb__328)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__328) parts) ifaces) cache)) (Base_dPair.v_Base_dPair_dsecondOf dtb__326))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull ctx) program) exprSource)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__329) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__329))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__330) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__330; Base_dPair.f_Base_dPair_dPair_second = cache }))
  | _ -> failwith "DT: impossible branch"
)))))) (if ((Base_dList.v_Base_dList_dlength missing) > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("iface-fallback=repl missing=" ^ ((Base_dString.v_Base_dString_djoin ",") missing))) else 0) else 0))) (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__324) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) ifaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (String.concat "" [program; "\n"; v_Vuna_dCompiler_dDriver_dDt_dreplExprName; " = "; exprSource; "\n"]))) (if (dtp_debug_on 0) then (dtp_debug_line ("query-source=repl modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength ifaces)))) else 0)))

let v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfaces = (fun ctx program exprSource ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux ctx) program) exprSource) ifaces) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__331) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__331))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__332) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__332)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfoWithAuxCache = (fun ctx program exprSource ifaces cache -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux ctx) program) exprSource) ifaces) cache)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__333) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__333))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__334) -> (match ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__334))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dfirstOf dtb__334))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__335) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__335))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__336) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__336; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__334) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprWithAuxCache = (fun ctx program exprSource ifaces cache -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux ctx) program) exprSource) ifaces) cache)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__337) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__337))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__338) -> (match ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__338))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dfirstOf dtb__338))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__339) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__339))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__340) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__340; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__338) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfoWithIfaces = (fun ctx program exprSource ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfaces ctx) program) exprSource) ifaces)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__341) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__341))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__342) -> ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo (Base_dPair.v_Base_dPair_dfirstOf dtb__342)) (Base_dPair.v_Base_dPair_dsecondOf dtb__342))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprWithIfaces = (fun ctx program exprSource ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfaces ctx) program) exprSource) ifaces)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__343) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__343))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__344) -> ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn (Base_dPair.v_Base_dPair_dfirstOf dtb__344)) (Base_dPair.v_Base_dPair_dsecondOf dtb__344))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn = (fun pkg parts ifaces -> ((fun ourNames -> ((Base_dList.v_Base_dList_dfilter (fun mi -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) ourNames))) ifaces)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) (Base_dPair.v_Base_dPair_dsecondOf parts)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceIncremental = (fun ctx label source depIfaces cleanIfaces cache needPackage -> ((fun pkgName -> ((fun preloaded -> ((fun allIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded ctx) label) source) preloaded)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__345) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__345))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__346) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports pkgName) dtb__346) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__347; Base_dPair.f_Base_dPair_dPair_second = dtb__348 } -> ((fun missing -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength missing) > 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = cache } } })) else (match (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf allIfaces) dtb__348)) dtb__347) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__349) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__349))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__350) -> (match ((((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalCheckedCore ctx) dtb__350) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps pkgName) (Base_dPair.v_Base_dPair_dsecondOf dtb__350)) depIfaces)) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn pkgName) (Base_dPair.v_Base_dPair_dsecondOf dtb__350)) cleanIfaces)) cache) needPackage) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__351) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__351))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__352) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__352 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (if ((Base_dList.v_Base_dList_dlength missing) > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("iface-fallback=check-incremental missing=" ^ ((Base_dString.v_Base_dString_djoin ",") missing))) else 0) else 0))) (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules pkgName) dtb__348) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) allIfaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces depIfaces)) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface) cleanIfaces))))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalSourceIncremental = (fun ctx label source depIfaces cache -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceIncremental ctx) label) source) depIfaces) Base_dList.C_Base_dList_dList_Nil) cache) true)) (fun rR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match rR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__353) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__353))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__354) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__354) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__355; Base_dPair.f_Base_dPair_dPair_second = dtb__356 } -> (match (Base_dPair.v_Base_dPair_dfirstOf dtb__356) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__357) -> (match (v_Vuna_dCompiler_dDriver_dDt_devalDtMain (dtb__357).f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__358) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__358))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__359) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__354); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__359; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__356) } }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__354); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__356) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageIncrementalParts = (fun ctx entry depIfaces cleanIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsIncremental ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__360) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__360))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__361) -> (match ((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked ctx) dtb__361) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__361)) depIfaces)) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__361)) cleanIfaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__362) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__362))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__363) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__363).f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings; Base_dPair.f_Base_dPair_dPair_second = dtb__363 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectIncremental = (fun ctx entry printResult depIfaces cleanIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsIncremental ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__364) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__364)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__365) -> ((fun pkgName -> ((fun parts -> ((fun cleanOwn -> ((fun extraDefLocs -> (match ((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked ctx) dtb__365) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps pkgName) parts) depIfaces)) cleanOwn) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__366) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__366)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__367) -> ((((((v_Vuna_dCompiler_dDriver_dDt_ddtGenerateIncremental ctx) entry) parts) dtb__367) printResult) extraDefLocs)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf) cleanOwn))) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn pkgName) parts) cleanIfaces))) (Base_dPair.v_Base_dPair_dsecondOf dtb__365))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsWithIfaces = (fun ctx entry ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded ctx) entry) (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces ifaces))) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__368) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__368))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__369) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__369) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__370; Base_dPair.f_Base_dPair_dPair_second = dtb__371 } -> (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf ifaces) dtb__371)) dtb__370)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsWithIfaces = (fun ctx names ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded ctx) names) (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces ifaces))) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__372) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__372))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__373) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__373) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__374; Base_dPair.f_Base_dPair_dPair_second = dtb__375 } -> (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf ifaces) dtb__375)) dtb__374)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithIfacesParts = (fun ctx entry ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsWithIfaces ctx) entry) ifaces)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__376) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__376))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__377) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__377)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__378) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__378))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__379) -> (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts ctx) dtb__377) dtb__379)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsIncremental = (fun ctx names depIfaces cleanIfaces -> ((fun preloaded -> ((fun allIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded ctx) names) preloaded)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__380) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__380))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__381) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__381) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__382; Base_dPair.f_Base_dPair_dPair_second = dtb__383 } -> (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf allIfaces) dtb__383)) dtb__382)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces depIfaces)) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface) cleanIfaces)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageIncrementalParts = (fun ctx names depIfaces cleanIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsIncremental ctx) names) depIfaces) cleanIfaces)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__384) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__384))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__385) -> (match ((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked ctx) dtb__385) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__385)) depIfaces)) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__385)) cleanIfaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__386) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__386))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__387) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__387).f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings; Base_dPair.f_Base_dPair_dPair_second = dtb__387 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageWithIfacesParts = (fun ctx names ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsWithIfaces ctx) names) ifaces)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__388) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__388))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__389) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__389)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__390) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__390))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__391) -> (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts ctx) dtb__389) dtb__391)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtSplitPartsOurs = (fun ctx entry parts deps printResult -> ((fun pkgName -> ((fun modules -> ((fun ours -> ((fun depsOnly -> ((fun allDecls -> ((fun termAux -> ((fun start -> (match ((((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux (Base_dPair.v_Base_dPair_dfirstOf start)) (Base_dPair.v_Base_dPair_dsecondOf start)) termAux) allDecls) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__392) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__392)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__393) -> ((fun assembled -> ((fun moduleParts -> ((fun checked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached ctx) entry) modules) moduleParts) (Base_dPair.v_Base_dPair_dfirstOf parts)) assembled) printResult) Base_dList.C_Base_dList_dList_Nil)) (fun filesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match filesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__394) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__394))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__395) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__395; Base_dPair.f_Base_dPair_dPair_second = checked }))
  | _ -> failwith "DT: impossible branch"
))))) { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = dtb__393; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = (v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf deps); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__393) })) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) deps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas dtb__393)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) deps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__393)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals dtb__393); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols dtb__393); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals dtb__393); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts dtb__393); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses dtb__393); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (dtb__393).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = (dtb__393).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = (dtb__393).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__393) })
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dDt_ddepStartOf deps))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) depsOnly))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) ours)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkgName))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkgName))) modules))) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

let v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectWithIfaces = (fun ctx entry printResult ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsWithIfaces ctx) entry) ifaces)) (fun partsR -> (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__396) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__396)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__397) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__397)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__398) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__398)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__399) -> (((((v_Vuna_dCompiler_dDriver_dDt_ddtSplitPartsOurs ctx) entry) (Base_dPair.v_Base_dPair_dsecondOf dtb__397)) dtb__399) printResult)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts = (fun ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadParts ctx) entry)) (fun partsR -> (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__400) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__400)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__401) -> ((fun parts -> ((fun loaderWarns -> ((fun modules -> ((fun allDecls -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull allDecls) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__402) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__402)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__403) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached ctx) entry) modules) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules)) (Base_dPair.v_Base_dPair_dfirstOf parts)) dtb__403) printResult) Base_dList.C_Base_dList_dList_Nil)) (fun filesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match filesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__404) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__404))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__405) -> ((fun warns -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__405; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = dtb__403; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns } }))) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__403)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) modules)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__401))) (Base_dPair.v_Base_dPair_dsecondOf dtb__401))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dDt_dmaybeTermGlobals = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__406) -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__406)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddtDefGlobalNames = (fun d -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmaybeTermGlobals (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))

let rec v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__407, dtb__408) -> ((fun name -> ((fun skip -> (if skip then ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo dtb__408) mc1) else (if ((Base_dList.v_Base_dList_dmemName name) mc1) then ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo dtb__408) mc1) else (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__407) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__409) -> (Base_dList.C_Base_dList_dList_Cons (((((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnDiagAtMod (fun x -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithSuggestion { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle = (String.concat "" ["remove unused definition `"; name; "`"]); Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan = dtb__409; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText = "" }, Base_dList.C_Base_dList_dList_Nil)) }) x))) dtb__409) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_UnusedDefinition (name))) (Base_dVec.C_Base_dVec_dVec_Cons (name, Base_dVec.C_Base_dVec_dVec_Nil))), ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo dtb__408) mc1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo dtb__408) mc1)
  | _ -> failwith "DT: impossible branch"
)))) (if (if (name = "main") then true else ((Base_dString.v_Base_dString_dstartsWith "_") name)) then true else ((Base_dString.v_Base_dString_dstartsWith "$") name)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__407))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsIn = (fun defs -> ((fun used -> ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo defs) used)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_ddtDefGlobalNames) defs)))

let v_Vuna_dCompiler_dDriver_dDt_dcheckDeclsWithWarns = (fun loaderWarns decls -> ((fun _u -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__410) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__410))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__411) -> ((fun _u -> (match (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas dtb__411); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__411) }) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__412) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__412))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__413) -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend loaderWarns) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__411)) (v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsIn (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__411))))))) (if (dtp_debug_on 0) then (dtp_debug_line "codegen-check-done") else 0))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line "elab-done") else 0))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line "decls-ready") else 0)))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls = (fun loaded -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) loaded) (fun loadedR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match loadedR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__414) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__414))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__415) -> ((v_Vuna_dCompiler_dDriver_dDt_dcheckDeclsWithWarns (Base_dPair.v_Base_dPair_dsecondOf dtb__415)) (Base_dPair.v_Base_dPair_dfirstOf dtb__415))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheck = (fun ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck ctx) entry)) (fun loadedR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match loadedR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__416) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__416))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__417) -> ((fun parts -> ((fun modules -> ((fun decls -> ((v_Vuna_dCompiler_dDriver_dDt_dcheckDeclsWithWarns (Base_dPair.v_Base_dPair_dfirstOf dtb__417)) decls)) ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls modules) (Base_dPair.v_Base_dPair_dfirstOf parts)))) (Base_dPair.v_Base_dPair_dsecondOf parts))) (Base_dPair.v_Base_dPair_dsecondOf dtb__417))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDriver_dDt_dprimarySpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__418, dtb__419) -> (match dtb__418 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__420; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__421; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__422; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__423 } -> (match dtb__420 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__424) -> (match dtb__422 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__424))
  | _ -> (v_Vuna_dCompiler_dDriver_dDt_dprimarySpanOf dtb__419)
)
  | _ -> (v_Vuna_dCompiler_dDriver_dDt_dprimarySpanOf dtb__419)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dprimaryLineOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__425, dtb__426) -> (match dtb__425 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = dtb__427; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = dtb__428; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = dtb__429; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = dtb__430 } -> (match dtb__427 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__431) -> (match dtb__429 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelPrimary -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine dtb__431)))
  | _ -> (v_Vuna_dCompiler_dDriver_dDt_dprimaryLineOf dtb__426)
)
  | _ -> (v_Vuna_dCompiler_dDriver_dDt_dprimaryLineOf dtb__426)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddiagPrimaryLine = (fun d -> (v_Vuna_dCompiler_dDriver_dDt_dprimaryLineOf (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels))

let v_Vuna_dCompiler_dDriver_dDt_dspanContainsLine = (fun sp line -> (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp) <= line) then (line <= (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanEndLine sp)) else false))

let rec v_Vuna_dCompiler_dDriver_dDt_danyNameIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__432, dtb__433) -> (if ((Base_dList.v_Base_dList_dmemName dtb__432) mc1) then true else ((v_Vuna_dCompiler_dDriver_dDt_danyNameIn dtb__433) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddeclDropped = (fun names d -> ((v_Vuna_dCompiler_dDriver_dDt_danyNameIn (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddeclNames d)) names))

let rec v_Vuna_dCompiler_dDriver_dDt_danyWordIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__434, dtb__435) -> (if ((Base_dList.v_Base_dList_dmemName dtb__434) mc1) then true else ((v_Vuna_dCompiler_dDriver_dDt_danyWordIn dtb__435) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dflushWord = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc0)), mc1))
))

let v_Vuna_dCompiler_dDriver_dDt_disIdentChar = (fun c -> (if (if (if (if (c >= 48) then (c <= 57) else false) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)))

let rec v_Vuna_dCompiler_dDriver_dDt_dwordsGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__436, dtb__437) -> (if (v_Vuna_dCompiler_dDriver_dDt_disIdentChar dtb__436) then (((v_Vuna_dCompiler_dDriver_dDt_dwordsGo dtb__437) (Base_dList.C_Base_dList_dList_Cons (dtb__436, mc1))) mc2) else (((v_Vuna_dCompiler_dDriver_dDt_dwordsGo dtb__437) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dDriver_dDt_dflushWord mc1) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dDriver_dDt_dflushWord mc1) mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_dwordsOf = (fun s -> (((v_Vuna_dCompiler_dDriver_dDt_dwordsGo (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dDriver_dDt_dmentionedAny = (fun names msg -> ((v_Vuna_dCompiler_dDriver_dDt_danyWordIn names) (v_Vuna_dCompiler_dDriver_dDt_dwordsOf msg)))

let v_Vuna_dCompiler_dDriver_dDt_dmarkCascade = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> (if ((v_Vuna_dCompiler_dDriver_dDt_dmentionedAny mc0) (mc1).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagMessage) then ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithOrigin (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote ("best-effort: may be a cascade from an earlier removed declaration"))) mc1)) else mc1)
))

let v_Vuna_dCompiler_dDriver_dDt_dnormalizeDiagFile = (fun p -> (if ((Base_dString.v_Base_dString_dstartsWith "./") p) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 2)) (bi_natFromInt ((bi_strLength p) - 2))) p) else p))

let v_Vuna_dCompiler_dDriver_dDt_ddeclMatchesDiag = (fun sp x -> ((fun dsp -> ((fun sameFile -> (if sameFile then ((v_Vuna_dCompiler_dDriver_dDt_dspanContainsLine dsp) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp)) else false)) (if (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dsp) = "") then true else ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp) = "")) then true else ((v_Vuna_dCompiler_dDriver_dDt_dnormalizeDiagFile (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile dsp)) = (v_Vuna_dCompiler_dDriver_dDt_dnormalizeDiagFile (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp)))))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan x)))

let rec v_Vuna_dCompiler_dDriver_dDt_drecoverElab = (fun fuel decls removed errs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse errs))) else (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgram decls) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__438) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse errs)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__439) -> ((fun d2 -> ((fun names -> ((fun decls2 -> (if ((Base_dList.v_Base_dList_dlength decls2) = (Base_dList.v_Base_dList_dlength decls)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons (d2, errs))))) else ((((v_Vuna_dCompiler_dDriver_dDt_drecoverElab (fuel - 1)) decls2) ((Base_dList.v_Base_dList_dappend removed) names)) (Base_dList.C_Base_dList_dList_Cons (d2, errs))))) ((Base_dList.v_Base_dList_dfilter (fun x -> (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dDriver_dDt_ddeclDropped names) x)))) decls))) (match (v_Vuna_dCompiler_dDriver_dDt_dprimarySpanOf (dtb__439).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__440) -> ((Base_dList.v_Base_dList_dconcatMap (fun x -> (if ((v_Vuna_dCompiler_dDriver_dDt_ddeclMatchesDiag dtb__440) x) then (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddeclNames x) else Base_dList.C_Base_dList_dList_Nil))) decls)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dDriver_dDt_dmarkCascade removed) dtb__439))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering = (fun ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dDt_ddtLoad ctx) entry)) (fun declsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match declsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__441) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__441))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__442) -> ((((v_Vuna_dCompiler_dDriver_dDt_drecoverElab 8) (Base_dPair.v_Base_dPair_dfirstOf dtb__442)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryRecovering = (fun ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesParts ctx) names)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__443) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__443))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__444) -> ((((v_Vuna_dCompiler_dDriver_dDt_drecoverElab 8) (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__444))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))))
