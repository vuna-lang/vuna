open Vuna_runtime
type t_CheckedPackage = { f_CheckedPackage_checkedProgram : Elab_dTypes.t_DtProgram; f_CheckedPackage_checkedModules : Loader_dModules.t_Module B_dData_dList.t_List; f_CheckedPackage_checkedEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_CheckedPackage_checkedInherited : string B_dData_dList.t_List; f_CheckedPackage_checkedWarnings : Base_dDiag.t_Diagnostic B_dData_dList.t_List }
and t_GenMeta = { f_GenMeta_genMetaId : int; f_GenMeta_genMetaName : string; f_GenMeta_genMetaKind : Core_dTerm.t_Term }
and t_MainInfo = { f_MainInfo_miKind : string; f_MainInfo_miHostTags : string B_dData_dList.t_List }
and t_AuxCache = { f_AuxCache_auxCacheKey : string; f_AuxCache_auxCacheDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_AuxCache_auxCacheStart : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair; f_AuxCache_auxCacheDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_AuxCache_auxCacheCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List }
and t_DtIncrSetup = { f_DtIncrSetup_dsStartEc : Elab_dTypes.t_Ec; f_DtIncrSetup_dsStartGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtIncrSetup_dsTermAux : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsPrepared : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_DtIncrSetup_dsDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsNext : t_AuxCache B_dData_dMaybe.t_Maybe }

# 78 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtProjectDecls = (fun (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)))) (B_dData_dPair.v_firstOf parts)))

# 82 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoad = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "load-start") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dFlatten.v_loadProject nFs) nEnv) nProcess) ctx) entry)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__0) -> (Base_dDiag.C_Check_ErrC (dtb__0))
  | Base_dDiag.C_Check_OkC (dtb__1) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "load-modules-done") else 0) in (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__1) with
  | Base_dDiag.C_Check_ErrC (dtb__2) -> (Base_dDiag.C_Check_ErrC (dtb__2))
  | Base_dDiag.C_Check_OkC (dtb__3) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "resolve-done") else 0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__3)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf dtb__3) })))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 107 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsForCheck = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dFlatten.v_loadProject nFs) nEnv) nProcess) ctx) entry)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__4) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__4)))
  | Base_dDiag.C_Check_OkC (dtb__5) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__5))))
  | _ -> failwith "DT: impossible branch"
))))))

# 119 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dFlatten.v_loadProjectModules nFs) nEnv) nProcess) ctx) names)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__6) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__6)))
  | Base_dDiag.C_Check_OkC (dtb__7) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__7))))
  | _ -> failwith "DT: impossible branch"
))))))

# 238 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealSpan = { Base_dSource.f_Span_spanFile = "<seal>"; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 241 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_opaqueSigType = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | Frontend_dAst.C_Decl_DSig (dtb__10, dtb__11, dtb__12, dtb__13) -> (if (dtb__10 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__12)) else ((v_opaqueSigType mc0) dtb__9))
  | _ -> ((v_opaqueSigType mc0) dtb__9)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealDeclOf = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (name : string) -> (let ty = (match ((v_opaqueSigType name) decls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> dtb__14
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef v_sealSpan)))
  | _ -> failwith "DT: impossible branch"
) in (Frontend_dAst.C_Decl_DAxiom (("vuna_seal_" ^ name), ty, (Frontend_dAst.v_detachedNodeRef v_sealSpan)))))

# 218 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_sealAbstractAfter = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> (match dtb__15 with
  | Frontend_dAst.C_Decl_DFun (dtb__17, dtb__18, dtb__19, dtb__20) -> (if ((B_dData_dList.v_memName dtb__17) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__15, (B_dData_dList.C_List__x58__x58_ (((v_sealDeclOf (B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16))) dtb__17), ((v_sealAbstractAfter dtb__16) mc1))))) else (B_dData_dList.C_List__x58__x58_ (dtb__15, ((v_sealAbstractAfter dtb__16) mc1))))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__15, ((v_sealAbstractAfter dtb__16) mc1)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealModule = (fun (m : Loader_dModules.t_Module) -> (let decls = (Loader_dModules.v_moduleDeclsOf m) in (let names = (Loader_dModules.v_moduleOpaqueOf m) in (let abstracts = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_filter Loader_dFlatten.v_isAbstractOpaqueName) names)) in (let opaques = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not (Loader_dFlatten.v_isAbstractOpaqueName n)))) names)) in (let body = ((v_sealAbstractAfter decls) abstracts) in ((B_dData_dList.v_append body) ((B_dData_dList.v_map (v_sealDeclOf decls)) opaques))))))))

# 205 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealOpaqueDecls = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) (B_dData_dList.v_reverse modules))) entryDecls))

# 270 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFileHasModuleHeader = (fun (nFs : string) (nEnv : string) (nProcess : string) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dFlatten.v_parseFileWithPath nFs) nEnv) nProcess) path) text)) (fun parsed -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match parsed with
  | Base_dDiag.C_Check_OkC (dtb__21) -> (let nd_uscrut12 = (B_dData_dPair.v_firstOf dtb__21) in (match nd_uscrut12 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__22; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__23; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__24; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__25; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__26; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__27; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__28 } -> (match dtb__22 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)))))))

# 365 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match projectR with
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

# 386 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_missingDepModules = (fun (mc0 : string) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (if (if ((Loader_dModules.v_modulePackageOf dtb__36) <> mc0) then (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb__36)) mc2)) false) else false) then (B_dData_dList.C_List__x58__x58_ ((Loader_dModules.v_moduleNameOf dtb__36), (((v_missingDepModules mc0) dtb__37) mc2))) else (((v_missingDepModules mc0) dtb__37) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 645 "Vuna/Compiler/Driver/Dt.vuna"
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

# 653 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_buildPi = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, dtb__44, ((v_buildPi dtb__45) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 632 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_allocTelescopes = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Elab_dTypes.t_Ec) (mc2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__46 with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> (match (((v_allocMetas mc0) mc1) ((B_dData_dList.v_range 0) dtb__49)) with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (match (((v_allocMetas mc0) dtb__51) ((B_dData_dList.v_range 0) 1)) with
  | { B_dData_dPair.f_Pair_first = dtb__52; B_dData_dPair.f_Pair_second = dtb__53 } -> (let nd_uscrut18 = dtb__52 in (match nd_uscrut18 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (match dtb__55 with
  | B_dData_dList.C_List_Nil -> (match (((v_allocTelescopes mc0) dtb__53) dtb__47) with
  | { B_dData_dPair.f_Pair_first = dtb__56; B_dData_dPair.f_Pair_second = dtb__57 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = ((v_buildPi dtb__50) dtb__54) }, dtb__56)); B_dData_dPair.f_Pair_second = dtb__57 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__53 }
)
  | _ -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__53 }
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 667 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findDtDef = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (if ((Elab_dTypes.v_dtDefName dtb__58) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__58)) else ((v_findDtDef mc0) dtb__59))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 672 "Vuna/Compiler/Driver/Dt.vuna"
let v_loadReplDecls = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadProjectSource nFs) nEnv) nProcess) ctx) "<repl>") source)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__60) -> (Base_dDiag.C_Check_ErrC (dtb__60))
  | Base_dDiag.C_Check_OkC (dtb__61) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__61) with
  | Base_dDiag.C_Check_ErrC (dtb__62) -> (Base_dDiag.C_Check_ErrC (dtb__62))
  | Base_dDiag.C_Check_OkC (dtb__63) -> (Base_dDiag.C_Check_OkC ((v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__63))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 686 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtBindingTypes = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_loadReplDecls nFs) nEnv) nProcess) ctx) program)) (fun declsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match declsR with
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

# 730 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_pickFreshName = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (let cand = (if (dtb__70 = 0) then mc0 else (String.concat "" [mc0; "_"; (bi_strFromInt dtb__70)])) in (if ((B_dData_dList.v_memName cand) mc1) then (((v_pickFreshName mc0) mc1) dtb__71) else cand))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 727 "Vuna/Compiler/Driver/Dt.vuna"
let v_freshMetaName = (fun (base : string) (taken : string B_dData_dList.t_List) -> (((v_pickFreshName base) taken) (B_dData_dList.C_List__x58__x58_ (0, ((B_dData_dList.v_range 1) 64)))))

# 739 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_substGenMetas = (fun (mc0 : Core_dTerm.t_Term) (mc1 : t_GenMeta B_dData_dList.t_List) (mc2 : int) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> ((((v_substGenMetas ((((Core_dTerm.v_substMetaVar (dtb__72).f_GenMeta_genMetaId) (dtb__72).f_GenMeta_genMetaName) ((mc2 + 1) - mc3)) mc0)) dtb__73) (mc2 + 1)) mc3)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 744 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_wrapGenMetas = (fun (mc0 : t_GenMeta B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (Core_dTerm.C_Term_TPi ((dtb__74).f_GenMeta_genMetaName, true, Core_dTerm.C_Rig_RigOmega, (dtb__74).f_GenMeta_genMetaKind, ((v_wrapGenMetas dtb__75) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 751 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_kindArrows = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), (v_kindArrows dtb__77)))
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Driver/Dt.vuna"
let v_kindOfArity = (fun (k : int) -> (v_kindArrows ((B_dData_dList.v_range 0) k)))

# 756 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_metaIdsOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TIf (dtb__78, dtb__79, dtb__80) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__78)) ((B_dData_dList.v_append (v_metaIdsOf dtb__79)) (v_metaIdsOf dtb__80)))
  | Core_dTerm.C_Term_TCase (dtb__81, dtb__82) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__81)) ((B_dData_dList.v_concatMap v_metaIdsOfAlt) dtb__82))
  | Core_dTerm.C_Term_TCon (dtb__83, dtb__84) -> (v_metaIdsOfArgs dtb__84)
  | Core_dTerm.C_Term_TApp (dtb__85, dtb__86, dtb__87) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__85)) (v_metaIdsOf dtb__86))
  | Core_dTerm.C_Term_TLam (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> (let tys = (let nd_uscrut6 = dtb__90 in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (match dtb__93 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> (match dtb__95 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> ((B_dData_dList.v_append (v_metaIdsOfMaybe dtb__96)) (v_metaIdsOfMaybe dtb__97))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) in ((B_dData_dList.v_append tys) (v_metaIdsOf dtb__92)))
  | Core_dTerm.C_Term_TPi (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__101)) (v_metaIdsOf dtb__102))
  | Core_dTerm.C_Term_TMeta (dtb__103) -> (B_dData_dList.C_List__x58__x58_ (dtb__103, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 772 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfMaybe = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__104) -> (v_metaIdsOf dtb__104)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 776 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__107; B_dData_dPair.f_Pair_second = dtb__108 } -> ((B_dData_dList.v_append (v_metaIdsOf dtb__107)) (v_metaIdsOfArgs dtb__106))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 780 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfAlt = (fun (mc0 : Core_dTerm.t_CaseAlt) -> (match mc0 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__109; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__110; Core_dTerm.f_CaseAlt_caseAltBody = dtb__111 } -> (v_metaIdsOf dtb__111)
  | _ -> failwith "DT: impossible branch"
))

# 783 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupInts = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (if ((Elab_dMeta.v_memMetaId dtb__112) dtb__113) then (v_dedupInts dtb__113) else (B_dData_dList.C_List__x58__x58_ (dtb__112, (v_dedupInts dtb__113))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 820 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_headIsMeta = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TMeta (dtb__114) -> (mc0 = dtb__114)
  | Core_dTerm.C_Term_TApp (dtb__115, dtb__116, dtb__117) -> ((v_headIsMeta mc0) dtb__115)
  | _ -> false
))

# 825 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_spineLen = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__118, dtb__119, dtb__120) -> (1 + (v_spineLen dtb__118))
  | _ -> 0
))

# 817 "Vuna/Compiler/Driver/Dt.vuna"
let v_applyArity = (fun (m : int) (t : Core_dTerm.t_Term) -> (if ((v_headIsMeta m) t) then (v_spineLen t) else 0))

# 829 "Vuna/Compiler/Driver/Dt.vuna"
let v_imax = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 788 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_maxMetaArity = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__121, dtb__122, dtb__123) -> ((v_imax ((v_maxMetaArity mc0) dtb__121)) ((v_imax ((v_maxMetaArity mc0) dtb__122)) ((v_maxMetaArity mc0) dtb__123)))
  | Core_dTerm.C_Term_TCase (dtb__124, dtb__125) -> ((v_imax ((v_maxMetaArity mc0) dtb__124)) ((v_maxMetaArityAlts mc0) dtb__125))
  | Core_dTerm.C_Term_TCon (dtb__126, dtb__127) -> ((v_maxMetaArityArgs mc0) dtb__127)
  | Core_dTerm.C_Term_TLam (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (let tys = (let nd_uscrut7 = dtb__130 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__133) -> (match dtb__133 with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> (match dtb__135 with
  | { B_dData_dPair.f_Pair_first = dtb__136; B_dData_dPair.f_Pair_second = dtb__137 } -> ((v_imax ((v_maxMetaArityMaybe mc0) dtb__136)) ((v_maxMetaArityMaybe mc0) dtb__137))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
)) in ((v_imax tys) ((v_maxMetaArity mc0) dtb__132)))
  | Core_dTerm.C_Term_TPi (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> ((v_imax ((v_maxMetaArity mc0) dtb__141)) ((v_maxMetaArity mc0) dtb__142))
  | Core_dTerm.C_Term_TApp (dtb__143, dtb__144, dtb__145) -> ((v_imax ((v_applyArity mc0) (Core_dTerm.C_Term_TApp (dtb__143, dtb__144, dtb__145)))) ((v_imax ((v_maxMetaArity mc0) dtb__143)) ((v_maxMetaArity mc0) dtb__144)))
  | _ -> 0
))
# 805 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityMaybe = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> ((v_maxMetaArity mc0) dtb__146)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
# 809 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (match dtb__147 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> ((v_imax ((v_maxMetaArity mc0) dtb__149)) ((v_maxMetaArityArgs mc0) dtb__148))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 813 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityAlts = (fun (mc0 : int) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> ((v_imax ((v_maxMetaArity mc0) (Core_dTerm.v_caseAltBody dtb__151))) ((v_maxMetaArityAlts mc0) dtb__152))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 719 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_buildGenMetas = (fun (mc0 : int B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (let name = ((v_freshMetaName ("t" ^ (bi_strFromInt mc2))) mc1) in (let kind = (v_kindOfArity ((v_maxMetaArity dtb__153) mc3)) in (B_dData_dList.C_List__x58__x58_ ({ f_GenMeta_genMetaId = dtb__153; f_GenMeta_genMetaName = name; f_GenMeta_genMetaKind = kind }, ((((v_buildGenMetas dtb__154) (B_dData_dList.C_List__x58__x58_ (name, mc1))) (mc2 + 1)) mc3)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 832 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_listLen = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> (1 + (v_listLen dtb__156))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findArity = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__157, dtb__158) -> (match dtb__157 with
  | Frontend_dAst.C_Decl_DFun (dtb__159, dtb__160, dtb__161, dtb__162) -> (if (dtb__159 = mc0) then (B_dData_dMaybe.C_Maybe_Just ((v_listLen dtb__160))) else ((v_findArity mc0) dtb__158))
  | _ -> ((v_findArity mc0) dtb__158)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_aritiesOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match ((v_findArity dtb__163) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err (String.concat "" ["\232\135\170\229\138\168\231\173\190\229\144\141\239\188\154\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 "; dtb__163; "\239\188\136\233\156\128\232\166\129 DFun\239\188\137"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> ((Base_dCommon.v_bind ((v_aritiesOf dtb__164) mc1)) (fun (more : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__165 }, more))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 703 "Vuna/Compiler/Driver/Dt.vuna"
let v_generalizeSignature = (fun (ty : Core_dTerm.t_Term) (taken : string B_dData_dList.t_List) -> (let metas = (v_dedupInts (v_metaIdsOf ty)) in (if ((B_dData_dList.v_length metas) = 0) then (Base_dDiag.C_Check_OkC ((Core_dTerm.v_showTypeSig ty))) else (if ((B_dData_dList.v_length metas) > 8) then (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\231\154\132\231\177\187\229\158\139\229\143\130\230\149\176\232\182\133\232\191\135 8 \228\184\170\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else (let entries = ((((v_buildGenMetas metas) taken) 0) ty) in (let total = (v_listLen entries) in (let body = ((((v_substGenMetas ty) entries) 0) total) in (let sigText = (Core_dTerm.v_showTypeSig ((v_wrapGenMetas entries) body)) in (if ((B_dData_dString.v_contains "?") sigText) then (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\231\154\132\231\187\147\230\158\156\228\187\141\229\144\171\230\156\170\232\167\163\229\133\131\229\143\152\233\135\143\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else (Base_dDiag.C_Check_OkC (sigText)))))))))))

# 657 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_inferEachType = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtProgram) (mc2 : Elab_dTypes.t_Ec) (mc3 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (match ((v_findDtDef dtb__166) (Elab_dTypes.v_dtProgDefs mc1)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err ("\232\135\170\229\138\168\231\173\190\229\144\141\239\188\154\231\178\190\229\140\150\231\187\147\230\158\156\233\135\140\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 " ^ dtb__166))
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> ((Base_dCommon.v_bind ((v_generalizeSignature (((Elab_dMeta.v_zonkTerm mc2) 0) (Elab_dTypes.v_dtDefType dtb__168))) mc3)) (fun (sigText : string) -> ((Base_dCommon.v_bind ((((v_inferEachType dtb__167) mc1) mc2) mc3)) (fun (more : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = sigText }, more))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 583 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtInferDefTypes = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (targets : string B_dData_dList.t_List) (defSource : string) -> (if ((B_dData_dList.v_length targets) = 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (let nd_uscrut11 = ((Frontend_dParser.v_parseSource "<repl>") defSource) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__169) -> (match dtb__169 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__170; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__171; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__172; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__173; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__174; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__175; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__176 } -> (match dtb__170 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__177) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\228\184\141\230\148\175\230\140\129\230\168\161\229\157\151\230\150\135\228\187\182"))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_aritiesOf targets) dtb__173) with
  | Base_dDiag.C_Check_ErrC (dtb__178) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__178)))
  | Base_dDiag.C_Check_OkC (dtb__179) -> (match (((v_allocTelescopes Elab_dTypes.v_emptyCtx) Elab_dTypes.v_ecEmpty) dtb__179) with
  | { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } -> (let startGlobals = ((B_dData_dList.v_append dtb__180) Elab_dPrelude.v_preludeGlobals) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_loadReplDecls nFs) nEnv) nProcess) ctx) (String.concat "" [program; "\n"; defSource; "\n"]))) (fun allDeclsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match allDeclsR with
  | Base_dDiag.C_Check_ErrC (dtb__182) -> (Base_dDiag.C_Check_ErrC (dtb__182))
  | Base_dDiag.C_Check_OkC (dtb__183) -> (match (((Elab_dDriver.v_elabProgramFullWith dtb__181) startGlobals) (Frontend_dRast_dBridge.v_toRastDecls dtb__183)) with
  | Base_dDiag.C_Check_ErrC (dtb__184) -> (Base_dDiag.C_Check_ErrC (dtb__184))
  | Base_dDiag.C_Check_OkC (dtb__185) -> (let taken = (Frontend_dAst.v_topNames dtb__183) in (match (Elab_dDriver.v_ecOfProgram dtb__185) with
  | { B_dData_dPair.f_Pair_first = dtb__186; B_dData_dPair.f_Pair_second = dtb__187 } -> ((((v_inferEachType targets) dtb__185) dtb__186) taken)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__188) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__188)))
  | _ -> failwith "DT: impossible branch"
))))

# 837 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__189) -> (Base_dDiag.C_Check_ErrC (dtb__189))
  | Base_dDiag.C_Check_OkC (dtb__190) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__190) with
  | Base_dDiag.C_Check_ErrC (dtb__191) -> (Base_dDiag.C_Check_ErrC (dtb__191))
  | Base_dDiag.C_Check_OkC (dtb__192) -> (Elab_dDriver.v_goalsOfProgram (Frontend_dRast_dBridge.v_toRastDecls (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__192))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 851 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceTolerant = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__193) -> (Base_dDiag.C_Check_ErrC (dtb__193))
  | Base_dDiag.C_Check_OkC (dtb__194) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__194) with
  | Base_dDiag.C_Check_ErrC (dtb__195) -> (Base_dDiag.C_Check_ErrC (dtb__195))
  | Base_dDiag.C_Check_OkC (dtb__196) -> (Elab_dDriver.v_goalsOfProgramTolerant (Frontend_dRast_dBridge.v_toRastDecls (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__196))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 865 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainKindNames = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_intTypeName; B_dData_dPair.f_Pair_second = "Int" }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_natTypeName; B_dData_dPair.f_Pair_second = "Nat" }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_strTypeName; B_dData_dPair.f_Pair_second = "String" }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_boolTypeName; B_dData_dPair.f_Pair_second = "Bool" }, B_dData_dList.C_List_Nil))))))))

# 875 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_lookupMainKind = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__197, dtb__198) -> (if ((B_dData_dPair.v_firstOf dtb__197) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__197))) else ((v_lookupMainKind mc0) dtb__198))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 869 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainKindForName = (fun (g : string) -> (match ((v_lookupMainKind g) v_mainKindNames) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (Base_dDiag.C_Check_OkC (dtb__199))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ("Other"))
  | _ -> failwith "DT: impossible branch"
))

# 886 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainInfoForName = (fun (g : string) -> (match (v_mainKindForName g) with
  | Base_dDiag.C_Check_ErrC (dtb__200) -> (Base_dDiag.C_Check_ErrC (dtb__200))
  | Base_dDiag.C_Check_OkC (dtb__201) -> (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = dtb__201; f_MainInfo_miHostTags = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 938 "Vuna/Compiler/Driver/Dt.vuna"
let v_replExprName = "vuna_repl_expr"

# 942 "Vuna/Compiler/Driver/Dt.vuna"
let v_splitReplExpr = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let nd_uscrut1 = (B_dData_dList.v_reverse decls) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> (match dtb__202 with
  | Frontend_dAst.C_Decl_DFun (dtb__204, dtb__205, dtb__206, dtb__207) -> (if (dtb__204 = v_replExprName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__203); B_dData_dPair.f_Pair_second = dtb__206 })) else (Base_dDiag.v_icInternal "REPL expression definition is not last"))
  | _ -> (Base_dDiag.v_icInternal "REPL expression was not parsed as a definition")
)
  | _ -> (Base_dDiag.v_icInternal "REPL expression was not parsed as a definition")
)))

# 321 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramFull = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadProjectSource nFs) nEnv) nProcess) ctx) "<repl>") (String.concat "" [program; "\n"; v_replExprName; " = "; exprSource; "\n"]))) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__208) -> (Base_dDiag.C_Check_ErrC (dtb__208))
  | Base_dDiag.C_Check_OkC (dtb__209) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__209) with
  | Base_dDiag.C_Check_ErrC (dtb__210) -> (Base_dDiag.C_Check_ErrC (dtb__210))
  | Base_dDiag.C_Check_OkC (dtb__211) -> (match (v_splitReplExpr ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__211))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__211)))) with
  | Base_dDiag.C_Check_ErrC (dtb__212) -> (Base_dDiag.C_Check_ErrC (dtb__212))
  | Base_dDiag.C_Check_OkC (dtb__213) -> (match (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls (B_dData_dPair.v_firstOf dtb__213))) with
  | Base_dDiag.C_Check_ErrC (dtb__214) -> (Base_dDiag.C_Check_ErrC (dtb__214))
  | Base_dDiag.C_Check_OkC (dtb__215) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__213) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 340 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExpr = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_replProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__216) -> (Base_dDiag.C_Check_ErrC (dtb__216))
  | Base_dDiag.C_Check_OkC (dtb__217) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb__217)) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf dtb__217)))
  | _ -> failwith "DT: impossible branch"
)))))

# 353 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfo = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_replProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__218) -> (Base_dDiag.C_Check_ErrC (dtb__218))
  | Base_dDiag.C_Check_OkC (dtb__219) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb__219)) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf dtb__219)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1001 "Vuna/Compiler/Driver/Dt.vuna"
let v_stuckText = (fun (v : Core_dTerm.t_Value) -> (let s = ((Core_dEval.v_showValueAt 6) v) in (if ((bi_strLength s) > 300) then ((((B_dData_dString.v_substring 0) 300) s) ^ "\226\128\166") else s)))

# 992 "Vuna/Compiler/Driver/Dt.vuna"
let v_interpMainShow = (fun (table : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (sols : Core_dTerm.t_Sols) (mainVal : Core_dTerm.t_Value) -> (match ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) table)) sols) Core_dEval.v_normalizeFuelBound) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_mainShowDefName, (B_dData_dList.C_List__x58__x58_ (mainVal, B_dData_dList.C_List_Nil))))))) with
  | Core_dTerm.C_Value_VStr (dtb__220) -> (Base_dDiag.C_Check_OkC (dtb__220))
  | _ -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_MainNotValue (""))) (v_stuckText mainVal))
))

# 1008 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainActionKind = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__221, dtb__222, dtb__223) -> (match dtb__221 with
  | Core_dTerm.C_Term_TApp (dtb__224, dtb__225, dtb__226) -> (match dtb__224 with
  | Core_dTerm.C_Term_TGlobal (dtb__227) -> (if (dtb__227 = Base_dIntrinsics.v_effTypeName) then "Eff" else "")
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 1016 "Vuna/Compiler/Driver/Dt.vuna"
let v_isNilRowTermDt = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__228, dtb__229) -> (match dtb__229 with
  | B_dData_dList.C_List_Nil -> (dtb__228 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
)
  | Core_dTerm.C_Term_TGlobal (dtb__230) -> (dtb__230 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 1021 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findMainDef = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (if ((Elab_dTypes.v_dtDefName dtb__231) = "main") then (B_dData_dMaybe.C_Maybe_Just (dtb__231)) else (v_findMainDef dtb__232))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1026 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_defTableOf = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__233, dtb__234) -> (match (Elab_dTypes.v_dtDefBody dtb__233) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__235) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb__233); B_dData_dPair.f_Pair_second = dtb__235 }, (v_defTableOf dtb__234)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_defTableOf dtb__234)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 909 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtMainInfo = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_dtLoad nFs) nEnv) nProcess) ctx) entry)) (fun declsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match declsR with
  | Base_dDiag.C_Check_ErrC (dtb__236) -> (Base_dDiag.C_Check_ErrC (dtb__236))
  | Base_dDiag.C_Check_OkC (dtb__237) -> (match (Elab_dDriver.v_elabProgram (Frontend_dRast_dBridge.v_toRastDecls (B_dData_dPair.v_firstOf dtb__237))) with
  | Base_dDiag.C_Check_ErrC (dtb__238) -> (Base_dDiag.C_Check_ErrC (dtb__238))
  | Base_dDiag.C_Check_OkC (dtb__239) -> (match (v_findMainDef (B_dData_dPair.v_secondOf dtb__239)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dCg.v_cgErr0At { Base_dSource.f_Span_spanFile = entry; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) Base_dDiagnostics_dCg.C_CgErr_NoMain)
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> (if ((v_mainActionKind (Elab_dTypes.v_dtDefType dtb__240)) = "Eff") then (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = "Eff"; f_MainInfo_miHostTags = (Lowering_dEntry.v_mainRowTags (Elab_dTypes.v_dtDefType dtb__240)) })) else (match ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_defTableOf (B_dData_dPair.v_secondOf dtb__239)))) Core_dTerm.v_solsEmpty) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType dtb__240))) with
  | Core_dTerm.C_Value_VNeutral (dtb__241) -> (match dtb__241 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__242, dtb__243) -> (match dtb__243 with
  | B_dData_dList.C_List_Nil -> (v_mainInfoForName dtb__242)
  | _ -> (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = "Other"; f_MainInfo_miHostTags = B_dData_dList.C_List_Nil }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = "Other"; f_MainInfo_miHostTags = B_dData_dList.C_List_Nil }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = "Other"; f_MainInfo_miHostTags = B_dData_dList.C_List_Nil }))
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 898 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtMainKind = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_dtMainInfo nFs) nEnv) nProcess) ctx) entry)) (fun infoR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match infoR with
  | Base_dDiag.C_Check_ErrC (dtb__244) -> (Base_dDiag.C_Check_ErrC (dtb__244))
  | Base_dDiag.C_Check_OkC (dtb__245) -> (Base_dDiag.C_Check_OkC ((dtb__245).f_MainInfo_miKind))
  | _ -> failwith "DT: impossible branch"
)))))

# 965 "Vuna/Compiler/Driver/Dt.vuna"
let v_evalDtMainCore = (fun (program : Elab_dTypes.t_DtProgram) -> (match (v_findMainDef (Elab_dTypes.v_dtProgDefs program)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain)
  | B_dData_dMaybe.C_Maybe_Just (dtb__246) -> (let table = (v_defTableOf (Elab_dTypes.v_dtProgDefs program)) in (let sols = Core_dTerm.v_solsEmpty in (let mainVal = ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) table)) sols) Core_dEval.v_normalizeFuelBound) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("main", B_dData_dList.C_List_Nil))))) in (if (B_dData_dBool.v_not ((v_mainActionKind (Elab_dTypes.v_dtDefType dtb__246)) = "")) then (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_InterpCannotExecuteEffects) else (match mainVal with
  | Core_dTerm.C_Value_VInt (dtb__247) -> (Base_dDiag.C_Check_OkC ((bi_strFromInt dtb__247)))
  | Core_dTerm.C_Value_VStr (dtb__248) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue mainVal)))
  | Core_dTerm.C_Value_VBool (dtb__249) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue mainVal)))
  | Core_dTerm.C_Value_VFloat (dtb__250) -> (Base_dDiag.C_Check_OkC (dtb__250))
  | Core_dTerm.C_Value_VCon (dtb__251, dtb__252) -> (match (Core_dEval.v_natValueToInt mainVal) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__253) -> (Base_dDiag.C_Check_OkC ((bi_strFromInt dtb__253)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_interpMainShow table) sols) mainVal)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_interpMainShow table) sols) mainVal)
)))))
  | _ -> failwith "DT: impossible branch"
))

# 954 "Vuna/Compiler/Driver/Dt.vuna"
let v_evalDtMain = (fun (program : Elab_dTypes.t_DtProgram) -> (v_evalDtMainCore program))

# 297 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalFile = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__254) -> (Base_dDiag.C_Check_ErrC (dtb__254))
  | Base_dDiag.C_Check_OkC (dtb__255) -> (let parts = (B_dData_dPair.v_secondOf dtb__255) in (let decls = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf parts)) (B_dData_dPair.v_firstOf parts)) in ((Base_dCommon.v_bind (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls decls))) v_evalDtMain)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1037 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry))

# 1046 "Vuna/Compiler/Driver/Dt.vuna"
let v_cachedNamesOne = (fun (cp : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Driver_dCache.v_cachedDatas cp))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors d)))) (Driver_dCache.v_cachedDatas cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Driver_dCache.v_cachedDefs cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Driver_dCache.v_cachedGlobals cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstSym) (Driver_dCache.v_cachedInsts cp))) ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Driver_dCache.v_cachedClasses cp))))))))

# 1043 "Vuna/Compiler/Driver/Dt.vuna"
let v_cachedNamesOf = (fun (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_cachedNamesOne) progs))

# 1115 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_maxMetaList = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> ((v_maxMetaList (if (dtb__256 > mc0) then dtb__256 else mc0)) dtb__257)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1119 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaDef = (fun (m : int) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__258) -> ((v_maxMetaList m) (Elab_dMeta.v_termMetasAll dtb__258))
  | B_dData_dMaybe.C_Maybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))

# 1125 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaCached = (fun (m : int) (cp : Driver_dCache.t_CachedProgram) -> (((B_dData_dList.v_foldl v_maxMetaDef) m) (Driver_dCache.v_cachedDefs cp)))

# 1128 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaCps = (fun (cps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_maxMetaCached) (0 - 1)) cps))

# 1131 "Vuna/Compiler/Driver/Dt.vuna"
let v_cleanStartNext = (fun (cps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let m = (v_maxMetaCps cps) in (if (m < 0) then 0 else (m + 1))))

# 1144 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupKeepLastGo = (fun mc0 mc1 (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) mc3 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (let k = (mc0 dtb__259) in (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) k) mc2) then ((((v_dedupKeepLastGo mc0) dtb__260) mc2) mc3) else ((((v_dedupKeepLastGo mc0) dtb__260) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) k) true) mc2)) (B_dData_dList.C_List__x58__x58_ (dtb__259, mc3)))))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1141 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupKeepLast = (fun key xs -> ((((v_dedupKeepLastGo key) (B_dData_dList.v_reverse xs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 1159 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDefs = (fun (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtDefName) ds))

# 1162 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_bodyPairs = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (match (Elab_dTypes.v_dtDefBody dtb__261) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__263) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb__261); B_dData_dPair.f_Pair_second = dtb__263 }, (v_bodyPairs dtb__262)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_bodyPairs dtb__262)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1156 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDefBodies = (fun (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (v_bodyPairs (v_dedupDefs ds)))

# 1169 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDatas = (fun (ds : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtDataName) ds))

# 1172 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupInsts = (fun (ds : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtInstKey) ds))

# 1175 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupClasses = (fun (ds : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtClassName) ds))

# 1178 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupGlobals = (fun (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_dedupKeepLast (fun (g : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf g))) gs))

# 1086 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOfAt = (fun (next : int) (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let datas = (v_dedupDatas ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) progs)) in (let dataKeys = ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas)) ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors d)))) datas)) in (let defGlobals = ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf p)) dataKeys)) false))) (v_dedupGlobals ((B_dData_dList.v_append Elab_dPrelude.v_preludeGlobals) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) progs)))) in (let globals = ((B_dData_dList.v_append defGlobals) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDataKind d) })) datas)) in (let opaqueNames = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedOpaqueOf) progs)) in (let bodies = ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf p)) opaqueNames)))) (v_dedupDefBodies ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) progs))) in (let ec0 = Elab_dTypes.v_ecEmpty in (let ec1 = ((Elab_dDriver.v_addDatasEc ec0) datas) in (let ec2 = ((Elab_dDriver.v_addInstsEc ec1) (v_dedupInsts ((B_dData_dList.v_concatMap Driver_dCache.v_cachedInsts) progs))) in (let ec3 = ((Elab_dDriver.v_addClassesEc ec2) (v_dedupClasses ((B_dData_dList.v_concatMap Driver_dCache.v_cachedClasses) progs))) in (let ec4 = ((Elab_dTypes.v_ecPutNext ec3) next) in (let ec5 = ((Elab_dTypes.v_ecPutGlobalsTbl ec4) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) globals)) in (let ec6 = ((Elab_dTypes.v_ecPutDefTbl ec5) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) bodies)) in { B_dData_dPair.f_Pair_first = ec6; B_dData_dPair.f_Pair_second = globals }))))))))))))))

# 1111 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOf = (fun (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((v_depStartOfAt 0) progs))

# 1208 "Vuna/Compiler/Driver/Dt.vuna"
let v_sortNames = (B_dData_dSort.v_sortBy (fun (a : string) (b : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) a) b)))

# 1216 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupSortedGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__264, dtb__265) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> ((v_dedupSortedGo dtb__265) (B_dData_dList.C_List__x58__x58_ (dtb__264, mc1)))
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (if (dtb__264 = dtb__266) then ((v_dedupSortedGo dtb__265) mc1) else ((v_dedupSortedGo dtb__265) (B_dData_dList.C_List__x58__x58_ (dtb__264, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1213 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupSortedNames = (fun (xs : string B_dData_dList.t_List) -> (B_dData_dList.v_reverse ((v_dedupSortedGo xs) B_dData_dList.C_List_Nil)))

# 1223 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_nameSlotTbl = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__268, dtb__269) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = mc1 }, ((v_nameSlotTbl dtb__269) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1227 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_shiftedDepProgramsGo = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__270, dtb__271) -> (match ((B_dData_dList.v_lookupPair (Driver_dIface.v_miNameOf dtb__270)) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("iface: dependency module missing from shift table: " ^ (Driver_dIface.v_miNameOf dtb__270)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__272) -> ((Base_dCommon.v_bind ((Driver_dCache.v_shiftCachedProgram ((dtb__272 + 1) * Driver_dCache.v_summaryMetaSegment)) (Driver_dIface.v_miCachedOf dtb__270))) (fun (cp : Driver_dCache.t_CachedProgram) -> ((Base_dCommon.v_bind ((v_shiftedDepProgramsGo mc0) dtb__271)) (fun (rest2 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (cp, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1197 "Vuna/Compiler/Driver/Dt.vuna"
let v_shiftedDepPrograms = (fun (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let names = (v_dedupSortedNames (v_sortNames ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces))) in (if ((B_dData_dList.v_length names) <> (B_dData_dList.v_length ifaces)) then (Base_dDiag.v_icInternal "iface: duplicate dependency module name") else ((v_shiftedDepProgramsGo ((v_nameSlotTbl names) 0)) ifaces))))

# 1272 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtPrepareTermAux = (fun (aux : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls (Frontend_dRast_dBridge.v_toRastDecls aux))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings (B_dData_dPair.v_secondOf p))) (fun (ds : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dRast_dBridge.v_toAstDecls ds))))))))

# 1283 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dtAuxForTermination = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__273, dtb__274) -> (match dtb__273 with
  | Frontend_dAst.C_Decl_DFun (dtb__275, dtb__276, dtb__277, dtb__278) -> (match (Elab_dTermination_dMeasure.v_projectionOfDef { B_dData_dPair.f_Pair_first = dtb__275; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map Frontend_dRast_dBridge.v_toRastPat) dtb__276); B_dData_dPair.f_Pair_second = (Frontend_dRast_dBridge.v_toRastExpr dtb__277) }, B_dData_dList.C_List_Nil)) }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> (B_dData_dList.C_List__x58__x58_ (dtb__273, (v_dtAuxForTermination dtb__274)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_dtAuxForTermination dtb__274)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__273, (v_dtAuxForTermination dtb__274)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1296 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtElabFullWithPrepared = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (termAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (preparedAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dRecords.v_prepareDeclsWith (Frontend_dRast_dBridge.v_toRastDecls termAux)) ((Elab_dDriver.v_maybeAddHasFieldInstances startGlobals) (Frontend_dRast_dBridge.v_toRastDecls decls)))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = dtb__281 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb__281)) (fun (ds2 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (((((Elab_dDriver.v_elabProgramGoWithAux startEc) startGlobals) dtb__280) (Frontend_dRast_dBridge.v_toRastDecls (v_dtAuxForTermination preparedAux))) ds2)))
  | _ -> failwith "DT: impossible branch"
))))

# 1318 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxKeyOne = (fun (m : Driver_dIface.t_ModuleIface) -> (String.concat "" [(Driver_dIface.v_miNameOf m); ":"; (Driver_dIface.v_miIfaceHashOf m)]))

# 1321 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtAuxKey = (fun (pkg : string) (deps : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (bi_strFromInt (Driver_dIface.v_hashTextStrong (String.concat "" ["aux|"; pkg; "|"; ((B_dData_dString.v_join ";") ((B_dData_dList.v_map v_auxKeyOne) deps)); "|"; ((B_dData_dString.v_join ";") ((B_dData_dList.v_map v_auxKeyOne) clean))]))))

# 1326 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtAuxOfCache = (fun (mc0 : string) (mc1 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__282) -> (if ((dtb__282).f_AuxCache_auxCacheKey = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__282)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Driver/Dt.vuna"
let v_replCheckPartsAux = (fun (start : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) (pkgName : string) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let modules = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let depsOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules) in (let oursOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules) in (let termAux = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly) in (let ownDecls = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) oursOnly) in (let sourceDecls = ((B_dData_dList.v_append ownDecls) (B_dData_dPair.v_firstOf parts)) in (let key = (((v_dtAuxKey pkgName) ifaces) B_dData_dList.C_List_Nil) in (let cacheable = ((B_dData_dList.v_length ifaces) > 0) in (let cachedDecls = (if cacheable then ((v_dtAuxOfCache key) cache) else B_dData_dMaybe.C_Maybe_Nothing) in (let prepared = (match cachedDecls with
  | B_dData_dMaybe.C_Maybe_Just (dtb__283) -> (Base_dDiag.C_Check_OkC ((dtb__283).f_AuxCache_auxCacheDecls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_dtPrepareTermAux termAux)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind prepared) (fun (preparedAux : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_splitReplExpr sourceDecls)) (fun (p : (Frontend_dAst.t_Decl B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((((v_dtElabFullWithPrepared (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) termAux) preparedAux) (B_dData_dPair.v_firstOf p))) (fun (prog : Elab_dTypes.t_DtProgram) -> (let depDatas = ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps) in (let depDefs = ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) deps) in (let depGlobals = ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) deps) in (let assembled = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append depDatas) (Elab_dTypes.v_dtProgDatas prog)); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append depDefs) (Elab_dTypes.v_dtProgDefs prog)); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append depGlobals) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) } in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = assembled; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) }; B_dData_dPair.f_Pair_second = (if cacheable then (B_dData_dMaybe.C_Maybe_Just ({ f_AuxCache_auxCacheKey = key; f_AuxCache_auxCacheDecls = preparedAux; f_AuxCache_auxCacheStart = { B_dData_dPair.f_Pair_first = Elab_dTypes.v_ecEmpty; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; f_AuxCache_auxCacheDepCps = B_dData_dList.C_List_Nil; f_AuxCache_auxCacheCleanCps = B_dData_dList.C_List_Nil })) else B_dData_dMaybe.C_Maybe_Nothing) })))))))))))))))))))))))

# 431 "Vuna/Compiler/Driver/Dt.vuna"
let v_replCheckParts = (fun (start : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) (pkgName : string) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((((v_replCheckPartsAux start) pkgName) deps) parts) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing)) (fun (r : ((Elab_dTypes.t_DtProgram, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf r))))))

# 1359 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalSetup = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let parts = (B_dData_dPair.v_secondOf resolved) in (let loaderWarns = (B_dData_dPair.v_firstOf resolved) in (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let modules = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let ours = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules) in (let depsOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules) in (let cleanNames = (Driver_dIface.v_moduleNamesOf cleanIfaces) in (let dirtyOurs = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf m)) cleanNames)) false))) ours) in (let decls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) dirtyOurs)) (B_dData_dPair.v_firstOf parts)) in (let _u = ((Base_dObs.v_obsCounter "vuna.elab.incr.clean") (B_dData_dList.v_length cleanIfaces)) in (let _u = ((Base_dObs.v_obsCounter "vuna.elab.incr.dirty") (B_dData_dList.v_length dirtyOurs)) in (let _u = ((Base_dObs.v_obsCounter "vuna.elab.incr.decls") (B_dData_dList.v_length decls)) in (let termAux = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly)) ((B_dData_dList.v_concatMap Driver_dIface.v_miDeclsOf) cleanIfaces)) in (let key = (((v_dtAuxKey pkgName) depIfaces) cleanIfaces) in (let cacheable = ((bi_natAdd (B_dData_dList.v_length depIfaces) (B_dData_dList.v_length cleanIfaces)) > 0) in (let hit = (if cacheable then ((v_dtAuxOfCache key) cache) else B_dData_dMaybe.C_Maybe_Nothing) in (let depCpsR = (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__287) -> (Base_dDiag.C_Check_OkC ((dtb__287).f_AuxCache_auxCacheDepCps))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_shiftedDepPrograms depIfaces)
  | _ -> failwith "DT: impossible branch"
) in (let ifacePrepared = ((B_dData_dList.v_concatMap Driver_dIface.v_miPreparedOf) ((B_dData_dList.v_append depIfaces) cleanIfaces)) in (let missingPrepared = ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_length (Driver_dIface.v_miPreparedOf mi)) = 0))) ((B_dData_dList.v_append depIfaces) cleanIfaces)) in ((Base_dCommon.v_bind depCpsR) (fun (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let cleanCps = (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__286) -> (dtb__286).f_AuxCache_auxCacheCleanCps
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_map Driver_dIface.v_miCachedOf) cleanIfaces)
  | _ -> failwith "DT: impossible branch"
) in (let start = (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__285) -> (dtb__285).f_AuxCache_auxCacheStart
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_depStartOfAt (v_cleanStartNext cleanCps)) ((B_dData_dList.v_append depCps) cleanCps))
  | _ -> failwith "DT: impossible branch"
) in (let prepared = (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__284) -> (Base_dDiag.C_Check_OkC ((dtb__284).f_AuxCache_auxCacheDecls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((B_dData_dList.v_length ifacePrepared) > 0) then ((B_dData_dList.v_length missingPrepared) = 0) else false) then (Base_dDiag.C_Check_OkC (ifacePrepared)) else (v_dtPrepareTermAux termAux))
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind prepared) (fun (preparedAux : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let next = (if cacheable then (B_dData_dMaybe.C_Maybe_Just ({ f_AuxCache_auxCacheKey = key; f_AuxCache_auxCacheDecls = preparedAux; f_AuxCache_auxCacheStart = start; f_AuxCache_auxCacheDepCps = depCps; f_AuxCache_auxCacheCleanCps = cleanCps })) else B_dData_dMaybe.C_Maybe_Nothing) in (Base_dDiag.C_Check_OkC ({ f_DtIncrSetup_dsStartEc = (B_dData_dPair.v_firstOf start); f_DtIncrSetup_dsStartGlobals = (B_dData_dPair.v_secondOf start); f_DtIncrSetup_dsTermAux = termAux; f_DtIncrSetup_dsPrepared = preparedAux; f_DtIncrSetup_dsDecls = decls; f_DtIncrSetup_dsWarns = loaderWarns; f_DtIncrSetup_dsDepCps = depCps; f_DtIncrSetup_dsCleanCps = cleanCps; f_DtIncrSetup_dsNext = next }))))))))))))))))))))))))))))))

# 1427 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsIncrementalCore = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.lsp.goals.setup") (fun (_u : int) -> (((((v_dtIncrementalSetup ctx) resolved) depIfaces) cleanIfaces) cache)))) (fun (s : t_DtIncrSetup) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.lsp.goals.elab") (fun (_u : int) -> ((((Elab_dDriver.v_elabGoalsWithPrepared (s).f_DtIncrSetup_dsStartEc) (s).f_DtIncrSetup_dsStartGlobals) (Frontend_dRast_dBridge.v_toRastDecls (s).f_DtIncrSetup_dsTermAux)) (Frontend_dRast_dBridge.v_toRastDecls (s).f_DtIncrSetup_dsDecls))))) (fun (gs : Elab_dDriver.t_DtGoalInfo B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = gs; B_dData_dPair.f_Pair_second = (s).f_DtIncrSetup_dsNext })))))))

# 1507 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckScoped = (fun (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (unitDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((Lowering_dEnv.v_mkLwEnv allDatas) defs) globals) "")) (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.lower") (fun (_u : int) -> (((Lowering_dProgram.v_lowerUnitOf env) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) unitDatas))))) (fun (unitIr : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.gen") (fun (_u : int) -> ((Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts (Lowering_dEnv.v_lwEnvShared env)) unitIr)))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (0)))))))))))

# 1462 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishPackageScoped = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (next : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let assembled = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) cleanCps)) (Elab_dTypes.v_dtProgDefs prog))); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) cleanCps)) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) } in (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)) in (let checked = { f_CheckedPackage_checkedProgram = assembled; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf depCps); f_CheckedPackage_checkedWarnings = warns } in (let allDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))) in ((Base_dCommon.v_bind ((((v_dtCheckScoped allDatas) (Elab_dTypes.v_dtProgDatas prog)) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (checked)); B_dData_dPair.f_Pair_second = next })))))))))

# 1488 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishScoped = (fun (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let allDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))) in (let newDatas = (Elab_dTypes.v_dtProgDatas prog) in (let newDefs = (Elab_dTypes.v_dtProgDefs prog) in ((Base_dCommon.v_bind ((((v_dtCheckScoped allDatas) newDatas) newDefs) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = cache }))))))))

# 1414 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalCheckedCore = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) -> ((Base_dCommon.v_bind (((((v_dtIncrementalSetup ctx) resolved) depIfaces) cleanIfaces) cache)) (fun (s : t_DtIncrSetup) -> ((Base_dCommon.v_bind (((((v_dtElabFullWithPrepared (s).f_DtIncrSetup_dsStartEc) (s).f_DtIncrSetup_dsStartGlobals) (s).f_DtIncrSetup_dsTermAux) (s).f_DtIncrSetup_dsPrepared) (s).f_DtIncrSetup_dsDecls)) (fun (prog : Elab_dTypes.t_DtProgram) -> (let warns = ((B_dData_dList.v_append (s).f_DtIncrSetup_dsWarns) (Elab_dTypes.v_dtProgWarnings prog)) in ((Base_dCommon.v_bind (if needPackage then ((((((v_dtFinishPackageScoped (s).f_DtIncrSetup_dsWarns) (s).f_DtIncrSetup_dsDepCps) (s).f_DtIncrSetup_dsCleanCps) prog) (B_dData_dPair.v_secondOf resolved)) (s).f_DtIncrSetup_dsNext) else ((((v_dtFinishScoped (s).f_DtIncrSetup_dsDepCps) (s).f_DtIncrSetup_dsCleanCps) prog) (s).f_DtIncrSetup_dsNext))) (fun (r : (t_CheckedPackage B_dData_dMaybe.t_Maybe, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = r }))))))))))

# 1330 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalChecked = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((v_dtIncrementalCheckedCore ctx) resolved) depIfaces) cleanIfaces) B_dData_dMaybe.C_Maybe_Nothing) true)) (fun (r : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (t_CheckedPackage B_dData_dMaybe.t_Maybe, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf r)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__288) -> (Base_dDiag.C_Check_OkC (dtb__288))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "incremental check produced no package")
  | _ -> failwith "DT: impossible branch"
))))

# 1630 "Vuna/Compiler/Driver/Dt.vuna"
let v_findModuleNameField = (fun (i : Frontend_dAst.t_Import) -> (i).Frontend_dAst.f_Import_importName)

# 1633 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findModuleNamed = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__289, dtb__290) -> (if ((Loader_dModules.v_moduleNameOf dtb__289) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__289)) else ((v_findModuleNamed dtb__290) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1638 "Vuna/Compiler/Driver/Dt.vuna"
let v_topoDepsOf = (fun (mods : Loader_dModules.t_Module B_dData_dList.t_List) (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_filter (fun (n : string) -> (match ((v_findModuleNamed mods) n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__291) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf))))

# 1648 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_topoVisit = (fun (fuel : int) (mods : Loader_dModules.t_Module B_dData_dList.t_List) (name : string) (visited : string B_dData_dList.t_List) (acc : Loader_dModules.t_Module B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = acc } else (if ((B_dData_dList.v_memName name) visited) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = acc } else (match ((v_findModuleNamed mods) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, visited)); B_dData_dPair.f_Pair_second = acc }
  | B_dData_dMaybe.C_Maybe_Just (dtb__292) -> (let step = (((((v_topoVisitAll (fuel - 1)) mods) ((v_topoDepsOf mods) dtb__292)) (B_dData_dList.C_List__x58__x58_ (name, visited))) acc) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf step); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf step)) (B_dData_dList.C_List__x58__x58_ (dtb__292, B_dData_dList.C_List_Nil))) })
  | _ -> failwith "DT: impossible branch"
))))
# 1662 "Vuna/Compiler/Driver/Dt.vuna"
and v_topoVisitAll = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__293, dtb__294) -> (let step = (((((v_topoVisit mc0) mc1) dtb__293) mc3) mc4) in (((((v_topoVisitAll mc0) mc1) dtb__294) (B_dData_dPair.v_firstOf step)) (B_dData_dPair.v_secondOf step)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 1673 "Vuna/Compiler/Driver/Dt.vuna"
let v_moduleOrderLess = (fun (a : Loader_dModules.t_Module) (b : Loader_dModules.t_Module) -> (let ka = (Base_dHash.v_contentKey (Loader_dModules.v_moduleNameOf a)) in (let kb = (Base_dHash.v_contentKey (Loader_dModules.v_moduleNameOf b)) in (if (ka <> kb) then (ka < kb) else ((Loader_dModules.v_moduleNameOf a) <= (Loader_dModules.v_moduleNameOf b))))))

# 1680 "Vuna/Compiler/Driver/Dt.vuna"
let v_topoModules = (fun (mods : Loader_dModules.t_Module B_dData_dList.t_List) -> (let sorted = ((B_dData_dSort.v_sortBy v_moduleOrderLess) mods) in (B_dData_dPair.v_secondOf (((((v_topoVisitAll ((B_dData_dList.v_length sorted) + 1)) sorted) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) sorted)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))))

# 1692 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitDeclsHash = (fun (m : Loader_dModules.t_Module) -> ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encDecls) (Loader_dModules.v_moduleDeclsOf m)))

# 1698 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitModuleId = (fun (modIds : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (m : Loader_dModules.t_Module) -> (match ((B_dData_dList.v_lookupPair (Loader_dModules.v_moduleNameOf m)) modIds) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__295) -> ("a:" ^ dtb__295)
  | B_dData_dMaybe.C_Maybe_Nothing -> ("d:" ^ (v_unitDeclsHash m))
  | _ -> failwith "DT: impossible branch"
))

# 1704 "Vuna/Compiler/Driver/Dt.vuna"
let v_pairKeyValue = (fun (p : (string, string) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_secondOf p))

# 1707 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitImportsOf = (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf)))

# 1710 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_concatKeys = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__296, dtb__297) -> (String.concat "" [dtb__296; ";"; (v_concatKeys dtb__297)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1714 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitImportKey = (fun (acc : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (n : string) -> (match ((B_dData_dList.v_lookupPair n) acc) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> dtb__298
  | B_dData_dMaybe.C_Maybe_Nothing -> "?"
  | _ -> failwith "DT: impossible branch"
))

# 1720 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitKeyOne = (fun (modIds : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (m : Loader_dModules.t_Module) -> (let deps = ((B_dData_dList.v_map (v_unitImportKey acc)) (v_unitImportsOf m)) in (Driver_dIface.v_shaText (String.concat "" ["u|"; (Loader_dModules.v_moduleNameOf m); "|"; ((v_unitModuleId modIds) m); "|"; (v_concatKeys deps)]))))

# 1726 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_unitKeysGo = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__299, dtb__300) -> (((v_unitKeysGo mc0) dtb__300) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb__299); B_dData_dPair.f_Pair_second = (((v_unitKeyOne mc0) mc2) dtb__299) }, mc2)))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 1731 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitKeysOf = (fun (modIds : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (printResult : bool) -> (let modKeys = (((v_unitKeysGo modIds) modules) B_dData_dList.C_List_Nil) in (let entryHash = ((Base_dBytes.v_encTop Frontend_dCanonical_dAst.v_encDecls) entryDecls) in (let entryKey = (Driver_dIface.v_shaText (String.concat "" ["e|"; entryHash; "|"; (if printResult then "consolePrint" else "noprint"); "|"; (v_concatKeys ((B_dData_dList.v_map v_pairKeyValue) modKeys))])) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "__entry__"; B_dData_dPair.f_Pair_second = entryKey }, modKeys))))))

# 1743 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitCacheLookup = (fun (nFs : string) (nEnv : string) (dir : string) (keys : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) -> (match ((B_dData_dList.v_lookupPair name) keys) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__301) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dPerfCache.v_unitCacheRead nFs) nEnv) dir) name) dtb__301)) (fun cached -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match cached with
  | B_dData_dMaybe.C_Maybe_Just (dtb__302) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("unit-cache-hit " ^ name)) else 0) in (B_dData_dMaybe.C_Maybe_Just (dtb__302)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 1759 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitCacheStore = (fun (nFs : string) (nEnv : string) (nProcess : string) (dir : string) (keys : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) (sf : Driver_dSplit.t_SplitFile) -> (match ((B_dData_dList.v_lookupPair name) keys) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__303) -> (((((((Driver_dPerfCache.v_unitCacheWrite nFs) nEnv) nProcess) dir) name) dtb__303) sf)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1768 "Vuna/Compiler/Driver/Dt.vuna"
let v_unitCacheEnabled = (fun (nEnv : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_UNIT_CACHE")) (fun v -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v <> "0")))))

# 1774 "Vuna/Compiler/Driver/Dt.vuna"
let v_splitGenerateCached = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (modIds : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (moduleParts : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let pkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let bucketKey = (String.concat "" [pkg; "|"; entry]) in (let roots = ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) (Frontend_dPackages_dPkg.v_contextRoots ctx)) in (let cdir = (Frontend_dPackages_dPkg.v_contextDir ctx) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "cg-generate-start") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (v_unitCacheEnabled nEnv)) (fun enabled -> (if (if (pkg = "") then true else (B_dData_dBool.v_not enabled)) then (((((((Driver_dSplitGen.v_generateDtSplitProgram moduleParts) entryDecls) prog) printResult) roots) cdir) extraDefLocs) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Driver_dPerfCache.v_unitCacheDir nFs) nEnv) nProcess) pkg)) (fun base -> (let keys = ((((v_unitKeysOf modIds) modules) entryDecls) printResult) in (let dir = ((Driver_dPerfCache.v_unitCacheEntryDir base) bucketKey) in (let keepNames = ((B_dData_dList.v_map (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((Driver_dPerfCache.v_unitCacheFileName (B_dData_dPair.v_firstOf p)) (B_dData_dPair.v_secondOf p)))) keys) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "cg-keys-done") else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Driver_dPerfCache.v_unitCacheBucketGc nFs) nProcess) dir) keepNames)) (fun _u -> (((((((((Driver_dSplitGen.v_generateDtSplitProgramWith ((((v_unitCacheLookup nFs) nEnv) dir) keys)) (((((v_unitCacheStore nFs) nEnv) nProcess) dir) keys)) moduleParts) entryDecls) prog) printResult) roots) cdir) extraDefLocs))))))))))))))))))

# 1800 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGenerateIncremental = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (modIds : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (checked : t_CheckedPackage) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let modules = (v_topoModules (B_dData_dPair.v_secondOf parts)) in (let moduleParts = ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((((((v_splitGenerateCached nFs) nConsole) nEnv) nProcess) ctx) entry) modIds) modules) moduleParts) (B_dData_dPair.v_firstOf parts)) (checked).f_CheckedPackage_checkedProgram) printResult) extraDefLocs)) (fun filesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__304) -> (Base_dDiag.C_Check_ErrC (dtb__304))
  | Base_dDiag.C_Check_OkC (dtb__305) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__305; B_dData_dPair.f_Pair_second = checked }))
  | _ -> failwith "DT: impossible branch"
)))))))

# 1841 "Vuna/Compiler/Driver/Dt.vuna"
let v_moduleOfIface = (fun (mi : Driver_dIface.t_ModuleIface) -> { Loader_dModules.f_Module_moduleNameOf = (Driver_dIface.v_miNameOf mi); Loader_dModules.f_Module_modulePackageOf = (Driver_dIface.v_miPackageOf mi); Loader_dModules.f_Module_moduleImportsOf = (Driver_dIface.v_miImportsOf mi); Loader_dModules.f_Module_moduleImplicitImportsOf = (Driver_dIface.v_miImplicitImportsOf mi); Loader_dModules.f_Module_moduleDeclsOf = (Driver_dIface.v_miDeclsOf mi); Loader_dModules.f_Module_moduleExportsOf = (Driver_dIface.v_miExportsOf mi); Loader_dModules.f_Module_moduleFixitiesOf = (Driver_dIface.v_miFixitiesOf mi); Loader_dModules.f_Module_moduleReexportsOf = B_dData_dList.C_List_Nil; Loader_dModules.f_Module_moduleOpaqueOf = (Driver_dCache.v_cachedOpaqueOf (Driver_dIface.v_miCachedOf mi)); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf (Driver_dIface.v_miExportsOf mi)); Loader_dModules.f_Module_moduleFixFactsOf = Frontend_dCst.v_emptyFixityFacts })

# 1237 "Vuna/Compiler/Driver/Dt.vuna"
let v_modulesOfIfaces = (fun (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) ifaces)))

# 1861 "Vuna/Compiler/Driver/Dt.vuna"
let v_importsOfModuleNames = (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf)))

# 1870 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_importsEdgeCount = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__306, dtb__307) -> ((B_dData_dList.v_length (v_importsOfModuleNames dtb__306)) + (v_importsEdgeCount dtb__307))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1867 "Vuna/Compiler/Driver/Dt.vuna"
let v_closureFuel = (fun (mods : Loader_dModules.t_Module B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((B_dData_dList.v_length starts) + (B_dData_dList.v_length mods)) + (v_importsEdgeCount mods)) + 1))

# 1874 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_closureGo = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__308, dtb__309) -> (if (mc0 <= 0) then mc2 else (if ((B_dData_dList.v_memName dtb__308) mc2) then ((((v_closureGo mc0) mc1) mc2) dtb__309) else (match ((v_findModuleNamed mc1) dtb__308) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_closureGo (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__308, mc2))) dtb__309)
  | B_dData_dMaybe.C_Maybe_Just (dtb__310) -> ((((v_closureGo (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__308, mc2))) ((B_dData_dList.v_append dtb__309) (v_importsOfModuleNames dtb__310)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1886 "Vuna/Compiler/Driver/Dt.vuna"
let v_filterProjectToImports = (fun (mc0 : string) (mc1 : Loader_dModules.t_Project) -> (match mc1 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb__311; Loader_dModules.f_Project_projectEntryImports = dtb__312; Loader_dModules.f_Project_projectImplicitImports = dtb__313; Loader_dModules.f_Project_projectModules = dtb__314; Loader_dModules.f_Project_projectEntryPkg = dtb__315; Loader_dModules.f_Project_projectEntryFixities = dtb__316; Loader_dModules.f_Project_projectEntryName = dtb__317; Loader_dModules.f_Project_projectEntryFacts = dtb__318 } -> (let entryStarts = ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append dtb__312) dtb__313)) in (let ownNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = mc0))) dtb__314)) in (let starts = ((B_dData_dList.v_append entryStarts) ownNames) in (let closed = ((((v_closureGo ((v_closureFuel dtb__314) starts)) dtb__314) B_dData_dList.C_List_Nil) starts) in (let kept = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf m)) closed))) dtb__314) in { B_dData_dPair.f_Pair_first = { Loader_dModules.f_Project_projectEntryDecls = dtb__311; Loader_dModules.f_Project_projectEntryImports = dtb__312; Loader_dModules.f_Project_projectImplicitImports = dtb__313; Loader_dModules.f_Project_projectModules = kept; Loader_dModules.f_Project_projectEntryPkg = dtb__315; Loader_dModules.f_Project_projectEntryFixities = dtb__316; Loader_dModules.f_Project_projectEntryName = dtb__317; Loader_dModules.f_Project_projectEntryFacts = dtb__318 }; B_dData_dPair.f_Pair_second = kept })))))
  | _ -> failwith "DT: impossible branch"
))

# 1896 "Vuna/Compiler/Driver/Dt.vuna"
let v_preloadKeepOf = (fun (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mods : Loader_dModules.t_Module B_dData_dList.t_List) -> ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) mods)))) ifaces)))

# 1247 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let preloaded = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let allIfaces = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) preloaded)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__319) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__319)))
  | Base_dDiag.C_Check_OkC (dtb__320) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__320) with
  | { B_dData_dPair.f_Pair_first = dtb__321; B_dData_dPair.f_Pair_second = dtb__322 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__322)) dtb__321))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 1900 "Vuna/Compiler/Driver/Dt.vuna"
let v_materializedDeps = (fun (pkg : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let depNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkg))) (B_dData_dPair.v_secondOf parts))) in ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) depNames))) ifaces)))

# 483 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfacesAux = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-source=repl modules=" ^ (bi_strFromInt (B_dData_dList.v_length ifaces)))) else 0) in (let src = (String.concat "" [program; "\n"; v_replExprName; " = "; exprSource; "\n"]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Loader_dFlatten.v_loadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) "<repl>") src) (v_modulesOfIfaces ifaces))) (fun loaded -> (match loaded with
  | Base_dDiag.C_Check_ErrC (dtb__323) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__323)))
  | Base_dDiag.C_Check_OkC (dtb__324) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__324) with
  | { B_dData_dPair.f_Pair_first = dtb__325; B_dData_dPair.f_Pair_second = dtb__326 } -> (let missing = (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__326) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces)) in (let _u = (if ((B_dData_dList.v_length missing) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=repl missing=" ^ ((B_dData_dString.v_join ",") missing))) else 0) else 0) in (if ((B_dData_dList.v_length missing) = 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__326)) dtb__325) with
  | Base_dDiag.C_Check_ErrC (dtb__327) -> (Base_dDiag.C_Check_ErrC (dtb__327))
  | Base_dDiag.C_Check_OkC (dtb__328) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__328)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__329) -> (Base_dDiag.C_Check_ErrC (dtb__329))
  | Base_dDiag.C_Check_OkC (dtb__330) -> (let parts = (B_dData_dPair.v_secondOf dtb__328) in ((((((v_replCheckPartsAux (v_depStartOf dtb__330)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__330) parts) ifaces) cache))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_replProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__331) -> (Base_dDiag.C_Check_ErrC (dtb__331))
  | Base_dDiag.C_Check_OkC (dtb__332) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__332; B_dData_dPair.f_Pair_second = cache }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 472 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_replProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) B_dData_dMaybe.C_Maybe_Nothing)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match r with
  | Base_dDiag.C_Check_ErrC (dtb__333) -> (Base_dDiag.C_Check_ErrC (dtb__333))
  | Base_dDiag.C_Check_OkC (dtb__334) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__334)))
  | _ -> failwith "DT: impossible branch"
)))))

# 520 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithAuxCache = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_replProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__335) -> (Base_dDiag.C_Check_ErrC (dtb__335))
  | Base_dDiag.C_Check_OkC (dtb__336) -> (match ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__336))) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__336)))) with
  | Base_dDiag.C_Check_ErrC (dtb__337) -> (Base_dDiag.C_Check_ErrC (dtb__337))
  | Base_dDiag.C_Check_OkC (dtb__338) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__336) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 533 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithAuxCache = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_replProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__339) -> (Base_dDiag.C_Check_ErrC (dtb__339))
  | Base_dDiag.C_Check_OkC (dtb__340) -> (match ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__340))) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__340)))) with
  | Base_dDiag.C_Check_ErrC (dtb__341) -> (Base_dDiag.C_Check_ErrC (dtb__341))
  | Base_dDiag.C_Check_OkC (dtb__342) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__342; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__340) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 546 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_replProgramWithIfaces nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__343) -> (Base_dDiag.C_Check_ErrC (dtb__343))
  | Base_dDiag.C_Check_OkC (dtb__344) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb__344)) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf dtb__344)))
  | _ -> failwith "DT: impossible branch"
)))))

# 556 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_replProgramWithIfaces nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces)) (fun pR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__345) -> (Base_dDiag.C_Check_ErrC (dtb__345))
  | Base_dDiag.C_Check_OkC (dtb__346) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb__346)) (Frontend_dRast_dBridge.v_toRastExpr (B_dData_dPair.v_secondOf dtb__346)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1906 "Vuna/Compiler/Driver/Dt.vuna"
let v_materializedOwn = (fun (pkg : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let ourNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkg))) (B_dData_dPair.v_secondOf parts))) in ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) ourNames))) ifaces)))

# 1520 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) -> (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let preloaded = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let allIfaces = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) preloaded)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__347) -> (Base_dDiag.C_Check_ErrC (dtb__347))
  | Base_dDiag.C_Check_OkC (dtb__348) -> (match ((v_filterProjectToImports pkgName) dtb__348) with
  | { B_dData_dPair.f_Pair_first = dtb__349; B_dData_dPair.f_Pair_second = dtb__350 } -> (let missing = (((v_missingDepModules pkgName) dtb__350) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) allIfaces)) in (let _u = (if ((B_dData_dList.v_length missing) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=check-incremental missing=" ^ ((B_dData_dString.v_join ",") missing))) else 0) else 0) in (if ((B_dData_dList.v_length missing) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = cache } } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__350)) dtb__349) with
  | Base_dDiag.C_Check_ErrC (dtb__351) -> (Base_dDiag.C_Check_ErrC (dtb__351))
  | Base_dDiag.C_Check_OkC (dtb__352) -> (match ((((((v_dtIncrementalCheckedCore ctx) dtb__352) (((v_materializedDeps pkgName) (B_dData_dPair.v_secondOf dtb__352)) depIfaces)) (((v_materializedOwn pkgName) (B_dData_dPair.v_secondOf dtb__352)) cleanIfaces)) cache) needPackage) with
  | Base_dDiag.C_Check_ErrC (dtb__353) -> (Base_dDiag.C_Check_ErrC (dtb__353))
  | Base_dDiag.C_Check_OkC (dtb__354) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__354 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 1551 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let preloaded = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let allIfaces = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) preloaded)) (fun projectR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__355) -> (Base_dDiag.C_Check_ErrC (dtb__355))
  | Base_dDiag.C_Check_OkC (dtb__356) -> (match ((v_filterProjectToImports pkgName) dtb__356) with
  | { B_dData_dPair.f_Pair_first = dtb__357; B_dData_dPair.f_Pair_second = dtb__358 } -> (let missing = (((v_missingDepModules pkgName) dtb__358) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) allIfaces)) in (let _u = (if ((B_dData_dList.v_length missing) > 0) then (Base_dObs.v_obsMark "vuna.lsp.goals.fallback") else 0) in (if ((B_dData_dList.v_length missing) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = cache } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__358)) dtb__357) with
  | Base_dDiag.C_Check_ErrC (dtb__359) -> (Base_dDiag.C_Check_ErrC (dtb__359))
  | Base_dDiag.C_Check_OkC (dtb__360) -> (match (((((v_dtGoalsIncrementalCore ctx) dtb__360) (((v_materializedDeps pkgName) (B_dData_dPair.v_secondOf dtb__360)) depIfaces)) (((v_materializedOwn pkgName) (B_dData_dPair.v_secondOf dtb__360)) cleanIfaces)) cache) with
  | Base_dDiag.C_Check_ErrC (dtb__361) -> (Base_dDiag.C_Check_ErrC (dtb__361))
  | Base_dDiag.C_Check_OkC (dtb__362) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__362 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 1583 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((((v_dtCheckSourceIncremental nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) B_dData_dList.C_List_Nil) cache) true)) (fun rR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match rR with
  | Base_dDiag.C_Check_ErrC (dtb__363) -> (Base_dDiag.C_Check_ErrC (dtb__363))
  | Base_dDiag.C_Check_OkC (dtb__364) -> (match (B_dData_dPair.v_secondOf dtb__364) with
  | { B_dData_dPair.f_Pair_first = dtb__365; B_dData_dPair.f_Pair_second = dtb__366 } -> (match (B_dData_dPair.v_firstOf dtb__366) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__367) -> (match (v_evalDtMain (dtb__367).f_CheckedPackage_checkedProgram) with
  | Base_dDiag.C_Check_ErrC (dtb__368) -> (Base_dDiag.C_Check_ErrC (dtb__368))
  | Base_dDiag.C_Check_OkC (dtb__369) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__364); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__366) } }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__364); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__366) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1614 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPackageIncrementalParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_dtLoadPartsIncremental nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__370) -> (Base_dDiag.C_Check_ErrC (dtb__370))
  | Base_dDiag.C_Check_OkC (dtb__371) -> (match ((((v_dtIncrementalChecked ctx) dtb__371) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__371)) depIfaces)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__371)) cleanIfaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__372) -> (Base_dDiag.C_Check_ErrC (dtb__372))
  | Base_dDiag.C_Check_OkC (dtb__373) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__373).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb__373 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1823 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectIncremental = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_dtLoadPartsIncremental nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__374) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__374)))
  | Base_dDiag.C_Check_OkC (dtb__375) -> (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let parts = (B_dData_dPair.v_secondOf dtb__375) in (let cleanOwn = (((v_materializedOwn pkgName) parts) cleanIfaces) in (let extraDefLocs = ((B_dData_dList.v_concatMap Driver_dIface.v_miDefLocsOf) cleanOwn) in (match ((((v_dtIncrementalChecked ctx) dtb__375) (((v_materializedDeps pkgName) parts) depIfaces)) cleanOwn) with
  | Base_dDiag.C_Check_ErrC (dtb__376) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__376)))
  | Base_dDiag.C_Check_OkC (dtb__377) -> (((((((((((v_dtGenerateIncremental nFs) nConsole) nEnv) nProcess) ctx) entry) B_dData_dList.C_List_Nil) parts) dtb__377) printResult) extraDefLocs)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 1912 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) (v_modulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__378) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__378)))
  | Base_dDiag.C_Check_OkC (dtb__379) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__379) with
  | { B_dData_dPair.f_Pair_first = dtb__380; B_dData_dPair.f_Pair_second = dtb__381 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__381)) dtb__380))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1926 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) (v_modulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__382) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__382)))
  | Base_dDiag.C_Check_OkC (dtb__383) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__383) with
  | { B_dData_dPair.f_Pair_first = dtb__384; B_dData_dPair.f_Pair_second = dtb__385 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__385)) dtb__384))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1953 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let preloaded = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let allIfaces = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) preloaded)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__386) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__386)))
  | Base_dDiag.C_Check_OkC (dtb__387) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__387) with
  | { B_dData_dPair.f_Pair_first = dtb__388; B_dData_dPair.f_Pair_second = dtb__389 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__389)) dtb__388))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 1970 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageIncrementalParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_dtLoadModulesPartsIncremental nFs) nEnv) nProcess) ctx) names) depIfaces) cleanIfaces)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__390) -> (Base_dDiag.C_Check_ErrC (dtb__390))
  | Base_dDiag.C_Check_OkC (dtb__391) -> (match ((((v_dtIncrementalChecked ctx) dtb__391) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__391)) depIfaces)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__391)) cleanIfaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__392) -> (Base_dDiag.C_Check_ErrC (dtb__392))
  | Base_dDiag.C_Check_OkC (dtb__393) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__393).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb__393 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 2026 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOursWith = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (modIds : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let modules = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let ours = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules) in (let depsOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules) in (let allDecls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) ours)) (B_dData_dPair.v_firstOf parts)) in (let termAux = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly) in (let start = (v_depStartOf deps) in (match ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) (Frontend_dRast_dBridge.v_toRastDecls termAux)) (Frontend_dRast_dBridge.v_toRastDecls allDecls)) with
  | Base_dDiag.C_Check_ErrC (dtb__394) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__394)))
  | Base_dDiag.C_Check_OkC (dtb__395) -> (let assembled = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps)) (Elab_dTypes.v_dtProgDatas dtb__395)); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) deps)) (Elab_dTypes.v_dtProgDefs dtb__395)); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals dtb__395); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols dtb__395); Elab_dTypes.f_DtProgram_dtProgGlobals = (Elab_dTypes.v_dtProgGlobals dtb__395); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts dtb__395); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses dtb__395); Elab_dTypes.f_DtProgram_dtProgNext = (dtb__395).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (dtb__395).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings dtb__395) } in (let moduleParts = ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules) in (let checked = { f_CheckedPackage_checkedProgram = dtb__395; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf deps); f_CheckedPackage_checkedWarnings = (Elab_dTypes.v_dtProgWarnings dtb__395) } in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((((((v_splitGenerateCached nFs) nConsole) nEnv) nProcess) ctx) entry) modIds) modules) moduleParts) (B_dData_dPair.v_firstOf parts)) assembled) printResult) extraDefLocs)) (fun filesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__396) -> (Base_dDiag.C_Check_ErrC (dtb__396))
  | Base_dDiag.C_Check_OkC (dtb__397) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__397; B_dData_dPair.f_Pair_second = checked }))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1999 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectWithIfaces = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (modIds : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.codegen.split")) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_dtLoadPartsWithIfaces nFs) nEnv) nProcess) ctx) entry) ifaces)) (fun partsR -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__398) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__398)))
  | Base_dDiag.C_Check_OkC (dtb__399) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__399)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__400) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__400)))
  | Base_dDiag.C_Check_OkC (dtb__401) -> (((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) modIds) (B_dData_dPair.v_secondOf dtb__399)) dtb__401) printResult) ((B_dData_dList.v_concatMap Driver_dIface.v_miDefLocsOf) ifaces))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (fun r -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.codegen.split")) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) r))))))))))

# 2022 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOurs = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (printResult : bool) -> (((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) B_dData_dList.C_List_Nil) parts) deps) printResult) B_dData_dList.C_List_Nil))

# 2080 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectParts = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (modIds : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_dtLoadParts nFs) nEnv) nProcess) ctx) entry)) (fun partsR -> (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__402) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__402)))
  | Base_dDiag.C_Check_OkC (dtb__403) -> (let parts = (B_dData_dPair.v_secondOf dtb__403) in (let loaderWarns = (B_dData_dPair.v_firstOf dtb__403) in (let modules = (v_topoModules (B_dData_dPair.v_secondOf parts)) in (let allDecls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) modules)) (B_dData_dPair.v_firstOf parts)) in (match (Elab_dDriver.v_elabProgramFull (Frontend_dRast_dBridge.v_toRastDecls allDecls)) with
  | Base_dDiag.C_Check_ErrC (dtb__404) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__404)))
  | Base_dDiag.C_Check_OkC (dtb__405) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((((((v_splitGenerateCached nFs) nConsole) nEnv) nProcess) ctx) entry) modIds) modules) ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules)) (B_dData_dPair.v_firstOf parts)) dtb__405) printResult) B_dData_dList.C_List_Nil)) (fun filesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__406) -> (Base_dDiag.C_Check_ErrC (dtb__406))
  | Base_dDiag.C_Check_OkC (dtb__407) -> (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings dtb__405)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__407; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb__405; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = warns } })))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 2127 "Vuna/Compiler/Driver/Dt.vuna"
let v_maybeTermGlobals = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__408) -> (Core_dTerm.v_termGlobalNames dtb__408)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2123 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtDefGlobalNames = (fun (d : Elab_dTypes.t_DtDef) -> ((B_dData_dList.v_append (v_maybeTermGlobals (Elab_dTypes.v_dtDefBody d))) (Core_dTerm.v_termGlobalNames (Elab_dTypes.v_dtDefType d))))

# 2139 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_warnUnusedDefsTbl = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__409, dtb__410) -> (let name = (Elab_dTypes.v_dtDefName dtb__409) in (let skip = (if (if (name = "main") then true else ((B_dData_dString.v_startsWith "_") name)) then true else ((B_dData_dString.v_startsWith "$") name)) in (if skip then ((v_warnUnusedDefsTbl dtb__410) mc1) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) mc1) then ((v_warnUnusedDefsTbl dtb__410) mc1) else (match (Elab_dTypes.v_dtDefSpan dtb__409) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__411) -> (B_dData_dList.C_List__x58__x58_ (((((Base_dDiagnostics_dWarning.v_warnDiagAtMod (fun (x : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = (String.concat "" ["remove unused definition `"; name; "`"]); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = dtb__411; Base_dDiag.f_DiagEdit_editNewText = "" }, B_dData_dList.C_List_Nil)) }) x))) dtb__411) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedDefinition (name))) (B_dData_dVec.C_Vec_VCons (name, B_dData_dVec.C_Vec_Nil))), ((v_warnUnusedDefsTbl dtb__410) mc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_warnUnusedDefsTbl dtb__410) mc1)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2136 "Vuna/Compiler/Driver/Dt.vuna"
let v_warnUnusedDefsGo = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (used : string B_dData_dList.t_List) -> ((v_warnUnusedDefsTbl defs) (B_dContainer_dHashMap.v_ofNames used)))

# 2115 "Vuna/Compiler/Driver/Dt.vuna"
let v_warnUnusedDefsIn = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let used = ((B_dData_dList.v_concatMap v_dtDefGlobalNames) defs) in ((v_warnUnusedDefsGo defs) used)))

# 2158 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckRecovering = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_dtLoad nFs) nEnv) nProcess) ctx) entry)) (fun declsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match declsR with
  | Base_dDiag.C_Check_ErrC (dtb__412) -> (Base_dDiag.C_Check_ErrC (dtb__412))
  | Base_dDiag.C_Check_OkC (dtb__413) -> (Elab_dDriver.v_elabProgramErrors (Frontend_dRast_dBridge.v_toRastDecls (B_dData_dPair.v_firstOf dtb__413)))
  | _ -> failwith "DT: impossible branch"
)))))

# 2169 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryRecovering = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_dtLoadModulesParts nFs) nEnv) nProcess) ctx) names)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__414) -> (Base_dDiag.C_Check_ErrC (dtb__414))
  | Base_dDiag.C_Check_OkC (dtb__415) -> (Elab_dDriver.v_elabProgramErrors (Frontend_dRast_dBridge.v_toRastDecls (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__415))))
  | _ -> failwith "DT: impossible branch"
)))))

# 2181 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkDtProgramOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.lower") (fun (_u : int) -> (((Lowering_dProgram.v_lowerProgramOf datas) defs) globals)))) (fun (programIr : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.gen") (fun (_u : int) -> ((Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts (Vuna_dIr_dModel.v_irProgSharedOf programIr)) (Vuna_dIr_dModel.v_irProgUnitOf programIr))))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (0)))))))

# 143 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkDeclsWithWarns = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "decls-ready") else 0) in (match ((Base_dObs.v_obsCheck "vuna.elab") (fun (_u : int) -> (Elab_dDriver.v_elabProgramFull ((Base_dObs.v_obsPure "vuna.elab.rast") (fun (_u : int) -> (Frontend_dRast_dBridge.v_toRastDecls decls)))))) with
  | Base_dDiag.C_Check_ErrC (dtb__416) -> (Base_dDiag.C_Check_ErrC (dtb__416))
  | Base_dDiag.C_Check_OkC (dtb__417) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "elab-done") else 0) in ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb__417)) (Elab_dTypes.v_dtProgDefs dtb__417)) (Elab_dTypes.v_dtProgGlobals dtb__417)) with
  | Base_dDiag.C_Check_ErrC (dtb__418) -> (Base_dDiag.C_Check_ErrC (dtb__418))
  | Base_dDiag.C_Check_OkC (dtb__419) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "codegen-check-done") else 0) in (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append loaderWarns) ((B_dData_dList.v_append (Elab_dTypes.v_dtProgWarnings dtb__417)) (v_warnUnusedDefsIn (Elab_dTypes.v_dtProgDefs dtb__417)))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))

# 133 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckDecls = (fun (loaded : (Frontend_dAst.t_Decl B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) loaded) (fun loadedR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match loadedR with
  | Base_dDiag.C_Check_ErrC (dtb__420) -> (Base_dDiag.C_Check_ErrC (dtb__420))
  | Base_dDiag.C_Check_OkC (dtb__421) -> ((v_checkDeclsWithWarns (B_dData_dPair.v_secondOf dtb__421)) (B_dData_dPair.v_firstOf dtb__421))
  | _ -> failwith "DT: impossible branch"
)))))

# 173 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPartsWithProgram = (fun (pkg : string) (loaded : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) loaded) (fun loadedR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match loadedR with
  | Base_dDiag.C_Check_ErrC (dtb__422) -> (Base_dDiag.C_Check_ErrC (dtb__422))
  | Base_dDiag.C_Check_OkC (dtb__423) -> (let parts = (B_dData_dPair.v_secondOf dtb__423) in (let loaderWarns = (B_dData_dPair.v_firstOf dtb__423) in (let decls = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf parts)) (B_dData_dPair.v_firstOf parts)) in (match ((Base_dObs.v_obsCheck "vuna.elab") (fun (_u : int) -> (Elab_dDriver.v_elabProgramFull ((Base_dObs.v_obsPure "vuna.elab.rast") (fun (_u : int) -> (Frontend_dRast_dBridge.v_toRastDecls decls)))))) with
  | Base_dDiag.C_Check_ErrC (dtb__424) -> (Base_dDiag.C_Check_ErrC (dtb__424))
  | Base_dDiag.C_Check_OkC (dtb__425) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "elab-done") else 0) in (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings dtb__425)) in ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb__425)) (Elab_dTypes.v_dtProgDefs dtb__425)) (Elab_dTypes.v_dtProgGlobals dtb__425)) with
  | Base_dDiag.C_Check_ErrC (dtb__426) -> (Base_dDiag.C_Check_ErrC (dtb__426))
  | Base_dDiag.C_Check_OkC (dtb__427) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "codegen-check-done") else 0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb__425; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = warns } })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))

# 165 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckWithProgramParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)))

# 169 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryWithProgramParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (((((v_dtLoadModulesParts nFs) nEnv) nProcess) ctx) names)))

# 249 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheck = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) (fun loadedR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match loadedR with
  | Base_dDiag.C_Check_ErrC (dtb__428) -> (Base_dDiag.C_Check_ErrC (dtb__428))
  | Base_dDiag.C_Check_OkC (dtb__429) -> (let parts = (B_dData_dPair.v_secondOf dtb__429) in (let modules = (B_dData_dPair.v_secondOf parts) in (let decls = ((v_sealOpaqueDecls modules) (B_dData_dPair.v_firstOf parts)) in ((v_checkDeclsWithWarns (B_dData_dPair.v_firstOf dtb__429)) decls))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1052 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckOursParts = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let parts = (B_dData_dPair.v_secondOf resolved) in (let loaderWarns = (B_dData_dPair.v_firstOf resolved) in (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let modules = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let ours = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules) in (let depsOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules) in (let decls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) ours)) (B_dData_dPair.v_firstOf parts)) in (let termAux = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly) in (let start = (v_depStartOf deps) in ((Base_dCommon.v_bind ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) (Frontend_dRast_dBridge.v_toRastDecls termAux)) (Frontend_dRast_dBridge.v_toRastDecls decls))) (fun (prog : Elab_dTypes.t_DtProgram) -> (let allDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps)) (Elab_dTypes.v_dtProgDatas prog)) in ((Base_dCommon.v_bind (((v_checkDtProgramOf allDatas) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = prog; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf deps); f_CheckedPackage_checkedWarnings = warns } }))))))))))))))))))

# 394 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-source=check modules=" ^ (bi_strFromInt (B_dData_dList.v_length ifaces)))) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) (v_modulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__430) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__430)))
  | Base_dDiag.C_Check_OkC (dtb__431) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__431) with
  | { B_dData_dPair.f_Pair_first = dtb__432; B_dData_dPair.f_Pair_second = dtb__433 } -> (let missing = (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__433) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces)) in (let _u = (if ((B_dData_dList.v_length missing) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=check missing=" ^ ((B_dData_dString.v_join ",") missing))) else 0) else 0) in (if ((B_dData_dList.v_length missing) = 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__433)) dtb__432) with
  | Base_dDiag.C_Check_ErrC (dtb__434) -> (Base_dDiag.C_Check_ErrC (dtb__434))
  | Base_dDiag.C_Check_OkC (dtb__435) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__435)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__436) -> (Base_dDiag.C_Check_ErrC (dtb__436))
  | Base_dDiag.C_Check_OkC (dtb__437) -> (match (((v_dtCheckOursParts ctx) dtb__435) dtb__437) with
  | Base_dDiag.C_Check_ErrC (dtb__438) -> (Base_dDiag.C_Check_ErrC (dtb__438))
  | Base_dDiag.C_Check_OkC (dtb__439) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__439)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else ((((((v_dtCheckSource nFs) nEnv) nProcess) ctx) label) source))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1434 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishPackage = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (next : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let assembled = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) cleanCps)) (Elab_dTypes.v_dtProgDefs prog))); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) cleanCps)) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) } in (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)) in (let checked = { f_CheckedPackage_checkedProgram = assembled; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf depCps); f_CheckedPackage_checkedWarnings = warns } in ((Base_dCommon.v_bind (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas assembled)) (Elab_dTypes.v_dtProgDefs assembled)) (Elab_dTypes.v_dtProgGlobals assembled))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (checked)); B_dData_dPair.f_Pair_second = next }))))))))

# 1603 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceChecked = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dFlatten.v_loadModuleSource nFs) nEnv) nProcess) ctx) label) source)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__440) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__440)))
  | Base_dDiag.C_Check_OkC (dtb__441) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__441)))))
  | _ -> failwith "DT: impossible branch"
))))

# 285 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckModuleFile = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_dtCheckSourceChecked nFs) nEnv) nProcess) ctx) path) text)) (fun checked -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__442) -> (Base_dDiag.C_Check_ErrC (dtb__442))
  | Base_dDiag.C_Check_OkC (dtb__443) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__443)))
  | _ -> failwith "DT: impossible branch"
)))))))

# 1940 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPackageWithIfacesParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_dtLoadPartsWithIfaces nFs) nEnv) nProcess) ctx) entry) ifaces)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__444) -> (Base_dDiag.C_Check_ErrC (dtb__444))
  | Base_dDiag.C_Check_OkC (dtb__445) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__445)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__446) -> (Base_dDiag.C_Check_ErrC (dtb__446))
  | Base_dDiag.C_Check_OkC (dtb__447) -> (((v_dtCheckOursParts ctx) dtb__445) dtb__447)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1983 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageWithIfacesParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_dtLoadModulesPartsWithIfaces nFs) nEnv) nProcess) ctx) names) ifaces)) (fun partsR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__448) -> (Base_dDiag.C_Check_ErrC (dtb__448))
  | Base_dDiag.C_Check_OkC (dtb__449) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__449)) ifaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__450) -> (Base_dDiag.C_Check_ErrC (dtb__450))
  | Base_dDiag.C_Check_OkC (dtb__451) -> (((v_dtCheckOursParts ctx) dtb__449) dtb__451)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 65 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedProgram = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__452; f_CheckedPackage_checkedModules = dtb__453; f_CheckedPackage_checkedEntryDecls = dtb__454; f_CheckedPackage_checkedInherited = dtb__455; f_CheckedPackage_checkedWarnings = dtb__456 } -> dtb__452
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedModules = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__457; f_CheckedPackage_checkedModules = dtb__458; f_CheckedPackage_checkedEntryDecls = dtb__459; f_CheckedPackage_checkedInherited = dtb__460; f_CheckedPackage_checkedWarnings = dtb__461 } -> dtb__458
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedEntryDecls = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__462; f_CheckedPackage_checkedModules = dtb__463; f_CheckedPackage_checkedEntryDecls = dtb__464; f_CheckedPackage_checkedInherited = dtb__465; f_CheckedPackage_checkedWarnings = dtb__466 } -> dtb__464
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedInherited = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__467; f_CheckedPackage_checkedModules = dtb__468; f_CheckedPackage_checkedEntryDecls = dtb__469; f_CheckedPackage_checkedInherited = dtb__470; f_CheckedPackage_checkedWarnings = dtb__471 } -> dtb__470
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedWarnings = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__472; f_CheckedPackage_checkedModules = dtb__473; f_CheckedPackage_checkedEntryDecls = dtb__474; f_CheckedPackage_checkedInherited = dtb__475; f_CheckedPackage_checkedWarnings = dtb__476 } -> dtb__476
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Driver/Dt.vuna"
let v_genMetaId = (fun (p : t_GenMeta) -> (match p with
  | { f_GenMeta_genMetaId = dtb__477; f_GenMeta_genMetaName = dtb__478; f_GenMeta_genMetaKind = dtb__479 } -> dtb__477
  | _ -> failwith "DT: impossible branch"
))

# 579 "Vuna/Compiler/Driver/Dt.vuna"
let v_genMetaName = (fun (p : t_GenMeta) -> (match p with
  | { f_GenMeta_genMetaId = dtb__480; f_GenMeta_genMetaName = dtb__481; f_GenMeta_genMetaKind = dtb__482 } -> dtb__481
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Driver/Dt.vuna"
let v_genMetaKind = (fun (p : t_GenMeta) -> (match p with
  | { f_GenMeta_genMetaId = dtb__483; f_GenMeta_genMetaName = dtb__484; f_GenMeta_genMetaKind = dtb__485 } -> dtb__485
  | _ -> failwith "DT: impossible branch"
))

# 882 "Vuna/Compiler/Driver/Dt.vuna"
let v_miKind = (fun (p : t_MainInfo) -> (match p with
  | { f_MainInfo_miKind = dtb__486; f_MainInfo_miHostTags = dtb__487 } -> dtb__486
  | _ -> failwith "DT: impossible branch"
))

# 883 "Vuna/Compiler/Driver/Dt.vuna"
let v_miHostTags = (fun (p : t_MainInfo) -> (match p with
  | { f_MainInfo_miKind = dtb__488; f_MainInfo_miHostTags = dtb__489 } -> dtb__489
  | _ -> failwith "DT: impossible branch"
))

# 1311 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheKey = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__490; f_AuxCache_auxCacheDecls = dtb__491; f_AuxCache_auxCacheStart = dtb__492; f_AuxCache_auxCacheDepCps = dtb__493; f_AuxCache_auxCacheCleanCps = dtb__494 } -> dtb__490
  | _ -> failwith "DT: impossible branch"
))

# 1312 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheDecls = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__495; f_AuxCache_auxCacheDecls = dtb__496; f_AuxCache_auxCacheStart = dtb__497; f_AuxCache_auxCacheDepCps = dtb__498; f_AuxCache_auxCacheCleanCps = dtb__499 } -> dtb__496
  | _ -> failwith "DT: impossible branch"
))

# 1313 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheStart = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__500; f_AuxCache_auxCacheDecls = dtb__501; f_AuxCache_auxCacheStart = dtb__502; f_AuxCache_auxCacheDepCps = dtb__503; f_AuxCache_auxCacheCleanCps = dtb__504 } -> dtb__502
  | _ -> failwith "DT: impossible branch"
))

# 1314 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheDepCps = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__505; f_AuxCache_auxCacheDecls = dtb__506; f_AuxCache_auxCacheStart = dtb__507; f_AuxCache_auxCacheDepCps = dtb__508; f_AuxCache_auxCacheCleanCps = dtb__509 } -> dtb__508
  | _ -> failwith "DT: impossible branch"
))

# 1315 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheCleanCps = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__510; f_AuxCache_auxCacheDecls = dtb__511; f_AuxCache_auxCacheStart = dtb__512; f_AuxCache_auxCacheDepCps = dtb__513; f_AuxCache_auxCacheCleanCps = dtb__514 } -> dtb__514
  | _ -> failwith "DT: impossible branch"
))

# 1348 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsStartEc = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__515; f_DtIncrSetup_dsStartGlobals = dtb__516; f_DtIncrSetup_dsTermAux = dtb__517; f_DtIncrSetup_dsPrepared = dtb__518; f_DtIncrSetup_dsDecls = dtb__519; f_DtIncrSetup_dsWarns = dtb__520; f_DtIncrSetup_dsDepCps = dtb__521; f_DtIncrSetup_dsCleanCps = dtb__522; f_DtIncrSetup_dsNext = dtb__523 } -> dtb__515
  | _ -> failwith "DT: impossible branch"
))

# 1349 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsStartGlobals = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__524; f_DtIncrSetup_dsStartGlobals = dtb__525; f_DtIncrSetup_dsTermAux = dtb__526; f_DtIncrSetup_dsPrepared = dtb__527; f_DtIncrSetup_dsDecls = dtb__528; f_DtIncrSetup_dsWarns = dtb__529; f_DtIncrSetup_dsDepCps = dtb__530; f_DtIncrSetup_dsCleanCps = dtb__531; f_DtIncrSetup_dsNext = dtb__532 } -> dtb__525
  | _ -> failwith "DT: impossible branch"
))

# 1350 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsTermAux = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__533; f_DtIncrSetup_dsStartGlobals = dtb__534; f_DtIncrSetup_dsTermAux = dtb__535; f_DtIncrSetup_dsPrepared = dtb__536; f_DtIncrSetup_dsDecls = dtb__537; f_DtIncrSetup_dsWarns = dtb__538; f_DtIncrSetup_dsDepCps = dtb__539; f_DtIncrSetup_dsCleanCps = dtb__540; f_DtIncrSetup_dsNext = dtb__541 } -> dtb__535
  | _ -> failwith "DT: impossible branch"
))

# 1351 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsPrepared = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__542; f_DtIncrSetup_dsStartGlobals = dtb__543; f_DtIncrSetup_dsTermAux = dtb__544; f_DtIncrSetup_dsPrepared = dtb__545; f_DtIncrSetup_dsDecls = dtb__546; f_DtIncrSetup_dsWarns = dtb__547; f_DtIncrSetup_dsDepCps = dtb__548; f_DtIncrSetup_dsCleanCps = dtb__549; f_DtIncrSetup_dsNext = dtb__550 } -> dtb__545
  | _ -> failwith "DT: impossible branch"
))

# 1352 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsDecls = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__551; f_DtIncrSetup_dsStartGlobals = dtb__552; f_DtIncrSetup_dsTermAux = dtb__553; f_DtIncrSetup_dsPrepared = dtb__554; f_DtIncrSetup_dsDecls = dtb__555; f_DtIncrSetup_dsWarns = dtb__556; f_DtIncrSetup_dsDepCps = dtb__557; f_DtIncrSetup_dsCleanCps = dtb__558; f_DtIncrSetup_dsNext = dtb__559 } -> dtb__555
  | _ -> failwith "DT: impossible branch"
))

# 1353 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsWarns = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__560; f_DtIncrSetup_dsStartGlobals = dtb__561; f_DtIncrSetup_dsTermAux = dtb__562; f_DtIncrSetup_dsPrepared = dtb__563; f_DtIncrSetup_dsDecls = dtb__564; f_DtIncrSetup_dsWarns = dtb__565; f_DtIncrSetup_dsDepCps = dtb__566; f_DtIncrSetup_dsCleanCps = dtb__567; f_DtIncrSetup_dsNext = dtb__568 } -> dtb__565
  | _ -> failwith "DT: impossible branch"
))

# 1354 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsDepCps = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__569; f_DtIncrSetup_dsStartGlobals = dtb__570; f_DtIncrSetup_dsTermAux = dtb__571; f_DtIncrSetup_dsPrepared = dtb__572; f_DtIncrSetup_dsDecls = dtb__573; f_DtIncrSetup_dsWarns = dtb__574; f_DtIncrSetup_dsDepCps = dtb__575; f_DtIncrSetup_dsCleanCps = dtb__576; f_DtIncrSetup_dsNext = dtb__577 } -> dtb__575
  | _ -> failwith "DT: impossible branch"
))

# 1355 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsCleanCps = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__578; f_DtIncrSetup_dsStartGlobals = dtb__579; f_DtIncrSetup_dsTermAux = dtb__580; f_DtIncrSetup_dsPrepared = dtb__581; f_DtIncrSetup_dsDecls = dtb__582; f_DtIncrSetup_dsWarns = dtb__583; f_DtIncrSetup_dsDepCps = dtb__584; f_DtIncrSetup_dsCleanCps = dtb__585; f_DtIncrSetup_dsNext = dtb__586 } -> dtb__585
  | _ -> failwith "DT: impossible branch"
))

# 1356 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsNext = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__587; f_DtIncrSetup_dsStartGlobals = dtb__588; f_DtIncrSetup_dsTermAux = dtb__589; f_DtIncrSetup_dsPrepared = dtb__590; f_DtIncrSetup_dsDecls = dtb__591; f_DtIncrSetup_dsWarns = dtb__592; f_DtIncrSetup_dsDepCps = dtb__593; f_DtIncrSetup_dsCleanCps = dtb__594; f_DtIncrSetup_dsNext = dtb__595 } -> dtb__595
  | _ -> failwith "DT: impossible branch"
))
