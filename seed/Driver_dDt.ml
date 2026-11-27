open Vuna_runtime
type t_CheckedPackage = { f_CheckedPackage_checkedProgram : Elab_dTypes.t_DtProgram; f_CheckedPackage_checkedModules : Loader_dModules.t_Module B_dData_dList.t_List; f_CheckedPackage_checkedEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_CheckedPackage_checkedInherited : string B_dData_dList.t_List; f_CheckedPackage_checkedWarnings : Base_dDiag.t_Diagnostic B_dData_dList.t_List }
and t_GenMeta = { f_GenMeta_genMetaId : int; f_GenMeta_genMetaName : string; f_GenMeta_genMetaKind : Core_dTerm.t_Term }
and t_MainInfo = { f_MainInfo_miKind : string; f_MainInfo_miHostTags : string B_dData_dList.t_List }
and t_AuxCache = { f_AuxCache_auxCacheKey : string; f_AuxCache_auxCacheDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_AuxCache_auxCacheStart : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair; f_AuxCache_auxCacheDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_AuxCache_auxCacheCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List }
and t_DtIncrSetup = { f_DtIncrSetup_dsStartEc : Elab_dTypes.t_Ec; f_DtIncrSetup_dsStartGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtIncrSetup_dsTermAux : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsPrepared : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_DtIncrSetup_dsDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsNext : t_AuxCache B_dData_dMaybe.t_Maybe }

# 76 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtProjectDecls = (fun (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)))) (B_dData_dPair.v_firstOf parts)))

# 80 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoad = (fun (dtb_u_u2 : string) (dtb_u_u3 : string) (dtb_u_u4 : string) (dtb_u_u9 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u10 : string) -> (let dtb_u_u11 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "load-start") else 0) in (Obj.repr ((fun (dtb_u_u16 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u19 = ((((Loader_dFlatten.v_loadProject_u_udirect dtb_u_u2) dtb_u_u9) dtb_u_u10) dtb_u_u16) in (let dtb_u_u21 = (match dtb_u_u19 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u23) -> (Base_dDiag.C_Check_ErrC (dtb_u_u23))
  | Base_dDiag.C_Check_OkC (dtb_u_u24) -> (let dtb_u_u25 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "load-modules-done") else 0) in (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u9)) dtb_u_u24) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u26) -> (Base_dDiag.C_Check_ErrC (dtb_u_u26))
  | Base_dDiag.C_Check_OkC (dtb_u_u27) -> (let dtb_u_u28 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "resolve-done") else 0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u27)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf dtb_u_u27) })))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u21)))))))

# 80 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoad_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u11 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "load-start") else 0) in (let dtb_u_u19 = ((((Loader_dFlatten.v_loadProject_u_udirect nFs) ctx) entry) _u_ueffTok) in (let dtb_u_u21 = (match dtb_u_u19 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u23) -> (Base_dDiag.C_Check_ErrC (dtb_u_u23))
  | Base_dDiag.C_Check_OkC (dtb_u_u24) -> (let dtb_u_u25 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "load-modules-done") else 0) in (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb_u_u24) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u26) -> (Base_dDiag.C_Check_ErrC (dtb_u_u26))
  | Base_dDiag.C_Check_OkC (dtb_u_u27) -> (let dtb_u_u28 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "resolve-done") else 0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u27)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf dtb_u_u27) })))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u21))))

# 105 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsForCheck = (fun (dtb_u_u29 : string) (dtb_u_u30 : string) (dtb_u_u31 : string) (dtb_u_u36 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u37 : string) -> (Obj.repr ((fun (dtb_u_u42 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u45 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") dtb_u_u42) in (let dtb_u_u53 = ((((Loader_dFlatten.v_loadProject_u_udirect dtb_u_u29) dtb_u_u36) dtb_u_u37) dtb_u_u42) in (match dtb_u_u53 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u54) -> (let dtb_u_u56 = (Base_dDiag.C_Check_ErrC (dtb_u_u54)) in dtb_u_u56)
  | Base_dDiag.C_Check_OkC (dtb_u_u58) -> (let dtb_u_u66 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") dtb_u_u42) in (let dtb_u_u68 = ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u36)) dtb_u_u58) in dtb_u_u68))
  | _ -> failwith "DT: impossible branch"
)))))))

# 105 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsForCheck_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u45 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") _u_ueffTok) in (let dtb_u_u53 = ((((Loader_dFlatten.v_loadProject_u_udirect nFs) ctx) entry) _u_ueffTok) in (match dtb_u_u53 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u54) -> (let dtb_u_u56 = (Base_dDiag.C_Check_ErrC (dtb_u_u54)) in dtb_u_u56)
  | Base_dDiag.C_Check_OkC (dtb_u_u58) -> (let dtb_u_u66 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") _u_ueffTok) in (let dtb_u_u68 = ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb_u_u58) in dtb_u_u68))
  | _ -> failwith "DT: impossible branch"
))))

# 117 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesParts = (fun (dtb_u_u70 : string) (dtb_u_u71 : string) (dtb_u_u72 : string) (dtb_u_u77 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u78 : string B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u83 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u86 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") dtb_u_u83) in (let dtb_u_u94 = ((((Loader_dFlatten.v_loadProjectModules_u_udirect dtb_u_u70) dtb_u_u77) dtb_u_u78) dtb_u_u83) in (match dtb_u_u94 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u95) -> (let dtb_u_u97 = (Base_dDiag.C_Check_ErrC (dtb_u_u95)) in dtb_u_u97)
  | Base_dDiag.C_Check_OkC (dtb_u_u99) -> (let dtb_u_u107 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") dtb_u_u83) in (let dtb_u_u109 = ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u77)) dtb_u_u99) in dtb_u_u109))
  | _ -> failwith "DT: impossible branch"
)))))))

# 117 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesParts_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u86 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") _u_ueffTok) in (let dtb_u_u94 = ((((Loader_dFlatten.v_loadProjectModules_u_udirect nFs) ctx) names) _u_ueffTok) in (match dtb_u_u94 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u95) -> (let dtb_u_u97 = (Base_dDiag.C_Check_ErrC (dtb_u_u95)) in dtb_u_u97)
  | Base_dDiag.C_Check_OkC (dtb_u_u99) -> (let dtb_u_u107 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") _u_ueffTok) in (let dtb_u_u109 = ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb_u_u99) in dtb_u_u109))
  | _ -> failwith "DT: impossible branch"
))))

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
let v_dtFileHasModuleHeader = (fun (dtb_u_u153 : string) (dtb_u_u154 : string) (dtb_u_u155 : string) (dtb_u_u160 : string) -> (Obj.repr ((fun (dtb_u_u165 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u168 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u153) dtb_u_u160) dtb_u_u165) in (let dtb_u_u170 = ((v_dtSourceHasModuleHeader dtb_u_u160) dtb_u_u168) in dtb_u_u170))))))

# 270 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFileHasModuleHeader_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (path : string) _u_ueffTok -> (let dtb_u_u168 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) path) _u_ueffTok) in (let dtb_u_u170 = ((v_dtSourceHasModuleHeader path) dtb_u_u168) in dtb_u_u170)))

# 367 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSource = (fun (dtb_u_u172 : string) (dtb_u_u173 : string) (dtb_u_u174 : string) (dtb_u_u179 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u180 : string) (dtb_u_u181 : string) -> (Obj.repr ((fun (dtb_u_u186 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u189 = (((((Loader_dFlatten.v_loadModuleSource_u_udirect dtb_u_u172) dtb_u_u179) dtb_u_u180) dtb_u_u181) dtb_u_u186) in (let dtb_u_u191 = (match dtb_u_u189 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u193) -> (Base_dDiag.C_Check_ErrC (dtb_u_u193))
  | Base_dDiag.C_Check_OkC (dtb_u_u194) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u179)) dtb_u_u194) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u195) -> (Base_dDiag.C_Check_ErrC (dtb_u_u195))
  | Base_dDiag.C_Check_OkC (dtb_u_u196) -> (match (Elab_dDriver.v_elabProgramFull ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u196))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u196)))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u197) -> (Base_dDiag.C_Check_ErrC (dtb_u_u197))
  | Base_dDiag.C_Check_OkC (dtb_u_u198) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb_u_u196)) (Elab_dTypes.v_dtProgWarnings dtb_u_u198))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u191))))))

# 367 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSource_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u189 = (((((Loader_dFlatten.v_loadModuleSource_u_udirect nFs) ctx) label) source) _u_ueffTok) in (let dtb_u_u191 = (match dtb_u_u189 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u193) -> (Base_dDiag.C_Check_ErrC (dtb_u_u193))
  | Base_dDiag.C_Check_OkC (dtb_u_u194) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb_u_u194) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u195) -> (Base_dDiag.C_Check_ErrC (dtb_u_u195))
  | Base_dDiag.C_Check_OkC (dtb_u_u196) -> (match (Elab_dDriver.v_elabProgramFull ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u196))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u196)))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u197) -> (Base_dDiag.C_Check_ErrC (dtb_u_u197))
  | Base_dDiag.C_Check_OkC (dtb_u_u198) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb_u_u196)) (Elab_dTypes.v_dtProgWarnings dtb_u_u198))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u191)))

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
let v_loadReplDecls = (fun (dtb_u_u237 : string) (dtb_u_u238 : string) (dtb_u_u239 : string) (dtb_u_u244 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u245 : string) -> (Obj.repr ((fun (dtb_u_u250 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u253 = (((((Loader_dFlatten.v_loadProjectSource_u_udirect dtb_u_u237) dtb_u_u244) "<repl>") dtb_u_u245) dtb_u_u250) in (let dtb_u_u255 = (match dtb_u_u253 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u257) -> (Base_dDiag.C_Check_ErrC (dtb_u_u257))
  | Base_dDiag.C_Check_OkC (dtb_u_u258) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u244)) dtb_u_u258) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u259) -> (Base_dDiag.C_Check_ErrC (dtb_u_u259))
  | Base_dDiag.C_Check_OkC (dtb_u_u260) -> (Base_dDiag.C_Check_OkC ((v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u260))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u255))))))

# 674 "Vuna/Compiler/Driver/Dt.vuna"
let v_loadReplDecls_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (source : string) _u_ueffTok -> (let dtb_u_u253 = (((((Loader_dFlatten.v_loadProjectSource_u_udirect nFs) ctx) "<repl>") source) _u_ueffTok) in (let dtb_u_u255 = (match dtb_u_u253 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u257) -> (Base_dDiag.C_Check_ErrC (dtb_u_u257))
  | Base_dDiag.C_Check_OkC (dtb_u_u258) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb_u_u258) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u259) -> (Base_dDiag.C_Check_ErrC (dtb_u_u259))
  | Base_dDiag.C_Check_OkC (dtb_u_u260) -> (Base_dDiag.C_Check_OkC ((v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u260))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u255)))

# 688 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtBindingTypes = (fun (dtb_u_u261 : string) (dtb_u_u262 : string) (dtb_u_u263 : string) (dtb_u_u268 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u269 : string) -> (Obj.repr ((fun (dtb_u_u274 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u277 = ((((((v_loadReplDecls_u_udirect dtb_u_u261) dtb_u_u262) dtb_u_u263) dtb_u_u268) dtb_u_u269) dtb_u_u274) in (let dtb_u_u279 = (match dtb_u_u277 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u281) -> (Base_dDiag.C_Check_ErrC (dtb_u_u281))
  | Base_dDiag.C_Check_OkC (dtb_u_u282) -> (match (Elab_dDriver.v_elabProgramFull dtb_u_u282) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u283) -> (Base_dDiag.C_Check_ErrC (dtb_u_u283))
  | Base_dDiag.C_Check_OkC (dtb_u_u284) -> (match (Elab_dDriver.v_ecOfProgram dtb_u_u284) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u285; B_dData_dPair.f_Pair_second = dtb_u_u286 } -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (fun (dtb_u_u287 : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u287); B_dData_dPair.f_Pair_second = (Core_dTerm.v_showTypeSig (((Elab_dMeta.v_zonkTerm dtb_u_u285) 0) (Elab_dTypes.v_dtDefType dtb_u_u287))) })) (Elab_dTypes.v_dtProgDefs dtb_u_u284))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u279))))))

# 688 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtBindingTypes_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) _u_ueffTok -> (let dtb_u_u277 = ((((((v_loadReplDecls_u_udirect nFs) nEnv) nProcess) ctx) program) _u_ueffTok) in (let dtb_u_u279 = (match dtb_u_u277 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u281) -> (Base_dDiag.C_Check_ErrC (dtb_u_u281))
  | Base_dDiag.C_Check_OkC (dtb_u_u282) -> (match (Elab_dDriver.v_elabProgramFull dtb_u_u282) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u283) -> (Base_dDiag.C_Check_ErrC (dtb_u_u283))
  | Base_dDiag.C_Check_OkC (dtb_u_u284) -> (match (Elab_dDriver.v_ecOfProgram dtb_u_u284) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u285; B_dData_dPair.f_Pair_second = dtb_u_u286 } -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (fun (dtb_u_u287 : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u287); B_dData_dPair.f_Pair_second = (Core_dTerm.v_showTypeSig (((Elab_dMeta.v_zonkTerm dtb_u_u285) 0) (Elab_dTypes.v_dtDefType dtb_u_u287))) })) (Elab_dTypes.v_dtProgDefs dtb_u_u284))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u279)))

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
let v_dtInferDefTypes = (fun (dtb_u_u451 : string) (dtb_u_u452 : string) (dtb_u_u453 : string) (dtb_u_u458 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u459 : string) (dtb_u_u460 : string B_dData_dList.t_List) (dtb_u_u461 : string) -> (if ((B_dData_dList.v_length dtb_u_u460) = 0) then (let dtb_u_u463 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u464 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u463)))) else (let dtb_u_u465 = ((Frontend_dParser.v_parseSource "<repl>") dtb_u_u461) in (match dtb_u_u465 with
  | Base_dDiag.C_Check_OkC (dtb_u_u466) -> (match dtb_u_u466 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb_u_u467; Frontend_dAst.f_SourceFile_sourceFileImports = dtb_u_u468; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb_u_u469; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb_u_u470; Frontend_dAst.f_SourceFile_sourceFileExports = dtb_u_u471; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb_u_u472; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb_u_u473 } -> (match dtb_u_u467 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u474) -> (let dtb_u_u476 = (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\228\184\141\230\148\175\230\140\129\230\168\161\229\157\151\230\150\135\228\187\182") in (Obj.repr ((fun (dtb_u_u477 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u476))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_aritiesOf dtb_u_u460) dtb_u_u470) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u478) -> (let dtb_u_u480 = (Base_dDiag.C_Check_ErrC (dtb_u_u478)) in (Obj.repr ((fun (dtb_u_u481 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u480))))
  | Base_dDiag.C_Check_OkC (dtb_u_u482) -> (match (((v_allocTelescopes Elab_dTypes.v_emptyCtx) Elab_dTypes.v_ecEmpty) dtb_u_u482) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u483; B_dData_dPair.f_Pair_second = dtb_u_u484 } -> (let dtb_u_u485 = ((B_dData_dList.v_append dtb_u_u483) Elab_dPrelude.v_preludeGlobals) in (Obj.repr ((fun (dtb_u_u490 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u493 = ((((((v_loadReplDecls_u_udirect dtb_u_u451) dtb_u_u452) dtb_u_u453) dtb_u_u458) (String.concat "" [dtb_u_u459; "\n"; dtb_u_u461; "\n"])) dtb_u_u490) in (let dtb_u_u495 = (match dtb_u_u493 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u497) -> (Base_dDiag.C_Check_ErrC (dtb_u_u497))
  | Base_dDiag.C_Check_OkC (dtb_u_u498) -> (match (((Elab_dDriver.v_elabProgramFullWith dtb_u_u484) dtb_u_u485) dtb_u_u498) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u499) -> (Base_dDiag.C_Check_ErrC (dtb_u_u499))
  | Base_dDiag.C_Check_OkC (dtb_u_u500) -> (let dtb_u_u501 = (Frontend_dAst.v_topNames dtb_u_u498) in (match (Elab_dDriver.v_ecOfProgram dtb_u_u500) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u502; B_dData_dPair.f_Pair_second = dtb_u_u503 } -> ((((v_inferEachType dtb_u_u460) dtb_u_u500) dtb_u_u502) dtb_u_u501)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u495))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u504) -> (let dtb_u_u506 = (Base_dDiag.C_Check_ErrC (dtb_u_u504)) in (Obj.repr ((fun (dtb_u_u507 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u506))))
  | _ -> failwith "DT: impossible branch"
))))

# 585 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtInferDefTypes_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (targets : string B_dData_dList.t_List) (defSource : string) _u_ueffTok -> (if ((B_dData_dList.v_length targets) = 0) then (let dtb_u_u463 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u463) else (let dtb_u_u465 = ((Frontend_dParser.v_parseSource "<repl>") defSource) in (match dtb_u_u465 with
  | Base_dDiag.C_Check_OkC (dtb_u_u466) -> (match dtb_u_u466 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb_u_u467; Frontend_dAst.f_SourceFile_sourceFileImports = dtb_u_u468; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb_u_u469; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb_u_u470; Frontend_dAst.f_SourceFile_sourceFileExports = dtb_u_u471; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb_u_u472; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb_u_u473 } -> (match dtb_u_u467 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u474) -> (let dtb_u_u476 = (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\228\184\141\230\148\175\230\140\129\230\168\161\229\157\151\230\150\135\228\187\182") in dtb_u_u476)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_aritiesOf targets) dtb_u_u470) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u478) -> (let dtb_u_u480 = (Base_dDiag.C_Check_ErrC (dtb_u_u478)) in dtb_u_u480)
  | Base_dDiag.C_Check_OkC (dtb_u_u482) -> (match (((v_allocTelescopes Elab_dTypes.v_emptyCtx) Elab_dTypes.v_ecEmpty) dtb_u_u482) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u483; B_dData_dPair.f_Pair_second = dtb_u_u484 } -> (let dtb_u_u485 = ((B_dData_dList.v_append dtb_u_u483) Elab_dPrelude.v_preludeGlobals) in (let dtb_u_u493 = ((((((v_loadReplDecls_u_udirect nFs) nEnv) nProcess) ctx) (String.concat "" [program; "\n"; defSource; "\n"])) _u_ueffTok) in (let dtb_u_u495 = (match dtb_u_u493 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u497) -> (Base_dDiag.C_Check_ErrC (dtb_u_u497))
  | Base_dDiag.C_Check_OkC (dtb_u_u498) -> (match (((Elab_dDriver.v_elabProgramFullWith dtb_u_u484) dtb_u_u485) dtb_u_u498) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u499) -> (Base_dDiag.C_Check_ErrC (dtb_u_u499))
  | Base_dDiag.C_Check_OkC (dtb_u_u500) -> (let dtb_u_u501 = (Frontend_dAst.v_topNames dtb_u_u498) in (match (Elab_dDriver.v_ecOfProgram dtb_u_u500) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u502; B_dData_dPair.f_Pair_second = dtb_u_u503 } -> ((((v_inferEachType targets) dtb_u_u500) dtb_u_u502) dtb_u_u501)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u495)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u504) -> (let dtb_u_u506 = (Base_dDiag.C_Check_ErrC (dtb_u_u504)) in dtb_u_u506)
  | _ -> failwith "DT: impossible branch"
))))

# 839 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSource = (fun (dtb_u_u508 : string) (dtb_u_u509 : string) (dtb_u_u510 : string) (dtb_u_u515 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u516 : string) (dtb_u_u517 : string) -> (Obj.repr ((fun (dtb_u_u522 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u525 = (((((Loader_dFlatten.v_loadModuleSource_u_udirect dtb_u_u508) dtb_u_u515) dtb_u_u516) dtb_u_u517) dtb_u_u522) in (let dtb_u_u527 = (match dtb_u_u525 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u529) -> (Base_dDiag.C_Check_ErrC (dtb_u_u529))
  | Base_dDiag.C_Check_OkC (dtb_u_u530) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u515)) dtb_u_u530) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u531) -> (Base_dDiag.C_Check_ErrC (dtb_u_u531))
  | Base_dDiag.C_Check_OkC (dtb_u_u532) -> (Elab_dDriver.v_goalsOfProgram (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u532)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u527))))))

# 839 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSource_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u525 = (((((Loader_dFlatten.v_loadModuleSource_u_udirect nFs) ctx) label) source) _u_ueffTok) in (let dtb_u_u527 = (match dtb_u_u525 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u529) -> (Base_dDiag.C_Check_ErrC (dtb_u_u529))
  | Base_dDiag.C_Check_OkC (dtb_u_u530) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb_u_u530) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u531) -> (Base_dDiag.C_Check_ErrC (dtb_u_u531))
  | Base_dDiag.C_Check_OkC (dtb_u_u532) -> (Elab_dDriver.v_goalsOfProgram (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u532)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u527)))

# 853 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceTolerant = (fun (dtb_u_u533 : string) (dtb_u_u534 : string) (dtb_u_u535 : string) (dtb_u_u540 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u541 : string) (dtb_u_u542 : string) -> (Obj.repr ((fun (dtb_u_u547 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u550 = (((((Loader_dFlatten.v_loadModuleSource_u_udirect dtb_u_u533) dtb_u_u540) dtb_u_u541) dtb_u_u542) dtb_u_u547) in (let dtb_u_u552 = (match dtb_u_u550 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u554) -> (Base_dDiag.C_Check_ErrC (dtb_u_u554))
  | Base_dDiag.C_Check_OkC (dtb_u_u555) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u540)) dtb_u_u555) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u556) -> (Base_dDiag.C_Check_ErrC (dtb_u_u556))
  | Base_dDiag.C_Check_OkC (dtb_u_u557) -> (Elab_dDriver.v_goalsOfProgramTolerant (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u557)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u552))))))

# 853 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceTolerant_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u550 = (((((Loader_dFlatten.v_loadModuleSource_u_udirect nFs) ctx) label) source) _u_ueffTok) in (let dtb_u_u552 = (match dtb_u_u550 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u554) -> (Base_dDiag.C_Check_ErrC (dtb_u_u554))
  | Base_dDiag.C_Check_OkC (dtb_u_u555) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb_u_u555) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u556) -> (Base_dDiag.C_Check_ErrC (dtb_u_u556))
  | Base_dDiag.C_Check_OkC (dtb_u_u557) -> (Elab_dDriver.v_goalsOfProgramTolerant (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u557)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u552)))

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
let v_replProgramFull = (fun (dtb_u_u575 : string) (dtb_u_u576 : string) (dtb_u_u577 : string) (dtb_u_u582 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u583 : string) (dtb_u_u584 : string) -> (Obj.repr ((fun (dtb_u_u589 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u592 = (((((Loader_dFlatten.v_loadProjectSource_u_udirect dtb_u_u575) dtb_u_u582) "<repl>") (String.concat "" [dtb_u_u583; "\n"; v_replExprName; " = "; dtb_u_u584; "\n"])) dtb_u_u589) in (let dtb_u_u594 = (match dtb_u_u592 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u596) -> (Base_dDiag.C_Check_ErrC (dtb_u_u596))
  | Base_dDiag.C_Check_OkC (dtb_u_u597) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u582)) dtb_u_u597) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u598) -> (Base_dDiag.C_Check_ErrC (dtb_u_u598))
  | Base_dDiag.C_Check_OkC (dtb_u_u599) -> (match (v_splitReplExpr ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u599))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u599)))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u600) -> (Base_dDiag.C_Check_ErrC (dtb_u_u600))
  | Base_dDiag.C_Check_OkC (dtb_u_u601) -> (match (Elab_dDriver.v_elabProgramFull (B_dData_dPair.v_firstOf dtb_u_u601)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u602) -> (Base_dDiag.C_Check_ErrC (dtb_u_u602))
  | Base_dDiag.C_Check_OkC (dtb_u_u603) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u603; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u601) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u594))))))

# 323 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramFull_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) _u_ueffTok -> (let dtb_u_u592 = (((((Loader_dFlatten.v_loadProjectSource_u_udirect nFs) ctx) "<repl>") (String.concat "" [program; "\n"; v_replExprName; " = "; exprSource; "\n"])) _u_ueffTok) in (let dtb_u_u594 = (match dtb_u_u592 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u596) -> (Base_dDiag.C_Check_ErrC (dtb_u_u596))
  | Base_dDiag.C_Check_OkC (dtb_u_u597) -> (match ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb_u_u597) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u598) -> (Base_dDiag.C_Check_ErrC (dtb_u_u598))
  | Base_dDiag.C_Check_OkC (dtb_u_u599) -> (match (v_splitReplExpr ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u599))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u599)))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u600) -> (Base_dDiag.C_Check_ErrC (dtb_u_u600))
  | Base_dDiag.C_Check_OkC (dtb_u_u601) -> (match (Elab_dDriver.v_elabProgramFull (B_dData_dPair.v_firstOf dtb_u_u601)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u602) -> (Base_dDiag.C_Check_ErrC (dtb_u_u602))
  | Base_dDiag.C_Check_OkC (dtb_u_u603) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u603; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u601) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u594)))

# 342 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExpr = (fun (dtb_u_u604 : string) (dtb_u_u605 : string) (dtb_u_u606 : string) (dtb_u_u611 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u612 : string) (dtb_u_u613 : string) -> (Obj.repr ((fun (dtb_u_u618 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u621 = (((((((v_replProgramFull_u_udirect dtb_u_u604) dtb_u_u605) dtb_u_u606) dtb_u_u611) dtb_u_u612) dtb_u_u613) dtb_u_u618) in (let dtb_u_u623 = (match dtb_u_u621 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u625) -> (Base_dDiag.C_Check_ErrC (dtb_u_u625))
  | Base_dDiag.C_Check_OkC (dtb_u_u626) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb_u_u626)) (B_dData_dPair.v_secondOf dtb_u_u626))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u623))))))

# 342 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExpr_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) _u_ueffTok -> (let dtb_u_u621 = (((((((v_replProgramFull_u_udirect nFs) nEnv) nProcess) ctx) program) exprSource) _u_ueffTok) in (let dtb_u_u623 = (match dtb_u_u621 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u625) -> (Base_dDiag.C_Check_ErrC (dtb_u_u625))
  | Base_dDiag.C_Check_OkC (dtb_u_u626) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb_u_u626)) (B_dData_dPair.v_secondOf dtb_u_u626))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u623)))

# 355 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfo = (fun (dtb_u_u627 : string) (dtb_u_u628 : string) (dtb_u_u629 : string) (dtb_u_u634 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u635 : string) (dtb_u_u636 : string) -> (Obj.repr ((fun (dtb_u_u641 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u644 = (((((((v_replProgramFull_u_udirect dtb_u_u627) dtb_u_u628) dtb_u_u629) dtb_u_u634) dtb_u_u635) dtb_u_u636) dtb_u_u641) in (let dtb_u_u646 = (match dtb_u_u644 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u648) -> (Base_dDiag.C_Check_ErrC (dtb_u_u648))
  | Base_dDiag.C_Check_OkC (dtb_u_u649) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb_u_u649)) (B_dData_dPair.v_secondOf dtb_u_u649))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u646))))))

# 355 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfo_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) _u_ueffTok -> (let dtb_u_u644 = (((((((v_replProgramFull_u_udirect nFs) nEnv) nProcess) ctx) program) exprSource) _u_ueffTok) in (let dtb_u_u646 = (match dtb_u_u644 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u648) -> (Base_dDiag.C_Check_ErrC (dtb_u_u648))
  | Base_dDiag.C_Check_OkC (dtb_u_u649) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb_u_u649)) (B_dData_dPair.v_secondOf dtb_u_u649))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u646)))

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
let v_dtMainInfo = (fun (dtb_u_u681 : string) (dtb_u_u682 : string) (dtb_u_u683 : string) (dtb_u_u688 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u689 : string) -> (Obj.repr ((fun (dtb_u_u694 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u697 = ((((((v_dtLoad_u_udirect dtb_u_u681) dtb_u_u682) dtb_u_u683) dtb_u_u688) dtb_u_u689) dtb_u_u694) in (let dtb_u_u699 = (match dtb_u_u697 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u701) -> (Base_dDiag.C_Check_ErrC (dtb_u_u701))
  | Base_dDiag.C_Check_OkC (dtb_u_u702) -> (match (Elab_dDriver.v_elabProgram (B_dData_dPair.v_firstOf dtb_u_u702)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u703) -> (Base_dDiag.C_Check_ErrC (dtb_u_u703))
  | Base_dDiag.C_Check_OkC (dtb_u_u704) -> ((v_mainInfoOfDefs dtb_u_u689) (B_dData_dPair.v_secondOf dtb_u_u704))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u699))))))

# 911 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtMainInfo_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u697 = ((((((v_dtLoad_u_udirect nFs) nEnv) nProcess) ctx) entry) _u_ueffTok) in (let dtb_u_u699 = (match dtb_u_u697 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u701) -> (Base_dDiag.C_Check_ErrC (dtb_u_u701))
  | Base_dDiag.C_Check_OkC (dtb_u_u702) -> (match (Elab_dDriver.v_elabProgram (B_dData_dPair.v_firstOf dtb_u_u702)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u703) -> (Base_dDiag.C_Check_ErrC (dtb_u_u703))
  | Base_dDiag.C_Check_OkC (dtb_u_u704) -> ((v_mainInfoOfDefs entry) (B_dData_dPair.v_secondOf dtb_u_u704))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u699)))

# 900 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtMainKind = (fun (dtb_u_u705 : string) (dtb_u_u706 : string) (dtb_u_u707 : string) (dtb_u_u712 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u713 : string) -> (Obj.repr ((fun (dtb_u_u718 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u721 = ((((((v_dtMainInfo_u_udirect dtb_u_u705) dtb_u_u706) dtb_u_u707) dtb_u_u712) dtb_u_u713) dtb_u_u718) in (let dtb_u_u723 = (match dtb_u_u721 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u725) -> (Base_dDiag.C_Check_ErrC (dtb_u_u725))
  | Base_dDiag.C_Check_OkC (dtb_u_u726) -> (Base_dDiag.C_Check_OkC ((dtb_u_u726).f_MainInfo_miKind))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u723))))))

# 900 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtMainKind_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u721 = ((((((v_dtMainInfo_u_udirect nFs) nEnv) nProcess) ctx) entry) _u_ueffTok) in (let dtb_u_u723 = (match dtb_u_u721 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u725) -> (Base_dDiag.C_Check_ErrC (dtb_u_u725))
  | Base_dDiag.C_Check_OkC (dtb_u_u726) -> (Base_dDiag.C_Check_OkC ((dtb_u_u726).f_MainInfo_miKind))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u723)))

# 970 "Vuna/Compiler/Driver/Dt.vuna"
let v_evalDtMainCore = (fun (program : Elab_dTypes.t_DtProgram) -> (match (v_findMainDef (Elab_dTypes.v_dtProgDefs program)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain)
  | B_dData_dMaybe.C_Maybe_Just (dtb__285) -> (let table = (v_defTableOf (Elab_dTypes.v_dtProgDefs program)) in (let sols = Core_dTerm.v_solsEmpty in (let mainVal = ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) table)) sols) Core_dEval.v_normalizeFuelBound) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("main", B_dData_dList.C_List_Nil))))) in (if (B_dData_dBool.v_not ((v_mainActionKind (Elab_dTypes.v_dtDefType dtb__285)) = "")) then (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_InterpCannotExecuteEffects) else (match mainVal with
  | Core_dTerm.C_Value_VInt (dtb__286) -> (Base_dDiag.C_Check_OkC ((string_of_int dtb__286)))
  | Core_dTerm.C_Value_VStr (dtb__287) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue mainVal)))
  | Core_dTerm.C_Value_VBool (dtb__288) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue mainVal)))
  | Core_dTerm.C_Value_VFloat (dtb__289) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showFloatOf dtb__289)))
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
let v_dtEvalFile = (fun (dtb_u_u740 : string) (dtb_u_u741 : string) (dtb_u_u742 : string) (dtb_u_u747 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u748 : string) -> (Obj.repr ((fun (dtb_u_u753 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u756 = ((((((v_dtLoadPartsForCheck_u_udirect dtb_u_u740) dtb_u_u741) dtb_u_u742) dtb_u_u747) dtb_u_u748) dtb_u_u753) in (let dtb_u_u758 = (match dtb_u_u756 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u760) -> (Base_dDiag.C_Check_ErrC (dtb_u_u760))
  | Base_dDiag.C_Check_OkC (dtb_u_u761) -> (let dtb_u_u762 = (B_dData_dPair.v_secondOf dtb_u_u761) in (let dtb_u_u763 = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf dtb_u_u762)) (B_dData_dPair.v_firstOf dtb_u_u762)) in ((Base_dCommon.v_bind (Elab_dDriver.v_elabProgramFull dtb_u_u763)) v_evalDtMain)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u758))))))

# 299 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalFile_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u756 = ((((((v_dtLoadPartsForCheck_u_udirect nFs) nEnv) nProcess) ctx) entry) _u_ueffTok) in (let dtb_u_u758 = (match dtb_u_u756 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u760) -> (Base_dDiag.C_Check_ErrC (dtb_u_u760))
  | Base_dDiag.C_Check_OkC (dtb_u_u761) -> (let dtb_u_u762 = (B_dData_dPair.v_secondOf dtb_u_u761) in (let dtb_u_u763 = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf dtb_u_u762)) (B_dData_dPair.v_firstOf dtb_u_u762)) in ((Base_dCommon.v_bind (Elab_dDriver.v_elabProgramFull dtb_u_u763)) v_evalDtMain)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u758)))

# 1042 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry))

# 1042 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadParts_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> ((Obj.magic (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) _u_ueffTok))

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
let v_dedupGlobals = (fun (gs : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_dedupKeepLast (fun (g : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf (Obj.magic g)))) gs))

# 1091 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOfAt = (fun (next : int) (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let datas = (v_dedupDatas ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) progs)) in (let dataKeys = ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) datas)) ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors d)))) datas)) in (let defGlobals = ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf (Obj.magic p))) dataKeys)) false))) (v_dedupGlobals ((B_dData_dList.v_append Elab_dPrelude.v_preludeGlobals) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) progs)))) in (let globals = ((B_dData_dList.v_append defGlobals) ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName d); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDataKind d) })) datas)) in (let opaqueNames = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedOpaqueOf) progs)) in (let bodies = ((B_dData_dList.v_filter (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf (Obj.magic p))) opaqueNames)))) (v_dedupDefBodies ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) progs))) in (let ec0 = Elab_dTypes.v_ecEmpty in (let ec1 = ((Elab_dDriver.v_addDatasEc ec0) datas) in (let ec2 = ((Elab_dDriver.v_addInstsEc ec1) (v_dedupInsts ((B_dData_dList.v_concatMap Driver_dCache.v_cachedInsts) progs))) in (let ec3 = ((Elab_dDriver.v_addClassesEc ec2) (v_dedupClasses ((B_dData_dList.v_concatMap Driver_dCache.v_cachedClasses) progs))) in (let ec4 = ((Elab_dTypes.v_ecPutNext ec3) next) in (let ec5 = ((Elab_dTypes.v_ecPutGlobalsTbl ec4) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) globals)) in (let ec6 = ((Elab_dTypes.v_ecPutDefTbl ec5) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) bodies)) in { B_dData_dPair.f_Pair_first = ec6; B_dData_dPair.f_Pair_second = globals }))))))))))))))

# 1116 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOf = (fun (progs : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((v_depStartOfAt 0) progs))

# 1213 "Vuna/Compiler/Driver/Dt.vuna"
let v_sortNames = (B_dData_dSort.v_sortBy (fun (a : string) (b : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (Obj.magic a)) (Obj.magic b))))

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
  | Frontend_dAst.C_Decl_DFun (dtb__316, dtb__317, dtb__318, dtb__319) -> (match (Elab_dTermination_dMeasure.v_projectionOfDef { B_dData_dPair.f_Pair_first = dtb__316; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (fun (x : Frontend_dAst.t_Pat) -> (Obj.magic x))) dtb__317); B_dData_dPair.f_Pair_second = dtb__318 }, B_dData_dList.C_List_Nil)) }) with
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

# 1713 "Vuna/Compiler/Driver/Dt.vuna"
let v_splitGenerate_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (moduleParts : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1032 = ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) (Frontend_dPackages_dPkg.v_contextRoots ctx)) in (let dtb_u_u1033 = (Frontend_dPackages_dPkg.v_contextDir ctx) in (let dtb_u_u1034 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "cg-generate-start") else 0) in ((Obj.magic (((((((Driver_dSplitGen.v_generateDtSplitProgram moduleParts) entryDecls) prog) printResult) dtb_u_u1032) dtb_u_u1033) extraDefLocs)) _u_ueffTok)))))

# 1721 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGenerateIncremental = (fun (dtb_u_u1035 : string) (dtb_u_u1036 : string) (dtb_u_u1037 : string) (dtb_u_u1038 : string) (dtb_u_u1044 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1045 : string) (dtb_u_u1046 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u1047 : t_CheckedPackage) (dtb_u_u1048 : bool) (dtb_u_u1049 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u1050 = (v_topoModules (B_dData_dPair.v_secondOf dtb_u_u1046)) in (let dtb_u_u1051 = ((B_dData_dList.v_map (fun (dtb_u_u1065 : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb_u_u1065); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf dtb_u_u1065) })) dtb_u_u1050) in (Obj.repr ((fun (dtb_u_u1056 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1059 = (((((((((((v_splitGenerate_u_udirect dtb_u_u1035) dtb_u_u1036) dtb_u_u1037) dtb_u_u1038) dtb_u_u1044) dtb_u_u1051) (B_dData_dPair.v_firstOf dtb_u_u1046)) (dtb_u_u1047).f_CheckedPackage_checkedProgram) dtb_u_u1048) dtb_u_u1049) dtb_u_u1056) in (let dtb_u_u1061 = (match dtb_u_u1059 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1063) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1063))
  | Base_dDiag.C_Check_OkC (dtb_u_u1064) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1064; B_dData_dPair.f_Pair_second = dtb_u_u1047 }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1061))))))))

# 1721 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGenerateIncremental_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (checked : t_CheckedPackage) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1050 = (v_topoModules (B_dData_dPair.v_secondOf parts)) in (let dtb_u_u1051 = ((B_dData_dList.v_map (fun (dtb_u_u1065 : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb_u_u1065); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf dtb_u_u1065) })) dtb_u_u1050) in (let dtb_u_u1059 = (((((((((((v_splitGenerate_u_udirect nFs) nConsole) nEnv) nProcess) ctx) dtb_u_u1051) (B_dData_dPair.v_firstOf parts)) (checked).f_CheckedPackage_checkedProgram) printResult) extraDefLocs) _u_ueffTok) in (let dtb_u_u1061 = (match dtb_u_u1059 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1063) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1063))
  | Base_dDiag.C_Check_OkC (dtb_u_u1064) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1064; B_dData_dPair.f_Pair_second = checked }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1061)))))

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
let v_dtLoadPartsIncremental = (fun (dtb_u_u1101 : string) (dtb_u_u1102 : string) (dtb_u_u1103 : string) (dtb_u_u1108 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1109 : string) (dtb_u_u1110 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1111 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let dtb_u_u1112 = ((B_dData_dList.v_append (v_modulesOfIfaces dtb_u_u1110)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) dtb_u_u1111))) in (let dtb_u_u1113 = ((B_dData_dList.v_append dtb_u_u1110) dtb_u_u1111) in (Obj.repr ((fun (dtb_u_u1118 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1121 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") dtb_u_u1118) in (let dtb_u_u1129 = (((((Loader_dFlatten.v_loadProjectWithPreloaded_u_udirect dtb_u_u1101) dtb_u_u1108) dtb_u_u1109) dtb_u_u1112) dtb_u_u1118) in (match dtb_u_u1129 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1130) -> (let dtb_u_u1132 = (Base_dDiag.C_Check_ErrC (dtb_u_u1130)) in dtb_u_u1132)
  | Base_dDiag.C_Check_OkC (dtb_u_u1134) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1108)) dtb_u_u1134) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1135; B_dData_dPair.f_Pair_second = dtb_u_u1136 } -> (let dtb_u_u1144 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") dtb_u_u1118) in (let dtb_u_u1146 = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u1108)) ((v_preloadKeepOf dtb_u_u1113) dtb_u_u1136)) dtb_u_u1135) in dtb_u_u1146))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1252 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsIncremental_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1112 = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let dtb_u_u1113 = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (let dtb_u_u1121 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") _u_ueffTok) in (let dtb_u_u1129 = (((((Loader_dFlatten.v_loadProjectWithPreloaded_u_udirect nFs) ctx) entry) dtb_u_u1112) _u_ueffTok) in (match dtb_u_u1129 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1130) -> (let dtb_u_u1132 = (Base_dDiag.C_Check_ErrC (dtb_u_u1130)) in dtb_u_u1132)
  | Base_dDiag.C_Check_OkC (dtb_u_u1134) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u1134) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1135; B_dData_dPair.f_Pair_second = dtb_u_u1136 } -> (let dtb_u_u1144 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") _u_ueffTok) in (let dtb_u_u1146 = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf dtb_u_u1113) dtb_u_u1136)) dtb_u_u1135) in dtb_u_u1146))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1812 "Vuna/Compiler/Driver/Dt.vuna"
let v_materializedDeps = (fun (pkg : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let depNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkg))) (B_dData_dPair.v_secondOf parts))) in ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) depNames))) ifaces)))

# 485 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfacesAux = (fun (dtb_u_u1154 : string) (dtb_u_u1155 : string) (dtb_u_u1156 : string) (dtb_u_u1157 : string) (dtb_u_u1158 : string) (dtb_u_u1165 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1166 : string) (dtb_u_u1167 : string) (dtb_u_u1168 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1169 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let dtb_u_u1170 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-source=repl modules=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u1168)))) else 0) in (let dtb_u_u1171 = (String.concat "" [dtb_u_u1166; "\n"; v_replExprName; " = "; dtb_u_u1167; "\n"]) in (Obj.repr ((fun (dtb_u_u1176 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1179 = ((((((Loader_dFlatten.v_loadProjectSourceWithPreloaded_u_udirect dtb_u_u1154) dtb_u_u1165) "<repl>") dtb_u_u1171) (v_modulesOfIfaces dtb_u_u1168)) dtb_u_u1176) in (match dtb_u_u1179 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1180) -> (let dtb_u_u1182 = (Base_dDiag.C_Check_ErrC (dtb_u_u1180)) in dtb_u_u1182)
  | Base_dDiag.C_Check_OkC (dtb_u_u1184) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1165)) dtb_u_u1184) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1185; B_dData_dPair.f_Pair_second = dtb_u_u1186 } -> (let dtb_u_u1187 = (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1165)) dtb_u_u1186) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u1168)) in (let dtb_u_u1188 = (if ((B_dData_dList.v_length dtb_u_u1187) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=repl missing=" ^ ((B_dData_dString.v_join ",") dtb_u_u1187))) else 0) else 0) in (if ((B_dData_dList.v_length dtb_u_u1187) = 0) then (let dtb_u_u1190 = (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u1165)) ((v_preloadKeepOf dtb_u_u1168) dtb_u_u1186)) dtb_u_u1185) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1192) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1192))
  | Base_dDiag.C_Check_OkC (dtb_u_u1193) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1165)) (B_dData_dPair.v_secondOf dtb_u_u1193)) (Driver_dIface.v_restoreDefLocsSpans dtb_u_u1168))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1194) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1194))
  | Base_dDiag.C_Check_OkC (dtb_u_u1195) -> (let dtb_u_u1196 = (B_dData_dPair.v_secondOf dtb_u_u1193) in ((((((v_replCheckPartsAux (v_depStartOf dtb_u_u1195)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1165)) dtb_u_u1195) dtb_u_u1196) dtb_u_u1168) dtb_u_u1169))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1190) else (let dtb_u_u1204 = (((((((v_replProgramFull_u_udirect dtb_u_u1154) dtb_u_u1155) dtb_u_u1156) dtb_u_u1165) dtb_u_u1166) dtb_u_u1167) dtb_u_u1176) in (let dtb_u_u1206 = (match dtb_u_u1204 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1208) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1208))
  | Base_dDiag.C_Check_OkC (dtb_u_u1209) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1209; B_dData_dPair.f_Pair_second = dtb_u_u1169 }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1206)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 485 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfacesAux_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) _u_ueffTok -> (let dtb_u_u1170 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-source=repl modules=" ^ (string_of_int (B_dData_dList.v_length ifaces)))) else 0) in (let dtb_u_u1171 = (String.concat "" [program; "\n"; v_replExprName; " = "; exprSource; "\n"]) in (let dtb_u_u1179 = ((((((Loader_dFlatten.v_loadProjectSourceWithPreloaded_u_udirect nFs) ctx) "<repl>") dtb_u_u1171) (v_modulesOfIfaces ifaces)) _u_ueffTok) in (match dtb_u_u1179 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1180) -> (let dtb_u_u1182 = (Base_dDiag.C_Check_ErrC (dtb_u_u1180)) in dtb_u_u1182)
  | Base_dDiag.C_Check_OkC (dtb_u_u1184) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u1184) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1185; B_dData_dPair.f_Pair_second = dtb_u_u1186 } -> (let dtb_u_u1187 = (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u1186) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces)) in (let dtb_u_u1188 = (if ((B_dData_dList.v_length dtb_u_u1187) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=repl missing=" ^ ((B_dData_dString.v_join ",") dtb_u_u1187))) else 0) else 0) in (if ((B_dData_dList.v_length dtb_u_u1187) = 0) then (let dtb_u_u1190 = (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb_u_u1186)) dtb_u_u1185) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1192) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1192))
  | Base_dDiag.C_Check_OkC (dtb_u_u1193) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u1193)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1194) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1194))
  | Base_dDiag.C_Check_OkC (dtb_u_u1195) -> (let dtb_u_u1196 = (B_dData_dPair.v_secondOf dtb_u_u1193) in ((((((v_replCheckPartsAux (v_depStartOf dtb_u_u1195)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u1195) dtb_u_u1196) ifaces) cache))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1190) else (let dtb_u_u1204 = (((((((v_replProgramFull_u_udirect nFs) nEnv) nProcess) ctx) program) exprSource) _u_ueffTok) in (let dtb_u_u1206 = (match dtb_u_u1204 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1208) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1208))
  | Base_dDiag.C_Check_OkC (dtb_u_u1209) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1209; B_dData_dPair.f_Pair_second = cache }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1206)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 474 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfaces = (fun (dtb_u_u1210 : string) (dtb_u_u1211 : string) (dtb_u_u1212 : string) (dtb_u_u1213 : string) (dtb_u_u1214 : string) (dtb_u_u1221 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1222 : string) (dtb_u_u1223 : string) (dtb_u_u1224 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1229 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1232 = (((((((((((v_replProgramWithIfacesAux_u_udirect dtb_u_u1210) dtb_u_u1211) dtb_u_u1212) dtb_u_u1213) dtb_u_u1214) dtb_u_u1221) dtb_u_u1222) dtb_u_u1223) dtb_u_u1224) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u1229) in (let dtb_u_u1234 = (match dtb_u_u1232 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1236) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1236))
  | Base_dDiag.C_Check_OkC (dtb_u_u1237) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u1237)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1234))))))

# 474 "Vuna/Compiler/Driver/Dt.vuna"
let v_replProgramWithIfaces_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1232 = (((((((((((v_replProgramWithIfacesAux_u_udirect nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) B_dData_dMaybe.C_Maybe_Nothing) _u_ueffTok) in (let dtb_u_u1234 = (match dtb_u_u1232 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1236) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1236))
  | Base_dDiag.C_Check_OkC (dtb_u_u1237) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u1237)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1234)))

# 522 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithAuxCache = (fun (dtb_u_u1238 : string) (dtb_u_u1239 : string) (dtb_u_u1240 : string) (dtb_u_u1241 : string) (dtb_u_u1242 : string) (dtb_u_u1249 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1250 : string) (dtb_u_u1251 : string) (dtb_u_u1252 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1253 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (Obj.repr ((fun (dtb_u_u1258 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1261 = (((((((((((v_replProgramWithIfacesAux_u_udirect dtb_u_u1238) dtb_u_u1239) dtb_u_u1240) dtb_u_u1241) dtb_u_u1242) dtb_u_u1249) dtb_u_u1250) dtb_u_u1251) dtb_u_u1252) dtb_u_u1253) dtb_u_u1258) in (let dtb_u_u1263 = (match dtb_u_u1261 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1265) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1265))
  | Base_dDiag.C_Check_OkC (dtb_u_u1266) -> (match ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u1266))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb_u_u1266))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1267) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1267))
  | Base_dDiag.C_Check_OkC (dtb_u_u1268) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1268; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1266) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1263))))))

# 522 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithAuxCache_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) _u_ueffTok -> (let dtb_u_u1261 = (((((((((((v_replProgramWithIfacesAux_u_udirect nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache) _u_ueffTok) in (let dtb_u_u1263 = (match dtb_u_u1261 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1265) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1265))
  | Base_dDiag.C_Check_OkC (dtb_u_u1266) -> (match ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u1266))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb_u_u1266))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1267) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1267))
  | Base_dDiag.C_Check_OkC (dtb_u_u1268) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1268; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1266) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1263)))

# 535 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithAuxCache = (fun (dtb_u_u1269 : string) (dtb_u_u1270 : string) (dtb_u_u1271 : string) (dtb_u_u1272 : string) (dtb_u_u1273 : string) (dtb_u_u1280 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1281 : string) (dtb_u_u1282 : string) (dtb_u_u1283 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1284 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (Obj.repr ((fun (dtb_u_u1289 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1292 = (((((((((((v_replProgramWithIfacesAux_u_udirect dtb_u_u1269) dtb_u_u1270) dtb_u_u1271) dtb_u_u1272) dtb_u_u1273) dtb_u_u1280) dtb_u_u1281) dtb_u_u1282) dtb_u_u1283) dtb_u_u1284) dtb_u_u1289) in (let dtb_u_u1294 = (match dtb_u_u1292 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1296) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1296))
  | Base_dDiag.C_Check_OkC (dtb_u_u1297) -> (match ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u1297))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb_u_u1297))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1298) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1298))
  | Base_dDiag.C_Check_OkC (dtb_u_u1299) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1299; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1297) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1294))))))

# 535 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithAuxCache_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) _u_ueffTok -> (let dtb_u_u1292 = (((((((((((v_replProgramWithIfacesAux_u_udirect nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) cache) _u_ueffTok) in (let dtb_u_u1294 = (match dtb_u_u1292 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1296) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1296))
  | Base_dDiag.C_Check_OkC (dtb_u_u1297) -> (match ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u1297))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb_u_u1297))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1298) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1298))
  | Base_dDiag.C_Check_OkC (dtb_u_u1299) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1299; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1297) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1294)))

# 548 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithIfaces = (fun (dtb_u_u1300 : string) (dtb_u_u1301 : string) (dtb_u_u1302 : string) (dtb_u_u1303 : string) (dtb_u_u1304 : string) (dtb_u_u1311 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1312 : string) (dtb_u_u1313 : string) (dtb_u_u1314 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1319 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1322 = ((((((((((v_replProgramWithIfaces_u_udirect dtb_u_u1300) dtb_u_u1301) dtb_u_u1302) dtb_u_u1303) dtb_u_u1304) dtb_u_u1311) dtb_u_u1312) dtb_u_u1313) dtb_u_u1314) dtb_u_u1319) in (let dtb_u_u1324 = (match dtb_u_u1322 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1326) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1326))
  | Base_dDiag.C_Check_OkC (dtb_u_u1327) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb_u_u1327)) (B_dData_dPair.v_secondOf dtb_u_u1327))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1324))))))

# 548 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprInfoWithIfaces_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1322 = ((((((((((v_replProgramWithIfaces_u_udirect nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) _u_ueffTok) in (let dtb_u_u1324 = (match dtb_u_u1322 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1326) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1326))
  | Base_dDiag.C_Check_OkC (dtb_u_u1327) -> ((Elab_dDriver.v_dtEvalExprInInfo (B_dData_dPair.v_firstOf dtb_u_u1327)) (B_dData_dPair.v_secondOf dtb_u_u1327))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1324)))

# 558 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithIfaces = (fun (dtb_u_u1328 : string) (dtb_u_u1329 : string) (dtb_u_u1330 : string) (dtb_u_u1331 : string) (dtb_u_u1332 : string) (dtb_u_u1339 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1340 : string) (dtb_u_u1341 : string) (dtb_u_u1342 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1347 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1350 = ((((((((((v_replProgramWithIfaces_u_udirect dtb_u_u1328) dtb_u_u1329) dtb_u_u1330) dtb_u_u1331) dtb_u_u1332) dtb_u_u1339) dtb_u_u1340) dtb_u_u1341) dtb_u_u1342) dtb_u_u1347) in (let dtb_u_u1352 = (match dtb_u_u1350 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1354) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1354))
  | Base_dDiag.C_Check_OkC (dtb_u_u1355) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb_u_u1355)) (B_dData_dPair.v_secondOf dtb_u_u1355))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1352))))))

# 558 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalExprWithIfaces_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (program : string) (exprSource : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1350 = ((((((((((v_replProgramWithIfaces_u_udirect nFs) nEnv) nProcess) nExit) nArgs) ctx) program) exprSource) ifaces) _u_ueffTok) in (let dtb_u_u1352 = (match dtb_u_u1350 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1354) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1354))
  | Base_dDiag.C_Check_OkC (dtb_u_u1355) -> ((Elab_dDriver.v_dtEvalExprIn (B_dData_dPair.v_firstOf dtb_u_u1355)) (B_dData_dPair.v_secondOf dtb_u_u1355))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1352)))

# 1818 "Vuna/Compiler/Driver/Dt.vuna"
let v_materializedOwn = (fun (pkg : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let ourNames = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkg))) (B_dData_dPair.v_secondOf parts))) in ((B_dData_dList.v_filter (fun (mi : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf mi)) ourNames))) ifaces)))

# 1576 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceIncremental = (fun (dtb_u_u1362 : string) (dtb_u_u1363 : string) (dtb_u_u1364 : string) (dtb_u_u1369 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1370 : string) (dtb_u_u1371 : string) (dtb_u_u1372 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1373 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1374 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let dtb_u_u1375 = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1369) in (let dtb_u_u1376 = ((B_dData_dList.v_append (v_modulesOfIfaces dtb_u_u1372)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) dtb_u_u1373))) in (let dtb_u_u1377 = ((B_dData_dList.v_append dtb_u_u1372) dtb_u_u1373) in (Obj.repr ((fun (dtb_u_u1382 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1385 = ((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded_u_udirect dtb_u_u1362) dtb_u_u1369) dtb_u_u1370) dtb_u_u1371) dtb_u_u1376) dtb_u_u1382) in (let dtb_u_u1387 = (match dtb_u_u1385 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1389) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1389))
  | Base_dDiag.C_Check_OkC (dtb_u_u1390) -> (match ((v_filterProjectToImports dtb_u_u1375) dtb_u_u1390) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1391; B_dData_dPair.f_Pair_second = dtb_u_u1392 } -> (let dtb_u_u1393 = (((v_missingDepModules dtb_u_u1375) dtb_u_u1392) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u1377)) in (let dtb_u_u1394 = (if ((B_dData_dList.v_length dtb_u_u1393) > 0) then (Base_dObs.v_obsMark "vuna.lsp.goals.fallback") else 0) in (if ((B_dData_dList.v_length dtb_u_u1393) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1374 } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u1369)) ((v_preloadKeepOf dtb_u_u1377) dtb_u_u1392)) dtb_u_u1391) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1395) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1395))
  | Base_dDiag.C_Check_OkC (dtb_u_u1396) -> (match (((((v_dtGoalsIncrementalCore dtb_u_u1369) dtb_u_u1396) (((v_materializedDeps dtb_u_u1375) (B_dData_dPair.v_secondOf dtb_u_u1396)) dtb_u_u1372)) (((v_materializedOwn dtb_u_u1375) (B_dData_dPair.v_secondOf dtb_u_u1396)) dtb_u_u1373)) dtb_u_u1374) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1397) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1397))
  | Base_dDiag.C_Check_OkC (dtb_u_u1398) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u1398 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1387)))))))))

# 1576 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsSourceIncremental_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) _u_ueffTok -> (let dtb_u_u1375 = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let dtb_u_u1376 = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let dtb_u_u1377 = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (let dtb_u_u1385 = ((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded_u_udirect nFs) ctx) label) source) dtb_u_u1376) _u_ueffTok) in (let dtb_u_u1387 = (match dtb_u_u1385 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1389) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1389))
  | Base_dDiag.C_Check_OkC (dtb_u_u1390) -> (match ((v_filterProjectToImports dtb_u_u1375) dtb_u_u1390) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1391; B_dData_dPair.f_Pair_second = dtb_u_u1392 } -> (let dtb_u_u1393 = (((v_missingDepModules dtb_u_u1375) dtb_u_u1392) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u1377)) in (let dtb_u_u1394 = (if ((B_dData_dList.v_length dtb_u_u1393) > 0) then (Base_dObs.v_obsMark "vuna.lsp.goals.fallback") else 0) in (if ((B_dData_dList.v_length dtb_u_u1393) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = cache } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf dtb_u_u1377) dtb_u_u1392)) dtb_u_u1391) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1395) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1395))
  | Base_dDiag.C_Check_OkC (dtb_u_u1396) -> (match (((((v_dtGoalsIncrementalCore ctx) dtb_u_u1396) (((v_materializedDeps dtb_u_u1375) (B_dData_dPair.v_secondOf dtb_u_u1396)) depIfaces)) (((v_materializedOwn dtb_u_u1375) (B_dData_dPair.v_secondOf dtb_u_u1396)) cleanIfaces)) cache) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1397) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1397))
  | Base_dDiag.C_Check_OkC (dtb_u_u1398) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u1398 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1387))))))

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
let v_dtEvalTestEntryFull = (fun (dtb_u_u1407 : string) (dtb_u_u1408 : string) (dtb_u_u1409 : string) (dtb_u_u1414 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1415 : string) -> (Obj.repr ((fun (dtb_u_u1420 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1423 = ((((((v_dtLoadPartsForCheck_u_udirect dtb_u_u1407) dtb_u_u1408) dtb_u_u1409) dtb_u_u1414) dtb_u_u1415) dtb_u_u1420) in (let dtb_u_u1425 = (match dtb_u_u1423 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1427) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1427))
  | Base_dDiag.C_Check_OkC (dtb_u_u1428) -> (let dtb_u_u1429 = (B_dData_dPair.v_secondOf dtb_u_u1428) in (let dtb_u_u1430 = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf dtb_u_u1429)) (B_dData_dPair.v_firstOf dtb_u_u1429)) in ((Base_dCommon.v_bind (Elab_dDriver.v_elabProgramFull dtb_u_u1430)) (fun (dtb_u_u1431 : Elab_dTypes.t_DtProgram) -> ((v_testEntryOutcome dtb_u_u1415) dtb_u_u1431)))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1425))))))

# 1845 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalTestEntryFull_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u1423 = ((((((v_dtLoadPartsForCheck_u_udirect nFs) nEnv) nProcess) ctx) entry) _u_ueffTok) in (let dtb_u_u1425 = (match dtb_u_u1423 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1427) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1427))
  | Base_dDiag.C_Check_OkC (dtb_u_u1428) -> (let dtb_u_u1429 = (B_dData_dPair.v_secondOf dtb_u_u1428) in (let dtb_u_u1430 = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf dtb_u_u1429)) (B_dData_dPair.v_firstOf dtb_u_u1429)) in ((Base_dCommon.v_bind (Elab_dDriver.v_elabProgramFull dtb_u_u1430)) (fun (dtb_u_u1431 : Elab_dTypes.t_DtProgram) -> ((v_testEntryOutcome entry) dtb_u_u1431)))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1425)))

# 1886 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsWithIfaces = (fun (dtb_u_u1432 : string) (dtb_u_u1433 : string) (dtb_u_u1434 : string) (dtb_u_u1439 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1440 : string) (dtb_u_u1441 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1446 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1449 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") dtb_u_u1446) in (let dtb_u_u1457 = (((((Loader_dFlatten.v_loadProjectWithPreloaded_u_udirect dtb_u_u1432) dtb_u_u1439) dtb_u_u1440) (v_modulesOfIfaces dtb_u_u1441)) dtb_u_u1446) in (match dtb_u_u1457 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1458) -> (let dtb_u_u1460 = (Base_dDiag.C_Check_ErrC (dtb_u_u1458)) in dtb_u_u1460)
  | Base_dDiag.C_Check_OkC (dtb_u_u1462) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1439)) dtb_u_u1462) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1463; B_dData_dPair.f_Pair_second = dtb_u_u1464 } -> (let dtb_u_u1472 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") dtb_u_u1446) in (let dtb_u_u1474 = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u1439)) ((v_preloadKeepOf dtb_u_u1441) dtb_u_u1464)) dtb_u_u1463) in dtb_u_u1474))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 1886 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadPartsWithIfaces_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1449 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") _u_ueffTok) in (let dtb_u_u1457 = (((((Loader_dFlatten.v_loadProjectWithPreloaded_u_udirect nFs) ctx) entry) (v_modulesOfIfaces ifaces)) _u_ueffTok) in (match dtb_u_u1457 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1458) -> (let dtb_u_u1460 = (Base_dDiag.C_Check_ErrC (dtb_u_u1458)) in dtb_u_u1460)
  | Base_dDiag.C_Check_OkC (dtb_u_u1462) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u1462) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1463; B_dData_dPair.f_Pair_second = dtb_u_u1464 } -> (let dtb_u_u1472 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") _u_ueffTok) in (let dtb_u_u1474 = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb_u_u1464)) dtb_u_u1463) in dtb_u_u1474))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 1900 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsWithIfaces = (fun (dtb_u_u1476 : string) (dtb_u_u1477 : string) (dtb_u_u1478 : string) (dtb_u_u1483 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1484 : string B_dData_dList.t_List) (dtb_u_u1485 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1490 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1493 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") dtb_u_u1490) in (let dtb_u_u1501 = (((((Loader_dFlatten.v_loadProjectModulesWithPreloaded_u_udirect dtb_u_u1476) dtb_u_u1483) dtb_u_u1484) (v_modulesOfIfaces dtb_u_u1485)) dtb_u_u1490) in (match dtb_u_u1501 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1502) -> (let dtb_u_u1504 = (Base_dDiag.C_Check_ErrC (dtb_u_u1502)) in dtb_u_u1504)
  | Base_dDiag.C_Check_OkC (dtb_u_u1506) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1483)) dtb_u_u1506) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1507; B_dData_dPair.f_Pair_second = dtb_u_u1508 } -> (let dtb_u_u1516 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") dtb_u_u1490) in (let dtb_u_u1518 = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u1483)) ((v_preloadKeepOf dtb_u_u1485) dtb_u_u1508)) dtb_u_u1507) in dtb_u_u1518))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 1900 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsWithIfaces_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1493 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") _u_ueffTok) in (let dtb_u_u1501 = (((((Loader_dFlatten.v_loadProjectModulesWithPreloaded_u_udirect nFs) ctx) names) (v_modulesOfIfaces ifaces)) _u_ueffTok) in (match dtb_u_u1501 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1502) -> (let dtb_u_u1504 = (Base_dDiag.C_Check_ErrC (dtb_u_u1502)) in dtb_u_u1504)
  | Base_dDiag.C_Check_OkC (dtb_u_u1506) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u1506) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1507; B_dData_dPair.f_Pair_second = dtb_u_u1508 } -> (let dtb_u_u1516 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") _u_ueffTok) in (let dtb_u_u1518 = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb_u_u1508)) dtb_u_u1507) in dtb_u_u1518))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 1927 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsIncremental = (fun (dtb_u_u1520 : string) (dtb_u_u1521 : string) (dtb_u_u1522 : string) (dtb_u_u1527 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1528 : string B_dData_dList.t_List) (dtb_u_u1529 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1530 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let dtb_u_u1531 = ((B_dData_dList.v_append (v_modulesOfIfaces dtb_u_u1529)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) dtb_u_u1530))) in (let dtb_u_u1532 = ((B_dData_dList.v_append dtb_u_u1529) dtb_u_u1530) in (Obj.repr ((fun (dtb_u_u1537 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1540 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") dtb_u_u1537) in (let dtb_u_u1548 = (((((Loader_dFlatten.v_loadProjectModulesWithPreloaded_u_udirect dtb_u_u1520) dtb_u_u1527) dtb_u_u1528) dtb_u_u1531) dtb_u_u1537) in (match dtb_u_u1548 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1549) -> (let dtb_u_u1551 = (Base_dDiag.C_Check_ErrC (dtb_u_u1549)) in dtb_u_u1551)
  | Base_dDiag.C_Check_OkC (dtb_u_u1553) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1527)) dtb_u_u1553) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1554; B_dData_dPair.f_Pair_second = dtb_u_u1555 } -> (let dtb_u_u1563 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") dtb_u_u1537) in (let dtb_u_u1565 = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u1527)) ((v_preloadKeepOf dtb_u_u1532) dtb_u_u1555)) dtb_u_u1554) in dtb_u_u1565))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1927 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadModulesPartsIncremental_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1531 = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let dtb_u_u1532 = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (let dtb_u_u1540 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.load") _u_ueffTok) in (let dtb_u_u1548 = (((((Loader_dFlatten.v_loadProjectModulesWithPreloaded_u_udirect nFs) ctx) names) dtb_u_u1531) _u_ueffTok) in (match dtb_u_u1548 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1549) -> (let dtb_u_u1551 = (Base_dDiag.C_Check_ErrC (dtb_u_u1549)) in dtb_u_u1551)
  | Base_dDiag.C_Check_OkC (dtb_u_u1553) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u1553) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1554; B_dData_dPair.f_Pair_second = dtb_u_u1555 } -> (let dtb_u_u1563 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") _u_ueffTok) in (let dtb_u_u1565 = (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf dtb_u_u1532) dtb_u_u1555)) dtb_u_u1554) in dtb_u_u1565))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 1992 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOursWith = (fun (dtb_u_u1567 : string) (dtb_u_u1568 : string) (dtb_u_u1569 : string) (dtb_u_u1570 : string) (dtb_u_u1576 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1577 : string) (dtb_u_u1578 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u1579 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u1580 : bool) (dtb_u_u1581 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u1582 = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1576) in (let dtb_u_u1583 = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf dtb_u_u1578)) in (let dtb_u_u1584 = ((B_dData_dList.v_filter (fun (dtb_u_u1612 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u1612) = dtb_u_u1582))) dtb_u_u1583) in (let dtb_u_u1585 = ((B_dData_dList.v_filter (fun (dtb_u_u1611 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u1611) <> dtb_u_u1582))) dtb_u_u1583) in (let dtb_u_u1586 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u1584)) (B_dData_dPair.v_firstOf dtb_u_u1578)) in (let dtb_u_u1587 = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u1585) in (let dtb_u_u1588 = (v_depStartOf dtb_u_u1579) in (match ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf dtb_u_u1588)) (B_dData_dPair.v_secondOf dtb_u_u1588)) dtb_u_u1587) dtb_u_u1586) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1589) -> (let dtb_u_u1591 = (Base_dDiag.C_Check_ErrC (dtb_u_u1589)) in (Obj.repr ((fun (dtb_u_u1592 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1591))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1593) -> (let dtb_u_u1594 = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u1579)) (Elab_dTypes.v_dtProgDatas dtb_u_u1593)); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) dtb_u_u1579)) (Elab_dTypes.v_dtProgDefs dtb_u_u1593)); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgGlobals = (Elab_dTypes.v_dtProgGlobals dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgNext = (dtb_u_u1593).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (dtb_u_u1593).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings dtb_u_u1593) } in (let dtb_u_u1595 = ((B_dData_dList.v_map (fun (dtb_u_u1610 : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb_u_u1610); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf dtb_u_u1610) })) dtb_u_u1583) in (let dtb_u_u1596 = { f_CheckedPackage_checkedProgram = dtb_u_u1593; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf dtb_u_u1578); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf dtb_u_u1578); f_CheckedPackage_checkedInherited = (v_cachedNamesOf dtb_u_u1579); f_CheckedPackage_checkedWarnings = (Elab_dTypes.v_dtProgWarnings dtb_u_u1593) } in (Obj.repr ((fun (dtb_u_u1601 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1604 = (((((((((((v_splitGenerate_u_udirect dtb_u_u1567) dtb_u_u1568) dtb_u_u1569) dtb_u_u1570) dtb_u_u1576) dtb_u_u1595) (B_dData_dPair.v_firstOf dtb_u_u1578)) dtb_u_u1594) dtb_u_u1580) dtb_u_u1581) dtb_u_u1601) in (let dtb_u_u1606 = (match dtb_u_u1604 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1608) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1608))
  | Base_dDiag.C_Check_OkC (dtb_u_u1609) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1609; B_dData_dPair.f_Pair_second = dtb_u_u1596 }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1606))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1992 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOursWith_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (printResult : bool) (extraDefLocs : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1582 = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let dtb_u_u1583 = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let dtb_u_u1584 = ((B_dData_dList.v_filter (fun (dtb_u_u1612 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u1612) = dtb_u_u1582))) dtb_u_u1583) in (let dtb_u_u1585 = ((B_dData_dList.v_filter (fun (dtb_u_u1611 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u1611) <> dtb_u_u1582))) dtb_u_u1583) in (let dtb_u_u1586 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u1584)) (B_dData_dPair.v_firstOf parts)) in (let dtb_u_u1587 = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u1585) in (let dtb_u_u1588 = (v_depStartOf deps) in (match ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf dtb_u_u1588)) (B_dData_dPair.v_secondOf dtb_u_u1588)) dtb_u_u1587) dtb_u_u1586) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1589) -> (let dtb_u_u1591 = (Base_dDiag.C_Check_ErrC (dtb_u_u1589)) in dtb_u_u1591)
  | Base_dDiag.C_Check_OkC (dtb_u_u1593) -> (let dtb_u_u1594 = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps)) (Elab_dTypes.v_dtProgDatas dtb_u_u1593)); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) deps)) (Elab_dTypes.v_dtProgDefs dtb_u_u1593)); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgGlobals = (Elab_dTypes.v_dtProgGlobals dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses dtb_u_u1593); Elab_dTypes.f_DtProgram_dtProgNext = (dtb_u_u1593).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (dtb_u_u1593).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings dtb_u_u1593) } in (let dtb_u_u1595 = ((B_dData_dList.v_map (fun (dtb_u_u1610 : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb_u_u1610); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf dtb_u_u1610) })) dtb_u_u1583) in (let dtb_u_u1596 = { f_CheckedPackage_checkedProgram = dtb_u_u1593; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf deps); f_CheckedPackage_checkedWarnings = (Elab_dTypes.v_dtProgWarnings dtb_u_u1593) } in (let dtb_u_u1604 = (((((((((((v_splitGenerate_u_udirect nFs) nConsole) nEnv) nProcess) ctx) dtb_u_u1595) (B_dData_dPair.v_firstOf parts)) dtb_u_u1594) printResult) extraDefLocs) _u_ueffTok) in (let dtb_u_u1606 = (match dtb_u_u1604 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1608) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1608))
  | Base_dDiag.C_Check_OkC (dtb_u_u1609) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1609; B_dData_dPair.f_Pair_second = dtb_u_u1596 }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1606)))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1973 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectWithIfaces = (fun (dtb_u_u1613 : string) (dtb_u_u1614 : string) (dtb_u_u1615 : string) (dtb_u_u1616 : string) (dtb_u_u1622 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1623 : string) (dtb_u_u1624 : bool) (dtb_u_u1625 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1630 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1633 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.codegen.split") dtb_u_u1630) in (let dtb_u_u1641 = (((((((v_dtLoadPartsWithIfaces_u_udirect dtb_u_u1613) dtb_u_u1615) dtb_u_u1616) dtb_u_u1622) dtb_u_u1623) dtb_u_u1625) dtb_u_u1630) in (let dtb_u_u1647 = Obj.obj ((match dtb_u_u1641 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1649) -> (Obj.magic (let dtb_u_u1651 = (Base_dDiag.C_Check_ErrC (dtb_u_u1649)) in (Obj.repr ((fun (dtb_u_u1652 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1651)))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1653) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1622)) (B_dData_dPair.v_secondOf dtb_u_u1653)) (Driver_dIface.v_restoreDefLocsSpans dtb_u_u1625))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1654) -> (Obj.magic (let dtb_u_u1656 = (Base_dDiag.C_Check_ErrC (dtb_u_u1654)) in (Obj.repr ((fun (dtb_u_u1657 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1656)))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1658) -> ((((((((((v_dtSplitPartsOursWith dtb_u_u1613) dtb_u_u1614) dtb_u_u1615) dtb_u_u1616) dtb_u_u1622) dtb_u_u1623) (B_dData_dPair.v_secondOf dtb_u_u1653)) dtb_u_u1658) dtb_u_u1624) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u1659 = (dtb_u_u1647 dtb_u_u1630) in (let dtb_u_u1667 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.codegen.split") dtb_u_u1630) in (let dtb_u_u1669 = dtb_u_u1659 in dtb_u_u1669))))))))))

# 1973 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectWithIfaces_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1633 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.codegen.split") _u_ueffTok) in (let dtb_u_u1641 = (((((((v_dtLoadPartsWithIfaces_u_udirect nFs) nEnv) nProcess) ctx) entry) ifaces) _u_ueffTok) in (let dtb_u_u1647 = Obj.obj ((match dtb_u_u1641 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1649) -> (Obj.magic (let dtb_u_u1651 = (Base_dDiag.C_Check_ErrC (dtb_u_u1649)) in (Obj.repr ((fun (dtb_u_u1652 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1651)))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1653) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u1653)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1654) -> (Obj.magic (let dtb_u_u1656 = (Base_dDiag.C_Check_ErrC (dtb_u_u1654)) in (Obj.repr ((fun (dtb_u_u1657 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1656)))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1658) -> ((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) (B_dData_dPair.v_secondOf dtb_u_u1653)) dtb_u_u1658) printResult) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u1659 = (dtb_u_u1647 _u_ueffTok) in (let dtb_u_u1667 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.codegen.split") _u_ueffTok) in (let dtb_u_u1669 = dtb_u_u1659 in dtb_u_u1669)))))))

# 1988 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOurs = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (printResult : bool) -> ((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) parts) deps) printResult) B_dData_dList.C_List_Nil))

# 1988 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOurs_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (printResult : bool) _u_ueffTok -> ((Obj.magic ((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) parts) deps) printResult) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 2036 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectParts = (fun (dtb_u_u1685 : string) (dtb_u_u1686 : string) (dtb_u_u1687 : string) (dtb_u_u1688 : string) (dtb_u_u1694 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1695 : string) (dtb_u_u1696 : bool) -> (Obj.repr ((fun (dtb_u_u1701 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1704 = ((((((v_dtLoadParts_u_udirect dtb_u_u1685) dtb_u_u1687) dtb_u_u1688) dtb_u_u1694) dtb_u_u1695) dtb_u_u1701) in (match dtb_u_u1704 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1705) -> (let dtb_u_u1707 = (Base_dDiag.C_Check_ErrC (dtb_u_u1705)) in dtb_u_u1707)
  | Base_dDiag.C_Check_OkC (dtb_u_u1709) -> (let dtb_u_u1710 = (B_dData_dPair.v_secondOf dtb_u_u1709) in (let dtb_u_u1711 = (B_dData_dPair.v_firstOf dtb_u_u1709) in (let dtb_u_u1712 = (v_topoModules (B_dData_dPair.v_secondOf dtb_u_u1710)) in (let dtb_u_u1713 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u1712)) (B_dData_dPair.v_firstOf dtb_u_u1710)) in (match (Elab_dDriver.v_elabProgramFull dtb_u_u1713) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1714) -> (let dtb_u_u1716 = (Base_dDiag.C_Check_ErrC (dtb_u_u1714)) in dtb_u_u1716)
  | Base_dDiag.C_Check_OkC (dtb_u_u1718) -> (let dtb_u_u1727 = (((((((((((v_splitGenerate_u_udirect dtb_u_u1685) dtb_u_u1686) dtb_u_u1687) dtb_u_u1688) dtb_u_u1694) ((B_dData_dList.v_map (fun (dtb_u_u1726 : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb_u_u1726); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf dtb_u_u1726) })) dtb_u_u1712)) (B_dData_dPair.v_firstOf dtb_u_u1710)) dtb_u_u1718) dtb_u_u1696) B_dData_dList.C_List_Nil) dtb_u_u1701) in (let dtb_u_u1729 = (match dtb_u_u1727 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1731) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1731))
  | Base_dDiag.C_Check_OkC (dtb_u_u1732) -> (let dtb_u_u1733 = ((B_dData_dList.v_append dtb_u_u1711) (Elab_dTypes.v_dtProgWarnings dtb_u_u1718)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1732; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb_u_u1718; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf dtb_u_u1710); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf dtb_u_u1710); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = dtb_u_u1733 } })))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1729))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 2036 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectParts_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) _u_ueffTok -> (let dtb_u_u1704 = ((((((v_dtLoadParts_u_udirect nFs) nEnv) nProcess) ctx) entry) _u_ueffTok) in (match dtb_u_u1704 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1705) -> (let dtb_u_u1707 = (Base_dDiag.C_Check_ErrC (dtb_u_u1705)) in dtb_u_u1707)
  | Base_dDiag.C_Check_OkC (dtb_u_u1709) -> (let dtb_u_u1710 = (B_dData_dPair.v_secondOf dtb_u_u1709) in (let dtb_u_u1711 = (B_dData_dPair.v_firstOf dtb_u_u1709) in (let dtb_u_u1712 = (v_topoModules (B_dData_dPair.v_secondOf dtb_u_u1710)) in (let dtb_u_u1713 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u1712)) (B_dData_dPair.v_firstOf dtb_u_u1710)) in (match (Elab_dDriver.v_elabProgramFull dtb_u_u1713) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1714) -> (let dtb_u_u1716 = (Base_dDiag.C_Check_ErrC (dtb_u_u1714)) in dtb_u_u1716)
  | Base_dDiag.C_Check_OkC (dtb_u_u1718) -> (let dtb_u_u1727 = (((((((((((v_splitGenerate_u_udirect nFs) nConsole) nEnv) nProcess) ctx) ((B_dData_dList.v_map (fun (dtb_u_u1726 : Loader_dModules.t_Module) -> { B_dData_dPair.f_Pair_first = (Loader_dModules.v_moduleNameOf dtb_u_u1726); B_dData_dPair.f_Pair_second = (Loader_dModules.v_moduleDeclsOf dtb_u_u1726) })) dtb_u_u1712)) (B_dData_dPair.v_firstOf dtb_u_u1710)) dtb_u_u1718) printResult) B_dData_dList.C_List_Nil) _u_ueffTok) in (let dtb_u_u1729 = (match dtb_u_u1727 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1731) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1731))
  | Base_dDiag.C_Check_OkC (dtb_u_u1732) -> (let dtb_u_u1733 = ((B_dData_dList.v_append dtb_u_u1711) (Elab_dTypes.v_dtProgWarnings dtb_u_u1718)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1732; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb_u_u1718; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf dtb_u_u1710); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf dtb_u_u1710); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = dtb_u_u1733 } })))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1729))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))

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
let v_dtCheckSourceIncrementalWith = (fun (dtb_u_u1772 : string) (dtb_u_u1773 : string) (dtb_u_u1774 : string) (dtb_u_u1775 : string) (dtb_u_u1776 : string) (dtb_u_u1783 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1784 : string) (dtb_u_u1785 : string) (dtb_u_u1786 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1787 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1788 : t_AuxCache B_dData_dMaybe.t_Maybe) (dtb_u_u1789 : bool) (dtb_u_u1790 : string B_dData_dMaybe.t_Maybe) -> (let dtb_u_u1791 = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1783) in (let dtb_u_u1792 = ((B_dData_dList.v_append (v_modulesOfIfaces dtb_u_u1786)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) dtb_u_u1787))) in (let dtb_u_u1793 = ((B_dData_dList.v_append dtb_u_u1786) dtb_u_u1787) in (Obj.repr ((fun (dtb_u_u1798 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1801 = ((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded_u_udirect dtb_u_u1772) dtb_u_u1783) dtb_u_u1784) dtb_u_u1785) dtb_u_u1792) dtb_u_u1798) in (let dtb_u_u1803 = (match dtb_u_u1801 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1805) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1805))
  | Base_dDiag.C_Check_OkC (dtb_u_u1806) -> (match ((v_filterProjectToImports dtb_u_u1791) dtb_u_u1806) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1807; B_dData_dPair.f_Pair_second = dtb_u_u1808 } -> (let dtb_u_u1809 = (((v_missingDepModules dtb_u_u1791) dtb_u_u1808) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u1793)) in (let dtb_u_u1810 = (if ((B_dData_dList.v_length dtb_u_u1809) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=check-incremental missing=" ^ ((B_dData_dString.v_join ",") dtb_u_u1809))) else 0) else 0) in (if ((B_dData_dList.v_length dtb_u_u1809) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u1788 } } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u1783)) ((v_preloadKeepOf dtb_u_u1793) dtb_u_u1808)) dtb_u_u1807) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1811) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1811))
  | Base_dDiag.C_Check_OkC (dtb_u_u1812) -> (match (((((((v_dtIncrementalCheckedCore dtb_u_u1783) dtb_u_u1812) (((v_materializedDeps dtb_u_u1791) (B_dData_dPair.v_secondOf dtb_u_u1812)) dtb_u_u1786)) (((v_materializedOwn dtb_u_u1791) (B_dData_dPair.v_secondOf dtb_u_u1812)) dtb_u_u1787)) dtb_u_u1788) dtb_u_u1789) dtb_u_u1790) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1813) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1813))
  | Base_dDiag.C_Check_OkC (dtb_u_u1814) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u1814 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1803)))))))))

# 1545 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceIncrementalWith_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) (unusedFile : string B_dData_dMaybe.t_Maybe) _u_ueffTok -> (let dtb_u_u1791 = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let dtb_u_u1792 = ((B_dData_dList.v_append (v_modulesOfIfaces depIfaces)) (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) cleanIfaces))) in (let dtb_u_u1793 = ((B_dData_dList.v_append depIfaces) cleanIfaces) in (let dtb_u_u1801 = ((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded_u_udirect nFs) ctx) label) source) dtb_u_u1792) _u_ueffTok) in (let dtb_u_u1803 = (match dtb_u_u1801 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1805) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1805))
  | Base_dDiag.C_Check_OkC (dtb_u_u1806) -> (match ((v_filterProjectToImports dtb_u_u1791) dtb_u_u1806) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1807; B_dData_dPair.f_Pair_second = dtb_u_u1808 } -> (let dtb_u_u1809 = (((v_missingDepModules dtb_u_u1791) dtb_u_u1808) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u1793)) in (let dtb_u_u1810 = (if ((B_dData_dList.v_length dtb_u_u1809) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=check-incremental missing=" ^ ((B_dData_dString.v_join ",") dtb_u_u1809))) else 0) else 0) in (if ((B_dData_dList.v_length dtb_u_u1809) > 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = cache } } })) else (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf dtb_u_u1793) dtb_u_u1808)) dtb_u_u1807) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1811) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1811))
  | Base_dDiag.C_Check_OkC (dtb_u_u1812) -> (match (((((((v_dtIncrementalCheckedCore ctx) dtb_u_u1812) (((v_materializedDeps dtb_u_u1791) (B_dData_dPair.v_secondOf dtb_u_u1812)) depIfaces)) (((v_materializedOwn dtb_u_u1791) (B_dData_dPair.v_secondOf dtb_u_u1812)) cleanIfaces)) cache) needPackage) unusedFile) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1813) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1813))
  | Base_dDiag.C_Check_OkC (dtb_u_u1814) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u1814 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1803))))))

# 1534 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) -> (((((((((((((v_dtCheckSourceIncrementalWith nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) cleanIfaces) cache) needPackage) B_dData_dMaybe.C_Maybe_Nothing))

# 1534 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceIncremental_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) _u_ueffTok -> ((Obj.magic (((((((((((((v_dtCheckSourceIncrementalWith nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) cleanIfaces) cache) needPackage) B_dData_dMaybe.C_Maybe_Nothing)) _u_ueffTok))

# 1541 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckEntrySourceIncremental = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((((((((((((v_dtCheckSourceIncrementalWith nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) cleanIfaces) cache) false) (B_dData_dMaybe.C_Maybe_Just (label))))

# 1541 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckEntrySourceIncremental_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) _u_ueffTok -> ((Obj.magic (((((((((((((v_dtCheckSourceIncrementalWith nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) cleanIfaces) cache) false) (B_dData_dMaybe.C_Maybe_Just (label)))) _u_ueffTok))

# 1608 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalSourceIncremental = (fun (dtb_u_u1850 : string) (dtb_u_u1851 : string) (dtb_u_u1852 : string) (dtb_u_u1853 : string) (dtb_u_u1854 : string) (dtb_u_u1861 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1862 : string) (dtb_u_u1863 : string) (dtb_u_u1864 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1865 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (Obj.repr ((fun (dtb_u_u1870 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1873 = (((((((((((((v_dtCheckSourceIncremental_u_udirect dtb_u_u1850) dtb_u_u1851) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854) dtb_u_u1861) dtb_u_u1862) dtb_u_u1863) dtb_u_u1864) B_dData_dList.C_List_Nil) dtb_u_u1865) true) dtb_u_u1870) in (let dtb_u_u1875 = (match dtb_u_u1873 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1877) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1877))
  | Base_dDiag.C_Check_OkC (dtb_u_u1878) -> (match (B_dData_dPair.v_secondOf dtb_u_u1878) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1879; B_dData_dPair.f_Pair_second = dtb_u_u1880 } -> (match (B_dData_dPair.v_firstOf dtb_u_u1880) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1881) -> (match (v_evalDtMain (dtb_u_u1881).f_CheckedPackage_checkedProgram) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1882) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1882))
  | Base_dDiag.C_Check_OkC (dtb_u_u1883) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1878); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1883; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1880) } }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1878); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1880) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1875))))))

# 1608 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalSourceIncremental_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) _u_ueffTok -> (let dtb_u_u1873 = (((((((((((((v_dtCheckSourceIncremental_u_udirect nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) B_dData_dList.C_List_Nil) cache) true) _u_ueffTok) in (let dtb_u_u1875 = (match dtb_u_u1873 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1877) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1877))
  | Base_dDiag.C_Check_OkC (dtb_u_u1878) -> (match (B_dData_dPair.v_secondOf dtb_u_u1878) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1879; B_dData_dPair.f_Pair_second = dtb_u_u1880 } -> (match (B_dData_dPair.v_firstOf dtb_u_u1880) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1881) -> (match (v_evalDtMain (dtb_u_u1881).f_CheckedPackage_checkedProgram) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1882) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1882))
  | Base_dDiag.C_Check_OkC (dtb_u_u1883) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1878); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1883; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1880) } }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1878); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1880) } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1875)))

# 1735 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectIncremental = (fun (dtb_u_u1884 : string) (dtb_u_u1885 : string) (dtb_u_u1886 : string) (dtb_u_u1887 : string) (dtb_u_u1888 : string) (dtb_u_u1889 : string) (dtb_u_u1897 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1898 : string) (dtb_u_u1899 : bool) (dtb_u_u1900 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1901 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u1906 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1909 = ((((((((v_dtLoadPartsIncremental_u_udirect dtb_u_u1884) dtb_u_u1886) dtb_u_u1887) dtb_u_u1897) dtb_u_u1898) dtb_u_u1900) dtb_u_u1901) dtb_u_u1906) in (match dtb_u_u1909 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1910) -> (let dtb_u_u1912 = (Base_dDiag.C_Check_ErrC (dtb_u_u1910)) in dtb_u_u1912)
  | Base_dDiag.C_Check_OkC (dtb_u_u1914) -> (let dtb_u_u1915 = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1897) in (let dtb_u_u1916 = (B_dData_dPair.v_secondOf dtb_u_u1914) in (let dtb_u_u1917 = (((v_materializedOwn dtb_u_u1915) dtb_u_u1916) (Driver_dIface.v_restoreDefLocsSpans dtb_u_u1901)) in (let dtb_u_u1918 = (((v_materializedDeps dtb_u_u1915) dtb_u_u1916) (Driver_dIface.v_restoreDefLocsSpans dtb_u_u1900)) in (match ((((v_dtIncrementalChecked dtb_u_u1897) dtb_u_u1914) dtb_u_u1918) dtb_u_u1917) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1919) -> (let dtb_u_u1921 = (Base_dDiag.C_Check_ErrC (dtb_u_u1919)) in dtb_u_u1921)
  | Base_dDiag.C_Check_OkC (dtb_u_u1923) -> ((Obj.magic ((((((((((v_dtGenerateIncremental dtb_u_u1884) dtb_u_u1885) dtb_u_u1886) dtb_u_u1887) dtb_u_u1897) dtb_u_u1898) dtb_u_u1916) dtb_u_u1923) dtb_u_u1899) B_dData_dList.C_List_Nil)) dtb_u_u1906)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1735 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectIncremental_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1909 = ((((((((v_dtLoadPartsIncremental_u_udirect nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces) _u_ueffTok) in (match dtb_u_u1909 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1910) -> (let dtb_u_u1912 = (Base_dDiag.C_Check_ErrC (dtb_u_u1910)) in dtb_u_u1912)
  | Base_dDiag.C_Check_OkC (dtb_u_u1914) -> (let dtb_u_u1915 = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let dtb_u_u1916 = (B_dData_dPair.v_secondOf dtb_u_u1914) in (let dtb_u_u1917 = (((v_materializedOwn dtb_u_u1915) dtb_u_u1916) (Driver_dIface.v_restoreDefLocsSpans cleanIfaces)) in (let dtb_u_u1918 = (((v_materializedDeps dtb_u_u1915) dtb_u_u1916) (Driver_dIface.v_restoreDefLocsSpans depIfaces)) in (match ((((v_dtIncrementalChecked ctx) dtb_u_u1914) dtb_u_u1918) dtb_u_u1917) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1919) -> (let dtb_u_u1921 = (Base_dDiag.C_Check_ErrC (dtb_u_u1919)) in dtb_u_u1921)
  | Base_dDiag.C_Check_OkC (dtb_u_u1923) -> ((Obj.magic ((((((((((v_dtGenerateIncremental nFs) nConsole) nEnv) nProcess) ctx) entry) dtb_u_u1916) dtb_u_u1923) printResult) B_dData_dList.C_List_Nil)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))

# 1865 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalTestEntry = (fun (dtb_u_u1924 : string) (dtb_u_u1925 : string) (dtb_u_u1926 : string) (dtb_u_u1931 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1932 : string) (dtb_u_u1933 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (dtb_u_u1934 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> (match dtb_u_u1933 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1935) -> (let dtb_u_u1936 = (v_maybeIfaces dtb_u_u1934) in (Obj.repr ((fun (dtb_u_u1941 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1944 = ((((((((v_dtLoadPartsIncremental_u_udirect dtb_u_u1924) dtb_u_u1925) dtb_u_u1926) dtb_u_u1931) dtb_u_u1932) dtb_u_u1935) dtb_u_u1936) dtb_u_u1941) in (let dtb_u_u1946 = (match dtb_u_u1944 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1948) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1948))
  | Base_dDiag.C_Check_OkC (dtb_u_u1949) -> (let dtb_u_u1950 = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1931) in (let dtb_u_u1951 = (((v_materializedDeps dtb_u_u1950) (B_dData_dPair.v_secondOf dtb_u_u1949)) dtb_u_u1935) in (let dtb_u_u1952 = (((v_materializedOwn dtb_u_u1950) (B_dData_dPair.v_secondOf dtb_u_u1949)) dtb_u_u1936) in (let dtb_u_u1953 = (((((((v_dtIncrementalCheckedCore dtb_u_u1931) dtb_u_u1949) dtb_u_u1951) dtb_u_u1952) B_dData_dMaybe.C_Maybe_Nothing) true) B_dData_dMaybe.C_Maybe_Nothing) in (match dtb_u_u1953 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1954) -> (match dtb_u_u1954 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1955; B_dData_dPair.f_Pair_second = dtb_u_u1956 } -> (match dtb_u_u1956 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1957; B_dData_dPair.f_Pair_second = dtb_u_u1958 } -> (match dtb_u_u1957 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1959) -> ((v_testEntryOutcome dtb_u_u1932) (dtb_u_u1959).f_CheckedPackage_checkedProgram)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "test-entry-package")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u1960) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1960))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1946))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_dtEvalTestEntryFull dtb_u_u1924) dtb_u_u1925) dtb_u_u1926) dtb_u_u1931) dtb_u_u1932)
  | _ -> failwith "DT: impossible branch"
))

# 1865 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtEvalTestEntry_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : string) (mc2 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (mc3 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) _u_ueffTok -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1935) -> (let dtb_u_u1936 = (v_maybeIfaces mc3) in (let dtb_u_u1944 = ((((((((v_dtLoadPartsIncremental_u_udirect nFs) nEnv) nProcess) mc0) mc1) dtb_u_u1935) dtb_u_u1936) _u_ueffTok) in (let dtb_u_u1946 = (match dtb_u_u1944 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1948) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1948))
  | Base_dDiag.C_Check_OkC (dtb_u_u1949) -> (let dtb_u_u1950 = (Frontend_dPackages_dPkg.v_contextPackageName mc0) in (let dtb_u_u1951 = (((v_materializedDeps dtb_u_u1950) (B_dData_dPair.v_secondOf dtb_u_u1949)) dtb_u_u1935) in (let dtb_u_u1952 = (((v_materializedOwn dtb_u_u1950) (B_dData_dPair.v_secondOf dtb_u_u1949)) dtb_u_u1936) in (let dtb_u_u1953 = (((((((v_dtIncrementalCheckedCore mc0) dtb_u_u1949) dtb_u_u1951) dtb_u_u1952) B_dData_dMaybe.C_Maybe_Nothing) true) B_dData_dMaybe.C_Maybe_Nothing) in (match dtb_u_u1953 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1954) -> (match dtb_u_u1954 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1955; B_dData_dPair.f_Pair_second = dtb_u_u1956 } -> (match dtb_u_u1956 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1957; B_dData_dPair.f_Pair_second = dtb_u_u1958 } -> (match dtb_u_u1957 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1959) -> ((v_testEntryOutcome mc1) (dtb_u_u1959).f_CheckedPackage_checkedProgram)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "test-entry-package")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u1960) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1960))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1946)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((v_dtEvalTestEntryFull nFs) nEnv) nProcess) mc0) mc1)) _u_ueffTok)
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
let v_dtCheckPackageIncrementalParts = (fun (dtb_u_u1992 : string) (dtb_u_u1993 : string) (dtb_u_u1994 : string) (dtb_u_u1999 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2000 : string) (dtb_u_u2001 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u2002 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2007 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2010 = ((((((((v_dtLoadPartsIncremental_u_udirect dtb_u_u1992) dtb_u_u1993) dtb_u_u1994) dtb_u_u1999) dtb_u_u2000) dtb_u_u2001) dtb_u_u2002) dtb_u_u2007) in (let dtb_u_u2012 = (match dtb_u_u2010 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2014) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2014))
  | Base_dDiag.C_Check_OkC (dtb_u_u2015) -> (match ((((v_dtIncrementalChecked dtb_u_u1999) dtb_u_u2015) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1999)) (B_dData_dPair.v_secondOf dtb_u_u2015)) dtb_u_u2001)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1999)) (B_dData_dPair.v_secondOf dtb_u_u2015)) dtb_u_u2002)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2016) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2016))
  | Base_dDiag.C_Check_OkC (dtb_u_u2017) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForPackage dtb_u_u1999)) { B_dData_dPair.f_Pair_first = (dtb_u_u2017).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb_u_u2017 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2012))))))

# 1639 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPackageIncrementalParts_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2010 = ((((((((v_dtLoadPartsIncremental_u_udirect nFs) nEnv) nProcess) ctx) entry) depIfaces) cleanIfaces) _u_ueffTok) in (let dtb_u_u2012 = (match dtb_u_u2010 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2014) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2014))
  | Base_dDiag.C_Check_OkC (dtb_u_u2015) -> (match ((((v_dtIncrementalChecked ctx) dtb_u_u2015) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u2015)) depIfaces)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u2015)) cleanIfaces)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2016) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2016))
  | Base_dDiag.C_Check_OkC (dtb_u_u2017) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForPackage ctx)) { B_dData_dPair.f_Pair_first = (dtb_u_u2017).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb_u_u2017 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2012)))

# 2170 "Vuna/Compiler/Driver/Dt.vuna"
let v_unusedWarnsForLibrary = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (mods : Loader_dModules.t_Module B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let own = (((v_packageDefsOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) mods) defs) in (let pub = ((v_pkgExportedNamesOf ctx) mods) in ((v_warnUnusedDefsKeeping (fun (n : string) -> ((B_dData_dList.v_memName n) pub))) own))))

# 1944 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageIncrementalParts = (fun (dtb_u_u2024 : string) (dtb_u_u2025 : string) (dtb_u_u2026 : string) (dtb_u_u2031 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2032 : string B_dData_dList.t_List) (dtb_u_u2033 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u2034 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2039 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2042 = ((((((((v_dtLoadModulesPartsIncremental_u_udirect dtb_u_u2024) dtb_u_u2025) dtb_u_u2026) dtb_u_u2031) dtb_u_u2032) dtb_u_u2033) dtb_u_u2034) dtb_u_u2039) in (let dtb_u_u2044 = (match dtb_u_u2042 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2046) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2046))
  | Base_dDiag.C_Check_OkC (dtb_u_u2047) -> (match ((((v_dtIncrementalChecked dtb_u_u2031) dtb_u_u2047) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2031)) (B_dData_dPair.v_secondOf dtb_u_u2047)) dtb_u_u2033)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2031)) (B_dData_dPair.v_secondOf dtb_u_u2047)) dtb_u_u2034)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2048) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2048))
  | Base_dDiag.C_Check_OkC (dtb_u_u2049) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForLibrary dtb_u_u2031)) { B_dData_dPair.f_Pair_first = (dtb_u_u2049).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb_u_u2049 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2044))))))

# 1944 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageIncrementalParts_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2042 = ((((((((v_dtLoadModulesPartsIncremental_u_udirect nFs) nEnv) nProcess) ctx) names) depIfaces) cleanIfaces) _u_ueffTok) in (let dtb_u_u2044 = (match dtb_u_u2042 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2046) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2046))
  | Base_dDiag.C_Check_OkC (dtb_u_u2047) -> (match ((((v_dtIncrementalChecked ctx) dtb_u_u2047) (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u2047)) depIfaces)) (((v_materializedOwn (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u2047)) cleanIfaces)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2048) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2048))
  | Base_dDiag.C_Check_OkC (dtb_u_u2049) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForLibrary ctx)) { B_dData_dPair.f_Pair_first = (dtb_u_u2049).f_CheckedPackage_checkedWarnings; B_dData_dPair.f_Pair_second = dtb_u_u2049 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2044)))

# 2181 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckRecovering = (fun (dtb_u_u2050 : string) (dtb_u_u2051 : string) (dtb_u_u2052 : string) (dtb_u_u2057 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2058 : string) -> (Obj.repr ((fun (dtb_u_u2063 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2066 = ((((((v_dtLoad_u_udirect dtb_u_u2050) dtb_u_u2051) dtb_u_u2052) dtb_u_u2057) dtb_u_u2058) dtb_u_u2063) in (let dtb_u_u2068 = (match dtb_u_u2066 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2070) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2070))
  | Base_dDiag.C_Check_OkC (dtb_u_u2071) -> (Elab_dDriver.v_elabProgramErrors (B_dData_dPair.v_firstOf dtb_u_u2071))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2068))))))

# 2181 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckRecovering_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u2066 = ((((((v_dtLoad_u_udirect nFs) nEnv) nProcess) ctx) entry) _u_ueffTok) in (let dtb_u_u2068 = (match dtb_u_u2066 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2070) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2070))
  | Base_dDiag.C_Check_OkC (dtb_u_u2071) -> (Elab_dDriver.v_elabProgramErrors (B_dData_dPair.v_firstOf dtb_u_u2071))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2068)))

# 2192 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryRecovering = (fun (dtb_u_u2072 : string) (dtb_u_u2073 : string) (dtb_u_u2074 : string) (dtb_u_u2079 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2080 : string B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2085 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2088 = ((((((v_dtLoadModulesParts_u_udirect dtb_u_u2072) dtb_u_u2073) dtb_u_u2074) dtb_u_u2079) dtb_u_u2080) dtb_u_u2085) in (let dtb_u_u2090 = (match dtb_u_u2088 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2092) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2092))
  | Base_dDiag.C_Check_OkC (dtb_u_u2093) -> (Elab_dDriver.v_elabProgramErrors (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u2093)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2090))))))

# 2192 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryRecovering_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2088 = ((((((v_dtLoadModulesParts_u_udirect nFs) nEnv) nProcess) ctx) names) _u_ueffTok) in (let dtb_u_u2090 = (match dtb_u_u2088 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2092) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2092))
  | Base_dDiag.C_Check_OkC (dtb_u_u2093) -> (Elab_dDriver.v_elabProgramErrors (v_dtProjectDecls (B_dData_dPair.v_secondOf dtb_u_u2093)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2090)))

# 2204 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkDtProgramOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.lower") (fun (_u : int) -> (((Lowering_dProgram.v_lowerProgramOf datas) defs) globals)))) (fun (programIr : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.gen") (fun (_u : int) -> ((Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts (Vuna_dIr_dModel.v_irProgSharedOf programIr)) (Vuna_dIr_dModel.v_irProgUnitOf programIr))))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (0)))))))

# 141 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkDeclsWithWarns = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "decls-ready") else 0) in (match ((Base_dObs.v_obsCheck "vuna.elab") (fun (_u : int) -> (Elab_dDriver.v_elabProgramFull ((Base_dObs.v_obsPure "vuna.elab.rast") (fun (_u : int) -> decls))))) with
  | Base_dDiag.C_Check_ErrC (dtb__543) -> (Base_dDiag.C_Check_ErrC (dtb__543))
  | Base_dDiag.C_Check_OkC (dtb__544) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "elab-done") else 0) in ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (_u : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb__544)) (Elab_dTypes.v_dtProgDefs dtb__544)) (Elab_dTypes.v_dtProgGlobals dtb__544)) with
  | Base_dDiag.C_Check_ErrC (dtb__545) -> (Obj.magic (Base_dDiag.C_Check_ErrC (dtb__545)))
  | Base_dDiag.C_Check_OkC (dtb__546) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "codegen-check-done") else 0) in (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append loaderWarns) ((B_dData_dList.v_append (Elab_dTypes.v_dtProgWarnings dtb__544)) (v_warnUnusedDefsIn (Elab_dTypes.v_dtProgDefs dtb__544)))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))

# 131 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckDecls = (fun (dtb_u_u2114 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (Obj.repr ((fun (dtb_u_u2119 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2120 = Obj.obj (dtb_u_u2114) in (let dtb_u_u2122 = (dtb_u_u2120 dtb_u_u2119) in (let dtb_u_u2124 = (match dtb_u_u2122 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2126) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2126))
  | Base_dDiag.C_Check_OkC (dtb_u_u2127) -> ((v_checkDeclsWithWarns (B_dData_dPair.v_secondOf dtb_u_u2127)) (B_dData_dPair.v_firstOf dtb_u_u2127))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2124)))))))

# 131 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckDecls_u_udirect = (fun (loaded : (Frontend_dAst.t_Decl B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) _u_ueffTok -> (let dtb_u_u2120 = Obj.obj (loaded) in (let dtb_u_u2122 = (dtb_u_u2120 _u_ueffTok) in (let dtb_u_u2124 = (match dtb_u_u2122 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2126) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2126))
  | Base_dDiag.C_Check_OkC (dtb_u_u2127) -> ((v_checkDeclsWithWarns (B_dData_dPair.v_secondOf dtb_u_u2127)) (B_dData_dPair.v_firstOf dtb_u_u2127))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2124))))

# 173 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPartsWithProgram = (fun (dtb_u_u2129 : string) (dtb_u_u2130 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) -> (Obj.repr ((fun (dtb_u_u2135 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2136 = Obj.obj (dtb_u_u2130) in (let dtb_u_u2138 = (dtb_u_u2136 dtb_u_u2135) in (let dtb_u_u2140 = (match dtb_u_u2138 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2142) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2142))
  | Base_dDiag.C_Check_OkC (dtb_u_u2143) -> (let dtb_u_u2144 = (B_dData_dPair.v_secondOf dtb_u_u2143) in (let dtb_u_u2145 = (B_dData_dPair.v_firstOf dtb_u_u2143) in (let dtb_u_u2146 = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf dtb_u_u2144)) (B_dData_dPair.v_firstOf dtb_u_u2144)) in (match ((Base_dObs.v_obsCheck "vuna.elab") (fun (dtb_u_u2147 : int) -> (Elab_dDriver.v_elabProgramFull ((Base_dObs.v_obsPure "vuna.elab.rast") (fun (dtb_u_u2148 : int) -> dtb_u_u2146))))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2149) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2149))
  | Base_dDiag.C_Check_OkC (dtb_u_u2150) -> (let dtb_u_u2151 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "elab-done") else 0) in (let dtb_u_u2152 = ((B_dData_dList.v_append dtb_u_u2145) (Elab_dTypes.v_dtProgWarnings dtb_u_u2150)) in ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (dtb_u_u2153 : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb_u_u2150)) (Elab_dTypes.v_dtProgDefs dtb_u_u2150)) (Elab_dTypes.v_dtProgGlobals dtb_u_u2150)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2154) -> (Obj.magic (Base_dDiag.C_Check_ErrC (dtb_u_u2154)))
  | Base_dDiag.C_Check_OkC (dtb_u_u2155) -> (let dtb_u_u2156 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "codegen-check-done") else 0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2152; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb_u_u2150; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf dtb_u_u2144); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf dtb_u_u2144); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = dtb_u_u2152 } })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2140)))))))

# 173 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPartsWithProgram_u_udirect = (fun (pkg : string) (loaded : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair Base_dDiag.t_Check B_dEffect_dCore.t_Eff) _u_ueffTok -> (let dtb_u_u2136 = Obj.obj (loaded) in (let dtb_u_u2138 = (dtb_u_u2136 _u_ueffTok) in (let dtb_u_u2140 = (match dtb_u_u2138 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2142) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2142))
  | Base_dDiag.C_Check_OkC (dtb_u_u2143) -> (let dtb_u_u2144 = (B_dData_dPair.v_secondOf dtb_u_u2143) in (let dtb_u_u2145 = (B_dData_dPair.v_firstOf dtb_u_u2143) in (let dtb_u_u2146 = ((v_sealOpaqueDecls (B_dData_dPair.v_secondOf dtb_u_u2144)) (B_dData_dPair.v_firstOf dtb_u_u2144)) in (match ((Base_dObs.v_obsCheck "vuna.elab") (fun (dtb_u_u2147 : int) -> (Elab_dDriver.v_elabProgramFull ((Base_dObs.v_obsPure "vuna.elab.rast") (fun (dtb_u_u2148 : int) -> dtb_u_u2146))))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2149) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2149))
  | Base_dDiag.C_Check_OkC (dtb_u_u2150) -> (let dtb_u_u2151 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "elab-done") else 0) in (let dtb_u_u2152 = ((B_dData_dList.v_append dtb_u_u2145) (Elab_dTypes.v_dtProgWarnings dtb_u_u2150)) in ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (dtb_u_u2153 : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb_u_u2150)) (Elab_dTypes.v_dtProgDefs dtb_u_u2150)) (Elab_dTypes.v_dtProgGlobals dtb_u_u2150)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2154) -> (Obj.magic (Base_dDiag.C_Check_ErrC (dtb_u_u2154)))
  | Base_dDiag.C_Check_OkC (dtb_u_u2155) -> (let dtb_u_u2156 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "codegen-check-done") else 0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2152; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb_u_u2150; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf dtb_u_u2144); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf dtb_u_u2144); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = dtb_u_u2152 } })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2140))))

# 163 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckWithProgramParts = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)))

# 163 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckWithProgramParts_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> ((Obj.magic ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry))) _u_ueffTok))

# 167 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryWithProgramParts = (fun (dtb_u_u2166 : string) (dtb_u_u2167 : string) (dtb_u_u2168 : string) (dtb_u_u2173 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2174 : string B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2179 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2182 = (((v_dtCheckPartsWithProgram_u_udirect (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2173)) (((((v_dtLoadModulesParts dtb_u_u2166) dtb_u_u2167) dtb_u_u2168) dtb_u_u2173) dtb_u_u2174)) dtb_u_u2179) in (let dtb_u_u2184 = ((v_addUnusedWarns (v_unusedWarnsForLibrary dtb_u_u2173)) dtb_u_u2182) in dtb_u_u2184))))))

# 167 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryWithProgramParts_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2182 = (((v_dtCheckPartsWithProgram_u_udirect (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (((((v_dtLoadModulesParts nFs) nEnv) nProcess) ctx) names)) _u_ueffTok) in (let dtb_u_u2184 = ((v_addUnusedWarns (v_unusedWarnsForLibrary ctx)) dtb_u_u2182) in dtb_u_u2184)))

# 249 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheck = (fun (dtb_u_u2186 : string) (dtb_u_u2187 : string) (dtb_u_u2188 : string) (dtb_u_u2193 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2194 : string) -> (Obj.repr ((fun (dtb_u_u2199 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2202 = ((((((v_dtLoadPartsForCheck_u_udirect dtb_u_u2186) dtb_u_u2187) dtb_u_u2188) dtb_u_u2193) dtb_u_u2194) dtb_u_u2199) in (let dtb_u_u2204 = (match dtb_u_u2202 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2206) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2206))
  | Base_dDiag.C_Check_OkC (dtb_u_u2207) -> (let dtb_u_u2208 = (B_dData_dPair.v_secondOf dtb_u_u2207) in (let dtb_u_u2209 = (B_dData_dPair.v_secondOf dtb_u_u2208) in (let dtb_u_u2210 = ((v_sealOpaqueDecls dtb_u_u2209) (B_dData_dPair.v_firstOf dtb_u_u2208)) in ((v_checkDeclsWithWarns (B_dData_dPair.v_firstOf dtb_u_u2207)) dtb_u_u2210))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2204))))))

# 249 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheck_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> (let dtb_u_u2202 = ((((((v_dtLoadPartsForCheck_u_udirect nFs) nEnv) nProcess) ctx) entry) _u_ueffTok) in (let dtb_u_u2204 = (match dtb_u_u2202 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2206) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2206))
  | Base_dDiag.C_Check_OkC (dtb_u_u2207) -> (let dtb_u_u2208 = (B_dData_dPair.v_secondOf dtb_u_u2207) in (let dtb_u_u2209 = (B_dData_dPair.v_secondOf dtb_u_u2208) in (let dtb_u_u2210 = ((v_sealOpaqueDecls dtb_u_u2209) (B_dData_dPair.v_firstOf dtb_u_u2208)) in ((v_checkDeclsWithWarns (B_dData_dPair.v_firstOf dtb_u_u2207)) dtb_u_u2210))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2204)))

# 1057 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckOursParts = (fun (ctx : Frontend_dPackages_dPkg.t_PackageContext) (resolved : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (deps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let parts = (B_dData_dPair.v_secondOf resolved) in (let loaderWarns = (B_dData_dPair.v_firstOf resolved) in (let pkgName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) in (let modules = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf parts)) in (let ours = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) = pkgName))) modules) in (let depsOnly = ((B_dData_dList.v_filter (fun (m : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf m) <> pkgName))) modules) in (let decls = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) ours)) (B_dData_dPair.v_firstOf parts)) in (let termAux = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) depsOnly) in (let start = (v_depStartOf deps) in ((Base_dCommon.v_bind ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf start)) (B_dData_dPair.v_secondOf start)) termAux) decls)) (fun (prog : Elab_dTypes.t_DtProgram) -> (let allDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) deps)) (Elab_dTypes.v_dtProgDatas prog)) in ((Base_dCommon.v_bind (((v_checkDtProgramOf allDatas) (Elab_dTypes.v_dtProgDefs prog)) (Elab_dTypes.v_dtProgGlobals prog))) (fun (_u : int) -> (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = warns; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = prog; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf deps); f_CheckedPackage_checkedWarnings = warns } }))))))))))))))))))

# 396 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceWithIfaces = (fun (dtb_u_u2229 : string) (dtb_u_u2230 : string) (dtb_u_u2231 : string) (dtb_u_u2236 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2237 : string) (dtb_u_u2238 : string) (dtb_u_u2239 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let dtb_u_u2240 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-source=check modules=" ^ (string_of_int (B_dData_dList.v_length dtb_u_u2239)))) else 0) in (Obj.repr ((fun (dtb_u_u2245 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2248 = ((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded_u_udirect dtb_u_u2229) dtb_u_u2236) dtb_u_u2237) dtb_u_u2238) (v_modulesOfIfaces dtb_u_u2239)) dtb_u_u2245) in (match dtb_u_u2248 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2249) -> (let dtb_u_u2251 = (Base_dDiag.C_Check_ErrC (dtb_u_u2249)) in dtb_u_u2251)
  | Base_dDiag.C_Check_OkC (dtb_u_u2253) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2236)) dtb_u_u2253) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2254; B_dData_dPair.f_Pair_second = dtb_u_u2255 } -> (let dtb_u_u2256 = (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2236)) dtb_u_u2255) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u2239)) in (let dtb_u_u2257 = (if ((B_dData_dList.v_length dtb_u_u2256) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=check missing=" ^ ((B_dData_dString.v_join ",") dtb_u_u2256))) else 0) else 0) in (if ((B_dData_dList.v_length dtb_u_u2256) = 0) then (let dtb_u_u2259 = (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u2236)) ((v_preloadKeepOf dtb_u_u2239) dtb_u_u2255)) dtb_u_u2254) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2261) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2261))
  | Base_dDiag.C_Check_OkC (dtb_u_u2262) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2236)) (B_dData_dPair.v_secondOf dtb_u_u2262)) (Driver_dIface.v_restoreDefLocsSpans dtb_u_u2239))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2263) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2263))
  | Base_dDiag.C_Check_OkC (dtb_u_u2264) -> (match (((v_dtCheckOursParts dtb_u_u2236) dtb_u_u2262) dtb_u_u2264) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2265) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2265))
  | Base_dDiag.C_Check_OkC (dtb_u_u2266) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u2266)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2259) else ((Obj.magic ((((((v_dtCheckSource dtb_u_u2229) dtb_u_u2230) dtb_u_u2231) dtb_u_u2236) dtb_u_u2237) dtb_u_u2238)) dtb_u_u2245))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 396 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceWithIfaces_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2240 = (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-source=check modules=" ^ (string_of_int (B_dData_dList.v_length ifaces)))) else 0) in (let dtb_u_u2248 = ((((((Loader_dFlatten.v_loadModuleSourceWithPreloaded_u_udirect nFs) ctx) label) source) (v_modulesOfIfaces ifaces)) _u_ueffTok) in (match dtb_u_u2248 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2249) -> (let dtb_u_u2251 = (Base_dDiag.C_Check_ErrC (dtb_u_u2249)) in dtb_u_u2251)
  | Base_dDiag.C_Check_OkC (dtb_u_u2253) -> (match ((v_filterProjectToImports (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u2253) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2254; B_dData_dPair.f_Pair_second = dtb_u_u2255 } -> (let dtb_u_u2256 = (((v_missingDepModules (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u2255) ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ifaces)) in (let dtb_u_u2257 = (if ((B_dData_dList.v_length dtb_u_u2256) > 0) then (if ((dtp_log_on 3) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 3) "Vuna.Compiler.Driver.Dt") ("iface-fallback=check missing=" ^ ((B_dData_dString.v_join ",") dtb_u_u2256))) else 0) else 0) in (if ((B_dData_dList.v_length dtb_u_u2256) = 0) then (let dtb_u_u2259 = (match (((Loader_dFlatten.v_resolveProjectKeeping (Frontend_dPackages_dPkg.v_contextRelease ctx)) ((v_preloadKeepOf ifaces) dtb_u_u2255)) dtb_u_u2254) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2261) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2261))
  | Base_dDiag.C_Check_OkC (dtb_u_u2262) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u2262)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2263) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2263))
  | Base_dDiag.C_Check_OkC (dtb_u_u2264) -> (match (((v_dtCheckOursParts ctx) dtb_u_u2262) dtb_u_u2264) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2265) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2265))
  | Base_dDiag.C_Check_OkC (dtb_u_u2266) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u2266)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2259) else ((Obj.magic ((((((v_dtCheckSource nFs) nEnv) nProcess) ctx) label) source)) _u_ueffTok))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 1448 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishPackage = (fun (loaderWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (depCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (cleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (prog : Elab_dTypes.t_DtProgram) (parts : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (next : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let assembled = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) cleanCps)) (Elab_dTypes.v_dtProgDatas prog))); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) depCps)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) cleanCps)) (Elab_dTypes.v_dtProgDefs prog))); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals prog); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols prog); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) cleanCps)) (Elab_dTypes.v_dtProgGlobals prog))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts prog); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses prog); Elab_dTypes.f_DtProgram_dtProgNext = (prog).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (prog).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings prog) } in (let warns = ((B_dData_dList.v_append loaderWarns) (Elab_dTypes.v_dtProgWarnings prog)) in (let checked = { f_CheckedPackage_checkedProgram = assembled; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf parts); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf parts); f_CheckedPackage_checkedInherited = (v_cachedNamesOf depCps); f_CheckedPackage_checkedWarnings = warns } in ((Base_dCommon.v_bind (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas assembled)) (Elab_dTypes.v_dtProgDefs assembled)) (Elab_dTypes.v_dtProgGlobals assembled))) (fun (_u : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (checked)); B_dData_dPair.f_Pair_second = next }))))))))

# 1628 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceChecked = (fun (dtb_u_u2277 : string) (dtb_u_u2278 : string) (dtb_u_u2279 : string) (dtb_u_u2284 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2285 : string) (dtb_u_u2286 : string) -> (Obj.repr ((fun (dtb_u_u2291 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2294 = (((((Loader_dFlatten.v_loadModuleSource_u_udirect dtb_u_u2277) dtb_u_u2284) dtb_u_u2285) dtb_u_u2286) dtb_u_u2291) in (match dtb_u_u2294 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2295) -> (let dtb_u_u2297 = (Base_dDiag.C_Check_ErrC (dtb_u_u2295)) in dtb_u_u2297)
  | Base_dDiag.C_Check_OkC (dtb_u_u2299) -> (let dtb_u_u2307 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") dtb_u_u2291) in ((Obj.magic ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2284)) (let dtb_u_u2309 = ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease dtb_u_u2284)) dtb_u_u2299) in (Obj.repr ((fun (dtb_u_u2310 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2309)))))) dtb_u_u2291))
  | _ -> failwith "DT: impossible branch"
))))))

# 1628 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceChecked_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u2294 = (((((Loader_dFlatten.v_loadModuleSource_u_udirect nFs) ctx) label) source) _u_ueffTok) in (match dtb_u_u2294 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2295) -> (let dtb_u_u2297 = (Base_dDiag.C_Check_ErrC (dtb_u_u2295)) in dtb_u_u2297)
  | Base_dDiag.C_Check_OkC (dtb_u_u2299) -> (let dtb_u_u2307 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.resolve") _u_ueffTok) in ((Obj.magic ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (let dtb_u_u2309 = ((Loader_dFlatten.v_resolveProjectWith (Frontend_dPackages_dPkg.v_contextRelease ctx)) dtb_u_u2299) in (Obj.repr ((fun (dtb_u_u2310 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2309)))))) _u_ueffTok))
  | _ -> failwith "DT: impossible branch"
)))

# 287 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckModuleFile = (fun (dtb_u_u2311 : string) (dtb_u_u2312 : string) (dtb_u_u2313 : string) (dtb_u_u2318 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2319 : string) -> (Obj.repr ((fun (dtb_u_u2324 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2327 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u2311) dtb_u_u2319) dtb_u_u2324) in (let dtb_u_u2335 = (((((((v_dtCheckSourceChecked_u_udirect dtb_u_u2311) dtb_u_u2312) dtb_u_u2313) dtb_u_u2318) dtb_u_u2319) dtb_u_u2327) dtb_u_u2324) in (let dtb_u_u2337 = (match dtb_u_u2335 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2339) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2339))
  | Base_dDiag.C_Check_OkC (dtb_u_u2340) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u2340)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2337)))))))

# 287 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckModuleFile_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) _u_ueffTok -> (let dtb_u_u2327 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) path) _u_ueffTok) in (let dtb_u_u2335 = (((((((v_dtCheckSourceChecked_u_udirect nFs) nEnv) nProcess) ctx) path) dtb_u_u2327) _u_ueffTok) in (let dtb_u_u2337 = (match dtb_u_u2335 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2339) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2339))
  | Base_dDiag.C_Check_OkC (dtb_u_u2340) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u2340)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2337))))

# 1914 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPackageWithIfacesParts = (fun (dtb_u_u2341 : string) (dtb_u_u2342 : string) (dtb_u_u2343 : string) (dtb_u_u2348 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2349 : string) (dtb_u_u2350 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2355 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2358 = (((((((v_dtLoadPartsWithIfaces_u_udirect dtb_u_u2341) dtb_u_u2342) dtb_u_u2343) dtb_u_u2348) dtb_u_u2349) dtb_u_u2350) dtb_u_u2355) in (let dtb_u_u2360 = (match dtb_u_u2358 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2362) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2362))
  | Base_dDiag.C_Check_OkC (dtb_u_u2363) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2348)) (B_dData_dPair.v_secondOf dtb_u_u2363)) (Driver_dIface.v_restoreDefLocsSpans dtb_u_u2350))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2364) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2364))
  | Base_dDiag.C_Check_OkC (dtb_u_u2365) -> ((Base_dCommon.v_bind (((v_dtCheckOursParts dtb_u_u2348) dtb_u_u2363) dtb_u_u2365)) (fun (dtb_u_u2366 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForPackage dtb_u_u2348)) dtb_u_u2366)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2360))))))

# 1914 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckPackageWithIfacesParts_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2358 = (((((((v_dtLoadPartsWithIfaces_u_udirect nFs) nEnv) nProcess) ctx) entry) ifaces) _u_ueffTok) in (let dtb_u_u2360 = (match dtb_u_u2358 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2362) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2362))
  | Base_dDiag.C_Check_OkC (dtb_u_u2363) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u2363)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2364) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2364))
  | Base_dDiag.C_Check_OkC (dtb_u_u2365) -> ((Base_dCommon.v_bind (((v_dtCheckOursParts ctx) dtb_u_u2363) dtb_u_u2365)) (fun (dtb_u_u2366 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForPackage ctx)) dtb_u_u2366)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2360)))

# 1957 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageWithIfacesParts = (fun (dtb_u_u2367 : string) (dtb_u_u2368 : string) (dtb_u_u2369 : string) (dtb_u_u2374 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2375 : string B_dData_dList.t_List) (dtb_u_u2376 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2381 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2384 = (((((((v_dtLoadModulesPartsWithIfaces_u_udirect dtb_u_u2367) dtb_u_u2368) dtb_u_u2369) dtb_u_u2374) dtb_u_u2375) dtb_u_u2376) dtb_u_u2381) in (let dtb_u_u2386 = (match dtb_u_u2384 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2388) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2388))
  | Base_dDiag.C_Check_OkC (dtb_u_u2389) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2374)) (B_dData_dPair.v_secondOf dtb_u_u2389)) (Driver_dIface.v_restoreDefLocsSpans dtb_u_u2376))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2390) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2390))
  | Base_dDiag.C_Check_OkC (dtb_u_u2391) -> ((Base_dCommon.v_bind (((v_dtCheckOursParts dtb_u_u2374) dtb_u_u2389) dtb_u_u2391)) (fun (dtb_u_u2392 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForLibrary dtb_u_u2374)) dtb_u_u2392)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2386))))))

# 1957 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckLibraryPackageWithIfacesParts_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2384 = (((((((v_dtLoadModulesPartsWithIfaces_u_udirect nFs) nEnv) nProcess) ctx) names) ifaces) _u_ueffTok) in (let dtb_u_u2386 = (match dtb_u_u2384 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2388) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2388))
  | Base_dDiag.C_Check_OkC (dtb_u_u2389) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u2389)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2390) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2390))
  | Base_dDiag.C_Check_OkC (dtb_u_u2391) -> ((Base_dCommon.v_bind (((v_dtCheckOursParts ctx) dtb_u_u2389) dtb_u_u2391)) (fun (dtb_u_u2392 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair (v_unusedWarnsForLibrary ctx)) dtb_u_u2392)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2386)))

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
