open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dDt_dCheckedPackage = { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtProgram; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules : Vuna_dCompiler_dLoader_dModules.t_Vuna_dCompiler_dLoader_dModules_dModule Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dDriver_dDt_dGenMeta = { f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaId : int; f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaName : string; f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaKind : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dDriver_dDt_dAuxCache = { f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheKey : string; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheStart : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc, (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDepCps : Vuna_dCompiler_dDriver_dCache.t_Vuna_dCompiler_dDriver_dCache_dCachedProgram Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheCleanCps : Vuna_dCompiler_dDriver_dCache.t_Vuna_dCompiler_dDriver_dCache_dCachedProgram Base_dList.t_Base_dList_dList }

# 68 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls = (fun parts -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Base_dPair.v_Base_dPair_dfirstOf parts)))

# 72 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtLoad = (fun nFs nEnv nProcess ctx entry -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProject nFs) nEnv) nProcess) ctx) entry)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__0))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__1) -> ((fun _u -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__1) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__2))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__3) -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__3)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dfirstOf dtb__3) }))) (if (dtp_debug_on 0) then (dtp_debug_line "resolve-done") else 0))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line "load-modules-done") else 0))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "load-start") else 0)))

# 96 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck = (fun nFs nEnv nProcess ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.load")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProject nFs) nEnv) nProcess) ctx) entry)) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__4) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__4)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__5) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.resolve")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__5))))
  | _ -> failwith "DT: impossible branch"
))))))

# 106 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesParts = (fun nFs nEnv nProcess ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.load")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules nFs) nEnv) nProcess) ctx) names)) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__6) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__6)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__7) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.resolve")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__7))))
  | _ -> failwith "DT: impossible branch"
))))))

# 214 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dsealSpan = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = "<seal>"; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 1 }

# 217 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dopaqueSigType = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__10, dtb__11, dtb__12, dtb__13) -> (if (dtb__10 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12)) else ((v_Vuna_dCompiler_dDriver_dDt_dopaqueSigType mc0) dtb__9))
  | _ -> ((v_Vuna_dCompiler_dDriver_dDt_dopaqueSigType mc0) dtb__9)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dsealDeclOf = (fun decls name -> ((fun ty -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (("vuna_seal_" ^ name), ty, v_Vuna_dCompiler_dDriver_dDt_dsealSpan))) (match ((v_Vuna_dCompiler_dDriver_dDt_dopaqueSigType name) decls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> dtb__14
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", v_Vuna_dCompiler_dDriver_dDt_dsealSpan))
  | _ -> failwith "DT: impossible branch"
)))

# 198 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (match dtb__15 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__17, dtb__18, dtb__19, dtb__20) -> (if ((Base_dList.v_Base_dList_dmemName dtb__17) mc1) then (Base_dList.C_Base_dList_dList_Cons (dtb__15, (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dDriver_dDt_dsealDeclOf (Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16))) dtb__17), ((v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter dtb__16) mc1))))) else (Base_dList.C_Base_dList_dList_Cons (dtb__15, ((v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter dtb__16) mc1))))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__15, ((v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter dtb__16) mc1)))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dsealModule = (fun m -> ((fun decls -> ((fun names -> ((fun abstracts -> ((fun opaques -> ((fun body -> ((Base_dList.v_Base_dList_dappend body) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dDt_dsealDeclOf decls)) opaques))) ((v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter decls) abstracts))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName) ((Base_dList.v_Base_dList_dfilter (fun n -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_disAbstractOpaqueName n)))) names)))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName) ((Base_dList.v_Base_dList_dfilter Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_disAbstractOpaqueName) names)))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleOpaqueOf m))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m)))

# 185 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls = (fun modules entryDecls -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_dsealModule) (Base_dList.v_Base_dList_dreverse modules))) entryDecls))

# 243 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtFileHasModuleHeader = (fun nFs nEnv nProcess path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun text -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath nFs) nEnv) nProcess) path) text)) (fun parsed -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__21) -> (match dtb__21 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__22; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__23; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__24; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__25; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__26; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__27; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__28 } -> (match dtb__22 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) parsed)))))))

# 320 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSource = (fun nFs nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__30) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__30))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__31) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__31) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__32) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__32))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__33) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__33))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__33)))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__34) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__34))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__35) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dfirstOf dtb__33)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__35))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 337 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__36) <> mc0) then (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__36)) mc2)) false) else false) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__36), (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules mc0) dtb__37) mc2))) else (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules mc0) dtb__37) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 562 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dallocMetas = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc0) mc1) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = dtb__41 } -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocMetas mc0) dtb__41) dtb__39) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__42; Base_dPair.f_Base_dPair_dPair_second = dtb__43 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__42)); Base_dPair.f_Base_dPair_dPair_second = dtb__43 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dbuildPi = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, dtb__44, ((v_Vuna_dCompiler_dDriver_dDt_dbuildPi dtb__45) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 549 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dallocTelescopes = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match dtb__46 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = dtb__49 } -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocMetas mc0) mc1) ((Base_dList.v_Base_dList_drange 0) dtb__49)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = dtb__51 } -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocMetas mc0) dtb__51) ((Base_dList.v_Base_dList_drange 0) 1)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__52; Base_dPair.f_Base_dPair_dPair_second = dtb__53 } -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__55 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocTelescopes mc0) dtb__53) dtb__47) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__56; Base_dPair.f_Base_dPair_dPair_second = dtb__57 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dDt_dbuildPi dtb__50) dtb__54) }, dtb__56)); Base_dPair.f_Base_dPair_dPair_second = dtb__57 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = dtb__53 }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = dtb__53 }
)) dtb__52)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dfindDtDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__58) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58)) else ((v_Vuna_dCompiler_dDriver_dDt_dfindDtDef mc0) dtb__59))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dloadReplDecls = (fun nFs nEnv nProcess ctx source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource nFs) nEnv) nProcess) ctx) "<repl>") source)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__60) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__60))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__61) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__61) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__62) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__62))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__63) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__63))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 598 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtBindingTypes = (fun nFs nEnv nProcess ctx program -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_dloadReplDecls nFs) nEnv) nProcess) ctx) program)) (fun declsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match declsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__64) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__64))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__65) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull dtb__65) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__66) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__66))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__67) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_decOfProgram dtb__67) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__68; Base_dPair.f_Base_dPair_dPair_second = dtb__69 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__68) 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))) })) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__67))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 639 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dpickFreshName = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> ((fun cand -> (if ((Base_dList.v_Base_dList_dmemName cand) mc1) then (((v_Vuna_dCompiler_dDriver_dDt_dpickFreshName mc0) mc1) dtb__71) else cand)) (if (dtb__70 = 0) then mc0 else (String.concat "" [mc0; "_"; (bi_strFromInt dtb__70)])))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dfreshMetaName = (fun base taken -> (((v_Vuna_dCompiler_dDriver_dDt_dpickFreshName base) taken) (Base_dList.C_Base_dList_dList_Cons (0, ((Base_dList.v_Base_dList_drange 1) 64)))))

# 648 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dsubstGenMetas = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> ((((v_Vuna_dCompiler_dDriver_dDt_dsubstGenMetas ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar (dtb__72).f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaId) (dtb__72).f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaName) ((mc2 + 1) - mc3)) mc0)) dtb__73) (mc2 + 1)) mc3)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 653 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dwrapGenMetas = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((dtb__74).f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaName, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (dtb__74).f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaKind, ((v_Vuna_dCompiler_dDriver_dDt_dwrapGenMetas dtb__75) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 660 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dkindArrows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (v_Vuna_dCompiler_dDriver_dDt_dkindArrows dtb__77)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

# 657 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dkindOfArity = (fun k -> (v_Vuna_dCompiler_dDriver_dDt_dkindArrows ((Base_dList.v_Base_dList_drange 0) k)))

# 665 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__78, dtb__79, dtb__80) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__78)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__79)) (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__80)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__81, dtb__82) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__81)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfAlt) dtb__82))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__83, dtb__84) -> (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfArgs dtb__84)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__85, dtb__86, dtb__87) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__85)) (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__86))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__88, dtb__89, dtb__90) -> (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__90)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__94)) (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__95))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__96) -> (Base_dList.C_Base_dList_dList_Cons (dtb__96, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))
# 675 "Vuna/Compiler/Driver/Dt.vuna"
and v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__97 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = dtb__100 } -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__99)) (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfArgs dtb__98))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 679 "Vuna/Compiler/Driver/Dt.vuna"
and v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfAlt = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__101; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__102; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__103 } -> (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf dtb__103)
  | _ -> failwith "DT: impossible branch"
))

# 682 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_ddedupInts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmemMetaId dtb__104) dtb__105) then (v_Vuna_dCompiler_dDriver_dDt_ddedupInts dtb__105) else (Base_dList.C_Base_dList_dList_Cons (dtb__104, (v_Vuna_dCompiler_dDriver_dDt_ddedupInts dtb__105))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 710 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dheadIsMeta = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__106) -> (mc0 = dtb__106)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__107, dtb__108, dtb__109) -> ((v_Vuna_dCompiler_dDriver_dDt_dheadIsMeta mc0) dtb__107)
  | _ -> false
))

# 715 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dspineLen = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__110, dtb__111, dtb__112) -> (1 + (v_Vuna_dCompiler_dDriver_dDt_dspineLen dtb__110))
  | _ -> 0
))

# 707 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dapplyArity = (fun m t -> (if ((v_Vuna_dCompiler_dDriver_dDt_dheadIsMeta m) t) then (v_Vuna_dCompiler_dDriver_dDt_dspineLen t) else 0))

# 719 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dimax = (fun a b -> (if (a >= b) then a else b))

# 688 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__113, dtb__114, dtb__115) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__113)) ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__114)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__115)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__116, dtb__117) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__116)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityAlts mc0) dtb__117))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__118, dtb__119) -> ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityArgs mc0) dtb__119)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__120, dtb__121, dtb__122) -> ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__122)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__126)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__127))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__128, dtb__129, dtb__130) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dapplyArity mc0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__128, dtb__129, dtb__130)))) ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__128)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__129)))
  | _ -> 0
))
# 699 "Vuna/Compiler/Driver/Dt.vuna"
and v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (match dtb__131 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__133; Base_dPair.f_Base_dPair_dPair_second = dtb__134 } -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) dtb__133)) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityArgs mc0) dtb__132))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 703 "Vuna/Compiler/Driver/Dt.vuna"
and v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityAlts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> ((v_Vuna_dCompiler_dDriver_dDt_dimax ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__135))) ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityAlts mc0) dtb__136))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 628 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dbuildGenMetas = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> ((fun name -> ((fun kind -> (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaId = dtb__137; f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaName = name; f_Vuna_dCompiler_dDriver_dDt_dGenMeta_genMetaKind = kind }, ((((v_Vuna_dCompiler_dDriver_dDt_dbuildGenMetas dtb__138) (Base_dList.C_Base_dList_dList_Cons (name, mc1))) (mc2 + 1)) mc3)))) (v_Vuna_dCompiler_dDriver_dDt_dkindOfArity ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity dtb__137) mc3)))) ((v_Vuna_dCompiler_dDriver_dDt_dfreshMetaName ("t" ^ (bi_strFromInt mc2))) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dlistLen = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (1 + (v_Vuna_dCompiler_dDriver_dDt_dlistLen dtb__140))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dfindArity = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> (match dtb__141 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__143, dtb__144, dtb__145, dtb__146) -> (if (dtb__143 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dDriver_dDt_dlistLen dtb__144))) else ((v_Vuna_dCompiler_dDriver_dDt_dfindArity mc0) dtb__142))
  | _ -> ((v_Vuna_dCompiler_dDriver_dDt_dfindArity mc0) dtb__142)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_daritiesOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfindArity dtb__147) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["\232\135\170\229\138\168\231\173\190\229\144\141: \230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 "; dtb__147; "\239\188\136\233\156\128\232\166\129 DFun\239\188\137"]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__149) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dDt_daritiesOf dtb__148) mc1)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = dtb__149 }, more))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dgeneralizeSignature = (fun ty taken -> ((fun metas -> (if ((Base_dList.v_Base_dList_dlength metas) = 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig ty))) else (if ((Base_dList.v_Base_dList_dlength metas) > 8) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr "\232\135\170\229\138\168\230\142\168\230\150\173\229\135\186\231\154\132\231\177\187\229\158\139\229\143\130\230\149\176\232\182\133\232\191\135 8 \228\184\170\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else ((fun entries -> ((fun total -> ((fun body -> ((fun sigText -> (if ((Base_dString.v_Base_dString_dcontains "?") sigText) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr "\232\135\170\229\138\168\230\142\168\230\150\173\231\154\132\231\173\190\229\144\141\228\187\141\229\144\171\230\156\170\232\167\163\229\133\131\229\143\152\233\135\143\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sigText)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig ((v_Vuna_dCompiler_dDriver_dDt_dwrapGenMetas entries) body)))) ((((v_Vuna_dCompiler_dDriver_dDt_dsubstGenMetas ty) entries) 0) total))) (v_Vuna_dCompiler_dDriver_dDt_dlistLen entries))) ((((v_Vuna_dCompiler_dDriver_dDt_dbuildGenMetas metas) taken) 0) ty))))) (v_Vuna_dCompiler_dDriver_dDt_ddedupInts (v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf ty))))

# 574 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dinferEachType = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfindDtDef dtb__150) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs mc1)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr ("\232\135\170\229\138\168\231\173\190\229\144\141: \231\178\190\229\140\150\231\187\147\230\158\156\233\135\140\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 " ^ dtb__150))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__152) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dDt_dgeneralizeSignature (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm mc2) 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__152))) mc3)) (fun sigText -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dDriver_dDt_dinferEachType dtb__151) mc1) mc2) mc3)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__150; Base_dPair.f_Base_dPair_dPair_second = sigText }, more))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 509 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtInferDefTypes = (fun nFs nEnv nProcess ctx program targets defSource -> (if ((Base_dList.v_Base_dList_dlength targets) = 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__153) -> (match dtb__153 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__154; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__155; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__156; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__157; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__158; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__159; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__160 } -> (match dtb__154 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr "\232\135\170\229\138\168\231\173\190\229\144\141\228\184\141\230\148\175\230\140\129\230\168\161\229\157\151\230\150\135\228\187\182"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dDriver_dDt_daritiesOf targets) dtb__157) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__162) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__162)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__163) -> (match (((v_Vuna_dCompiler_dDriver_dDt_dallocTelescopes Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) dtb__163) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__164; Base_dPair.f_Base_dPair_dPair_second = dtb__165 } -> ((fun startGlobals -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_dloadReplDecls nFs) nEnv) nProcess) ctx) (String.concat "" [program; "\n"; defSource; "\n"]))) (fun allDeclsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match allDeclsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__166) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__166))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__167) -> (match (((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith dtb__165) startGlobals) dtb__167) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__168) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__168))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__169) -> ((fun taken -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_decOfProgram dtb__169) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__170; Base_dPair.f_Base_dPair_dPair_second = dtb__171 } -> ((((v_Vuna_dCompiler_dDriver_dDt_dinferEachType targets) dtb__169) dtb__170) taken)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtopNames dtb__167))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dappend dtb__164) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__172) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__172)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dFrontend_dParser.v_Vuna_dCompiler_dFrontend_dParser_dparseSource "<repl>") defSource))))

# 727 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSource = (fun nFs nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__173) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__173))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__174) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__174) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__175) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__175))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__176) -> (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__176)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 738 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSourceTolerant = (fun nFs nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__177) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__177))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__178) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__178) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__179) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__179))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__180) -> (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgramTolerant (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__180)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 773 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmainKindForName = (fun g -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Int")) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Nat")) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("String")) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Bool")) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Other")))))))

# 780 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dreplExprName = "vuna_repl_expr"

# 784 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr = (fun decls -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (match dtb__181 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__183, dtb__184, dtb__185, dtb__186) -> (if (dtb__183 = v_Vuna_dCompiler_dDriver_dDt_dreplExprName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse dtb__182); Base_dPair.f_Base_dPair_dPair_second = dtb__185 })) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "REPL expression definition is not last"))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "REPL expression was not parsed as a definition")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "REPL expression was not parsed as a definition")
)) (Base_dList.v_Base_dList_dreverse decls)))

# 285 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull = (fun nFs nEnv nProcess ctx program exprSource -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource nFs) nEnv) nProcess) ctx) "<repl>") (String.concat "" [program; "\n"; v_Vuna_dCompiler_dDriver_dDt_dreplExprName; " = "; exprSource; "\n"]))) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__187) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__187))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__188) -> (match ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__188) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__189) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__189))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__190) -> (match (v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__190))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__190)))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__191) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__191))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__192) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull (Base_dPair.v_Base_dPair_dfirstOf dtb__192)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__193) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__193))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__194) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__192) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 299 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExpr = (fun nFs nEnv nProcess ctx program exprSource -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__195) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__195))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__196) -> ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn (Base_dPair.v_Base_dPair_dfirstOf dtb__196)) (Base_dPair.v_Base_dPair_dsecondOf dtb__196))
  | _ -> failwith "DT: impossible branch"
)))))

# 310 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfo = (fun nFs nEnv nProcess ctx program exprSource -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__197) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__197))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__198) -> ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo (Base_dPair.v_Base_dPair_dfirstOf dtb__198)) (Base_dPair.v_Base_dPair_dsecondOf dtb__198))
  | _ -> failwith "DT: impossible branch"
)))))

# 827 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dinterpMainShow = (fun table sols mainVal -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) table)) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName, (Base_dList.C_Base_dList_dList_Cons (mainVal, Base_dList.C_Base_dList_dList_Nil))))))) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__199) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__199))
  | _ -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_MainNotValue)
))

# 835 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmainActionKind = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__200, dtb__201, dtb__202) -> (match dtb__200 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__203, dtb__204, dtb__205) -> (match dtb__203 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__206) -> (if (dtb__206 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then "Eff" else "")
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 842 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_disNilRowTermDt = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__207, dtb__208) -> (match dtb__208 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__207 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__209) -> (dtb__209 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

# 847 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dfindMainDef = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__210, dtb__211) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__210) = "main") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210)) else (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef dtb__211))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 852 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_ddefTableOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__212, dtb__213) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__212) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__214) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__212); Base_dPair.f_Base_dPair_dPair_second = dtb__214 }, (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf dtb__213)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf dtb__213)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 754 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtMainKind = (fun nFs nEnv nProcess ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_ddtLoad nFs) nEnv) nProcess) ctx) entry)) (fun declsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match declsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__215) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__215))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__216) -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgram (Base_dPair.v_Base_dPair_dfirstOf dtb__216)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__217) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__217))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__218) -> (match (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef (Base_dPair.v_Base_dPair_dsecondOf dtb__218)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0At { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = entry; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 1 }) Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_NoMain)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__219) -> (if ((v_Vuna_dCompiler_dDriver_dDt_dmainActionKind (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__219)) = "Eff") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("Eff")) else (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf (Base_dPair.v_Base_dPair_dsecondOf dtb__218)))) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__219))) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__220) -> (match dtb__220 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__221, dtb__222) -> (match dtb__222 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dDt_dmainKindForName dtb__221)
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

# 804 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_devalDtMainCore = (fun program -> (match (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs program)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_NoMain)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__223) -> ((fun table -> ((fun sols -> ((fun mainVal -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dDriver_dDt_dmainActionKind (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__223)) = "")) then (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_InterpCannotExecuteEffects) else (match mainVal with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__224) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((bi_strFromInt dtb__224)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__225) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mainVal)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__226) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mainVal)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__227) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__227))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__228, dtb__229) -> (match (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnatValueToInt mainVal) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__230) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((bi_strFromInt dtb__230)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dDt_dinterpMainShow table) sols) mainVal)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dDriver_dDt_dinterpMainShow table) sols) mainVal)
))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) table)) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("main", Base_dList.C_Base_dList_dList_Nil))))))) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty)) (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs program)))
  | _ -> failwith "DT: impossible branch"
))

# 793 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_devalDtMain = (fun program -> (v_Vuna_dCompiler_dDriver_dDt_devalDtMainCore program))

# 263 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtEvalFile = (fun nFs nEnv nProcess ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__231) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__231))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__232) -> ((fun parts -> ((fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) v_Vuna_dCompiler_dDriver_dDt_devalDtMain)) ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls (Base_dPair.v_Base_dPair_dsecondOf parts)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__232))
  | _ -> failwith "DT: impossible branch"
)))))

# 862 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtLoadParts = (fun nFs nEnv nProcess ctx entry -> (((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry))

# 871 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOne = (fun cp -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals cp))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts cp))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses cp))))))))

# 868 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf = (fun progs -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOne) progs))

# 931 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dmaxMetaList = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__233, dtb__234) -> ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaList (if (dtb__233 > mc0) then dtb__233 else mc0)) dtb__234)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 935 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmaxMetaDef = (fun m d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> ((v_Vuna_dCompiler_dDriver_dDt_dmaxMetaList m) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll dtb__235))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))

# 940 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCached = (fun m cp -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dDriver_dDt_dmaxMetaDef) m) (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs cp)))

# 943 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCps = (fun cps -> (((Base_dList.v_Base_dList_dfoldl v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCached) (0 - 1)) cps))

# 946 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dcleanStartNext = (fun cps -> ((fun m -> (if (m < 0) then 0 else (m + 1))) (v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCps cps)))

# 959 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__236, dtb__237) -> ((fun k -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) k) mc2) then ((((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo mc0) dtb__237) mc2) mc3) else ((((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo mc0) dtb__237) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) k) true) mc2)) (Base_dList.C_Base_dList_dList_Cons (dtb__236, mc3))))) (mc0 dtb__236))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 956 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast = (fun key xs -> ((((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo key) (Base_dList.v_Base_dList_dreverse xs)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

# 972 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddedupDefs = (fun ds -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) ds))

# 975 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dbodyPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__238, dtb__239) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__238) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__240) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__238); Base_dPair.f_Base_dPair_dPair_second = dtb__240 }, (v_Vuna_dCompiler_dDriver_dDt_dbodyPairs dtb__239)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_dbodyPairs dtb__239)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 969 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddedupDefBodies = (fun ds -> (v_Vuna_dCompiler_dDriver_dDt_dbodyPairs (v_Vuna_dCompiler_dDriver_dDt_ddedupDefs ds)))

# 981 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddedupDatas = (fun ds -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) ds))

# 984 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddedupInsts = (fun ds -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName) ds))

# 987 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddedupClasses = (fun ds -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName) ds))

# 990 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals = (fun gs -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast (fun g -> (Base_dPair.v_Base_dPair_dfirstOf g))) gs))

# 904 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddepStartOfAt = (fun next progs -> ((fun datas -> ((fun dataKeys -> ((fun defGlobals -> ((fun globals -> ((fun opaqueNames -> ((fun bodies -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> { Base_dPair.f_Base_dPair_dPair_first = ec6; Base_dPair.f_Base_dPair_dPair_second = globals }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl ec5) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec4) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) globals)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutNext ec3) next))) ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ec2) (v_Vuna_dCompiler_dDriver_dDt_ddedupClasses ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedClasses) progs))))) ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ec1) (v_Vuna_dCompiler_dDriver_dDt_ddedupInsts ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedInsts) progs))))) ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ec0) datas))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty)) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName (Base_dPair.v_Base_dPair_dfirstOf p)) opaqueNames)))) (v_Vuna_dCompiler_dDriver_dDt_ddedupDefBodies ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) progs))))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOpaqueOf) progs)))) ((Base_dList.v_Base_dList_dappend defGlobals) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind d) })) datas)))) ((Base_dList.v_Base_dList_dfilter (fun p -> (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) ((Base_dList.v_Base_dList_dmemName (Base_dPair.v_Base_dPair_dfirstOf p)) dataKeys)) false))) (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals) progs)))))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas)) ((Base_dList.v_Base_dList_dconcatMap (fun d -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas)))) (v_Vuna_dCompiler_dDriver_dDt_ddedupDatas ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) progs))))

# 927 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddepStartOf = (fun progs -> ((v_Vuna_dCompiler_dDriver_dDt_ddepStartOfAt 0) progs))

# 1018 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dsortNames = (fun _uarity0 -> ((Base_dSort.v_Base_dSort_dsortBy (fun a b -> (((Base_dOrd.v_Base_dOrd_dle Base_dString.v_Ord_uString) a) b))) _uarity0))

# 1026 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__241, dtb__242) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo dtb__242) (Base_dList.C_Base_dList_dList_Cons (dtb__241, mc1)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__243, dtb__244) -> (if (dtb__241 = dtb__243) then ((v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo dtb__242) mc1) else ((v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo dtb__242) (Base_dList.C_Base_dList_dList_Cons (dtb__241, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1023 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddedupSortedNames = (fun xs -> (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo xs) Base_dList.C_Base_dList_dList_Nil)))

# 1032 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dnameSlotTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__245; Base_dPair.f_Base_dPair_dPair_second = mc1 }, ((v_Vuna_dCompiler_dDriver_dDt_dnameSlotTbl dtb__246) (mc1 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1036 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dshiftedDepProgramsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__247)) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("iface: dependency module missing from shift table: " ^ (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf dtb__247)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__249) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram ((dtb__249 + 1) * Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dsummaryMetaSegment)) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf dtb__247))) (fun cp -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dDt_dshiftedDepProgramsGo mc0) dtb__248)) (fun rest2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (cp, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1009 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms = (fun ifaces -> ((fun names -> (if ((Base_dList.v_Base_dList_dlength names) <> (Base_dList.v_Base_dList_dlength ifaces)) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "iface: duplicate dependency module name") else ((v_Vuna_dCompiler_dDriver_dDt_dshiftedDepProgramsGo ((v_Vuna_dCompiler_dDriver_dDt_dnameSlotTbl names) 0)) ifaces))) (v_Vuna_dCompiler_dDriver_dDt_ddedupSortedNames (v_Vuna_dCompiler_dDriver_dDt_dsortNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) ifaces)))))

# 1077 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtPrepareTermAux = (fun aux -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls aux)) (fun p -> (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings (Base_dPair.v_Base_dPair_dsecondOf p)))))

# 1086 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__250, dtb__251) -> (match dtb__250 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__252, dtb__253, dtb__254, dtb__255) -> (match (Vuna_dCompiler_dElab_dTermination_dMeasure.v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef { Base_dPair.f_Base_dPair_dPair_first = dtb__252; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__253; Base_dPair.f_Base_dPair_dPair_second = dtb__254 }, Base_dList.C_Base_dList_dList_Nil)) }) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__256) -> (Base_dList.C_Base_dList_dList_Cons (dtb__250, (v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination dtb__251)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination dtb__251)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__250, (v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination dtb__251)))
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1097 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtElabFullWithPrepared = (fun startEc startGlobals termAux preparedAux decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances startGlobals) decls))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__257; Base_dPair.f_Base_dPair_dPair_second = dtb__258 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__258)) (fun ds2 -> (((((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) dtb__257) (v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination preparedAux)) ds2)))
  | _ -> failwith "DT: impossible branch"
))))

# 1116 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dauxKeyOne = (fun m -> (String.concat "" [(Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf m); ":"; (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf m)]))

# 1119 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtAuxKey = (fun pkg deps clean -> (bi_strFromInt (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong (String.concat "" ["aux|"; pkg; "|"; ((Base_dString.v_Base_dString_djoin ";") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dauxKeyOne) deps)); "|"; ((Base_dString.v_Base_dString_djoin ";") ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dauxKeyOne) clean))]))))

# 1124 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtAuxOfCache = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__259) -> (if ((dtb__259).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheKey = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__259)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dreplCheckPartsAux = (fun start pkgName deps parts ifaces cache -> ((fun modules -> ((fun depsOnly -> ((fun oursOnly -> ((fun termAux -> ((fun ownDecls -> ((fun sourceDecls -> ((fun key -> ((fun cacheable -> ((fun cachedDecls -> ((fun prepared -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind prepared) (fun preparedAux -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr sourceDecls)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dDriver_dDt_ddtElabFullWithPrepared (Base_dPair.v_Base_dPair_dfirstOf start)) (Base_dPair.v_Base_dPair_dsecondOf start)) termAux) preparedAux) (Base_dPair.v_Base_dPair_dfirstOf p))) (fun prog -> ((fun depDatas -> ((fun depDefs -> ((fun depGlobals -> ((fun assembled -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = assembled; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) }; Base_dPair.f_Base_dPair_dPair_second = (if cacheable then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheKey = key; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls = preparedAux; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheStart = { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDepCps = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheCleanCps = Base_dList.C_Base_dList_dList_Nil })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) }))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = ((Base_dList.v_Base_dList_dappend depDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = ((Base_dList.v_Base_dList_dappend depDefs) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals ((Base_dList.v_Base_dList_dappend depGlobals) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog) })) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals) deps))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) deps))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) deps))))))))) (match cachedDecls with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__260) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__260).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_ddtPrepareTermAux termAux)
  | _ -> failwith "DT: impossible branch"
))) (if cacheable then ((v_Vuna_dCompiler_dDriver_dDt_ddtAuxOfCache key) cache) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) ((Base_dList.v_Base_dList_dlength ifaces) > 0))) (((v_Vuna_dCompiler_dDriver_dDt_ddtAuxKey pkgName) ifaces) Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dappend ownDecls) (Base_dPair.v_Base_dPair_dfirstOf parts)))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) oursOnly))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) depsOnly))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkgName))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkgName))) modules))) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts))))

# 376 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dreplCheckParts = (fun start pkgName deps parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dDriver_dDt_dreplCheckPartsAux start) pkgName) deps) parts) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun r -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf r))))))

# 1250 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckScoped = (fun allDatas unitDatas defs -> ((fun env -> ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.codegen.check") (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dCodegen_dLower.v_Vuna_dCompiler_dCodegen_dLower_dlowerUnitOf env) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) defs)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) unitDatas))) (fun unitIr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dnoQual) (Vuna_dCompiler_dCodegen_dLower.v_Vuna_dCompiler_dCodegen_dLower_dlwEnvShared env)) unitIr)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))))))))) (((Vuna_dCompiler_dCodegen_dLower.v_Vuna_dCompiler_dCodegen_dLower_dmkLwEnv allDatas) defs) "")))

# 1213 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackageScoped = (fun loaderWarns depCps cleanCps prog parts next -> ((fun assembled -> ((fun warns -> ((fun checked -> ((fun allDatas -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckScoped allDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (checked)); Base_dPair.f_Base_dPair_dPair_second = next }))))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))) { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = assembled; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = (v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf depCps); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns })) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog) }))

# 1233 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtFinishScoped = (fun depCps cleanCps prog cache -> ((fun allDatas -> ((fun newDatas -> ((fun newDefs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckScoped allDatas) newDatas) newDefs)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = cache }))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))))

# 1138 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalCheckedCore = (fun ctx resolved depIfaces cleanIfaces cache needPackage -> ((fun parts -> ((fun loaderWarns -> ((fun pkgName -> ((fun modules -> ((fun ours -> ((fun depsOnly -> ((fun cleanNames -> ((fun dirtyOurs -> ((fun decls -> ((fun termAux -> ((fun key -> ((fun cacheable -> ((fun hit -> ((fun depCpsR -> ((fun ifacePrepared -> ((fun missingPrepared -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind depCpsR) (fun depCps -> ((fun cleanCps -> ((fun start -> ((fun prepared -> ((fun startGlobals -> ((fun startEc -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind prepared) (fun preparedAux -> ((fun next -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dDriver_dDt_ddtElabFullWithPrepared startEc) startGlobals) termAux) preparedAux) decls)) (fun prog -> ((fun warns -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (if needPackage then ((((((v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackageScoped loaderWarns) depCps) cleanCps) prog) parts) next) else ((((v_Vuna_dCompiler_dDriver_dDt_ddtFinishScoped depCps) cleanCps) prog) next))) (fun r -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = warns; Base_dPair.f_Base_dPair_dPair_second = r }))))) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog)))))) (if cacheable then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheKey = key; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls = preparedAux; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheStart = start; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDepCps = depCps; f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheCleanCps = cleanCps })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))) (Base_dPair.v_Base_dPair_dfirstOf start))) (Base_dPair.v_Base_dPair_dsecondOf start))) (match hit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__261) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__261).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDecls))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if ((Base_dList.v_Base_dList_dlength ifacePrepared) > 0) then ((Base_dList.v_Base_dList_dlength missingPrepared) = 0) else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ifacePrepared)) else (v_Vuna_dCompiler_dDriver_dDt_ddtPrepareTermAux termAux))
  | _ -> failwith "DT: impossible branch"
))) (match hit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262) -> (dtb__262).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheStart
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dDt_ddepStartOfAt (v_Vuna_dCompiler_dDriver_dDt_dcleanStartNext cleanCps)) ((Base_dList.v_Base_dList_dappend depCps) cleanCps))
  | _ -> failwith "DT: impossible branch"
))) (match hit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__263) -> (dtb__263).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheCleanCps
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf) cleanIfaces)
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dfilter (fun mi -> ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf mi)) = 0))) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces)))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces)))) (match hit with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__264) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__264).f_Vuna_dCompiler_dDriver_dDt_dAuxCache_auxCacheDepCps))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms depIfaces)
  | _ -> failwith "DT: impossible branch"
))) (if cacheable then ((v_Vuna_dCompiler_dDriver_dDt_ddtAuxOfCache key) cache) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) ((bi_natAdd (Base_dList.v_Base_dList_dlength depIfaces) (Base_dList.v_Base_dList_dlength cleanIfaces)) > 0))) (((v_Vuna_dCompiler_dDriver_dDt_ddtAuxKey pkgName) depIfaces) cleanIfaces))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) depsOnly)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf) cleanIfaces)))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_dsealModule) dirtyOurs)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) ((Base_dList.v_Base_dList_dfilter (fun m -> (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m)) cleanNames)) false))) ours))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf cleanIfaces))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkgName))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkgName))) modules))) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))) (Base_dPair.v_Base_dPair_dfirstOf resolved))) (Base_dPair.v_Base_dPair_dsecondOf resolved)))

# 1128 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked = (fun ctx resolved depIfaces cleanIfaces -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalCheckedCore ctx) resolved) depIfaces) cleanIfaces) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) true)) (fun r -> (match (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf r)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__265) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__265))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "incremental check produced no package")
  | _ -> failwith "DT: impossible branch"
))))

# 1331 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField = (fun i -> (i).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName)

# 1334 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__266, dtb__267) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__266) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__266)) else ((v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed dtb__267) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1339 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dtopoDepsOf = (fun mods m -> ((Base_dList.v_Base_dList_dfilter (fun n -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed mods) n) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__268) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField) ((Base_dList.v_Base_dList_dappend (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf))))

# 1346 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dtopoVisit = (fun fuel mods name visited acc -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = acc } else (if ((Base_dList.v_Base_dList_dmemName name) visited) then { Base_dPair.f_Base_dPair_dPair_first = visited; Base_dPair.f_Base_dPair_dPair_second = acc } else (match ((v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed mods) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (name, visited)); Base_dPair.f_Base_dPair_dPair_second = acc }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__269) -> ((fun step -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf step); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend (Base_dPair.v_Base_dPair_dsecondOf step)) (Base_dList.C_Base_dList_dList_Cons (dtb__269, Base_dList.C_Base_dList_dList_Nil))) }) (((((v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll (fuel - 1)) mods) ((v_Vuna_dCompiler_dDriver_dDt_dtopoDepsOf mods) dtb__269)) (Base_dList.C_Base_dList_dList_Cons (name, visited))) acc))
  | _ -> failwith "DT: impossible branch"
))))
# 1356 "Vuna/Compiler/Driver/Dt.vuna"
and v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__270, dtb__271) -> ((fun step -> (((((v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll mc0) mc1) dtb__271) (Base_dPair.v_Base_dPair_dfirstOf step)) (Base_dPair.v_Base_dPair_dsecondOf step))) (((((v_Vuna_dCompiler_dDriver_dDt_dtopoVisit mc0) mc1) dtb__270) mc3) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = mc3; Base_dPair.f_Base_dPair_dPair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 1363 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dtopoModules = (fun mods -> (Base_dPair.v_Base_dPair_dsecondOf (((((v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll 8192) mods) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) mods)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)))

# 1372 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dunitDeclsHash = (fun m -> ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dCanonical_dAst.v_Vuna_dCompiler_dCanonical_dAst_dencDecls) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m)))

# 1375 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dpairKeyValue = (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))

# 1378 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dunitImportsOf = (fun m -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField) ((Base_dList.v_Base_dList_dappend (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf)))

# 1381 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dconcatKeys = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__272, dtb__273) -> (String.concat "" [dtb__272; ";"; (v_Vuna_dCompiler_dDriver_dDt_dconcatKeys dtb__273)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1385 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dunitImportKey = (fun acc n -> (match ((Base_dList.v_Base_dList_dlookupPair n) acc) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274) -> dtb__274
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "?"
  | _ -> failwith "DT: impossible branch"
))

# 1390 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dunitKeyOne = (fun acc m -> ((fun deps -> (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dshaText (String.concat "" ["u|"; (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); "|"; (v_Vuna_dCompiler_dDriver_dDt_dunitDeclsHash m); "|"; (v_Vuna_dCompiler_dDriver_dDt_dconcatKeys deps)]))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dDt_dunitImportKey acc)) (v_Vuna_dCompiler_dDriver_dDt_dunitImportsOf m))))

# 1396 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dunitKeysGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__275, dtb__276) -> ((v_Vuna_dCompiler_dDriver_dDt_dunitKeysGo dtb__276) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__275); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dDt_dunitKeyOne mc1) dtb__275) }, mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1400 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dunitKeysOf = (fun modules entryDecls printResult -> ((fun modKeys -> ((fun entryHash -> ((fun entryKey -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = "__entry__"; Base_dPair.f_Base_dPair_dPair_second = entryKey }, modKeys))) (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dshaText (String.concat "" ["e|"; entryHash; "|"; (if printResult then "consolePrint" else "noprint"); "|"; (v_Vuna_dCompiler_dDriver_dDt_dconcatKeys ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dpairKeyValue) modKeys))])))) ((Vuna_dCompiler_dCanonical_dBytes.v_Vuna_dCompiler_dCanonical_dBytes_dencTop Vuna_dCompiler_dCanonical_dAst.v_Vuna_dCompiler_dCanonical_dAst_dencDecls) entryDecls))) ((v_Vuna_dCompiler_dDriver_dDt_dunitKeysGo modules) Base_dList.C_Base_dList_dList_Nil)))

# 1412 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dunitCacheLookup = (fun nFs nEnv dir keys name -> (match ((Base_dList.v_Base_dList_dlookupPair name) keys) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__277) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead nFs) nEnv) dir) name) dtb__277)) (fun cached -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__278) -> ((fun _u -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__278))) (if (dtp_debug_on 0) then (dtp_debug_line ("unit-cache-hit " ^ name)) else 0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 1425 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dunitCacheStore = (fun nFs nEnv nProcess dir keys name sf -> (match ((Base_dList.v_Base_dList_dlookupPair name) keys) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__279) -> (((((((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite nFs) nEnv) nProcess) dir) name) dtb__279) sf)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1433 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dunitCacheEnabled = (fun nEnv -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_UNIT_CACHE")) (fun v -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (v <> "0")))))

# 1438 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached = (fun nFs nConsole nEnv nProcess ctx entry modules moduleParts entryDecls prog printResult extraDefLocs -> ((fun pkg -> ((fun keys -> ((fun bucketKey -> ((fun roots -> ((fun cdir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dDt_dunitCacheEnabled nEnv)) (fun enabled -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir nFs) nEnv) nProcess) pkg)) (fun base -> ((fun dir -> ((fun keepNames -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if (if enabled then (pkg <> "") else false) then ((((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc nFs) nProcess) dir) keepNames) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))) (fun _u -> (if (if (pkg = "") then true else (Base_dBool.v_Base_dBool_dnot enabled)) then (((((((Vuna_dCompiler_dCodegen_dSplit.v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram moduleParts) entryDecls) prog) printResult) roots) cdir) extraDefLocs) else (((((((((Vuna_dCompiler_dCodegen_dSplit.v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgramWith ((((v_Vuna_dCompiler_dDriver_dDt_dunitCacheLookup nFs) nEnv) dir) keys)) (((((v_Vuna_dCompiler_dDriver_dDt_dunitCacheStore nFs) nEnv) nProcess) dir) keys)) moduleParts) entryDecls) prog) printResult) roots) cdir) extraDefLocs))))) ((Base_dList.v_Base_dList_dmap (fun p -> ((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dsecondOf p)))) keys))) ((Vuna_dCompiler_dDriver_dPerfCache.v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryDir base) bucketKey))))))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextDir ctx))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootDir) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)))) (String.concat "" [pkg; "|"; entry]))) (((v_Vuna_dCompiler_dDriver_dDt_dunitKeysOf modules) entryDecls) printResult))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

# 1458 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtGenerateIncremental = (fun nFs nConsole nEnv nProcess ctx entry parts checked printResult extraDefLocs -> ((fun modules -> ((fun moduleParts -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((((v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached nFs) nConsole) nEnv) nProcess) ctx) entry) modules) moduleParts) (Base_dPair.v_Base_dPair_dfirstOf parts)) (checked).f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) printResult) extraDefLocs)) (fun filesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match filesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__280) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__280))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__281) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__281; Base_dPair.f_Base_dPair_dPair_second = checked }))
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules))) (v_Vuna_dCompiler_dDriver_dDt_dtopoModules (Base_dPair.v_Base_dPair_dsecondOf parts))))

# 1489 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface = (fun mi -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf mi); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = (Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedOpaqueOf (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf mi)) })

# 1044 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces = (fun ifaces -> (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface) ifaces)))

# 1499 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dimportsOfModuleNames = (fun m -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField) ((Base_dList.v_Base_dList_dappend (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf) (m).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf)))

# 1503 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dclosureGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__282, dtb__283) -> (if (mc0 <= 0) then mc2 else (if ((Base_dList.v_Base_dList_dmemName dtb__282) mc2) then ((((v_Vuna_dCompiler_dDriver_dDt_dclosureGo mc0) mc1) mc2) dtb__283) else (match ((v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed mc1) dtb__282) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dDt_dclosureGo (mc0 - 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__282, mc2))) dtb__283)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__284) -> ((((v_Vuna_dCompiler_dDriver_dDt_dclosureGo (mc0 - 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__282, mc2))) ((Base_dList.v_Base_dList_dappend dtb__283) (v_Vuna_dCompiler_dDriver_dDt_dimportsOfModuleNames dtb__284)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1511 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__285; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__286; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__287; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__288; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__289; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__290 } -> ((fun entryStarts -> ((fun ownNames -> ((fun starts -> ((fun closed -> ((fun kept -> { Base_dPair.f_Base_dPair_dPair_first = { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__285; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__286; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__287; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = kept; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__289; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__290 }; Base_dPair.f_Base_dPair_dPair_second = kept }) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m)) closed))) dtb__288))) ((((v_Vuna_dCompiler_dDriver_dDt_dclosureGo 8192) dtb__288) Base_dList.C_Base_dList_dList_Nil) starts))) ((Base_dList.v_Base_dList_dappend entryStarts) ownNames))) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = mc0))) dtb__288)))) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField) ((Base_dList.v_Base_dList_dappend dtb__286) dtb__287)))
  | _ -> failwith "DT: impossible branch"
))

# 1521 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf = (fun ifaces mods -> ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) ((Base_dList.v_Base_dList_dfilter (fun mi -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) mods)))) ifaces)))

# 1054 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsIncremental = (fun nFs nEnv nProcess ctx entry depIfaces cleanIfaces -> ((fun preloaded -> ((fun allIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.load")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) preloaded)) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__291) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__291)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__292) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__292) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__293; Base_dPair.f_Base_dPair_dPair_second = dtb__294 } -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.resolve")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf allIfaces) dtb__294)) dtb__293))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces depIfaces)) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface) cleanIfaces)))))

# 1525 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps = (fun pkg parts ifaces -> ((fun depNames -> ((Base_dList.v_Base_dList_dfilter (fun mi -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) depNames))) ifaces)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkg))) (Base_dPair.v_Base_dPair_dsecondOf parts)))))

# 423 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux = (fun nFs nEnv nProcess nExit nArgs ctx program exprSource ifaces cache -> ((fun _u -> ((fun src -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) "<repl>") src) (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces ifaces))) (fun loaded -> (match loaded with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__295) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__295)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__296) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__296) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__297; Base_dPair.f_Base_dPair_dPair_second = dtb__298 } -> ((fun missing -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength missing) = 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf ifaces) dtb__298)) dtb__297) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__299) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__299))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__300) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__300)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__301) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__301))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__302) -> ((fun parts -> ((((((v_Vuna_dCompiler_dDriver_dDt_dreplCheckPartsAux (v_Vuna_dCompiler_dDriver_dDt_ddepStartOf dtb__302)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__302) parts) ifaces) cache)) (Base_dPair.v_Base_dPair_dsecondOf dtb__300))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__303) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__303))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__304) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__304; Base_dPair.f_Base_dPair_dPair_second = cache }))
  | _ -> failwith "DT: impossible branch"
)))))) (if ((Base_dList.v_Base_dList_dlength missing) > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("iface-fallback=repl missing=" ^ ((Base_dString.v_Base_dString_djoin ",") missing))) else 0) else 0))) (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__298) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) ifaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (String.concat "" [program; "\n"; v_Vuna_dCompiler_dDriver_dDt_dreplExprName; " = "; exprSource; "\n"]))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-source=repl modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength ifaces)))) else 0)))

# 414 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfaces = (fun nFs nEnv nProcess nExit nArgs ctx program exprSource ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__305) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__305))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__306) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__306)))
  | _ -> failwith "DT: impossible branch"
)))))

# 456 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfoWithAuxCache = (fun nFs nEnv nProcess nExit nArgs ctx program exprSource ifaces cache -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__307) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__307))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__308) -> (match ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__308))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dfirstOf dtb__308))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__309) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__309))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__310) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__310; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__308) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 466 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprWithAuxCache = (fun nFs nEnv nProcess nExit nArgs ctx program exprSource ifaces cache -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__311) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__311))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__312) -> (match ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__312))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dfirstOf dtb__312))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__313) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__313))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__314) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__314; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__312) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 476 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfoWithIfaces = (fun nFs nEnv nProcess nExit nArgs ctx program exprSource ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfaces nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__315) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__315))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__316) -> ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo (Base_dPair.v_Base_dPair_dfirstOf dtb__316)) (Base_dPair.v_Base_dPair_dsecondOf dtb__316))
  | _ -> failwith "DT: impossible branch"
)))))

# 484 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprWithIfaces = (fun nFs nEnv nProcess nExit nArgs ctx program exprSource ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfaces nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces)) (fun pR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__317) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__317))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__318) -> ((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn (Base_dPair.v_Base_dPair_dfirstOf dtb__318)) (Base_dPair.v_Base_dPair_dsecondOf dtb__318))
  | _ -> failwith "DT: impossible branch"
)))))

# 1531 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn = (fun pkg parts ifaces -> ((fun ourNames -> ((Base_dList.v_Base_dList_dfilter (fun mi -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf mi)) ourNames))) ifaces)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkg))) (Base_dPair.v_Base_dPair_dsecondOf parts)))))

# 1264 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceIncremental = (fun nFs nEnv nProcess nExit nArgs ctx label source depIfaces cleanIfaces cache needPackage -> ((fun pkgName -> ((fun preloaded -> ((fun allIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) preloaded)) (fun projectR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__319) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__319))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__320) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports pkgName) dtb__320) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__321; Base_dPair.f_Base_dPair_dPair_second = dtb__322 } -> ((fun missing -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength missing) > 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = cache } } })) else (match (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf allIfaces) dtb__322)) dtb__321) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__323) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__323))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__324) -> (match ((((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalCheckedCore ctx) dtb__324) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps pkgName) (Base_dPair.v_Base_dPair_dsecondOf dtb__324)) depIfaces)) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn pkgName) (Base_dPair.v_Base_dPair_dsecondOf dtb__324)) cleanIfaces)) cache) needPackage) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__325) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__325))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__326) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__326 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (if ((Base_dList.v_Base_dList_dlength missing) > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("iface-fallback=check-incremental missing=" ^ ((Base_dString.v_Base_dString_djoin ",") missing))) else 0) else 0))) (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules pkgName) dtb__322) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) allIfaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces depIfaces)) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface) cleanIfaces))))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

# 1293 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtEvalSourceIncremental = (fun nFs nEnv nProcess nExit nArgs ctx label source depIfaces cache -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((((v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceIncremental nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) Base_dList.C_Base_dList_dList_Nil) cache) true)) (fun rR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match rR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__327) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__327))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__328) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__328) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__329; Base_dPair.f_Base_dPair_dPair_second = dtb__330 } -> (match (Base_dPair.v_Base_dPair_dfirstOf dtb__330) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__331) -> (match (v_Vuna_dCompiler_dDriver_dDt_devalDtMain (dtb__331).f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__332) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__332))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__333) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__328); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__333; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__330) } }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__328); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf dtb__330) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1318 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageIncrementalParts = (fun nFs nEnv nProcess nExit nArgs ctx entry depIfaces cleanIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsIncremental nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__334) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__334))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__335) -> (match ((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked ctx) dtb__335) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__335)) depIfaces)) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__335)) cleanIfaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__336) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__336))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__337) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__337).f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings; Base_dPair.f_Base_dPair_dPair_second = dtb__337 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1472 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectIncremental = (fun nFs nConsole nEnv nProcess nExit nArgs ctx entry printResult depIfaces cleanIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsIncremental nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__338) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__338)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__339) -> ((fun pkgName -> ((fun parts -> ((fun cleanOwn -> ((fun extraDefLocs -> (match ((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked ctx) dtb__339) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps pkgName) parts) depIfaces)) cleanOwn) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__340) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__340)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__341) -> ((((((((((v_Vuna_dCompiler_dDriver_dDt_ddtGenerateIncremental nFs) nConsole) nEnv) nProcess) ctx) entry) parts) dtb__341) printResult) extraDefLocs)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf) cleanOwn))) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn pkgName) parts) cleanIfaces))) (Base_dPair.v_Base_dPair_dsecondOf dtb__339))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))
  | _ -> failwith "DT: impossible branch"
))))

# 1537 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsWithIfaces = (fun nFs nEnv nProcess ctx entry ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.load")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__342) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__342)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__343) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__343) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__344; Base_dPair.f_Base_dPair_dPair_second = dtb__345 } -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.resolve")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf ifaces) dtb__345)) dtb__344))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1548 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsWithIfaces = (fun nFs nEnv nProcess ctx names ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.load")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__346) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__346)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__347) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__347) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__348; Base_dPair.f_Base_dPair_dPair_second = dtb__349 } -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.resolve")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf ifaces) dtb__349)) dtb__348))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1569 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsIncremental = (fun nFs nEnv nProcess ctx names depIfaces cleanIfaces -> ((fun preloaded -> ((fun allIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.load")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) preloaded)) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__350) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__350)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__351) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__351) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__352; Base_dPair.f_Base_dPair_dPair_second = dtb__353 } -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.resolve")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf allIfaces) dtb__353)) dtb__352))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) ((Base_dList.v_Base_dList_dappend depIfaces) cleanIfaces))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces depIfaces)) (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface) cleanIfaces)))))

# 1584 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageIncrementalParts = (fun nFs nEnv nProcess nExit nArgs ctx names depIfaces cleanIfaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsIncremental nFs) nEnv) nProcess) ctx) names) depIfaces) cleanIfaces)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__354) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__354))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__355) -> (match ((((v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked ctx) dtb__355) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__355)) depIfaces)) (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__355)) cleanIfaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__356) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__356))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__357) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__357).f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings; Base_dPair.f_Base_dPair_dPair_second = dtb__357 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1626 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtSplitPartsOursWith = (fun nFs nConsole nEnv nProcess ctx entry parts deps printResult extraDefLocs -> ((fun pkgName -> ((fun modules -> ((fun ours -> ((fun depsOnly -> ((fun allDecls -> ((fun termAux -> ((fun start -> (match ((((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux (Base_dPair.v_Base_dPair_dfirstOf start)) (Base_dPair.v_Base_dPair_dsecondOf start)) termAux) allDecls) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__358) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__358)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__359) -> ((fun assembled -> ((fun moduleParts -> ((fun checked -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((((v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached nFs) nConsole) nEnv) nProcess) ctx) entry) modules) moduleParts) (Base_dPair.v_Base_dPair_dfirstOf parts)) assembled) printResult) extraDefLocs)) (fun filesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match filesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__360) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__360))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__361) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__361; Base_dPair.f_Base_dPair_dPair_second = checked }))
  | _ -> failwith "DT: impossible branch"
))))) { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = dtb__359; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = (v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf deps); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__359) })) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) deps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas dtb__359)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) deps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__359)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals dtb__359); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols dtb__359); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals dtb__359); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts dtb__359); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses dtb__359); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (dtb__359).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = (dtb__359).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__359) })
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dDt_ddepStartOf deps))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) depsOnly))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) ours)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkgName))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkgName))) modules))) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))

# 1607 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectWithIfaces = (fun nFs nConsole nEnv nProcess ctx entry printResult ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.codegen.split")) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsWithIfaces nFs) nEnv) nProcess) ctx) entry) ifaces)) (fun partsR -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__362) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__362)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__363) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__363)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__364) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__364)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__365) -> ((((((((((v_Vuna_dCompiler_dDriver_dDt_ddtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) (Base_dPair.v_Base_dPair_dsecondOf dtb__363)) dtb__365) printResult) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf) ifaces))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (fun r -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.codegen.split")) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) r))))))))))

# 1623 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtSplitPartsOurs = (fun nFs nConsole nEnv nProcess ctx entry parts deps printResult -> ((((((((((v_Vuna_dCompiler_dDriver_dDt_ddtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) parts) deps) printResult) Base_dList.C_Base_dList_dList_Nil))

# 1660 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts = (fun nFs nConsole nEnv nProcess ctx entry printResult -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadParts nFs) nEnv) nProcess) ctx) entry)) (fun partsR -> (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__366) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__366)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__367) -> ((fun parts -> ((fun loaderWarns -> ((fun modules -> ((fun allDecls -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull allDecls) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__368) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__368)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__369) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((((v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached nFs) nConsole) nEnv) nProcess) ctx) entry) modules) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m) })) modules)) (Base_dPair.v_Base_dPair_dfirstOf parts)) dtb__369) printResult) Base_dList.C_Base_dList_dList_Nil)) (fun filesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match filesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__370) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__370))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__371) -> ((fun warns -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__371; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = dtb__369; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns } }))) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__369)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) modules)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) (v_Vuna_dCompiler_dDriver_dDt_dtopoModules (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__367))) (Base_dPair.v_Base_dPair_dsecondOf dtb__367))
  | _ -> failwith "DT: impossible branch"
))))

# 1707 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dmaybeTermGlobals = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__372) -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__372)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1703 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtDefGlobalNames = (fun d -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dDriver_dDt_dmaybeTermGlobals (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))

# 1719 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsTbl = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__373, dtb__374) -> ((fun name -> ((fun skip -> (if skip then ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsTbl dtb__374) mc1) else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) mc1) then ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsTbl dtb__374) mc1) else (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__373) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__375) -> (Base_dList.C_Base_dList_dList_Cons (((((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnDiagAtMod (fun x -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithSuggestion { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle = (String.concat "" ["remove unused definition `"; name; "`"]); Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan = dtb__375; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText = "" }, Base_dList.C_Base_dList_dList_Nil)) }) x))) dtb__375) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_UnusedDefinition (name))) (Base_dVec.C_Base_dVec_dVec_Cons (name, Base_dVec.C_Base_dVec_dVec_Nil))), ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsTbl dtb__374) mc1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsTbl dtb__374) mc1)
  | _ -> failwith "DT: impossible branch"
)))) (if (if (name = "main") then true else ((Base_dString.v_Base_dString_dstartsWith "_") name)) then true else ((Base_dString.v_Base_dString_dstartsWith "$") name)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__373))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1716 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo = (fun defs used -> ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsTbl defs) (Base_dHashMap.v_Base_dHashMap_dofNames used)))

# 1695 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsIn = (fun defs -> ((fun used -> ((v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo defs) used)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_ddtDefGlobalNames) defs)))

# 1738 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering = (fun nFs nEnv nProcess ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_ddtLoad nFs) nEnv) nProcess) ctx) entry)) (fun declsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match declsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__376) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__376))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__377) -> (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramErrors (Base_dPair.v_Base_dPair_dfirstOf dtb__377))
  | _ -> failwith "DT: impossible branch"
)))))

# 1747 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryRecovering = (fun nFs nEnv nProcess ctx names -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesParts nFs) nEnv) nProcess) ctx) names)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__378) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__378))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__379) -> (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramErrors (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls (Base_dPair.v_Base_dPair_dsecondOf dtb__379)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1757 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dcheckDtProgramOf = (fun datas defs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCodegen_dLower.v_Vuna_dCompiler_dCodegen_dLower_dlowerProgramOf datas) defs)) (fun programIr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dnoQual) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirProgSharedOf programIr)) (Vuna_dCompiler_dIr_dModel.v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf programIr))) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))))))

# 126 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_dcheckDeclsWithWarns = (fun loaderWarns decls -> ((fun _u -> ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab") (fun _u -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__380) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__380))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__381) -> ((fun _u -> ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.codegen.check") (fun _u -> (match ((v_Vuna_dCompiler_dDriver_dDt_dcheckDtProgramOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas dtb__381)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__381)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__382) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__382))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__383) -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend loaderWarns) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__381)) (v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsIn (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__381))))))) (if (dtp_debug_on 0) then (dtp_debug_line "codegen-check-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "elab-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "decls-ready") else 0)))

# 118 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls = (fun loaded -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) loaded) (fun loadedR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match loadedR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__384) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__384))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__385) -> ((v_Vuna_dCompiler_dDriver_dDt_dcheckDeclsWithWarns (Base_dPair.v_Base_dPair_dsecondOf dtb__385)) (Base_dPair.v_Base_dPair_dfirstOf dtb__385))
  | _ -> failwith "DT: impossible branch"
)))))

# 156 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram = (fun pkg loaded -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) loaded) (fun loadedR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match loadedR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__386) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__386))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__387) -> ((fun parts -> ((fun loaderWarns -> ((fun decls -> ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab") (fun _u -> (match (Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__388) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__388))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__389) -> ((fun _u -> ((fun warns -> ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.codegen.check") (fun _u -> (match ((v_Vuna_dCompiler_dDriver_dDt_dcheckDtProgramOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas dtb__389)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs dtb__389)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__390) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__390))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__391) -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = warns; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = dtb__389; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns } }))) (if (dtp_debug_on 0) then (dtp_debug_line "codegen-check-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings dtb__389)))) (if (dtp_debug_on 0) then (dtp_debug_line "elab-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls (Base_dPair.v_Base_dPair_dsecondOf parts)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__387))) (Base_dPair.v_Base_dPair_dsecondOf dtb__387))
  | _ -> failwith "DT: impossible branch"
)))))

# 148 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts = (fun nFs nEnv nProcess ctx entry -> ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)))

# 152 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts = (fun nFs nEnv nProcess ctx names -> ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesParts nFs) nEnv) nProcess) ctx) names)))

# 224 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheck = (fun nFs nEnv nProcess ctx entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) (fun loadedR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match loadedR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__392) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__392))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__393) -> ((fun parts -> ((fun modules -> ((fun decls -> ((v_Vuna_dCompiler_dDriver_dDt_dcheckDeclsWithWarns (Base_dPair.v_Base_dPair_dfirstOf dtb__393)) decls)) ((v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls modules) (Base_dPair.v_Base_dPair_dfirstOf parts)))) (Base_dPair.v_Base_dPair_dsecondOf parts))) (Base_dPair.v_Base_dPair_dsecondOf dtb__393))
  | _ -> failwith "DT: impossible branch"
)))))

# 876 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts = (fun ctx resolved deps -> ((fun parts -> ((fun loaderWarns -> ((fun pkgName -> ((fun modules -> ((fun ours -> ((fun depsOnly -> ((fun decls -> ((fun termAux -> ((fun start -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dDriver.v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux (Base_dPair.v_Base_dPair_dfirstOf start)) (Base_dPair.v_Base_dPair_dsecondOf start)) termAux) decls)) (fun prog -> ((fun allDatas -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dDt_dcheckDtProgramOf allDatas) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (fun _u -> ((fun warns -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = warns; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = prog; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = (v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf deps); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns } }))) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog)))))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) deps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))))) (v_Vuna_dCompiler_dDriver_dDt_ddepStartOf deps))) ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) depsOnly))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dDriver_dDt_dsealModule) ours)) (Base_dPair.v_Base_dPair_dfirstOf parts)))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) <> pkgName))) modules))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkgName))) modules))) (Base_dList.v_Base_dList_dreverse (Base_dPair.v_Base_dPair_dsecondOf parts)))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx))) (Base_dPair.v_Base_dPair_dfirstOf resolved))) (Base_dPair.v_Base_dPair_dsecondOf resolved)))

# 343 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceWithIfaces = (fun nFs nEnv nProcess ctx label source ifaces -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) (v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__394) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__394)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__395) -> (match ((v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__395) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__396; Base_dPair.f_Base_dPair_dPair_second = dtb__397 } -> ((fun missing -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength missing) = 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match (((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) ((v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf ifaces) dtb__397)) dtb__396) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__398) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__398))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__399) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__399)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__400) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__400))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__401) -> (match (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts ctx) dtb__399) dtb__401) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__402) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__402))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__403) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__403)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else ((((((v_Vuna_dCompiler_dDriver_dDt_ddtCheckSource nFs) nEnv) nProcess) ctx) label) source))) (if ((Base_dList.v_Base_dList_dlength missing) > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("iface-fallback=check missing=" ^ ((Base_dString.v_Base_dString_djoin ",") missing))) else 0) else 0))) (((v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__397) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dDriver_dIface.v_Vuna_dCompiler_dDriver_dIface_dmiNameOf) ifaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-source=check modules=" ^ (bi_strFromInt (Base_dList.v_Base_dList_dlength ifaces)))) else 0)))

# 1190 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackage = (fun loaderWarns depCps cleanCps prog parts next -> ((fun assembled -> ((fun warns -> ((fun checked -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dDt_dcheckDtProgramOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas assembled)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs assembled))) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (checked)); Base_dPair.f_Base_dPair_dPair_second = next }))))) { f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedProgram = assembled; f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedModules = (Base_dPair.v_Base_dPair_dsecondOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedEntryDecls = (Base_dPair.v_Base_dPair_dfirstOf parts); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedInherited = (v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf depCps); f_Vuna_dCompiler_dDriver_dDt_dCheckedPackage_checkedWarnings = warns })) ((Base_dList.v_Base_dList_dappend loaderWarns) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDatas) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) depCps)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedDefs) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dDriver_dCache.v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals) cleanCps)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings prog) }))

# 1308 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceChecked = (fun nFs nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> (match projectR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__404) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__404)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__405) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsMarkEff "vuna.resolve")) (fun _u -> ((v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dFlatten.v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease ctx)) dtb__405)))))
  | _ -> failwith "DT: impossible branch"
))))

# 253 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckModuleFile = (fun nFs nEnv nProcess ctx path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun text -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceChecked nFs) nEnv) nProcess) ctx) path) text)) (fun checked -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match checked with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__406) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__406))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__407) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf dtb__407)))
  | _ -> failwith "DT: impossible branch"
)))))))

# 1559 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithIfacesParts = (fun nFs nEnv nProcess ctx entry ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsWithIfaces nFs) nEnv) nProcess) ctx) entry) ifaces)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__408) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__408))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__409) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__409)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__410) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__410))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__411) -> (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts ctx) dtb__409) dtb__411)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1594 "Vuna/Compiler/Driver/Dt.vuna"
let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageWithIfacesParts = (fun nFs nEnv nProcess ctx names ifaces -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsWithIfaces nFs) nEnv) nProcess) ctx) names) ifaces)) (fun partsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match partsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__412) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__412))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__413) -> (match (v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms (((v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) (Base_dPair.v_Base_dPair_dsecondOf dtb__413)) ifaces)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__414) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__414))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__415) -> (((v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts ctx) dtb__413) dtb__415)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
