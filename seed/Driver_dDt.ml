open Vuna_runtime
type t_CheckedPackage = { f_CheckedPackage_checkedProgram : Elab_dTypes.t_DtProgram; f_CheckedPackage_checkedModules : Loader_dModules.t_Module B_dData_dList.t_List; f_CheckedPackage_checkedEntryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_CheckedPackage_checkedInherited : string B_dData_dList.t_List; f_CheckedPackage_checkedWarnings : Base_dDiag.t_Diagnostic B_dData_dList.t_List }
and t_GenMeta = { f_GenMeta_genMetaId : int; f_GenMeta_genMetaName : string; f_GenMeta_genMetaKind : Core_dTerm.t_Term }
and t_MainInfo = { f_MainInfo_miKind : string; f_MainInfo_miHostTags : string B_dData_dList.t_List }
and t_AuxCache = { f_AuxCache_auxCacheKey : string; f_AuxCache_auxCacheDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_AuxCache_auxCacheStart : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair; f_AuxCache_auxCacheDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_AuxCache_auxCacheCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List }
and t_DtIncrSetup = { f_DtIncrSetup_dsStartEc : Elab_dTypes.t_Ec; f_DtIncrSetup_dsStartGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtIncrSetup_dsTermAux : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsPrepared : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DtIncrSetup_dsWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_DtIncrSetup_dsDepCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsCleanCps : Driver_dCache.t_CachedProgram B_dData_dList.t_List; f_DtIncrSetup_dsNext : t_AuxCache B_dData_dMaybe.t_Maybe }

# 76 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtProjectDecls = (fun (dtb_u_u1 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf dtb_u_u1)))) (B_dData_dPair.v_firstOf dtb_u_u1)))

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
let rec v_opaqueSigType = (fun (dtb_u_u111 : string) (dtb_u_u112 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u112 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u113, dtb_u_u114) -> (match dtb_u_u113 with
  | Frontend_dAst.C_Decl_DSig (dtb_u_u115, dtb_u_u116, dtb_u_u117, dtb_u_u118) -> (if (dtb_u_u115 = dtb_u_u111) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u117)) else ((v_opaqueSigType dtb_u_u111) dtb_u_u114))
  | _ -> ((v_opaqueSigType dtb_u_u111) dtb_u_u114)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealDeclOf = (fun (dtb_u_u119 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u120 : string) -> (let dtb_u_u121 = (match ((v_opaqueSigType dtb_u_u120) dtb_u_u119) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u122) -> dtb_u_u122
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef v_sealSpan)))
  | _ -> failwith "DT: impossible branch"
) in (Frontend_dAst.C_Decl_DAxiom (("vuna_seal_" ^ dtb_u_u120), dtb_u_u121, (Frontend_dAst.v_detachedNodeRef v_sealSpan)))))

# 218 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_sealAbstractAfter = (fun (dtb_u_u123 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u124 : string B_dData_dList.t_List) -> (match dtb_u_u123 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u125, dtb_u_u126) -> (match dtb_u_u125 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u127, dtb_u_u128, dtb_u_u129, dtb_u_u130) -> (if ((B_dData_dList.v_memName dtb_u_u127) dtb_u_u124) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u125, (B_dData_dList.C_List__x58__x58_ (((v_sealDeclOf (B_dData_dList.C_List__x58__x58_ (dtb_u_u125, dtb_u_u126))) dtb_u_u127), ((v_sealAbstractAfter dtb_u_u126) dtb_u_u124))))) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u125, ((v_sealAbstractAfter dtb_u_u126) dtb_u_u124))))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u125, ((v_sealAbstractAfter dtb_u_u126) dtb_u_u124)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealModule = (fun (dtb_u_u131 : Loader_dModules.t_Module) -> (let dtb_u_u132 = (Loader_dModules.v_moduleDeclsOf dtb_u_u131) in (let dtb_u_u133 = (Loader_dModules.v_moduleOpaqueOf dtb_u_u131) in (let dtb_u_u134 = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_filter Loader_dFlatten.v_isAbstractOpaqueName) dtb_u_u133)) in (let dtb_u_u135 = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_filter (fun (dtb_u_u137 : string) -> (B_dData_dBool.v_not (Loader_dFlatten.v_isAbstractOpaqueName dtb_u_u137)))) dtb_u_u133)) in (let dtb_u_u136 = ((v_sealAbstractAfter dtb_u_u132) dtb_u_u134) in ((B_dData_dList.v_append dtb_u_u136) ((B_dData_dList.v_map (v_sealDeclOf dtb_u_u132)) dtb_u_u135))))))))

# 205 "Vuna/Compiler/Driver/Dt.vuna"
let v_sealOpaqueDecls = (fun (dtb_u_u138 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u139 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) (B_dData_dList.v_reverse dtb_u_u138))) dtb_u_u139))

# 277 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSourceHasModuleHeader = (fun (dtb_u_u140 : string) (dtb_u_u141 : string) -> (match ((Frontend_dParser.v_parseSource dtb_u_u140) dtb_u_u141) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u142) -> false
  | Base_dDiag.C_Check_OkC (dtb_u_u143) -> (let dtb_u_u144 = dtb_u_u143 in (match dtb_u_u144 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb_u_u145; Frontend_dAst.f_SourceFile_sourceFileImports = dtb_u_u146; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb_u_u147; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb_u_u148; Frontend_dAst.f_SourceFile_sourceFileExports = dtb_u_u149; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb_u_u150; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb_u_u151 } -> (match dtb_u_u145 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u152) -> true
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
let[@tail_mod_cons] rec v_missingDepModules = (fun (dtb_u_u199 : string) (dtb_u_u200 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u201 : string B_dData_dList.t_List) -> (match dtb_u_u200 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u202, dtb_u_u203) -> (if (if ((Loader_dModules.v_modulePackageOf dtb_u_u202) <> dtb_u_u199) then (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb_u_u202)) dtb_u_u201)) false) else false) then (B_dData_dList.C_List__x58__x58_ ((Loader_dModules.v_moduleNameOf dtb_u_u202), (((v_missingDepModules dtb_u_u199) dtb_u_u203) dtb_u_u201))) else (((v_missingDepModules dtb_u_u199) dtb_u_u203) dtb_u_u201))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_allocMetas = (fun (dtb_u_u204 : Elab_dTypes.t_Ctx) (dtb_u_u205 : Elab_dTypes.t_Ec) (dtb_u_u206 : int B_dData_dList.t_List) -> (match dtb_u_u206 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u207, dtb_u_u208) -> (match ((Elab_dTypes.v_newMeta dtb_u_u204) dtb_u_u205) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u209; B_dData_dPair.f_Pair_second = dtb_u_u210 } -> (match (((v_allocMetas dtb_u_u204) dtb_u_u210) dtb_u_u208) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u211; B_dData_dPair.f_Pair_second = dtb_u_u212 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u209, dtb_u_u211)); B_dData_dPair.f_Pair_second = dtb_u_u212 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u205 }
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_buildPi = (fun (dtb_u_u213 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u214 : Core_dTerm.t_Term) -> (match dtb_u_u213 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u215, dtb_u_u216) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, dtb_u_u215, ((v_buildPi dtb_u_u216) dtb_u_u214)))
  | B_dData_dList.C_List_Nil -> dtb_u_u214
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_allocTelescopes = (fun (dtb_u_u217 : Elab_dTypes.t_Ctx) (dtb_u_u218 : Elab_dTypes.t_Ec) (dtb_u_u219 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u219 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u220, dtb_u_u221) -> (match dtb_u_u220 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u222; B_dData_dPair.f_Pair_second = dtb_u_u223 } -> (match (((v_allocMetas dtb_u_u217) dtb_u_u218) ((B_dData_dList.v_range 0) dtb_u_u223)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u224; B_dData_dPair.f_Pair_second = dtb_u_u225 } -> (match (((v_allocMetas dtb_u_u217) dtb_u_u225) ((B_dData_dList.v_range 0) 1)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u226; B_dData_dPair.f_Pair_second = dtb_u_u227 } -> (let dtb_u_u228 = dtb_u_u226 in (match dtb_u_u228 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u229, dtb_u_u230) -> (match dtb_u_u230 with
  | B_dData_dList.C_List_Nil -> (match (((v_allocTelescopes dtb_u_u217) dtb_u_u227) dtb_u_u221) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u231; B_dData_dPair.f_Pair_second = dtb_u_u232 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u222; B_dData_dPair.f_Pair_second = ((v_buildPi dtb_u_u224) dtb_u_u229) }, dtb_u_u231)); B_dData_dPair.f_Pair_second = dtb_u_u232 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u227 }
)
  | _ -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u227 }
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u218 }
  | _ -> failwith "DT: impossible branch"
))

# 669 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findDtDef = (fun (dtb_u_u233 : string) (dtb_u_u234 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u234 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u235, dtb_u_u236) -> (if ((Elab_dTypes.v_dtDefName dtb_u_u235) = dtb_u_u233) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u235)) else ((v_findDtDef dtb_u_u233) dtb_u_u236))
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
let rec v_pickFreshName = (fun (dtb_u_u288 : string) (dtb_u_u289 : string B_dData_dList.t_List) (dtb_u_u290 : int B_dData_dList.t_List) -> (match dtb_u_u290 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u291, dtb_u_u292) -> (let dtb_u_u293 = (if (dtb_u_u291 = 0) then dtb_u_u288 else (String.concat "" [dtb_u_u288; "_"; (string_of_int dtb_u_u291)])) in (if ((B_dData_dList.v_memName dtb_u_u293) dtb_u_u289) then (((v_pickFreshName dtb_u_u288) dtb_u_u289) dtb_u_u292) else dtb_u_u293))
  | B_dData_dList.C_List_Nil -> dtb_u_u288
  | _ -> failwith "DT: impossible branch"
))

# 729 "Vuna/Compiler/Driver/Dt.vuna"
let v_freshMetaName = (fun (dtb_u_u294 : string) (dtb_u_u295 : string B_dData_dList.t_List) -> (((v_pickFreshName dtb_u_u294) dtb_u_u295) (B_dData_dList.C_List__x58__x58_ (0, ((B_dData_dList.v_range 1) 64)))))

# 741 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_substGenMetas = (fun (dtb_u_u296 : Core_dTerm.t_Term) (dtb_u_u297 : t_GenMeta B_dData_dList.t_List) (dtb_u_u298 : int) (dtb_u_u299 : int) -> (match dtb_u_u297 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u300, dtb_u_u301) -> ((((v_substGenMetas ((((Core_dTerm.v_substMetaVar (dtb_u_u300).f_GenMeta_genMetaId) (dtb_u_u300).f_GenMeta_genMetaName) ((dtb_u_u298 + 1) - dtb_u_u299)) dtb_u_u296)) dtb_u_u301) (dtb_u_u298 + 1)) dtb_u_u299)
  | B_dData_dList.C_List_Nil -> dtb_u_u296
  | _ -> failwith "DT: impossible branch"
))

# 746 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_wrapGenMetas = (fun (dtb_u_u302 : t_GenMeta B_dData_dList.t_List) (dtb_u_u303 : Core_dTerm.t_Term) -> (match dtb_u_u302 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u304, dtb_u_u305) -> (Core_dTerm.C_Term_TPi ((dtb_u_u304).f_GenMeta_genMetaName, true, Core_dTerm.C_Rig_RigOmega, (dtb_u_u304).f_GenMeta_genMetaKind, ((v_wrapGenMetas dtb_u_u305) dtb_u_u303)))
  | B_dData_dList.C_List_Nil -> dtb_u_u303
  | _ -> failwith "DT: impossible branch"
))

# 753 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_kindArrows = (fun (dtb_u_u306 : int B_dData_dList.t_List) -> (match dtb_u_u306 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u307, dtb_u_u308) -> (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_RigOmega, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), (v_kindArrows dtb_u_u308)))
  | B_dData_dList.C_List_Nil -> (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))
  | _ -> failwith "DT: impossible branch"
))

# 750 "Vuna/Compiler/Driver/Dt.vuna"
let v_kindOfArity = (fun (dtb_u_u309 : int) -> (v_kindArrows ((B_dData_dList.v_range 0) dtb_u_u309)))

# 758 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_metaIdsOf = (fun (dtb_u_u310 : Core_dTerm.t_Term) -> (match dtb_u_u310 with
  | Core_dTerm.C_Term_TIf (dtb_u_u311, dtb_u_u312, dtb_u_u313) -> ((B_dData_dList.v_append (v_metaIdsOf dtb_u_u311)) ((B_dData_dList.v_append (v_metaIdsOf dtb_u_u312)) (v_metaIdsOf dtb_u_u313)))
  | Core_dTerm.C_Term_TCase (dtb_u_u314, dtb_u_u315) -> ((B_dData_dList.v_append (v_metaIdsOf dtb_u_u314)) ((B_dData_dList.v_concatMap v_metaIdsOfAlt) dtb_u_u315))
  | Core_dTerm.C_Term_TCon (dtb_u_u316, dtb_u_u317) -> (v_metaIdsOfArgs dtb_u_u317)
  | Core_dTerm.C_Term_TApp (dtb_u_u318, dtb_u_u319, dtb_u_u320) -> ((B_dData_dList.v_append (v_metaIdsOf dtb_u_u318)) (v_metaIdsOf dtb_u_u319))
  | Core_dTerm.C_Term_TLam (dtb_u_u321, dtb_u_u322, dtb_u_u323, dtb_u_u324, dtb_u_u325) -> (let dtb_u_u326 = (let dtb_u_u327 = dtb_u_u323 in (match dtb_u_u327 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u328) -> (match dtb_u_u328 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u329; B_dData_dPair.f_Pair_second = dtb_u_u330 } -> (match dtb_u_u330 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u331; B_dData_dPair.f_Pair_second = dtb_u_u332 } -> ((B_dData_dList.v_append (v_metaIdsOfMaybe dtb_u_u331)) (v_metaIdsOfMaybe dtb_u_u332))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)) in ((B_dData_dList.v_append dtb_u_u326) (v_metaIdsOf dtb_u_u325)))
  | Core_dTerm.C_Term_TPi (dtb_u_u333, dtb_u_u334, dtb_u_u335, dtb_u_u336, dtb_u_u337) -> ((B_dData_dList.v_append (v_metaIdsOf dtb_u_u336)) (v_metaIdsOf dtb_u_u337))
  | Core_dTerm.C_Term_TMeta (dtb_u_u338) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u338, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))
# 774 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfMaybe = (fun (dtb_u_u339 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u339 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u340) -> (v_metaIdsOf dtb_u_u340)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 778 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfArgs = (fun (dtb_u_u341 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u341 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u342, dtb_u_u343) -> (match dtb_u_u342 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u344; B_dData_dPair.f_Pair_second = dtb_u_u345 } -> ((B_dData_dList.v_append (v_metaIdsOf dtb_u_u344)) (v_metaIdsOfArgs dtb_u_u343))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 782 "Vuna/Compiler/Driver/Dt.vuna"
and v_metaIdsOfAlt = (fun (dtb_u_u346 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u346 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u347; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u348; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u349 } -> (v_metaIdsOf dtb_u_u349)
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_dedupInts = (fun (dtb_u_u350 : int B_dData_dList.t_List) -> (match dtb_u_u350 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u351, dtb_u_u352) -> (if ((Elab_dMeta.v_memMetaId dtb_u_u351) dtb_u_u352) then (v_dedupInts dtb_u_u352) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u351, (v_dedupInts dtb_u_u352))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 822 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_headIsMeta = (fun (dtb_u_u353 : int) (dtb_u_u354 : Core_dTerm.t_Term) -> (match dtb_u_u354 with
  | Core_dTerm.C_Term_TMeta (dtb_u_u355) -> (dtb_u_u353 = dtb_u_u355)
  | Core_dTerm.C_Term_TApp (dtb_u_u356, dtb_u_u357, dtb_u_u358) -> ((v_headIsMeta dtb_u_u353) dtb_u_u356)
  | _ -> false
))

# 827 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_spineLen = (fun (dtb_u_u359 : Core_dTerm.t_Term) -> (match dtb_u_u359 with
  | Core_dTerm.C_Term_TApp (dtb_u_u360, dtb_u_u361, dtb_u_u362) -> (1 + (v_spineLen dtb_u_u360))
  | _ -> 0
))

# 819 "Vuna/Compiler/Driver/Dt.vuna"
let v_applyArity = (fun (dtb_u_u363 : int) (dtb_u_u364 : Core_dTerm.t_Term) -> (if ((v_headIsMeta dtb_u_u363) dtb_u_u364) then (v_spineLen dtb_u_u364) else 0))

# 831 "Vuna/Compiler/Driver/Dt.vuna"
let v_imax = (fun (dtb_u_u365 : int) (dtb_u_u366 : int) -> (if (dtb_u_u365 >= dtb_u_u366) then dtb_u_u365 else dtb_u_u366))

# 790 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_maxMetaArity = (fun (dtb_u_u367 : int) (dtb_u_u368 : Core_dTerm.t_Term) -> (match dtb_u_u368 with
  | Core_dTerm.C_Term_TIf (dtb_u_u369, dtb_u_u370, dtb_u_u371) -> ((v_imax ((v_maxMetaArity dtb_u_u367) dtb_u_u369)) ((v_imax ((v_maxMetaArity dtb_u_u367) dtb_u_u370)) ((v_maxMetaArity dtb_u_u367) dtb_u_u371)))
  | Core_dTerm.C_Term_TCase (dtb_u_u372, dtb_u_u373) -> ((v_imax ((v_maxMetaArity dtb_u_u367) dtb_u_u372)) ((v_maxMetaArityAlts dtb_u_u367) dtb_u_u373))
  | Core_dTerm.C_Term_TCon (dtb_u_u374, dtb_u_u375) -> ((v_maxMetaArityArgs dtb_u_u367) dtb_u_u375)
  | Core_dTerm.C_Term_TLam (dtb_u_u376, dtb_u_u377, dtb_u_u378, dtb_u_u379, dtb_u_u380) -> (let dtb_u_u381 = (let dtb_u_u382 = dtb_u_u378 in (match dtb_u_u382 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u383) -> (match dtb_u_u383 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u384; B_dData_dPair.f_Pair_second = dtb_u_u385 } -> (match dtb_u_u385 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u386; B_dData_dPair.f_Pair_second = dtb_u_u387 } -> ((v_imax ((v_maxMetaArityMaybe dtb_u_u367) dtb_u_u386)) ((v_maxMetaArityMaybe dtb_u_u367) dtb_u_u387))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
)) in ((v_imax dtb_u_u381) ((v_maxMetaArity dtb_u_u367) dtb_u_u380)))
  | Core_dTerm.C_Term_TPi (dtb_u_u388, dtb_u_u389, dtb_u_u390, dtb_u_u391, dtb_u_u392) -> ((v_imax ((v_maxMetaArity dtb_u_u367) dtb_u_u391)) ((v_maxMetaArity dtb_u_u367) dtb_u_u392))
  | Core_dTerm.C_Term_TApp (dtb_u_u393, dtb_u_u394, dtb_u_u395) -> ((v_imax ((v_applyArity dtb_u_u367) (Core_dTerm.C_Term_TApp (dtb_u_u393, dtb_u_u394, dtb_u_u395)))) ((v_imax ((v_maxMetaArity dtb_u_u367) dtb_u_u393)) ((v_maxMetaArity dtb_u_u367) dtb_u_u394)))
  | _ -> 0
))
# 807 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityMaybe = (fun (dtb_u_u396 : int) (dtb_u_u397 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u397 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u398) -> ((v_maxMetaArity dtb_u_u396) dtb_u_u398)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
# 811 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityArgs = (fun (dtb_u_u399 : int) (dtb_u_u400 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u400 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u401, dtb_u_u402) -> (match dtb_u_u401 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u403; B_dData_dPair.f_Pair_second = dtb_u_u404 } -> ((v_imax ((v_maxMetaArity dtb_u_u399) dtb_u_u403)) ((v_maxMetaArityArgs dtb_u_u399) dtb_u_u402))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 815 "Vuna/Compiler/Driver/Dt.vuna"
and v_maxMetaArityAlts = (fun (dtb_u_u405 : int) (dtb_u_u406 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u406 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u407, dtb_u_u408) -> ((v_imax ((v_maxMetaArity dtb_u_u405) (Core_dTerm.v_caseAltBody dtb_u_u407))) ((v_maxMetaArityAlts dtb_u_u405) dtb_u_u408))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 721 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_buildGenMetas = (fun (dtb_u_u409 : int B_dData_dList.t_List) (dtb_u_u410 : string B_dData_dList.t_List) (dtb_u_u411 : int) (dtb_u_u412 : Core_dTerm.t_Term) -> (match dtb_u_u409 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u413, dtb_u_u414) -> (let dtb_u_u415 = ((v_freshMetaName ("t" ^ (string_of_int dtb_u_u411))) dtb_u_u410) in (let dtb_u_u416 = (v_kindOfArity ((v_maxMetaArity dtb_u_u413) dtb_u_u412)) in (B_dData_dList.C_List__x58__x58_ ({ f_GenMeta_genMetaId = dtb_u_u413; f_GenMeta_genMetaName = dtb_u_u415; f_GenMeta_genMetaKind = dtb_u_u416 }, ((((v_buildGenMetas dtb_u_u414) (B_dData_dList.C_List__x58__x58_ (dtb_u_u415, dtb_u_u410))) (dtb_u_u411 + 1)) dtb_u_u412)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_listLen = (fun dtb_u_u418 -> (match dtb_u_u418 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u419, dtb_u_u420) -> (1 + (v_listLen dtb_u_u420))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 626 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findArity = (fun (dtb_u_u421 : string) (dtb_u_u422 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u422 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u423, dtb_u_u424) -> (match dtb_u_u423 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u425, dtb_u_u426, dtb_u_u427, dtb_u_u428) -> (if (dtb_u_u425 = dtb_u_u421) then (B_dData_dMaybe.C_Maybe_Just ((v_listLen dtb_u_u426))) else ((v_findArity dtb_u_u421) dtb_u_u424))
  | _ -> ((v_findArity dtb_u_u421) dtb_u_u424)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 618 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_aritiesOf = (fun (dtb_u_u429 : string B_dData_dList.t_List) (dtb_u_u430 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u429 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u431, dtb_u_u432) -> (match ((v_findArity dtb_u_u431) dtb_u_u430) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err (String.concat "" ["\232\135\170\229\138\168\231\173\190\229\144\141\239\188\154\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 "; dtb_u_u431; "\239\188\136\233\156\128\232\166\129 DFun\239\188\137"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u433) -> ((Base_dCommon.v_bind ((v_aritiesOf dtb_u_u432) dtb_u_u430)) (fun (dtb_u_u434 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u431; B_dData_dPair.f_Pair_second = dtb_u_u433 }, dtb_u_u434))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 705 "Vuna/Compiler/Driver/Dt.vuna"
let v_generalizeSignature = (fun (dtb_u_u435 : Core_dTerm.t_Term) (dtb_u_u436 : string B_dData_dList.t_List) -> (let dtb_u_u437 = (v_dedupInts (v_metaIdsOf dtb_u_u435)) in (if ((B_dData_dList.v_length dtb_u_u437) = 0) then (Base_dDiag.C_Check_OkC ((Core_dTerm.v_showTypeSig dtb_u_u435))) else (if ((B_dData_dList.v_length dtb_u_u437) > 8) then (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\231\154\132\231\177\187\229\158\139\229\143\130\230\149\176\232\182\133\232\191\135 8 \228\184\170\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else (let dtb_u_u438 = ((((v_buildGenMetas dtb_u_u437) dtb_u_u436) 0) dtb_u_u435) in (let dtb_u_u439 = (v_listLen dtb_u_u438) in (let dtb_u_u440 = ((((v_substGenMetas dtb_u_u435) dtb_u_u438) 0) dtb_u_u439) in (let dtb_u_u441 = (Core_dTerm.v_showTypeSig ((v_wrapGenMetas dtb_u_u438) dtb_u_u440)) in (if ((B_dData_dString.v_contains "?") dtb_u_u441) then (Base_dDiag.v_err "\232\135\170\229\138\168\231\173\190\229\144\141\231\154\132\231\187\147\230\158\156\228\187\141\229\144\171\230\156\170\232\167\163\229\133\131\229\143\152\233\135\143\239\188\140\232\175\183\229\133\136\229\134\153\231\177\187\229\158\139\231\173\190\229\144\141") else (Base_dDiag.C_Check_OkC (dtb_u_u441)))))))))))

# 659 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_inferEachType = (fun (dtb_u_u442 : string B_dData_dList.t_List) (dtb_u_u443 : Elab_dTypes.t_DtProgram) (dtb_u_u444 : Elab_dTypes.t_Ec) (dtb_u_u445 : string B_dData_dList.t_List) -> (match dtb_u_u442 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u446, dtb_u_u447) -> (match ((v_findDtDef dtb_u_u446) (Elab_dTypes.v_dtProgDefs dtb_u_u443)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err ("\232\135\170\229\138\168\231\173\190\229\144\141\239\188\154\231\178\190\229\140\150\231\187\147\230\158\156\233\135\140\230\137\190\228\184\141\229\136\176\229\174\154\228\185\137 " ^ dtb_u_u446))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u448) -> ((Base_dCommon.v_bind ((v_generalizeSignature (((Elab_dMeta.v_zonkTerm dtb_u_u444) 0) (Elab_dTypes.v_dtDefType dtb_u_u448))) dtb_u_u445)) (fun (dtb_u_u449 : string) -> ((Base_dCommon.v_bind ((((v_inferEachType dtb_u_u447) dtb_u_u443) dtb_u_u444) dtb_u_u445)) (fun (dtb_u_u450 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u446; B_dData_dPair.f_Pair_second = dtb_u_u449 }, dtb_u_u450))))))))
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
let rec v_lookupMainKind = (fun (dtb_u_u558 : string) (dtb_u_u559 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u559 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u560, dtb_u_u561) -> (if ((B_dData_dPair.v_firstOf dtb_u_u560) = dtb_u_u558) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u560))) else ((v_lookupMainKind dtb_u_u558) dtb_u_u561))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 871 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainKindForName = (fun (dtb_u_u562 : string) -> (match ((v_lookupMainKind dtb_u_u562) v_mainKindNames) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u563) -> (Base_dDiag.C_Check_OkC (dtb_u_u563))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ("Other"))
  | _ -> failwith "DT: impossible branch"
))

# 888 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainInfoForName = (fun (dtb_u_u564 : string) -> (match (v_mainKindForName dtb_u_u564) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u565) -> (Base_dDiag.C_Check_ErrC (dtb_u_u565))
  | Base_dDiag.C_Check_OkC (dtb_u_u566) -> (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = dtb_u_u566; f_MainInfo_miHostTags = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 943 "Vuna/Compiler/Driver/Dt.vuna"
let v_replExprName = "vuna_repl_expr"

# 947 "Vuna/Compiler/Driver/Dt.vuna"
let v_splitReplExpr = (fun (dtb_u_u567 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u568 = (B_dData_dList.v_reverse dtb_u_u567) in (match dtb_u_u568 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u569, dtb_u_u570) -> (match dtb_u_u569 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u571, dtb_u_u572, dtb_u_u573, dtb_u_u574) -> (if (dtb_u_u571 = v_replExprName) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u570); B_dData_dPair.f_Pair_second = dtb_u_u573 })) else (Base_dDiag.v_icInternal "REPL expression definition is not last"))
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
let v_stuckText = (fun (dtb_u_u650 : Core_dTerm.t_Value) -> (let dtb_u_u651 = ((Core_dEval.v_showValueAt 6) dtb_u_u650) in (if ((String.length dtb_u_u651) > 300) then ((((B_dData_dString.v_substring 0) 300) dtb_u_u651) ^ "\226\128\166") else dtb_u_u651)))

# 997 "Vuna/Compiler/Driver/Dt.vuna"
let v_interpMainShow = (fun (dtb_u_u652 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u653 : Core_dTerm.t_Sols) (dtb_u_u654 : Core_dTerm.t_Value) -> (match ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u652)) dtb_u_u653) Core_dEval.v_normalizeFuelBound) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (Base_dIntrinsics.v_mainShowDefName, (B_dData_dList.C_List__x58__x58_ (dtb_u_u654, B_dData_dList.C_List_Nil))))))) with
  | Core_dTerm.C_Value_VStr (dtb_u_u655) -> (Base_dDiag.C_Check_OkC (dtb_u_u655))
  | _ -> ((Base_dDiagnostics_dCg.v_cgErr1 (Base_dDiagnostics_dCg.C_CgErr_MainNotValue (""))) (v_stuckText dtb_u_u654))
))

# 1013 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainActionKind = (fun (dtb_u_u656 : Core_dTerm.t_Term) -> (match dtb_u_u656 with
  | Core_dTerm.C_Term_TApp (dtb_u_u657, dtb_u_u658, dtb_u_u659) -> (match dtb_u_u657 with
  | Core_dTerm.C_Term_TApp (dtb_u_u660, dtb_u_u661, dtb_u_u662) -> (match dtb_u_u660 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u663) -> (if (dtb_u_u663 = Base_dIntrinsics.v_effTypeName) then "Eff" else "")
  | _ -> ""
)
  | _ -> ""
)
  | _ -> ""
))

# 1021 "Vuna/Compiler/Driver/Dt.vuna"
let v_isNilRowTermDt = (fun (dtb_u_u664 : Core_dTerm.t_Term) -> (match dtb_u_u664 with
  | Core_dTerm.C_Term_TCon (dtb_u_u665, dtb_u_u666) -> (match dtb_u_u666 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u665 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u667) -> (dtb_u_u667 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 1026 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findMainDef = (fun (dtb_u_u668 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u668 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u669, dtb_u_u670) -> (if ((Elab_dTypes.v_dtDefName dtb_u_u669) = "main") then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u669)) else (v_findMainDef dtb_u_u670))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1031 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_defTableOf = (fun (dtb_u_u671 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u671 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u672, dtb_u_u673) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u672) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u674) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u672); B_dData_dPair.f_Pair_second = dtb_u_u674 }, (v_defTableOf dtb_u_u673)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_defTableOf dtb_u_u673)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 924 "Vuna/Compiler/Driver/Dt.vuna"
let v_mainInfoOfDefs = (fun (dtb_u_u675 : string) (dtb_u_u676 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match (v_findMainDef dtb_u_u676) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dCg.v_cgErr0At { Base_dSource.f_Span_spanFile = dtb_u_u675; Base_dSource.f_Span_spanStartLine = 1; Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = 1; Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) Base_dDiagnostics_dCg.C_CgErr_NoMain)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u677) -> (if ((v_mainActionKind (Elab_dTypes.v_dtDefType dtb_u_u677)) = "Eff") then (Base_dDiag.C_Check_OkC ({ f_MainInfo_miKind = "Eff"; f_MainInfo_miHostTags = (Lowering_dEntry.v_mainRowTags (Elab_dTypes.v_dtDefType dtb_u_u677)) })) else (match ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_defTableOf dtb_u_u676))) Core_dTerm.v_solsEmpty) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtDefType dtb_u_u677))) with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u678) -> (match dtb_u_u678 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u679, dtb_u_u680) -> (match dtb_u_u680 with
  | B_dData_dList.C_List_Nil -> (v_mainInfoForName dtb_u_u679)
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
let v_evalDtMainCore = (fun (dtb_u_u727 : Elab_dTypes.t_DtProgram) -> (match (v_findMainDef (Elab_dTypes.v_dtProgDefs dtb_u_u727)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_NoMain)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u728) -> (let dtb_u_u729 = (v_defTableOf (Elab_dTypes.v_dtProgDefs dtb_u_u727)) in (let dtb_u_u730 = Core_dTerm.v_solsEmpty in (let dtb_u_u731 = ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u729)) dtb_u_u730) Core_dEval.v_normalizeFuelBound) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ("main", B_dData_dList.C_List_Nil))))) in (if (B_dData_dBool.v_not ((v_mainActionKind (Elab_dTypes.v_dtDefType dtb_u_u728)) = "")) then (Base_dDiagnostics_dCg.v_cgErr0 Base_dDiagnostics_dCg.C_CgErr_InterpCannotExecuteEffects) else (match dtb_u_u731 with
  | Core_dTerm.C_Value_VInt (dtb_u_u732) -> (Base_dDiag.C_Check_OkC ((string_of_int dtb_u_u732)))
  | Core_dTerm.C_Value_VStr (dtb_u_u733) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue dtb_u_u731)))
  | Core_dTerm.C_Value_VBool (dtb_u_u734) -> (Base_dDiag.C_Check_OkC ((Core_dEval.v_showValue dtb_u_u731)))
  | Core_dTerm.C_Value_VFloat (dtb_u_u735) -> (Base_dDiag.C_Check_OkC (dtb_u_u735))
  | Core_dTerm.C_Value_VCon (dtb_u_u736, dtb_u_u737) -> (match (Core_dEval.v_natValueToInt dtb_u_u731) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u738) -> (Base_dDiag.C_Check_OkC ((string_of_int dtb_u_u738)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_interpMainShow dtb_u_u729) dtb_u_u730) dtb_u_u731)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_interpMainShow dtb_u_u729) dtb_u_u730) dtb_u_u731)
)))))
  | _ -> failwith "DT: impossible branch"
))

# 959 "Vuna/Compiler/Driver/Dt.vuna"
let v_evalDtMain = (fun (dtb_u_u739 : Elab_dTypes.t_DtProgram) -> (v_evalDtMainCore dtb_u_u739))

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
let v_dtLoadParts = (fun (dtb_u_u764 : string) (dtb_u_u765 : string) (dtb_u_u766 : string) (dtb_u_u771 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u772 : string) -> (((((v_dtLoadPartsForCheck dtb_u_u764) dtb_u_u765) dtb_u_u766) dtb_u_u771) dtb_u_u772))

# 1042 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtLoadParts_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> ((Obj.magic (((((v_dtLoadPartsForCheck nFs) nEnv) nProcess) ctx) entry)) _u_ueffTok))

# 1051 "Vuna/Compiler/Driver/Dt.vuna"
let v_cachedNamesOne = (fun (dtb_u_u773 : Driver_dCache.t_CachedProgram) -> ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) (Driver_dCache.v_cachedDatas dtb_u_u773))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (dtb_u_u774 : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors dtb_u_u774)))) (Driver_dCache.v_cachedDatas dtb_u_u773))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) (Driver_dCache.v_cachedDefs dtb_u_u773))) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (Driver_dCache.v_cachedGlobals dtb_u_u773))) ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtInstSym) (Driver_dCache.v_cachedInsts dtb_u_u773))) ((B_dData_dList.v_map Elab_dTypes.v_dtClassName) (Driver_dCache.v_cachedClasses dtb_u_u773))))))))

# 1048 "Vuna/Compiler/Driver/Dt.vuna"
let v_cachedNamesOf = (fun (dtb_u_u775 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_cachedNamesOne) dtb_u_u775))

# 1120 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_maxMetaList = (fun (dtb_u_u776 : int) (dtb_u_u777 : int B_dData_dList.t_List) -> (match dtb_u_u777 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u778, dtb_u_u779) -> ((v_maxMetaList (if (dtb_u_u778 > dtb_u_u776) then dtb_u_u778 else dtb_u_u776)) dtb_u_u779)
  | B_dData_dList.C_List_Nil -> dtb_u_u776
  | _ -> failwith "DT: impossible branch"
))

# 1124 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaDef = (fun (dtb_u_u780 : int) (dtb_u_u781 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u781) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u782) -> ((v_maxMetaList dtb_u_u780) (Elab_dMeta.v_termMetasAll dtb_u_u782))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u780
  | _ -> failwith "DT: impossible branch"
))

# 1130 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaCached = (fun (dtb_u_u783 : int) (dtb_u_u784 : Driver_dCache.t_CachedProgram) -> (((B_dData_dList.v_foldl v_maxMetaDef) dtb_u_u783) (Driver_dCache.v_cachedDefs dtb_u_u784)))

# 1133 "Vuna/Compiler/Driver/Dt.vuna"
let v_maxMetaCps = (fun (dtb_u_u785 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (((B_dData_dList.v_foldl v_maxMetaCached) (0 - 1)) dtb_u_u785))

# 1136 "Vuna/Compiler/Driver/Dt.vuna"
let v_cleanStartNext = (fun (dtb_u_u786 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let dtb_u_u787 = (v_maxMetaCps dtb_u_u786) in (if (dtb_u_u787 < 0) then 0 else (dtb_u_u787 + 1))))

# 1149 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupKeepLastGo = (fun dtb_u_u789 dtb_u_u790 (dtb_u_u791 : (string, bool) B_dContainer_dHashMap.t_HashMap) dtb_u_u792 -> (match dtb_u_u790 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u793, dtb_u_u794) -> (let dtb_u_u795 = (dtb_u_u789 dtb_u_u793) in (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u795) dtb_u_u791) then ((((v_dedupKeepLastGo dtb_u_u789) dtb_u_u794) dtb_u_u791) dtb_u_u792) else ((((v_dedupKeepLastGo dtb_u_u789) dtb_u_u794) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u795) true) dtb_u_u791)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u793, dtb_u_u792)))))
  | B_dData_dList.C_List_Nil -> dtb_u_u792
  | _ -> failwith "DT: impossible branch"
))

# 1146 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupKeepLast = (fun dtb_u_u797 dtb_u_u798 -> ((((v_dedupKeepLastGo dtb_u_u797) (B_dData_dList.v_reverse dtb_u_u798)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 1164 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDefs = (fun (dtb_u_u799 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtDefName) dtb_u_u799))

# 1167 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_bodyPairs = (fun (dtb_u_u800 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u800 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u801, dtb_u_u802) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u801) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u803) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u801); B_dData_dPair.f_Pair_second = dtb_u_u803 }, (v_bodyPairs dtb_u_u802)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_bodyPairs dtb_u_u802)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1161 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDefBodies = (fun (dtb_u_u804 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (v_bodyPairs (v_dedupDefs dtb_u_u804)))

# 1174 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupDatas = (fun (dtb_u_u805 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtDataName) dtb_u_u805))

# 1177 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupInsts = (fun (dtb_u_u806 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtInstKey) dtb_u_u806))

# 1180 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupClasses = (fun (dtb_u_u807 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> ((v_dedupKeepLast Elab_dTypes.v_dtClassName) dtb_u_u807))

# 1183 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupGlobals = (fun (dtb_u_u808 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_dedupKeepLast (fun (dtb_u_u809 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf dtb_u_u809))) dtb_u_u808))

# 1091 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOfAt = (fun (dtb_u_u810 : int) (dtb_u_u811 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let dtb_u_u812 = (v_dedupDatas ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u811)) in (let dtb_u_u813 = ((B_dData_dList.v_append ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) dtb_u_u812)) ((B_dData_dList.v_concatMap (fun (dtb_u_u828 : Elab_dTypes.t_DtData) -> ((B_dData_dList.v_map Elab_dTypes.v_dtCtorName) (Elab_dTypes.v_dtDataCtors dtb_u_u828)))) dtb_u_u812)) in (let dtb_u_u814 = ((B_dData_dList.v_filter (fun (dtb_u_u827 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf dtb_u_u827)) dtb_u_u813)) false))) (v_dedupGlobals ((B_dData_dList.v_append Elab_dPrelude.v_preludeGlobals) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) dtb_u_u811)))) in (let dtb_u_u815 = ((B_dData_dList.v_append dtb_u_u814) ((B_dData_dList.v_map (fun (dtb_u_u826 : Elab_dTypes.t_DtData) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDataName dtb_u_u826); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDataKind dtb_u_u826) })) dtb_u_u812)) in (let dtb_u_u816 = ((B_dData_dList.v_map Loader_dFlatten.v_opaqueBaseName) ((B_dData_dList.v_concatMap Driver_dCache.v_cachedOpaqueOf) dtb_u_u811)) in (let dtb_u_u817 = ((B_dData_dList.v_filter (fun (dtb_u_u825 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not ((B_dData_dList.v_memName (B_dData_dPair.v_firstOf dtb_u_u825)) dtb_u_u816)))) (v_dedupDefBodies ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) dtb_u_u811))) in (let dtb_u_u818 = Elab_dTypes.v_ecEmpty in (let dtb_u_u819 = ((Elab_dDriver.v_addDatasEc dtb_u_u818) dtb_u_u812) in (let dtb_u_u820 = ((Elab_dDriver.v_addInstsEc dtb_u_u819) (v_dedupInsts ((B_dData_dList.v_concatMap Driver_dCache.v_cachedInsts) dtb_u_u811))) in (let dtb_u_u821 = ((Elab_dDriver.v_addClassesEc dtb_u_u820) (v_dedupClasses ((B_dData_dList.v_concatMap Driver_dCache.v_cachedClasses) dtb_u_u811))) in (let dtb_u_u822 = ((Elab_dTypes.v_ecPutNext dtb_u_u821) dtb_u_u810) in (let dtb_u_u823 = ((Elab_dTypes.v_ecPutGlobalsTbl dtb_u_u822) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u815)) in (let dtb_u_u824 = ((Elab_dTypes.v_ecPutDefTbl dtb_u_u823) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u817)) in { B_dData_dPair.f_Pair_first = dtb_u_u824; B_dData_dPair.f_Pair_second = dtb_u_u815 }))))))))))))))

# 1116 "Vuna/Compiler/Driver/Dt.vuna"
let v_depStartOf = (fun (dtb_u_u829 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> ((v_depStartOfAt 0) dtb_u_u829))

# 1213 "Vuna/Compiler/Driver/Dt.vuna"
let v_sortNames = (B_dData_dSort.v_sortBy (fun (dtb_u_u830 : string) (dtb_u_u831 : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) dtb_u_u830) dtb_u_u831)))

# 1221 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_dedupSortedGo = (fun (dtb_u_u832 : string B_dData_dList.t_List) (dtb_u_u833 : string B_dData_dList.t_List) -> (match dtb_u_u832 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u834, dtb_u_u835) -> (match dtb_u_u833 with
  | B_dData_dList.C_List_Nil -> ((v_dedupSortedGo dtb_u_u835) (B_dData_dList.C_List__x58__x58_ (dtb_u_u834, dtb_u_u833)))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u836, dtb_u_u837) -> (if (dtb_u_u834 = dtb_u_u836) then ((v_dedupSortedGo dtb_u_u835) dtb_u_u833) else ((v_dedupSortedGo dtb_u_u835) (B_dData_dList.C_List__x58__x58_ (dtb_u_u834, dtb_u_u833))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u833
  | _ -> failwith "DT: impossible branch"
))

# 1218 "Vuna/Compiler/Driver/Dt.vuna"
let v_dedupSortedNames = (fun (dtb_u_u838 : string B_dData_dList.t_List) -> (B_dData_dList.v_reverse ((v_dedupSortedGo dtb_u_u838) B_dData_dList.C_List_Nil)))

# 1228 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_nameSlotTbl = (fun (dtb_u_u839 : string B_dData_dList.t_List) (dtb_u_u840 : int) -> (match dtb_u_u839 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u841, dtb_u_u842) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u841; B_dData_dPair.f_Pair_second = dtb_u_u840 }, ((v_nameSlotTbl dtb_u_u842) (dtb_u_u840 + 1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1232 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_shiftedDepProgramsGo = (fun (dtb_u_u843 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u844 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (match dtb_u_u844 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u845, dtb_u_u846) -> (match ((B_dData_dList.v_lookupPair (Driver_dIface.v_miNameOf dtb_u_u845)) dtb_u_u843) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("iface: dependency module missing from shift table: " ^ (Driver_dIface.v_miNameOf dtb_u_u845)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u847) -> ((Base_dCommon.v_bind ((Driver_dCache.v_shiftCachedProgram ((dtb_u_u847 + 1) * Driver_dCache.v_summaryMetaSegment)) (Driver_dIface.v_miCachedOf dtb_u_u845))) (fun (dtb_u_u848 : Driver_dCache.t_CachedProgram) -> ((Base_dCommon.v_bind ((v_shiftedDepProgramsGo dtb_u_u843) dtb_u_u846)) (fun (dtb_u_u849 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u848, dtb_u_u849))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1202 "Vuna/Compiler/Driver/Dt.vuna"
let v_shiftedDepPrograms = (fun (dtb_u_u850 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let dtb_u_u851 = (v_dedupSortedNames (v_sortNames ((B_dData_dList.v_map Driver_dIface.v_miNameOf) dtb_u_u850))) in (if ((B_dData_dList.v_length dtb_u_u851) <> (B_dData_dList.v_length dtb_u_u850)) then (Base_dDiag.v_icInternal "iface: duplicate dependency module name") else ((v_shiftedDepProgramsGo ((v_nameSlotTbl dtb_u_u851) 0)) dtb_u_u850))))

# 1277 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtPrepareTermAux = (fun (dtb_u_u852 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls dtb_u_u852)) (fun (dtb_u_u853 : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings (B_dData_dPair.v_secondOf dtb_u_u853))) (fun (dtb_u_u854 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (dtb_u_u854)))))))

# 1288 "Vuna/Compiler/Driver/Dt.vuna"
let[@tail_mod_cons] rec v_dtAuxForTermination = (fun (dtb_u_u855 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u855 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u856, dtb_u_u857) -> (match dtb_u_u856 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u858, dtb_u_u859, dtb_u_u860, dtb_u_u861) -> (match (Elab_dTermination_dMeasure.v_projectionOfDef { B_dData_dPair.f_Pair_first = dtb_u_u858; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (fun (dtb_u_u862 : Frontend_dAst.t_Pat) -> dtb_u_u862)) dtb_u_u859); B_dData_dPair.f_Pair_second = dtb_u_u860 }, B_dData_dList.C_List_Nil)) }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u863) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u856, (v_dtAuxForTermination dtb_u_u857)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_dtAuxForTermination dtb_u_u857)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u856, (v_dtAuxForTermination dtb_u_u857)))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1301 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtElabFullWithPrepared = (fun (dtb_u_u864 : Elab_dTypes.t_Ec) (dtb_u_u865 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u866 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u867 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u868 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dRecords.v_prepareDeclsWith dtb_u_u866) ((Elab_dDriver.v_maybeAddHasFieldInstances dtb_u_u865) dtb_u_u868))) (fun (dtb_u_u869 : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u869 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u870; B_dData_dPair.f_Pair_second = dtb_u_u871 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb_u_u871)) (fun (dtb_u_u872 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((((Elab_dDriver.v_elabProgramGoWithAux dtb_u_u864) dtb_u_u865) dtb_u_u870) (v_dtAuxForTermination dtb_u_u867)) dtb_u_u872)))
  | _ -> failwith "DT: impossible branch"
))))

# 1323 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxKeyOne = (fun (dtb_u_u873 : Driver_dIface.t_ModuleIface) -> (String.concat "" [(Driver_dIface.v_miNameOf dtb_u_u873); ":"; (Driver_dIface.v_miIfaceHashOf dtb_u_u873)]))

# 1326 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtAuxKey = (fun (dtb_u_u874 : string) (dtb_u_u875 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u876 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (string_of_int (Driver_dIface.v_hashTextStrong (String.concat "" ["aux|"; dtb_u_u874; "|"; ((B_dData_dString.v_join ";") ((B_dData_dList.v_map v_auxKeyOne) dtb_u_u875)); "|"; ((B_dData_dString.v_join ";") ((B_dData_dList.v_map v_auxKeyOne) dtb_u_u876))]))))

# 1331 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtAuxOfCache = (fun (dtb_u_u877 : string) (dtb_u_u878 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (match dtb_u_u878 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u879) -> (if ((dtb_u_u879).f_AuxCache_auxCacheKey = dtb_u_u877) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u879)) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Driver/Dt.vuna"
let v_replCheckPartsAux = (fun (dtb_u_u880 : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u881 : string) (dtb_u_u882 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u883 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u884 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u885 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let dtb_u_u886 = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf dtb_u_u883)) in (let dtb_u_u887 = ((B_dData_dList.v_filter (fun (dtb_u_u905 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u905) <> dtb_u_u881))) dtb_u_u886) in (let dtb_u_u888 = ((B_dData_dList.v_filter (fun (dtb_u_u904 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u904) = dtb_u_u881))) dtb_u_u886) in (let dtb_u_u889 = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u887) in (let dtb_u_u890 = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u888) in (let dtb_u_u891 = ((B_dData_dList.v_append dtb_u_u890) (B_dData_dPair.v_firstOf dtb_u_u883)) in (let dtb_u_u892 = (((v_dtAuxKey dtb_u_u881) dtb_u_u884) B_dData_dList.C_List_Nil) in (let dtb_u_u893 = ((B_dData_dList.v_length dtb_u_u884) > 0) in (let dtb_u_u894 = (if dtb_u_u893 then ((v_dtAuxOfCache dtb_u_u892) dtb_u_u885) else B_dData_dMaybe.C_Maybe_Nothing) in (let dtb_u_u895 = (match dtb_u_u894 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u903) -> (Base_dDiag.C_Check_OkC ((dtb_u_u903).f_AuxCache_auxCacheDecls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_dtPrepareTermAux dtb_u_u889)
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind dtb_u_u895) (fun (dtb_u_u896 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_splitReplExpr dtb_u_u891)) (fun (dtb_u_u897 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((((v_dtElabFullWithPrepared (B_dData_dPair.v_firstOf dtb_u_u880)) (B_dData_dPair.v_secondOf dtb_u_u880)) dtb_u_u889) dtb_u_u896) (B_dData_dPair.v_firstOf dtb_u_u897))) (fun (dtb_u_u898 : Elab_dTypes.t_DtProgram) -> (let dtb_u_u899 = ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u882) in (let dtb_u_u900 = ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) dtb_u_u882) in (let dtb_u_u901 = ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) dtb_u_u882) in (let dtb_u_u902 = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append dtb_u_u899) (Elab_dTypes.v_dtProgDatas dtb_u_u898)); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append dtb_u_u900) (Elab_dTypes.v_dtProgDefs dtb_u_u898)); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals dtb_u_u898); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols dtb_u_u898); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append dtb_u_u901) (Elab_dTypes.v_dtProgGlobals dtb_u_u898))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts dtb_u_u898); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses dtb_u_u898); Elab_dTypes.f_DtProgram_dtProgNext = (dtb_u_u898).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (dtb_u_u898).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings dtb_u_u898) } in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u902; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u897) }; B_dData_dPair.f_Pair_second = (if dtb_u_u893 then (B_dData_dMaybe.C_Maybe_Just ({ f_AuxCache_auxCacheKey = dtb_u_u892; f_AuxCache_auxCacheDecls = dtb_u_u896; f_AuxCache_auxCacheStart = { B_dData_dPair.f_Pair_first = Elab_dTypes.v_ecEmpty; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; f_AuxCache_auxCacheDepCps = B_dData_dList.C_List_Nil; f_AuxCache_auxCacheCleanCps = B_dData_dList.C_List_Nil })) else B_dData_dMaybe.C_Maybe_Nothing) })))))))))))))))))))))))

# 433 "Vuna/Compiler/Driver/Dt.vuna"
let v_replCheckParts = (fun (dtb_u_u906 : (Elab_dTypes.t_Ec, (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u907 : string) (dtb_u_u908 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u909 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((((v_replCheckPartsAux dtb_u_u906) dtb_u_u907) dtb_u_u908) dtb_u_u909) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing)) (fun (dtb_u_u910 : ((Elab_dTypes.t_DtProgram, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u910))))))

# 1364 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalSetup = (fun (dtb_u_u911 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u912 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (dtb_u_u913 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u914 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u915 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let dtb_u_u916 = (B_dData_dPair.v_secondOf dtb_u_u912) in (let dtb_u_u917 = (B_dData_dPair.v_firstOf dtb_u_u912) in (let dtb_u_u918 = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u911) in (let dtb_u_u919 = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf dtb_u_u916)) in (let dtb_u_u920 = ((B_dData_dList.v_filter (fun (dtb_u_u948 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u948) = dtb_u_u918))) dtb_u_u919) in (let dtb_u_u921 = ((B_dData_dList.v_filter (fun (dtb_u_u947 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u947) <> dtb_u_u918))) dtb_u_u919) in (let dtb_u_u922 = (Driver_dIface.v_moduleNamesOf dtb_u_u914) in (let dtb_u_u923 = ((B_dData_dList.v_filter (fun (dtb_u_u946 : Loader_dModules.t_Module) -> (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb_u_u946)) dtb_u_u922)) false))) dtb_u_u920) in (let dtb_u_u924 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) dtb_u_u923)) (B_dData_dPair.v_firstOf dtb_u_u916)) in (let dtb_u_u925 = ((Base_dObs.v_obsCounter "vuna.elab.incr.clean") (B_dData_dList.v_length dtb_u_u914)) in (let dtb_u_u926 = ((Base_dObs.v_obsCounter "vuna.elab.incr.dirty") (B_dData_dList.v_length dtb_u_u923)) in (let dtb_u_u927 = ((Base_dObs.v_obsCounter "vuna.elab.incr.decls") (B_dData_dList.v_length dtb_u_u924)) in (let dtb_u_u928 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u921)) ((B_dData_dList.v_concatMap Driver_dIface.v_miDeclsOf) dtb_u_u914)) in (let dtb_u_u929 = (((v_dtAuxKey dtb_u_u918) dtb_u_u913) dtb_u_u914) in (let dtb_u_u930 = ((bi_natAdd (B_dData_dList.v_length dtb_u_u913) (B_dData_dList.v_length dtb_u_u914)) > 0) in (let dtb_u_u931 = (if dtb_u_u930 then ((v_dtAuxOfCache dtb_u_u929) dtb_u_u915) else B_dData_dMaybe.C_Maybe_Nothing) in (let dtb_u_u932 = (match dtb_u_u931 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u945) -> (Base_dDiag.C_Check_OkC ((dtb_u_u945).f_AuxCache_auxCacheDepCps))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_shiftedDepPrograms dtb_u_u913)
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u933 = ((B_dData_dList.v_concatMap Driver_dIface.v_miPreparedOf) ((B_dData_dList.v_append dtb_u_u913) dtb_u_u914)) in (let dtb_u_u934 = ((B_dData_dList.v_filter (fun (dtb_u_u944 : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_length (Driver_dIface.v_miPreparedOf dtb_u_u944)) = 0))) ((B_dData_dList.v_append dtb_u_u913) dtb_u_u914)) in ((Base_dCommon.v_bind dtb_u_u932) (fun (dtb_u_u935 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let dtb_u_u936 = (match dtb_u_u931 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u943) -> (dtb_u_u943).f_AuxCache_auxCacheCleanCps
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_map Driver_dIface.v_miCachedOf) dtb_u_u914)
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u937 = (match dtb_u_u931 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u942) -> (dtb_u_u942).f_AuxCache_auxCacheStart
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_depStartOfAt (v_cleanStartNext dtb_u_u936)) ((B_dData_dList.v_append dtb_u_u935) dtb_u_u936))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u938 = (match dtb_u_u931 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u941) -> (Base_dDiag.C_Check_OkC ((dtb_u_u941).f_AuxCache_auxCacheDecls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((B_dData_dList.v_length dtb_u_u933) > 0) then ((B_dData_dList.v_length dtb_u_u934) = 0) else false) then (Base_dDiag.C_Check_OkC (dtb_u_u933)) else (v_dtPrepareTermAux dtb_u_u928))
  | _ -> failwith "DT: impossible branch"
) in ((Base_dCommon.v_bind dtb_u_u938) (fun (dtb_u_u939 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u940 = (if dtb_u_u930 then (B_dData_dMaybe.C_Maybe_Just ({ f_AuxCache_auxCacheKey = dtb_u_u929; f_AuxCache_auxCacheDecls = dtb_u_u939; f_AuxCache_auxCacheStart = dtb_u_u937; f_AuxCache_auxCacheDepCps = dtb_u_u935; f_AuxCache_auxCacheCleanCps = dtb_u_u936 })) else B_dData_dMaybe.C_Maybe_Nothing) in (Base_dDiag.C_Check_OkC ({ f_DtIncrSetup_dsStartEc = (B_dData_dPair.v_firstOf dtb_u_u937); f_DtIncrSetup_dsStartGlobals = (B_dData_dPair.v_secondOf dtb_u_u937); f_DtIncrSetup_dsTermAux = dtb_u_u928; f_DtIncrSetup_dsPrepared = dtb_u_u939; f_DtIncrSetup_dsDecls = dtb_u_u924; f_DtIncrSetup_dsWarns = dtb_u_u917; f_DtIncrSetup_dsDepCps = dtb_u_u935; f_DtIncrSetup_dsCleanCps = dtb_u_u936; f_DtIncrSetup_dsNext = dtb_u_u940 }))))))))))))))))))))))))))))))

# 1441 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtGoalsIncrementalCore = (fun (dtb_u_u949 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u950 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (dtb_u_u951 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u952 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u953 : t_AuxCache B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.lsp.goals.setup") (fun (dtb_u_u954 : int) -> (((((v_dtIncrementalSetup dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953)))) (fun (dtb_u_u955 : t_DtIncrSetup) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.lsp.goals.elab") (fun (dtb_u_u956 : int) -> ((((Elab_dDriver.v_elabGoalsWithPrepared (dtb_u_u955).f_DtIncrSetup_dsStartEc) (dtb_u_u955).f_DtIncrSetup_dsStartGlobals) (dtb_u_u955).f_DtIncrSetup_dsTermAux) (dtb_u_u955).f_DtIncrSetup_dsDecls)))) (fun (dtb_u_u957 : Elab_dDriver.t_DtGoalInfo B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u957; B_dData_dPair.f_Pair_second = (dtb_u_u955).f_DtIncrSetup_dsNext })))))))

# 1521 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckScoped = (fun (dtb_u_u958 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u959 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u960 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u961 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((Lowering_dEnv.v_mkLwEnv dtb_u_u958) dtb_u_u960) dtb_u_u961) "")) (fun (dtb_u_u962 : Lowering_dEnv.t_LwEnv) -> ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (dtb_u_u963 : int) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.lower") (fun (dtb_u_u964 : int) -> (((Lowering_dProgram.v_lowerUnitOf dtb_u_u962) ((B_dData_dList.v_map Elab_dTypes.v_dtDefName) dtb_u_u960)) ((B_dData_dList.v_map Elab_dTypes.v_dtDataName) dtb_u_u959))))) (fun (dtb_u_u965 : Vuna_dIr_dModel.t_IrUnit) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.gen") (fun (dtb_u_u966 : int) -> ((Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts (Lowering_dEnv.v_lwEnvShared dtb_u_u962)) dtb_u_u965)))) (fun (dtb_u_u967 : int) -> (Base_dDiag.C_Check_OkC (0)))))))))))

# 1476 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishPackageScoped = (fun (dtb_u_u968 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u969 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u970 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u971 : Elab_dTypes.t_DtProgram) (dtb_u_u972 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u973 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let dtb_u_u974 = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u969)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u970)) (Elab_dTypes.v_dtProgDatas dtb_u_u971))); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) dtb_u_u969)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) dtb_u_u970)) (Elab_dTypes.v_dtProgDefs dtb_u_u971))); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals dtb_u_u971); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols dtb_u_u971); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) dtb_u_u970)) (Elab_dTypes.v_dtProgGlobals dtb_u_u971))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts dtb_u_u971); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses dtb_u_u971); Elab_dTypes.f_DtProgram_dtProgNext = (dtb_u_u971).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (dtb_u_u971).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings dtb_u_u971) } in (let dtb_u_u975 = ((B_dData_dList.v_append dtb_u_u968) (Elab_dTypes.v_dtProgWarnings dtb_u_u971)) in (let dtb_u_u976 = { f_CheckedPackage_checkedProgram = dtb_u_u974; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf dtb_u_u972); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf dtb_u_u972); f_CheckedPackage_checkedInherited = (v_cachedNamesOf dtb_u_u969); f_CheckedPackage_checkedWarnings = dtb_u_u975 } in (let dtb_u_u977 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u969)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u970)) (Elab_dTypes.v_dtProgDatas dtb_u_u971))) in ((Base_dCommon.v_bind ((((v_dtCheckScoped dtb_u_u977) (Elab_dTypes.v_dtProgDatas dtb_u_u971)) (Elab_dTypes.v_dtProgDefs dtb_u_u971)) (Elab_dTypes.v_dtProgGlobals dtb_u_u971))) (fun (dtb_u_u978 : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u976)); B_dData_dPair.f_Pair_second = dtb_u_u973 })))))))))

# 1502 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtFinishScoped = (fun (dtb_u_u979 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u980 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u981 : Elab_dTypes.t_DtProgram) (dtb_u_u982 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let dtb_u_u983 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u979)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u980)) (Elab_dTypes.v_dtProgDatas dtb_u_u981))) in (let dtb_u_u984 = (Elab_dTypes.v_dtProgDatas dtb_u_u981) in (let dtb_u_u985 = (Elab_dTypes.v_dtProgDefs dtb_u_u981) in ((Base_dCommon.v_bind ((((v_dtCheckScoped dtb_u_u983) dtb_u_u984) dtb_u_u985) (Elab_dTypes.v_dtProgGlobals dtb_u_u981))) (fun (dtb_u_u986 : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u982 }))))))))

# 1655 "Vuna/Compiler/Driver/Dt.vuna"
let v_findModuleNameField = (fun (dtb_u_u987 : Frontend_dAst.t_Import) -> (dtb_u_u987).Frontend_dAst.f_Import_importName)

# 1658 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findModuleNamed = (fun (dtb_u_u988 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u989 : string) -> (match dtb_u_u988 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u990, dtb_u_u991) -> (if ((Loader_dModules.v_moduleNameOf dtb_u_u990) = dtb_u_u989) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u990)) else ((v_findModuleNamed dtb_u_u991) dtb_u_u989))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1663 "Vuna/Compiler/Driver/Dt.vuna"
let v_topoDepsOf = (fun (dtb_u_u992 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u993 : Loader_dModules.t_Module) -> ((B_dData_dList.v_filter (fun (dtb_u_u994 : string) -> (match ((v_findModuleNamed dtb_u_u992) dtb_u_u994) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u995) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (dtb_u_u993).Loader_dModules.f_Module_moduleImportsOf) (dtb_u_u993).Loader_dModules.f_Module_moduleImplicitImportsOf))))

# 1673 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_topoVisit = (fun (dtb_u_u996 : int) (dtb_u_u997 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u998 : string) (dtb_u_u999 : string B_dData_dList.t_List) (dtb_u_u1000 : Loader_dModules.t_Module B_dData_dList.t_List) -> (if (dtb_u_u996 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u999; B_dData_dPair.f_Pair_second = dtb_u_u1000 } else (if ((B_dData_dList.v_memName dtb_u_u998) dtb_u_u999) then { B_dData_dPair.f_Pair_first = dtb_u_u999; B_dData_dPair.f_Pair_second = dtb_u_u1000 } else (match ((v_findModuleNamed dtb_u_u997) dtb_u_u998) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u998, dtb_u_u999)); B_dData_dPair.f_Pair_second = dtb_u_u1000 }
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1001) -> (let dtb_u_u1002 = (((((v_topoVisitAll (dtb_u_u996 - 1)) dtb_u_u997) ((v_topoDepsOf dtb_u_u997) dtb_u_u1001)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u998, dtb_u_u999))) dtb_u_u1000) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1002); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf dtb_u_u1002)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1001, B_dData_dList.C_List_Nil))) })
  | _ -> failwith "DT: impossible branch"
))))
# 1687 "Vuna/Compiler/Driver/Dt.vuna"
and v_topoVisitAll = (fun (dtb_u_u1003 : int) (dtb_u_u1004 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1005 : string B_dData_dList.t_List) (dtb_u_u1006 : string B_dData_dList.t_List) (dtb_u_u1007 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match dtb_u_u1005 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1008, dtb_u_u1009) -> (let dtb_u_u1010 = (((((v_topoVisit dtb_u_u1003) dtb_u_u1004) dtb_u_u1008) dtb_u_u1006) dtb_u_u1007) in (((((v_topoVisitAll dtb_u_u1003) dtb_u_u1004) dtb_u_u1009) (B_dData_dPair.v_firstOf dtb_u_u1010)) (B_dData_dPair.v_secondOf dtb_u_u1010)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u1006; B_dData_dPair.f_Pair_second = dtb_u_u1007 }
  | _ -> failwith "DT: impossible branch"
))

# 1698 "Vuna/Compiler/Driver/Dt.vuna"
let v_moduleOrderLess = (fun (dtb_u_u1011 : Loader_dModules.t_Module) (dtb_u_u1012 : Loader_dModules.t_Module) -> (let dtb_u_u1013 = (Base_dHash.v_contentKey (Loader_dModules.v_moduleNameOf dtb_u_u1011)) in (let dtb_u_u1014 = (Base_dHash.v_contentKey (Loader_dModules.v_moduleNameOf dtb_u_u1012)) in (if (dtb_u_u1013 <> dtb_u_u1014) then (dtb_u_u1013 < dtb_u_u1014) else ((Loader_dModules.v_moduleNameOf dtb_u_u1011) <= (Loader_dModules.v_moduleNameOf dtb_u_u1012))))))

# 1705 "Vuna/Compiler/Driver/Dt.vuna"
let v_topoModules = (fun (dtb_u_u1015 : Loader_dModules.t_Module B_dData_dList.t_List) -> (let dtb_u_u1016 = ((B_dData_dSort.v_sortBy v_moduleOrderLess) dtb_u_u1015) in (B_dData_dPair.v_secondOf (((((v_topoVisitAll ((B_dData_dList.v_length dtb_u_u1016) + 1)) dtb_u_u1016) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) dtb_u_u1016)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))))

# 1713 "Vuna/Compiler/Driver/Dt.vuna"
let v_splitGenerate = (fun (dtb_u_u1017 : string) (dtb_u_u1018 : string) (dtb_u_u1019 : string) (dtb_u_u1020 : string) (dtb_u_u1026 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1027 : (string, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1028 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1029 : Elab_dTypes.t_DtProgram) (dtb_u_u1030 : bool) (dtb_u_u1031 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u1032 = ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_rootDir) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u1026)) in (let dtb_u_u1033 = (Frontend_dPackages_dPkg.v_contextDir dtb_u_u1026) in (let dtb_u_u1034 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "cg-generate-start") else 0) in (((((((Driver_dSplitGen.v_generateDtSplitProgram dtb_u_u1027) dtb_u_u1028) dtb_u_u1029) dtb_u_u1030) dtb_u_u1032) dtb_u_u1033) dtb_u_u1031)))))

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
let v_moduleOfIface = (fun (dtb_u_u1066 : Driver_dIface.t_ModuleIface) -> { Loader_dModules.f_Module_moduleNameOf = (Driver_dIface.v_miNameOf dtb_u_u1066); Loader_dModules.f_Module_modulePackageOf = (Driver_dIface.v_miPackageOf dtb_u_u1066); Loader_dModules.f_Module_moduleImportsOf = (Driver_dIface.v_miImportsOf dtb_u_u1066); Loader_dModules.f_Module_moduleImplicitImportsOf = (Driver_dIface.v_miImplicitImportsOf dtb_u_u1066); Loader_dModules.f_Module_moduleDeclsOf = (Driver_dIface.v_miDeclsOf dtb_u_u1066); Loader_dModules.f_Module_moduleExportsOf = (Driver_dIface.v_miExportsOf dtb_u_u1066); Loader_dModules.f_Module_moduleFixitiesOf = (Driver_dIface.v_miFixitiesOf dtb_u_u1066); Loader_dModules.f_Module_moduleReexportsOf = B_dData_dList.C_List_Nil; Loader_dModules.f_Module_moduleOpaqueOf = (Driver_dCache.v_cachedOpaqueOf (Driver_dIface.v_miCachedOf dtb_u_u1066)); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf (Driver_dIface.v_miExportsOf dtb_u_u1066)); Loader_dModules.f_Module_moduleFixFactsOf = Frontend_dCst.v_emptyFixityFacts })

# 1242 "Vuna/Compiler/Driver/Dt.vuna"
let v_modulesOfIfaces = (fun (dtb_u_u1067 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (B_dData_dList.v_reverse ((B_dData_dList.v_map v_moduleOfIface) dtb_u_u1067)))

# 1773 "Vuna/Compiler/Driver/Dt.vuna"
let v_importsOfModuleNames = (fun (dtb_u_u1068 : Loader_dModules.t_Module) -> ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append (dtb_u_u1068).Loader_dModules.f_Module_moduleImportsOf) (dtb_u_u1068).Loader_dModules.f_Module_moduleImplicitImportsOf)))

# 1782 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_importsEdgeCount = (fun (dtb_u_u1069 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match dtb_u_u1069 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1070, dtb_u_u1071) -> ((B_dData_dList.v_length (v_importsOfModuleNames dtb_u_u1070)) + (v_importsEdgeCount dtb_u_u1071))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 1779 "Vuna/Compiler/Driver/Dt.vuna"
let v_closureFuel = (fun (dtb_u_u1072 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1073 : string B_dData_dList.t_List) -> ((((B_dData_dList.v_length dtb_u_u1073) + (B_dData_dList.v_length dtb_u_u1072)) + (v_importsEdgeCount dtb_u_u1072)) + 1))

# 1786 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_closureGo = (fun (dtb_u_u1074 : int) (dtb_u_u1075 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1076 : string B_dData_dList.t_List) (dtb_u_u1077 : string B_dData_dList.t_List) -> (match dtb_u_u1077 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1078, dtb_u_u1079) -> (if (dtb_u_u1074 <= 0) then dtb_u_u1076 else (if ((B_dData_dList.v_memName dtb_u_u1078) dtb_u_u1076) then ((((v_closureGo dtb_u_u1074) dtb_u_u1075) dtb_u_u1076) dtb_u_u1079) else (match ((v_findModuleNamed dtb_u_u1075) dtb_u_u1078) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_closureGo (dtb_u_u1074 - 1)) dtb_u_u1075) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1078, dtb_u_u1076))) dtb_u_u1079)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1080) -> ((((v_closureGo (dtb_u_u1074 - 1)) dtb_u_u1075) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1078, dtb_u_u1076))) ((B_dData_dList.v_append dtb_u_u1079) (v_importsOfModuleNames dtb_u_u1080)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> dtb_u_u1076
  | _ -> failwith "DT: impossible branch"
))

# 1798 "Vuna/Compiler/Driver/Dt.vuna"
let v_filterProjectToImports = (fun (dtb_u_u1081 : string) (dtb_u_u1082 : Loader_dModules.t_Project) -> (match dtb_u_u1082 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb_u_u1083; Loader_dModules.f_Project_projectEntryImports = dtb_u_u1084; Loader_dModules.f_Project_projectImplicitImports = dtb_u_u1085; Loader_dModules.f_Project_projectModules = dtb_u_u1086; Loader_dModules.f_Project_projectEntryPkg = dtb_u_u1087; Loader_dModules.f_Project_projectEntryFixities = dtb_u_u1088; Loader_dModules.f_Project_projectEntryName = dtb_u_u1089; Loader_dModules.f_Project_projectEntryFacts = dtb_u_u1090 } -> (let dtb_u_u1091 = ((B_dData_dList.v_map v_findModuleNameField) ((B_dData_dList.v_append dtb_u_u1084) dtb_u_u1085)) in (let dtb_u_u1092 = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (dtb_u_u1097 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u1097) = dtb_u_u1081))) dtb_u_u1086)) in (let dtb_u_u1093 = ((B_dData_dList.v_append dtb_u_u1091) dtb_u_u1092) in (let dtb_u_u1094 = ((((v_closureGo ((v_closureFuel dtb_u_u1086) dtb_u_u1093)) dtb_u_u1086) B_dData_dList.C_List_Nil) dtb_u_u1093) in (let dtb_u_u1095 = ((B_dData_dList.v_filter (fun (dtb_u_u1096 : Loader_dModules.t_Module) -> ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb_u_u1096)) dtb_u_u1094))) dtb_u_u1086) in { B_dData_dPair.f_Pair_first = { Loader_dModules.f_Project_projectEntryDecls = dtb_u_u1083; Loader_dModules.f_Project_projectEntryImports = dtb_u_u1084; Loader_dModules.f_Project_projectImplicitImports = dtb_u_u1085; Loader_dModules.f_Project_projectModules = dtb_u_u1095; Loader_dModules.f_Project_projectEntryPkg = dtb_u_u1087; Loader_dModules.f_Project_projectEntryFixities = dtb_u_u1088; Loader_dModules.f_Project_projectEntryName = dtb_u_u1089; Loader_dModules.f_Project_projectEntryFacts = dtb_u_u1090 }; B_dData_dPair.f_Pair_second = dtb_u_u1095 })))))
  | _ -> failwith "DT: impossible branch"
))

# 1808 "Vuna/Compiler/Driver/Dt.vuna"
let v_preloadKeepOf = (fun (dtb_u_u1098 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1099 : Loader_dModules.t_Module B_dData_dList.t_List) -> ((B_dData_dList.v_map Driver_dIface.v_miNameOf) ((B_dData_dList.v_filter (fun (dtb_u_u1100 : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf dtb_u_u1100)) ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) dtb_u_u1099)))) dtb_u_u1098)))

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
let v_materializedDeps = (fun (dtb_u_u1148 : string) (dtb_u_u1149 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u1150 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let dtb_u_u1151 = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (dtb_u_u1153 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u1153) <> dtb_u_u1148))) (B_dData_dPair.v_secondOf dtb_u_u1149))) in ((B_dData_dList.v_filter (fun (dtb_u_u1152 : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf dtb_u_u1152)) dtb_u_u1151))) dtb_u_u1150)))

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
let v_materializedOwn = (fun (dtb_u_u1356 : string) (dtb_u_u1357 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u1358 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> (let dtb_u_u1359 = ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (dtb_u_u1361 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u1361) = dtb_u_u1356))) (B_dData_dPair.v_secondOf dtb_u_u1357))) in ((B_dData_dList.v_filter (fun (dtb_u_u1360 : Driver_dIface.t_ModuleIface) -> ((B_dData_dList.v_memName (Driver_dIface.v_miNameOf dtb_u_u1360)) dtb_u_u1359))) dtb_u_u1358)))

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
let v_isPureTestKind = (fun (dtb_u_u1399 : string) -> (if (if (if (dtb_u_u1399 = "String") then true else (dtb_u_u1399 = "Int")) then true else (dtb_u_u1399 = "Nat")) then true else (dtb_u_u1399 = "Bool")))

# 1828 "Vuna/Compiler/Driver/Dt.vuna"
let v_maybeIfaces = (fun (dtb_u_u1400 : Driver_dIface.t_ModuleIface B_dData_dList.t_List B_dData_dMaybe.t_Maybe) -> ((B_dData_dMaybe.v_fromMaybe B_dData_dList.C_List_Nil) dtb_u_u1400))

# 1832 "Vuna/Compiler/Driver/Dt.vuna"
let v_testEntryOutcome = (fun (dtb_u_u1401 : string) (dtb_u_u1402 : Elab_dTypes.t_DtProgram) -> (match ((v_mainInfoOfDefs dtb_u_u1401) (Elab_dTypes.v_dtProgDefs dtb_u_u1402)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1403) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1403))
  | Base_dDiag.C_Check_OkC (dtb_u_u1404) -> (if (v_isPureTestKind (dtb_u_u1404).f_MainInfo_miKind) then (match (v_evalDtMain dtb_u_u1402) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1405) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1405))
  | Base_dDiag.C_Check_OkC (dtb_u_u1406) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb_u_u1404).f_MainInfo_miKind; B_dData_dPair.f_Pair_second = dtb_u_u1406 }))
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb_u_u1404).f_MainInfo_miKind; B_dData_dPair.f_Pair_second = "" })))
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
  | Base_dDiag.C_Check_ErrC (dtb_u_u1649) -> (let dtb_u_u1651 = (Base_dDiag.C_Check_ErrC (dtb_u_u1649)) in (Obj.repr ((fun (dtb_u_u1652 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1651))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1653) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1622)) (B_dData_dPair.v_secondOf dtb_u_u1653)) (Driver_dIface.v_restoreDefLocsSpans dtb_u_u1625))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1654) -> (let dtb_u_u1656 = (Base_dDiag.C_Check_ErrC (dtb_u_u1654)) in (Obj.repr ((fun (dtb_u_u1657 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1656))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1658) -> ((((((((((v_dtSplitPartsOursWith dtb_u_u1613) dtb_u_u1614) dtb_u_u1615) dtb_u_u1616) dtb_u_u1622) dtb_u_u1623) (B_dData_dPair.v_secondOf dtb_u_u1653)) dtb_u_u1658) dtb_u_u1624) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u1659 = (dtb_u_u1647 dtb_u_u1630) in (let dtb_u_u1667 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.codegen.split") dtb_u_u1630) in (let dtb_u_u1669 = dtb_u_u1659 in dtb_u_u1669))))))))))

# 1973 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitProjectWithIfaces_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (ifaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u1633 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.codegen.split") _u_ueffTok) in (let dtb_u_u1641 = (((((((v_dtLoadPartsWithIfaces_u_udirect nFs) nEnv) nProcess) ctx) entry) ifaces) _u_ueffTok) in (let dtb_u_u1647 = Obj.obj ((match dtb_u_u1641 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1649) -> (let dtb_u_u1651 = (Base_dDiag.C_Check_ErrC (dtb_u_u1649)) in (Obj.repr ((fun (dtb_u_u1652 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1651))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1653) -> (match (v_shiftedDepPrograms (((v_materializedDeps (Frontend_dPackages_dPkg.v_contextPackageName ctx)) (B_dData_dPair.v_secondOf dtb_u_u1653)) (Driver_dIface.v_restoreDefLocsSpans ifaces))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1654) -> (let dtb_u_u1656 = (Base_dDiag.C_Check_ErrC (dtb_u_u1654)) in (Obj.repr ((fun (dtb_u_u1657 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1656))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1658) -> ((((((((((v_dtSplitPartsOursWith nFs) nConsole) nEnv) nProcess) ctx) entry) (B_dData_dPair.v_secondOf dtb_u_u1653)) dtb_u_u1658) printResult) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u1659 = (dtb_u_u1647 _u_ueffTok) in (let dtb_u_u1667 = ((Base_dObs.v_obsMarkEff_u_udirect "vuna.codegen.split") _u_ueffTok) in (let dtb_u_u1669 = dtb_u_u1659 in dtb_u_u1669)))))))

# 1988 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtSplitPartsOurs = (fun (dtb_u_u1671 : string) (dtb_u_u1672 : string) (dtb_u_u1673 : string) (dtb_u_u1674 : string) (dtb_u_u1680 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1681 : string) (dtb_u_u1682 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u1683 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u1684 : bool) -> ((((((((((v_dtSplitPartsOursWith dtb_u_u1671) dtb_u_u1672) dtb_u_u1673) dtb_u_u1674) dtb_u_u1680) dtb_u_u1681) dtb_u_u1682) dtb_u_u1683) dtb_u_u1684) B_dData_dList.C_List_Nil))

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
let v_maybeTermGlobals = (fun (dtb_u_u1734 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u1734 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1735) -> (Core_dTerm.v_termGlobalNames dtb_u_u1735)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2084 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtDefGlobalNames = (fun (dtb_u_u1736 : Elab_dTypes.t_DtDef) -> ((B_dData_dList.v_append (v_maybeTermGlobals (Elab_dTypes.v_dtDefBody dtb_u_u1736))) (Core_dTerm.v_termGlobalNames (Elab_dTypes.v_dtDefType dtb_u_u1736))))

# 2097 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_warnUnusedDefsTbl = (fun (dtb_u_u1737 : (string) -> bool) (dtb_u_u1738 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u1739 : (string, bool) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u1738 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1740, dtb_u_u1741) -> (let dtb_u_u1742 = (Elab_dTypes.v_dtDefName dtb_u_u1740) in (let dtb_u_u1743 = (if (if (if (dtb_u_u1737 dtb_u_u1742) then true else ((Base_dSource.v_lastSeg dtb_u_u1742) = "main")) then true else ((B_dData_dString.v_startsWith "_") dtb_u_u1742)) then true else ((B_dData_dString.v_startsWith "$") dtb_u_u1742)) in (if dtb_u_u1743 then (((v_warnUnusedDefsTbl dtb_u_u1737) dtb_u_u1741) dtb_u_u1739) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u1742) dtb_u_u1739) then (((v_warnUnusedDefsTbl dtb_u_u1737) dtb_u_u1741) dtb_u_u1739) else (match (Elab_dTypes.v_dtDefSpan dtb_u_u1740) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1744) -> (B_dData_dList.C_List__x58__x58_ (((((Base_dDiagnostics_dWarning.v_warnDiagAtMod (fun (dtb_u_u1745 : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = (String.concat "" ["remove unused definition `"; dtb_u_u1742; "`"]); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = dtb_u_u1744; Base_dDiag.f_DiagEdit_editNewText = "" }, B_dData_dList.C_List_Nil)) }) dtb_u_u1745))) dtb_u_u1744) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedDefinition (dtb_u_u1742))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u1742, B_dData_dVec.C_Vec_Nil))), (((v_warnUnusedDefsTbl dtb_u_u1737) dtb_u_u1741) dtb_u_u1739)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_warnUnusedDefsTbl dtb_u_u1737) dtb_u_u1741) dtb_u_u1739)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2076 "Vuna/Compiler/Driver/Dt.vuna"
let v_warnUnusedDefsKeeping = (fun (dtb_u_u1746 : (string) -> bool) (dtb_u_u1747 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u1748 = ((B_dData_dList.v_concatMap v_dtDefGlobalNames) dtb_u_u1747) in (((v_warnUnusedDefsTbl dtb_u_u1746) dtb_u_u1747) (B_dContainer_dHashMap.v_ofNames dtb_u_u1748))))

# 2071 "Vuna/Compiler/Driver/Dt.vuna"
let v_warnUnusedDefsIn = (fun (dtb_u_u1749 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((v_warnUnusedDefsKeeping (fun (dtb_u_u1750 : string) -> false)) dtb_u_u1749))

# 1435 "Vuna/Compiler/Driver/Dt.vuna"
let v_incrementalUnusedWarns = (fun (dtb_u_u1751 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1752 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u1751 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1753) -> ((B_dData_dList.v_filter (fun (dtb_u_u1754 : Base_dDiag.t_Diagnostic) -> ((Base_dDiag.v_diagFileOf dtb_u_u1754) = dtb_u_u1753))) (v_warnUnusedDefsIn dtb_u_u1752))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1419 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalCheckedCore = (fun (dtb_u_u1755 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1756 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (dtb_u_u1757 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1758 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1759 : t_AuxCache B_dData_dMaybe.t_Maybe) (dtb_u_u1760 : bool) (dtb_u_u1761 : string B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((((v_dtIncrementalSetup dtb_u_u1755) dtb_u_u1756) dtb_u_u1757) dtb_u_u1758) dtb_u_u1759)) (fun (dtb_u_u1762 : t_DtIncrSetup) -> ((Base_dCommon.v_bind (((((v_dtElabFullWithPrepared (dtb_u_u1762).f_DtIncrSetup_dsStartEc) (dtb_u_u1762).f_DtIncrSetup_dsStartGlobals) (dtb_u_u1762).f_DtIncrSetup_dsTermAux) (dtb_u_u1762).f_DtIncrSetup_dsPrepared) (dtb_u_u1762).f_DtIncrSetup_dsDecls)) (fun (dtb_u_u1763 : Elab_dTypes.t_DtProgram) -> (let dtb_u_u1764 = ((B_dData_dList.v_append (dtb_u_u1762).f_DtIncrSetup_dsWarns) ((B_dData_dList.v_append (Elab_dTypes.v_dtProgWarnings dtb_u_u1763)) ((v_incrementalUnusedWarns dtb_u_u1761) (Elab_dTypes.v_dtProgDefs dtb_u_u1763)))) in ((Base_dCommon.v_bind (if dtb_u_u1760 then ((((((v_dtFinishPackageScoped (dtb_u_u1762).f_DtIncrSetup_dsWarns) (dtb_u_u1762).f_DtIncrSetup_dsDepCps) (dtb_u_u1762).f_DtIncrSetup_dsCleanCps) dtb_u_u1763) (B_dData_dPair.v_secondOf dtb_u_u1756)) (dtb_u_u1762).f_DtIncrSetup_dsNext) else ((((v_dtFinishScoped (dtb_u_u1762).f_DtIncrSetup_dsDepCps) (dtb_u_u1762).f_DtIncrSetup_dsCleanCps) dtb_u_u1763) (dtb_u_u1762).f_DtIncrSetup_dsNext))) (fun (dtb_u_u1765 : (t_CheckedPackage B_dData_dMaybe.t_Maybe, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1764; B_dData_dPair.f_Pair_second = dtb_u_u1765 }))))))))))

# 1335 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtIncrementalChecked = (fun (dtb_u_u1766 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1767 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (dtb_u_u1768 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1769 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_dtIncrementalCheckedCore dtb_u_u1766) dtb_u_u1767) dtb_u_u1768) dtb_u_u1769) B_dData_dMaybe.C_Maybe_Nothing) true) B_dData_dMaybe.C_Maybe_Nothing)) (fun (dtb_u_u1770 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (t_CheckedPackage B_dData_dMaybe.t_Maybe, t_AuxCache B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (match (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u1770)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1771) -> (Base_dDiag.C_Check_OkC (dtb_u_u1771))
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
let v_dtCheckSourceIncremental = (fun (dtb_u_u1815 : string) (dtb_u_u1816 : string) (dtb_u_u1817 : string) (dtb_u_u1818 : string) (dtb_u_u1819 : string) (dtb_u_u1826 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1827 : string) (dtb_u_u1828 : string) (dtb_u_u1829 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1830 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1831 : t_AuxCache B_dData_dMaybe.t_Maybe) (dtb_u_u1832 : bool) -> (((((((((((((v_dtCheckSourceIncrementalWith dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1826) dtb_u_u1827) dtb_u_u1828) dtb_u_u1829) dtb_u_u1830) dtb_u_u1831) dtb_u_u1832) B_dData_dMaybe.C_Maybe_Nothing))

# 1534 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckSourceIncremental_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (depIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cleanIfaces : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (cache : t_AuxCache B_dData_dMaybe.t_Maybe) (needPackage : bool) _u_ueffTok -> ((Obj.magic (((((((((((((v_dtCheckSourceIncrementalWith nFs) nEnv) nProcess) nExit) nArgs) ctx) label) source) depIfaces) cleanIfaces) cache) needPackage) B_dData_dMaybe.C_Maybe_Nothing)) _u_ueffTok))

# 1541 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckEntrySourceIncremental = (fun (dtb_u_u1833 : string) (dtb_u_u1834 : string) (dtb_u_u1835 : string) (dtb_u_u1836 : string) (dtb_u_u1837 : string) (dtb_u_u1844 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1845 : string) (dtb_u_u1846 : string) (dtb_u_u1847 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1848 : Driver_dIface.t_ModuleIface B_dData_dList.t_List) (dtb_u_u1849 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (((((((((((((v_dtCheckSourceIncrementalWith dtb_u_u1833) dtb_u_u1834) dtb_u_u1835) dtb_u_u1836) dtb_u_u1837) dtb_u_u1844) dtb_u_u1845) dtb_u_u1846) dtb_u_u1847) dtb_u_u1848) dtb_u_u1849) false) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1845))))

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
let v_ownModuleNamesOf = (fun (dtb_u_u1961 : string) (dtb_u_u1962 : Loader_dModules.t_Module B_dData_dList.t_List) -> ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) ((B_dData_dList.v_filter (fun (dtb_u_u1963 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u1963) = dtb_u_u1961))) dtb_u_u1962)))

# 2120 "Vuna/Compiler/Driver/Dt.vuna"
let v_packageDefsOf = (fun (dtb_u_u1964 : string) (dtb_u_u1965 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1966 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u1967 = (B_dData_dList.C_List__x58__x58_ ("", ((v_ownModuleNamesOf dtb_u_u1964) dtb_u_u1965))) in ((B_dData_dList.v_filter (fun (dtb_u_u1968 : Elab_dTypes.t_DtDef) -> ((B_dData_dList.v_memName (Base_dSource.v_prefixOfName (Elab_dTypes.v_dtDefName dtb_u_u1968))) dtb_u_u1967))) dtb_u_u1966)))

# 2133 "Vuna/Compiler/Driver/Dt.vuna"
let rec v_findRootByName = (fun (dtb_u_u1969 : string) (dtb_u_u1970 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) -> (match dtb_u_u1970 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1971, dtb_u_u1972) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb_u_u1971) = dtb_u_u1969) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1971)) else ((v_findRootByName dtb_u_u1969) dtb_u_u1972))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2127 "Vuna/Compiler/Driver/Dt.vuna"
let v_pkgExportedModulesOf = (fun (dtb_u_u1973 : Frontend_dPackages_dPkg.t_PackageContext) -> (match ((v_findRootByName (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1973)) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u1973)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1974) -> (dtb_u_u1974).Frontend_dPackages_dPkg.f_Root_rootExports
  | _ -> failwith "DT: impossible branch"
))

# 2149 "Vuna/Compiler/Driver/Dt.vuna"
let v_exportTargetName = (fun (dtb_u_u1975 : Loader_dModules.t_ExportEntry) -> (dtb_u_u1975).Loader_dModules.f_ExportEntry_target)

# 2139 "Vuna/Compiler/Driver/Dt.vuna"
let v_pkgExportedNamesOf = (fun (dtb_u_u1976 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1977 : Loader_dModules.t_Module B_dData_dList.t_List) -> (let dtb_u_u1978 = (match (v_pkgExportedModulesOf dtb_u_u1976) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_map Loader_dModules.v_moduleNameOf) dtb_u_u1977)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1981) -> dtb_u_u1981
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u1979 = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleExportsOf) ((B_dData_dList.v_filter (fun (dtb_u_u1980 : Loader_dModules.t_Module) -> ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb_u_u1980)) dtb_u_u1978))) dtb_u_u1977)) in ((B_dData_dList.v_map v_exportTargetName) dtb_u_u1979))))

# 2153 "Vuna/Compiler/Driver/Dt.vuna"
let v_addUnusedWarnsPair = (fun (dtb_u_u1982 : (Loader_dModules.t_Module B_dData_dList.t_List) -> (Elab_dTypes.t_DtDef B_dData_dList.t_List) -> Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u1983 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (let dtb_u_u1984 = (B_dData_dPair.v_secondOf dtb_u_u1983) in (let dtb_u_u1985 = ((B_dData_dList.v_append (B_dData_dPair.v_firstOf dtb_u_u1983)) ((dtb_u_u1982 (dtb_u_u1984).f_CheckedPackage_checkedModules) (Elab_dTypes.v_dtProgDefs (dtb_u_u1984).f_CheckedPackage_checkedProgram))) in { B_dData_dPair.f_Pair_first = dtb_u_u1985; B_dData_dPair.f_Pair_second = { dtb_u_u1984 with f_CheckedPackage_checkedWarnings = dtb_u_u1985 } })))

# 2160 "Vuna/Compiler/Driver/Dt.vuna"
let v_addUnusedWarns = (fun (dtb_u_u1986 : (Loader_dModules.t_Module B_dData_dList.t_List) -> (Elab_dTypes.t_DtDef B_dData_dList.t_List) -> Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u1987 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair Base_dDiag.t_Check) -> ((Base_dCommon.v_bind dtb_u_u1987) (fun (dtb_u_u1988 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, t_CheckedPackage) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((v_addUnusedWarnsPair dtb_u_u1986) dtb_u_u1988))))))

# 2164 "Vuna/Compiler/Driver/Dt.vuna"
let v_unusedWarnsForPackage = (fun (dtb_u_u1989 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1990 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1991 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (v_warnUnusedDefsIn (((v_packageDefsOf (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1989)) dtb_u_u1990) dtb_u_u1991)))

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
let v_unusedWarnsForLibrary = (fun (dtb_u_u2018 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2019 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u2020 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u2021 = (((v_packageDefsOf (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2018)) dtb_u_u2019) dtb_u_u2020) in (let dtb_u_u2022 = ((v_pkgExportedNamesOf dtb_u_u2018) dtb_u_u2019) in ((v_warnUnusedDefsKeeping (fun (dtb_u_u2023 : string) -> ((B_dData_dList.v_memName dtb_u_u2023) dtb_u_u2022))) dtb_u_u2021))))

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
let v_checkDtProgramOf = (fun (dtb_u_u2094 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u2095 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u2096 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.lower") (fun (dtb_u_u2097 : int) -> (((Lowering_dProgram.v_lowerProgramOf dtb_u_u2094) dtb_u_u2095) dtb_u_u2096)))) (fun (dtb_u_u2098 : Vuna_dIr_dModel.t_IrProgram) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.codegen.gen") (fun (dtb_u_u2099 : int) -> ((Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts (Vuna_dIr_dModel.v_irProgSharedOf dtb_u_u2098)) (Vuna_dIr_dModel.v_irProgUnitOf dtb_u_u2098))))) (fun (dtb_u_u2100 : int) -> (Base_dDiag.C_Check_OkC (0)))))))

# 141 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkDeclsWithWarns = (fun (dtb_u_u2101 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u2102 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u2103 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "decls-ready") else 0) in (match ((Base_dObs.v_obsCheck "vuna.elab") (fun (dtb_u_u2104 : int) -> (Elab_dDriver.v_elabProgramFull ((Base_dObs.v_obsPure "vuna.elab.rast") (fun (dtb_u_u2105 : int) -> dtb_u_u2102))))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2106) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2106))
  | Base_dDiag.C_Check_OkC (dtb_u_u2107) -> (let dtb_u_u2108 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "elab-done") else 0) in ((Base_dObs.v_obsCheck "vuna.codegen.check") (fun (dtb_u_u2109 : int) -> (match (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb_u_u2107)) (Elab_dTypes.v_dtProgDefs dtb_u_u2107)) (Elab_dTypes.v_dtProgGlobals dtb_u_u2107)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2110) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2110))
  | Base_dDiag.C_Check_OkC (dtb_u_u2111) -> (let dtb_u_u2112 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "codegen-check-done") else 0) in (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u2101) ((B_dData_dList.v_append (Elab_dTypes.v_dtProgWarnings dtb_u_u2107)) (v_warnUnusedDefsIn (Elab_dTypes.v_dtProgDefs dtb_u_u2107)))))))
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
  | Base_dDiag.C_Check_ErrC (dtb_u_u2154) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2154))
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
  | Base_dDiag.C_Check_ErrC (dtb_u_u2154) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2154))
  | Base_dDiag.C_Check_OkC (dtb_u_u2155) -> (let dtb_u_u2156 = (if ((dtp_log_on 2) "Vuna.Compiler.Driver.Dt") then (((dtp_log_emit 2) "Vuna.Compiler.Driver.Dt") "codegen-check-done") else 0) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2152; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb_u_u2150; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf dtb_u_u2144); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf dtb_u_u2144); f_CheckedPackage_checkedInherited = B_dData_dList.C_List_Nil; f_CheckedPackage_checkedWarnings = dtb_u_u2152 } })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u2140))))

# 163 "Vuna/Compiler/Driver/Dt.vuna"
let v_dtCheckWithProgramParts = (fun (dtb_u_u2157 : string) (dtb_u_u2158 : string) (dtb_u_u2159 : string) (dtb_u_u2164 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2165 : string) -> ((v_dtCheckPartsWithProgram (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2164)) (((((v_dtLoadPartsForCheck dtb_u_u2157) dtb_u_u2158) dtb_u_u2159) dtb_u_u2164) dtb_u_u2165)))

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
let v_dtCheckOursParts = (fun (dtb_u_u2211 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u2212 : (Base_dDiag.t_Diagnostic B_dData_dList.t_List, (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (dtb_u_u2213 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) -> (let dtb_u_u2214 = (B_dData_dPair.v_secondOf dtb_u_u2212) in (let dtb_u_u2215 = (B_dData_dPair.v_firstOf dtb_u_u2212) in (let dtb_u_u2216 = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u2211) in (let dtb_u_u2217 = (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf dtb_u_u2214)) in (let dtb_u_u2218 = ((B_dData_dList.v_filter (fun (dtb_u_u2228 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u2228) = dtb_u_u2216))) dtb_u_u2217) in (let dtb_u_u2219 = ((B_dData_dList.v_filter (fun (dtb_u_u2227 : Loader_dModules.t_Module) -> ((Loader_dModules.v_modulePackageOf dtb_u_u2227) <> dtb_u_u2216))) dtb_u_u2217) in (let dtb_u_u2220 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_sealModule) dtb_u_u2218)) (B_dData_dPair.v_firstOf dtb_u_u2214)) in (let dtb_u_u2221 = ((B_dData_dList.v_concatMap Loader_dModules.v_moduleDeclsOf) dtb_u_u2219) in (let dtb_u_u2222 = (v_depStartOf dtb_u_u2213) in ((Base_dCommon.v_bind ((((Elab_dDriver.v_elabProgramFullWithAux (B_dData_dPair.v_firstOf dtb_u_u2222)) (B_dData_dPair.v_secondOf dtb_u_u2222)) dtb_u_u2221) dtb_u_u2220)) (fun (dtb_u_u2223 : Elab_dTypes.t_DtProgram) -> (let dtb_u_u2224 = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u2213)) (Elab_dTypes.v_dtProgDatas dtb_u_u2223)) in ((Base_dCommon.v_bind (((v_checkDtProgramOf dtb_u_u2224) (Elab_dTypes.v_dtProgDefs dtb_u_u2223)) (Elab_dTypes.v_dtProgGlobals dtb_u_u2223))) (fun (dtb_u_u2225 : int) -> (let dtb_u_u2226 = ((B_dData_dList.v_append dtb_u_u2215) (Elab_dTypes.v_dtProgWarnings dtb_u_u2223)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u2226; B_dData_dPair.f_Pair_second = { f_CheckedPackage_checkedProgram = dtb_u_u2223; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf dtb_u_u2214); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf dtb_u_u2214); f_CheckedPackage_checkedInherited = (v_cachedNamesOf dtb_u_u2213); f_CheckedPackage_checkedWarnings = dtb_u_u2226 } }))))))))))))))))))

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
let v_dtFinishPackage = (fun (dtb_u_u2267 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u2268 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u2269 : Driver_dCache.t_CachedProgram B_dData_dList.t_List) (dtb_u_u2270 : Elab_dTypes.t_DtProgram) (dtb_u_u2271 : (Frontend_dAst.t_Decl B_dData_dList.t_List, Loader_dModules.t_Module B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u2272 : t_AuxCache B_dData_dMaybe.t_Maybe) -> (let dtb_u_u2273 = { Elab_dTypes.f_DtProgram_dtProgDatas = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u2268)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDatas) dtb_u_u2269)) (Elab_dTypes.v_dtProgDatas dtb_u_u2270))); Elab_dTypes.f_DtProgram_dtProgDefs = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) dtb_u_u2268)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedDefs) dtb_u_u2269)) (Elab_dTypes.v_dtProgDefs dtb_u_u2270))); Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_dtProgGoals dtb_u_u2270); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_dtProgSols dtb_u_u2270); Elab_dTypes.f_DtProgram_dtProgGlobals = (v_dedupGlobals ((B_dData_dList.v_append ((B_dData_dList.v_concatMap Driver_dCache.v_cachedGlobals) dtb_u_u2269)) (Elab_dTypes.v_dtProgGlobals dtb_u_u2270))); Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_dtProgInsts dtb_u_u2270); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_dtProgClasses dtb_u_u2270); Elab_dTypes.f_DtProgram_dtProgNext = (dtb_u_u2270).Elab_dTypes.f_DtProgram_dtProgNext; Elab_dTypes.f_DtProgram_dtProgDepths = (dtb_u_u2270).Elab_dTypes.f_DtProgram_dtProgDepths; Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_dtProgWarnings dtb_u_u2270) } in (let dtb_u_u2274 = ((B_dData_dList.v_append dtb_u_u2267) (Elab_dTypes.v_dtProgWarnings dtb_u_u2270)) in (let dtb_u_u2275 = { f_CheckedPackage_checkedProgram = dtb_u_u2273; f_CheckedPackage_checkedModules = (B_dData_dPair.v_secondOf dtb_u_u2271); f_CheckedPackage_checkedEntryDecls = (B_dData_dPair.v_firstOf dtb_u_u2271); f_CheckedPackage_checkedInherited = (v_cachedNamesOf dtb_u_u2268); f_CheckedPackage_checkedWarnings = dtb_u_u2274 } in ((Base_dCommon.v_bind (((v_checkDtProgramOf (Elab_dTypes.v_dtProgDatas dtb_u_u2273)) (Elab_dTypes.v_dtProgDefs dtb_u_u2273)) (Elab_dTypes.v_dtProgGlobals dtb_u_u2273))) (fun (dtb_u_u2276 : int) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2275)); B_dData_dPair.f_Pair_second = dtb_u_u2272 }))))))))

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
let v_checkedProgram = (fun (dtb_u_u2393 : t_CheckedPackage) -> (match dtb_u_u2393 with
  | { f_CheckedPackage_checkedProgram = dtb_u_u2394; f_CheckedPackage_checkedModules = dtb_u_u2395; f_CheckedPackage_checkedEntryDecls = dtb_u_u2396; f_CheckedPackage_checkedInherited = dtb_u_u2397; f_CheckedPackage_checkedWarnings = dtb_u_u2398 } -> dtb_u_u2394
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedModules = (fun (dtb_u_u2399 : t_CheckedPackage) -> (match dtb_u_u2399 with
  | { f_CheckedPackage_checkedProgram = dtb_u_u2400; f_CheckedPackage_checkedModules = dtb_u_u2401; f_CheckedPackage_checkedEntryDecls = dtb_u_u2402; f_CheckedPackage_checkedInherited = dtb_u_u2403; f_CheckedPackage_checkedWarnings = dtb_u_u2404 } -> dtb_u_u2401
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedEntryDecls = (fun (dtb_u_u2405 : t_CheckedPackage) -> (match dtb_u_u2405 with
  | { f_CheckedPackage_checkedProgram = dtb_u_u2406; f_CheckedPackage_checkedModules = dtb_u_u2407; f_CheckedPackage_checkedEntryDecls = dtb_u_u2408; f_CheckedPackage_checkedInherited = dtb_u_u2409; f_CheckedPackage_checkedWarnings = dtb_u_u2410 } -> dtb_u_u2408
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedInherited = (fun (dtb_u_u2411 : t_CheckedPackage) -> (match dtb_u_u2411 with
  | { f_CheckedPackage_checkedProgram = dtb_u_u2412; f_CheckedPackage_checkedModules = dtb_u_u2413; f_CheckedPackage_checkedEntryDecls = dtb_u_u2414; f_CheckedPackage_checkedInherited = dtb_u_u2415; f_CheckedPackage_checkedWarnings = dtb_u_u2416 } -> dtb_u_u2415
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Driver/Dt.vuna"
let v_checkedWarnings = (fun (dtb_u_u2417 : t_CheckedPackage) -> (match dtb_u_u2417 with
  | { f_CheckedPackage_checkedProgram = dtb_u_u2418; f_CheckedPackage_checkedModules = dtb_u_u2419; f_CheckedPackage_checkedEntryDecls = dtb_u_u2420; f_CheckedPackage_checkedInherited = dtb_u_u2421; f_CheckedPackage_checkedWarnings = dtb_u_u2422 } -> dtb_u_u2422
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Driver/Dt.vuna"
let v_genMetaId = (fun (dtb_u_u2423 : t_GenMeta) -> (match dtb_u_u2423 with
  | { f_GenMeta_genMetaId = dtb_u_u2424; f_GenMeta_genMetaName = dtb_u_u2425; f_GenMeta_genMetaKind = dtb_u_u2426 } -> dtb_u_u2424
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Driver/Dt.vuna"
let v_genMetaName = (fun (dtb_u_u2427 : t_GenMeta) -> (match dtb_u_u2427 with
  | { f_GenMeta_genMetaId = dtb_u_u2428; f_GenMeta_genMetaName = dtb_u_u2429; f_GenMeta_genMetaKind = dtb_u_u2430 } -> dtb_u_u2429
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Driver/Dt.vuna"
let v_genMetaKind = (fun (dtb_u_u2431 : t_GenMeta) -> (match dtb_u_u2431 with
  | { f_GenMeta_genMetaId = dtb_u_u2432; f_GenMeta_genMetaName = dtb_u_u2433; f_GenMeta_genMetaKind = dtb_u_u2434 } -> dtb_u_u2434
  | _ -> failwith "DT: impossible branch"
))

# 884 "Vuna/Compiler/Driver/Dt.vuna"
let v_miKind = (fun (dtb_u_u2435 : t_MainInfo) -> (match dtb_u_u2435 with
  | { f_MainInfo_miKind = dtb_u_u2436; f_MainInfo_miHostTags = dtb_u_u2437 } -> dtb_u_u2436
  | _ -> failwith "DT: impossible branch"
))

# 885 "Vuna/Compiler/Driver/Dt.vuna"
let v_miHostTags = (fun (dtb_u_u2438 : t_MainInfo) -> (match dtb_u_u2438 with
  | { f_MainInfo_miKind = dtb_u_u2439; f_MainInfo_miHostTags = dtb_u_u2440 } -> dtb_u_u2440
  | _ -> failwith "DT: impossible branch"
))

# 1316 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheKey = (fun (dtb_u_u2441 : t_AuxCache) -> (match dtb_u_u2441 with
  | { f_AuxCache_auxCacheKey = dtb_u_u2442; f_AuxCache_auxCacheDecls = dtb_u_u2443; f_AuxCache_auxCacheStart = dtb_u_u2444; f_AuxCache_auxCacheDepCps = dtb_u_u2445; f_AuxCache_auxCacheCleanCps = dtb_u_u2446 } -> dtb_u_u2442
  | _ -> failwith "DT: impossible branch"
))

# 1317 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheDecls = (fun (dtb_u_u2447 : t_AuxCache) -> (match dtb_u_u2447 with
  | { f_AuxCache_auxCacheKey = dtb_u_u2448; f_AuxCache_auxCacheDecls = dtb_u_u2449; f_AuxCache_auxCacheStart = dtb_u_u2450; f_AuxCache_auxCacheDepCps = dtb_u_u2451; f_AuxCache_auxCacheCleanCps = dtb_u_u2452 } -> dtb_u_u2449
  | _ -> failwith "DT: impossible branch"
))

# 1318 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheStart = (fun (dtb_u_u2453 : t_AuxCache) -> (match dtb_u_u2453 with
  | { f_AuxCache_auxCacheKey = dtb_u_u2454; f_AuxCache_auxCacheDecls = dtb_u_u2455; f_AuxCache_auxCacheStart = dtb_u_u2456; f_AuxCache_auxCacheDepCps = dtb_u_u2457; f_AuxCache_auxCacheCleanCps = dtb_u_u2458 } -> dtb_u_u2456
  | _ -> failwith "DT: impossible branch"
))

# 1319 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheDepCps = (fun (dtb_u_u2459 : t_AuxCache) -> (match dtb_u_u2459 with
  | { f_AuxCache_auxCacheKey = dtb_u_u2460; f_AuxCache_auxCacheDecls = dtb_u_u2461; f_AuxCache_auxCacheStart = dtb_u_u2462; f_AuxCache_auxCacheDepCps = dtb_u_u2463; f_AuxCache_auxCacheCleanCps = dtb_u_u2464 } -> dtb_u_u2463
  | _ -> failwith "DT: impossible branch"
))

# 1320 "Vuna/Compiler/Driver/Dt.vuna"
let v_auxCacheCleanCps = (fun (dtb_u_u2465 : t_AuxCache) -> (match dtb_u_u2465 with
  | { f_AuxCache_auxCacheKey = dtb_u_u2466; f_AuxCache_auxCacheDecls = dtb_u_u2467; f_AuxCache_auxCacheStart = dtb_u_u2468; f_AuxCache_auxCacheDepCps = dtb_u_u2469; f_AuxCache_auxCacheCleanCps = dtb_u_u2470 } -> dtb_u_u2470
  | _ -> failwith "DT: impossible branch"
))

# 1353 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsStartEc = (fun (dtb_u_u2471 : t_DtIncrSetup) -> (match dtb_u_u2471 with
  | { f_DtIncrSetup_dsStartEc = dtb_u_u2472; f_DtIncrSetup_dsStartGlobals = dtb_u_u2473; f_DtIncrSetup_dsTermAux = dtb_u_u2474; f_DtIncrSetup_dsPrepared = dtb_u_u2475; f_DtIncrSetup_dsDecls = dtb_u_u2476; f_DtIncrSetup_dsWarns = dtb_u_u2477; f_DtIncrSetup_dsDepCps = dtb_u_u2478; f_DtIncrSetup_dsCleanCps = dtb_u_u2479; f_DtIncrSetup_dsNext = dtb_u_u2480 } -> dtb_u_u2472
  | _ -> failwith "DT: impossible branch"
))

# 1354 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsStartGlobals = (fun (dtb_u_u2481 : t_DtIncrSetup) -> (match dtb_u_u2481 with
  | { f_DtIncrSetup_dsStartEc = dtb_u_u2482; f_DtIncrSetup_dsStartGlobals = dtb_u_u2483; f_DtIncrSetup_dsTermAux = dtb_u_u2484; f_DtIncrSetup_dsPrepared = dtb_u_u2485; f_DtIncrSetup_dsDecls = dtb_u_u2486; f_DtIncrSetup_dsWarns = dtb_u_u2487; f_DtIncrSetup_dsDepCps = dtb_u_u2488; f_DtIncrSetup_dsCleanCps = dtb_u_u2489; f_DtIncrSetup_dsNext = dtb_u_u2490 } -> dtb_u_u2483
  | _ -> failwith "DT: impossible branch"
))

# 1355 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsTermAux = (fun (dtb_u_u2491 : t_DtIncrSetup) -> (match dtb_u_u2491 with
  | { f_DtIncrSetup_dsStartEc = dtb_u_u2492; f_DtIncrSetup_dsStartGlobals = dtb_u_u2493; f_DtIncrSetup_dsTermAux = dtb_u_u2494; f_DtIncrSetup_dsPrepared = dtb_u_u2495; f_DtIncrSetup_dsDecls = dtb_u_u2496; f_DtIncrSetup_dsWarns = dtb_u_u2497; f_DtIncrSetup_dsDepCps = dtb_u_u2498; f_DtIncrSetup_dsCleanCps = dtb_u_u2499; f_DtIncrSetup_dsNext = dtb_u_u2500 } -> dtb_u_u2494
  | _ -> failwith "DT: impossible branch"
))

# 1356 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsPrepared = (fun (dtb_u_u2501 : t_DtIncrSetup) -> (match dtb_u_u2501 with
  | { f_DtIncrSetup_dsStartEc = dtb_u_u2502; f_DtIncrSetup_dsStartGlobals = dtb_u_u2503; f_DtIncrSetup_dsTermAux = dtb_u_u2504; f_DtIncrSetup_dsPrepared = dtb_u_u2505; f_DtIncrSetup_dsDecls = dtb_u_u2506; f_DtIncrSetup_dsWarns = dtb_u_u2507; f_DtIncrSetup_dsDepCps = dtb_u_u2508; f_DtIncrSetup_dsCleanCps = dtb_u_u2509; f_DtIncrSetup_dsNext = dtb_u_u2510 } -> dtb_u_u2505
  | _ -> failwith "DT: impossible branch"
))

# 1357 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsDecls = (fun (dtb_u_u2511 : t_DtIncrSetup) -> (match dtb_u_u2511 with
  | { f_DtIncrSetup_dsStartEc = dtb_u_u2512; f_DtIncrSetup_dsStartGlobals = dtb_u_u2513; f_DtIncrSetup_dsTermAux = dtb_u_u2514; f_DtIncrSetup_dsPrepared = dtb_u_u2515; f_DtIncrSetup_dsDecls = dtb_u_u2516; f_DtIncrSetup_dsWarns = dtb_u_u2517; f_DtIncrSetup_dsDepCps = dtb_u_u2518; f_DtIncrSetup_dsCleanCps = dtb_u_u2519; f_DtIncrSetup_dsNext = dtb_u_u2520 } -> dtb_u_u2516
  | _ -> failwith "DT: impossible branch"
))

# 1358 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsWarns = (fun (dtb_u_u2521 : t_DtIncrSetup) -> (match dtb_u_u2521 with
  | { f_DtIncrSetup_dsStartEc = dtb_u_u2522; f_DtIncrSetup_dsStartGlobals = dtb_u_u2523; f_DtIncrSetup_dsTermAux = dtb_u_u2524; f_DtIncrSetup_dsPrepared = dtb_u_u2525; f_DtIncrSetup_dsDecls = dtb_u_u2526; f_DtIncrSetup_dsWarns = dtb_u_u2527; f_DtIncrSetup_dsDepCps = dtb_u_u2528; f_DtIncrSetup_dsCleanCps = dtb_u_u2529; f_DtIncrSetup_dsNext = dtb_u_u2530 } -> dtb_u_u2527
  | _ -> failwith "DT: impossible branch"
))

# 1359 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsDepCps = (fun (dtb_u_u2531 : t_DtIncrSetup) -> (match dtb_u_u2531 with
  | { f_DtIncrSetup_dsStartEc = dtb_u_u2532; f_DtIncrSetup_dsStartGlobals = dtb_u_u2533; f_DtIncrSetup_dsTermAux = dtb_u_u2534; f_DtIncrSetup_dsPrepared = dtb_u_u2535; f_DtIncrSetup_dsDecls = dtb_u_u2536; f_DtIncrSetup_dsWarns = dtb_u_u2537; f_DtIncrSetup_dsDepCps = dtb_u_u2538; f_DtIncrSetup_dsCleanCps = dtb_u_u2539; f_DtIncrSetup_dsNext = dtb_u_u2540 } -> dtb_u_u2538
  | _ -> failwith "DT: impossible branch"
))

# 1360 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsCleanCps = (fun (dtb_u_u2541 : t_DtIncrSetup) -> (match dtb_u_u2541 with
  | { f_DtIncrSetup_dsStartEc = dtb_u_u2542; f_DtIncrSetup_dsStartGlobals = dtb_u_u2543; f_DtIncrSetup_dsTermAux = dtb_u_u2544; f_DtIncrSetup_dsPrepared = dtb_u_u2545; f_DtIncrSetup_dsDecls = dtb_u_u2546; f_DtIncrSetup_dsWarns = dtb_u_u2547; f_DtIncrSetup_dsDepCps = dtb_u_u2548; f_DtIncrSetup_dsCleanCps = dtb_u_u2549; f_DtIncrSetup_dsNext = dtb_u_u2550 } -> dtb_u_u2549
  | _ -> failwith "DT: impossible branch"
))

# 1361 "Vuna/Compiler/Driver/Dt.vuna"
let v_dsNext = (fun (dtb_u_u2551 : t_DtIncrSetup) -> (match dtb_u_u2551 with
  | { f_DtIncrSetup_dsStartEc = dtb_u_u2552; f_DtIncrSetup_dsStartGlobals = dtb_u_u2553; f_DtIncrSetup_dsTermAux = dtb_u_u2554; f_DtIncrSetup_dsPrepared = dtb_u_u2555; f_DtIncrSetup_dsDecls = dtb_u_u2556; f_DtIncrSetup_dsWarns = dtb_u_u2557; f_DtIncrSetup_dsDepCps = dtb_u_u2558; f_DtIncrSetup_dsCleanCps = dtb_u_u2559; f_DtIncrSetup_dsNext = dtb_u_u2560 } -> dtb_u_u2560
  | _ -> failwith "DT: impossible branch"
))
