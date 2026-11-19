open Vuna_runtime
type t_CheckedPackage = { f_CheckedPackage_checkedProgram : Elab_dTypes.t_DtProgram; f_CheckedPackage_checkedModules : Loader_dModules.t_Module B_dData_dList.t_List; f_CheckedPackage_checkedEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_CheckedPackage_checkedInherited : string B_dData_dList.t_List; f_CheckedPackage_checkedWarnings : Base_dDiag.t_Diagnostic B_dData_dList.t_List }
and t_GenMeta = { f_GenMeta_genMetaId : int; f_GenMeta_genMetaName : string; f_GenMeta_genMetaKind : Core_dTerm.t_Term }
and t_AuxCache = { f_AuxCache_auxCacheKey : string; f_AuxCache_auxCacheDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_AuxCache_auxCacheStart : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair; f_AuxCache_auxCacheDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_AuxCache_auxCacheCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List }
and t_DtIncrSetup = { f_DtIncrSetup_dsStartEc : Elab_dTypes.t_Ec; f_DtIncrSetup_dsStartGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtIncrSetup_dsTermAux : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsPrepared : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_DtIncrSetup_dsDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsNext : t_AuxCache B_dData_dMaybe.t_Maybe }

# 77 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtProjectDecls = (fun (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)))) (B_dData_dPair.v_firstOf parts)))

# 81 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoad = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Loader_dFlatten.v_loadProject nFs) nEnv) nProcess) ctx) entry)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__0) -> (Base_dDiag.C_Check_ErrC (dtb__0))
  | Base_dDiag.C_Check_OkC (dtb__1) -> ((fun _u -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__1) with
  | Base_dDiag.C_Check_ErrC (dtb__2) -> (Base_dDiag.C_Check_ErrC (dtb__2))
  | Base_dDiag.C_Check_OkC (dtb__3) -> ((fun _u -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__3)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf dtb__3) }))) (if (dtp_debug_on 0) then (dtp_debug_line "resolve-done") else 0))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line "load-modules-done") else 0))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line "load-start") else 0)))

# 106 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsForCheck = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Loader_dFlatten.v_loadProject nFs) nEnv) nProcess) ctx) entry)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__4) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__4)))
  | Base_dDiag.C_Check_OkC (dtb__5) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__5))))
  | _ -> failwith "DT: impossible branch"
))))))

# 118 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Loader_dFlatten.v_loadProjectModules nFs) nEnv) nProcess) ctx) names)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__6) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__6)))
  | Base_dDiag.C_Check_OkC (dtb__7) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__7))))
  | _ -> failwith "DT: impossible branch"
))))))

# 243 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealSpan = { Base_dSource.f_Span_spanFile = "<seal>"; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 246 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_opaqueSigType = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | Frontend_dAst.C_Decl_DSig (dtb__10, dtb__11, dtb__12, dtb__13) -> (if (dtb__10 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__12)) else ((v_opaqueSigType mc0) dtb__9))
  | _ -> ((v_opaqueSigType mc0) dtb__9)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealDeclOf = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (name : string) -> ((fun ty -> (Frontend_dAst.C_Decl_DAxiom (("vuna_seal_" ^ name), ty, v_sealSpan))) (match ((v_opaqueSigType name) decls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> dtb__14
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar ("Type", v_sealSpan))
  | _ -> failwith "DT: impossible branch"
)))

# 223 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_sealAbstractAfter = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (match dtb__15 with
  | Frontend_dAst.C_Decl_DFun (dtb__17, dtb__18, dtb__19, dtb__20) -> (if ((B_dData_dList.v_memName dtb__17) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__15, (B_dData_dList.C_List__x58__x58_ (((v_sealDeclOf (B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16))) dtb__17), ((v_sealAbstractAfter dtb__16) mc1))))) else (B_dData_dList.C_List__x58__x58_ (dtb__15, ((v_sealAbstractAfter dtb__16) mc1))))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__15, ((v_sealAbstractAfter dtb__16) mc1)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealModule = (fun (m : Loader_dModules.t_Module) -> ((fun decls -> ((fun names -> ((fun abstracts -> ((fun opaques -> ((fun body -> ((B_dData_dList.v_append body) ((B_dData_dList.v_map (v_sealDeclOf decls)) opaques))) ((v_sealAbstractAfter decls) abstracts))) ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not (Loader_dFlatten.v_isAbstractOpaqueName n)))) names)))) ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_filter Loader_dFlatten.v_isAbstractOpaqueName) names)))) (Loader_dModules.v_moduleOpaqueOf m))) (Loader_dModules.v_moduleDeclsOf m)))

# 210 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealOpaqueDecls = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) (B_dData_dList.v_reverse modules))) entryDecls))

# 275 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFileHasModuleHeader = (fun (nFs : string) (nEnv : string) (nProcess : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Loader_dFlatten.v_parseFileWithPath nFs) nEnv) nProcess) path) text)) (fun parsed -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__21) -> (match dtb__21 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__22; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__23; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__24; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__25; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__26; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__27; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__28 } -> (match dtb__22 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) parsed)))))))

# 367 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__30) -> (Base_dDiag.C_Check_ErrC (dtb__30))
  | Base_dDiag.C_Check_OkC (dtb__31) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__31) with
  | Base_dDiag.C_Check_ErrC (dtb__32) -> (Base_dDiag.C_Check_ErrC (dtb__32))
  | Base_dDiag.C_Check_OkC (dtb__33) -> (match (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__33))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__33))))) with
  | Base_dDiag.C_Check_ErrC (dtb__34) -> (Base_dDiag.C_Check_ErrC (dtb__34))
  | Base_dDiag.C_Check_OkC (dtb__35) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__33)) (Elab_dTypes.v_dtProgWarnings dtb__35))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 388 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_missingDepModules = (fun (mc0 : string) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (if (if ((Loader_dModules.v_modulePackageOf dtb__36) <> mc0) then (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb__36)) mc2)) false) else false) then (B_dData_dList.C_List__x58__x58_ ((Loader_dModules.v_moduleNameOf dtb__36), (((v_missingDepModules mc0) dtb__37) mc2))) else (((v_missingDepModules mc0) dtb__37) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_allocMetas = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Elab_dTypes.t_Ec) (mc2 : int B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match ((Elab_dTypes.v_newMeta mc0) mc1) with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> (match (((v_allocMetas mc0) dtb__41) dtb__39) with
  | { B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = dtb__43 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__42)); B_dData_dPair.f_Pair_second = dtb__43 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_buildPi = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, dtb__44, ((v_buildPi dtb__45) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_allocTelescopes = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Elab_dTypes.t_Ec) (mc2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__46 with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> (match (((v_allocMetas mc0) mc1) ((B_dData_dList.v_range 0) dtb__49)) with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (match (((v_allocMetas mc0) dtb__51) ((B_dData_dList.v_range 0) 1)) with
  | { B_dData_dPair.f_Pair_first = dtb__52; B_dData_dPair.f_Pair_second = dtb__53 } -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (match dtb__55 with
  | B_dData_dList.C_List_Nil -> (match (((v_allocTelescopes mc0) dtb__53) dtb__47) with
  | { B_dData_dPair.f_Pair_first = dtb__56; B_dData_dPair.f_Pair_second = dtb__57 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = ((v_buildPi dtb__50) dtb__54) }, dtb__56)); B_dData_dPair.f_Pair_second = dtb__57 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__53 }
)
  | _ -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__53 }
)) dtb__52)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 669 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findDtDef = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (if ((Elab_dTypes.v_dtDefName dtb__58) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__58)) else ((v_findDtDef mc0) dtb__59))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 674 "Vuna/Compiler/Driver/Dt.vuna"
let v_loadReplDecls = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadProjectSource nFs) nEnv) nProcess) ctx) "<repl>") source)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__60) -> (Base_dDiag.C_Check_ErrC (dtb__60))
  | Base_dDiag.C_Check_OkC (dtb__61) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__61) with
  | Base_dDiag.C_Check_ErrC (dtb__62) -> (Base_dDiag.C_Check_ErrC (dtb__62))
  | Base_dDiag.C_Check_OkC (dtb__63) -> (Base_dDiag.C_Check_OkC ((v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__63))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 688 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtBindingTypes = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_loadReplDecls nFs) nEnv) nProcess) ctx) program)) (fun declsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match declsR with
  | Base_dDiag.C_Check_ErrC (dtb__64) -> (Base_dDiag.C_Check_ErrC (dtb__64))
  | Base_dDiag.C_Check_OkC (dtb__65) -> (match (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls dtb__65)) with
  | Base_dDiag.C_Check_ErrC (dtb__66) -> (Base_dDiag.C_Check_ErrC (dtb__66))
  | Base_dDiag.C_Check_OkC (dtb__67) -> (match (Elab_dDriver.v_ecOfProgram dtb__67) with
  | { B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 } -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = (Core_dTerm.v_showTypeSig (((Elab_dMeta.v_zonkTerm dtb__68) 0) (Elab_dTypes.v_dtDefType d))) })) (Elab_dTypes.v_dtProgDefs dtb__67))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 732 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_pickFreshName = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> ((fun cand -> (if ((B_dData_dList.v_memName cand) mc1) then (((v_pickFreshName mc0) mc1) dtb__71) else cand)) (if (dtb__70 = 0) then mc0 else (String.concat "" [mc0; "_"; (bi_strFromInt dtb__70)])))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 729 "Vuna/Compiler/Driver/Dt.vuna"
let v_freshMetaName = (fun (base : string) (taken : string B_dData_dList.t_List) -> (((v_pickFreshName base) taken) (B_dData_dList.C_List__x58__x58_ (0, ((B_dData_dList.v_range 1) 64)))))

# 741 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_substGenMetas = (fun (mc0 : Core_dTerm.t_Term) (mc1 : t_GenMeta B_dData_dList.t_List) (mc2 : int) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> ((((v_substGenMetas ((((Core_dTerm.v_substMetaVar (dtb__72).f_GenMeta_genMetaId) (dtb__72).f_GenMeta_genMetaName) ((mc2 + 1) - mc3)) mc0)) dtb__73) (mc2 + 1)) mc3)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 746 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_wrapGenMetas = (fun (mc0 : t_GenMeta B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (Core_dTerm.C_Term_TPi ((dtb__74).f_GenMeta_genMetaName, true, Core_dTerm.C_Rig_RigOmega, (dtb__74).f_GenMeta_genMetaKind, ((v_wrapGenMetas dtb__75) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 753 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_kindArrows = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), (v_kindArrows dtb__77)))
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
))

# 750 "Vuna/Compiler/Driver/Dt.vuna"
let v_kindOfArity = (fun (k : int) -> (v_kindArrows ((B_dData_dList.v_range 0) k)))

# 758 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_metaIdsOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TIf (dtb__78, dtb__79, dtb__80) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__78)) ((B_dData_dList.v_append (v_metaIdsOf dtb__79)) (v_metaIdsOf dtb__80)))
  | Core_dTerm.C_Term_TCase (dtb__81, dtb__82) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__81)) ((B_dData_dList.v_concatMap v_metaIdsOfAlt) dtb__82))
  | Core_dTerm.C_Term_TCon (dtb__83, dtb__84) -> (v_metaIdsOfArgs dtb__84)
  | Core_dTerm.C_Term_TApp (dtb__85, dtb__86, dtb__87) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__85)) (v_metaIdsOf dtb__86))
  | Core_dTerm.C_Term_TLam (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> ((fun tys -> ((B_dData_dList.v_append tys) (v_metaIdsOf dtb__92))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (match dtb__93 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> ((B_dData_dList.v_append (v_metaIdsOfMaybe dtb__94)) (v_metaIdsOfMaybe dtb__95))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) dtb__90))
  | Core_dTerm.C_Term_TPi (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__99)) (v_metaIdsOf dtb__100))
  | Core_dTerm.C_Term_TMeta (dtb__101) -> (B_dData_dList.C_List__x58__x58_ (dtb__101, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 774 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfMaybe = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> (v_metaIdsOf dtb__102)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 778 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (match dtb__103 with
  | { B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = dtb__106 } -> ((B_dData_dList.v_append (v_metaIdsOf dtb__105)) (v_metaIdsOfArgs dtb__104))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 782 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfAlt = (fun (mc0 : Core_dTerm.t_CaseAlt) -> (match mc0 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__107; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__108; Core_dTerm.f_CaseAlt_caseAltBody = dtb__109 } -> (v_metaIdsOf dtb__109)
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupInts = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (if ((Elab_dMeta.v_memMetaId dtb__110) dtb__111) then (v_dedupInts dtb__111) else (B_dData_dList.C_List__x58__x58_ (dtb__110, (v_dedupInts dtb__111))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 822 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_headIsMeta = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TMeta (dtb__112) -> (mc0 = dtb__112)
  | Core_dTerm.C_Term_TApp (dtb__113, dtb__114, dtb__115) -> ((v_headIsMeta mc0) dtb__113)
  | _ -> false
))

# 827 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_spineLen = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__116, dtb__117, dtb__118) -> (1 + (v_spineLen dtb__116))
  | _ -> 0
))

# 819 "Vuna/Compiler/Driver/Dt.vuna"
let v_applyArity = (fun (m : int) (t : Core_dTerm.t_Term) -> (if ((v_headIsMeta m) t) then (v_spineLen t) else 0))

# 831 "Vuna/Compiler/Driver/Dt.vuna"
let v_imax = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 790 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_maxMetaArity = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__119, dtb__120, dtb__121) -> ((v_imax ((v_maxMetaArity mc0) dtb__119)) ((v_imax ((v_maxMetaArity mc0) dtb__120)) ((v_maxMetaArity mc0) dtb__121)))
  | Core_dTerm.C_Term_TCase (dtb__122, dtb__123) -> ((v_imax ((v_maxMetaArity mc0) dtb__122)) ((v_maxMetaArityAlts mc0) dtb__123))
  | Core_dTerm.C_Term_TCon (dtb__124, dtb__125) -> ((v_maxMetaArityArgs mc0) dtb__125)
  | Core_dTerm.C_Term_TLam (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> ((fun tys -> ((v_imax tys) ((v_maxMetaArity mc0) dtb__130))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> (match dtb__131 with
  | { B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = dtb__133 } -> ((v_imax ((v_maxMetaArityMaybe mc0) dtb__132)) ((v_maxMetaArityMaybe mc0) dtb__133))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
)) dtb__128))
  | Core_dTerm.C_Term_TPi (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> ((v_imax ((v_maxMetaArity mc0) dtb__137)) ((v_maxMetaArity mc0) dtb__138))
  | Core_dTerm.C_Term_TApp (dtb__139, dtb__140, dtb__141) -> ((v_imax ((v_applyArity mc0) (Core_dTerm.C_Term_TApp (dtb__139, dtb__140, dtb__141)))) ((v_imax ((v_maxMetaArity mc0) dtb__139)) ((v_maxMetaArity mc0) dtb__140)))
  | _ -> 0
))
# 807 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityMaybe = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> ((v_maxMetaArity mc0) dtb__142)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
# 811 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (match dtb__143 with
  | { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = dtb__146 } -> ((v_imax ((v_maxMetaArity mc0) dtb__145)) ((v_maxMetaArityArgs mc0) dtb__144))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 815 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityAlts = (fun (mc0 : int) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> ((v_imax ((v_maxMetaArity mc0) (Core_dTerm.v_caseAltBody dtb__147))) ((v_maxMetaArityAlts mc0) dtb__148))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 721 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_buildGenMetas = (fun (mc0 : int B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> ((fun name -> ((fun kind -> (B_dData_dList.C_List__x58__x58_ ({ f_GenMeta_genMetaId = dtb__149; f_GenMeta_genMetaName = name; f_GenMeta_genMetaKind = kind }, ((((v_buildGenMetas dtb__150) (B_dData_dList.C_List__x58__x58_ (name, mc1))) (mc2 + 1)) mc3)))) (v_kindOfArity ((v_maxMetaArity dtb__149) mc3)))) ((v_freshMetaName ("t" ^ (bi_strFromInt mc2))) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_listLen = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (1 + (v_listLen dtb__152))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 626 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findArity = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (match dtb__153 with
  | Frontend_dAst.C_Decl_DFun (dtb__155, dtb__156, dtb__157, dtb__158) -> (if (dtb__155 = mc0) then (B_dData_dMaybe.C_Maybe_Just ((v_listLen dtb__156))) else ((v_findArity mc0) dtb__154))
  | _ -> ((v_findArity mc0) dtb__154)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 618 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_aritiesOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match ((v_findArity dtb__159) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err (String.concat "" ["\232\135\170\229\138\168\231\173\190\229\144\141\239\188\154\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 "; dtb__159; "\239\188\136\233\156\128\232\166\129 DFun\239\188\137"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> ((Base_dCommon.v_bind ((v_aritiesOf dtb__160) mc1)) (fun (more : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__161 }, more))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 705 "Vuna/Compiler/Driver/Dt.vuna"
let v_generalizeSignature = (fun (ty : Core_dTerm.t_Term) (taken : string B_dData_dList.t_List) -> ((fun metas -> (if ((B_dData_dList.v_length metas) = 0) then (Base_dDiag.C_Check_OkC ((Core_dTerm.v_showTypeSig ty))) else (if ((B_dData_dList.v_length metas) > 8) then (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\231\154\132\231\177\187\229\158\139\229\143\130\230\149\176\232\182\133\232\191\135 8 \228\184\170\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else ((fun entries -> ((fun total -> ((fun body -> ((fun sigText -> (if ((B_dData_dString.v_contains "?") sigText) then (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\231\154\132\231\187\147\230\158\156\228\187\141\229\144\171\230\156\170\232\167\163\229\133\131\229\143\152\233\135\143\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else (Base_dDiag.C_Check_OkC (sigText)))) (Core_dTerm.v_showTypeSig ((v_wrapGenMetas entries) body)))) ((((v_substGenMetas ty) entries) 0) total))) (v_listLen entries))) ((((v_buildGenMetas metas) taken) 0) ty))))) (v_dedupInts (v_metaIdsOf ty))))

# 659 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_inferEachType = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtProgram) (mc2 : Elab_dTypes.t_Ec) (mc3 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (match ((v_findDtDef dtb__162) (Elab_dTypes.v_dtProgDefs mc1)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err ("\232\135\170\229\138\168\231\173\190\229\144\141\239\188\154\231\178\190\229\140\150\231\187\147\230\158\156\233\135\140\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 " ^ dtb__162))
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> ((Base_dCommon.v_bind ((v_generalizeSignature (((Elab_dMeta.v_zonkTerm mc2) 0) (Elab_dTypes.v_dtDefType dtb__164))) mc3)) (fun (sigText : string) -> ((Base_dCommon.v_bind ((((v_inferEachType dtb__163) mc1) mc2) mc3)) (fun (more : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__162; B_dData_dPair.f_Pair_second = sigText }, more))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtInferDefTypes = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (targets : string B_dData_dList.t_List) (defSource : string) -> (if ((B_dData_dList.v_length targets) = 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__165) -> (match dtb__165 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__166; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__167; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__168; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__169; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__170; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__171; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__172 } -> (match dtb__166 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__173) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\228\184\141\230\148\175\230\140\129\230\168\161\229\157\151\230\150\135\228\187\182"))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_aritiesOf targets) dtb__169) with
  | Base_dDiag.C_Check_ErrC (dtb__174) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__174)))
  | Base_dDiag.C_Check_OkC (dtb__175) -> (match (((v_allocTelescopes Elab_dTypes.v_emptyCtx) Elab_dTypes.v_ecEmpty) dtb__175) with
  | { B_dData_dPair.f_Pair_first = dtb__176; B_dData_dPair.f_Pair_second = dtb__177 } -> ((fun startGlobals -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_loadReplDecls nFs) nEnv) nProcess) ctx) (String.concat "" [program; "\n"; defSource; "\n"]))) (fun allDeclsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match allDeclsR with
  | Base_dDiag.C_Check_ErrC (dtb__178) -> (Base_dDiag.C_Check_ErrC (dtb__178))
  | Base_dDiag.C_Check_OkC (dtb__179) -> (match (((Elab_dDriver.v_elabProgramFullWith dtb__177) startGlobals) (Frontend_dRast_dBridge.v_toRastDecls dtb__179)) with
  | Base_dDiag.C_Check_ErrC (dtb__180) -> (Base_dDiag.C_Check_ErrC (dtb__180))
  | Base_dDiag.C_Check_OkC (dtb__181) -> ((fun taken -> (match (Elab_dDriver.v_ecOfProgram dtb__181) with
  | { B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 } -> ((((v_inferEachType targets) dtb__181) dtb__182) taken)
  | _ -> failwith "DT: impossible branch"
)) (Frontend_dAst.v_topNames dtb__179))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) ((B_dData_dList.v_append dtb__176) Elab_dPrelude.v_preludeGlobals))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__184) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__184)))
  | _ -> failwith "DT: impossible branch"
)) ((Frontend_dParser.v_parseSource "<repl>") defSource))))

# 839 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__185) -> (Base_dDiag.C_Check_ErrC (dtb__185))
  | Base_dDiag.C_Check_OkC (dtb__186) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__186) with
  | Base_dDiag.C_Check_ErrC (dtb__187) -> (Base_dDiag.C_Check_ErrC (dtb__187))
  | Base_dDiag.C_Check_OkC (dtb__188) -> (Elab_dDriver.v_goalsOfProgram (Frontend_dRast_dBridge.v_toRastDecls (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__188))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 853 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceTolerant = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__189) -> (Base_dDiag.C_Check_ErrC (dtb__189))
  | Base_dDiag.C_Check_OkC (dtb__190) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__190) with
  | Base_dDiag.C_Check_ErrC (dtb__191) -> (Base_dDiag.C_Check_ErrC (dtb__191))
  | Base_dDiag.C_Check_OkC (dtb__192) -> (Elab_dDriver.v_goalsOfProgramTolerant (Frontend_dRast_dBridge.v_toRastDecls (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__192))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 901 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainKindNames = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_intTypeName; B_dData_dPair.f_Pair_second = "Int" }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_natTypeName; B_dData_dPair.f_Pair_second = "Nat" }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_strTypeName; B_dData_dPair.f_Pair_second = "String" }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_boolTypeName; B_dData_dPair.f_Pair_second = "Bool" }, B_dData_dList.C_List_Nil))))))))

# 916 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_lookupMainKind = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> (if ((B_dData_dPair.v_firstOf dtb__193) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__193))) else ((v_lookupMainKind mc0) dtb__194))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 910 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainKindForName = (fun (g : string) -> (match ((v_lookupMainKind g) v_mainKindNames) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> (Base_dDiag.C_Check_OkC (dtb__195))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ("Other"))
  | _ -> failwith "DT: impossible branch"
))

# 921 "Vuna/Compiler/Driver/Dt.vuna"
let v_replExprName = "vuna_repl_expr"

# 925 "Vuna/Compiler/Driver/Dt.vuna"
let v_splitReplExpr = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__196 with
  | Frontend_dAst.C_Decl_DFun (dtb__198, dtb__199, dtb__200, dtb__201) -> (if (dtb__198 = v_replExprName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__197); B_dData_dPair.f_Pair_second = dtb__200 })) else (Base_dDiag.v_icInternal "REPL expression definition is not last"))
  | _ -> (Base_dDiag.v_icInternal "REPL expression was not parsed as a definition")
)
  | _ -> (Base_dDiag.v_icInternal "REPL expression was not parsed as a definition")
)) (B_dData_dList.v_reverse decls)))

# 323 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramFull = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadProjectSource nFs) nEnv) nProcess) ctx) "<repl>") (String.concat "" [program; "\n"; v_replExprName; " = "; exprSource; "\n"]))) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__202) -> (Base_dDiag.C_Check_ErrC (dtb__202))
  | Base_dDiag.C_Check_OkC (dtb__203) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__203) with
  | Base_dDiag.C_Check_ErrC (dtb__204) -> (Base_dDiag.C_Check_ErrC (dtb__204))
  | Base_dDiag.C_Check_OkC (dtb__205) -> (match (v_splitReplExpr ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__205))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__205)))) with
  | Base_dDiag.C_Check_ErrC (dtb__206) -> (Base_dDiag.C_Check_ErrC (dtb__206))
  | Base_dDiag.C_Check_OkC (dtb__207) -> (match (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls (B_dData_dPair.v_firstOf dtb__207))) with
  | Base_dDiag.C_Check_ErrC (dtb__208) -> (Base_dDiag.C_Check_ErrC (dtb__208))
  | Base_dDiag.C_Check_OkC (dtb__209) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__209; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__207) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 342 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExpr = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_replProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__210) -> (Base_dDiag.C_Check_ErrC (dtb__210))
  | Base_dDiag.C_Check_OkC (dtb__211) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb__211)) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf dtb__211)))
  | _ -> failwith "DT: impossible branch"
)))))

# 355 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfo = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_replProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__212) -> (Base_dDiag.C_Check_ErrC (dtb__212))
  | Base_dDiag.C_Check_OkC (dtb__213) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb__213)) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf dtb__213)))
  | _ -> failwith "DT: impossible branch"
)))))

# 974 "Vuna/Compiler/Driver/Dt.vuna"
let v_interpMainShow = (fun (table : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (sols : Core_dTerm.t_Sols) (mainVal : Core_dTerm.t_Value) -> (match ((((Core_dEval.v_normalize ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) table)) sols) Core_dTerm.v_defaultFuel) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_mainShowDefName, (B_dData_dList.C_List__x58__x58_ (mainVal, B_dData_dList.C_List_Nil))))))) with
  | Core_dTerm.C_Value_VStr (dtb__214) -> (Base_dDiag.C_Check_OkC (dtb__214))
  | _ -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_MainNotValue)
))

# 983 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainActionKind = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__215, dtb__216, dtb__217) -> (match dtb__215 with
  | Core_dTerm.C_Term_TApp (dtb__218, dtb__219, dtb__220) -> (match dtb__218 with
  | Core_dTerm.C_Term_TGlobal (dtb__221) -> (if (dtb__221 = Base_dIntrinsics.v_effTypeName) then "Eff" else "")
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 991 "Vuna/Compiler/Driver/Dt.vuna"
let v_isNilRowTermDt = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__222, dtb__223) -> (match dtb__223 with
  | B_dData_dList.C_List_Nil -> (dtb__222 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
)
  | Core_dTerm.C_Term_TGlobal (dtb__224) -> (dtb__224 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 996 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findMainDef = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> (if ((Elab_dTypes.v_dtDefName dtb__225) = "main") then (B_dData_dMaybe.C_Maybe_Just (dtb__225)) else (v_findMainDef dtb__226))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1001 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_defTableOf = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__227, dtb__228) -> (match (Elab_dTypes.v_dtDefBody dtb__227) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb__227); B_dData_dPair.f_Pair_second = dtb__229 }, (v_defTableOf dtb__228)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_defTableOf dtb__228)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 872 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtMainKind = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_dtLoad nFs) nEnv) nProcess) ctx) entry)) (fun declsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match declsR with
  | Base_dDiag.C_Check_ErrC (dtb__230) -> (Base_dDiag.C_Check_ErrC (dtb__230))
  | Base_dDiag.C_Check_OkC (dtb__231) -> (match (Elab_dDriver.v_elabProgram (Frontend_dRast_dBridge.v_toRastDecls (B_dData_dPair.v_firstOf dtb__231))) with
  | Base_dDiag.C_Check_ErrC (dtb__232) -> (Base_dDiag.C_Check_ErrC (dtb__232))
  | Base_dDiag.C_Check_OkC (dtb__233) -> (match (v_findMainDef (B_dData_dPair.v_secondOf dtb__233)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dCg.v_cgErr0At { Base_dSource.f_Span_spanFile = entry; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) Base_dDiagnostics_dCg.C_CgErr_NoMain)
  | B_dData_dMaybe.C_Maybe_Just (dtb__234) -> (if ((v_mainActionKind (Elab_dTypes.v_dtDefType dtb__234)) = "Eff") then (Base_dDiag.C_Check_OkC ("Eff")) else (match ((((Core_dEval.v_force ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) (v_defTableOf (B_dData_dPair.v_secondOf dtb__233)))) Core_dTerm.v_solsEmpty) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType dtb__234))) with
  | Core_dTerm.C_Value_VNeutral (dtb__235) -> (match dtb__235 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__236, dtb__237) -> (match dtb__237 with
  | B_dData_dList.C_List_Nil -> (v_mainKindForName dtb__236)
  | _ -> (Base_dDiag.C_Check_OkC ("Other"))
)
  | _ -> (Base_dDiag.C_Check_OkC ("Other"))
)
  | _ -> (Base_dDiag.C_Check_OkC ("Other"))
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 948 "Vuna/Compiler/Driver/Dt.vuna"
let v_evalDtMainCore = (fun (program : Elab_dTypes.t_DtProgram) -> (match (v_findMainDef (Elab_dTypes.v_dtProgDefs program)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain)
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> ((fun table -> ((fun sols -> ((fun mainVal -> (if (B_dData_dBool.v_not ((v_mainActionKind (Elab_dTypes.v_dtDefType dtb__238)) = "")) then (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_InterpCannotExecuteEffects) else (match mainVal with
  | Core_dTerm.C_Value_VInt (dtb__239) -> (Base_dDiag.C_Check_OkC ((bi_strFromInt dtb__239)))
  | Core_dTerm.C_Value_VStr (dtb__240) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue mainVal)))
  | Core_dTerm.C_Value_VBool (dtb__241) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue mainVal)))
  | Core_dTerm.C_Value_VFloat (dtb__242) -> (Base_dDiag.C_Check_OkC (dtb__242))
  | Core_dTerm.C_Value_VCon (dtb__243, dtb__244) -> (match (Core_dEval.v_natValueToInt mainVal) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__245) -> (Base_dDiag.C_Check_OkC ((bi_strFromInt dtb__245)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_interpMainShow table) sols) mainVal)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_interpMainShow table) sols) mainVal)
))) ((((Core_dEval.v_normalize ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) table)) sols) Core_dTerm.v_defaultFuel) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("main", B_dData_dList.C_List_Nil))))))) Core_dTerm.v_solsEmpty)) (v_defTableOf (Elab_dTypes.v_dtProgDefs program)))
  | _ -> failwith "DT: impossible branch"
))

# 937 "Vuna/Compiler/Driver/Dt.vuna"
let v_evalDtMain = (fun (program : Elab_dTypes.t_DtProgram) -> (v_evalDtMainCore program))

# 299 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalFile = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__246) -> (Base_dDiag.C_Check_ErrC (dtb__246))
  | Base_dDiag.C_Check_OkC (dtb__247) -> ((fun parts -> ((fun decls -> ((Base_dCommon.v_bind (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls decls))) v_evalDtMain)) ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf parts)) (B_dData_dPair.v_firstOf parts)))) (B_dData_dPair.v_secondOf dtb__247))
  | _ -> failwith "DT: impossible branch"
)))))

# 1012 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry))

# 1021 "Vuna/Compiler/Driver/Dt.vuna"
let v_cachedNamesOne = (fun (cp : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Driver_dCache.v_cachedDatas cp))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors d)))) (Driver_dCache.v_cachedDatas cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Driver_dCache.v_cachedDefs cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Driver_dCache.v_cachedGlobals cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstName) (Driver_dCache.v_cachedInsts cp))) ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Driver_dCache.v_cachedClasses cp))))))))

# 1018 "Vuna/Compiler/Driver/Dt.vuna"
let v_cachedNamesOf = (fun (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_cachedNamesOne) progs))

# 1090 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_maxMetaList = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__248, dtb__249) -> ((v_maxMetaList (if (dtb__248 > mc0) then dtb__248 else mc0)) dtb__249)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1094 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaDef = (fun (m : int) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__250) -> ((v_maxMetaList m) (Elab_dMeta.v_termMetasAll dtb__250))
  | B_dData_dMaybe.C_Maybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))

# 1100 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaCached = (fun (m : int) (cp : Driver_dCache.t_CachedProgram) -> (((B_dData_dList.v_foldl v_maxMetaDef) m) (Driver_dCache.v_cachedDefs cp)))

# 1103 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaCps = (fun (cps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_maxMetaCached) (0 - 1)) cps))

# 1106 "Vuna/Compiler/Driver/Dt.vuna"
let v_cleanStartNext = (fun (cps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((fun m -> (if (m < 0) then 0 else (m + 1))) (v_maxMetaCps cps)))

# 1119 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupKeepLastGo = (fun mc0 mc1 (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) mc3 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> ((fun k -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) k) mc2) then ((((v_dedupKeepLastGo mc0) dtb__252) mc2) mc3) else ((((v_dedupKeepLastGo mc0) dtb__252) ((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) k) true) mc2)) (B_dData_dList.C_List__x58__x58_ (dtb__251, mc3))))) (mc0 dtb__251))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1116 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupKeepLast = (fun key xs -> ((((v_dedupKeepLastGo key) (B_dData_dList.v_reverse xs)) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 1134 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDefs = (fun (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtDefName) ds))

# 1137 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_bodyPairs = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> (match (Elab_dTypes.v_dtDefBody dtb__253) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__255) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb__253); B_dData_dPair.f_Pair_second = dtb__255 }, (v_bodyPairs dtb__254)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_bodyPairs dtb__254)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1131 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDefBodies = (fun (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (v_bodyPairs (v_dedupDefs ds)))

# 1144 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDatas = (fun (ds : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtDataName) ds))

# 1147 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupInsts = (fun (ds : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtInstName) ds))

# 1150 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupClasses = (fun (ds : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtClassName) ds))

# 1153 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupGlobals = (fun (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_dedupKeepLast (fun (g : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf g))) gs))

# 1061 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOfAt = (fun (next : int) (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((fun datas -> ((fun dataKeys -> ((fun defGlobals -> ((fun globals -> ((fun opaqueNames -> ((fun bodies -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> { B_dData_dPair.f_Pair_first = ec6; B_dData_dPair.f_Pair_second = globals }) ((Elab_dTypes.v_ecPutDefTbl ec5) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) bodies)))) ((Elab_dTypes.v_ecPutGlobalsTbl ec4) ((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) globals)))) ((Elab_dTypes.v_ecPutNext ec3) next))) ((Elab_dDriver.v_addClassesEc ec2) (v_dedupClasses ((B_dData_dList.v_concatMap Driver_dCache.v_cachedClasses) progs))))) ((Elab_dDriver.v_addInstsEc ec1) (v_dedupInsts ((B_dData_dList.v_concatMap Driver_dCache.v_cachedInsts) progs))))) ((Elab_dDriver.v_addDatasEc ec0) datas))) Elab_dTypes.v_ecEmpty)) ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf p)) opaqueNames)))) (v_dedupDefBodies ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) progs))))) ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedOpaqueOf) progs)))) ((B_dData_dList.v_append defGlobals) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDataKind d) })) datas)))) ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf p)) dataKeys)) false))) (v_dedupGlobals ((B_dData_dList.v_append Elab_dPrelude.v_preludeGlobals) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) progs)))))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas)) ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors d)))) datas)))) (v_dedupDatas ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) progs))))

# 1086 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOf = (fun (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((v_depStartOfAt 0) progs))

# 1183 "Vuna/Compiler/Driver/Dt.vuna"
let v_sortNames = (fun (_uarity0 : string B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (a : string) (b : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_uString) a) b))) _uarity0))

# 1191 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupSortedGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> ((v_dedupSortedGo dtb__257) (B_dData_dList.C_List__x58__x58_ (dtb__256, mc1)))
  | B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259) -> (if (dtb__256 = dtb__258) then ((v_dedupSortedGo dtb__257) mc1) else ((v_dedupSortedGo dtb__257) (B_dData_dList.C_List__x58__x58_ (dtb__256, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1188 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupSortedNames = (fun (xs : string B_dData_dList.t_List) -> (B_dData_dList.v_reverse ((v_dedupSortedGo xs) B_dData_dList.C_List_Nil)))

# 1198 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_nameSlotTbl = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__260; B_dData_dPair.f_Pair_second = mc1 }, ((v_nameSlotTbl dtb__261) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1202 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_shiftedDepProgramsGo = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> (match ((B_dData_dList.v_lookupPair (Driver_dIface.v_miNameOf dtb__262)) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("iface: dependency module missing from shift table: " ^ (Driver_dIface.v_miNameOf dtb__262)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> ((Base_dCommon.v_bind ((Driver_dCache.v_shiftCachedProgram ((dtb__264 + 1) * Driver_dCache.v_summaryMetaSegment)) (Driver_dIface.v_miCachedOf dtb__262))) (fun (cp : Driver_dCache.t_CachedProgram) -> ((Base_dCommon.v_bind ((v_shiftedDepProgramsGo mc0) dtb__263)) (fun (rest2 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (cp, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1172 "Vuna/Compiler/Driver/Dt.vuna"
let v_shiftedDepPrograms = (fun (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((fun names -> (if ((B_dData_dList.v_length names) <> (B_dData_dList.v_length ifaces)) then (Base_dDiag.v_icInternal "iface: duplicate dependency module name") else ((v_shiftedDepProgramsGo ((v_nameSlotTbl names) 0)) ifaces))) (v_dedupSortedNames (v_sortNames ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces)))))

# 1247 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtPrepareTermAux = (fun (aux : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls (Frontend_dRast_dBridge.v_toRastDecls aux))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings (B_dData_dPair.v_secondOf p))) (fun (ds : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast_dBridge.v_toAstDecls ds))))))))

# 1258 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dtAuxForTermination = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__266) -> (match dtb__265 with
  | Frontend_dAst.C_Decl_DFun (dtb__267, dtb__268, dtb__269, dtb__270) -> (match (Elab_dTermination_dMeasure.v_projectionOfDef { B_dData_dPair.f_Pair_first = dtb__267; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map Frontend_dRast_dBridge.v_toRastPat) dtb__268); B_dData_dPair.f_Pair_second = (Frontend_dRast_dBridge.v_toRastExpr dtb__269) }, B_dData_dList.C_List_Nil)) }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (B_dData_dList.C_List__x58__x58_ (dtb__265, (v_dtAuxForTermination dtb__266)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_dtAuxForTermination dtb__266)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__265, (v_dtAuxForTermination dtb__266)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1271 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtElabFullWithPrepared = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (termAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (preparedAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dRecords.v_prepareDeclsWith (Frontend_dRast_dBridge.v_toRastDecls termAux)) ((Elab_dDriver.v_maybeAddHasFieldInstances startGlobals) (Frontend_dRast_dBridge.v_toRastDecls decls)))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__272; B_dData_dPair.f_Pair_second = dtb__273 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb__273)) (fun (ds2 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (((((Elab_dDriver.v_elabProgramGoWithAux startEc) startGlobals) dtb__272) (Frontend_dRast_dBridge.v_toRastDecls (v_dtAuxForTermination preparedAux))) ds2)))
  | _ -> failwith "DT: impossible branch"
))))

# 1293 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxKeyOne = (fun (m : Driver_dIface.t_ModuleIface) -> (String.concat "" [(Driver_dIface.v_miNameOf m); ":"; (Driver_dIface.v_miIfaceHashOf m)]))

# 1296 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtAuxKey = (fun (pkg : string) (deps : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (bi_strFromInt (Driver_dIface.v_hashTextStrong (String.concat "" ["aux|"; pkg; "|"; ((B_dData_dString.v_join ";") ((B_dData_dList.v_map v_auxKeyOne) deps)); "|"; ((B_dData_dString.v_join ";") ((B_dData_dList.v_map v_auxKeyOne) clean))]))))

# 1301 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtAuxOfCache = (fun (mc0 : string) (mc1 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__274) -> (if ((dtb__274).f_AuxCache_auxCacheKey = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__274)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Driver/Dt.vuna"
let v_replCheckPartsAux = (fun (start : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) (pkgName : string) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((fun modules -> ((fun depsOnly -> ((fun oursOnly -> ((fun termAux -> ((fun ownDecls -> ((fun sourceDecls -> ((fun key -> ((fun cacheable -> ((fun cachedDecls -> ((fun prepared -> ((Base_dCommon.v_bind prepared) (fun (preparedAux : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_splitReplExpr sourceDecls)) (fun (p : (Frontend_dAst.t_Decl B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((((v_dtElabFullWithPrepared (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) termAux) preparedAux) (B_dData_dPair.v_firstOf p))) (fun (prog : Elab_dTypes.t_DtProgram) -> ((fun depDatas -> ((fun depDefs -> ((fun depGlobals -> ((fun assembled -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = assembled; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) }; B_dData_dPair.f_Pair_second = (if cacheable then (B_dData_dMaybe.C_Maybe_Just ({ f_AuxCache_auxCacheKey = key; f_AuxCache_auxCacheDecls = preparedAux; f_AuxCache_auxCacheStart = { B_dData_dPair.f_Pair_first = Elab_dTypes.v_ecEmpty; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; f_AuxCache_auxCacheDepCps = B_dData_dList.C_List_Nil; f_AuxCache_auxCacheCleanCps = B_dData_dList.C_List_Nil })) else B_dData_dMaybe.C_Maybe_Nothing) }))) { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append depDatas) (Elab_dTypes.v_dtProgDatas prog)); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append depDefs) (Elab_dTypes.v_dtProgDefs prog)); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append depGlobals) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) })) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) deps))) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) deps))) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps))))))))) (match cachedDecls with
  | B_dData_dMaybe.C_Maybe_Just (dtb__275) -> (Base_dDiag.C_Check_OkC ((dtb__275).f_AuxCache_auxCacheDecls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_dtPrepareTermAux termAux)
  | _ -> failwith "DT: impossible branch"
))) (if cacheable then ((v_dtAuxOfCache key) cache) else B_dData_dMaybe.C_Maybe_Nothing))) ((B_dData_dList.v_length ifaces) > 0))) (((v_dtAuxKey pkgName) ifaces) B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append ownDecls) (B_dData_dPair.v_firstOf parts)))) ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) oursOnly))) ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules))) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts))))

# 433 "Vuna/Compiler/Driver/Dt.vuna"
let v_replCheckParts = (fun (start : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) (pkgName : string) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((((v_replCheckPartsAux start) pkgName) deps) parts) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing)) (fun (r : ((Elab_dTypes.t_DtProgram, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf r))))))

# 1334 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalSetup = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((fun parts -> ((fun loaderWarns -> ((fun pkgName -> ((fun modules -> ((fun ours -> ((fun depsOnly -> ((fun cleanNames -> ((fun dirtyOurs -> ((fun decls -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun termAux -> ((fun key -> ((fun cacheable -> ((fun hit -> ((fun depCpsR -> ((fun ifacePrepared -> ((fun missingPrepared -> ((Base_dCommon.v_bind depCpsR) (fun (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((fun cleanCps -> ((fun start -> ((fun prepared -> ((Base_dCommon.v_bind prepared) (fun (preparedAux : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((fun next -> (Base_dDiag.C_Check_OkC ({ f_DtIncrSetup_dsStartEc = (B_dData_dPair.v_firstOf start); f_DtIncrSetup_dsStartGlobals = (B_dData_dPair.v_secondOf start); f_DtIncrSetup_dsTermAux = termAux; f_DtIncrSetup_dsPrepared = preparedAux; f_DtIncrSetup_dsDecls = decls; f_DtIncrSetup_dsWarns = loaderWarns; f_DtIncrSetup_dsDepCps = depCps; f_DtIncrSetup_dsCleanCps = cleanCps; f_DtIncrSetup_dsNext = next }))) (if cacheable then (B_dData_dMaybe.C_Maybe_Just ({ f_AuxCache_auxCacheKey = key; f_AuxCache_auxCacheDecls = preparedAux; f_AuxCache_auxCacheStart = start; f_AuxCache_auxCacheDepCps = depCps; f_AuxCache_auxCacheCleanCps = cleanCps })) else B_dData_dMaybe.C_Maybe_Nothing))))) (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__276) -> (Base_dDiag.C_Check_OkC ((dtb__276).f_AuxCache_auxCacheDecls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((B_dData_dList.v_length ifacePrepared) > 0) then ((B_dData_dList.v_length missingPrepared) = 0) else false) then (Base_dDiag.C_Check_OkC (ifacePrepared)) else (v_dtPrepareTermAux termAux))
  | _ -> failwith "DT: impossible branch"
))) (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__277) -> (dtb__277).f_AuxCache_auxCacheStart
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_depStartOfAt (v_cleanStartNext cleanCps)) ((B_dData_dList.v_append depCps) cleanCps))
  | _ -> failwith "DT: impossible branch"
))) (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__278) -> (dtb__278).f_AuxCache_auxCacheCleanCps
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_map Driver_dIface.v_miCachedOf) cleanIfaces)
  | _ -> failwith "DT: impossible branch"
))))) ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_length (Driver_dIface.v_miPreparedOf mi)) = 0))) ((B_dData_dList.v_append depIfaces) cleanIfaces)))) ((B_dData_dList.v_concatMap Driver_dIface.v_miPreparedOf) ((B_dData_dList.v_append depIfaces) cleanIfaces)))) (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> (Base_dDiag.C_Check_OkC ((dtb__279).f_AuxCache_auxCacheDepCps))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_shiftedDepPrograms depIfaces)
  | _ -> failwith "DT: impossible branch"
))) (if cacheable then ((v_dtAuxOfCache key) cache) else B_dData_dMaybe.C_Maybe_Nothing))) ((bi_natAdd (B_dData_dList.v_length depIfaces) (B_dData_dList.v_length cleanIfaces)) > 0))) (((v_dtAuxKey pkgName) depIfaces) cleanIfaces))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly)) ((B_dData_dList.v_concatMap Driver_dIface.v_miDeclsOf) cleanIfaces)))) ((B_dData_dObs.v_obsCounter "vuna.elab.incr.decls") (B_dData_dList.v_length decls)))) ((B_dData_dObs.v_obsCounter "vuna.elab.incr.dirty") (B_dData_dList.v_length dirtyOurs)))) ((B_dData_dObs.v_obsCounter "vuna.elab.incr.clean") (B_dData_dList.v_length cleanIfaces)))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) dirtyOurs)) (B_dData_dPair.v_firstOf parts)))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf m)) cleanNames)) false))) ours))) (Driver_dIface.v_moduleNamesOf cleanIfaces))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules))) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)))) (Frontend_dPackages_dPkg.v_contextPackageName ctx))) (B_dData_dPair.v_firstOf resolved))) (B_dData_dPair.v_secondOf resolved)))

# 1402 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsIncrementalCore = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.lsp.goals.setup") (fun (_u : int) -> (((((v_dtIncrementalSetup ctx) resolved) depIfaces) cleanIfaces) cache)))) (fun (s : t_DtIncrSetup) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.lsp.goals.elab") (fun (_u : int) -> ((((Elab_dDriver.v_elabGoalsWithPrepared (s).f_DtIncrSetup_dsStartEc) (s).f_DtIncrSetup_dsStartGlobals) (Frontend_dRast_dBridge.v_toRastDecls (s).f_DtIncrSetup_dsTermAux)) (Frontend_dRast_dBridge.v_toRastDecls (s).f_DtIncrSetup_dsDecls))))) (fun (gs : Elab_dDriver.t_DtGoalInfo B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = gs; B_dData_dPair.f_Pair_second = (s).f_DtIncrSetup_dsNext })))))))

# 1482 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckScoped = (fun (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (unitDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun env -> ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.lower") (fun (_u : int) -> (((Lowering_dProgram.v_lowerUnitOf env) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) unitDatas))))) (fun (unitIr : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.gen") (fun (_u : int) -> ((Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts (Lowering_dEnv.v_lwEnvShared env)) unitIr)))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (0))))))))) ((((Lowering_dEnv.v_mkLwEnv allDatas) defs) globals) "")))

# 1437 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishPackageScoped = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (next : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((fun assembled -> ((fun warns -> ((fun checked -> ((fun allDatas -> ((Base_dCommon.v_bind ((((v_dtCheckScoped allDatas) (Elab_dTypes.v_dtProgDatas prog)) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (checked)); B_dData_dPair.f_Pair_second = next }))))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))))) { f_CheckedPackage_checkedProgram = assembled; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf depCps); f_CheckedPackage_checkedWarnings = warns })) ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)))) { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) cleanCps)) (Elab_dTypes.v_dtProgDefs prog))); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) cleanCps)) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) }))

# 1463 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishScoped = (fun (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((fun allDatas -> ((fun newDatas -> ((fun newDefs -> ((Base_dCommon.v_bind ((((v_dtCheckScoped allDatas) newDatas) newDefs) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = cache }))))) (Elab_dTypes.v_dtProgDefs prog))) (Elab_dTypes.v_dtProgDatas prog))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog)))))

# 1389 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalCheckedCore = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) -> ((Base_dCommon.v_bind (((((v_dtIncrementalSetup ctx) resolved) depIfaces) cleanIfaces) cache)) (fun (s : t_DtIncrSetup) -> ((Base_dCommon.v_bind (((((v_dtElabFullWithPrepared (s).f_DtIncrSetup_dsStartEc) (s).f_DtIncrSetup_dsStartGlobals) (s).f_DtIncrSetup_dsTermAux) (s).f_DtIncrSetup_dsPrepared) (s).f_DtIncrSetup_dsDecls)) (fun (prog : Elab_dTypes.t_DtProgram) -> ((fun warns -> ((Base_dCommon.v_bind (if needPackage then ((((((v_dtFinishPackageScoped (s).f_DtIncrSetup_dsWarns) (s).f_DtIncrSetup_dsDepCps) (s).f_DtIncrSetup_dsCleanCps) prog) (B_dData_dPair.v_secondOf resolved)) (s).f_DtIncrSetup_dsNext) else ((((v_dtFinishScoped (s).f_DtIncrSetup_dsDepCps) (s).f_DtIncrSetup_dsCleanCps) prog) (s).f_DtIncrSetup_dsNext))) (fun (r : (t_CheckedPackage B_dData_dMaybe.t_Maybe, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = r }))))) ((B_dData_dList.v_append (s).f_DtIncrSetup_dsWarns) (Elab_dTypes.v_dtProgWarnings prog))))))))

# 1305 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalChecked = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((v_dtIncrementalCheckedCore ctx) resolved) depIfaces) cleanIfaces) B_dData_dMaybe.C_Maybe_Nothing) true)) (fun (r : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (t_CheckedPackage B_dData_dMaybe.t_Maybe, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf r)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__280) -> (Base_dDiag.C_Check_OkC (dtb__280))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "incremental check produced no package")
  | _ -> failwith "DT: impossible branch"
))))

# 1607 "Vuna/Compiler/Driver/Dt.vuna"
let v_findModuleNameField = (fun (i : Frontend_dAst.t_Import) -> (i).Frontend_dAst.f_Import_importName)

# 1610 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findModuleNamed = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__281, dtb__282) -> (if ((Loader_dModules.v_moduleNameOf dtb__281) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__281)) else ((v_findModuleNamed dtb__282) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1615 "Vuna/Compiler/Driver/Dt.vuna"
let v_topoDepsOf = (fun (mods : Loader_dModules.t_Module B_dData_dList.t_List) (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_filter (fun (n : string) -> (match ((v_findModuleNamed mods) n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__283) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf))))

# 1625 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_topoVisit = (fun (fuel : int) (mods : Loader_dModules.t_Module B_dData_dList.t_List) (name : string) (visited : string B_dData_dList.t_List) (acc : Loader_dModules.t_Module B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = acc } else (if ((B_dData_dList.v_memName name) visited) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = acc } else (match ((v_findModuleNamed mods) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, visited)); B_dData_dPair.f_Pair_second = acc }
  | B_dData_dMaybe.C_Maybe_Just (dtb__284) -> ((fun step -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf step); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf step)) (B_dData_dList.C_List__x58__x58_ (dtb__284, B_dData_dList.C_List_Nil))) }) (((((v_topoVisitAll (fuel - 1)) mods) ((v_topoDepsOf mods) dtb__284)) (B_dData_dList.C_List__x58__x58_ (name, visited))) acc))
  | _ -> failwith "DT: impossible branch"
))))
# 1639 "Vuna/Compiler/Driver/Dt.vuna"
and v_topoVisitAll = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__285, dtb__286) -> ((fun step -> (((((v_topoVisitAll mc0) mc1) dtb__286) (B_dData_dPair.v_firstOf step)) (B_dData_dPair.v_secondOf step))) (((((v_topoVisit mc0) mc1) dtb__285) mc3) mc4))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 1650 "Vuna/Compiler/Driver/Dt.vuna"
let v_moduleOrderLess = (fun (a : Loader_dModules.t_Module) (b : Loader_dModules.t_Module) -> ((fun ka -> ((fun kb -> (if (ka <> kb) then (ka < kb) else ((Loader_dModules.v_moduleNameOf a) <= (Loader_dModules.v_moduleNameOf b)))) (Base_dHash.v_contentKey (Loader_dModules.v_moduleNameOf b)))) (Base_dHash.v_contentKey (Loader_dModules.v_moduleNameOf a))))

# 1657 "Vuna/Compiler/Driver/Dt.vuna"
let v_topoModules = (fun (mods : Loader_dModules.t_Module B_dData_dList.t_List) -> ((fun sorted -> (B_dData_dPair.v_secondOf (((((v_topoVisitAll ((B_dData_dList.v_length sorted) + 1)) sorted) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) sorted)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))) ((B_dData_dSort.v_sortBy v_moduleOrderLess) mods)))

# 1669 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitDeclsHash = (fun (m : Loader_dModules.t_Module) -> ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encDecls) (Loader_dModules.v_moduleDeclsOf m)))

# 1672 "Vuna/Compiler/Driver/Dt.vuna"
let v_pairKeyValue = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))

# 1675 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitImportsOf = (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf)))

# 1678 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_concatKeys = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288) -> (String.concat "" [dtb__287; ";"; (v_concatKeys dtb__288)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1682 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitImportKey = (fun (acc : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (n : string) -> (match ((B_dData_dList.v_lookupPair n) acc) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__289) -> dtb__289
  | B_dData_dMaybe.C_Maybe_Nothing -> "?"
  | _ -> failwith "DT: impossible branch"
))

# 1688 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitKeyOne = (fun (acc : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (m : Loader_dModules.t_Module) -> ((fun deps -> (Driver_dIface.v_shaText (String.concat "" ["u|"; (Loader_dModules.v_moduleNameOf m); "|"; (v_unitDeclsHash m); "|"; (v_concatKeys deps)]))) ((B_dData_dList.v_map (v_unitImportKey acc)) (v_unitImportsOf m))))

# 1694 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_unitKeysGo = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__290, dtb__291) -> ((v_unitKeysGo dtb__291) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb__290); B_dData_dPair.f_Pair_second = ((v_unitKeyOne mc1) dtb__290) }, mc1)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1698 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitKeysOf = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) -> ((fun modKeys -> ((fun entryHash -> ((fun entryKey -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "__entry__"; B_dData_dPair.f_Pair_second = entryKey }, modKeys))) (Driver_dIface.v_shaText (String.concat "" ["e|"; entryHash; "|"; (if printResult then "consolePrint" else "noprint"); "|"; (v_concatKeys ((B_dData_dList.v_map v_pairKeyValue) modKeys))])))) ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encDecls) entryDecls))) ((v_unitKeysGo modules) B_dData_dList.C_List_Nil)))

# 1710 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitCacheLookup = (fun (nFs : string) (nEnv : string) (dir : string) (keys : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) -> (match ((B_dData_dList.v_lookupPair name) keys) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__292) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Driver_dPerfCache.v_unitCacheRead nFs) nEnv) dir) name) dtb__292)) (fun cached -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__293) -> ((fun _u -> (B_dData_dMaybe.C_Maybe_Just (dtb__293))) (if (dtp_debug_on 0) then (dtp_debug_line ("unit-cache-hit " ^ name)) else 0))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 1726 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitCacheStore = (fun (nFs : string) (nEnv : string) (nProcess : string) (dir : string) (keys : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) (sf : Driver_dSplit.t_SplitFile) -> (match ((B_dData_dList.v_lookupPair name) keys) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__294) -> (((((((Driver_dPerfCache.v_unitCacheWrite nFs) nEnv) nProcess) dir) name) dtb__294) sf)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1735 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitCacheEnabled = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_UNIT_CACHE")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (v <> "0")))))

# 1741 "Vuna/Compiler/Driver/Dt.vuna"
let v_splitGenerateCached = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (moduleParts : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun pkg -> ((fun keys -> ((fun bucketKey -> ((fun roots -> ((fun cdir -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (v_unitCacheEnabled nEnv)) (fun enabled -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((Driver_dPerfCache.v_unitCacheDir nFs) nEnv) nProcess) pkg)) (fun base -> ((fun dir -> ((fun keepNames -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (if (if enabled then (pkg <> "") else false) then ((((Driver_dPerfCache.v_unitCacheBucketGc nFs) nProcess) dir) keepNames) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) 0))) (fun _u -> (if (if (pkg = "") then true else (B_dData_dBool.v_not enabled)) then (((((((Driver_dSplitGen.v_generateDtSplitProgram moduleParts) entryDecls) prog) printResult) roots) cdir) extraDefLocs) else (((((((((Driver_dSplitGen.v_generateDtSplitProgramWith ((((v_unitCacheLookup nFs) nEnv) dir) keys)) (((((v_unitCacheStore nFs) nEnv) nProcess) dir) keys)) moduleParts) entryDecls) prog) printResult) roots) cdir) extraDefLocs))))) ((B_dData_dList.v_map (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((Driver_dPerfCache.v_unitCacheFileName (B_dData_dPair.v_firstOf p)) (B_dData_dPair.v_secondOf p)))) keys))) ((Driver_dPerfCache.v_unitCacheEntryDir base) bucketKey))))))) (Frontend_dPackages_dPkg.v_contextDir ctx))) ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) (Frontend_dPackages_dPkg.v_contextRoots ctx)))) (String.concat "" [pkg; "|"; entry]))) (((v_unitKeysOf modules) entryDecls) printResult))) (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 1759 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGenerateIncremental = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (checked : t_CheckedPackage) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun modules -> ((fun moduleParts -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((((v_splitGenerateCached nFs) nConsole) nEnv) nProcess) ctx) entry) modules) moduleParts) (B_dData_dPair.v_firstOf parts)) (checked).f_CheckedPackage_checkedProgram) printResult) extraDefLocs)) (fun filesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__295) -> (Base_dDiag.C_Check_ErrC (dtb__295))
  | Base_dDiag.C_Check_OkC (dtb__296) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__296; B_dData_dPair.f_Pair_second = checked }))
  | _ -> failwith "DT: impossible branch"
))))) ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules))) (v_topoModules (B_dData_dPair.v_secondOf parts))))

# 1799 "Vuna/Compiler/Driver/Dt.vuna"
let v_moduleOfIface = (fun (mi : Driver_dIface.t_ModuleIface) -> { Loader_dModules.f_Module_moduleNameOf = (Driver_dIface.v_miNameOf mi); Loader_dModules.f_Module_modulePackageOf = (Driver_dIface.v_miPackageOf mi); Loader_dModules.f_Module_moduleImportsOf = (Driver_dIface.v_miImportsOf mi); Loader_dModules.f_Module_moduleImplicitImportsOf = (Driver_dIface.v_miImplicitImportsOf mi); Loader_dModules.f_Module_moduleDeclsOf = (Driver_dIface.v_miDeclsOf mi); Loader_dModules.f_Module_moduleExportsOf = (Driver_dIface.v_miExportsOf mi); Loader_dModules.f_Module_moduleFixitiesOf = (Driver_dIface.v_miFixitiesOf mi); Loader_dModules.f_Module_moduleReexportsOf = B_dData_dList.C_List_Nil; Loader_dModules.f_Module_moduleOpaqueOf = (Driver_dCache.v_cachedOpaqueOf (Driver_dIface.v_miCachedOf mi)); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf (Driver_dIface.v_miExportsOf mi)) })

# 1212 "Vuna/Compiler/Driver/Dt.vuna"
let v_modulesOfIfaces = (fun (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) ifaces)))

# 1818 "Vuna/Compiler/Driver/Dt.vuna"
let v_importsOfModuleNames = (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf)))

# 1827 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_importsEdgeCount = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__297, dtb__298) -> ((B_dData_dList.v_length (v_importsOfModuleNames dtb__297)) + (v_importsEdgeCount dtb__298))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1824 "Vuna/Compiler/Driver/Dt.vuna"
let v_closureFuel = (fun (mods : Loader_dModules.t_Module B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((B_dData_dList.v_length starts) + (B_dData_dList.v_length mods)) + (v_importsEdgeCount mods)) + 1))

# 1831 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_closureGo = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__299, dtb__300) -> (if (mc0 <= 0) then mc2 else (if ((B_dData_dList.v_memName dtb__299) mc2) then ((((v_closureGo mc0) mc1) mc2) dtb__300) else (match ((v_findModuleNamed mc1) dtb__299) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_closureGo (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__299, mc2))) dtb__300)
  | B_dData_dMaybe.C_Maybe_Just (dtb__301) -> ((((v_closureGo (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__299, mc2))) ((B_dData_dList.v_append dtb__300) (v_importsOfModuleNames dtb__301)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1843 "Vuna/Compiler/Driver/Dt.vuna"
let v_filterProjectToImports = (fun (mc0 : string) (mc1 : Loader_dModules.t_Project) -> (match mc1 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb__302; Loader_dModules.f_Project_projectEntryImports = dtb__303; Loader_dModules.f_Project_projectImplicitImports = dtb__304; Loader_dModules.f_Project_projectModules = dtb__305; Loader_dModules.f_Project_projectEntryPkg = dtb__306; Loader_dModules.f_Project_projectEntryFixities = dtb__307 } -> ((fun entryStarts -> ((fun ownNames -> ((fun starts -> ((fun closed -> ((fun kept -> { B_dData_dPair.f_Pair_first = { Loader_dModules.f_Project_projectEntryDecls = dtb__302; Loader_dModules.f_Project_projectEntryImports = dtb__303; Loader_dModules.f_Project_projectImplicitImports = dtb__304; Loader_dModules.f_Project_projectModules = kept; Loader_dModules.f_Project_projectEntryPkg = dtb__306; Loader_dModules.f_Project_projectEntryFixities = dtb__307 }; B_dData_dPair.f_Pair_second = kept }) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf m)) closed))) dtb__305))) ((((v_closureGo ((v_closureFuel dtb__305) starts)) dtb__305) B_dData_dList.C_List_Nil) starts))) ((B_dData_dList.v_append entryStarts) ownNames))) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = mc0))) dtb__305)))) ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append dtb__303) dtb__304)))
  | _ -> failwith "DT: impossible branch"
))

# 1853 "Vuna/Compiler/Driver/Dt.vuna"
let v_preloadKeepOf = (fun (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mods : Loader_dModules.t_Module B_dData_dList.t_List) -> ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) mods)))) ifaces)))

# 1222 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((fun preloaded -> ((fun allIfaces -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) preloaded)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__308) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__308)))
  | Base_dDiag.C_Check_OkC (dtb__309) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__309) with
  | { B_dData_dPair.f_Pair_first = dtb__310; B_dData_dPair.f_Pair_second = dtb__311 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__311)) dtb__310))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) ((B_dData_dList.v_append depIfaces) cleanIfaces))) ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces)))))

# 1857 "Vuna/Compiler/Driver/Dt.vuna"
let v_materializedDeps = (fun (pkg : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((fun depNames -> ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) depNames))) ifaces)) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkg))) (B_dData_dPair.v_secondOf parts)))))

# 485 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfacesAux = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((fun _u -> ((fun src -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((Loader_dFlatten.v_loadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) "<repl>") src) (v_modulesOfIfaces ifaces))) (fun loaded -> (match loaded with
  | Base_dDiag.C_Check_ErrC (dtb__312) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__312)))
  | Base_dDiag.C_Check_OkC (dtb__313) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__313) with
  | { B_dData_dPair.f_Pair_first = dtb__314; B_dData_dPair.f_Pair_second = dtb__315 } -> ((fun missing -> ((fun _u -> (if ((B_dData_dList.v_length missing) = 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__315)) dtb__314) with
  | Base_dDiag.C_Check_ErrC (dtb__316) -> (Base_dDiag.C_Check_ErrC (dtb__316))
  | Base_dDiag.C_Check_OkC (dtb__317) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__317)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__318) -> (Base_dDiag.C_Check_ErrC (dtb__318))
  | Base_dDiag.C_Check_OkC (dtb__319) -> ((fun parts -> ((((((v_replCheckPartsAux (v_depStartOf dtb__319)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__319) parts) ifaces) cache)) (B_dData_dPair.v_secondOf dtb__317))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_replProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__320) -> (Base_dDiag.C_Check_ErrC (dtb__320))
  | Base_dDiag.C_Check_OkC (dtb__321) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__321; B_dData_dPair.f_Pair_second = cache }))
  | _ -> failwith "DT: impossible branch"
)))))) (if ((B_dData_dList.v_length missing) > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("iface-fallback=repl missing=" ^ ((B_dData_dString.v_join ",") missing))) else 0) else 0))) (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__315) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (String.concat "" [program; "\n"; v_replExprName; " = "; exprSource; "\n"]))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-source=repl modules=" ^ (bi_strFromInt (B_dData_dList.v_length ifaces)))) else 0)))

# 474 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((v_replProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) B_dData_dMaybe.C_Maybe_Nothing)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match r with
  | Base_dDiag.C_Check_ErrC (dtb__322) -> (Base_dDiag.C_Check_ErrC (dtb__322))
  | Base_dDiag.C_Check_OkC (dtb__323) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__323)))
  | _ -> failwith "DT: impossible branch"
)))))

# 522 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithAuxCache = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((v_replProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__324) -> (Base_dDiag.C_Check_ErrC (dtb__324))
  | Base_dDiag.C_Check_OkC (dtb__325) -> (match ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__325))) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__325)))) with
  | Base_dDiag.C_Check_ErrC (dtb__326) -> (Base_dDiag.C_Check_ErrC (dtb__326))
  | Base_dDiag.C_Check_OkC (dtb__327) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__327; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__325) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 535 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithAuxCache = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((v_replProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__328) -> (Base_dDiag.C_Check_ErrC (dtb__328))
  | Base_dDiag.C_Check_OkC (dtb__329) -> (match ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__329))) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__329)))) with
  | Base_dDiag.C_Check_ErrC (dtb__330) -> (Base_dDiag.C_Check_ErrC (dtb__330))
  | Base_dDiag.C_Check_OkC (dtb__331) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__331; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__329) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 548 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_replProgramWithIfaces nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__332) -> (Base_dDiag.C_Check_ErrC (dtb__332))
  | Base_dDiag.C_Check_OkC (dtb__333) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb__333)) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf dtb__333)))
  | _ -> failwith "DT: impossible branch"
)))))

# 558 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_replProgramWithIfaces nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__334) -> (Base_dDiag.C_Check_ErrC (dtb__334))
  | Base_dDiag.C_Check_OkC (dtb__335) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb__335)) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf dtb__335)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1863 "Vuna/Compiler/Driver/Dt.vuna"
let v_materializedOwn = (fun (pkg : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((fun ourNames -> ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) ourNames))) ifaces)) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkg))) (B_dData_dPair.v_secondOf parts)))))

# 1497 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) -> ((fun pkgName -> ((fun preloaded -> ((fun allIfaces -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) preloaded)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__336) -> (Base_dDiag.C_Check_ErrC (dtb__336))
  | Base_dDiag.C_Check_OkC (dtb__337) -> (match ((v_filterProjectToImports pkgName) dtb__337) with
  | { B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = dtb__339 } -> ((fun missing -> ((fun _u -> (if ((B_dData_dList.v_length missing) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = cache } } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__339)) dtb__338) with
  | Base_dDiag.C_Check_ErrC (dtb__340) -> (Base_dDiag.C_Check_ErrC (dtb__340))
  | Base_dDiag.C_Check_OkC (dtb__341) -> (match ((((((v_dtIncrementalCheckedCore ctx) dtb__341) (((v_materializedDeps pkgName) (B_dData_dPair.v_secondOf dtb__341)) depIfaces)) (((v_materializedOwn pkgName) (B_dData_dPair.v_secondOf dtb__341)) cleanIfaces)) cache) needPackage) with
  | Base_dDiag.C_Check_ErrC (dtb__342) -> (Base_dDiag.C_Check_ErrC (dtb__342))
  | Base_dDiag.C_Check_OkC (dtb__343) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__343 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (if ((B_dData_dList.v_length missing) > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("iface-fallback=check-incremental missing=" ^ ((B_dData_dString.v_join ",") missing))) else 0) else 0))) (((v_missingDepModules pkgName) dtb__339) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) allIfaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) ((B_dData_dList.v_append depIfaces) cleanIfaces))) ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))))) (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 1528 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((fun pkgName -> ((fun preloaded -> ((fun allIfaces -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) preloaded)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__344) -> (Base_dDiag.C_Check_ErrC (dtb__344))
  | Base_dDiag.C_Check_OkC (dtb__345) -> (match ((v_filterProjectToImports pkgName) dtb__345) with
  | { B_dData_dPair.f_Pair_first = dtb__346; B_dData_dPair.f_Pair_second = dtb__347 } -> ((fun missing -> ((fun _u -> (if ((B_dData_dList.v_length missing) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = cache } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__347)) dtb__346) with
  | Base_dDiag.C_Check_ErrC (dtb__348) -> (Base_dDiag.C_Check_ErrC (dtb__348))
  | Base_dDiag.C_Check_OkC (dtb__349) -> (match (((((v_dtGoalsIncrementalCore ctx) dtb__349) (((v_materializedDeps pkgName) (B_dData_dPair.v_secondOf dtb__349)) depIfaces)) (((v_materializedOwn pkgName) (B_dData_dPair.v_secondOf dtb__349)) cleanIfaces)) cache) with
  | Base_dDiag.C_Check_ErrC (dtb__350) -> (Base_dDiag.C_Check_ErrC (dtb__350))
  | Base_dDiag.C_Check_OkC (dtb__351) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__351 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (if ((B_dData_dList.v_length missing) > 0) then (B_dData_dObs.v_obsMark "vuna.lsp.goals.fallback") else 0))) (((v_missingDepModules pkgName) dtb__347) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) allIfaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))) ((B_dData_dList.v_append depIfaces) cleanIfaces))) ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))))) (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 1560 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((((v_dtCheckSourceIncremental nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) B_dData_dList.C_List_Nil) cache) true)) (fun rR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match rR with
  | Base_dDiag.C_Check_ErrC (dtb__352) -> (Base_dDiag.C_Check_ErrC (dtb__352))
  | Base_dDiag.C_Check_OkC (dtb__353) -> (match (B_dData_dPair.v_secondOf dtb__353) with
  | { B_dData_dPair.f_Pair_first = dtb__354; B_dData_dPair.f_Pair_second = dtb__355 } -> (match (B_dData_dPair.v_firstOf dtb__355) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__356) -> (match (v_evalDtMain (dtb__356).f_CheckedPackage_checkedProgram) with
  | Base_dDiag.C_Check_ErrC (dtb__357) -> (Base_dDiag.C_Check_ErrC (dtb__357))
  | Base_dDiag.C_Check_OkC (dtb__358) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__353); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__358; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__355) } }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__353); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__355) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1591 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPackageIncrementalParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_dtLoadPartsIncremental nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__359) -> (Base_dDiag.C_Check_ErrC (dtb__359))
  | Base_dDiag.C_Check_OkC (dtb__360) -> (match ((((v_dtIncrementalChecked ctx) dtb__360) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__360)) depIfaces)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__360)) cleanIfaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__361) -> (Base_dDiag.C_Check_ErrC (dtb__361))
  | Base_dDiag.C_Check_OkC (dtb__362) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__362).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb__362 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1781 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectIncremental = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_dtLoadPartsIncremental nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__363) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__363)))
  | Base_dDiag.C_Check_OkC (dtb__364) -> ((fun pkgName -> ((fun parts -> ((fun cleanOwn -> ((fun extraDefLocs -> (match ((((v_dtIncrementalChecked ctx) dtb__364) (((v_materializedDeps pkgName) parts) depIfaces)) cleanOwn) with
  | Base_dDiag.C_Check_ErrC (dtb__365) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__365)))
  | Base_dDiag.C_Check_OkC (dtb__366) -> ((((((((((v_dtGenerateIncremental nFs) nConsole) nEnv) nProcess) ctx) entry) parts) dtb__366) printResult) extraDefLocs)
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_concatMap Driver_dIface.v_miDefLocsOf) cleanOwn))) (((v_materializedOwn pkgName) parts) cleanIfaces))) (B_dData_dPair.v_secondOf dtb__364))) (Frontend_dPackages_dPkg.v_contextPackageName ctx))
  | _ -> failwith "DT: impossible branch"
))))

# 1869 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) (v_modulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__367) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__367)))
  | Base_dDiag.C_Check_OkC (dtb__368) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__368) with
  | { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = dtb__370 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__370)) dtb__369))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1883 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) (v_modulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__371) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__371)))
  | Base_dDiag.C_Check_OkC (dtb__372) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__372) with
  | { B_dData_dPair.f_Pair_first = dtb__373; B_dData_dPair.f_Pair_second = dtb__374 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__374)) dtb__373))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1910 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((fun preloaded -> ((fun allIfaces -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) preloaded)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__375) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__375)))
  | Base_dDiag.C_Check_OkC (dtb__376) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__376) with
  | { B_dData_dPair.f_Pair_first = dtb__377; B_dData_dPair.f_Pair_second = dtb__378 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__378)) dtb__377))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))) ((B_dData_dList.v_append depIfaces) cleanIfaces))) ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces)))))

# 1927 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageIncrementalParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_dtLoadModulesPartsIncremental nFs) nEnv) nProcess) ctx) names) depIfaces) cleanIfaces)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__379) -> (Base_dDiag.C_Check_ErrC (dtb__379))
  | Base_dDiag.C_Check_OkC (dtb__380) -> (match ((((v_dtIncrementalChecked ctx) dtb__380) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__380)) depIfaces)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__380)) cleanIfaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__381) -> (Base_dDiag.C_Check_ErrC (dtb__381))
  | Base_dDiag.C_Check_OkC (dtb__382) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__382).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb__382 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1983 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOursWith = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun pkgName -> ((fun modules -> ((fun ours -> ((fun depsOnly -> ((fun allDecls -> ((fun termAux -> ((fun start -> (match ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) (Frontend_dRast_dBridge.v_toRastDecls termAux)) (Frontend_dRast_dBridge.v_toRastDecls allDecls)) with
  | Base_dDiag.C_Check_ErrC (dtb__383) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__383)))
  | Base_dDiag.C_Check_OkC (dtb__384) -> ((fun assembled -> ((fun moduleParts -> ((fun checked -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((((v_splitGenerateCached nFs) nConsole) nEnv) nProcess) ctx) entry) modules) moduleParts) (B_dData_dPair.v_firstOf parts)) assembled) printResult) extraDefLocs)) (fun filesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__385) -> (Base_dDiag.C_Check_ErrC (dtb__385))
  | Base_dDiag.C_Check_OkC (dtb__386) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__386; B_dData_dPair.f_Pair_second = checked }))
  | _ -> failwith "DT: impossible branch"
))))) { f_CheckedPackage_checkedProgram = dtb__384; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf deps); f_CheckedPackage_checkedWarnings = (Elab_dTypes.v_dtProgWarnings dtb__384) })) ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules))) { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps)) (Elab_dTypes.v_dtProgDatas dtb__384)); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) deps)) (Elab_dTypes.v_dtProgDefs dtb__384)); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals dtb__384); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols dtb__384); Elab_dTypes.f_DtProgram_dtProgGlobals = (Elab_dTypes.v_dtProgGlobals dtb__384); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts dtb__384); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses dtb__384); Elab_dTypes.f_DtProgram_dtProgNext = (dtb__384).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (dtb__384).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings dtb__384) })
  | _ -> failwith "DT: impossible branch"
)) (v_depStartOf deps))) ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) ours)) (B_dData_dPair.v_firstOf parts)))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules))) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)))) (Frontend_dPackages_dPkg.v_contextPackageName ctx)))

# 1956 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectWithIfaces = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.codegen.split")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_dtLoadPartsWithIfaces nFs) nEnv) nProcess) ctx) entry) ifaces)) (fun partsR -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__387) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__387)))
  | Base_dDiag.C_Check_OkC (dtb__388) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__388)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__389) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__389)))
  | Base_dDiag.C_Check_OkC (dtb__390) -> ((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) (B_dData_dPair.v_secondOf dtb__388)) dtb__390) printResult) ((B_dData_dList.v_concatMap Driver_dIface.v_miDefLocsOf) ifaces))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (fun r -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.codegen.split")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) r))))))))))

# 1980 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOurs = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (printResult : bool) -> ((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) parts) deps) printResult) B_dData_dList.C_List_Nil))

# 2036 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectParts = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_dtLoadParts nFs) nEnv) nProcess) ctx) entry)) (fun partsR -> (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__391) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__391)))
  | Base_dDiag.C_Check_OkC (dtb__392) -> ((fun parts -> ((fun loaderWarns -> ((fun modules -> ((fun allDecls -> (match (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls allDecls)) with
  | Base_dDiag.C_Check_ErrC (dtb__393) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__393)))
  | Base_dDiag.C_Check_OkC (dtb__394) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((((((v_splitGenerateCached nFs) nConsole) nEnv) nProcess) ctx) entry) modules) ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules)) (B_dData_dPair.v_firstOf parts)) dtb__394) printResult) B_dData_dList.C_List_Nil)) (fun filesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__395) -> (Base_dDiag.C_Check_ErrC (dtb__395))
  | Base_dDiag.C_Check_OkC (dtb__396) -> ((fun warns -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__396; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb__394; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = warns } }))) ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings dtb__394)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) modules)) (B_dData_dPair.v_firstOf parts)))) (v_topoModules (B_dData_dPair.v_secondOf parts)))) (B_dData_dPair.v_firstOf dtb__392))) (B_dData_dPair.v_secondOf dtb__392))
  | _ -> failwith "DT: impossible branch"
))))

# 2083 "Vuna/Compiler/Driver/Dt.vuna"
let v_maybeTermGlobals = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__397) -> (Core_dTerm.v_termGlobalNames dtb__397)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2079 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtDefGlobalNames = (fun (d : Elab_dTypes.t_DtDef) -> ((B_dData_dList.v_append (v_maybeTermGlobals (Elab_dTypes.v_dtDefBody d))) (Core_dTerm.v_termGlobalNames (Elab_dTypes.v_dtDefType d))))

# 2095 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_warnUnusedDefsTbl = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__398, dtb__399) -> ((fun name -> ((fun skip -> (if skip then ((v_warnUnusedDefsTbl dtb__399) mc1) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) mc1) then ((v_warnUnusedDefsTbl dtb__399) mc1) else (match (Elab_dTypes.v_dtDefSpan dtb__398) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__400) -> (B_dData_dList.C_List__x58__x58_ (((((Base_dDiagnostics_dWarning.v_warnDiagAtMod (fun (x : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = (String.concat "" ["remove unused definition `"; name; "`"]); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = dtb__400; Base_dDiag.f_DiagEdit_editNewText = "" }, B_dData_dList.C_List_Nil)) }) x))) dtb__400) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedDefinition (name))) (B_dData_dVec.C_Vec_VCons (name, B_dData_dVec.C_Vec_Nil))), ((v_warnUnusedDefsTbl dtb__399) mc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_warnUnusedDefsTbl dtb__399) mc1)
  | _ -> failwith "DT: impossible branch"
)))) (if (if (name = "main") then true else ((B_dData_dString.v_startsWith "_") name)) then true else ((B_dData_dString.v_startsWith "$") name)))) (Elab_dTypes.v_dtDefName dtb__398))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2092 "Vuna/Compiler/Driver/Dt.vuna"
let v_warnUnusedDefsGo = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (used : string B_dData_dList.t_List) -> ((v_warnUnusedDefsTbl defs) (B_dContainer_dHashMap.v_ofNames used)))

# 2071 "Vuna/Compiler/Driver/Dt.vuna"
let v_warnUnusedDefsIn = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((fun used -> ((v_warnUnusedDefsGo defs) used)) ((B_dData_dList.v_concatMap v_dtDefGlobalNames) defs)))

# 2114 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckRecovering = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_dtLoad nFs) nEnv) nProcess) ctx) entry)) (fun declsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match declsR with
  | Base_dDiag.C_Check_ErrC (dtb__401) -> (Base_dDiag.C_Check_ErrC (dtb__401))
  | Base_dDiag.C_Check_OkC (dtb__402) -> (Elab_dDriver.v_elabProgramErrors (Frontend_dRast_dBridge.v_toRastDecls (B_dData_dPair.v_firstOf dtb__402)))
  | _ -> failwith "DT: impossible branch"
)))))

# 2125 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryRecovering = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_dtLoadModulesParts nFs) nEnv) nProcess) ctx) names)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__403) -> (Base_dDiag.C_Check_ErrC (dtb__403))
  | Base_dDiag.C_Check_OkC (dtb__404) -> (Elab_dDriver.v_elabProgramErrors (Frontend_dRast_dBridge.v_toRastDecls (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__404))))
  | _ -> failwith "DT: impossible branch"
)))))

# 2137 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkDtProgramOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.lower") (fun (_u : int) -> (((Lowering_dProgram.v_lowerProgramOf datas) defs) globals)))) (fun (programIr : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.gen") (fun (_u : int) -> ((Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts (Vuna_dIr_dModel.v_irProgSharedOf programIr)) (Vuna_dIr_dModel.v_irProgUnitOf programIr))))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (0)))))))

# 142 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkDeclsWithWarns = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((fun _u -> ((Base_dObs.v_obsCheck "vuna.elab") (fun (_u : int) -> (match (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls decls)) with
  | Base_dDiag.C_Check_ErrC (dtb__405) -> (Base_dDiag.C_Check_ErrC (dtb__405))
  | Base_dDiag.C_Check_OkC (dtb__406) -> ((fun _u -> ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb__406)) (Elab_dTypes.v_dtProgDefs dtb__406)) (Elab_dTypes.v_dtProgGlobals dtb__406)) with
  | Base_dDiag.C_Check_ErrC (dtb__407) -> (Base_dDiag.C_Check_ErrC (dtb__407))
  | Base_dDiag.C_Check_OkC (dtb__408) -> ((fun _u -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append loaderWarns) ((B_dData_dList.v_append (Elab_dTypes.v_dtProgWarnings dtb__406)) (v_warnUnusedDefsIn (Elab_dTypes.v_dtProgDefs dtb__406))))))) (if (dtp_debug_on 0) then (dtp_debug_line "codegen-check-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "elab-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "decls-ready") else 0)))

# 132 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckDecls = (fun (loaded : (Frontend_dAst.t_Decl B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) loaded) (fun loadedR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match loadedR with
  | Base_dDiag.C_Check_ErrC (dtb__409) -> (Base_dDiag.C_Check_ErrC (dtb__409))
  | Base_dDiag.C_Check_OkC (dtb__410) -> ((v_checkDeclsWithWarns (B_dData_dPair.v_secondOf dtb__410)) (B_dData_dPair.v_firstOf dtb__410))
  | _ -> failwith "DT: impossible branch"
)))))

# 175 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPartsWithProgram = (fun (pkg : string) (loaded : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) loaded) (fun loadedR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match loadedR with
  | Base_dDiag.C_Check_ErrC (dtb__411) -> (Base_dDiag.C_Check_ErrC (dtb__411))
  | Base_dDiag.C_Check_OkC (dtb__412) -> ((fun parts -> ((fun loaderWarns -> ((fun decls -> ((Base_dObs.v_obsCheck "vuna.elab") (fun (_u : int) -> (match (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls decls)) with
  | Base_dDiag.C_Check_ErrC (dtb__413) -> (Base_dDiag.C_Check_ErrC (dtb__413))
  | Base_dDiag.C_Check_OkC (dtb__414) -> ((fun _u -> ((fun warns -> ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb__414)) (Elab_dTypes.v_dtProgDefs dtb__414)) (Elab_dTypes.v_dtProgGlobals dtb__414)) with
  | Base_dDiag.C_Check_ErrC (dtb__415) -> (Base_dDiag.C_Check_ErrC (dtb__415))
  | Base_dDiag.C_Check_OkC (dtb__416) -> ((fun _u -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb__414; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = warns } }))) (if (dtp_debug_on 0) then (dtp_debug_line "codegen-check-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings dtb__414)))) (if (dtp_debug_on 0) then (dtp_debug_line "elab-done") else 0))
  | _ -> failwith "DT: impossible branch"
)))) ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf parts)) (B_dData_dPair.v_firstOf parts)))) (B_dData_dPair.v_firstOf dtb__412))) (B_dData_dPair.v_secondOf dtb__412))
  | _ -> failwith "DT: impossible branch"
)))))

# 167 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckWithProgramParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)))

# 171 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryWithProgramParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (((((v_dtLoadModulesParts nFs) nEnv) nProcess) ctx) names)))

# 254 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheck = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) (fun loadedR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match loadedR with
  | Base_dDiag.C_Check_ErrC (dtb__417) -> (Base_dDiag.C_Check_ErrC (dtb__417))
  | Base_dDiag.C_Check_OkC (dtb__418) -> ((fun parts -> ((fun modules -> ((fun decls -> ((v_checkDeclsWithWarns (B_dData_dPair.v_firstOf dtb__418)) decls)) ((v_sealOpaqueDecls modules) (B_dData_dPair.v_firstOf parts)))) (B_dData_dPair.v_secondOf parts))) (B_dData_dPair.v_secondOf dtb__418))
  | _ -> failwith "DT: impossible branch"
)))))

# 1027 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckOursParts = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((fun parts -> ((fun loaderWarns -> ((fun pkgName -> ((fun modules -> ((fun ours -> ((fun depsOnly -> ((fun decls -> ((fun termAux -> ((fun start -> ((Base_dCommon.v_bind ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) (Frontend_dRast_dBridge.v_toRastDecls termAux)) (Frontend_dRast_dBridge.v_toRastDecls decls))) (fun (prog : Elab_dTypes.t_DtProgram) -> ((fun allDatas -> ((Base_dCommon.v_bind (((v_checkDtProgramOf allDatas) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> ((fun warns -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = prog; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf deps); f_CheckedPackage_checkedWarnings = warns } }))) ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)))))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps)) (Elab_dTypes.v_dtProgDatas prog)))))) (v_depStartOf deps))) ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) ours)) (B_dData_dPair.v_firstOf parts)))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules))) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules))) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)))) (Frontend_dPackages_dPkg.v_contextPackageName ctx))) (B_dData_dPair.v_firstOf resolved))) (B_dData_dPair.v_secondOf resolved)))

# 396 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) (v_modulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__419) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__419)))
  | Base_dDiag.C_Check_OkC (dtb__420) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__420) with
  | { B_dData_dPair.f_Pair_first = dtb__421; B_dData_dPair.f_Pair_second = dtb__422 } -> ((fun missing -> ((fun _u -> (if ((B_dData_dList.v_length missing) = 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__422)) dtb__421) with
  | Base_dDiag.C_Check_ErrC (dtb__423) -> (Base_dDiag.C_Check_ErrC (dtb__423))
  | Base_dDiag.C_Check_OkC (dtb__424) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__424)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__425) -> (Base_dDiag.C_Check_ErrC (dtb__425))
  | Base_dDiag.C_Check_OkC (dtb__426) -> (match (((v_dtCheckOursParts ctx) dtb__424) dtb__426) with
  | Base_dDiag.C_Check_ErrC (dtb__427) -> (Base_dDiag.C_Check_ErrC (dtb__427))
  | Base_dDiag.C_Check_OkC (dtb__428) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__428)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else ((((((v_dtCheckSource nFs) nEnv) nProcess) ctx) label) source))) (if ((B_dData_dList.v_length missing) > 0) then (if (dtp_debug_on 0) then (dtp_debug_line ("iface-fallback=check missing=" ^ ((B_dData_dString.v_join ",") missing))) else 0) else 0))) (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__422) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("iface-source=check modules=" ^ (bi_strFromInt (B_dData_dList.v_length ifaces)))) else 0)))

# 1409 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishPackage = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (next : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((fun assembled -> ((fun warns -> ((fun checked -> ((Base_dCommon.v_bind (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas assembled)) (Elab_dTypes.v_dtProgDefs assembled)) (Elab_dTypes.v_dtProgGlobals assembled))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (checked)); B_dData_dPair.f_Pair_second = next }))))) { f_CheckedPackage_checkedProgram = assembled; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf depCps); f_CheckedPackage_checkedWarnings = warns })) ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)))) { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) cleanCps)) (Elab_dTypes.v_dtProgDefs prog))); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) cleanCps)) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) }))

# 1580 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceChecked = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dFlatten.v_loadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__429) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__429)))
  | Base_dDiag.C_Check_OkC (dtb__430) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__430)))))
  | _ -> failwith "DT: impossible branch"
))))

# 287 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckModuleFile = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_dtCheckSourceChecked nFs) nEnv) nProcess) ctx) path) text)) (fun checked -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__431) -> (Base_dDiag.C_Check_ErrC (dtb__431))
  | Base_dDiag.C_Check_OkC (dtb__432) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__432)))
  | _ -> failwith "DT: impossible branch"
)))))))

# 1897 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPackageWithIfacesParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_dtLoadPartsWithIfaces nFs) nEnv) nProcess) ctx) entry) ifaces)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__433) -> (Base_dDiag.C_Check_ErrC (dtb__433))
  | Base_dDiag.C_Check_OkC (dtb__434) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__434)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__435) -> (Base_dDiag.C_Check_ErrC (dtb__435))
  | Base_dDiag.C_Check_OkC (dtb__436) -> (((v_dtCheckOursParts ctx) dtb__434) dtb__436)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1940 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageWithIfacesParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_dtLoadModulesPartsWithIfaces nFs) nEnv) nProcess) ctx) names) ifaces)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__437) -> (Base_dDiag.C_Check_ErrC (dtb__437))
  | Base_dDiag.C_Check_OkC (dtb__438) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__438)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__439) -> (Base_dDiag.C_Check_ErrC (dtb__439))
  | Base_dDiag.C_Check_OkC (dtb__440) -> (((v_dtCheckOursParts ctx) dtb__438) dtb__440)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
