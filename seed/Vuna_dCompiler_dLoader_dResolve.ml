open Vuna_runtime
# 39 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound = 1073741824

# 43 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity = (fun name -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicVisible dtb__0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicArity dtb__0))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName = (fun name -> (match (v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ ("Type", (Base_dList.C_Base_dList_dList__x58__x58_ ("->", (Base_dList.C_Base_dList_dList__x58__x58_ ("_", Base_dList.C_Base_dList_dList_Nil))))))) ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeTypeNames) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeValueNames))

# 60 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName = (fun name -> ((Base_dList.v_Base_dList_dmemName name) v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames))

# 70 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint = (fun mc0 -> (if (mc0 = "Show") then " (trait Show is not in scope; add `import Base.Show`)" else (if (mc0 = "Eq") then " (trait Eq is not in scope; add `import Base.Eq`)" else (if (mc0 = "Ord") then " (trait Ord is not in scope; add `import Base.Ord`)" else (if (mc0 = "show") then " (trait method show; add `import Base.Show`)" else (if (mc0 = "eq") then " (trait method eq; add `import Base.Eq`)" else (if (mc0 = "neq") then " (trait method neq; add `import Base.Eq`)" else (if (mc0 = "lt") then " (trait method lt; add `import Base.Ord`)" else (if (mc0 = "le") then " (trait method le; add `import Base.Ord`)" else (if (mc0 = "gt") then " (trait method gt; add `import Base.Ord`)" else (if (mc0 = "ge") then " (trait method ge; add `import Base.Ord`)" else "")))))))))))

# 92 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames = (fun d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__2, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__6, dtb__7, dtb__8, dtb__9) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__6, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__10, dtb__11, dtb__12) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__10, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__13, dtb__14, dtb__15, dtb__16) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__13, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__17, dtb__18, dtb__19, dtb__20) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 103 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames) decls))

# 111 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c); Base_dPair.f_Base_dPair_dPair_second = (String.concat "" [dtb__23; "."; (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c)]) })) dtb__26)) (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__32 }, (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22)))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith = (fun release decls -> ((fun vals -> ((fun cts -> ((fun tys -> ((fun cands -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues = vals; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors = cts; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes = tys; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet = (Base_dHashMap.v_Base_dHashMap_dofNames vals); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet = (Base_dHashMap.v_Base_dHashMap_dofNames cts); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet = (Base_dHashMap.v_Base_dHashMap_dofNames tys); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands = cands; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease = release }) (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf decls))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf decls))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))) (v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf decls)))

# 130 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf = (fun _uarity0 -> ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith false) _uarity0))

# 135 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets = (fun prefix ns name -> ((Base_dList.v_Base_dList_dmap (fun p -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (Base_dPair.v_Base_dPair_dsecondOf p)))) ((Base_dList.v_Base_dList_dfilter (fun p -> ((Base_dPair.v_Base_dPair_dfirstOf p) = name))) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands)))

# 140 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTarget = (fun prefix ns name -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__40))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))

# 150 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget = (fun p -> ((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

# 154 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor = (fun modules p -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget modules) (v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget p)))

# 158 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets = (fun modules imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor modules)) pairs))))))))

# 174 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__42, dtb__43) -> true
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates = (fun modules prefix ns imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets modules) imports) name)) (fun imp -> ((fun local -> (if (if (if (if (v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList local) then (name <> "Nil") else false) then (name <> "Cons") else false) then (name <> "::") else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (local)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dappend local) imp)))))) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))))

# 178 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified = (fun modules label imports name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = dtb__45 } -> ((fun prefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (prefix))) prefix)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__46) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__46)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__45) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((dtb__47).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__45) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((dtb__48).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__45) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((dtb__49).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (dtb__45, dtb__46))) dtb__45) dtb__46)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__44))
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__50, dtb__51) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__50) = mc0) then true else ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc0) dtb__51))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__54) = mc1) then (if ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc2) dtb__57) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) dtb__54) mc2))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__53))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> (if (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__63) = mc1) then (dtb__63 = mc2) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__63))) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__53))
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__53)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72) -> (match ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__71)) mc1) mc2) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__71)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules dtb__72) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily = (fun prefix rel -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot rel)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__74; Base_dPair.f_Base_dPair_dPair_second = dtb__75 } -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__74))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily = (fun modules prefix ns famTarget base -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (match dtb__76 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__78; Base_dPair.f_Base_dPair_dPair_second = dtb__79 } -> (match dtb__77 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__79)))
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)) ((Base_dList.v_Base_dList_dfilter (fun p -> (if ((Base_dPair.v_Base_dPair_dfirstOf p) = base) then (((v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily prefix) (Base_dPair.v_Base_dPair_dsecondOf p)) = famTarget) else false))) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands)))

# 249 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly = (fun modules label imports name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = dtb__81 } -> ((fun typePrefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (typePrefix))) typePrefix)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__82)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__81) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__83) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((dtb__83).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__81) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__84) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((dtb__84).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeNotExported (dtb__81, dtb__82))) dtb__81) dtb__82)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__80))
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicTypeName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly modules) label) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownType (name))) name)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))))))

# 264 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__85; Base_dPair.f_Base_dPair_dPair_second = dtb__86 } -> ((fun famName -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget modules) label) prefix) ns) imports) famName)) (fun famTarget -> (match (((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily modules) prefix) ns) famTarget) dtb__86) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__87))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeHasNoConstructor (famName, dtb__86))) famName) dtb__86)
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__85))
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dexportTarget = (fun e -> (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

# 292 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dallEq = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__88, dtb__89) -> (if (mc0 = dtb__88) then ((v_Vuna_dCompiler_dLoader_dResolve_dallEq mc0) dtb__89) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__90, dtb__91) -> ((v_Vuna_dCompiler_dLoader_dResolve_dallEq dtb__90) dtb__91)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__92, dtb__93) -> (if (v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__92, dtb__93)))) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dResolve_dexportTarget dtb__92))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc1) (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__92, dtb__93))))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownConstructor (mc1))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__94; Base_dPair.f_Base_dPair_dPair_second = dtb__95 } -> ((fun prefixName -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefixName) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__96)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) dtb__95) with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (dtb__95, dtb__96))) dtb__95) dtb__96)
  | dtb__97 -> (((v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget label) dtb__95) dtb__97)
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__94))
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__98, dtb__99) -> (((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (mc0, dtb__98, mc2))) dtb__99) mc2)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__100, dtb__101) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__100, ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (mc0 - 1)) dtb__101))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_ddropSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__102, dtb__103) -> (if (mc0 <= 0) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__102, dtb__103)) else ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (mc0 - 1)) dtb__103))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath = (fun modules label imports segs n sp -> (if (n < 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (n - 1)) segs))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__104)) (fun es -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (match dtb__106 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__105) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((dtb__107).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__105) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((dtb__108).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__105) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((dtb__109).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (dtb__105, dtb__104))) dtb__105) dtb__104)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__105) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((dtb__110).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, sp))) dtb__106) sp)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (dtb__105, dtb__104))) dtb__105) dtb__104)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (n - 1)) segs))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) segs) (n - 1)) sp)
  | _ -> failwith "DT: impossible branch"
)))

# 399 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (match dtb__112 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__111
  | _ -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor = (fun modules label prefix ns imports name -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (match cands with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsuggest name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownConstructor (name))) name))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) pairs)))))
)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))
)))))

# 420 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder = (fun label name -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidVariableName (name))) name) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name))))

# 424 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName = (fun label name -> (if (name = "_") then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidTopLevelName ("_"))) "_") else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidTopLevelName (name))) name) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)))))

# 429 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName = (fun label prefix name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

# 433 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern = (fun fuel modules label prefix ns imports pat -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__113) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__113)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__114, dtb__115) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__115)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label) dtb__114))) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__114, dtb__115)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__114, Base_dList.C_Base_dList_dList_Nil)) }))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__116, dtb__117, dtb__118) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__117)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__116, (Base_dPair.v_Base_dPair_dfirstOf p), dtb__118)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__116, (Base_dPair.v_Base_dPair_dsecondOf p))) }))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__119, dtb__120) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__119, dtb__120)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__121, dtb__122) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__121, dtb__122)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__123, dtb__124, dtb__125) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__123) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__124)) (fun parts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__123, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__125)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts) })))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__125)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__123))) (fun name2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__124)) (fun parts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__125)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts) })))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__126, dtb__127, dtb__128) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__128)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__126))) (fun name2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__127)) (fun parts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__128)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts) }))))))
  | _ -> failwith "DT: impossible branch"
)))
# 457 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__129; Base_dPair.f_Base_dPair_dPair_second = dtb__130 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__130)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__131; Base_dPair.f_Base_dPair_dPair_second = dtb__132 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__129; Base_dPair.f_Base_dPair_dPair_second = dtb__131 }; Base_dPair.f_Base_dPair_dPair_second = dtb__132 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__133, dtb__134) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__133)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__135; Base_dPair.f_Base_dPair_dPair_second = dtb__136 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__134)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__137; Base_dPair.f_Base_dPair_dPair_second = dtb__138 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__135, dtb__137)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__136) dtb__138) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })))
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__139, dtb__140) -> (match dtb__139 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__141; Base_dPair.f_Base_dPair_dPair_second = dtb__142 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__141)) (fun pr -> (match pr with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__143; Base_dPair.f_Base_dPair_dPair_second = dtb__144 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__140)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__145; Base_dPair.f_Base_dPair_dPair_second = dtb__146 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend dtb__144) dtb__145); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__143; Base_dPair.f_Base_dPair_dPair_second = dtb__142 }, dtb__146)) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 555 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__147, dtb__148) -> (match dtb__147 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__149) -> (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__149))), (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__149, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__149))), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__148)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__150) -> (if (dtb__150 = "") then ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__148) else (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__150, mc0)), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__148))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 562 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__151, dtb__152) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft mc0) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc0)), (Base_dList.C_Base_dList_dList__x58__x58_ (mc1, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__151, Base_dList.C_Base_dList_dList_Nil)))), mc0))) dtb__152)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate = (fun sp parts -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks sp) parts) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ("", sp))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__153, dtb__154) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft sp) dtb__153) dtb__154)
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct = (fun release sp name resolved scope -> (if release then (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disDebugOnlyName resolved) then (if ((Base_dList.v_Base_dList_dmemName name) scope) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp)))) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DebugConstructInRelease (resolved))) resolved)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))))

# 579 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disParserSyntaxName = (fun name -> (if (if (if (if (if (if (if (if (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax)) then true else ((Base_dString.v_Base_dString_dstartsWith "@vuna@list@") name)) then true else ((Base_dString.v_Base_dString_dstartsWith "@vuna@handle@") name)))

# 746 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label prefix dname ctor -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical prefix) dname) ctor))))))

# 751 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__155, dtb__156) -> (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__155)
  | _ -> failwith "DT: impossible branch"
))

# 756 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__157, dtb__158) -> (if (dtb__157 >= 65) then (dtb__157 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

# 784 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult = (fun label prefix ns name -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__159, dtb__160) -> (match dtb__160 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__159))))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousConstructor (name, ("Data." ^ name)))) name) ("Data." ^ name))
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))

# 791 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__161))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun vp -> (match vp with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cp -> (match cp with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun tp -> (match tp with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) tp)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) cp)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) vp)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
  | _ -> failwith "DT: impossible branch"
)))))

# 832 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__162; Base_dPair.f_Base_dPair_dPair_second = dtb__163 } -> ((fun typePrefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__164) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__164))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__165) -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (typePrefix))) typePrefix)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__166)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__163) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((dtb__167).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__163) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__168) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((dtb__168).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeNotExported (dtb__163, dtb__166))) dtb__163) dtb__166)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__162))
  | _ -> failwith "DT: impossible branch"
))

# 814 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName = (fun modules label prefix ns imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__169) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__169))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__170) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__170))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__171) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__171)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))
  | _ -> failwith "DT: impossible branch"
))))

# 774 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicTypeName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName modules) label) prefix) ns) imports) name) else ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName modules) label) prefix) ns) imports) name))))))

# 859 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__172, dtb__173) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__172))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__174, dtb__175, dtb__176) -> (match dtb__174 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__177, dtb__178) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__177))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 899 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label prefix name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

# 1000 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disLowerIdent = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__179, dtb__180) -> (if (dtb__179 >= 97) then (dtb__179 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 995 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__181, dtb__182, dtb__183) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames dtb__181)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames) dtb__182))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__184, dtb__185) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerIdent dtb__184) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__184, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 1005 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__186, dtb__187) -> (match dtb__186 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__188; Base_dPair.f_Base_dPair_dPair_second = dtb__189 } -> (if (dtb__188 = mc0) then dtb__189 else ((v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf mc0) dtb__187))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__190, dtb__191) -> "do"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__192, dtb__193, dtb__194, dtb__195) -> "if"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__196, dtb__197, dtb__198) -> "case"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__199, dtb__200, dtb__201, dtb__202) -> "let"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__203, dtb__204, dtb__205) -> "lam"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__206, dtb__207) -> "float"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__208, dtb__209) -> "str"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__210, dtb__211) -> "int"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__212, dtb__213, dtb__214) -> "app"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__215, dtb__216) -> ("var " ^ dtb__215)
  | _ -> "other"
))

# 870 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped = (fun fuel modules label prefix ns imports bound ty -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__220)) (fun dom2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__217, bound))) dtb__221)) (fun cod2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__217, dtb__218, dtb__219, dom2, cod2, dtb__222))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__223, dtb__224, dtb__225) -> (match dtb__223 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__226, dtb__227) -> (if (dtb__226 = "Type") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__223)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__224)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__225)))))))))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__223)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__224)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__225))))))))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__228, dtb__229) -> (if ((Base_dList.v_Base_dList_dmemName dtb__228) bound) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName dtb__228) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unexpanded macro invocation " ^ dtb__228)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__228) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__229)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__228))) (fun n -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, dtb__229)))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__230, dtb__231) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__232, dtb__233) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan ty))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidTypeExpression ((v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)))) (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)))
)) ty)))

# 864 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel modules label prefix ns imports ty -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped fuel) modules) label) prefix) ns) imports) Base_dList.C_Base_dList_dList_Nil) ty))

# 852 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr = (fun modules label prefix ns imports cx -> (match (v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf cx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__234) -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__234) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__235) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan cx))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownInterface (dtb__234))) dtb__234))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__236) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

# 904 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__237; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__238; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__239; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__240 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__240)) ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) mc5) dtb__237))) (fun c2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__238)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = c2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__239; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__240 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 946 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__241; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__242; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__243 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__243)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__241))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__242)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__241; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__243 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 951 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__244; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__245; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__246 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__246)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__244))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__245)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = n; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__246 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1045 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__247, dtb__248) -> (match dtb__247 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__249; Base_dPair.f_Base_dPair_dPair_second = dtb__250 } -> ((fun isCtor -> (if isCtor then (Base_dList.C_Base_dList_dList__x58__x58_ ((dtb__250).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__248))) else ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__248))) (if ((dtb__250).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then true else ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget mc0) (dtb__250).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal = (fun modules label prefix ns imports scope name -> (if ((Base_dList.v_Base_dList_dmemName name) scope) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (match (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name) with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__251, dtb__252) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))))
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified modules) label) imports) name) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (match cands with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cpairs -> (match cpairs with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun tpairs -> (match tpairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsuggest name) ((Base_dList.v_Base_dList_dappend (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues) ((Base_dList.v_Base_dList_dappend (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors) ((Base_dList.v_Base_dList_dappend (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes) scope)))))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage (v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint name))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownVariable (name))) name)))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) tpairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) cpairs)))))
)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))
)))
  | _ -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets modules) pairs) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
  | dtb__253 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (Base_dList.v_Base_dList_dnubNames dtb__253))))
)
)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 312 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules label prefix ns imports scope name sp -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "empty dotted name")
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__254, dtb__255) -> (if ((Base_dList.v_Base_dList_dmemName dtb__254) scope) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__254, sp))) dtb__255) sp))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) sp))) (fun q -> (match q with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__256) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__256))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__254) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__254), sp))) dtb__255) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__254) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__254, sp))) dtb__255) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__254) then (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__257) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__257, sp))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__258) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (dtb__254))) dtb__254))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__254))) (fun n -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, sp))) dtb__255) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind = (fun modules label prefix ns imports scope -> (match (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) ">>=") with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__259) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__259))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__260) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) "bind")
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__261; Base_dPair.f_Base_dPair_dPair_second = dtb__262 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__261)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = dtb__264 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__264) mc6)) dtb__262)) (fun body2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
# 473 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__265; Base_dPair.f_Base_dPair_dPair_second = dtb__266 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__265)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__267; Base_dPair.f_Base_dPair_dPair_second = dtb__268 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__268) mc6)) dtb__266)) (fun body2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__267; Base_dPair.f_Base_dPair_dPair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
# 492 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel modules label prefix ns imports scope rec_u binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
# 498 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__269, dtb__270) -> (match dtb__269 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__271; Base_dPair.f_Base_dPair_dPair_second = dtb__272 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__272)) (fun value2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__271)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__273; Base_dPair.f_Base_dPair_dPair_second = dtb__274 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend dtb__274) scope)) dtb__270) body)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__275; Base_dPair.f_Base_dPair_dPair_second = dtb__276 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__273; Base_dPair.f_Base_dPair_dPair_second = value2 }, dtb__275)); Base_dPair.f_Base_dPair_dPair_second = dtb__276 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = b }))))
  | _ -> failwith "DT: impossible branch"
)) binds)))
# 512 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__277) -> (match dtb__277 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__278; Base_dPair.f_Base_dPair_dPair_second = dtb__279 } -> ((fun scope2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__279)) (fun values2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = values2; Base_dPair.f_Base_dPair_dPair_second = b }))))))) ((Base_dList.v_Base_dList_dappend dtb__278) scope))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__280) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__280))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ns) imports) binds))))
# 531 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__281, dtb__282) -> (match dtb__281 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__283; Base_dPair.f_Base_dPair_dPair_second = dtb__284 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__284)) (fun value2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__282)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__283; Base_dPair.f_Base_dPair_dPair_second = value2 }, tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 591 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel modules label prefix ns imports scope expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__285, dtb__286) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__285) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__285, dtb__286)))) else (if ((Base_dString.v_Base_dString_dstartsWith "!") dtb__285) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((((Base_dString.v_Base_dString_dsubstring 1) (bi_natFromInt (bi_strLength dtb__285))) dtb__285), dtb__286)))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName dtb__285) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unexpanded macro invocation " ^ dtb__285)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__285) then (if (if (if (if (if (v_Vuna_dCompiler_dLoader_dResolve_disParserSyntaxName dtb__285) then true else ((Base_dString.v_Base_dString_dstartsWith "Base.") prefix)) then true else ((Base_dString.v_Base_dString_dstartsWith "Vuna.") prefix)) then true else ((Base_dString.v_Base_dString_dstartsWith "Base_d") prefix)) then true else ((Base_dString.v_Base_dString_dstartsWith "Vuna_d") prefix)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__285, dtb__286)))) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__286)) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownVariable (dtb__285))) dtb__285))) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot dtb__285) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__285) dtb__286) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__286)) (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__285))) (fun n -> (((((v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease) dtb__286) dtb__285) n) scope))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__287, dtb__288, dtb__289, dtb__290) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unreordered infix operator " ^ dtb__287))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__291, dtb__292, dtb__293, dtb__294) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unreordered backtick infix operator " ^ dtb__291))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__295, dtb__296) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unreordered operator section ("; dtb__295; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__297, dtb__298, dtb__299) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unreordered left operator section ("; dtb__297; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__300, dtb__301, dtb__302) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unreordered right operator section ("; dtb__301; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__303, dtb__304) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__303)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__305, dtb__306) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__305, dtb__306))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__307, dtb__308) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__307, dtb__308))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__309, dtb__310) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__309, dtb__310))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__311, dtb__312, dtb__313) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__312)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate dtb__313) ps)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__314, dtb__315, dtb__316) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__316)) ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__314)))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__314)) scope)) dtb__315)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__314, b, dtb__316))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__317, dtb__318, dtb__319) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__317)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__318)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__319))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__323)) (fun dom2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__320, Base_dList.C_Base_dList_dList_Nil))) scope)) dtb__324)) (fun cod2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__320, dtb__321, dtb__322, dom2, cod2, dtb__325))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__326, dtb__327, dtb__328, dtb__329) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__328) dtb__326) dtb__327)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__330; Base_dPair.f_Base_dPair_dPair_second = dtb__331 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__330, dtb__331, dtb__328, dtb__329))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__332, dtb__333) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__332)) (fun clauses2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (clauses2, dtb__333))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__334, dtb__335, dtb__336) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__334)) (fun scrut2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__335)) (fun alts2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (scrut2, alts2, dtb__336))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__337, dtb__338, dtb__339, dtb__340) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__337)) (fun c2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__338)) (fun t2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__339)) (fun e2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, e2, dtb__340))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__341, dtb__342, dtb__343) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__341)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (b, dtb__342, dtb__343))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__344, dtb__345, dtb__346) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__346)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__344))) (fun name2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__345)) (fun fs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (name2, fs, dtb__346))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__347, dtb__348, dtb__349) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__347)) (fun b -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__348)) (fun fs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (b, fs, dtb__349))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__350, dtb__351) -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDo (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__350) dtb__351)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__352, dtb__353, dtb__354) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__352)) (fun v2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__353)) (fun t2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (v2, t2, dtb__354))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 675 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts = (fun fuel modules label prefix ns imports scope parts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__355, dtb__356) -> (match dtb__355 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__357) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__357)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__356)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (e2)), ps))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__358) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__356)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__358)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 696 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDo = (fun fuel modules label prefix ns imports scope stmts blockSpan -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__359, dtb__360) -> (match dtb__359 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__361, dtb__362) -> (match dtb__360 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__361)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At blockSpan) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
# 723 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain = (fun fuel modules label prefix ns imports scope bindName stmts blockSpan -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__363, dtb__364) -> (match dtb__363 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__365, dtb__366, dtb__367) -> (match dtb__365 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__368) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__366)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__364) blockSpan)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__367)), (Base_dList.C_Base_dList_dList__x58__x58_ (e2, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = "_"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dList.C_Base_dList_dList_Nil)), tail, dtb__367)), Base_dList.C_Base_dList_dList_Nil)))), dtb__367))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__369, dtb__370) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__366)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__369, scope))) bindName) dtb__364) blockSpan)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName bindName), dtb__367)), (Base_dList.C_Base_dList_dList__x58__x58_ (e2, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__369; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__369) dtb__370) }, Base_dList.C_Base_dList_dList_Nil)), tail, dtb__367)), Base_dList.C_Base_dList_dList_Nil)))), dtb__367))))))))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At dtb__367) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_DoBindPattern)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__371, dtb__372) -> (match dtb__364 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__371)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__371)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__364) blockSpan)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__372)), (Base_dList.C_Base_dList_dList__x58__x58_ (e2, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = "_"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dList.C_Base_dList_dList_Nil)), tail, dtb__372)), Base_dList.C_Base_dList_dList_Nil)))), dtb__372))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At blockSpan) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
# 739 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__373; Base_dPair.f_Base_dPair_dPair_second = dtb__374 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__374)) (fun v -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__373; Base_dPair.f_Base_dPair_dPair_second = v })))))
  | _ -> failwith "DT: impossible branch"
))

# 957 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__375, dtb__376, dtb__377, dtb__378) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__378)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__375))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__376)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__377)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__375, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__378))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__379, dtb__380, dtb__381, dtb__382) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__382)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__379))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__380)) (fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__381)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__379, ctx2, ty2, dtb__382))))))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unexpected instance body declaration")
))

# 910 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules label prefix ns imports d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__391)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__383))) (fun dn -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__385)) (fun kind2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ns) imports) dtb__383)) dtb__386)) (fun ctors2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__387)) (fun ds2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dn, dtb__384, kind2, ctors2, ds2, dtb__388, dtb__389, dtb__390, dtb__391))))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__399)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__392))) (fun dn -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ns) imports)) dtb__394)) (fun fields2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__395)) (fun ds2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dn, dtb__393, fields2, ds2, dtb__396, dtb__397, dtb__398, dtb__399))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__400, dtb__401, dtb__402, dtb__403, dtb__404) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__404)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__400))) (fun tn -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__402)) (fun ss -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ns) imports)) dtb__403)) (fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (tn, dtb__401, ss, ms, dtb__404))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__405, dtb__406, dtb__407, dtb__408) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__405)) (fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__406)) (fun head2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) ns) imports)) dtb__407)) (fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctx2, head2, ms, dtb__408))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__409, dtb__410, dtb__411, dtb__412) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__412)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__409))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__410)) (fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__411)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (n, ctx2, ty2, dtb__412))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__413, dtb__414, dtb__415) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__415)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__413))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__414)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (n, ty2, dtb__415))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__416, dtb__417, dtb__418, dtb__419) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__419)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__416))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__418)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (n, dtb__417, ty2, dtb__419))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__420, dtb__421, dtb__422, dtb__423) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__423)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__420))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__421)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__422)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (n, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__423))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1009 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDeclWithImplicitScopes = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__424, dtb__425, dtb__426, dtb__427) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__427)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc2) mc3) dtb__424))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5)) dtb__425)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) ((v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf dtb__424) mc0))) dtb__426)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (n, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__427))))))))))
  | _ -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl mc1) mc2) mc3) mc4) mc5) mc6)
))

# 1052 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disStringDomainExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__428, dtb__429) -> (if (dtb__428 = "String") then true else (if (dtb__428 = "Base.String.String") then true else false))
  | _ -> false
))

# 989 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__430, dtb__431, dtb__432, dtb__433, dtb__434, dtb__435) -> (if dtb__431 then (if (dtb__430 = "_") then (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__434) else (if (v_Vuna_dCompiler_dLoader_dResolve_disStringDomainExpr dtb__433) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__430, (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__434))) else (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__434))) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 978 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__436, dtb__437) -> (match dtb__436 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__438, dtb__439, dtb__440, dtb__441) -> ((fun names -> (match names with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__437)
  | _ -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__438; Base_dPair.f_Base_dPair_dPair_second = names }, (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__437)))
)) (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__440)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames) dtb__439))))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__437)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 967 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules label prefix ns imports decls -> ((fun implicitScopes -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDeclWithImplicitScopes implicitScopes) modules) label) prefix) ns) imports)) decls)) (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable decls)))

# 1018 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun release modules entryPkg imports decls -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith release) decls)) imports) decls))

# 1022 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__442, dtb__443) -> (match dtb__442 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__444; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__445; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__446; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__447; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__448; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__449; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__450; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__451; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__452; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__453 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram mc1) dtb__444) dtb__444) ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith mc0) dtb__448)) ((Base_dList.v_Base_dList_dappend dtb__446) dtb__447)) dtb__448)) (fun d1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dresolveModules mc0) dtb__443)) (fun d2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
