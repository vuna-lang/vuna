open Vuna_runtime
type t_CheckedPackage = { f_CheckedPackage_checkedProgram : Elab_dTypes.t_DtProgram; f_CheckedPackage_checkedModules : Loader_dModules.t_Module B_dData_dList.t_List; f_CheckedPackage_checkedEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_CheckedPackage_checkedInherited : string B_dData_dList.t_List; f_CheckedPackage_checkedWarnings : Base_dDiag.t_Diagnostic B_dData_dList.t_List }
and t_GenMeta = { f_GenMeta_genMetaId : int; f_GenMeta_genMetaName : string; f_GenMeta_genMetaKind : Core_dTerm.t_Term }
and t_MainInfo = { f_MainInfo_miKind : string; f_MainInfo_miHostTags : string B_dData_dList.t_List }
and t_AuxCache = { f_AuxCache_auxCacheKey : string; f_AuxCache_auxCacheDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_AuxCache_auxCacheStart : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair; f_AuxCache_auxCacheDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_AuxCache_auxCacheCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List }
and t_DtIncrSetup = { f_DtIncrSetup_dsStartEc : Elab_dTypes.t_Ec; f_DtIncrSetup_dsStartGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtIncrSetup_dsTermAux : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsPrepared : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_DtIncrSetup_dsDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsNext : t_AuxCache B_dData_dMaybe.t_Maybe }

# 76 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtProjectDecls = (fun (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)))) (B_dData_dPair.v_firstOf parts)))

# 80 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoad = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "load-start") else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (let dtb__1 = Obj.obj ((k (dtb__0 u))) in (dtb__1 u)))))) (((Loader_dFlatten.v_loadProject nFs) ctx) entry)) (fun projectR -> (let x = (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__2) -> (Base_dDiag.C_Check_ErrC (dtb__2))
  | Base_dDiag.C_Check_OkC (dtb__3) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "load-modules-done") else 0) in (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__3) with
  | Base_dDiag.C_Check_ErrC (dtb__4) -> (Base_dDiag.C_Check_ErrC (dtb__4))
  | Base_dDiag.C_Check_OkC (dtb__5) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "resolve-done") else 0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__5)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf dtb__5) })))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 105 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsForCheck = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__6 = Obj.obj (e) in (let dtb__7 = Obj.obj ((k (dtb__6 u))) in (dtb__7 u)))))) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__8 = Obj.obj (e) in (let dtb__9 = Obj.obj ((k (dtb__8 u))) in (dtb__9 u)))))) (((Loader_dFlatten.v_loadProject nFs) ctx) entry)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__10) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__10)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__11) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__12 = Obj.obj (e) in (let dtb__13 = Obj.obj ((k (dtb__12 u))) in (dtb__13 u)))))) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> (let x = ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__11) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 117 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__14 = Obj.obj (e) in (let dtb__15 = Obj.obj ((k (dtb__14 u))) in (dtb__15 u)))))) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__16 = Obj.obj (e) in (let dtb__17 = Obj.obj ((k (dtb__16 u))) in (dtb__17 u)))))) (((Loader_dFlatten.v_loadProjectModules nFs) ctx) names)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__18) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__18)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__19) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__20 = Obj.obj (e) in (let dtb__21 = Obj.obj ((k (dtb__20 u))) in (dtb__21 u)))))) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> (let x = ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__19) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 238 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealSpan = { Base_dSource.f_Span_spanFile = "<seal>"; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 241 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_opaqueSigType = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | Frontend_dAst.C_Decl_DSig (dtb__24, dtb__25, dtb__26, dtb__27) -> (if (dtb__24 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__26)) else ((v_opaqueSigType mc0) dtb__23))
  | _ -> ((v_opaqueSigType mc0) dtb__23)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealDeclOf = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (name : string) -> (let ty = (match ((v_opaqueSigType name) decls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> dtb__28
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef v_sealSpan)))
  | _ -> failwith "DT: impossible branch"
) in (Frontend_dAst.C_Decl_DAxiom (("vuna_seal_" ^ name), ty, (Frontend_dAst.v_detachedNodeRef v_sealSpan)))))

# 218 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_sealAbstractAfter = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> (match dtb__29 with
  | Frontend_dAst.C_Decl_DFun (dtb__31, dtb__32, dtb__33, dtb__34) -> (if ((B_dData_dList.v_memName dtb__31) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__29, (B_dData_dList.C_List__x58__x58_ (((v_sealDeclOf (B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30))) dtb__31), ((v_sealAbstractAfter dtb__30) mc1))))) else (B_dData_dList.C_List__x58__x58_ (dtb__29, ((v_sealAbstractAfter dtb__30) mc1))))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__29, ((v_sealAbstractAfter dtb__30) mc1)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealModule = (fun (m : Loader_dModules.t_Module) -> (let decls = (Loader_dModules.v_moduleDeclsOf m) in (let names = (Loader_dModules.v_moduleOpaqueOf m) in (let abstracts = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_filter Loader_dFlatten.v_isAbstractOpaqueName) names)) in (let opaques = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_filter (fun (n : string) -> (B_dData_dBool.v_not (Loader_dFlatten.v_isAbstractOpaqueName n)))) names)) in (let body = ((v_sealAbstractAfter decls) abstracts) in ((B_dData_dList.v_append body) ((B_dData_dList.v_map (v_sealDeclOf decls)) opaques))))))))

# 205 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealOpaqueDecls = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) (B_dData_dList.v_reverse modules))) entryDecls))

# 277 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSourceHasModuleHeader = (fun (path : string) (text : string) -> (match ((Frontend_dParser.v_parseSource path) text) with
  | Base_dDiag.C_Check_ErrC (dtb__35) -> false
  | Base_dDiag.C_Check_OkC (dtb__36) -> (let nd_uscrut4 = dtb__36 in (match nd_uscrut4 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__37; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__38; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__39; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__40; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__41; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__42; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__43 } -> (match dtb__37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__44) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFileHasModuleHeader = (fun (nFs : string) (nEnv : string) (nProcess : string) (path : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__45 = Obj.obj (e) in (let dtb__46 = Obj.obj ((k (dtb__45 u))) in (dtb__46 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (let x = ((v_dtSourceHasModuleHeader path) text) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 367 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__47 = Obj.obj (e) in (let dtb__48 = Obj.obj ((k (dtb__47 u))) in (dtb__48 u)))))) ((((Loader_dFlatten.v_loadModuleSource nFs) ctx) label) source)) (fun projectR -> (let x = (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__49) -> (Base_dDiag.C_Check_ErrC (dtb__49))
  | Base_dDiag.C_Check_OkC (dtb__50) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__50) with
  | Base_dDiag.C_Check_ErrC (dtb__51) -> (Base_dDiag.C_Check_ErrC (dtb__51))
  | Base_dDiag.C_Check_OkC (dtb__52) -> (match (Elab_dDriver.v_elabProgramFull ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__52))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__52)))) with
  | Base_dDiag.C_Check_ErrC (dtb__53) -> (Base_dDiag.C_Check_ErrC (dtb__53))
  | Base_dDiag.C_Check_OkC (dtb__54) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb__52)) (Elab_dTypes.v_dtProgWarnings dtb__54))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 388 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_missingDepModules = (fun (mc0 : string) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (if (if ((Loader_dModules.v_modulePackageOf dtb__55) <> mc0) then (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb__55)) mc2)) false) else false) then (B_dData_dList.C_List__x58__x58_ ((Loader_dModules.v_moduleNameOf dtb__55), (((v_missingDepModules mc0) dtb__56) mc2))) else (((v_missingDepModules mc0) dtb__56) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_allocMetas = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Elab_dTypes.t_Ec) (mc2 : int B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match ((Elab_dTypes.v_newMeta mc0) mc1) with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> (match (((v_allocMetas mc0) dtb__60) dtb__58) with
  | { B_dData_dPair.f_Pair_first = dtb__61; B_dData_dPair.f_Pair_second = dtb__62 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__61)); B_dData_dPair.f_Pair_second = dtb__62 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_buildPi = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, dtb__63, ((v_buildPi dtb__64) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_allocTelescopes = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Elab_dTypes.t_Ec) (mc2 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__68 } -> (match (((v_allocMetas mc0) mc1) ((B_dData_dList.v_range 0) dtb__68)) with
  | { B_dData_dPair.f_Pair_first = dtb__69; B_dData_dPair.f_Pair_second = dtb__70 } -> (match (((v_allocMetas mc0) dtb__70) ((B_dData_dList.v_range 0) 1)) with
  | { B_dData_dPair.f_Pair_first = dtb__71; B_dData_dPair.f_Pair_second = dtb__72 } -> (let nd_uscrut18 = dtb__71 in (match nd_uscrut18 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (match dtb__74 with
  | B_dData_dList.C_List_Nil -> (match (((v_allocTelescopes mc0) dtb__72) dtb__66) with
  | { B_dData_dPair.f_Pair_first = dtb__75; B_dData_dPair.f_Pair_second = dtb__76 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = ((v_buildPi dtb__69) dtb__73) }, dtb__75)); B_dData_dPair.f_Pair_second = dtb__76 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__72 }
)
  | _ -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__72 }
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

# 669 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findDtDef = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (if ((Elab_dTypes.v_dtDefName dtb__77) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__77)) else ((v_findDtDef mc0) dtb__78))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 674 "Vuna/Compiler/Driver/Dt.vuna"
let v_loadReplDecls = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__79 = Obj.obj (e) in (let dtb__80 = Obj.obj ((k (dtb__79 u))) in (dtb__80 u)))))) ((((Loader_dFlatten.v_loadProjectSource nFs) ctx) "<repl>") source)) (fun projectR -> (let x = (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__81) -> (Base_dDiag.C_Check_ErrC (dtb__81))
  | Base_dDiag.C_Check_OkC (dtb__82) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__82) with
  | Base_dDiag.C_Check_ErrC (dtb__83) -> (Base_dDiag.C_Check_ErrC (dtb__83))
  | Base_dDiag.C_Check_OkC (dtb__84) -> (Base_dDiag.C_Check_OkC ((v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__84))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 688 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtBindingTypes = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__85 = Obj.obj (e) in (let dtb__86 = Obj.obj ((k (dtb__85 u))) in (dtb__86 u)))))) (((((v_loadReplDecls nFs) nEnv) nProcess) ctx) program)) (fun declsR -> (let x = (match declsR with
  | Base_dDiag.C_Check_ErrC (dtb__87) -> (Base_dDiag.C_Check_ErrC (dtb__87))
  | Base_dDiag.C_Check_OkC (dtb__88) -> (match (Elab_dDriver.v_elabProgramFull dtb__88) with
  | Base_dDiag.C_Check_ErrC (dtb__89) -> (Base_dDiag.C_Check_ErrC (dtb__89))
  | Base_dDiag.C_Check_OkC (dtb__90) -> (match (Elab_dDriver.v_ecOfProgram dtb__90) with
  | { B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = dtb__92 } -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = (Core_dTerm.v_showTypeSig (((Elab_dMeta.v_zonkTerm dtb__91) 0) (Elab_dTypes.v_dtDefType d))) })) (Elab_dTypes.v_dtProgDefs dtb__90))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 732 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_pickFreshName = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : int B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__93, dtb__94) -> (let cand = (if (dtb__93 = 0) then mc0 else (String.concat "" [mc0; "_"; (string_of_int dtb__93)])) in (if ((B_dData_dList.v_memName cand) mc1) then (((v_pickFreshName mc0) mc1) dtb__94) else cand))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 729 "Vuna/Compiler/Driver/Dt.vuna"
let v_freshMetaName = (fun (base : string) (taken : string B_dData_dList.t_List) -> (((v_pickFreshName base) taken) (B_dData_dList.C_List__x58__x58_ (0, ((B_dData_dList.v_range 1) 64)))))

# 741 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_substGenMetas = (fun (mc0 : Core_dTerm.t_Term) (mc1 : t_GenMeta B_dData_dList.t_List) (mc2 : int) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> ((((v_substGenMetas ((((Core_dTerm.v_substMetaVar (dtb__95).f_GenMeta_genMetaId) (dtb__95).f_GenMeta_genMetaName) ((mc2 + 1) - mc3)) mc0)) dtb__96) (mc2 + 1)) mc3)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 746 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_wrapGenMetas = (fun (mc0 : t_GenMeta B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (Core_dTerm.C_Term_TPi ((dtb__97).f_GenMeta_genMetaName, true, Core_dTerm.C_Rig_RigOmega, (dtb__97).f_GenMeta_genMetaKind, ((v_wrapGenMetas dtb__98) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 753 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_kindArrows = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), (v_kindArrows dtb__100)))
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
))

# 750 "Vuna/Compiler/Driver/Dt.vuna"
let v_kindOfArity = (fun (k : int) -> (v_kindArrows ((B_dData_dList.v_range 0) k)))

# 758 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_metaIdsOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TIf (dtb__101, dtb__102, dtb__103) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__101)) ((B_dData_dList.v_append (v_metaIdsOf dtb__102)) (v_metaIdsOf dtb__103)))
  | Core_dTerm.C_Term_TCase (dtb__104, dtb__105) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__104)) ((B_dData_dList.v_concatMap v_metaIdsOfAlt) dtb__105))
  | Core_dTerm.C_Term_TCon (dtb__106, dtb__107) -> (v_metaIdsOfArgs dtb__107)
  | Core_dTerm.C_Term_TApp (dtb__108, dtb__109, dtb__110) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__108)) (v_metaIdsOf dtb__109))
  | Core_dTerm.C_Term_TLam (dtb__111, dtb__112, dtb__113, dtb__114, dtb__115) -> (let tys = (let nd_uscrut6 = dtb__113 in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (match dtb__116 with
  | { B_dData_dPair.f_Pair_first = dtb__117; B_dData_dPair.f_Pair_second = dtb__118 } -> (match dtb__118 with
  | { B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = dtb__120 } -> ((B_dData_dList.v_append (v_metaIdsOfMaybe dtb__119)) (v_metaIdsOfMaybe dtb__120))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) in ((B_dData_dList.v_append tys) (v_metaIdsOf dtb__115)))
  | Core_dTerm.C_Term_TPi (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> ((B_dData_dList.v_append (v_metaIdsOf dtb__124)) (v_metaIdsOf dtb__125))
  | Core_dTerm.C_Term_TMeta (dtb__126) -> (B_dData_dList.C_List__x58__x58_ (dtb__126, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 774 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfMaybe = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> (v_metaIdsOf dtb__127)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 778 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (match dtb__128 with
  | { B_dData_dPair.f_Pair_first = dtb__130; B_dData_dPair.f_Pair_second = dtb__131 } -> ((B_dData_dList.v_append (v_metaIdsOf dtb__130)) (v_metaIdsOfArgs dtb__129))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 782 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfAlt = (fun (mc0 : Core_dTerm.t_CaseAlt) -> (match mc0 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__132; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__133; Core_dTerm.f_CaseAlt_caseAltBody = dtb__134 } -> (v_metaIdsOf dtb__134)
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_dedupInts = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (if ((Elab_dMeta.v_memMetaId dtb__135) dtb__136) then (v_dedupInts dtb__136) else (B_dData_dList.C_List__x58__x58_ (dtb__135, (v_dedupInts dtb__136))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 822 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_headIsMeta = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TMeta (dtb__137) -> (mc0 = dtb__137)
  | Core_dTerm.C_Term_TApp (dtb__138, dtb__139, dtb__140) -> ((v_headIsMeta mc0) dtb__138)
  | _ -> false
))

# 827 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_spineLen = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__141, dtb__142, dtb__143) -> (1 + (v_spineLen dtb__141))
  | _ -> 0
))

# 819 "Vuna/Compiler/Driver/Dt.vuna"
let v_applyArity = (fun (m : int) (t : Core_dTerm.t_Term) -> (if ((v_headIsMeta m) t) then (v_spineLen t) else 0))

# 831 "Vuna/Compiler/Driver/Dt.vuna"
let v_imax = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 790 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_maxMetaArity = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__144, dtb__145, dtb__146) -> ((v_imax ((v_maxMetaArity mc0) dtb__144)) ((v_imax ((v_maxMetaArity mc0) dtb__145)) ((v_maxMetaArity mc0) dtb__146)))
  | Core_dTerm.C_Term_TCase (dtb__147, dtb__148) -> ((v_imax ((v_maxMetaArity mc0) dtb__147)) ((v_maxMetaArityAlts mc0) dtb__148))
  | Core_dTerm.C_Term_TCon (dtb__149, dtb__150) -> ((v_maxMetaArityArgs mc0) dtb__150)
  | Core_dTerm.C_Term_TLam (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (let tys = (let nd_uscrut7 = dtb__153 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (match dtb__156 with
  | { B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = dtb__158 } -> (match dtb__158 with
  | { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 } -> ((v_imax ((v_maxMetaArityMaybe mc0) dtb__159)) ((v_maxMetaArityMaybe mc0) dtb__160))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
)) in ((v_imax tys) ((v_maxMetaArity mc0) dtb__155)))
  | Core_dTerm.C_Term_TPi (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> ((v_imax ((v_maxMetaArity mc0) dtb__164)) ((v_maxMetaArity mc0) dtb__165))
  | Core_dTerm.C_Term_TApp (dtb__166, dtb__167, dtb__168) -> ((v_imax ((v_applyArity mc0) (Core_dTerm.C_Term_TApp (dtb__166, dtb__167, dtb__168)))) ((v_imax ((v_maxMetaArity mc0) dtb__166)) ((v_maxMetaArity mc0) dtb__167)))
  | _ -> 0
))
# 807 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityMaybe = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> ((v_maxMetaArity mc0) dtb__169)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
# 811 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityArgs = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (match dtb__170 with
  | { B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__173 } -> ((v_imax ((v_maxMetaArity mc0) dtb__172)) ((v_maxMetaArityArgs mc0) dtb__171))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 815 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityAlts = (fun (mc0 : int) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__174, dtb__175) -> ((v_imax ((v_maxMetaArity mc0) (Core_dTerm.v_caseAltBody dtb__174))) ((v_maxMetaArityAlts mc0) dtb__175))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 721 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_buildGenMetas = (fun (mc0 : int B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (let name = ((v_freshMetaName ("t" ^ (string_of_int mc2))) mc1) in (let kind = (v_kindOfArity ((v_maxMetaArity dtb__176) mc3)) in (B_dData_dList.C_List__x58__x58_ ({ f_GenMeta_genMetaId = dtb__176; f_GenMeta_genMetaName = name; f_GenMeta_genMetaKind = kind }, ((((v_buildGenMetas dtb__177) (B_dData_dList.C_List__x58__x58_ (name, mc1))) (mc2 + 1)) mc3)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_listLen = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (1 + (v_listLen dtb__179))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 626 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findArity = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (match dtb__180 with
  | Frontend_dAst.C_Decl_DFun (dtb__182, dtb__183, dtb__184, dtb__185) -> (if (dtb__182 = mc0) then (B_dData_dMaybe.C_Maybe_Just ((v_listLen dtb__183))) else ((v_findArity mc0) dtb__181))
  | _ -> ((v_findArity mc0) dtb__181)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 618 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_aritiesOf = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__186, dtb__187) -> (match ((v_findArity dtb__186) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err (String.concat "" ["\232\135\170\229\138\168\231\173\190\229\144\141\239\188\154\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 "; dtb__186; "\239\188\136\233\156\128\232\166\129 DFun\239\188\137"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb__188) -> ((Base_dCommon.v_bind ((v_aritiesOf dtb__187) mc1)) (fun (more : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__186; B_dData_dPair.f_Pair_second = dtb__188 }, more))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 705 "Vuna/Compiler/Driver/Dt.vuna"
let v_generalizeSignature = (fun (ty : Core_dTerm.t_Term) (taken : string B_dData_dList.t_List) -> (let metas = (v_dedupInts (v_metaIdsOf ty)) in (if ((B_dData_dList.v_length metas) = 0) then (Base_dDiag.C_Check_OkC ((Core_dTerm.v_showTypeSig ty))) else (if ((B_dData_dList.v_length metas) > 8) then (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\231\154\132\231\177\187\229\158\139\229\143\130\230\149\176\232\182\133\232\191\135 8 \228\184\170\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else (let entries = ((((v_buildGenMetas metas) taken) 0) ty) in (let total = (v_listLen entries) in (let body = ((((v_substGenMetas ty) entries) 0) total) in (let sigText = (Core_dTerm.v_showTypeSig ((v_wrapGenMetas entries) body)) in (if ((B_dData_dString.v_contains "?") sigText) then (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\231\154\132\231\187\147\230\158\156\228\187\141\229\144\171\230\156\170\232\167\163\229\133\131\229\143\152\233\135\143\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else (Base_dDiag.C_Check_OkC (sigText)))))))))))

# 659 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_inferEachType = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Elab_dTypes.t_DtProgram) (mc2 : Elab_dTypes.t_Ec) (mc3 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (match ((v_findDtDef dtb__189) (Elab_dTypes.v_dtProgDefs mc1)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err ("\232\135\170\229\138\168\231\173\190\229\144\141\239\188\154\231\178\190\229\140\150\231\187\147\230\158\156\233\135\140\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 " ^ dtb__189))
  | B_dData_dMaybe.C_Maybe_Just (dtb__191) -> ((Base_dCommon.v_bind ((v_generalizeSignature (((Elab_dMeta.v_zonkTerm mc2) 0) (Elab_dTypes.v_dtDefType dtb__191))) mc3)) (fun (sigText : string) -> ((Base_dCommon.v_bind ((((v_inferEachType dtb__190) mc1) mc2) mc3)) (fun (more : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__189; B_dData_dPair.f_Pair_second = sigText }, more))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtInferDefTypes = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (targets : string B_dData_dList.t_List) (defSource : string) -> (if ((B_dData_dList.v_length targets) = 0) then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let nd_uscrut11 = ((Frontend_dParser.v_parseSource "<repl>") defSource) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__192) -> (match dtb__192 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__193; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__194; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__195; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__196; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__197; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__198; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__199 } -> (match dtb__193 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (let x = (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\228\184\141\230\148\175\230\140\129\230\168\161\229\157\151\230\150\135\228\187\182") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_aritiesOf targets) dtb__196) with
  | Base_dDiag.C_Check_ErrC (dtb__201) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__201)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__202) -> (match (((v_allocTelescopes Elab_dTypes.v_emptyCtx) Elab_dTypes.v_ecEmpty) dtb__202) with
  | { B_dData_dPair.f_Pair_first = dtb__203; B_dData_dPair.f_Pair_second = dtb__204 } -> (let startGlobals = ((B_dData_dList.v_append dtb__203) Elab_dPrelude.v_preludeGlobals) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__205 = Obj.obj (e) in (let dtb__206 = Obj.obj ((k (dtb__205 u))) in (dtb__206 u)))))) (((((v_loadReplDecls nFs) nEnv) nProcess) ctx) (String.concat "" [program; "\n"; defSource; "\n"]))) (fun allDeclsR -> (let x = (match allDeclsR with
  | Base_dDiag.C_Check_ErrC (dtb__207) -> (Base_dDiag.C_Check_ErrC (dtb__207))
  | Base_dDiag.C_Check_OkC (dtb__208) -> (match (((Elab_dDriver.v_elabProgramFullWith dtb__204) startGlobals) dtb__208) with
  | Base_dDiag.C_Check_ErrC (dtb__209) -> (Base_dDiag.C_Check_ErrC (dtb__209))
  | Base_dDiag.C_Check_OkC (dtb__210) -> (let taken = (Frontend_dAst.v_topNames dtb__208) in (match (Elab_dDriver.v_ecOfProgram dtb__210) with
  | { B_dData_dPair.f_Pair_first = dtb__211; B_dData_dPair.f_Pair_second = dtb__212 } -> ((((v_inferEachType targets) dtb__210) dtb__211) taken)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__213) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__213)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))))

# 839 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__214 = Obj.obj (e) in (let dtb__215 = Obj.obj ((k (dtb__214 u))) in (dtb__215 u)))))) ((((Loader_dFlatten.v_loadModuleSource nFs) ctx) label) source)) (fun projectR -> (let x = (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__216) -> (Base_dDiag.C_Check_ErrC (dtb__216))
  | Base_dDiag.C_Check_OkC (dtb__217) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__217) with
  | Base_dDiag.C_Check_ErrC (dtb__218) -> (Base_dDiag.C_Check_ErrC (dtb__218))
  | Base_dDiag.C_Check_OkC (dtb__219) -> (Elab_dDriver.v_goalsOfProgram (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__219)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 853 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceTolerant = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__220 = Obj.obj (e) in (let dtb__221 = Obj.obj ((k (dtb__220 u))) in (dtb__221 u)))))) ((((Loader_dFlatten.v_loadModuleSource nFs) ctx) label) source)) (fun projectR -> (let x = (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__222) -> (Base_dDiag.C_Check_ErrC (dtb__222))
  | Base_dDiag.C_Check_OkC (dtb__223) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__223) with
  | Base_dDiag.C_Check_ErrC (dtb__224) -> (Base_dDiag.C_Check_ErrC (dtb__224))
  | Base_dDiag.C_Check_OkC (dtb__225) -> (Elab_dDriver.v_goalsOfProgramTolerant (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__225)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 867 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainKindNames = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_intTypeName; B_dData_dPair.f_Pair_second = "Int" }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_natTypeName; B_dData_dPair.f_Pair_second = "Nat" }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_strTypeName; B_dData_dPair.f_Pair_second = "String" }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Base_dIntrinsics.v_boolTypeName; B_dData_dPair.f_Pair_second = "Bool" }, B_dData_dList.C_List_Nil))))))))

# 877 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_lookupMainKind = (fun (mc0 : string) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__226, dtb__227) -> (if ((B_dData_dPair.v_firstOf dtb__226) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__226))) else ((v_lookupMainKind mc0) dtb__227))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 871 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainKindForName = (fun (g : string) -> (match ((v_lookupMainKind g) v_mainKindNames) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__228) -> (Base_dDiag.C_Check_OkC (dtb__228))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ("Other"))
  | _ -> failwith "DT: impossible branch"
))

# 888 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainInfoForName = (fun (g : string) -> (match (v_mainKindForName g) with
  | Base_dDiag.C_Check_ErrC (dtb__229) -> (Base_dDiag.C_Check_ErrC (dtb__229))
  | Base_dDiag.C_Check_OkC (dtb__230) -> (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = dtb__230; f_MainInfo_miHostTags = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 943 "Vuna/Compiler/Driver/Dt.vuna"
let v_replExprName = "vuna_repl_expr"

# 947 "Vuna/Compiler/Driver/Dt.vuna"
let v_splitReplExpr = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let nd_uscrut1 = (B_dData_dList.v_reverse decls) in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (match dtb__231 with
  | Frontend_dAst.C_Decl_DFun (dtb__233, dtb__234, dtb__235, dtb__236) -> (if (dtb__233 = v_replExprName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__232); B_dData_dPair.f_Pair_second = dtb__235 })) else (Base_dDiag.v_icInternal "REPL expression definition is not last"))
  | _ -> (Base_dDiag.v_icInternal "REPL expression was not parsed as a definition")
)
  | _ -> (Base_dDiag.v_icInternal "REPL expression was not parsed as a definition")
)))

# 323 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramFull = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__237 = Obj.obj (e) in (let dtb__238 = Obj.obj ((k (dtb__237 u))) in (dtb__238 u)))))) ((((Loader_dFlatten.v_loadProjectSource nFs) ctx) "<repl>") (String.concat "" [program; "\n"; v_replExprName; " = "; exprSource; "\n"]))) (fun projectR -> (let x = (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__239) -> (Base_dDiag.C_Check_ErrC (dtb__239))
  | Base_dDiag.C_Check_OkC (dtb__240) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__240) with
  | Base_dDiag.C_Check_ErrC (dtb__241) -> (Base_dDiag.C_Check_ErrC (dtb__241))
  | Base_dDiag.C_Check_OkC (dtb__242) -> (match (v_splitReplExpr ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__242))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__242)))) with
  | Base_dDiag.C_Check_ErrC (dtb__243) -> (Base_dDiag.C_Check_ErrC (dtb__243))
  | Base_dDiag.C_Check_OkC (dtb__244) -> (match (Elab_dDriver.v_elabProgramFull (B_dData_dPair.v_firstOf dtb__244)) with
  | Base_dDiag.C_Check_ErrC (dtb__245) -> (Base_dDiag.C_Check_ErrC (dtb__245))
  | Base_dDiag.C_Check_OkC (dtb__246) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__246; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__244) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 342 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExpr = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__247 = Obj.obj (e) in (let dtb__248 = Obj.obj ((k (dtb__247 u))) in (dtb__248 u)))))) ((((((v_replProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> (let x = (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__249) -> (Base_dDiag.C_Check_ErrC (dtb__249))
  | Base_dDiag.C_Check_OkC (dtb__250) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb__250)) (B_dData_dPair.v_secondOf dtb__250))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 355 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfo = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__251 = Obj.obj (e) in (let dtb__252 = Obj.obj ((k (dtb__251 u))) in (dtb__252 u)))))) ((((((v_replProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> (let x = (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__253) -> (Base_dDiag.C_Check_ErrC (dtb__253))
  | Base_dDiag.C_Check_OkC (dtb__254) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb__254)) (B_dData_dPair.v_secondOf dtb__254))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1006 "Vuna/Compiler/Driver/Dt.vuna"
let v_stuckText = (fun (v : Core_dTerm.t_Value) -> (let s = ((Core_dEval.v_showValueAt 6) v) in (if ((String.length s) > 300) then ((((B_dData_dString.v_substring 0) 300) s) ^ "\226\128\166") else s)))

# 997 "Vuna/Compiler/Driver/Dt.vuna"
let v_interpMainShow = (fun (table : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (sols : Core_dTerm.t_Sols) (mainVal : Core_dTerm.t_Value) -> (match ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) table)) sols) Core_dEval.v_normalizeFuelBound) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_mainShowDefName, (B_dData_dList.C_List__x58__x58_ (mainVal, B_dData_dList.C_List_Nil))))))) with
  | Core_dTerm.C_Value_VStr (dtb__255) -> (Base_dDiag.C_Check_OkC (dtb__255))
  | _ -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_MainNotValue (""))) (v_stuckText mainVal))
))

# 1013 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainActionKind = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__256, dtb__257, dtb__258) -> (match dtb__256 with
  | Core_dTerm.C_Term_TApp (dtb__259, dtb__260, dtb__261) -> (match dtb__259 with
  | Core_dTerm.C_Term_TGlobal (dtb__262) -> (if (dtb__262 = Base_dIntrinsics.v_effTypeName) then "Eff" else "")
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 1021 "Vuna/Compiler/Driver/Dt.vuna"
let v_isNilRowTermDt = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__263, dtb__264) -> (match dtb__264 with
  | B_dData_dList.C_List_Nil -> (dtb__263 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
)
  | Core_dTerm.C_Term_TGlobal (dtb__265) -> (dtb__265 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 1026 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findMainDef = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (if ((Elab_dTypes.v_dtDefName dtb__266) = "main") then (B_dData_dMaybe.C_Maybe_Just (dtb__266)) else (v_findMainDef dtb__267))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1031 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_defTableOf = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__268, dtb__269) -> (match (Elab_dTypes.v_dtDefBody dtb__268) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__270) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb__268); B_dData_dPair.f_Pair_second = dtb__270 }, (v_defTableOf dtb__269)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_defTableOf dtb__269)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 924 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainInfoOfDefs = (fun (entry : string) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match (v_findMainDef defs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dCg.v_cgErr0At { Base_dSource.f_Span_spanFile = entry; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) Base_dDiagnostics_dCg.C_CgErr_NoMain)
  | B_dData_dMaybe.C_Maybe_Just (dtb__271) -> (if ((v_mainActionKind (Elab_dTypes.v_dtDefType dtb__271)) = "Eff") then (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = "Eff"; f_MainInfo_miHostTags = (Lowering_dEntry.v_mainRowTags (Elab_dTypes.v_dtDefType dtb__271)) })) else (match ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_defTableOf defs))) Core_dTerm.v_solsEmpty) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType dtb__271))) with
  | Core_dTerm.C_Value_VNeutral (dtb__272) -> (match dtb__272 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__273, dtb__274) -> (match dtb__274 with
  | B_dData_dList.C_List_Nil -> (v_mainInfoForName dtb__273)
  | _ -> (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = "Other"; f_MainInfo_miHostTags = B_dData_dList.C_List_Nil }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = "Other"; f_MainInfo_miHostTags = B_dData_dList.C_List_Nil }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = "Other"; f_MainInfo_miHostTags = B_dData_dList.C_List_Nil }))
))
  | _ -> failwith "DT: impossible branch"
))

# 911 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtMainInfo = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__275 = Obj.obj (e) in (let dtb__276 = Obj.obj ((k (dtb__275 u))) in (dtb__276 u)))))) (((((v_dtLoad nFs) nEnv) nProcess) ctx) entry)) (fun declsR -> (let x = (match declsR with
  | Base_dDiag.C_Check_ErrC (dtb__277) -> (Base_dDiag.C_Check_ErrC (dtb__277))
  | Base_dDiag.C_Check_OkC (dtb__278) -> (match (Elab_dDriver.v_elabProgram (B_dData_dPair.v_firstOf dtb__278)) with
  | Base_dDiag.C_Check_ErrC (dtb__279) -> (Base_dDiag.C_Check_ErrC (dtb__279))
  | Base_dDiag.C_Check_OkC (dtb__280) -> ((v_mainInfoOfDefs entry) (B_dData_dPair.v_secondOf dtb__280))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 900 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtMainKind = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__281 = Obj.obj (e) in (let dtb__282 = Obj.obj ((k (dtb__281 u))) in (dtb__282 u)))))) (((((v_dtMainInfo nFs) nEnv) nProcess) ctx) entry)) (fun infoR -> (let x = (match infoR with
  | Base_dDiag.C_Check_ErrC (dtb__283) -> (Base_dDiag.C_Check_ErrC (dtb__283))
  | Base_dDiag.C_Check_OkC (dtb__284) -> (Base_dDiag.C_Check_OkC ((dtb__284).f_MainInfo_miKind))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 970 "Vuna/Compiler/Driver/Dt.vuna"
let v_evalDtMainCore = (fun (program : Elab_dTypes.t_DtProgram) -> (match (v_findMainDef (Elab_dTypes.v_dtProgDefs program)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain)
  | B_dData_dMaybe.C_Maybe_Just (dtb__285) -> (let table = (v_defTableOf (Elab_dTypes.v_dtProgDefs program)) in (let sols = Core_dTerm.v_solsEmpty in (let mainVal = ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) table)) sols) Core_dEval.v_normalizeFuelBound) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("main", B_dData_dList.C_List_Nil))))) in (if (B_dData_dBool.v_not ((v_mainActionKind (Elab_dTypes.v_dtDefType dtb__285)) = "")) then (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_InterpCannotExecuteEffects) else (match mainVal with
  | Core_dTerm.C_Value_VInt (dtb__286) -> (Base_dDiag.C_Check_OkC ((string_of_int dtb__286)))
  | Core_dTerm.C_Value_VStr (dtb__287) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue mainVal)))
  | Core_dTerm.C_Value_VBool (dtb__288) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue mainVal)))
  | Core_dTerm.C_Value_VFloat (dtb__289) -> (Base_dDiag.C_Check_OkC (dtb__289))
  | Core_dTerm.C_Value_VCon (dtb__290, dtb__291) -> (match (Core_dEval.v_natValueToInt mainVal) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__292) -> (Base_dDiag.C_Check_OkC ((string_of_int dtb__292)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_interpMainShow table) sols) mainVal)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_interpMainShow table) sols) mainVal)
)))))
  | _ -> failwith "DT: impossible branch"
))

# 959 "Vuna/Compiler/Driver/Dt.vuna"
let v_evalDtMain = (fun (program : Elab_dTypes.t_DtProgram) -> (v_evalDtMainCore program))

# 299 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalFile = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__293 = Obj.obj (e) in (let dtb__294 = Obj.obj ((k (dtb__293 u))) in (dtb__294 u)))))) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) (fun partsR -> (let x = (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__295) -> (Base_dDiag.C_Check_ErrC (dtb__295))
  | Base_dDiag.C_Check_OkC (dtb__296) -> (let parts = (B_dData_dPair.v_secondOf dtb__296) in (let decls = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf parts)) (B_dData_dPair.v_firstOf parts)) in ((Base_dCommon.v_bind (Elab_dDriver.v_elabProgramFull decls)) v_evalDtMain)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1042 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry))

# 1051 "Vuna/Compiler/Driver/Dt.vuna"
let v_cachedNamesOne = (fun (cp : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Driver_dCache.v_cachedDatas cp))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors d)))) (Driver_dCache.v_cachedDatas cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Driver_dCache.v_cachedDefs cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Driver_dCache.v_cachedGlobals cp))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstSym) (Driver_dCache.v_cachedInsts cp))) ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Driver_dCache.v_cachedClasses cp))))))))

# 1048 "Vuna/Compiler/Driver/Dt.vuna"
let v_cachedNamesOf = (fun (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_cachedNamesOne) progs))

# 1120 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_maxMetaList = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__297, dtb__298) -> ((v_maxMetaList (if (dtb__297 > mc0) then dtb__297 else mc0)) dtb__298)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1124 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaDef = (fun (m : int) (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> ((v_maxMetaList m) (Elab_dMeta.v_termMetasAll dtb__299))
  | B_dData_dMaybe.C_Maybe_Nothing -> m
  | _ -> failwith "DT: impossible branch"
))

# 1130 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaCached = (fun (m : int) (cp : Driver_dCache.t_CachedProgram) -> (((B_dData_dList.v_foldl v_maxMetaDef) m) (Driver_dCache.v_cachedDefs cp)))

# 1133 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaCps = (fun (cps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_maxMetaCached) (0 - 1)) cps))

# 1136 "Vuna/Compiler/Driver/Dt.vuna"
let v_cleanStartNext = (fun (cps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let m = (v_maxMetaCps cps) in (if (m < 0) then 0 else (m + 1))))

# 1149 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupKeepLastGo = (fun mc0 mc1 (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) mc3 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__300, dtb__301) -> (let k = (mc0 dtb__300) in (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) k) mc2) then ((((v_dedupKeepLastGo mc0) dtb__301) mc2) mc3) else ((((v_dedupKeepLastGo mc0) dtb__301) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) k) true) mc2)) (B_dData_dList.C_List__x58__x58_ (dtb__300, mc3)))))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1146 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupKeepLast = (fun key xs -> ((((v_dedupKeepLastGo key) (B_dData_dList.v_reverse xs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 1164 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDefs = (fun (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtDefName) ds))

# 1167 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_bodyPairs = (fun (mc0 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__302, dtb__303) -> (match (Elab_dTypes.v_dtDefBody dtb__302) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb__302); B_dData_dPair.f_Pair_second = dtb__304 }, (v_bodyPairs dtb__303)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_bodyPairs dtb__303)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1161 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDefBodies = (fun (ds : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (v_bodyPairs (v_dedupDefs ds)))

# 1174 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDatas = (fun (ds : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtDataName) ds))

# 1177 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupInsts = (fun (ds : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtInstKey) ds))

# 1180 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupClasses = (fun (ds : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtClassName) ds))

# 1183 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupGlobals = (fun (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_dedupKeepLast (fun (g : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf g))) gs))

# 1091 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOfAt = (fun (next : int) (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let datas = (v_dedupDatas ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) progs)) in (let dataKeys = ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas)) ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors d)))) datas)) in (let defGlobals = ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf p)) dataKeys)) false))) (v_dedupGlobals ((B_dData_dList.v_append Elab_dPrelude.v_preludeGlobals) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) progs)))) in (let globals = ((B_dData_dList.v_append defGlobals) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDataKind d) })) datas)) in (let opaqueNames = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedOpaqueOf) progs)) in (let bodies = ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf p)) opaqueNames)))) (v_dedupDefBodies ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) progs))) in (let ec0 = Elab_dTypes.v_ecEmpty in (let ec1 = ((Elab_dDriver.v_addDatasEc ec0) datas) in (let ec2 = ((Elab_dDriver.v_addInstsEc ec1) (v_dedupInsts ((B_dData_dList.v_concatMap Driver_dCache.v_cachedInsts) progs))) in (let ec3 = ((Elab_dDriver.v_addClassesEc ec2) (v_dedupClasses ((B_dData_dList.v_concatMap Driver_dCache.v_cachedClasses) progs))) in (let ec4 = ((Elab_dTypes.v_ecPutNext ec3) next) in (let ec5 = ((Elab_dTypes.v_ecPutGlobalsTbl ec4) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) globals)) in (let ec6 = ((Elab_dTypes.v_ecPutDefTbl ec5) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) bodies)) in { B_dData_dPair.f_Pair_first = ec6; B_dData_dPair.f_Pair_second = globals }))))))))))))))

# 1116 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOf = (fun (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((v_depStartOfAt 0) progs))

# 1213 "Vuna/Compiler/Driver/Dt.vuna"
let v_sortNames = (B_dData_dSort.v_sortBy (fun (a : string) (b : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) a) b)))

# 1221 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupSortedGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__305, dtb__306) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> ((v_dedupSortedGo dtb__306) (B_dData_dList.C_List__x58__x58_ (dtb__305, mc1)))
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (if (dtb__305 = dtb__307) then ((v_dedupSortedGo dtb__306) mc1) else ((v_dedupSortedGo dtb__306) (B_dData_dList.C_List__x58__x58_ (dtb__305, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1218 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupSortedNames = (fun (xs : string B_dData_dList.t_List) -> (B_dData_dList.v_reverse ((v_dedupSortedGo xs) B_dData_dList.C_List_Nil)))

# 1228 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_nameSlotTbl = (fun (mc0 : string B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__309, dtb__310) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__309; B_dData_dPair.f_Pair_second = mc1 }, ((v_nameSlotTbl dtb__310) (mc1 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1232 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_shiftedDepProgramsGo = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312) -> (match ((B_dData_dList.v_lookupPair (Driver_dIface.v_miNameOf dtb__311)) mc0) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("iface: dependency module missing from shift table: " ^ (Driver_dIface.v_miNameOf dtb__311)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__313) -> ((Base_dCommon.v_bind ((Driver_dCache.v_shiftCachedProgram ((dtb__313 + 1) * Driver_dCache.v_summaryMetaSegment)) (Driver_dIface.v_miCachedOf dtb__311))) (fun (cp : Driver_dCache.t_CachedProgram) -> ((Base_dCommon.v_bind ((v_shiftedDepProgramsGo mc0) dtb__312)) (fun (rest2 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (cp, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1202 "Vuna/Compiler/Driver/Dt.vuna"
let v_shiftedDepPrograms = (fun (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let names = (v_dedupSortedNames (v_sortNames ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces))) in (if ((B_dData_dList.v_length names) <> (B_dData_dList.v_length ifaces)) then (Base_dDiag.v_icInternal "iface: duplicate dependency module name") else ((v_shiftedDepProgramsGo ((v_nameSlotTbl names) 0)) ifaces))))

# 1277 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtPrepareTermAux = (fun (aux : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls aux)) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings (B_dData_dPair.v_secondOf p))) (fun (ds : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (ds)))))))

# 1288 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_dtAuxForTermination = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__314, dtb__315) -> (match dtb__314 with
  | Frontend_dAst.C_Decl_DFun (dtb__316, dtb__317, dtb__318, dtb__319) -> (match (Elab_dTermination_dMeasure.v_projectionOfDef { B_dData_dPair.f_Pair_first = dtb__316; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (fun (x : Frontend_dAst.t_Pat) -> x)) dtb__317); B_dData_dPair.f_Pair_second = dtb__318 }, B_dData_dList.C_List_Nil)) }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__320) -> (B_dData_dList.C_List__x58__x58_ (dtb__314, (v_dtAuxForTermination dtb__315)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_dtAuxForTermination dtb__315)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__314, (v_dtAuxForTermination dtb__315)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1301 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtElabFullWithPrepared = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (termAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (preparedAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dRecords.v_prepareDeclsWith termAux) ((Elab_dDriver.v_maybeAddHasFieldInstances startGlobals) decls))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__321; B_dData_dPair.f_Pair_second = dtb__322 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb__322)) (fun (ds2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((((Elab_dDriver.v_elabProgramGoWithAux startEc) startGlobals) dtb__321) (v_dtAuxForTermination preparedAux)) ds2)))
  | _ -> failwith "DT: impossible branch"
))))

# 1323 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxKeyOne = (fun (m : Driver_dIface.t_ModuleIface) -> (String.concat "" [(Driver_dIface.v_miNameOf m); ":"; (Driver_dIface.v_miIfaceHashOf m)]))

# 1326 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtAuxKey = (fun (pkg : string) (deps : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (clean : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (string_of_int (Driver_dIface.v_hashTextStrong (String.concat "" ["aux|"; pkg; "|"; ((B_dData_dString.v_join ";") ((B_dData_dList.v_map v_auxKeyOne) deps)); "|"; ((B_dData_dString.v_join ";") ((B_dData_dList.v_map v_auxKeyOne) clean))]))))

# 1331 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtAuxOfCache = (fun (mc0 : string) (mc1 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__323) -> (if ((dtb__323).f_AuxCache_auxCacheKey = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__323)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Driver/Dt.vuna"
let v_replCheckPartsAux = (fun (start : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) (pkgName : string) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let modules = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let depsOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules) in (let oursOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules) in (let termAux = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly) in (let ownDecls = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) oursOnly) in (let sourceDecls = ((B_dData_dList.v_append ownDecls) (B_dData_dPair.v_firstOf parts)) in (let key = (((v_dtAuxKey pkgName) ifaces) B_dData_dList.C_List_Nil) in (let cacheable = ((B_dData_dList.v_length ifaces) > 0) in (let cachedDecls = (if cacheable then ((v_dtAuxOfCache key) cache) else B_dData_dMaybe.C_Maybe_Nothing) in (let prepared = (match cachedDecls with
  | B_dData_dMaybe.C_Maybe_Just (dtb__324) -> (Base_dDiag.C_Check_OkC ((dtb__324).f_AuxCache_auxCacheDecls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_dtPrepareTermAux termAux)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind prepared) (fun (preparedAux : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_splitReplExpr sourceDecls)) (fun (p : (Frontend_dAst.t_Decl B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((((v_dtElabFullWithPrepared (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) termAux) preparedAux) (B_dData_dPair.v_firstOf p))) (fun (prog : Elab_dTypes.t_DtProgram) -> (let depDatas = ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps) in (let depDefs = ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) deps) in (let depGlobals = ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) deps) in (let assembled = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append depDatas) (Elab_dTypes.v_dtProgDatas prog)); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append depDefs) (Elab_dTypes.v_dtProgDefs prog)); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append depGlobals) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) } in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = assembled; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) }; B_dData_dPair.f_Pair_second = (if cacheable then (B_dData_dMaybe.C_Maybe_Just ({ f_AuxCache_auxCacheKey = key; f_AuxCache_auxCacheDecls = preparedAux; f_AuxCache_auxCacheStart = { B_dData_dPair.f_Pair_first = Elab_dTypes.v_ecEmpty; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; f_AuxCache_auxCacheDepCps = B_dData_dList.C_List_Nil; f_AuxCache_auxCacheCleanCps = B_dData_dList.C_List_Nil })) else B_dData_dMaybe.C_Maybe_Nothing) })))))))))))))))))))))))

# 433 "Vuna/Compiler/Driver/Dt.vuna"
let v_replCheckParts = (fun (start : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) (pkgName : string) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((((v_replCheckPartsAux start) pkgName) deps) parts) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing)) (fun (r : ((Elab_dTypes.t_DtProgram, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf r))))))

# 1364 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalSetup = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let parts = (B_dData_dPair.v_secondOf resolved) in (let loaderWarns = (B_dData_dPair.v_firstOf resolved) in (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let modules = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let ours = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules) in (let depsOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules) in (let cleanNames = (Driver_dIface.v_moduleNamesOf cleanIfaces) in (let dirtyOurs = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf m)) cleanNames)) false))) ours) in (let decls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) dirtyOurs)) (B_dData_dPair.v_firstOf parts)) in (let _u = ((Base_dObs.v_obsCounter "vuna.elab.incr.clean") (B_dData_dList.v_length cleanIfaces)) in (let _u = ((Base_dObs.v_obsCounter "vuna.elab.incr.dirty") (B_dData_dList.v_length dirtyOurs)) in (let _u = ((Base_dObs.v_obsCounter "vuna.elab.incr.decls") (B_dData_dList.v_length decls)) in (let termAux = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly)) ((B_dData_dList.v_concatMap Driver_dIface.v_miDeclsOf) cleanIfaces)) in (let key = (((v_dtAuxKey pkgName) depIfaces) cleanIfaces) in (let cacheable = ((bi_natAdd (B_dData_dList.v_length depIfaces) (B_dData_dList.v_length cleanIfaces)) > 0) in (let hit = (if cacheable then ((v_dtAuxOfCache key) cache) else B_dData_dMaybe.C_Maybe_Nothing) in (let depCpsR = (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__328) -> (Base_dDiag.C_Check_OkC ((dtb__328).f_AuxCache_auxCacheDepCps))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_shiftedDepPrograms depIfaces)
  | _ -> failwith "DT: impossible branch"
) in (let ifacePrepared = ((B_dData_dList.v_concatMap Driver_dIface.v_miPreparedOf) ((B_dData_dList.v_append depIfaces) cleanIfaces)) in (let missingPrepared = ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_length (Driver_dIface.v_miPreparedOf mi)) = 0))) ((B_dData_dList.v_append depIfaces) cleanIfaces)) in ((Base_dCommon.v_bind depCpsR) (fun (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let cleanCps = (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__327) -> (dtb__327).f_AuxCache_auxCacheCleanCps
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_map Driver_dIface.v_miCachedOf) cleanIfaces)
  | _ -> failwith "DT: impossible branch"
) in (let start = (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__326) -> (dtb__326).f_AuxCache_auxCacheStart
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_depStartOfAt (v_cleanStartNext cleanCps)) ((B_dData_dList.v_append depCps) cleanCps))
  | _ -> failwith "DT: impossible branch"
) in (let prepared = (match hit with
  | B_dData_dMaybe.C_Maybe_Just (dtb__325) -> (Base_dDiag.C_Check_OkC ((dtb__325).f_AuxCache_auxCacheDecls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((B_dData_dList.v_length ifacePrepared) > 0) then ((B_dData_dList.v_length missingPrepared) = 0) else false) then (Base_dDiag.C_Check_OkC (ifacePrepared)) else (v_dtPrepareTermAux termAux))
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind prepared) (fun (preparedAux : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let next = (if cacheable then (B_dData_dMaybe.C_Maybe_Just ({ f_AuxCache_auxCacheKey = key; f_AuxCache_auxCacheDecls = preparedAux; f_AuxCache_auxCacheStart = start; f_AuxCache_auxCacheDepCps = depCps; f_AuxCache_auxCacheCleanCps = cleanCps })) else B_dData_dMaybe.C_Maybe_Nothing) in (Base_dDiag.C_Check_OkC ({ f_DtIncrSetup_dsStartEc = (B_dData_dPair.v_firstOf start); f_DtIncrSetup_dsStartGlobals = (B_dData_dPair.v_secondOf start); f_DtIncrSetup_dsTermAux = termAux; f_DtIncrSetup_dsPrepared = preparedAux; f_DtIncrSetup_dsDecls = decls; f_DtIncrSetup_dsWarns = loaderWarns; f_DtIncrSetup_dsDepCps = depCps; f_DtIncrSetup_dsCleanCps = cleanCps; f_DtIncrSetup_dsNext = next }))))))))))))))))))))))))))))))

# 1441 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsIncrementalCore = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.lsp.goals.setup") (fun (_u : int) -> (((((v_dtIncrementalSetup ctx) resolved) depIfaces) cleanIfaces) cache)))) (fun (s : t_DtIncrSetup) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.lsp.goals.elab") (fun (_u : int) -> ((((Elab_dDriver.v_elabGoalsWithPrepared (s).f_DtIncrSetup_dsStartEc) (s).f_DtIncrSetup_dsStartGlobals) (s).f_DtIncrSetup_dsTermAux) (s).f_DtIncrSetup_dsDecls)))) (fun (gs : Elab_dDriver.t_DtGoalInfo B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = gs; B_dData_dPair.f_Pair_second = (s).f_DtIncrSetup_dsNext })))))))

# 1521 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckScoped = (fun (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (unitDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((Lowering_dEnv.v_mkLwEnv allDatas) defs) globals) "")) (fun (env : Lowering_dEnv.t_LwEnv) -> ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.lower") (fun (_u : int) -> (((Lowering_dProgram.v_lowerUnitOf env) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) defs)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) unitDatas))))) (fun (unitIr : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.gen") (fun (_u : int) -> ((Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts (Lowering_dEnv.v_lwEnvShared env)) unitIr)))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (0)))))))))))

# 1476 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishPackageScoped = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (next : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let assembled = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) cleanCps)) (Elab_dTypes.v_dtProgDefs prog))); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) cleanCps)) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) } in (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)) in (let checked = { f_CheckedPackage_checkedProgram = assembled; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf depCps); f_CheckedPackage_checkedWarnings = warns } in (let allDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))) in ((Base_dCommon.v_bind ((((v_dtCheckScoped allDatas) (Elab_dTypes.v_dtProgDatas prog)) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (checked)); B_dData_dPair.f_Pair_second = next })))))))))

# 1502 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishScoped = (fun (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let allDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))) in (let newDatas = (Elab_dTypes.v_dtProgDatas prog) in (let newDefs = (Elab_dTypes.v_dtProgDefs prog) in ((Base_dCommon.v_bind ((((v_dtCheckScoped allDatas) newDatas) newDefs) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = cache }))))))))

# 1655 "Vuna/Compiler/Driver/Dt.vuna"
let v_findModuleNameField = (fun (i : Frontend_dAst.t_Import) -> (i).Frontend_dAst.f_Import_importName)

# 1658 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findModuleNamed = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__329, dtb__330) -> (if ((Loader_dModules.v_moduleNameOf dtb__329) = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__329)) else ((v_findModuleNamed dtb__330) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1663 "Vuna/Compiler/Driver/Dt.vuna"
let v_topoDepsOf = (fun (mods : Loader_dModules.t_Module B_dData_dList.t_List) (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_filter (fun (n : string) -> (match ((v_findModuleNamed mods) n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__331) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf))))

# 1673 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_topoVisit = (fun (fuel : int) (mods : Loader_dModules.t_Module B_dData_dList.t_List) (name : string) (visited : string B_dData_dList.t_List) (acc : Loader_dModules.t_Module B_dData_dList.t_List) -> (if (fuel <= 0) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = acc } else (if ((B_dData_dList.v_memName name) visited) then { B_dData_dPair.f_Pair_first = visited; B_dData_dPair.f_Pair_second = acc } else (match ((v_findModuleNamed mods) name) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, visited)); B_dData_dPair.f_Pair_second = acc }
  | B_dData_dMaybe.C_Maybe_Just (dtb__332) -> (let step = (((((v_topoVisitAll (fuel - 1)) mods) ((v_topoDepsOf mods) dtb__332)) (B_dData_dList.C_List__x58__x58_ (name, visited))) acc) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf step); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf step)) (B_dData_dList.C_List__x58__x58_ (dtb__332, B_dData_dList.C_List_Nil))) })
  | _ -> failwith "DT: impossible branch"
))))
# 1687 "Vuna/Compiler/Driver/Dt.vuna"
and v_topoVisitAll = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) (mc4 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__333, dtb__334) -> (let step = (((((v_topoVisit mc0) mc1) dtb__333) mc3) mc4) in (((((v_topoVisitAll mc0) mc1) dtb__334) (B_dData_dPair.v_firstOf step)) (B_dData_dPair.v_secondOf step)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = mc3; B_dData_dPair.f_Pair_second = mc4 }
  | _ -> failwith "DT: impossible branch"
))

# 1698 "Vuna/Compiler/Driver/Dt.vuna"
let v_moduleOrderLess = (fun (a : Loader_dModules.t_Module) (b : Loader_dModules.t_Module) -> (let ka = (Base_dHash.v_contentKey (Loader_dModules.v_moduleNameOf a)) in (let kb = (Base_dHash.v_contentKey (Loader_dModules.v_moduleNameOf b)) in (if (ka <> kb) then (ka < kb) else ((Loader_dModules.v_moduleNameOf a) <= (Loader_dModules.v_moduleNameOf b))))))

# 1705 "Vuna/Compiler/Driver/Dt.vuna"
let v_topoModules = (fun (mods : Loader_dModules.t_Module B_dData_dList.t_List) -> (let sorted = ((B_dData_dSort.v_sortBy v_moduleOrderLess) mods) in (B_dData_dPair.v_secondOf (((((v_topoVisitAll ((B_dData_dList.v_length sorted) + 1)) sorted) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) sorted)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))))

# 1713 "Vuna/Compiler/Driver/Dt.vuna"
let v_splitGenerate = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (moduleParts : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let roots = ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) (Frontend_dPackages_dPkg.v_contextRoots ctx)) in (let cdir = (Frontend_dPackages_dPkg.v_contextDir ctx) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "cg-generate-start") else 0) in (((((((Driver_dSplitGen.v_generateDtSplitProgram moduleParts) entryDecls) prog) printResult) roots) cdir) extraDefLocs)))))

# 1721 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGenerateIncremental = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (checked : t_CheckedPackage) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let modules = (v_topoModules (B_dData_dPair.v_secondOf parts)) in (let moduleParts = ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__335 = Obj.obj (e) in (let dtb__336 = Obj.obj ((k (dtb__335 u))) in (dtb__336 u)))))) ((((((((((v_splitGenerate nFs) nConsole) nEnv) nProcess) ctx) moduleParts) (B_dData_dPair.v_firstOf parts)) (checked).f_CheckedPackage_checkedProgram) printResult) extraDefLocs)) (fun filesR -> (let x = (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__337) -> (Base_dDiag.C_Check_ErrC (dtb__337))
  | Base_dDiag.C_Check_OkC (dtb__338) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = checked }))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 1753 "Vuna/Compiler/Driver/Dt.vuna"
let v_moduleOfIface = (fun (mi : Driver_dIface.t_ModuleIface) -> { Loader_dModules.f_Module_moduleNameOf = (Driver_dIface.v_miNameOf mi); Loader_dModules.f_Module_modulePackageOf = (Driver_dIface.v_miPackageOf mi); Loader_dModules.f_Module_moduleImportsOf = (Driver_dIface.v_miImportsOf mi); Loader_dModules.f_Module_moduleImplicitImportsOf = (Driver_dIface.v_miImplicitImportsOf mi); Loader_dModules.f_Module_moduleDeclsOf = (Driver_dIface.v_miDeclsOf mi); Loader_dModules.f_Module_moduleExportsOf = (Driver_dIface.v_miExportsOf mi); Loader_dModules.f_Module_moduleFixitiesOf = (Driver_dIface.v_miFixitiesOf mi); Loader_dModules.f_Module_moduleReexportsOf = B_dData_dList.C_List_Nil; Loader_dModules.f_Module_moduleOpaqueOf = (Driver_dCache.v_cachedOpaqueOf (Driver_dIface.v_miCachedOf mi)); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf (Driver_dIface.v_miExportsOf mi)); Loader_dModules.f_Module_moduleFixFactsOf = Frontend_dCst.v_emptyFixityFacts })

# 1242 "Vuna/Compiler/Driver/Dt.vuna"
let v_modulesOfIfaces = (fun (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) ifaces)))

# 1773 "Vuna/Compiler/Driver/Dt.vuna"
let v_importsOfModuleNames = (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (m).Loader_dModules.f_Module_moduleImportsOf) (m).Loader_dModules.f_Module_moduleImplicitImportsOf)))

# 1782 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_importsEdgeCount = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__339, dtb__340) -> ((B_dData_dList.v_length (v_importsOfModuleNames dtb__339)) + (v_importsEdgeCount dtb__340))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1779 "Vuna/Compiler/Driver/Dt.vuna"
let v_closureFuel = (fun (mods : Loader_dModules.t_Module B_dData_dList.t_List) (starts : string B_dData_dList.t_List) -> ((((B_dData_dList.v_length starts) + (B_dData_dList.v_length mods)) + (v_importsEdgeCount mods)) + 1))

# 1786 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_closureGo = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__341, dtb__342) -> (if (mc0 <= 0) then mc2 else (if ((B_dData_dList.v_memName dtb__341) mc2) then ((((v_closureGo mc0) mc1) mc2) dtb__342) else (match ((v_findModuleNamed mc1) dtb__341) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_closureGo (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__341, mc2))) dtb__342)
  | B_dData_dMaybe.C_Maybe_Just (dtb__343) -> ((((v_closureGo (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__341, mc2))) ((B_dData_dList.v_append dtb__342) (v_importsOfModuleNames dtb__343)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 1798 "Vuna/Compiler/Driver/Dt.vuna"
let v_filterProjectToImports = (fun (mc0 : string) (mc1 : Loader_dModules.t_Project) -> (match mc1 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb__344; Loader_dModules.f_Project_projectEntryImports = dtb__345; Loader_dModules.f_Project_projectImplicitImports = dtb__346; Loader_dModules.f_Project_projectModules = dtb__347; Loader_dModules.f_Project_projectEntryPkg = dtb__348; Loader_dModules.f_Project_projectEntryFixities = dtb__349; Loader_dModules.f_Project_projectEntryName = dtb__350; Loader_dModules.f_Project_projectEntryFacts = dtb__351 } -> (let entryStarts = ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append dtb__345) dtb__346)) in (let ownNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = mc0))) dtb__347)) in (let starts = ((B_dData_dList.v_append entryStarts) ownNames) in (let closed = ((((v_closureGo ((v_closureFuel dtb__347) starts)) dtb__347) B_dData_dList.C_List_Nil) starts) in (let kept = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf m)) closed))) dtb__347) in { B_dData_dPair.f_Pair_first = { Loader_dModules.f_Project_projectEntryDecls = dtb__344; Loader_dModules.f_Project_projectEntryImports = dtb__345; Loader_dModules.f_Project_projectImplicitImports = dtb__346; Loader_dModules.f_Project_projectModules = kept; Loader_dModules.f_Project_projectEntryPkg = dtb__348; Loader_dModules.f_Project_projectEntryFixities = dtb__349; Loader_dModules.f_Project_projectEntryName = dtb__350; Loader_dModules.f_Project_projectEntryFacts = dtb__351 }; B_dData_dPair.f_Pair_second = kept })))))
  | _ -> failwith "DT: impossible branch"
))

# 1808 "Vuna/Compiler/Driver/Dt.vuna"
let v_preloadKeepOf = (fun (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (mods : Loader_dModules.t_Module B_dData_dList.t_List) -> ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) mods)))) ifaces)))

# 1252 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let preloaded = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let allIfaces = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__352 = Obj.obj (e) in (let dtb__353 = Obj.obj ((k (dtb__352 u))) in (dtb__353 u)))))) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__354 = Obj.obj (e) in (let dtb__355 = Obj.obj ((k (dtb__354 u))) in (dtb__355 u)))))) ((((Loader_dFlatten.v_loadProjectWithPreloaded nFs) ctx) entry) preloaded)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__356) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__356)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__357) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__357) with
  | { B_dData_dPair.f_Pair_first = dtb__358; B_dData_dPair.f_Pair_second = dtb__359 } -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__360 = Obj.obj (e) in (let dtb__361 = Obj.obj ((k (dtb__360 u))) in (dtb__361 u)))))) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> (let x = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__359)) dtb__358) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 1812 "Vuna/Compiler/Driver/Dt.vuna"
let v_materializedDeps = (fun (pkg : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let depNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkg))) (B_dData_dPair.v_secondOf parts))) in ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) depNames))) ifaces)))

# 485 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfacesAux = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-source=repl modules=" ^ (string_of_int (B_dData_dList.v_length ifaces)))) else 0) in (let src = (String.concat "" [program; "\n"; v_replExprName; " = "; exprSource; "\n"]) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__362 = Obj.obj (e) in (let dtb__363 = Obj.obj ((k (dtb__362 u))) in (dtb__363 u)))))) (((((Loader_dFlatten.v_loadProjectSourceWithPreloaded nFs) ctx) "<repl>") src) (v_modulesOfIfaces ifaces))) (fun loaded -> (match loaded with
  | Base_dDiag.C_Check_ErrC (dtb__364) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__364)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__365) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__365) with
  | { B_dData_dPair.f_Pair_first = dtb__366; B_dData_dPair.f_Pair_second = dtb__367 } -> (let missing = (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__367) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces)) in (let _u = (if ((B_dData_dList.v_length missing) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=repl missing=" ^ ((B_dData_dString.v_join ",") missing))) else 0) else 0) in (if ((B_dData_dList.v_length missing) = 0) then (let x = (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__367)) dtb__366) with
  | Base_dDiag.C_Check_ErrC (dtb__368) -> (Base_dDiag.C_Check_ErrC (dtb__368))
  | Base_dDiag.C_Check_OkC (dtb__369) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__369)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb__370) -> (Base_dDiag.C_Check_ErrC (dtb__370))
  | Base_dDiag.C_Check_OkC (dtb__371) -> (let parts = (B_dData_dPair.v_secondOf dtb__369) in ((((((v_replCheckPartsAux (v_depStartOf dtb__371)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__371) parts) ifaces) cache))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__372 = Obj.obj (e) in (let dtb__373 = Obj.obj ((k (dtb__372 u))) in (dtb__373 u)))))) ((((((v_replProgramFull nFs) nEnv) nProcess) ctx) program) exprSource)) (fun pR -> (let x = (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__374) -> (Base_dDiag.C_Check_ErrC (dtb__374))
  | Base_dDiag.C_Check_OkC (dtb__375) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__375; B_dData_dPair.f_Pair_second = cache }))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 474 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__376 = Obj.obj (e) in (let dtb__377 = Obj.obj ((k (dtb__376 u))) in (dtb__377 u)))))) ((((((((((v_replProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) B_dData_dMaybe.C_Maybe_Nothing)) (fun r -> (let x = (match r with
  | Base_dDiag.C_Check_ErrC (dtb__378) -> (Base_dDiag.C_Check_ErrC (dtb__378))
  | Base_dDiag.C_Check_OkC (dtb__379) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__379)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 522 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithAuxCache = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__380 = Obj.obj (e) in (let dtb__381 = Obj.obj ((k (dtb__380 u))) in (dtb__381 u)))))) ((((((((((v_replProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache)) (fun pR -> (let x = (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__382) -> (Base_dDiag.C_Check_ErrC (dtb__382))
  | Base_dDiag.C_Check_OkC (dtb__383) -> (match ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__383))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__383))) with
  | Base_dDiag.C_Check_ErrC (dtb__384) -> (Base_dDiag.C_Check_ErrC (dtb__384))
  | Base_dDiag.C_Check_OkC (dtb__385) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__385; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__383) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 535 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithAuxCache = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__386 = Obj.obj (e) in (let dtb__387 = Obj.obj ((k (dtb__386 u))) in (dtb__387 u)))))) ((((((((((v_replProgramWithIfacesAux nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache)) (fun pR -> (let x = (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__388) -> (Base_dDiag.C_Check_ErrC (dtb__388))
  | Base_dDiag.C_Check_OkC (dtb__389) -> (match ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__389))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__389))) with
  | Base_dDiag.C_Check_ErrC (dtb__390) -> (Base_dDiag.C_Check_ErrC (dtb__390))
  | Base_dDiag.C_Check_OkC (dtb__391) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__391; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__389) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 548 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__392 = Obj.obj (e) in (let dtb__393 = Obj.obj ((k (dtb__392 u))) in (dtb__393 u)))))) (((((((((v_replProgramWithIfaces nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces)) (fun pR -> (let x = (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__394) -> (Base_dDiag.C_Check_ErrC (dtb__394))
  | Base_dDiag.C_Check_OkC (dtb__395) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb__395)) (B_dData_dPair.v_secondOf dtb__395))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 558 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__396 = Obj.obj (e) in (let dtb__397 = Obj.obj ((k (dtb__396 u))) in (dtb__397 u)))))) (((((((((v_replProgramWithIfaces nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces)) (fun pR -> (let x = (match pR with
  | Base_dDiag.C_Check_ErrC (dtb__398) -> (Base_dDiag.C_Check_ErrC (dtb__398))
  | Base_dDiag.C_Check_OkC (dtb__399) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb__399)) (B_dData_dPair.v_secondOf dtb__399))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1818 "Vuna/Compiler/Driver/Dt.vuna"
let v_materializedOwn = (fun (pkg : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let ourNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkg))) (B_dData_dPair.v_secondOf parts))) in ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) ourNames))) ifaces)))

# 1576 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let preloaded = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let allIfaces = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__400 = Obj.obj (e) in (let dtb__401 = Obj.obj ((k (dtb__400 u))) in (dtb__401 u)))))) (((((Loader_dFlatten.v_loadModuleSourceWithPreloaded nFs) ctx) label) source) preloaded)) (fun projectR -> (let x = (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__402) -> (Base_dDiag.C_Check_ErrC (dtb__402))
  | Base_dDiag.C_Check_OkC (dtb__403) -> (match ((v_filterProjectToImports pkgName) dtb__403) with
  | { B_dData_dPair.f_Pair_first = dtb__404; B_dData_dPair.f_Pair_second = dtb__405 } -> (let missing = (((v_missingDepModules pkgName) dtb__405) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) allIfaces)) in (let _u = (if ((B_dData_dList.v_length missing) > 0) then (Base_dObs.v_obsMark "vuna.lsp.goals.fallback") else 0) in (if ((B_dData_dList.v_length missing) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = cache } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__405)) dtb__404) with
  | Base_dDiag.C_Check_ErrC (dtb__406) -> (Base_dDiag.C_Check_ErrC (dtb__406))
  | Base_dDiag.C_Check_OkC (dtb__407) -> (match (((((v_dtGoalsIncrementalCore ctx) dtb__407) (((v_materializedDeps pkgName) (B_dData_dPair.v_secondOf dtb__407)) depIfaces)) (((v_materializedOwn pkgName) (B_dData_dPair.v_secondOf dtb__407)) cleanIfaces)) cache) with
  | Base_dDiag.C_Check_ErrC (dtb__408) -> (Base_dDiag.C_Check_ErrC (dtb__408))
  | Base_dDiag.C_Check_OkC (dtb__409) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__409 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 1825 "Vuna/Compiler/Driver/Dt.vuna"
let v_isPureTestKind = (fun (kind : string) -> (if (if (if (kind = "String") then true else (kind = "Int")) then true else (kind = "Nat")) then true else (kind = "Bool")))

# 1828 "Vuna/Compiler/Driver/Dt.vuna"
let v_maybeIfaces = (fun (mm : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe B_dData_dList.C_List_Nil) mm))

# 1832 "Vuna/Compiler/Driver/Dt.vuna"
let v_testEntryOutcome = (fun (entry : string) (prog : Elab_dTypes.t_DtProgram) -> (match ((v_mainInfoOfDefs entry) (Elab_dTypes.v_dtProgDefs prog)) with
  | Base_dDiag.C_Check_ErrC (dtb__410) -> (Base_dDiag.C_Check_ErrC (dtb__410))
  | Base_dDiag.C_Check_OkC (dtb__411) -> (if (v_isPureTestKind (dtb__411).f_MainInfo_miKind) then (match (v_evalDtMain prog) with
  | Base_dDiag.C_Check_ErrC (dtb__412) -> (Base_dDiag.C_Check_ErrC (dtb__412))
  | Base_dDiag.C_Check_OkC (dtb__413) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__411).f_MainInfo_miKind; B_dData_dPair.f_Pair_second = dtb__413 }))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__411).f_MainInfo_miKind; B_dData_dPair.f_Pair_second = "" })))
  | _ -> failwith "DT: impossible branch"
))

# 1845 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalTestEntryFull = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__414 = Obj.obj (e) in (let dtb__415 = Obj.obj ((k (dtb__414 u))) in (dtb__415 u)))))) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) (fun partsR -> (let x = (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__416) -> (Base_dDiag.C_Check_ErrC (dtb__416))
  | Base_dDiag.C_Check_OkC (dtb__417) -> (let parts = (B_dData_dPair.v_secondOf dtb__417) in (let decls = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf parts)) (B_dData_dPair.v_firstOf parts)) in ((Base_dCommon.v_bind (Elab_dDriver.v_elabProgramFull decls)) (fun (prog : Elab_dTypes.t_DtProgram) -> ((v_testEntryOutcome entry) prog)))))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1886 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__418 = Obj.obj (e) in (let dtb__419 = Obj.obj ((k (dtb__418 u))) in (dtb__419 u)))))) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__420 = Obj.obj (e) in (let dtb__421 = Obj.obj ((k (dtb__420 u))) in (dtb__421 u)))))) ((((Loader_dFlatten.v_loadProjectWithPreloaded nFs) ctx) entry) (v_modulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__422) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__422)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__423) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__423) with
  | { B_dData_dPair.f_Pair_first = dtb__424; B_dData_dPair.f_Pair_second = dtb__425 } -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__426 = Obj.obj (e) in (let dtb__427 = Obj.obj ((k (dtb__426 u))) in (dtb__427 u)))))) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> (let x = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__425)) dtb__424) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1900 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__428 = Obj.obj (e) in (let dtb__429 = Obj.obj ((k (dtb__428 u))) in (dtb__429 u)))))) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__430 = Obj.obj (e) in (let dtb__431 = Obj.obj ((k (dtb__430 u))) in (dtb__431 u)))))) ((((Loader_dFlatten.v_loadProjectModulesWithPreloaded nFs) ctx) names) (v_modulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__432) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__432)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__433) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__433) with
  | { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__435 } -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__436 = Obj.obj (e) in (let dtb__437 = Obj.obj ((k (dtb__436 u))) in (dtb__437 u)))))) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> (let x = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__435)) dtb__434) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1927 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let preloaded = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let allIfaces = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__438 = Obj.obj (e) in (let dtb__439 = Obj.obj ((k (dtb__438 u))) in (dtb__439 u)))))) (Base_dObs.v_obsMarkEff "vuna.load")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__440 = Obj.obj (e) in (let dtb__441 = Obj.obj ((k (dtb__440 u))) in (dtb__441 u)))))) ((((Loader_dFlatten.v_loadProjectModulesWithPreloaded nFs) ctx) names) preloaded)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__442) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__442)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__443) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__443) with
  | { B_dData_dPair.f_Pair_first = dtb__444; B_dData_dPair.f_Pair_second = dtb__445 } -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__446 = Obj.obj (e) in (let dtb__447 = Obj.obj ((k (dtb__446 u))) in (dtb__447 u)))))) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> (let x = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__445)) dtb__444) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 1992 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOursWith = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let modules = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let ours = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules) in (let depsOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules) in (let allDecls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) ours)) (B_dData_dPair.v_firstOf parts)) in (let termAux = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly) in (let start = (v_depStartOf deps) in (match ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) termAux) allDecls) with
  | Base_dDiag.C_Check_ErrC (dtb__448) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__448)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__449) -> (let assembled = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps)) (Elab_dTypes.v_dtProgDatas dtb__449)); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) deps)) (Elab_dTypes.v_dtProgDefs dtb__449)); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals dtb__449); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols dtb__449); Elab_dTypes.f_DtProgram_dtProgGlobals = (Elab_dTypes.v_dtProgGlobals dtb__449); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts dtb__449); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses dtb__449); Elab_dTypes.f_DtProgram_dtProgNext = (dtb__449).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (dtb__449).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings dtb__449) } in (let moduleParts = ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules) in (let checked = { f_CheckedPackage_checkedProgram = dtb__449; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf deps); f_CheckedPackage_checkedWarnings = (Elab_dTypes.v_dtProgWarnings dtb__449) } in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__450 = Obj.obj (e) in (let dtb__451 = Obj.obj ((k (dtb__450 u))) in (dtb__451 u)))))) ((((((((((v_splitGenerate nFs) nConsole) nEnv) nProcess) ctx) moduleParts) (B_dData_dPair.v_firstOf parts)) assembled) printResult) extraDefLocs)) (fun filesR -> (let x = (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__452) -> (Base_dDiag.C_Check_ErrC (dtb__452))
  | Base_dDiag.C_Check_OkC (dtb__453) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__453; B_dData_dPair.f_Pair_second = checked }))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1973 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectWithIfaces = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__454 = Obj.obj (e) in (let dtb__455 = Obj.obj ((k (dtb__454 u))) in (dtb__455 u)))))) (Base_dObs.v_obsMarkEff "vuna.codegen.split")) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__456 = Obj.obj (e) in (let dtb__457 = Obj.obj ((k (dtb__456 u))) in (dtb__457 u)))))) ((((((v_dtLoadPartsWithIfaces nFs) nEnv) nProcess) ctx) entry) ifaces)) (fun partsR -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__458 = Obj.obj (e) in (let dtb__459 = Obj.obj ((k (dtb__458 u))) in (dtb__459 u)))))) (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__460) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__460)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__461) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__461)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb__462) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__462)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__463) -> ((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) (B_dData_dPair.v_secondOf dtb__461)) dtb__463) printResult) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (fun r -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__464 = Obj.obj (e) in (let dtb__465 = Obj.obj ((k (dtb__464 u))) in (dtb__465 u)))))) (Base_dObs.v_obsMarkEff "vuna.codegen.split")) (fun _u -> (let x = r in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))

# 1988 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOurs = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (printResult : bool) -> ((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) parts) deps) printResult) B_dData_dList.C_List_Nil))

# 2036 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectParts = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__466 = Obj.obj (e) in (let dtb__467 = Obj.obj ((k (dtb__466 u))) in (dtb__467 u)))))) (((((v_dtLoadParts nFs) nEnv) nProcess) ctx) entry)) (fun partsR -> (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__468) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__468)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__469) -> (let parts = (B_dData_dPair.v_secondOf dtb__469) in (let loaderWarns = (B_dData_dPair.v_firstOf dtb__469) in (let modules = (v_topoModules (B_dData_dPair.v_secondOf parts)) in (let allDecls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) modules)) (B_dData_dPair.v_firstOf parts)) in (match (Elab_dDriver.v_elabProgramFull allDecls) with
  | Base_dDiag.C_Check_ErrC (dtb__470) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__470)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__471) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__472 = Obj.obj (e) in (let dtb__473 = Obj.obj ((k (dtb__472 u))) in (dtb__473 u)))))) ((((((((((v_splitGenerate nFs) nConsole) nEnv) nProcess) ctx) ((B_dData_dList.v_map (fun (m : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf m); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf m) })) modules)) (B_dData_dPair.v_firstOf parts)) dtb__471) printResult) B_dData_dList.C_List_Nil)) (fun filesR -> (let x = (match filesR with
  | Base_dDiag.C_Check_ErrC (dtb__474) -> (Base_dDiag.C_Check_ErrC (dtb__474))
  | Base_dDiag.C_Check_OkC (dtb__475) -> (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings dtb__471)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__475; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb__471; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = warns } })))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 2088 "Vuna/Compiler/Driver/Dt.vuna"
let v_maybeTermGlobals = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__476) -> (Core_dTerm.v_termGlobalNames dtb__476)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2084 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtDefGlobalNames = (fun (d : Elab_dTypes.t_DtDef) -> ((B_dData_dList.v_append (v_maybeTermGlobals (Elab_dTypes.v_dtDefBody d))) (Core_dTerm.v_termGlobalNames (Elab_dTypes.v_dtDefType d))))

# 2097 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_warnUnusedDefsTbl = (fun (mc0 : (string) -> bool) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__477, dtb__478) -> (let name = (Elab_dTypes.v_dtDefName dtb__477) in (let skip = (if (if (if (mc0 name) then true else ((Base_dSource.v_lastSeg name) = "main")) then true else ((B_dData_dString.v_startsWith "_") name)) then true else ((B_dData_dString.v_startsWith "$") name)) in (if skip then (((v_warnUnusedDefsTbl mc0) dtb__478) mc2) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) mc2) then (((v_warnUnusedDefsTbl mc0) dtb__478) mc2) else (match (Elab_dTypes.v_dtDefSpan dtb__477) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__479) -> (B_dData_dList.C_List__x58__x58_ (((((Base_dDiagnostics_dWarning.v_warnDiagAtMod (fun (x : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = (String.concat "" ["remove unused definition `"; name; "`"]); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = dtb__479; Base_dDiag.f_DiagEdit_editNewText = "" }, B_dData_dList.C_List_Nil)) }) x))) dtb__479) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedDefinition (name))) (B_dData_dVec.C_Vec__x58__x58_ (name, B_dData_dVec.C_Vec_Nil))), (((v_warnUnusedDefsTbl mc0) dtb__478) mc2)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_warnUnusedDefsTbl mc0) dtb__478) mc2)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2076 "Vuna/Compiler/Driver/Dt.vuna"
let v_warnUnusedDefsKeeping = (fun (keep : (string) -> bool) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let used = ((B_dData_dList.v_concatMap v_dtDefGlobalNames) defs) in (((v_warnUnusedDefsTbl keep) defs) (B_dContainer_dHashMap.v_ofNames used))))

# 2071 "Vuna/Compiler/Driver/Dt.vuna"
let v_warnUnusedDefsIn = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_warnUnusedDefsKeeping (fun (_u : string) -> false)) defs))

# 1435 "Vuna/Compiler/Driver/Dt.vuna"
let v_incrementalUnusedWarns = (fun (mc0 : string B_dData_dMaybe.t_Maybe) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__480) -> ((B_dData_dList.v_filter (fun (d : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_diagFileOf d) = dtb__480))) (v_warnUnusedDefsIn mc1))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1419 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalCheckedCore = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) (unusedFile : string B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((((v_dtIncrementalSetup ctx) resolved) depIfaces) cleanIfaces) cache)) (fun (s : t_DtIncrSetup) -> ((Base_dCommon.v_bind (((((v_dtElabFullWithPrepared (s).f_DtIncrSetup_dsStartEc) (s).f_DtIncrSetup_dsStartGlobals) (s).f_DtIncrSetup_dsTermAux) (s).f_DtIncrSetup_dsPrepared) (s).f_DtIncrSetup_dsDecls)) (fun (prog : Elab_dTypes.t_DtProgram) -> (let warns = ((B_dData_dList.v_append (s).f_DtIncrSetup_dsWarns) ((B_dData_dList.v_append (Elab_dTypes.v_dtProgWarnings prog)) ((v_incrementalUnusedWarns unusedFile) (Elab_dTypes.v_dtProgDefs prog)))) in ((Base_dCommon.v_bind (if needPackage then ((((((v_dtFinishPackageScoped (s).f_DtIncrSetup_dsWarns) (s).f_DtIncrSetup_dsDepCps) (s).f_DtIncrSetup_dsCleanCps) prog) (B_dData_dPair.v_secondOf resolved)) (s).f_DtIncrSetup_dsNext) else ((((v_dtFinishScoped (s).f_DtIncrSetup_dsDepCps) (s).f_DtIncrSetup_dsCleanCps) prog) (s).f_DtIncrSetup_dsNext))) (fun (r : (t_CheckedPackage B_dData_dMaybe.t_Maybe, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = r }))))))))))

# 1335 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalChecked = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_dtIncrementalCheckedCore ctx) resolved) depIfaces) cleanIfaces) B_dData_dMaybe.C_Maybe_Nothing) true) B_dData_dMaybe.C_Maybe_Nothing)) (fun (r : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (t_CheckedPackage B_dData_dMaybe.t_Maybe, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf r)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__481) -> (Base_dDiag.C_Check_OkC (dtb__481))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "incremental check produced no package")
  | _ -> failwith "DT: impossible branch"
))))

# 1545 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceIncrementalWith = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) (unusedFile : string B_dData_dMaybe.t_Maybe) -> (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let preloaded = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let allIfaces = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__482 = Obj.obj (e) in (let dtb__483 = Obj.obj ((k (dtb__482 u))) in (dtb__483 u)))))) (((((Loader_dFlatten.v_loadModuleSourceWithPreloaded nFs) ctx) label) source) preloaded)) (fun projectR -> (let x = (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__484) -> (Base_dDiag.C_Check_ErrC (dtb__484))
  | Base_dDiag.C_Check_OkC (dtb__485) -> (match ((v_filterProjectToImports pkgName) dtb__485) with
  | { B_dData_dPair.f_Pair_first = dtb__486; B_dData_dPair.f_Pair_second = dtb__487 } -> (let missing = (((v_missingDepModules pkgName) dtb__487) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) allIfaces)) in (let _u = (if ((B_dData_dList.v_length missing) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=check-incremental missing=" ^ ((B_dData_dString.v_join ",") missing))) else 0) else 0) in (if ((B_dData_dList.v_length missing) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = cache } } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf allIfaces) dtb__487)) dtb__486) with
  | Base_dDiag.C_Check_ErrC (dtb__488) -> (Base_dDiag.C_Check_ErrC (dtb__488))
  | Base_dDiag.C_Check_OkC (dtb__489) -> (match (((((((v_dtIncrementalCheckedCore ctx) dtb__489) (((v_materializedDeps pkgName) (B_dData_dPair.v_secondOf dtb__489)) depIfaces)) (((v_materializedOwn pkgName) (B_dData_dPair.v_secondOf dtb__489)) cleanIfaces)) cache) needPackage) unusedFile) with
  | Base_dDiag.C_Check_ErrC (dtb__490) -> (Base_dDiag.C_Check_ErrC (dtb__490))
  | Base_dDiag.C_Check_OkC (dtb__491) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb__491 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 1534 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) -> (((((((((((((v_dtCheckSourceIncrementalWith nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) cleanIfaces) cache) needPackage) B_dData_dMaybe.C_Maybe_Nothing))

# 1541 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckEntrySourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((((((((((((v_dtCheckSourceIncrementalWith nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) cleanIfaces) cache) false) (B_dData_dMaybe.C_Maybe_Just (label))))

# 1608 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__492 = Obj.obj (e) in (let dtb__493 = Obj.obj ((k (dtb__492 u))) in (dtb__493 u)))))) ((((((((((((v_dtCheckSourceIncremental nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) B_dData_dList.C_List_Nil) cache) true)) (fun rR -> (let x = (match rR with
  | Base_dDiag.C_Check_ErrC (dtb__494) -> (Base_dDiag.C_Check_ErrC (dtb__494))
  | Base_dDiag.C_Check_OkC (dtb__495) -> (match (B_dData_dPair.v_secondOf dtb__495) with
  | { B_dData_dPair.f_Pair_first = dtb__496; B_dData_dPair.f_Pair_second = dtb__497 } -> (match (B_dData_dPair.v_firstOf dtb__497) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__498) -> (match (v_evalDtMain (dtb__498).f_CheckedPackage_checkedProgram) with
  | Base_dDiag.C_Check_ErrC (dtb__499) -> (Base_dDiag.C_Check_ErrC (dtb__499))
  | Base_dDiag.C_Check_OkC (dtb__500) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__495); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__500; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__497) } }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__495); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__497) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1735 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectIncremental = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__501 = Obj.obj (e) in (let dtb__502 = Obj.obj ((k (dtb__501 u))) in (dtb__502 u)))))) (((((((v_dtLoadPartsIncremental nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__503) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__503)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__504) -> (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let parts = (B_dData_dPair.v_secondOf dtb__504) in (let cleanOwn = (((v_materializedOwn pkgName) parts) (Driver_dIface.v_restoreDefLocsSpans cleanIfaces)) in (let depsOwn = (((v_materializedDeps pkgName) parts) (Driver_dIface.v_restoreDefLocsSpans depIfaces)) in (match ((((v_dtIncrementalChecked ctx) dtb__504) depsOwn) cleanOwn) with
  | Base_dDiag.C_Check_ErrC (dtb__505) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__505)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__506) -> ((((((((((v_dtGenerateIncremental nFs) nConsole) nEnv) nProcess) ctx) entry) parts) dtb__506) printResult) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 1865 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalTestEntry = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : string) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (mc3 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__507) -> (let cleanIfaces = (v_maybeIfaces mc3) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__508 = Obj.obj (e) in (let dtb__509 = Obj.obj ((k (dtb__508 u))) in (dtb__509 u)))))) (((((((v_dtLoadPartsIncremental nFs) nEnv) nProcess) mc0) mc1) dtb__507) cleanIfaces)) (fun partsR -> (let x = (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__510) -> (Base_dDiag.C_Check_ErrC (dtb__510))
  | Base_dDiag.C_Check_OkC (dtb__511) -> (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName mc0) in (let deps = (((v_materializedDeps pkgName) (B_dData_dPair.v_secondOf dtb__511)) dtb__507) in (let clean = (((v_materializedOwn pkgName) (B_dData_dPair.v_secondOf dtb__511)) cleanIfaces) in (let nd_uscrut20 = (((((((v_dtIncrementalCheckedCore mc0) dtb__511) deps) clean) B_dData_dMaybe.C_Maybe_Nothing) true) B_dData_dMaybe.C_Maybe_Nothing) in (match nd_uscrut20 with
  | Base_dDiag.C_Check_OkC (dtb__512) -> (match dtb__512 with
  | { B_dData_dPair.f_Pair_first = dtb__513; B_dData_dPair.f_Pair_second = dtb__514 } -> (match dtb__514 with
  | { B_dData_dPair.f_Pair_first = dtb__515; B_dData_dPair.f_Pair_second = dtb__516 } -> (match dtb__515 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__517) -> ((v_testEntryOutcome mc1) (dtb__517).f_CheckedPackage_checkedProgram)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "test-entry-package")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__518) -> (Base_dDiag.C_Check_ErrC (dtb__518))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_dtEvalTestEntryFull nFs) nEnv) nProcess) mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 2116 "Vuna/Compiler/Driver/Dt.vuna"
let v_ownModuleNamesOf = (fun (pkg : string) (mods : Loader_dModules.t_Module B_dData_dList.t_List) -> ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkg))) mods)))

# 2120 "Vuna/Compiler/Driver/Dt.vuna"
let v_packageDefsOf = (fun (pkg : string) (mods : Loader_dModules.t_Module B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let own = (B_dData_dList.C_List__x58__x58_ ("", ((v_ownModuleNamesOf pkg) mods))) in ((B_dData_dList.v_filter (fun (d : Elab_dTypes.t_DtDef) -> ((B_dData_dList.v_memName (Base_dSource.v_prefixOfName (Elab_dTypes.v_dtDefName d))) own))) defs)))

# 2133 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findRootByName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__519, dtb__520) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__519) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__519)) else ((v_findRootByName mc0) dtb__520))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2127 "Vuna/Compiler/Driver/Dt.vuna"
let v_pkgExportedModulesOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) -> (match ((v_findRootByName (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (Frontend_dPackages_dPkg.v_contextRoots ctx)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__521) -> (dtb__521).Frontend_dPackages_dPkg.f_Root_rootExports
  | _ -> failwith "DT: impossible branch"
))

# 2149 "Vuna/Compiler/Driver/Dt.vuna"
let v_exportTargetName = (fun (e : Loader_dModules.t_ExportEntry) -> (e).Loader_dModules.f_ExportEntry_target)

# 2139 "Vuna/Compiler/Driver/Dt.vuna"
let v_pkgExportedNamesOf = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : Loader_dModules.t_Module B_dData_dList.t_List) -> (let publicMods = (match (v_pkgExportedModulesOf ctx) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) mods)
  | B_dData_dMaybe.C_Maybe_Just (dtb__522) -> dtb__522
  | _ -> failwith "DT: impossible branch"
) in (let entries = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleExportsOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf m)) publicMods))) mods)) in ((B_dData_dList.v_map v_exportTargetName) entries))))

# 2153 "Vuna/Compiler/Driver/Dt.vuna"
let v_addUnusedWarnsPair = (fun (f : (Loader_dModules.t_Module B_dData_dList.t_List) -> (Elab_dTypes.t_DtDef B_dData_dList.t_List) -> Base_dDiag.t_Diagnostic B_dData_dList.t_List) (p : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (let checked = (B_dData_dPair.v_secondOf p) in (let warns = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf p)) ((f (checked).f_CheckedPackage_checkedModules) (Elab_dTypes.v_dtProgDefs (checked).f_CheckedPackage_checkedProgram))) in { B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = { checked with f_CheckedPackage_checkedWarnings = warns } })))

# 2160 "Vuna/Compiler/Driver/Dt.vuna"
let v_addUnusedWarns = (fun (f : (Loader_dModules.t_Module B_dData_dList.t_List) -> (Elab_dTypes.t_DtDef B_dData_dList.t_List) -> Base_dDiag.t_Diagnostic B_dData_dList.t_List) (r : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> ((Base_dCommon.v_bind r) (fun (p : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair f) p))))))

# 2164 "Vuna/Compiler/Driver/Dt.vuna"
let v_unusedWarnsForPackage = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : Loader_dModules.t_Module B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (v_warnUnusedDefsIn (((v_packageDefsOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) mods) defs)))

# 1639 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPackageIncrementalParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__523 = Obj.obj (e) in (let dtb__524 = Obj.obj ((k (dtb__523 u))) in (dtb__524 u)))))) (((((((v_dtLoadPartsIncremental nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces)) (fun partsR -> (let x = (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__525) -> (Base_dDiag.C_Check_ErrC (dtb__525))
  | Base_dDiag.C_Check_OkC (dtb__526) -> (match ((((v_dtIncrementalChecked ctx) dtb__526) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__526)) depIfaces)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__526)) cleanIfaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__527) -> (Base_dDiag.C_Check_ErrC (dtb__527))
  | Base_dDiag.C_Check_OkC (dtb__528) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForPackage ctx)) { B_dData_dPair.f_Pair_first = (dtb__528).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb__528 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 2170 "Vuna/Compiler/Driver/Dt.vuna"
let v_unusedWarnsForLibrary = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : Loader_dModules.t_Module B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let own = (((v_packageDefsOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) mods) defs) in (let pub = ((v_pkgExportedNamesOf ctx) mods) in ((v_warnUnusedDefsKeeping (fun (n : string) -> ((B_dData_dList.v_memName n) pub))) own))))

# 1944 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageIncrementalParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__529 = Obj.obj (e) in (let dtb__530 = Obj.obj ((k (dtb__529 u))) in (dtb__530 u)))))) (((((((v_dtLoadModulesPartsIncremental nFs) nEnv) nProcess) ctx) names) depIfaces) cleanIfaces)) (fun partsR -> (let x = (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__531) -> (Base_dDiag.C_Check_ErrC (dtb__531))
  | Base_dDiag.C_Check_OkC (dtb__532) -> (match ((((v_dtIncrementalChecked ctx) dtb__532) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__532)) depIfaces)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__532)) cleanIfaces)) with
  | Base_dDiag.C_Check_ErrC (dtb__533) -> (Base_dDiag.C_Check_ErrC (dtb__533))
  | Base_dDiag.C_Check_OkC (dtb__534) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForLibrary ctx)) { B_dData_dPair.f_Pair_first = (dtb__534).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb__534 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 2181 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckRecovering = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__535 = Obj.obj (e) in (let dtb__536 = Obj.obj ((k (dtb__535 u))) in (dtb__536 u)))))) (((((v_dtLoad nFs) nEnv) nProcess) ctx) entry)) (fun declsR -> (let x = (match declsR with
  | Base_dDiag.C_Check_ErrC (dtb__537) -> (Base_dDiag.C_Check_ErrC (dtb__537))
  | Base_dDiag.C_Check_OkC (dtb__538) -> (Elab_dDriver.v_elabProgramErrors (B_dData_dPair.v_firstOf dtb__538))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 2192 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryRecovering = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__539 = Obj.obj (e) in (let dtb__540 = Obj.obj ((k (dtb__539 u))) in (dtb__540 u)))))) (((((v_dtLoadModulesParts nFs) nEnv) nProcess) ctx) names)) (fun partsR -> (let x = (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__541) -> (Base_dDiag.C_Check_ErrC (dtb__541))
  | Base_dDiag.C_Check_OkC (dtb__542) -> (Elab_dDriver.v_elabProgramErrors (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb__542)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 2204 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkDtProgramOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.lower") (fun (_u : int) -> (((Lowering_dProgram.v_lowerProgramOf datas) defs) globals)))) (fun (programIr : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.gen") (fun (_u : int) -> ((Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts (Vuna_dIr_dModel.v_irProgSharedOf programIr)) (Vuna_dIr_dModel.v_irProgUnitOf programIr))))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (0)))))))

# 141 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkDeclsWithWarns = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "decls-ready") else 0) in (match ((Base_dObs.v_obsCheck "vuna.elab") (fun (_u : int) -> (Elab_dDriver.v_elabProgramFull ((Base_dObs.v_obsPure "vuna.elab.rast") (fun (_u : int) -> decls))))) with
  | Base_dDiag.C_Check_ErrC (dtb__543) -> (Base_dDiag.C_Check_ErrC (dtb__543))
  | Base_dDiag.C_Check_OkC (dtb__544) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "elab-done") else 0) in ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb__544)) (Elab_dTypes.v_dtProgDefs dtb__544)) (Elab_dTypes.v_dtProgGlobals dtb__544)) with
  | Base_dDiag.C_Check_ErrC (dtb__545) -> (Base_dDiag.C_Check_ErrC (dtb__545))
  | Base_dDiag.C_Check_OkC (dtb__546) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "codegen-check-done") else 0) in (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append loaderWarns) ((B_dData_dList.v_append (Elab_dTypes.v_dtProgWarnings dtb__544)) (v_warnUnusedDefsIn (Elab_dTypes.v_dtProgDefs dtb__544)))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))

# 131 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckDecls = (fun (loaded : (Frontend_dAst.t_Decl B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__547 = Obj.obj (e) in (let dtb__548 = Obj.obj ((k (dtb__547 u))) in (dtb__548 u)))))) loaded) (fun loadedR -> (let x = (match loadedR with
  | Base_dDiag.C_Check_ErrC (dtb__549) -> (Base_dDiag.C_Check_ErrC (dtb__549))
  | Base_dDiag.C_Check_OkC (dtb__550) -> ((v_checkDeclsWithWarns (B_dData_dPair.v_secondOf dtb__550)) (B_dData_dPair.v_firstOf dtb__550))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 173 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPartsWithProgram = (fun (pkg : string) (loaded : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__551 = Obj.obj (e) in (let dtb__552 = Obj.obj ((k (dtb__551 u))) in (dtb__552 u)))))) loaded) (fun loadedR -> (let x = (match loadedR with
  | Base_dDiag.C_Check_ErrC (dtb__553) -> (Base_dDiag.C_Check_ErrC (dtb__553))
  | Base_dDiag.C_Check_OkC (dtb__554) -> (let parts = (B_dData_dPair.v_secondOf dtb__554) in (let loaderWarns = (B_dData_dPair.v_firstOf dtb__554) in (let decls = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf parts)) (B_dData_dPair.v_firstOf parts)) in (match ((Base_dObs.v_obsCheck "vuna.elab") (fun (_u : int) -> (Elab_dDriver.v_elabProgramFull ((Base_dObs.v_obsPure "vuna.elab.rast") (fun (_u : int) -> decls))))) with
  | Base_dDiag.C_Check_ErrC (dtb__555) -> (Base_dDiag.C_Check_ErrC (dtb__555))
  | Base_dDiag.C_Check_OkC (dtb__556) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "elab-done") else 0) in (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings dtb__556)) in ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb__556)) (Elab_dTypes.v_dtProgDefs dtb__556)) (Elab_dTypes.v_dtProgGlobals dtb__556)) with
  | Base_dDiag.C_Check_ErrC (dtb__557) -> (Base_dDiag.C_Check_ErrC (dtb__557))
  | Base_dDiag.C_Check_OkC (dtb__558) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "codegen-check-done") else 0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb__556; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = warns } })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 163 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckWithProgramParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)))

# 167 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryWithProgramParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__559 = Obj.obj (e) in (let dtb__560 = Obj.obj ((k (dtb__559 u))) in (dtb__560 u)))))) ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (((((v_dtLoadModulesParts nFs) nEnv) nProcess) ctx) names))) (fun r -> (let x = ((v_addUnusedWarns (v_unusedWarnsForLibrary ctx)) r) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 249 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheck = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__561 = Obj.obj (e) in (let dtb__562 = Obj.obj ((k (dtb__561 u))) in (dtb__562 u)))))) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) (fun loadedR -> (let x = (match loadedR with
  | Base_dDiag.C_Check_ErrC (dtb__563) -> (Base_dDiag.C_Check_ErrC (dtb__563))
  | Base_dDiag.C_Check_OkC (dtb__564) -> (let parts = (B_dData_dPair.v_secondOf dtb__564) in (let modules = (B_dData_dPair.v_secondOf parts) in (let decls = ((v_sealOpaqueDecls modules) (B_dData_dPair.v_firstOf parts)) in ((v_checkDeclsWithWarns (B_dData_dPair.v_firstOf dtb__564)) decls))))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1057 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckOursParts = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let parts = (B_dData_dPair.v_secondOf resolved) in (let loaderWarns = (B_dData_dPair.v_firstOf resolved) in (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let modules = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let ours = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules) in (let depsOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules) in (let decls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) ours)) (B_dData_dPair.v_firstOf parts)) in (let termAux = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly) in (let start = (v_depStartOf deps) in ((Base_dCommon.v_bind ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) termAux) decls)) (fun (prog : Elab_dTypes.t_DtProgram) -> (let allDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps)) (Elab_dTypes.v_dtProgDatas prog)) in ((Base_dCommon.v_bind (((v_checkDtProgramOf allDatas) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = prog; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf deps); f_CheckedPackage_checkedWarnings = warns } }))))))))))))))))))

# 396 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceWithIfaces = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-source=check modules=" ^ (string_of_int (B_dData_dList.v_length ifaces)))) else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__565 = Obj.obj (e) in (let dtb__566 = Obj.obj ((k (dtb__565 u))) in (dtb__566 u)))))) (((((Loader_dFlatten.v_loadModuleSourceWithPreloaded nFs) ctx) label) source) (v_modulesOfIfaces ifaces))) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__567) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__567)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__568) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__568) with
  | { B_dData_dPair.f_Pair_first = dtb__569; B_dData_dPair.f_Pair_second = dtb__570 } -> (let missing = (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__570) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces)) in (let _u = (if ((B_dData_dList.v_length missing) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=check missing=" ^ ((B_dData_dString.v_join ",") missing))) else 0) else 0) in (if ((B_dData_dList.v_length missing) = 0) then (let x = (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb__570)) dtb__569) with
  | Base_dDiag.C_Check_ErrC (dtb__571) -> (Base_dDiag.C_Check_ErrC (dtb__571))
  | Base_dDiag.C_Check_OkC (dtb__572) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__572)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb__573) -> (Base_dDiag.C_Check_ErrC (dtb__573))
  | Base_dDiag.C_Check_OkC (dtb__574) -> (match (((v_dtCheckOursParts ctx) dtb__572) dtb__574) with
  | Base_dDiag.C_Check_ErrC (dtb__575) -> (Base_dDiag.C_Check_ErrC (dtb__575))
  | Base_dDiag.C_Check_OkC (dtb__576) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__576)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else ((((((v_dtCheckSource nFs) nEnv) nProcess) ctx) label) source))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1448 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishPackage = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (next : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let assembled = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) cleanCps)) (Elab_dTypes.v_dtProgDefs prog))); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) cleanCps)) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) } in (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)) in (let checked = { f_CheckedPackage_checkedProgram = assembled; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf depCps); f_CheckedPackage_checkedWarnings = warns } in ((Base_dCommon.v_bind (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas assembled)) (Elab_dTypes.v_dtProgDefs assembled)) (Elab_dTypes.v_dtProgGlobals assembled))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (checked)); B_dData_dPair.f_Pair_second = next }))))))))

# 1628 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceChecked = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__577 = Obj.obj (e) in (let dtb__578 = Obj.obj ((k (dtb__577 u))) in (dtb__578 u)))))) ((((Loader_dFlatten.v_loadModuleSource nFs) ctx) label) source)) (fun projectR -> (match projectR with
  | Base_dDiag.C_Check_ErrC (dtb__579) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__579)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__580) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__581 = Obj.obj (e) in (let dtb__582 = Obj.obj ((k (dtb__581 u))) in (dtb__582 u)))))) (Base_dObs.v_obsMarkEff "vuna.resolve")) (fun _u -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (let x = ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb__580) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | _ -> failwith "DT: impossible branch"
))))

# 287 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckModuleFile = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__583 = Obj.obj (e) in (let dtb__584 = Obj.obj ((k (dtb__583 u))) in (dtb__584 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__585 = Obj.obj (e) in (let dtb__586 = Obj.obj ((k (dtb__585 u))) in (dtb__586 u)))))) ((((((v_dtCheckSourceChecked nFs) nEnv) nProcess) ctx) path) text)) (fun checked -> (let x = (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__587) -> (Base_dDiag.C_Check_ErrC (dtb__587))
  | Base_dDiag.C_Check_OkC (dtb__588) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb__588)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 1914 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPackageWithIfacesParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__589 = Obj.obj (e) in (let dtb__590 = Obj.obj ((k (dtb__589 u))) in (dtb__590 u)))))) ((((((v_dtLoadPartsWithIfaces nFs) nEnv) nProcess) ctx) entry) ifaces)) (fun partsR -> (let x = (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__591) -> (Base_dDiag.C_Check_ErrC (dtb__591))
  | Base_dDiag.C_Check_OkC (dtb__592) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__592)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb__593) -> (Base_dDiag.C_Check_ErrC (dtb__593))
  | Base_dDiag.C_Check_OkC (dtb__594) -> ((Base_dCommon.v_bind (((v_dtCheckOursParts ctx) dtb__592) dtb__594)) (fun (p : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForPackage ctx)) p)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1957 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageWithIfacesParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__595 = Obj.obj (e) in (let dtb__596 = Obj.obj ((k (dtb__595 u))) in (dtb__596 u)))))) ((((((v_dtLoadModulesPartsWithIfaces nFs) nEnv) nProcess) ctx) names) ifaces)) (fun partsR -> (let x = (match partsR with
  | Base_dDiag.C_Check_ErrC (dtb__597) -> (Base_dDiag.C_Check_ErrC (dtb__597))
  | Base_dDiag.C_Check_OkC (dtb__598) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb__598)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb__599) -> (Base_dDiag.C_Check_ErrC (dtb__599))
  | Base_dDiag.C_Check_OkC (dtb__600) -> ((Base_dCommon.v_bind (((v_dtCheckOursParts ctx) dtb__598) dtb__600)) (fun (p : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForLibrary ctx)) p)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 63 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedProgram = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__601; f_CheckedPackage_checkedModules = dtb__602; f_CheckedPackage_checkedEntryDecls = dtb__603; f_CheckedPackage_checkedInherited = dtb__604; f_CheckedPackage_checkedWarnings = dtb__605 } -> dtb__601
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedModules = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__606; f_CheckedPackage_checkedModules = dtb__607; f_CheckedPackage_checkedEntryDecls = dtb__608; f_CheckedPackage_checkedInherited = dtb__609; f_CheckedPackage_checkedWarnings = dtb__610 } -> dtb__607
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedEntryDecls = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__611; f_CheckedPackage_checkedModules = dtb__612; f_CheckedPackage_checkedEntryDecls = dtb__613; f_CheckedPackage_checkedInherited = dtb__614; f_CheckedPackage_checkedWarnings = dtb__615 } -> dtb__613
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedInherited = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__616; f_CheckedPackage_checkedModules = dtb__617; f_CheckedPackage_checkedEntryDecls = dtb__618; f_CheckedPackage_checkedInherited = dtb__619; f_CheckedPackage_checkedWarnings = dtb__620 } -> dtb__619
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedWarnings = (fun (p : t_CheckedPackage) -> (match p with
  | { f_CheckedPackage_checkedProgram = dtb__621; f_CheckedPackage_checkedModules = dtb__622; f_CheckedPackage_checkedEntryDecls = dtb__623; f_CheckedPackage_checkedInherited = dtb__624; f_CheckedPackage_checkedWarnings = dtb__625 } -> dtb__625
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Driver/Dt.vuna"
let v_genMetaId = (fun (p : t_GenMeta) -> (match p with
  | { f_GenMeta_genMetaId = dtb__626; f_GenMeta_genMetaName = dtb__627; f_GenMeta_genMetaKind = dtb__628 } -> dtb__626
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Driver/Dt.vuna"
let v_genMetaName = (fun (p : t_GenMeta) -> (match p with
  | { f_GenMeta_genMetaId = dtb__629; f_GenMeta_genMetaName = dtb__630; f_GenMeta_genMetaKind = dtb__631 } -> dtb__630
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Driver/Dt.vuna"
let v_genMetaKind = (fun (p : t_GenMeta) -> (match p with
  | { f_GenMeta_genMetaId = dtb__632; f_GenMeta_genMetaName = dtb__633; f_GenMeta_genMetaKind = dtb__634 } -> dtb__634
  | _ -> failwith "DT: impossible branch"
))

# 884 "Vuna/Compiler/Driver/Dt.vuna"
let v_miKind = (fun (p : t_MainInfo) -> (match p with
  | { f_MainInfo_miKind = dtb__635; f_MainInfo_miHostTags = dtb__636 } -> dtb__635
  | _ -> failwith "DT: impossible branch"
))

# 885 "Vuna/Compiler/Driver/Dt.vuna"
let v_miHostTags = (fun (p : t_MainInfo) -> (match p with
  | { f_MainInfo_miKind = dtb__637; f_MainInfo_miHostTags = dtb__638 } -> dtb__638
  | _ -> failwith "DT: impossible branch"
))

# 1316 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheKey = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__639; f_AuxCache_auxCacheDecls = dtb__640; f_AuxCache_auxCacheStart = dtb__641; f_AuxCache_auxCacheDepCps = dtb__642; f_AuxCache_auxCacheCleanCps = dtb__643 } -> dtb__639
  | _ -> failwith "DT: impossible branch"
))

# 1317 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheDecls = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__644; f_AuxCache_auxCacheDecls = dtb__645; f_AuxCache_auxCacheStart = dtb__646; f_AuxCache_auxCacheDepCps = dtb__647; f_AuxCache_auxCacheCleanCps = dtb__648 } -> dtb__645
  | _ -> failwith "DT: impossible branch"
))

# 1318 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheStart = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__649; f_AuxCache_auxCacheDecls = dtb__650; f_AuxCache_auxCacheStart = dtb__651; f_AuxCache_auxCacheDepCps = dtb__652; f_AuxCache_auxCacheCleanCps = dtb__653 } -> dtb__651
  | _ -> failwith "DT: impossible branch"
))

# 1319 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheDepCps = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__654; f_AuxCache_auxCacheDecls = dtb__655; f_AuxCache_auxCacheStart = dtb__656; f_AuxCache_auxCacheDepCps = dtb__657; f_AuxCache_auxCacheCleanCps = dtb__658 } -> dtb__657
  | _ -> failwith "DT: impossible branch"
))

# 1320 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheCleanCps = (fun (p : t_AuxCache) -> (match p with
  | { f_AuxCache_auxCacheKey = dtb__659; f_AuxCache_auxCacheDecls = dtb__660; f_AuxCache_auxCacheStart = dtb__661; f_AuxCache_auxCacheDepCps = dtb__662; f_AuxCache_auxCacheCleanCps = dtb__663 } -> dtb__663
  | _ -> failwith "DT: impossible branch"
))

# 1353 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsStartEc = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__664; f_DtIncrSetup_dsStartGlobals = dtb__665; f_DtIncrSetup_dsTermAux = dtb__666; f_DtIncrSetup_dsPrepared = dtb__667; f_DtIncrSetup_dsDecls = dtb__668; f_DtIncrSetup_dsWarns = dtb__669; f_DtIncrSetup_dsDepCps = dtb__670; f_DtIncrSetup_dsCleanCps = dtb__671; f_DtIncrSetup_dsNext = dtb__672 } -> dtb__664
  | _ -> failwith "DT: impossible branch"
))

# 1354 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsStartGlobals = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__673; f_DtIncrSetup_dsStartGlobals = dtb__674; f_DtIncrSetup_dsTermAux = dtb__675; f_DtIncrSetup_dsPrepared = dtb__676; f_DtIncrSetup_dsDecls = dtb__677; f_DtIncrSetup_dsWarns = dtb__678; f_DtIncrSetup_dsDepCps = dtb__679; f_DtIncrSetup_dsCleanCps = dtb__680; f_DtIncrSetup_dsNext = dtb__681 } -> dtb__674
  | _ -> failwith "DT: impossible branch"
))

# 1355 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsTermAux = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__682; f_DtIncrSetup_dsStartGlobals = dtb__683; f_DtIncrSetup_dsTermAux = dtb__684; f_DtIncrSetup_dsPrepared = dtb__685; f_DtIncrSetup_dsDecls = dtb__686; f_DtIncrSetup_dsWarns = dtb__687; f_DtIncrSetup_dsDepCps = dtb__688; f_DtIncrSetup_dsCleanCps = dtb__689; f_DtIncrSetup_dsNext = dtb__690 } -> dtb__684
  | _ -> failwith "DT: impossible branch"
))

# 1356 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsPrepared = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__691; f_DtIncrSetup_dsStartGlobals = dtb__692; f_DtIncrSetup_dsTermAux = dtb__693; f_DtIncrSetup_dsPrepared = dtb__694; f_DtIncrSetup_dsDecls = dtb__695; f_DtIncrSetup_dsWarns = dtb__696; f_DtIncrSetup_dsDepCps = dtb__697; f_DtIncrSetup_dsCleanCps = dtb__698; f_DtIncrSetup_dsNext = dtb__699 } -> dtb__694
  | _ -> failwith "DT: impossible branch"
))

# 1357 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsDecls = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__700; f_DtIncrSetup_dsStartGlobals = dtb__701; f_DtIncrSetup_dsTermAux = dtb__702; f_DtIncrSetup_dsPrepared = dtb__703; f_DtIncrSetup_dsDecls = dtb__704; f_DtIncrSetup_dsWarns = dtb__705; f_DtIncrSetup_dsDepCps = dtb__706; f_DtIncrSetup_dsCleanCps = dtb__707; f_DtIncrSetup_dsNext = dtb__708 } -> dtb__704
  | _ -> failwith "DT: impossible branch"
))

# 1358 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsWarns = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__709; f_DtIncrSetup_dsStartGlobals = dtb__710; f_DtIncrSetup_dsTermAux = dtb__711; f_DtIncrSetup_dsPrepared = dtb__712; f_DtIncrSetup_dsDecls = dtb__713; f_DtIncrSetup_dsWarns = dtb__714; f_DtIncrSetup_dsDepCps = dtb__715; f_DtIncrSetup_dsCleanCps = dtb__716; f_DtIncrSetup_dsNext = dtb__717 } -> dtb__714
  | _ -> failwith "DT: impossible branch"
))

# 1359 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsDepCps = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__718; f_DtIncrSetup_dsStartGlobals = dtb__719; f_DtIncrSetup_dsTermAux = dtb__720; f_DtIncrSetup_dsPrepared = dtb__721; f_DtIncrSetup_dsDecls = dtb__722; f_DtIncrSetup_dsWarns = dtb__723; f_DtIncrSetup_dsDepCps = dtb__724; f_DtIncrSetup_dsCleanCps = dtb__725; f_DtIncrSetup_dsNext = dtb__726 } -> dtb__724
  | _ -> failwith "DT: impossible branch"
))

# 1360 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsCleanCps = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__727; f_DtIncrSetup_dsStartGlobals = dtb__728; f_DtIncrSetup_dsTermAux = dtb__729; f_DtIncrSetup_dsPrepared = dtb__730; f_DtIncrSetup_dsDecls = dtb__731; f_DtIncrSetup_dsWarns = dtb__732; f_DtIncrSetup_dsDepCps = dtb__733; f_DtIncrSetup_dsCleanCps = dtb__734; f_DtIncrSetup_dsNext = dtb__735 } -> dtb__734
  | _ -> failwith "DT: impossible branch"
))

# 1361 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsNext = (fun (p : t_DtIncrSetup) -> (match p with
  | { f_DtIncrSetup_dsStartEc = dtb__736; f_DtIncrSetup_dsStartGlobals = dtb__737; f_DtIncrSetup_dsTermAux = dtb__738; f_DtIncrSetup_dsPrepared = dtb__739; f_DtIncrSetup_dsDecls = dtb__740; f_DtIncrSetup_dsWarns = dtb__741; f_DtIncrSetup_dsDepCps = dtb__742; f_DtIncrSetup_dsCleanCps = dtb__743; f_DtIncrSetup_dsNext = dtb__744 } -> dtb__744
  | _ -> failwith "DT: impossible branch"
))
