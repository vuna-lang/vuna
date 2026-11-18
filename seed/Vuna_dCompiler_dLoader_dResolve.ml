open Vuna_runtime
# 39 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound = 1073741824

# 43 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity = (fun name -> (match (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfindIntrinsic name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__0) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicVisible dtb__0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicArity dtb__0))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName = (fun name -> (match (v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__1) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("Type", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("->", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("_", Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) ((Base_dData_dList.v_Base_dData_dList_dappend Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeTypeNames) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeValueNames))

# 60 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName = (fun name -> ((Base_dData_dList.v_Base_dData_dList_dmemName name) v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames))

# 70 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint = (fun mc0 -> (if (mc0 = "Show") then " (trait Show is not in scope; add `import Base.Trait.Show`)" else (if (mc0 = "Eq") then " (trait Eq is not in scope; add `import Base.Trait.Eq`)" else (if (mc0 = "Ord") then " (trait Ord is not in scope; add `import Base.Trait.Ord`)" else (if (mc0 = "show") then " (trait method show; add `import Base.Trait.Show`)" else (if (mc0 = "eq") then " (trait method eq; add `import Base.Trait.Eq`)" else (if (mc0 = "neq") then " (trait method neq; add `import Base.Trait.Eq`)" else (if (mc0 = "lt") then " (trait method lt; add `import Base.Trait.Ord`)" else (if (mc0 = "le") then " (trait method le; add `import Base.Trait.Ord`)" else (if (mc0 = "gt") then " (trait method gt; add `import Base.Trait.Ord`)" else (if (mc0 = "ge") then " (trait method ge; add `import Base.Trait.Ord`)" else "")))))))))))

# 92 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames = (fun d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__6, dtb__7, dtb__8, dtb__9) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__10, dtb__11, dtb__12) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__10, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__13, dtb__14, dtb__15, dtb__16) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__17, dtb__18, dtb__19, dtb__20) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 103 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf = (fun decls -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames) decls))

# 111 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun c -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (String.concat "" [dtb__23; "."; (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c)]) })) dtb__26)) (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__32; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__32 }, (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22)))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith = (fun release decls -> ((fun vals -> ((fun cts -> ((fun tys -> ((fun cands -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues = vals; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors = cts; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes = tys; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet = (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames vals); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet = (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames cts); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet = (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames tys); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands = cands; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease = release }) (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf decls))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf decls))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))) (v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf decls)))

# 130 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf = (fun _uarity0 -> ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith false) _uarity0))

# 135 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets = (fun prefix ns name -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun p -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun p -> ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p) = name))) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands)))

# 140 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTarget = (fun prefix ns name -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__40))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))

# 150 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget = (fun p -> ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

# 154 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor = (fun modules p -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget modules) (v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget p)))

# 158 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets = (fun modules imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) ((Base_dData_dList.v_Base_dData_dList_dfilter (v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor modules)) pairs))))))))

# 174 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> true
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates = (fun modules prefix ns imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets modules) imports) name)) (fun imp -> ((fun local -> (if (if (if (if (v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList local) then (name <> "Nil") else false) then (name <> "Cons") else false) then (name <> "::") else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (local)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dappend local) imp)))))) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))))

# 209 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_drealModuleName = (fun modules name -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dresolveModuleName modules) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__44) -> dtb__44
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpathKey = (fun mc0 -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__45; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__46 } -> (String.concat "" [dtb__45; "|"; (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__46)])
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dmemPathKey = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__47, dtb__48) -> (if ((v_Vuna_dCompiler_dLoader_dResolve_dpathKey dtb__47) = mc0) then true else ((v_Vuna_dCompiler_dLoader_dResolve_dmemPathKey mc0) dtb__48))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_duniqPathResults = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__49, dtb__50) -> (if ((v_Vuna_dCompiler_dLoader_dResolve_dmemPathKey (v_Vuna_dCompiler_dLoader_dResolve_dpathKey dtb__49)) dtb__50) then (v_Vuna_dCompiler_dLoader_dResolve_duniqPathResults dtb__50) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__49, (v_Vuna_dCompiler_dLoader_dResolve_duniqPathResults dtb__50))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__51, dtb__52) -> (match dtb__52 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__51
  | _ -> (String.concat "" [dtb__51; ", "; (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin dtb__52)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlastSegmentOf = (fun name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__53; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 } -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (match dtb__55 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__57; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__58 } -> (match dtb__58 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> dtb__59
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel mc0) dtb__56)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__61, dtb__62) -> (match dtb__61 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__63; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__64 } -> dtb__63
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dentryHits = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__67; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__68 } -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__69, dtb__70) -> (match dtb__70 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__69 = mc3) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc1) dtb__67)) (fun es -> (match ((mc0 es) mc3) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__66) mc3)
  | dtb__71 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__66) mc3)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun e -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__67; Base_dData_dPair.f_Base_dData_dPair_dPair_second = e })) dtb__71)) hits)))))
))) else ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__66) mc3))
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__66) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits mc0) mc1) dtb__66) mc3)
)) dtb__68)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickValueEntry = (fun es base -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__72) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__72))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base)
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickValueEntries = (fun es base -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValues es) base) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportTypes es) base)
  | dtb__73 -> dtb__73
))

# 284 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickTypeEntries = (fun es base -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportTypes es) base) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValues es) base)
  | dtb__74 -> dtb__74
))

# 317 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__75) = mc0) then true else ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc0) dtb__76))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> (match dtb__77 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__79) = mc1) then (if ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc2) dtb__82) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) dtb__79) mc2))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__78))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__88) = mc1) then (dtb__88 = mc2) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__88))) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__78))
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__78)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (match ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__96)) mc1) mc2) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__96)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__98) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__98))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules dtb__97) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily = (fun prefix rel -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot rel)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__99; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__100 } -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__99))
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily = (fun modules prefix ns famTarget base -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__101, dtb__102) -> (match dtb__101 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__103; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__104 } -> (match dtb__102 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__104)))
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun p -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p) = base) then (((v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily prefix) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) = famTarget) else false))) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands)))

# 380 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dexportTarget = (fun e -> (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

# 396 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dallEq = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (if (mc0 = dtb__105) then ((v_Vuna_dCompiler_dLoader_dResolve_dallEq mc0) dtb__106) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, dtb__108) -> ((v_Vuna_dCompiler_dLoader_dResolve_dallEq dtb__107) dtb__108)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, dtb__110) -> (if (v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, dtb__110)))) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dResolve_dexportTarget dtb__109))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc1) (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, dtb__110))))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownConstructor (mc1))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__113; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__114 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__115, dtb__116) -> (match dtb__116 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__115 = mc2) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__113)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) dtb__115) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__112) mc2)
  | dtb__117 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__112) mc2)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun e -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__113; Base_dData_dPair.f_Base_dData_dPair_dPair_second = e })) dtb__117)) hits)))))
))) else (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__112) mc2))
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__112) mc2)
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits mc0) dtb__112) mc2)
)) dtb__114)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyEntryOf = (fun base parent x -> (if (if ((x).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((x).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = base) else false) then ((x).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = parent) else false))

# 418 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__120; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__121 } -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__122, dtb__123) -> (match dtb__123 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, dtb__125) -> (match dtb__125 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (if (dtb__122 = mc2) then (dtb__124 = mc3) else false) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__120)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) mc2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__126) -> (match ((Base_dData_dList.v_Base_dData_dList_dfilter ((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyEntryOf mc3) (dtb__126).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)) es) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__127, dtb__128) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__119) mc2) mc3)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__120; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc3; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__127).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = (dtb__126).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target } }, hits))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls mc0) dtb__120)) (fun ds -> (match ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls dtb__120) (dtb__126).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) mc3) ds) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__129) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__119) mc2) mc3)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__120; Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc3; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__129; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = (dtb__126).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target } }, hits))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__119) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__119) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
))) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__119) mc2) mc3))
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__119) mc2) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__119) mc2) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits mc0) dtb__119) mc2) mc3)
)) dtb__121)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__130, dtb__131) -> (((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (mc0, dtb__130, mc2))) dtb__131) mc2)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, dtb__133) -> (if (mc0 <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__132, ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (mc0 - 1)) dtb__133))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntryGo = (fun es segs k -> (if (k <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportModule es) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs k) segs))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__134) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__134).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Base_dData_dPair.f_Base_dData_dPair_dPair_second = k }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntryGo es) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 192 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntry = (fun es segs -> (((v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntryGo es) segs) (Base_dData_dList.v_Base_dData_dList_dlength segs)))

# 478 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_ddropSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (if (mc0 <= 0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__135, dtb__136)) else ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (mc0 - 1)) dtb__136))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePathsFuel = (fun fuel modules m segs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "namespace path") else (if (v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList segs) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__137) -> (match dtb__137 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__138; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__139 } -> ((((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePathsFuel (fuel - 1)) modules) dtb__138) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs dtb__139) segs))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = m; Base_dData_dPair.f_Base_dData_dPair_dPair_second = segs }))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dResolve_dlongestNamespaceEntry es) segs)))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = m; Base_dData_dPair.f_Base_dData_dPair_dPair_second = segs })))))

# 180 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePaths = (fun modules m segs -> ((((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePathsFuel (1 + (Base_dData_dList.v_Base_dData_dList_dlength segs))) modules) m) segs))

# 223 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespaceCandidates = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__140, dtb__141) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespacePaths mc0) dtb__140) mc2)) (fun p -> ((((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespaceCandidates mc0) dtb__141) mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (p, mc3)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dreverse mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixesTry = (fun modules imports segs n -> (if (n < 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dqualifierCandidates imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs n) segs))) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__142 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dwalkNamespaceCandidates modules) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dLoader_dResolve_drealModuleName modules)) dtb__142)) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs n) segs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (fun rs -> (match (v_Vuna_dCompiler_dLoader_dResolve_duniqPathResults rs) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__143 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__143))
)))
)))

# 203 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes = (fun modules imports segs -> ((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixesTry modules) imports) segs) ((Base_dData_dList.v_Base_dData_dList_dlength segs) - 1)))

# 289 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified = (fun modules label imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) (fun ps -> (match ps with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (name))) name)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits v_Vuna_dCompiler_dLoader_dResolve_dpickValueEntries) modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps))) (fun hits -> (match hits with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "value") ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) hits)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
))))

# 482 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__144, dtb__145) -> (match dtb__144 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__146; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__147 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__145) mc2)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, dtb__149) -> (match dtb__149 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__148 = mc2) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__146)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dpickValueEntries es) mc2) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__145) mc2)
  | dtb__150 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__145) mc2)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun e -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dLoader_dResolve_dexportTarget e); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil })) dtb__150)) hits)))))
))) else (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__145) mc2))
  | _ -> (if (dtb__148 = mc2) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__146)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValues es) mc2) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__145) mc2)
  | dtb__151 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__145) mc2)) (fun hits -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun e -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dLoader_dResolve_dexportTarget e); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__149 })) dtb__151)) hits)))))
))) else (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits mc0) dtb__145) mc2))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__147)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_duniqPathTargets = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__152, dtb__153) -> (if ((v_Vuna_dCompiler_dLoader_dResolve_dmemPathKey (v_Vuna_dCompiler_dLoader_dResolve_dpathKey dtb__152)) dtb__153) then (v_Vuna_dCompiler_dLoader_dResolve_duniqPathTargets dtb__153) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__152, (v_Vuna_dCompiler_dLoader_dResolve_duniqPathTargets dtb__153))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dallEmptyTails = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__154, dtb__155) -> (match dtb__154 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__156; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__157 } -> (match dtb__157 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dLoader_dResolve_dallEmptyTails dtb__155)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> false
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly = (fun modules label imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) (fun ps -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths ps) then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (name))) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits v_Vuna_dCompiler_dLoader_dResolve_dpickTypeEntries) modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps))) (fun hits -> (match hits with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) hits)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))))))

# 342 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget = (fun modules label prefix ns imports name -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicTypeName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly modules) label) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownType (name))) name)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))))))

# 368 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__160; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__161 } -> ((fun famName -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget modules) label) prefix) ns) imports) famName)) (fun famTarget -> (match (((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily modules) prefix) ns) famTarget) dtb__161) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__162) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__162))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeHasNoConstructor (famName, dtb__161))) famName) dtb__161)
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__160))
  | _ -> failwith "DT: impossible branch"
))

# 437 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted = (fun modules label prefix ns imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) (fun ps -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths ps) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dctorEntryHits modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps))) (fun hits -> (if (v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList hits) then (((v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget label) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) hits)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dctorFamilyHits modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) (v_Vuna_dCompiler_dLoader_dResolve_dlastSegmentOf name))) (fun familyHits -> (match familyHits with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "constructor") (v_Vuna_dCompiler_dLoader_dResolve_dlastSegmentOf name)) familyHits)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))))))))

# 506 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath = (fun modules label imports segs n sp -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs n) segs))) (fun ps -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths ps) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dpathEntryHits modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps))) (fun hits -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__165; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__166 } -> (match dtb__166 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match dtb__164 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__165, sp))))))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousModule (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps), (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) nd_uscrut8))))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps)) (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) nd_uscrut8)))
)
  | _ -> (match dtb__164 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__165, sp))) dtb__166) sp)))))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousModule (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps), (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) nd_uscrut8))))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps)) (v_Vuna_dCompiler_dLoader_dResolve_dcommaJoin ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) nd_uscrut8)))
)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ValueNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf "") ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel "") ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf "") ps))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dResolve_duniqPathTargets hits))))))))

# 569 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickValueOrOver = (fun name pairs -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__167, dtb__168) -> (match dtb__168 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__167
  | _ -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverValueName name) nd_uscrut2)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> name
  | _ -> failwith "DT: impossible branch"
)) (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) pairs))))

# 576 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__169, dtb__170) -> (match dtb__170 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__169
  | _ -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor = (fun modules label prefix ns imports name -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (match cands with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsuggest name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownConstructor (name))) name))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) pairs)))))
)))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))
)))))

# 597 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder = (fun label name -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidVariableName (name))) name) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name))))

# 601 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName = (fun label name -> (if (name = "_") then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidTopLevelName ("_"))) "_") else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidTopLevelName (name))) name) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)))))

# 606 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName = (fun label prefix name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

# 610 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern = (fun fuel modules label prefix ns imports pat -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__171) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__171)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__172, dtb__173) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__173)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label) dtb__172))) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__172, dtb__173)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__172, Base_dData_dList.C_Base_dData_dList_dList_Nil)) }))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__174, dtb__175, dtb__176) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__175)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__174, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p), dtb__176)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__174, (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) }))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__177, dtb__178) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__177, dtb__178)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__179, dtb__180) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__179, dtb__180)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__181, dtb__182, dtb__183) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__181) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__182)) (fun parts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__181, ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) parts), dtb__183)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dconcatMap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) parts) })))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__183)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__181))) (fun name2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__182)) (fun parts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (name2, ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) parts), dtb__183)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dconcatMap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) parts) })))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__184, dtb__185, dtb__186) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__186)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__184))) (fun name2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__185)) (fun parts -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (name2, ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) parts), dtb__186)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dconcatMap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) parts) }))))))
  | _ -> failwith "DT: impossible branch"
)))
# 634 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__187; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__188 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__188)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__189; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__187; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__189 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 659 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, dtb__192) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__191)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__193; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__194 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__192)) (fun r -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__195; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__196 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__193, dtb__195)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__194) dtb__196) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil })))
  | _ -> failwith "DT: impossible branch"
))

# 700 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__197, dtb__198) -> (match dtb__197 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__199; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__200 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__199)) (fun pr -> (match pr with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__201; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__202 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__198)) (fun r -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__203; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__204 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__202) dtb__203); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__201; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__200 }, dtb__204)) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 732 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__207) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__207))), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__207, Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__207))), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__206)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__208) -> (if (dtb__208 = "") then ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__206) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__208, mc0)), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__206))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 739 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__209, dtb__210) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft mc0) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc0)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc1, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__209, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc0))) dtb__210)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 727 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate = (fun sp parts -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks sp) parts) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ("", sp))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__211, dtb__212) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft sp) dtb__211) dtb__212)
  | _ -> failwith "DT: impossible branch"
))

# 747 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct = (fun release sp name resolved scope -> (if release then (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disDebugOnlyName resolved) then (if ((Base_dData_dList.v_Base_dData_dList_dmemName name) scope) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp)))) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DebugConstructInRelease (resolved))) resolved)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))))

# 756 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disParserSyntaxName = (fun name -> (if (if (if (if (if (if (if (if (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax)) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "@vuna@list@") name)) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "@vuna@handle@") name)))

# 923 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label prefix dname ctor -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical prefix) dname) ctor))))))

# 928 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (Base_dData_dList.dtp_unpack name) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__213, dtb__214) -> (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__213)
  | _ -> failwith "DT: impossible branch"
))

# 933 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (Base_dData_dList.dtp_unpack name) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> (if (dtb__215 >= 65) then (dtb__215 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

# 961 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult = (fun label prefix ns name -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__217, dtb__218) -> (match dtb__218 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__217))))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousConstructor (name, ("Data." ^ name)))) name) ("Data." ^ name))
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))

# 968 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__219) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__219))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun vp -> (match vp with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cp -> (match cp with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun tp -> (match tp with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) tp)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) cp)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) vp)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1009 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName = (fun modules label prefix ns imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolvePathPrefixes modules) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) (fun ps -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEmptyPaths ps) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dentryHits v_Vuna_dCompiler_dLoader_dResolve_dpickTypeEntries) modules) ps) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps))) (fun hits -> (match hits with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__220) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__220))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__221) -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeNotExported (((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps), ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps)))) ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) ((v_Vuna_dCompiler_dLoader_dResolve_dfirstModuleOf name) ps))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") ((v_Vuna_dCompiler_dLoader_dResolve_dmemberLabel name) ps)) hits)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))))))

# 991 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName = (fun modules label prefix ns imports name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__222) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__222))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__223) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__223))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__224) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__224)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))
  | _ -> failwith "DT: impossible branch"
))))

# 951 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicTypeName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName modules) label) prefix) ns) imports) name) else ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName modules) label) prefix) ns) imports) name))))))

# 1034 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__225, dtb__226) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__225))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__227, dtb__228, dtb__229) -> (match dtb__227 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__230, dtb__231) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__230))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 1074 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label prefix name -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

# 1175 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disLowerIdent = (fun n -> (match (Base_dData_dList.dtp_unpack n) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__232, dtb__233) -> (if (dtb__232 >= 97) then (dtb__232 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1170 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__234, dtb__235, dtb__236) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames dtb__234)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames) dtb__235))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__237, dtb__238) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerIdent dtb__237) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__237, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 1180 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__239, dtb__240) -> (match dtb__239 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__241; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__242 } -> (if (dtb__241 = mc0) then dtb__242 else ((v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf mc0) dtb__240))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1204 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__243, dtb__244) -> "do"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__245, dtb__246, dtb__247, dtb__248) -> "if"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__249, dtb__250, dtb__251) -> "case"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__252, dtb__253, dtb__254, dtb__255) -> "let"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__256, dtb__257, dtb__258) -> "lam"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__259, dtb__260) -> "float"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__261, dtb__262) -> "str"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__263, dtb__264) -> "int"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__265, dtb__266, dtb__267) -> "app"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__268, dtb__269) -> ("var " ^ dtb__268)
  | _ -> "other"
))

# 1045 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped = (fun fuel modules label prefix ns imports bound ty -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, dtb__275) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__273)) (fun dom2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__270, bound))) dtb__274)) (fun cod2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__270, dtb__271, dtb__272, dom2, cod2, dtb__275))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__276, dtb__277, dtb__278) -> (match dtb__276 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__279, dtb__280) -> (if (dtb__279 = "Type") then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__276)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__277)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__278)))))))))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__276)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__277)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__278))))))))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__281, dtb__282) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__281) bound) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName dtb__281) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unexpanded macro invocation " ^ dtb__281)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__281) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__282)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__281))) (fun n -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, dtb__282)))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__283, dtb__284) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__285, dtb__286) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (ty))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan ty))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_InvalidTypeExpression ((v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)))) (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)))
)) ty)))

# 1039 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel modules label prefix ns imports ty -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped fuel) modules) label) prefix) ns) imports) Base_dData_dList.C_Base_dData_dList_dList_Nil) ty))

# 1027 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr = (fun modules label prefix ns imports cx -> (match (v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf cx) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__287) -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__287) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__288) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan cx))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownInterface (dtb__287))) dtb__287))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__289) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

# 1079 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__290; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__291; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__292; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__293 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__293)) ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) mc5) dtb__290))) (fun c2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__291)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = c2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__292; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__293 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1121 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__294; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__295; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__296 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__296)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__294))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__295)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__294; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__296 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1126 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__297; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__298; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__299 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__299)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__297))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__298)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = n; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__299 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1220 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__300, dtb__301) -> (match dtb__300 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__302; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__303 } -> ((fun isCtor -> (if isCtor then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((dtb__303).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__301))) else ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__301))) (if ((dtb__303).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then true else ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget mc0) (dtb__303).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal = (fun modules label prefix ns imports scope name -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName name) scope) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (match (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__304, dtb__305) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified modules) label) imports) name) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName name) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (name)) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (match cands with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cpairs -> (match cpairs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun tpairs -> (match tpairs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsuggest name) ((Base_dData_dList.v_Base_dData_dList_dappend (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues) ((Base_dData_dList.v_Base_dData_dList_dappend (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors) ((Base_dData_dList.v_Base_dData_dList_dappend (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes) scope)))))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dappendMessage (v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint name))) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownVariable (name))) name)))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) tpairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) cpairs)))))
)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))
)))
  | _ -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets modules) pairs) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickValueOrOver name) pairs)))
  | dtb__306 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (Base_dData_dList.v_Base_dData_dList_dnubNames dtb__306))))
)
)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 454 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules label prefix ns imports scope name sp -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "empty dotted name")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__307, dtb__308) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__307) scope) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__307, sp))) dtb__308) sp))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) sp))) (fun q -> (match q with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__309) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__309))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__307) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__307), sp))) dtb__308) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__307) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__307, sp))) dtb__308) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__307) then (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__310) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__310, sp))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__311) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (dtb__307))) dtb__307))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp)) (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__307))) (fun n -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, sp))) dtb__308) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 885 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind = (fun modules label prefix ns imports scope -> (match (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) ">>=") with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__312) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__312))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__313) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) "bind")
  | _ -> failwith "DT: impossible branch"
))

# 640 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__314; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__315 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__314)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__316; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__317 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__317) mc6)) dtb__315)) (fun body2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__316; Base_dData_dPair.f_Base_dData_dPair_dPair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
# 650 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__318; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__319 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__318)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__320; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__321 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__321) mc6)) dtb__319)) (fun body2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__320; Base_dData_dPair.f_Base_dData_dPair_dPair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
# 669 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel modules label prefix ns imports scope rec_u binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
# 675 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__322, dtb__323) -> (match dtb__322 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__324; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__325 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__325)) (fun value2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__324)) (fun p -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__326; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__327 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__327) scope)) dtb__323) body)) (fun r -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__328; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__329 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__326; Base_dData_dPair.f_Base_dData_dPair_dPair_second = value2 }, dtb__328)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__329 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b }))))
  | _ -> failwith "DT: impossible branch"
)) binds)))
# 689 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__330) -> (match dtb__330 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__331; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__332 } -> ((fun scope2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__332)) (fun values2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = values2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = b }))))))) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__331) scope))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__333) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__333))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ns) imports) binds))))
# 708 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__334, dtb__335) -> (match dtb__334 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__336; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__337 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__337)) (fun value2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__335)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__336; Base_dData_dPair.f_Base_dData_dPair_dPair_second = value2 }, tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 768 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel modules label prefix ns imports scope expr -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__338, dtb__339) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__338) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__338, dtb__339)))) else (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "!") dtb__338) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((((Base_dData_dString.v_Base_dData_dString_dsubstring 1) (bi_natFromInt (bi_strLength dtb__338))) dtb__338), dtb__339)))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName dtb__338) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unexpanded macro invocation " ^ dtb__338)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__338) then (if (if (if (if (if (v_Vuna_dCompiler_dLoader_dResolve_disParserSyntaxName dtb__338) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base.") prefix)) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Vuna.") prefix)) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Base_d") prefix)) then true else ((Base_dData_dString.v_Base_dData_dString_dstartsWith "Vuna_d") prefix)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__338, dtb__339)))) else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__339)) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_UnknownVariable (dtb__338))) dtb__338))) else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot dtb__338) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__338) dtb__339) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__339)) (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__338))) (fun n -> (((((v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease) dtb__339) dtb__338) n) scope))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__340, dtb__341, dtb__342, dtb__343) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unreordered infix operator " ^ dtb__340))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__344, dtb__345, dtb__346, dtb__347) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal ("unreordered backtick infix operator " ^ dtb__344))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__348, dtb__349) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unreordered operator section ("; dtb__348; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__350, dtb__351, dtb__352) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unreordered left operator section ("; dtb__350; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__353, dtb__354, dtb__355) -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["unreordered right operator section ("; dtb__354; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__356, dtb__357) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__356)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__358, dtb__359) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__358, dtb__359))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__360, dtb__361) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__360, dtb__361))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__362, dtb__363) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__362, dtb__363))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__364, dtb__365, dtb__366) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__365)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate dtb__366) ps)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__367, dtb__368, dtb__369) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__369)) ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__367)))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__367)) scope)) dtb__368)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__367, b, dtb__369))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__370, dtb__371, dtb__372) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__370)) (fun fn2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__371)) (fun args2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__372))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__373, dtb__374, dtb__375, dtb__376, dtb__377, dtb__378) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__376)) (fun dom2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__373, Base_dData_dList.C_Base_dData_dList_dList_Nil))) scope)) dtb__377)) (fun cod2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__373, dtb__374, dtb__375, dom2, cod2, dtb__378))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__379, dtb__380, dtb__381, dtb__382) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__381) dtb__379) dtb__380)) (fun r -> (match r with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__383; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__384 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__383, dtb__384, dtb__381, dtb__382))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__385, dtb__386) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__385)) (fun clauses2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (clauses2, dtb__386))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__387, dtb__388, dtb__389) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__387)) (fun scrut2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__388)) (fun alts2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (scrut2, alts2, dtb__389))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__390, dtb__391, dtb__392, dtb__393) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__390)) (fun c2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__391)) (fun t2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__392)) (fun e2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, e2, dtb__393))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__394, dtb__395, dtb__396) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__394)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (b, dtb__395, dtb__396))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__397, dtb__398, dtb__399) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__399)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__397))) (fun name2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__398)) (fun fs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (name2, fs, dtb__399))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__400, dtb__401, dtb__402) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__400)) (fun b -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__401)) (fun fs -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (b, fs, dtb__402))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__403, dtb__404) -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDo (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__403) dtb__404)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__405, dtb__406, dtb__407) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__405)) (fun v2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__406)) (fun t2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (v2, t2, dtb__407))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 852 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts = (fun fuel modules label prefix ns imports scope parts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__408, dtb__409) -> (match dtb__408 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__410) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__410)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__409)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (e2)), ps))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__411) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__409)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__411)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 873 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDo = (fun fuel modules label prefix ns imports scope stmts blockSpan -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__412, dtb__413) -> (match dtb__412 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__414, dtb__415) -> (match dtb__413 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__414)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At blockSpan) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
# 900 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain = (fun fuel modules label prefix ns imports scope bindName stmts blockSpan -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__416, dtb__417) -> (match dtb__416 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__418, dtb__419, dtb__420) -> (match dtb__418 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__421) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__419)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__417) blockSpan)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__420)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (e2, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = "_"; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), tail, dtb__420)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), dtb__420))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__422, dtb__423) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__419)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__422, scope))) bindName) dtb__417) blockSpan)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName bindName), dtb__420)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (e2, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__422; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__422) dtb__423) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), tail, dtb__420)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), dtb__420))))))))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At dtb__420) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_DoBindPattern)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__424, dtb__425) -> (match dtb__417 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__424)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__424)) (fun e2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__417) blockSpan)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__425)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (e2, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = "_"; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), tail, dtb__425)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), dtb__425))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At blockSpan) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
# 916 "Vuna/Compiler/Loader/Resolve.vuna"
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__426; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__427 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__427)) (fun v -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__426; Base_dData_dPair.f_Base_dData_dPair_dPair_second = v })))))
  | _ -> failwith "DT: impossible branch"
))

# 1132 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__428, dtb__429, dtb__430, dtb__431) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__431)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__428))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__429)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) parts)) dtb__430)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__428, ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) parts), b, dtb__431))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__432, dtb__433, dtb__434, dtb__435) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__435)) ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__432))) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__433)) (fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__434)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__432, ctx2, ty2, dtb__435))))))))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "unexpected instance body declaration")
))

# 1085 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules label prefix ns imports d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__436, dtb__437, dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__444)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__436))) (fun dn -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__438)) (fun kind2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ns) imports) dtb__436)) dtb__439)) (fun ctors2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__440)) (fun ds2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dn, dtb__437, kind2, ctors2, ds2, dtb__441, dtb__442, dtb__443, dtb__444))))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449, dtb__450, dtb__451, dtb__452) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__452)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__445))) (fun dn -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ns) imports)) dtb__447)) (fun fields2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__448)) (fun ds2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dn, dtb__446, fields2, ds2, dtb__449, dtb__450, dtb__451, dtb__452))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__453, dtb__454, dtb__455, dtb__456, dtb__457) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__457)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__453))) (fun tn -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__455)) (fun ss -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ns) imports)) dtb__456)) (fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (tn, dtb__454, ss, ms, dtb__457))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__458, dtb__459, dtb__460, dtb__461) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__458)) (fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__459)) (fun head2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) ns) imports)) dtb__460)) (fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctx2, head2, ms, dtb__461))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__462, dtb__463, dtb__464, dtb__465) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__465)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__462))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__463)) (fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__464)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (n, ctx2, ty2, dtb__465))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__466, dtb__467, dtb__468) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__468)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__466))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__467)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (n, ty2, dtb__468))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__469, dtb__470, dtb__471, dtb__472) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__472)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__469))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__471)) (fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (n, dtb__470, ty2, dtb__472))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__473, dtb__474, dtb__475, dtb__476) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__476)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__473))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__474)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((Base_dData_dList.v_Base_dData_dList_dconcatMap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) parts)) dtb__475)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (n, ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) parts), b, dtb__476))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1184 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveDeclWithImplicitScopes = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__477, dtb__478, dtb__479, dtb__480) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__480)) (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc2) mc3) dtb__477))) (fun n -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5)) dtb__478)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap Base_dData_dPair.v_Base_dData_dPair_dsecondOf) parts)) ((v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf dtb__477) mc0))) dtb__479)) (fun b -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (n, ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) parts), b, dtb__480))))))))))
  | _ -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl mc1) mc2) mc3) mc4) mc5) mc6)
))

# 1227 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_disStringDomainExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__481, dtb__482) -> (if (dtb__481 = "String") then true else (if (dtb__481 = "Base.Data.String.String") then true else false))
  | _ -> false
))

# 1164 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__483, dtb__484, dtb__485, dtb__486, dtb__487, dtb__488) -> (if dtb__484 then (if (dtb__483 = "_") then (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__487) else (if (v_Vuna_dCompiler_dLoader_dResolve_disStringDomainExpr dtb__486) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__483, (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__487))) else (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__487))) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 1153 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__489, dtb__490) -> (match dtb__489 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__491, dtb__492, dtb__493, dtb__494) -> ((fun names -> (match names with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__490)
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__491; Base_dData_dPair.f_Base_dData_dPair_dPair_second = names }, (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__490)))
)) (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__493)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames) dtb__492))))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__490)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1142 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules label prefix ns imports decls -> ((fun implicitScopes -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDeclWithImplicitScopes implicitScopes) modules) label) prefix) ns) imports)) decls)) (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable decls)))

# 1193 "Vuna/Compiler/Loader/Resolve.vuna"
let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun release modules entryPkg imports decls -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith release) decls)) imports) decls))

# 1197 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__495, dtb__496) -> (match dtb__495 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__497; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__498; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__499; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__500; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__501; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__502; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__503; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__504; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__505; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__506 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram mc1) dtb__497) dtb__497) ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith mc0) dtb__501)) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__499) dtb__500)) dtb__501)) (fun d1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dresolveModules mc0) dtb__496)) (fun d2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
