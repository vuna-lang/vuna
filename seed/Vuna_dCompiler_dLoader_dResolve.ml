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

# 228 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpathKey = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = dtb__45 } -> (String.concat "" [dtb__44; "|"; (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__45)])
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dmemPathKey = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (if ((v_Vuna_dCompiler_dLoader_dResolve_dpathKey dtb__46) = mc0) then true else ((v_Vuna_dCompiler_dLoader_dResolve_dmemPathKey mc0) dtb__47))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_duniqPathResults = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (if ((v_Vuna_dCompiler_dLoader_dResolve_dmemPathKey (v_Vuna_dCompiler_dLoader_dResolve_dpathKey dtb__48)) dtb__49) then (v_Vuna_dCompiler_dLoader_dResolve_duniqPathResults dtb__49) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__48, (v_Vuna_dCompiler_dLoader_dResolve_duniqPathResults dtb__49))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__50, dtb__51) -> (match dtb__51 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__50
  | _ -> (String.concat "" [dtb__50; ", "; (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin dtb__51)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlastSegmentOf = (fun name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__52; Base_dPair.f_Base_dPair_dPair_second = dtb__53 } -> dtb__53
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (match dtb__54 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__56; Base_dPair.f_Base_dPair_dPair_second = dtb__57 } -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__58, dtb__59) -> dtb__58
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel mc0) dtb__55)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__60, dtb__61) -> (match dtb__60 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__62; Base_dPair.f_Base_dPair_dPair_second = dtb__63 } -> dtb__62
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dentryHits = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__64, dtb__65) -> (match dtb__64 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__66; Base_dPair.f_Base_dPair_dPair_second = dtb__67 } -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__68, dtb__69) -> (match dtb__69 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__68 = mc3) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc1) dtb__66)) (fun es -> (match ((mc0 es) mc3) with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__65) mc3)
  | dtb__70 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__65) mc3)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> { Base_dPair.f_Base_dPair_dPair_first = dtb__66; Base_dPair.f_Base_dPair_dPair_second = e })) dtb__70)) hits)))))
))) else ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__65) mc3))
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__65) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__65) mc3)
)) dtb__67)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickValueEntry = (fun es base -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base)
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickValueEntries = (fun es base -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValues es) base) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportTypes es) base)
  | dtb__72 -> dtb__72
))

# 278 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickTypeEntries = (fun es base -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportTypes es) base) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValues es) base)
  | dtb__73 -> dtb__73
))

# 311 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__74, dtb__75) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__74) = mc0) then true else ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc0) dtb__75))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (match dtb__76 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__78) = mc1) then (if ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc2) dtb__81) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) dtb__78) mc2))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__77))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> (if (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__87) = mc1) then (dtb__87 = mc2) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__87))) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__77))
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__77)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__95, dtb__96) -> (match ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__95)) mc1) mc2) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__95)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__97) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__97))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules dtb__96) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily = (fun prefix rel -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot rel)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__98; Base_dPair.f_Base_dPair_dPair_second = dtb__99 } -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__98))
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily = (fun modules prefix ns famTarget base -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__100, dtb__101) -> (match dtb__100 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__102; Base_dPair.f_Base_dPair_dPair_second = dtb__103 } -> (match dtb__101 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__103)))
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)) ((Base_dList.v_Base_dList_dfilter (fun p -> (if ((Base_dPair.v_Base_dPair_dfirstOf p) = base) then (((v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily prefix) (Base_dPair.v_Base_dPair_dsecondOf p)) = famTarget) else false))) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands)))

# 374 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dexportTarget = (fun e -> (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

# 390 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dallEq = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (if (mc0 = dtb__104) then ((v_Vuna_dCompiler_dLoader_dResolve_dallEq mc0) dtb__105) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__106, dtb__107) -> ((v_Vuna_dCompiler_dLoader_dResolve_dallEq dtb__106) dtb__107)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__108, dtb__109) -> (if (v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__108, dtb__109)))) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dResolve_dexportTarget dtb__108))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc1) (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__108, dtb__109))))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownConstructor (mc1))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 396 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (match dtb__110 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__112; Base_dPair.f_Base_dPair_dPair_second = dtb__113 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__114, dtb__115) -> (match dtb__115 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__114 = mc2) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__112)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) dtb__114) with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__111) mc2)
  | dtb__116 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__111) mc2)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> { Base_dPair.f_Base_dPair_dPair_first = dtb__112; Base_dPair.f_Base_dPair_dPair_second = e })) dtb__116)) hits)))))
))) else (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__111) mc2))
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__111) mc2)
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__111) mc2)
)) dtb__113)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyEntryOf = (fun base parent x -> (if (if ((x).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((x).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = base) else false) then ((x).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = parent) else false))

# 412 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__117, dtb__118) -> (match dtb__117 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = dtb__120 } -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__121, dtb__122) -> (match dtb__122 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__123, dtb__124) -> (match dtb__124 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (if (dtb__121 = mc2) then (dtb__123 = mc3) else false) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__119)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__125) -> (match ((Base_dList.v_Base_dList_dfilter ((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyEntryOf mc3) (dtb__125).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)) es) with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__126, dtb__127) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__118) mc2) mc3)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc3; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__126).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = (dtb__125).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target } }, hits))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls mc0) dtb__119)) (fun ds -> (match ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls dtb__119) (dtb__125).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) mc3) ds) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__128) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__118) mc2) mc3)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc3; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__128; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = (dtb__125).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target } }, hits))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__118) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__118) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
))) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__118) mc2) mc3))
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__118) mc2) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__118) mc2) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__118) mc2) mc3)
)) dtb__120)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (mc0, dtb__129, mc2))) dtb__130) mc2)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__131, dtb__132) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__131, ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (mc0 - 1)) dtb__132))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntryGo = (fun es segs k -> (if (k <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportModule es) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs k) segs))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__133) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__133).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Base_dPair.f_Base_dPair_dPair_second = k }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntryGo es) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 193 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntry = (fun es segs -> (((v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntryGo es) segs) (Base_dList.v_Base_dList_dlength segs)))

# 472 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_ddropSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__134, dtb__135) -> (if (mc0 <= 0) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__134, dtb__135)) else ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (mc0 - 1)) dtb__135))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePathsFuel = (fun fuel modules m segs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "namespace path") else (if (v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList segs) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__136) -> (match dtb__136 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__137; Base_dPair.f_Base_dPair_dPair_second = dtb__138 } -> ((((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePathsFuel (fuel - 1)) modules) dtb__137) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs dtb__138) segs))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = segs }))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntry es) segs)))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = m; Base_dPair.f_Base_dPair_dPair_second = segs })))))

# 180 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePaths = (fun modules m segs -> ((((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePathsFuel (1 + (Base_dList.v_Base_dList_dlength segs))) modules) m) segs))

# 217 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespaceCandidates = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__139, dtb__140) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePaths mc0) dtb__139) mc2)) (fun p -> ((((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespaceCandidates mc0) dtb__140) mc2) (Base_dList.C_Base_dList_dList__x58__x58_ (p, mc3)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixesTry = (fun modules imports segs n -> (if (n < 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dqualifierCandidates imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs n) segs))) with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__141 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespaceCandidates modules) dtb__141) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs n) segs)) Base_dList.C_Base_dList_dList_Nil)) (fun rs -> (match (v_Vuna_dCompiler_dLoader_dResolve_duniqPathResults rs) with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__142 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__142))
)))
)))

# 204 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes = (fun modules imports segs -> ((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixesTry modules) imports) segs) ((Base_dList.v_Base_dList_dlength segs) - 1)))

# 283 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified = (fun modules label imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) (fun ps -> (match ps with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (name))) name)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits v_Vuna_dCompiler_dLoader_dResolve_dpickValueEntries) modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps))) (fun hits -> (match hits with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "value") ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) hits)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
))))

# 476 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__143, dtb__144) -> (match dtb__143 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__145; Base_dPair.f_Base_dPair_dPair_second = dtb__146 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__144) mc2)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__147, dtb__148) -> (match dtb__148 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__147 = mc2) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__145)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dpickValueEntries es) mc2) with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__144) mc2)
  | dtb__149 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__144) mc2)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dLoader_dResolve_dexportTarget e); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })) dtb__149)) hits)))))
))) else (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__144) mc2))
  | _ -> (if (dtb__147 = mc2) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__145)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValues es) mc2) with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__144) mc2)
  | dtb__150 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__144) mc2)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun e -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dLoader_dResolve_dexportTarget e); Base_dPair.f_Base_dPair_dPair_second = dtb__148 })) dtb__150)) hits)))))
))) else (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__144) mc2))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__146)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_duniqPathTargets = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__151, dtb__152) -> (if ((v_Vuna_dCompiler_dLoader_dResolve_dmemPathKey (v_Vuna_dCompiler_dLoader_dResolve_dpathKey dtb__151)) dtb__152) then (v_Vuna_dCompiler_dLoader_dResolve_duniqPathTargets dtb__152) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__151, (v_Vuna_dCompiler_dLoader_dResolve_duniqPathTargets dtb__152))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 514 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dallEmptyTails = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__153, dtb__154) -> (match dtb__153 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__155; Base_dPair.f_Base_dPair_dPair_second = dtb__156 } -> (match dtb__156 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dLoader_dResolve_dallEmptyTails dtb__154)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__157, dtb__158) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly = (fun modules label imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) (fun ps -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths ps) then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (name))) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits v_Vuna_dCompiler_dLoader_dResolve_dpickTypeEntries) modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps))) (fun hits -> (match hits with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) hits)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))))))

# 336 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicTypeName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly modules) label) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownType (name))) name)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))))))

# 362 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__159; Base_dPair.f_Base_dPair_dPair_second = dtb__160 } -> ((fun famName -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget modules) label) prefix) ns) imports) famName)) (fun famTarget -> (match (((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily modules) prefix) ns) famTarget) dtb__160) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__161))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeHasNoConstructor (famName, dtb__160))) famName) dtb__160)
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__159))
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted = (fun modules label prefix ns imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) (fun ps -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths ps) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps))) (fun hits -> (if (v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList hits) then (((v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget label) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dsecondOf) hits)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) (v_Vuna_dCompiler_dLoader_dResolve_dlastSegmentOf name))) (fun familyHits -> (match familyHits with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "constructor") (v_Vuna_dCompiler_dLoader_dResolve_dlastSegmentOf name)) familyHits)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))))))))

# 500 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath = (fun modules label imports segs n sp -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs n) segs))) (fun ps -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths ps) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps))) (fun hits -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (match dtb__162 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__164; Base_dPair.f_Base_dPair_dPair_second = dtb__165 } -> (match dtb__165 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__163 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__164, sp))))))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousModule (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps), (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) nd_uscrut8))))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps)) (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) nd_uscrut8)))
)
  | _ -> (match dtb__163 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__164, sp))) dtb__165) sp)))))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousModule (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps), (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) nd_uscrut8))))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps)) (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) nd_uscrut8)))
)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf "") ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf "") ps))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dResolve_duniqPathTargets hits))))))))

# 563 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickValueOrOver = (fun name pairs -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (match dtb__167 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__166
  | _ -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueName name) nd_uscrut2)
)
  | Base_dList.C_Base_dList_dList_Nil -> name
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) pairs))))

# 570 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__168, dtb__169) -> (match dtb__169 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__168
  | _ -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor = (fun modules label prefix ns imports name -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (match cands with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsuggest name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownConstructor (name))) name))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) pairs)))))
)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))
)))))

# 591 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder = (fun label name -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidVariableName (name))) name) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name))))

# 595 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName = (fun label name -> (if (name = "_") then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidTopLevelName ("_"))) "_") else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidTopLevelName (name))) name) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)))))

# 600 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName = (fun label prefix name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

# 604 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern = (fun fuel modules label prefix ns imports pat -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__170) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__170)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__171, dtb__172) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__172)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label) dtb__171))) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__171, dtb__172)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__171, Base_dList.C_Base_dList_dList_Nil)) }))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__173, dtb__174, dtb__175) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__174)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__173, (Base_dPair.v_Base_dPair_dfirstOf p), dtb__175)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__173, (Base_dPair.v_Base_dPair_dsecondOf p))) }))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__176, dtb__177) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__176, dtb__177)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__178, dtb__179) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__178, dtb__179)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__180, dtb__181, dtb__182) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__180) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__181)) (fun parts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__180, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__182)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts) })))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__182)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__180))) (fun name2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__181)) (fun parts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__182)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts) })))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__183, dtb__184, dtb__185) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__185)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__183))) (fun name2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__184)) (fun parts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__185)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts) }))))))
  | _ -> failwith "DT: impossible branch"
)))
# 628 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__186; Base_dPair.f_Base_dPair_dPair_second = dtb__187 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__187)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__188; Base_dPair.f_Base_dPair_dPair_second = dtb__189 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__186; Base_dPair.f_Base_dPair_dPair_second = dtb__188 }; Base_dPair.f_Base_dPair_dPair_second = dtb__189 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 653 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__190)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__191)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__194; Base_dPair.f_Base_dPair_dPair_second = dtb__195 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__192, dtb__194)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__193) dtb__195) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })))
  | _ -> failwith "DT: impossible branch"
))

# 694 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__196, dtb__197) -> (match dtb__196 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__198; Base_dPair.f_Base_dPair_dPair_second = dtb__199 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__198)) (fun pr -> (match pr with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__200; Base_dPair.f_Base_dPair_dPair_second = dtb__201 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__197)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__202; Base_dPair.f_Base_dPair_dPair_second = dtb__203 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend dtb__201) dtb__202); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__200; Base_dPair.f_Base_dPair_dPair_second = dtb__199 }, dtb__203)) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 726 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__204, dtb__205) -> (match dtb__204 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__206) -> (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__206))), (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__206, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__206))), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__205)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__207) -> (if (dtb__207 = "") then ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__205) else (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__207, mc0)), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__205))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 733 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__208, dtb__209) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft mc0) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc0)), (Base_dList.C_Base_dList_dList__x58__x58_ (mc1, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__208, Base_dList.C_Base_dList_dList_Nil)))), mc0))) dtb__209)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 721 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate = (fun sp parts -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks sp) parts) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ("", sp))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__210, dtb__211) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft sp) dtb__210) dtb__211)
  | _ -> failwith "DT: impossible branch"
))

# 741 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct = (fun release sp name resolved scope -> (if release then (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disDebugOnlyName resolved) then (if ((Base_dList.v_Base_dList_dmemName name) scope) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp)))) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DebugConstructInRelease (resolved))) resolved)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))))

# 750 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disParserSyntaxName = (fun name -> (if (if (if (if (if (if (if (if (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax)) then true else ((Base_dString.v_Base_dString_dstartsWith "@vuna@list@") name)) then true else ((Base_dString.v_Base_dString_dstartsWith "@vuna@handle@") name)))

# 917 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label prefix dname ctor -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical prefix) dname) ctor))))))

# 922 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__212, dtb__213) -> (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__212)
  | _ -> failwith "DT: impossible branch"
))

# 927 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__214, dtb__215) -> (if (dtb__214 >= 65) then (dtb__214 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

# 955 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult = (fun label prefix ns name -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__216, dtb__217) -> (match dtb__217 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__216))))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousConstructor (name, ("Data." ^ name)))) name) ("Data." ^ name))
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))

# 962 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__218) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__218))
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

# 1003 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName = (fun modules label prefix ns imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) (fun ps -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths ps) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits v_Vuna_dCompiler_dLoader_dResolve_dpickTypeEntries) modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps))) (fun hits -> (match hits with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__219) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__219))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__220) -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) hits)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))))))

# 985 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName = (fun modules label prefix ns imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__221) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__221))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__222) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__222))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__223) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__223)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))
  | _ -> failwith "DT: impossible branch"
))))

# 945 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicTypeName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName modules) label) prefix) ns) imports) name) else ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName modules) label) prefix) ns) imports) name))))))

# 1028 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__224, dtb__225) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__224))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__226, dtb__227, dtb__228) -> (match dtb__226 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__229, dtb__230) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 1068 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label prefix name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

# 1169 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disLowerIdent = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__231, dtb__232) -> (if (dtb__231 >= 97) then (dtb__231 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1164 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__233, dtb__234, dtb__235) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames dtb__233)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames) dtb__234))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__236, dtb__237) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerIdent dtb__236) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__236, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 1174 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__238, dtb__239) -> (match dtb__238 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__240; Base_dPair.f_Base_dPair_dPair_second = dtb__241 } -> (if (dtb__240 = mc0) then dtb__241 else ((v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf mc0) dtb__239))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1198 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__242, dtb__243) -> "do"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__244, dtb__245, dtb__246, dtb__247) -> "if"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__248, dtb__249, dtb__250) -> "case"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__251, dtb__252, dtb__253, dtb__254) -> "let"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__255, dtb__256, dtb__257) -> "lam"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__258, dtb__259) -> "float"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__260, dtb__261) -> "str"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__262, dtb__263) -> "int"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__264, dtb__265, dtb__266) -> "app"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__267, dtb__268) -> ("var " ^ dtb__267)
  | _ -> "other"
))

# 1039 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped = (fun fuel modules label prefix ns imports bound ty -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__269, dtb__270, dtb__271, dtb__272, dtb__273, dtb__274) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__272)) (fun dom2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__269, bound))) dtb__273)) (fun cod2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__269, dtb__270, dtb__271, dom2, cod2, dtb__274))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__275, dtb__276, dtb__277) -> (match dtb__275 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__278, dtb__279) -> (if (dtb__278 = "Type") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__275)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__276)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__277)))))))))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__275)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__276)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__277))))))))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__280, dtb__281) -> (if ((Base_dList.v_Base_dList_dmemName dtb__280) bound) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName dtb__280) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unexpanded macro invocation " ^ dtb__280)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__280) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__281)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__280))) (fun n -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, dtb__281)))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__282, dtb__283) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__284, dtb__285) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan ty))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidTypeExpression ((v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)))) (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)))
)) ty)))

# 1033 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel modules label prefix ns imports ty -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped fuel) modules) label) prefix) ns) imports) Base_dList.C_Base_dList_dList_Nil) ty))

# 1021 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr = (fun modules label prefix ns imports cx -> (match (v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf cx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__286) -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__286) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__287) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan cx))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownInterface (dtb__286))) dtb__286))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__288) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

# 1073 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__289; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__290; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__291; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__292 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__292)) ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) mc5) dtb__289))) (fun c2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__290)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = c2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__291; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__292 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1115 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__293; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__294; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__295 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__295)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__293))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__294)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__293; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__295 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1120 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__296; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__297; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__298 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__298)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__296))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__297)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = n; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__298 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1214 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__299, dtb__300) -> (match dtb__299 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__301; Base_dPair.f_Base_dPair_dPair_second = dtb__302 } -> ((fun isCtor -> (if isCtor then (Base_dList.C_Base_dList_dList__x58__x58_ ((dtb__302).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__300))) else ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__300))) (if ((dtb__302).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then true else ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget mc0) (dtb__302).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal = (fun modules label prefix ns imports scope name -> (if ((Base_dList.v_Base_dList_dmemName name) scope) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (match (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name) with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__303, dtb__304) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))))
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
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickValueOrOver name) pairs)))
  | dtb__305 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (Base_dList.v_Base_dList_dnubNames dtb__305))))
)
)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 448 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules label prefix ns imports scope name sp -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "empty dotted name")
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__306, dtb__307) -> (if ((Base_dList.v_Base_dList_dmemName dtb__306) scope) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__306, sp))) dtb__307) sp))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) sp))) (fun q -> (match q with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__308) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__308))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__306) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__306), sp))) dtb__307) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__306) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__306, sp))) dtb__307) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__306) then (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__309) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__309, sp))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__310) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (dtb__306))) dtb__306))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__306))) (fun n -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, sp))) dtb__307) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 879 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind = (fun modules label prefix ns imports scope -> (match (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) ">>=") with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__311) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__311))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__312) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) "bind")
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__313; Base_dPair.f_Base_dPair_dPair_second = dtb__314 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__313)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__315; Base_dPair.f_Base_dPair_dPair_second = dtb__316 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__316) mc6)) dtb__314)) (fun body2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__315; Base_dPair.f_Base_dPair_dPair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
# 644 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__317; Base_dPair.f_Base_dPair_dPair_second = dtb__318 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__317)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__319; Base_dPair.f_Base_dPair_dPair_second = dtb__320 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__320) mc6)) dtb__318)) (fun body2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__319; Base_dPair.f_Base_dPair_dPair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
# 663 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel modules label prefix ns imports scope rec_u binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
# 669 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__321, dtb__322) -> (match dtb__321 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__323; Base_dPair.f_Base_dPair_dPair_second = dtb__324 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__324)) (fun value2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__323)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__325; Base_dPair.f_Base_dPair_dPair_second = dtb__326 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend dtb__326) scope)) dtb__322) body)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__327; Base_dPair.f_Base_dPair_dPair_second = dtb__328 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__325; Base_dPair.f_Base_dPair_dPair_second = value2 }, dtb__327)); Base_dPair.f_Base_dPair_dPair_second = dtb__328 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = b }))))
  | _ -> failwith "DT: impossible branch"
)) binds)))
# 683 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__329) -> (match dtb__329 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__330; Base_dPair.f_Base_dPair_dPair_second = dtb__331 } -> ((fun scope2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__331)) (fun values2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = values2; Base_dPair.f_Base_dPair_dPair_second = b }))))))) ((Base_dList.v_Base_dList_dappend dtb__330) scope))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__332) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__332))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ns) imports) binds))))
# 702 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__333, dtb__334) -> (match dtb__333 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__335; Base_dPair.f_Base_dPair_dPair_second = dtb__336 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__336)) (fun value2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__334)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__335; Base_dPair.f_Base_dPair_dPair_second = value2 }, tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 762 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel modules label prefix ns imports scope expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__337, dtb__338) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__337) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__337, dtb__338)))) else (if ((Base_dString.v_Base_dString_dstartsWith "!") dtb__337) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((((Base_dString.v_Base_dString_dsubstring 1) (bi_natFromInt (bi_strLength dtb__337))) dtb__337), dtb__338)))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName dtb__337) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unexpanded macro invocation " ^ dtb__337)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__337) then (if (if (if (if (if (v_Vuna_dCompiler_dLoader_dResolve_disParserSyntaxName dtb__337) then true else ((Base_dString.v_Base_dString_dstartsWith "Base.") prefix)) then true else ((Base_dString.v_Base_dString_dstartsWith "Vuna.") prefix)) then true else ((Base_dString.v_Base_dString_dstartsWith "Base_d") prefix)) then true else ((Base_dString.v_Base_dString_dstartsWith "Vuna_d") prefix)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__337, dtb__338)))) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__338)) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownVariable (dtb__337))) dtb__337))) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot dtb__337) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__337) dtb__338) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__338)) (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__337))) (fun n -> (((((v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease) dtb__338) dtb__337) n) scope))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__339, dtb__340, dtb__341, dtb__342) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unreordered infix operator " ^ dtb__339))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__343, dtb__344, dtb__345, dtb__346) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unreordered backtick infix operator " ^ dtb__343))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__347, dtb__348) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unreordered operator section ("; dtb__347; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__349, dtb__350, dtb__351) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unreordered left operator section ("; dtb__349; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__352, dtb__353, dtb__354) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unreordered right operator section ("; dtb__353; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__355, dtb__356) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__355)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__357, dtb__358) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__357, dtb__358))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__359, dtb__360) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__359, dtb__360))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__361, dtb__362) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__361, dtb__362))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__363, dtb__364, dtb__365) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__364)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate dtb__365) ps)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__366, dtb__367, dtb__368) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__368)) ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__366)))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) dtb__366)) scope)) dtb__367)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__366, b, dtb__368))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__369, dtb__370, dtb__371) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__369)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__370)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__371))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__372, dtb__373, dtb__374, dtb__375, dtb__376, dtb__377) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__375)) (fun dom2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__372, Base_dList.C_Base_dList_dList_Nil))) scope)) dtb__376)) (fun cod2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__372, dtb__373, dtb__374, dom2, cod2, dtb__377))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__378, dtb__379, dtb__380, dtb__381) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__380) dtb__378) dtb__379)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__382; Base_dPair.f_Base_dPair_dPair_second = dtb__383 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__382, dtb__383, dtb__380, dtb__381))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__384, dtb__385) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__384)) (fun clauses2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (clauses2, dtb__385))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__386, dtb__387, dtb__388) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__386)) (fun scrut2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__387)) (fun alts2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (scrut2, alts2, dtb__388))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__389, dtb__390, dtb__391, dtb__392) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__389)) (fun c2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__390)) (fun t2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__391)) (fun e2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, e2, dtb__392))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__393, dtb__394, dtb__395) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__393)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (b, dtb__394, dtb__395))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__396, dtb__397, dtb__398) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__398)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__396))) (fun name2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__397)) (fun fs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (name2, fs, dtb__398))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__399, dtb__400, dtb__401) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__399)) (fun b -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__400)) (fun fs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (b, fs, dtb__401))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__402, dtb__403) -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDo (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__402) dtb__403)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__404, dtb__405, dtb__406) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__404)) (fun v2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__405)) (fun t2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (v2, t2, dtb__406))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 846 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts = (fun fuel modules label prefix ns imports scope parts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__407, dtb__408) -> (match dtb__407 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__409) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__409)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__408)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (e2)), ps))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__410) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__408)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__410)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 867 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDo = (fun fuel modules label prefix ns imports scope stmts blockSpan -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__411, dtb__412) -> (match dtb__411 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__413, dtb__414) -> (match dtb__412 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__413)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At blockSpan) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
# 894 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain = (fun fuel modules label prefix ns imports scope bindName stmts blockSpan -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__415, dtb__416) -> (match dtb__415 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__417, dtb__418, dtb__419) -> (match dtb__417 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__420) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__418)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__416) blockSpan)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__419)), (Base_dList.C_Base_dList_dList__x58__x58_ (e2, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = "_"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dList.C_Base_dList_dList_Nil)), tail, dtb__419)), Base_dList.C_Base_dList_dList_Nil)))), dtb__419))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__421, dtb__422) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__418)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__421, scope))) bindName) dtb__416) blockSpan)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName bindName), dtb__419)), (Base_dList.C_Base_dList_dList__x58__x58_ (e2, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__421; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__421) dtb__422) }, Base_dList.C_Base_dList_dList_Nil)), tail, dtb__419)), Base_dList.C_Base_dList_dList_Nil)))), dtb__419))))))))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At dtb__419) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_DoBindPattern)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__423, dtb__424) -> (match dtb__416 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__423)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__423)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__416) blockSpan)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__424)), (Base_dList.C_Base_dList_dList__x58__x58_ (e2, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = "_"; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dList.C_Base_dList_dList_Nil)), tail, dtb__424)), Base_dList.C_Base_dList_dList_Nil)))), dtb__424))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At blockSpan) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
# 910 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__425; Base_dPair.f_Base_dPair_dPair_second = dtb__426 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__426)) (fun v -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__425; Base_dPair.f_Base_dPair_dPair_second = v })))))
  | _ -> failwith "DT: impossible branch"
))

# 1126 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__427, dtb__428, dtb__429, dtb__430) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__430)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__427))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__428)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__429)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__427, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__430))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__431, dtb__432, dtb__433, dtb__434) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__434)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__431))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__432)) (fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__433)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__431, ctx2, ty2, dtb__434))))))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unexpected instance body declaration")
))

# 1079 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules label prefix ns imports d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__435, dtb__436, dtb__437, dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__443)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__435))) (fun dn -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__437)) (fun kind2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ns) imports) dtb__435)) dtb__438)) (fun ctors2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__439)) (fun ds2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dn, dtb__436, kind2, ctors2, ds2, dtb__440, dtb__441, dtb__442, dtb__443))))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__444, dtb__445, dtb__446, dtb__447, dtb__448, dtb__449, dtb__450, dtb__451) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__451)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__444))) (fun dn -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ns) imports)) dtb__446)) (fun fields2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__447)) (fun ds2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dn, dtb__445, fields2, ds2, dtb__448, dtb__449, dtb__450, dtb__451))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__452, dtb__453, dtb__454, dtb__455, dtb__456) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__456)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__452))) (fun tn -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__454)) (fun ss -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ns) imports)) dtb__455)) (fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (tn, dtb__453, ss, ms, dtb__456))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__457, dtb__458, dtb__459, dtb__460) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__457)) (fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__458)) (fun head2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) ns) imports)) dtb__459)) (fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctx2, head2, ms, dtb__460))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__461, dtb__462, dtb__463, dtb__464) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__464)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__461))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__462)) (fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__463)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (n, ctx2, ty2, dtb__464))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__465, dtb__466, dtb__467) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__467)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__465))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__466)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (n, ty2, dtb__467))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__468, dtb__469, dtb__470, dtb__471) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__471)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__468))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__470)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (n, dtb__469, ty2, dtb__471))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__472, dtb__473, dtb__474, dtb__475) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__475)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__472))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__473)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__474)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (n, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__475))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1178 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDeclWithImplicitScopes = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__476, dtb__477, dtb__478, dtb__479) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__479)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc2) mc3) dtb__476))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5)) dtb__477)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) ((v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf dtb__476) mc0))) dtb__478)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (n, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__479))))))))))
  | _ -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl mc1) mc2) mc3) mc4) mc5) mc6)
))

# 1221 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disStringDomainExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__480, dtb__481) -> (if (dtb__480 = "String") then true else (if (dtb__480 = "Base.String.String") then true else false))
  | _ -> false
))

# 1158 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__482, dtb__483, dtb__484, dtb__485, dtb__486, dtb__487) -> (if dtb__483 then (if (dtb__482 = "_") then (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__486) else (if (v_Vuna_dCompiler_dLoader_dResolve_disStringDomainExpr dtb__485) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__482, (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__486))) else (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__486))) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 1147 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__488, dtb__489) -> (match dtb__488 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__490, dtb__491, dtb__492, dtb__493) -> ((fun names -> (match names with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__489)
  | _ -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__490; Base_dPair.f_Base_dPair_dPair_second = names }, (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__489)))
)) (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__492)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames) dtb__491))))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__489)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1136 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules label prefix ns imports decls -> ((fun implicitScopes -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDeclWithImplicitScopes implicitScopes) modules) label) prefix) ns) imports)) decls)) (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable decls)))

# 1187 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun release modules entryPkg imports decls -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith release) decls)) imports) decls))

# 1191 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__494, dtb__495) -> (match dtb__494 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__496; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__497; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__498; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__499; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__500; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__501; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__502; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__503; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__504; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__505 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram mc1) dtb__496) dtb__496) ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith mc0) dtb__500)) ((Base_dList.v_Base_dList_dappend dtb__498) dtb__499)) dtb__500)) (fun d1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dresolveModules mc0) dtb__495)) (fun d2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
