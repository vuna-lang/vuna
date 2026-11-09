open Vuna_runtime
let v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound = 1073741824

let v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity = (fun name -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicVisible dtb__0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicArity dtb__0))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName = (fun name -> (match (v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ("Type", (Base_dList.C_Base_dList_dList_Cons ("->", (Base_dList.C_Base_dList_dList_Cons ("_", Base_dList.C_Base_dList_dList_Nil))))))) ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dpreludeTypeNames) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames))

let v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName = (fun name -> ((Base_dList.v_Base_dList_dmemName name) v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames))

let v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint = (fun mc0 -> (if (mc0 = "Show") then " (trait Show is not in scope; add `import Base.Show`)" else (if (mc0 = "Eq") then " (trait Eq is not in scope; add `import Base.Eq`)" else (if (mc0 = "Ord") then " (trait Ord is not in scope; add `import Base.Ord`)" else (if (mc0 = "show") then " (trait method show; add `import Base.Show`)" else (if (mc0 = "eq") then " (trait method eq; add `import Base.Eq`)" else (if (mc0 = "neq") then " (trait method neq; add `import Base.Eq`)" else (if (mc0 = "lt") then " (trait method lt; add `import Base.Ord`)" else (if (mc0 = "le") then " (trait method le; add `import Base.Ord`)" else (if (mc0 = "gt") then " (trait method gt; add `import Base.Ord`)" else (if (mc0 = "ge") then " (trait method ge; add `import Base.Ord`)" else "")))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames = (fun d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (Base_dList.C_Base_dList_dList_Cons (dtb__2, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__6, dtb__7, dtb__8, dtb__9) -> (Base_dList.C_Base_dList_dList_Cons (dtb__6, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__10, dtb__11, dtb__12) -> (Base_dList.C_Base_dList_dList_Cons (dtb__10, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__13, dtb__14, dtb__15, dtb__16) -> (Base_dList.C_Base_dList_dList_Cons (dtb__13, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__17, dtb__18, dtb__19, dtb__20) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames) decls))

let rec v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22) -> (match dtb__21 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c), (String.concat "" [dtb__23; "."; (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c)]))))) dtb__26)) (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__31, dtb__31)), (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22)))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf = (fun decls -> ((fun vals -> ((fun cts -> ((fun tys -> ((fun cands -> (Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (vals, cts, tys, (Base_dHashMap.v_Base_dHashMap_dofNames vals), (Base_dHashMap.v_Base_dHashMap_dofNames cts), (Base_dHashMap.v_Base_dHashMap_dofNames tys), cands))) (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf decls))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf decls))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))) (v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf decls)))

let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets = (fun prefix ns name -> ((Base_dList.v_Base_dList_dmap (fun p -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (Base_dPair.v_Base_dPair_dsecondOf p)))) ((Base_dList.v_Base_dList_dfilter (fun p -> ((Base_dPair.v_Base_dPair_dfirstOf p) = name))) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__38, dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> dtb__44
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTarget = (fun prefix ns name -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (match dtb__46 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (if ((Base_dList.v_Base_dList_dmemName dtb__47) dtb__48) then (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets dtb__48) else (Base_dList.C_Base_dList_dList_Cons (dtb__47, (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets dtb__48))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget = (fun p -> (match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__49, dtb__50, dtb__51, dtb__52) -> dtb__51
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor = (fun modules p -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget modules) (v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget p)))

let v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets = (fun modules imports name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor modules)) pairs))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> true
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates = (fun modules prefix ns imports name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets modules) imports) name)) (fun imp -> ((fun local -> (if (if (if (v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList local) then (name <> "Nil") else false) then (name <> "Cons") else false) then (Base_dResult.C_Base_dResult_dResult_Ok (local)) else (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dappend local) imp)))))) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified = (fun modules label imports name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__55, dtb__56) -> ((fun prefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": module "; prefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__57)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__56) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58) -> (Base_dResult.C_Base_dResult_dResult_Ok ((match dtb__58 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__59, dtb__60, dtb__61, dtb__62) -> dtb__61
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__56) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__63) -> (Base_dResult.C_Base_dResult_dResult_Ok ((match dtb__63 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__64, dtb__65, dtb__66, dtb__67) -> dtb__66
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__56) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__68) -> (Base_dResult.C_Base_dResult_dResult_Ok ((match dtb__68 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__69, dtb__70, dtb__71, dtb__72) -> dtb__71
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": "; dtb__56; " is not exported by "; dtb__57])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__55))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__73) = mc0) then true else ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc0) dtb__74))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (match dtb__75 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__77) = mc1) then (if ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc2) dtb__80) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) dtb__77) mc2))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__76))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> (if (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__85) = mc1) then (dtb__85 = mc2) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__85))) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__76))
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__76)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (match ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__92)) mc1) mc2) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__92)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules dtb__93) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily = (fun prefix rel -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot rel)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__95, dtb__96) -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__95))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily = (fun modules prefix ns famTarget base -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__97 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__99, dtb__100) -> (match dtb__98 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__100)))
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)) ((Base_dList.v_Base_dList_dfilter (fun p -> (if ((Base_dPair.v_Base_dPair_dfirstOf p) = base) then (((v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily prefix) (Base_dPair.v_Base_dPair_dsecondOf p)) = famTarget) else false))) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> dtb__107
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly = (fun modules label imports name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__108, dtb__109) -> ((fun typePrefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": module "; typePrefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__110)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__109) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> (Base_dResult.C_Base_dResult_dResult_Ok ((match dtb__111 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__112, dtb__113, dtb__114, dtb__115) -> dtb__114
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__109) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__116) -> (Base_dResult.C_Base_dResult_dResult_Ok ((match dtb__116 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__117, dtb__118, dtb__119, dtb__120) -> dtb__119
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": type "; dtb__109; " is not exported by "; dtb__110])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__108))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127) -> dtb__126
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disIntrinsicTypeName name) then (Base_dResult.C_Base_dResult_dResult_Ok (name)) else (if (if (name = "Type") then true else (name = "->")) then (Base_dResult.C_Base_dResult_dResult_Ok (name)) else (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly modules) label) imports) name) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": unknown type "; name])))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__128, dtb__129, dtb__130, dtb__131) -> dtb__130
  | _ -> failwith "DT: impossible branch"
)))))
))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__132, dtb__133) -> ((fun famName -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget modules) label) prefix) ns) imports) famName)) (fun famTarget -> (match (((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily modules) prefix) ns) famTarget) dtb__133) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__134) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__134))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": type "; famName; " has no constructor "; dtb__133])))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__132))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dexportTarget = (fun e -> (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__137
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dallEq = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (if (mc0 = dtb__139) then ((v_Vuna_dCompiler_dLoader_dResolve_dallEq mc0) dtb__140) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> ((v_Vuna_dCompiler_dLoader_dResolve_dallEq dtb__141) dtb__142)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> (if (v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144)))) then (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dLoader_dResolve_dexportTarget dtb__143))) else (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc1) (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144))))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [mc0; ": unknown constructor "; mc1])))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__145, dtb__146) -> ((fun prefixName -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefixName) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__147) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__147)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) dtb__146) with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": "; dtb__146; " is not exported by "; dtb__147])))
  | dtb__148 -> (((v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget label) dtb__146) dtb__148)
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__145))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedCtor = (fun modules label imports name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__149, dtb__150) -> ((fun prefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": module "; prefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__151) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__151)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__150) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__152) -> (Base_dResult.C_Base_dResult_dResult_Ok ((match dtb__152 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__153, dtb__154, dtb__155, dtb__156) -> dtb__155
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": constructor "; dtb__150; " is not exported by "; dtb__151])))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__149))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__157, dtb__158) -> (((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (mc0, dtb__157, mc2))) dtb__158) mc2)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__159, dtb__160) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (dtb__159, ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (mc0 - 1)) dtb__160))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddropSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__161, dtb__162) -> (if (mc0 <= 0) then (Base_dList.C_Base_dList_dList_Cons (dtb__161, dtb__162)) else ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (mc0 - 1)) dtb__162))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath = (fun modules label imports segs n sp -> (if (n < 1) then (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (n - 1)) segs))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__163) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__163)) (fun es -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match dtb__165 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__164) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((match dtb__166 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__167, dtb__168, dtb__169, dtb__170) -> dtb__169
  | _ -> failwith "DT: impossible branch"
), sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__164) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((match dtb__171 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__172, dtb__173, dtb__174, dtb__175) -> dtb__174
  | _ -> failwith "DT: impossible branch"
), sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__164) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__176) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((match dtb__176 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__177, dtb__178, dtb__179, dtb__180) -> dtb__179
  | _ -> failwith "DT: impossible branch"
), sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": "; dtb__164; " is not exported by "; dtb__163])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__164) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((match dtb__181 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__182, dtb__183, dtb__184, dtb__185) -> dtb__184
  | _ -> failwith "DT: impossible branch"
), sp))) dtb__165) sp)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": "; dtb__164; " is not exported by "; dtb__163])))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (n - 1)) segs))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) segs) (n - 1)) sp)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (match dtb__187 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__186
  | _ -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor = (fun modules label prefix ns imports name -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (match cands with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> dtb__192
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disIntrinsicName name) then (Base_dResult.C_Base_dResult_dResult_Ok (name)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": unknown constructor "; name; ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsuggest name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> dtb__196
  | _ -> failwith "DT: impossible branch"
))])))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) pairs)))))
)))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))
)))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder = (fun label name -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": invalid variable name "; name]))) else (Base_dResult.C_Base_dResult_dResult_Ok (name))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName = (fun label name -> (if (name = "_") then (Base_dResult.C_Base_dResult_dResult_Err ((label ^ ": invalid top-level name _ (bare _ is reserved)"))) else (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": invalid top-level name "; name]))) else (Base_dResult.C_Base_dResult_dResult_Ok (name)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName = (fun label prefix name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern = (fun fuel modules label prefix ns imports pat -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__202) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__202)), Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__203, dtb__204) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label) dtb__203)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__203, dtb__204)), (Base_dList.C_Base_dList_dList_Cons (dtb__203, Base_dList.C_Base_dList_dList_Nil))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__205, dtb__206, dtb__207) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__206)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__205, (Base_dPair.v_Base_dPair_dfirstOf p), dtb__207)), (Base_dList.C_Base_dList_dList_Cons (dtb__205, (Base_dPair.v_Base_dPair_dsecondOf p)))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__208, dtb__209) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__208, dtb__209)), Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__210, dtb__211) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__210, dtb__211)), Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__212, dtb__213, dtb__214) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__212) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__213)) (fun parts -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__212, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__214)), ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts))))))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__212)) (fun name2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__213)) (fun parts -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__214)), ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__215, dtb__216, dtb__217) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__215)) (fun name2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__216)) (fun parts -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__217)), ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__218, dtb__219) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__219)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__220, dtb__221) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__218, dtb__220)), dtb__221))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__222, dtb__223) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__222)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__224, dtb__225) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__223)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__226, dtb__227) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (dtb__224, dtb__226)), ((Base_dList.v_Base_dList_dappend dtb__225) dtb__227)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__228, dtb__229) -> (match dtb__228 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__230, dtb__231) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__230)) (fun pr -> (match pr with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__232, dtb__233) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__229)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__234, dtb__235) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (((Base_dList.v_Base_dList_dappend dtb__233) dtb__234), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__232, dtb__231)), dtb__235))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__236, dtb__237) -> (match dtb__236 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__238) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpMethodName, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__238))), (Base_dList.C_Base_dList_dList_Cons (dtb__238, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__238))), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__237)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__239) -> (if (dtb__239 = "") then ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__237) else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__239, mc0)), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__237))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__240, dtb__241) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft mc0) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc0)), (Base_dList.C_Base_dList_dList_Cons (mc1, (Base_dList.C_Base_dList_dList_Cons (dtb__240, Base_dList.C_Base_dList_dList_Nil)))), mc0))) dtb__241)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate = (fun sp parts -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks sp) parts) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ("", sp))
  | Base_dList.C_Base_dList_dList_Cons (dtb__242, dtb__243) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft sp) dtb__242) dtb__243)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct = (fun sp name resolved scope -> (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dreleaseOn then (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disDebugOnlyName resolved) then (if ((Base_dList.v_Base_dList_dmemName name) scope) then (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp)))) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DebugConstructInRelease (resolved))) resolved)) else (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))) else (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label prefix dname ctor -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical prefix) dname) ctor))))))

let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__244, dtb__245) -> (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__244)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__246, dtb__247) -> (if (dtb__246 >= 65) then (dtb__246 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult = (fun label prefix ns name -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList_Cons (dtb__248, dtb__249) -> (match dtb__249 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__248))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": ambiguous constructor "; name; " (qualify it as Data."; name; ")"])))
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> dtb__253
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__257) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__257))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun vp -> (match vp with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cp -> (match cp with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun tp -> (match tp with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (name))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) tp)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__258, dtb__259, dtb__260, dtb__261) -> dtb__260
  | _ -> failwith "DT: impossible branch"
)))))
)))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) cp)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__262, dtb__263, dtb__264, dtb__265) -> dtb__264
  | _ -> failwith "DT: impossible branch"
)))))
)))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) vp)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__266, dtb__267, dtb__268, dtb__269) -> dtb__268
  | _ -> failwith "DT: impossible branch"
)))))
)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__270, dtb__271) -> ((fun typePrefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__272) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__272))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__273) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": module "; typePrefix; " is not imported"])))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__274)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__271) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__275) -> (Base_dResult.C_Base_dResult_dResult_Ok ((match dtb__275 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__276, dtb__277, dtb__278, dtb__279) -> dtb__278
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__271) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__280) -> (Base_dResult.C_Base_dResult_dResult_Ok ((match dtb__280 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__281, dtb__282, dtb__283, dtb__284) -> dtb__283
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": type "; dtb__271; " is not exported by "; dtb__274])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__270))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName = (fun modules label prefix ns imports name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__285) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__285))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) name) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__286) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__286))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__287) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293, dtb__294) -> dtb__291
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (Base_dResult.C_Base_dResult_dResult_Err (dtb__287)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__295, dtb__296, dtb__297, dtb__298) -> dtb__297
  | _ -> failwith "DT: impossible branch"
)))))
))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__299, dtb__300, dtb__301, dtb__302, dtb__303, dtb__304, dtb__305) -> dtb__304
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disIntrinsicTypeName name) then (Base_dResult.C_Base_dResult_dResult_Ok (name)) else (if (if (name = "Type") then true else (name = "->")) then (Base_dResult.C_Base_dResult_dResult_Ok (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName modules) label) prefix) ns) imports) name) else ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName modules) label) prefix) ns) imports) name))))))

let v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__306, dtb__307) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__306))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__308, dtb__309, dtb__310) -> (match dtb__308 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__311, dtb__312) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__311))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label prefix name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

let v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError = (fun label name -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": unknown capability \""; name; "\" (known: "; ((Base_dString.v_Base_dString_djoin ", ") Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcapabilityNames); ")"]))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__313, dtb__314) -> (((v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability mc0) dtb__313) dtb__314)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability = (fun label name rest -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dparseCapability name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__315) -> ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) rest)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError label) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin = (fun name -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__316) -> (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disEffectfulIntrinsic dtb__316)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed = (fun caps i -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability i) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__317) -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__317)) caps)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect = (fun caps name -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__318) -> ((v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed caps) dtb__318)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__319, dtb__320) -> (match dtb__319 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__321) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__321))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect dtb__320)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dunsafeExecutorName = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dhostUnsafeExecutorName

let v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor = (fun name -> (name = v_Vuna_dCompiler_dLoader_dResolve_dunsafeExecutorName))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffExpr = (fun e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__322, dtb__323) -> (if (if (v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin dtb__322) then true else (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor dtb__322)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__322)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__324, dtb__325) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__326, dtb__327) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__328, dtb__329) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__330, dtb__331, dtb__332) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__331)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__333, dtb__334, dtb__335) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__333), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__334), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__336, dtb__337, dtb__338, dtb__339) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__336), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__337), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__340, dtb__341) -> (v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__340)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__342, dtb__343, dtb__344) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__342), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__343), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__345, dtb__346, dtb__347, dtb__348) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__345), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__346), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__347), Base_dList.C_Base_dList_dList_Nil)))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__349, dtb__350, dtb__351) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__349)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__352, dtb__353, dtb__354) -> (v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__353)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__355, dtb__356, dtb__357) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__355), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__356), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__358, dtb__359, dtb__360, dtb__361, dtb__362, dtb__363) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__361), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__362), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__364, dtb__365) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__364)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__366, dtb__367, dtb__368) -> (v_Vuna_dCompiler_dLoader_dResolve_deffInterpParts dtb__367)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__369, dtb__370, dtb__371, dtb__372) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__370), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__371), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__373, dtb__374, dtb__375, dtb__376) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__374), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__375), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__377, dtb__378) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__379, dtb__380, dtb__381) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__380)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__382, dtb__383, dtb__384) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__382)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__385, dtb__386) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__385)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__387, dtb__388, dtb__389) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__387)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffExprs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__390, dtb__391) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__390), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__391), Base_dList.C_Base_dList_dList_Nil)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffBinds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__392, dtb__393) -> (match dtb__392 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__394, dtb__395) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__395), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__393), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__396, dtb__397) -> (match dtb__396 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__398, dtb__399) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__399), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__397), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__400, dtb__401) -> (match dtb__400 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__402, dtb__403) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__403), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__401), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffInterpParts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__404, dtb__405) -> (match dtb__404 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__406) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__406), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffInterpParts dtb__405), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__407) -> (v_Vuna_dCompiler_dLoader_dResolve_deffInterpParts dtb__405)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffFields = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__408, dtb__409) -> (match dtb__408 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__410, dtb__411) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__411), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__409), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDo = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__412, dtb__413) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__412)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__414, dtb__415, dtb__416) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__415)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDos = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__417, dtb__418) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffDo dtb__417), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__418), Base_dList.C_Base_dList_dList_Nil)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffDecl = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__419, dtb__420, dtb__421, dtb__422) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__421)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__423, dtb__424, dtb__425, dtb__426) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__427, dtb__428, dtb__429, dtb__430) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__429)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDecls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__431, dtb__432) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecl dtb__431), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__432), Base_dList.C_Base_dList_dList_Nil)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_disUnsafeCapability = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dCapability_CapUnsafe -> true
  | _ -> false
))

let v_Vuna_dCompiler_dLoader_dResolve_disUnsafeGatedName = (fun name -> (if (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor name) then true else (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__433) -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability dtb__433) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__434) -> (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeCapability dtb__434)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__435, dtb__436, dtb__437) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__435)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__438, dtb__439) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__438)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__440, dtb__441, dtb__442) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__440)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__443, dtb__444, dtb__445) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__444)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__446, dtb__447) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__448, dtb__449, dtb__450, dtb__451) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__449), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__450), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__452, dtb__453, dtb__454, dtb__455) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__453), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__454), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__456, dtb__457, dtb__458) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeInterpParts dtb__457)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__459, dtb__460) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeDos dtb__459)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__461, dtb__462, dtb__463, dtb__464, dtb__465, dtb__466) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__464), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__465), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__467, dtb__468, dtb__469) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__467), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeFields dtb__468), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__470, dtb__471, dtb__472) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeFields dtb__471)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__473, dtb__474, dtb__475) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__473)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__476, dtb__477, dtb__478, dtb__479) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__476), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__477), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__478), Base_dList.C_Base_dList_dList_Nil)))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__480, dtb__481, dtb__482) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__480), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeAlts dtb__481), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__483, dtb__484) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeLocalClauses dtb__483)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__485, dtb__486, dtb__487, dtb__488) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeBinds dtb__485), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__486), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__489, dtb__490, dtb__491) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__489), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExprs dtb__490), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__492, dtb__493, dtb__494) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__493)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__495, dtb__496) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__497, dtb__498) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__499, dtb__500) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__501, dtb__502) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeGatedName dtb__501) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__501)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dunsafeExprs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__503, dtb__504) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__503), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExprs dtb__504), Base_dList.C_Base_dList_dList_Nil)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dunsafeBinds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__505, dtb__506) -> (match dtb__505 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__507, dtb__508) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__508), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeBinds dtb__506), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dunsafeAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__509, dtb__510) -> (match dtb__509 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__511, dtb__512) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__512), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeAlts dtb__510), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dunsafeLocalClauses = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__513, dtb__514) -> (match dtb__513 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__515, dtb__516) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__516), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeLocalClauses dtb__514), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dunsafeInterpParts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__517, dtb__518) -> (match dtb__517 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__519) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__519), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeInterpParts dtb__518), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__520) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeInterpParts dtb__518)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dunsafeFields = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__521, dtb__522) -> (match dtb__521 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__523, dtb__524) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__524), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeFields dtb__522), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dunsafeDo = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__525, dtb__526) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__525)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__527, dtb__528, dtb__529) -> (v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr dtb__528)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dunsafeDos = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__530, dtb__531) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeDo dtb__530), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_dResolve_dunsafeDos dtb__531), Base_dList.C_Base_dList_dList_Nil)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dtrustNameOf = (fun label name -> (if (if (label = "<entry>") then true else (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name)) then name else (String.concat "" [label; "."; name])))

let v_Vuna_dCompiler_dLoader_dResolve_dtrustFixHint = (fun label full -> (if (label = "<entry>") then "move this definition into a package library module and list its qualified name under [trust] unsafe" else (String.concat "" ["add \""; full; "\" to [trust] unsafe in vuna.toml (or route the call through an existing trust point such as Base.IO.Host.runIO)"])))

let v_Vuna_dCompiler_dLoader_dResolve_dqualifyDefName = (fun moduleName name -> (if (if (moduleName = "") then true else (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name)) then name else (String.concat "" [moduleName; "."; name])))

let rec v_Vuna_dCompiler_dLoader_dResolve_dmethodDefNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__532, dtb__533) -> (match dtb__532 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__534, dtb__535, dtb__536, dtb__537) -> ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dLoader_dResolve_dqualifyDefName mc0) dtb__534), Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dLoader_dResolve_dmethodDefNames mc0) dtb__533))
  | _ -> ((v_Vuna_dCompiler_dLoader_dResolve_dmethodDefNames mc0) dtb__533)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_ddeclDefNames = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__538, dtb__539, dtb__540, dtb__541) -> ((v_Vuna_dCompiler_dLoader_dResolve_dmethodDefNames mc0) dtb__540)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__542, dtb__543, dtb__544) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dLoader_dResolve_dqualifyDefName mc0) dtb__542), Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__545, dtb__546, dtb__547, dtb__548) -> (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dLoader_dResolve_dqualifyDefName mc0) dtb__545), Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dLoader_dResolve_dmoduleDefNames = (fun moduleName decls -> ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dResolve_ddeclDefNames moduleName)) decls))

let rec v_Vuna_dCompiler_dLoader_dResolve_downPackageDefNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__549, dtb__550) -> ((fun here -> ((Base_dList.v_Base_dList_dappend here) ((v_Vuna_dCompiler_dLoader_dResolve_downPackageDefNames mc0) dtb__550))) (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__549) = mc0) then ((v_Vuna_dCompiler_dLoader_dResolve_dmoduleDefNames (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__549)) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__549)) else Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_downPackageModuleNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__551, dtb__552) -> ((fun here -> ((Base_dList.v_Base_dList_dappend here) ((v_Vuna_dCompiler_dLoader_dResolve_downPackageModuleNames mc0) dtb__552))) (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__551) = mc0) then (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__551), Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dtrustPointModulePrefix = (fun t -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot t)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__553, dtb__554) -> (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__553)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dtrustPointMissing = (fun pkg t -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [pkg; ": trust point \""; t; "\" is not a definition of this package; [trust] unsafe may only list real definitions (Module.def)"]))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustListFull = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__555, dtb__556) -> (if ((Base_dList.v_Base_dList_dmemName dtb__555) mc2) then (((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustListFull mc0) dtb__556) mc2) else ((v_Vuna_dCompiler_dLoader_dResolve_dtrustPointMissing mc0) dtb__555))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustListLoaded = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__557, dtb__558) -> (if ((Base_dList.v_Base_dList_dmemName dtb__557) mc2) then ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustListLoaded mc0) dtb__558) mc2) mc3) else (if ((Base_dList.v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dResolve_dtrustPointModulePrefix dtb__557)) mc3) then ((v_Vuna_dCompiler_dLoader_dResolve_dtrustPointMissing mc0) dtb__557) else ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustListLoaded mc0) dtb__558) mc2) mc3)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustPoints = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__559) -> ((fun universe -> ((fun modNames -> (if mc2 then (((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustListFull mc0) dtb__559) universe) else ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustListLoaded mc0) dtb__559) universe) modNames))) ((v_Vuna_dCompiler_dLoader_dResolve_downPackageModuleNames mc0) mc4))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dResolve_ddeclDefNames "")) mc3)) ((v_Vuna_dCompiler_dLoader_dResolve_downPackageDefNames mc0) mc4)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects = (fun pkg -> (if (pkg = "") then "ad-hoc file (no package)" else ("package " ^ pkg)))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustDef = (fun label pkg trusted name body -> (match (v_Vuna_dCompiler_dLoader_dResolve_dunsafeExpr body) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__560) -> ((fun full -> (if ((Base_dList.v_Base_dList_dmemName full) trusted) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": definition `"; full; "` directly references unsafe-gated `"; dtb__560; "` and is not a trust point of "; (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg); "; "; ((v_Vuna_dCompiler_dLoader_dResolve_dtrustFixHint label) full)]))))) ((v_Vuna_dCompiler_dLoader_dResolve_dtrustNameOf label) name))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustDecls = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__561, dtb__562) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustDecl mc0) mc1) mc2) dtb__561)) (fun _u -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustDecls mc0) mc1) mc2) dtb__562)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustDecl = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__563, dtb__564, dtb__565, dtb__566) -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustDecls mc0) mc1) mc2) dtb__565)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__567, dtb__568, dtb__569, dtb__570) -> (((((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustDef mc0) mc1) mc2) dtb__567) dtb__569)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckDefinitionTrust = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__571) -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustDecls mc0) mc1) dtb__571) mc3)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckModuleEffects = (fun label pkg caps decls -> (match (v_Vuna_dCompiler_dLoader_dResolve_deffDecls decls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__572) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor dtb__572) then (if ((Base_dList.v_Base_dList_dmemName "unsafe") caps) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": `runIO` executes IO outside main; requires capability `unsafe` in "; (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg); " (declare [capabilities] effects = [\"unsafe\"])"])))) else (if ((v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect caps) dtb__572) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic dtb__572) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__573) -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability dtb__573) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__574) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": effectful builtin `"; dtb__572; "` requires capability `"; (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__574); "` in "; (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg); " (declare [capabilities] effects = [\""; (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__574); "\"] or use Base.IO / typed effects)"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins = (fun label pkg caps trust decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) caps)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckModuleEffects label) pkg) caps) decls)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckDefinitionTrust label) pkg) trust) decls)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok (decls)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__575, dtb__576) -> "do"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__577, dtb__578, dtb__579, dtb__580) -> "if"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__581, dtb__582, dtb__583) -> "case"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__584, dtb__585, dtb__586, dtb__587) -> "let"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__588, dtb__589, dtb__590) -> "lam"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__591, dtb__592) -> "float"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__593, dtb__594) -> "str"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__595, dtb__596) -> "int"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__597, dtb__598, dtb__599) -> "app"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__600, dtb__601) -> ("var " ^ dtb__600)
  | _ -> "other"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped = (fun fuel modules label prefix ns imports bound ty -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__602, dtb__603, dtb__604, dtb__605, dtb__606, dtb__607) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__605)) (fun dom2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) (Base_dList.C_Base_dList_dList_Cons (dtb__602, bound))) dtb__606)) (fun cod2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__602, dtb__603, dtb__604, dom2, cod2, dtb__607))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__608, dtb__609, dtb__610) -> (match dtb__608 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__611, dtb__612) -> (if (dtb__611 = "Type") then (Base_dResult.C_Base_dResult_dResult_Ok (ty)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__608)) (fun fn2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__609)) (fun args2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__610)))))))))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__608)) (fun fn2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__609)) (fun args2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__610))))))))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__613, dtb__614) -> (if ((Base_dList.v_Base_dList_dmemName dtb__613) bound) then (Base_dResult.C_Base_dResult_dResult_Ok (ty)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__613) then (Base_dResult.C_Base_dResult_dResult_Ok (ty)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__613)) (fun n -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, dtb__614))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__615, dtb__616) -> (Base_dResult.C_Base_dResult_dResult_Ok (ty))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__617, dtb__618) -> (Base_dResult.C_Base_dResult_dResult_Ok (ty))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": invalid type expression ("; (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty); ")"])))
)) ty)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel modules label prefix ns imports ty -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped fuel) modules) label) prefix) ns) imports) Base_dList.C_Base_dList_dList_Nil) ty))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr = (fun modules label prefix ns imports cx -> (match (v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf cx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__619) -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__619) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__620) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": unknown interface "; dtb__619])))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__621) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__622, dtb__623, dtb__624, dtb__625) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) mc5) dtb__622)) (fun c2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__623)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (c2, ty2, dtb__624, dtb__625))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dField_Field (dtb__626, dtb__627, dtb__628) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__626)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__627)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dField_Field (dtb__626, ty2, dtb__628))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_TraitMethod (dtb__629, dtb__630, dtb__631) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__629)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__630)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_TraitMethod (n, ty2, dtb__631))))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__632, dtb__633) -> (match dtb__632 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__634, dtb__635) -> ((fun isCtor -> (if isCtor then (Base_dList.C_Base_dList_dList_Cons ((match dtb__635 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__636, dtb__637, dtb__638, dtb__639) -> dtb__638
  | _ -> failwith "DT: impossible branch"
), ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__633))) else ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__633))) (if ((match dtb__635 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__640, dtb__641, dtb__642, dtb__643) -> dtb__640
  | _ -> failwith "DT: impossible branch"
) = "ctor") then true else ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget mc0) (match dtb__635 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__644, dtb__645, dtb__646, dtb__647) -> dtb__646
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal = (fun modules label prefix ns imports scope name -> (if ((Base_dList.v_Base_dList_dmemName name) scope) then (Base_dResult.C_Base_dResult_dResult_Ok (name)) else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__648, dtb__649, dtb__650, dtb__651, dtb__652, dtb__653, dtb__654) -> dtb__651
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (match (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__655, dtb__656) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))))
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__657, dtb__658, dtb__659, dtb__660, dtb__661, dtb__662, dtb__663) -> dtb__661
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified modules) label) imports) name) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName name) then (Base_dResult.C_Base_dResult_dResult_Ok (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName name) then (Base_dResult.C_Base_dResult_dResult_Ok (name)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (match cands with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cpairs -> (match cpairs with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__664, dtb__665, dtb__666, dtb__667, dtb__668, dtb__669, dtb__670) -> dtb__669
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun tpairs -> (match tpairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": unbound variable "; name; ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsuggest name) ((Base_dList.v_Base_dList_dappend (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__671, dtb__672, dtb__673, dtb__674, dtb__675, dtb__676, dtb__677) -> dtb__671
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__678, dtb__679, dtb__680, dtb__681, dtb__682, dtb__683, dtb__684) -> dtb__679
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__685, dtb__686, dtb__687, dtb__688, dtb__689, dtb__690, dtb__691) -> dtb__687
  | _ -> failwith "DT: impossible branch"
)) scope)))); (v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint name)])))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) tpairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__692, dtb__693, dtb__694, dtb__695) -> dtb__694
  | _ -> failwith "DT: impossible branch"
)))))
))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) cpairs)))))
)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))
)))
  | _ -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets modules) pairs) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__696, dtb__697, dtb__698, dtb__699) -> dtb__698
  | _ -> failwith "DT: impossible branch"
)))))
  | dtb__700 -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets dtb__700))))
)
)))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules label prefix ns imports scope name sp -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": invalid dotted name "; name])))
  | Base_dList.C_Base_dList_dList_Cons (dtb__701, dtb__702) -> (if ((Base_dList.v_Base_dList_dmemName dtb__701) scope) then (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__701, sp))) dtb__702) sp))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))) sp)) (fun q -> (match q with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__703) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__703))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__701) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Namespaces (dtb__704, dtb__705, dtb__706, dtb__707, dtb__708, dtb__709, dtb__710) -> dtb__707
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__701), sp))) dtb__702) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__701) then (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__701, sp))) dtb__702) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__701) then (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__711) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__711, sp))))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__712) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": module "; dtb__701; " is not imported"])))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__701)) (fun n -> (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, sp))) dtb__702) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind = (fun modules label prefix ns imports scope -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) "bind"))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__713, dtb__714) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__713)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__715, dtb__716) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__716) mc6)) dtb__714)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__715, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__717, dtb__718) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__717)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__719, dtb__720) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__720) mc6)) dtb__718)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__719, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel modules label prefix ns imports scope rec_u binds body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__721, dtb__722) -> (match dtb__721 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__723, dtb__724) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__724)) (fun value2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__723)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__725, dtb__726) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend dtb__726) scope)) dtb__722) body)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__727, dtb__728) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__725, value2)), dtb__727)), dtb__728))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, b))))))
  | _ -> failwith "DT: impossible branch"
)) binds)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__729) -> (match dtb__729 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__730, dtb__731) -> ((fun scope2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__731)) (fun values2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (values2, b))))))))) ((Base_dList.v_Base_dList_dappend dtb__730) scope))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__732) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__732))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ns) imports) binds))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__733, dtb__734) -> (match dtb__733 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__735, dtb__736) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__736)) (fun value2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__734)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__735, value2)), tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel modules label prefix ns imports scope expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__737, dtb__738) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__737) then (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__737, dtb__738)))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__737) then (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__737, dtb__738)))) else (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot dtb__737) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__737) dtb__738) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__737)) (fun n -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct dtb__738) dtb__737) n) scope))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__739, dtb__740, dtb__741, dtb__742) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": DT: internal: unreordered infix operator "; dtb__739])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__743, dtb__744, dtb__745, dtb__746) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": DT: internal: unreordered backtick infix operator "; dtb__743])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__747, dtb__748) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": DT: internal: unreordered operator section ("; dtb__747; ")"])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__749, dtb__750, dtb__751) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": DT: internal: unreordered left operator section ("; dtb__749; ")"])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__752, dtb__753, dtb__754) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [label; ": DT: internal: unreordered right operator section ("; dtb__753; ")"])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__755, dtb__756) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__755)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__757, dtb__758) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__757, dtb__758))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__759, dtb__760) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__759, dtb__760))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__761, dtb__762) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__761, dtb__762))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__763, dtb__764, dtb__765) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__764)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate dtb__765) ps)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__766, dtb__767, dtb__768) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) dtb__766)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend dtb__766) scope)) dtb__767)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__766, b, dtb__768))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__769, dtb__770, dtb__771) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__769)) (fun fn2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__770)) (fun args2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__771))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__772, dtb__773, dtb__774, dtb__775, dtb__776, dtb__777) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__775)) (fun dom2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (dtb__772, Base_dList.C_Base_dList_dList_Nil))) scope)) dtb__776)) (fun cod2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__772, dtb__773, dtb__774, dom2, cod2, dtb__777))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__778, dtb__779, dtb__780, dtb__781) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__780) dtb__778) dtb__779)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__782, dtb__783) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__782, dtb__783, dtb__780, dtb__781))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__784, dtb__785) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__784)) (fun clauses2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (clauses2, dtb__785))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__786, dtb__787, dtb__788) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__786)) (fun scrut2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__787)) (fun alts2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (scrut2, alts2, dtb__788))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__789, dtb__790, dtb__791, dtb__792) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__789)) (fun c2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__790)) (fun t2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__791)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, e2, dtb__792))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__793, dtb__794, dtb__795) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__793)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (b, dtb__794, dtb__795))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__796, dtb__797, dtb__798) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__796)) (fun name2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__797)) (fun fs -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (name2, fs, dtb__798))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__799, dtb__800, dtb__801) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__799)) (fun b -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__800)) (fun fs -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (b, fs, dtb__801))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__802, dtb__803) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDo (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__802)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__804, dtb__805, dtb__806) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__804)) (fun v2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__805)) (fun t2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (v2, t2, dtb__806))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts = (fun fuel modules label prefix ns imports scope parts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__807, dtb__808) -> (match dtb__807 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__809) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__809)) (fun e2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__808)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (e2)), ps))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__810) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__808)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__810)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) parts)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDo = (fun fuel modules label prefix ns imports scope stmts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__811, dtb__812) -> (match dtb__811 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__813, dtb__814) -> (match dtb__812 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__813)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts)))
)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain = (fun fuel modules label prefix ns imports scope bindName stmts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__815, dtb__816) -> (match dtb__815 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__817, dtb__818, dtb__819) -> (match dtb__817 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__820) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__818)) (fun e2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__816)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__819)), (Base_dList.C_Base_dList_dList_Cons (e2, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons ("vuna_do_ignore", Base_dList.C_Base_dList_dList_Nil)), tail, dtb__819)), Base_dList.C_Base_dList_dList_Nil)))), dtb__819))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__821, dtb__822) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__818)) (fun e2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) (Base_dList.C_Base_dList_dList_Cons (dtb__821, scope))) bindName) dtb__816)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName bindName), dtb__819)), (Base_dList.C_Base_dList_dList_Cons (e2, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons (dtb__821, Base_dList.C_Base_dList_dList_Nil)), tail, dtb__819)), Base_dList.C_Base_dList_dList_Nil)))), dtb__819))))))))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_DoBindPattern)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__823, dtb__824) -> (match dtb__816 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__823)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__823)) (fun e2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__816)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__824)), (Base_dList.C_Base_dList_dList_Cons (e2, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons ("vuna_do_ignore", Base_dList.C_Base_dList_dList_Nil)), tail, dtb__824)), Base_dList.C_Base_dList_dList_Nil)))), dtb__824))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__825, dtb__826) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__826)) (fun v -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__825, v)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__827, dtb__828, dtb__829, dtb__830) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__827)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__828)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__829)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__827, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__830))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__831, dtb__832, dtb__833, dtb__834) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__831)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__832)) (fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__833)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__831, ctx2, ty2, dtb__834))))))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((mc1 ^ ": instance body may only contain method signatures/definitions")))
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules label prefix ns imports d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__835, dtb__836, dtb__837, dtb__838, dtb__839, dtb__840, dtb__841, dtb__842) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__835)) (fun dn -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__837)) (fun kind2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ns) imports) dtb__835)) dtb__838)) (fun ctors2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__839)) (fun ds2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dn, dtb__836, kind2, ctors2, ds2, dtb__840, dtb__841, dtb__842))))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__843, dtb__844, dtb__845, dtb__846, dtb__847, dtb__848, dtb__849) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__843)) (fun dn -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ns) imports)) dtb__845)) (fun fields2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__846)) (fun ds2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dn, dtb__844, fields2, ds2, dtb__847, dtb__848, dtb__849))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__850, dtb__851, dtb__852, dtb__853) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__850)) (fun tn -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ns) imports)) dtb__852)) (fun ms -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (tn, dtb__851, ms, dtb__853))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__854, dtb__855, dtb__856, dtb__857) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__854)) (fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__855)) (fun head2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) ns) imports)) dtb__856)) (fun ms -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctx2, head2, ms, dtb__857))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__858, dtb__859, dtb__860, dtb__861) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__858)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__859)) (fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__860)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (n, ctx2, ty2, dtb__861))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__862, dtb__863, dtb__864) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__862)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__863)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (n, ty2, dtb__864))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__865, dtb__866, dtb__867, dtb__868) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__865)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__867)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (n, dtb__866, ty2, dtb__868))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__869, dtb__870, dtb__871, dtb__872) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__869)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__870)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__871)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (n, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__872))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules label prefix ns imports decls -> ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl modules) label) prefix) ns) imports)) decls))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun modules entryPkg entryCaps entryTrust imports decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls)) imports) decls)) (fun d -> (((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins "<entry>") entryPkg) entryCaps) entryTrust) d))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__873, dtb__874) -> (match dtb__873 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__875, dtb__876, dtb__877, dtb__878, dtb__879, dtb__880, dtb__881, dtb__882, dtb__883) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram mc0) dtb__875) dtb__875) (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf dtb__879)) ((Base_dList.v_Base_dList_dappend dtb__877) dtb__878)) dtb__879)) (fun d -> (((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__875) dtb__876) dtb__881) dtb__882) d)))) (fun d1 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dLoader_dResolve_dresolveModules dtb__874)) (fun d2 -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
