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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c); Base_dPair.f_Base_dPair_dPair_second = (String.concat "" [dtb__23; "."; (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c)]) })) dtb__26)) (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__32 }, (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22)))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf dtb__22)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith = (fun release decls -> ((fun vals -> ((fun cts -> ((fun tys -> ((fun cands -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues = vals; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors = cts; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes = tys; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet = (Base_dHashMap.v_Base_dHashMap_dofNames vals); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet = (Base_dHashMap.v_Base_dHashMap_dofNames cts); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet = (Base_dHashMap.v_Base_dHashMap_dofNames tys); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands = cands; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease = release }) (v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf decls))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf decls))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))) (v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf decls)))

let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf = (fun _uarity0 -> ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith false) _uarity0))

let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets = (fun prefix ns name -> ((Base_dList.v_Base_dList_dmap (fun p -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (Base_dPair.v_Base_dPair_dsecondOf p)))) ((Base_dList.v_Base_dList_dfilter (fun p -> ((Base_dPair.v_Base_dPair_dfirstOf p) = name))) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands)))

let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTarget = (fun prefix ns name -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__40))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if ((Base_dList.v_Base_dList_dmemName dtb__42) dtb__43) then (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets dtb__43) else (Base_dList.C_Base_dList_dList_Cons (dtb__42, (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets dtb__43))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget = (fun p -> ((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

let v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor = (fun modules p -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget modules) (v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget p)))

let v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets = (fun modules imports name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor modules)) pairs))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> true
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates = (fun modules prefix ns imports name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets modules) imports) name)) (fun imp -> ((fun local -> (if (if (if (v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList local) then (name <> "Nil") else false) then (name <> "Cons") else false) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (local)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dappend local) imp)))))) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified = (fun modules label imports name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> ((fun prefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleNotImported (prefix))) prefix)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__48)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__47) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__49).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__47) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__50) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__50).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__47) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__51).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ValueNotExported (dtb__47, dtb__48))) dtb__47) dtb__48)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__46))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__52) = mc0) then true else ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc0) dtb__53))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__54 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64) -> (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__56) = mc1) then (if ((v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed mc2) dtb__59) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) dtb__56) mc2))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__55))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> (if (if (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__65) = mc1) then (dtb__65 = mc2) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__65))) else ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__55))
  | _ -> ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls mc0) mc1) mc2) dtb__55)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match ((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf dtb__73)) mc1) mc2) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf dtb__73)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules dtb__74) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily = (fun prefix rel -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot rel)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__76; Base_dPair.f_Base_dPair_dPair_second = dtb__77 } -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__76))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily = (fun modules prefix ns famTarget base -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__78, dtb__79) -> (match dtb__78 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__80; Base_dPair.f_Base_dPair_dPair_second = dtb__81 } -> (match dtb__79 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__81)))
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules modules) famTarget) base)
)) ((Base_dList.v_Base_dList_dfilter (fun p -> (if ((Base_dPair.v_Base_dPair_dfirstOf p) = base) then (((v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily prefix) (Base_dPair.v_Base_dPair_dsecondOf p)) = famTarget) else false))) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorCands)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly = (fun modules label imports name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__82; Base_dPair.f_Base_dPair_dPair_second = dtb__83 } -> ((fun typePrefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleNotImported (typePrefix))) typePrefix)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__84) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__84)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__83) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__85).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__83) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__86) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__86).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_TypeNotExported (dtb__83, dtb__84))) dtb__83) dtb__84)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__82))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disIntrinsicTypeName name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name)) else (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly modules) label) imports) name) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_UnknownType (name))) name)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__87; Base_dPair.f_Base_dPair_dPair_second = dtb__88 } -> ((fun famName -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget modules) label) prefix) ns) imports) famName)) (fun famTarget -> (match (((((v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily modules) prefix) ns) famTarget) dtb__88) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__89) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__89))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_TypeHasNoConstructor (famName, dtb__88))) famName) dtb__88)
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__87))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dexportTarget = (fun e -> (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

let rec v_Vuna_dCompiler_dLoader_dResolve_dallEq = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (if (mc0 = dtb__90) then ((v_Vuna_dCompiler_dLoader_dResolve_dallEq mc0) dtb__91) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> ((v_Vuna_dCompiler_dLoader_dResolve_dallEq dtb__92) dtb__93)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if (v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95)))) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dResolve_dexportTarget dtb__94))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc1) (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dexportTarget) (Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95))))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_UnknownConstructor (mc1))) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__96; Base_dPair.f_Base_dPair_dPair_second = dtb__97 } -> ((fun prefixName -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefixName) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__98) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__98)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) dtb__97) with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ValueNotExported (dtb__97, dtb__98))) dtb__97) dtb__98)
  | dtb__99 -> (((v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget label) dtb__97) dtb__99)
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__96))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (mc0, dtb__100, mc2))) dtb__101) mc2)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (dtb__102, ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (mc0 - 1)) dtb__103))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddropSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (if (mc0 <= 0) then (Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105)) else ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (mc0 - 1)) dtb__105))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath = (fun modules label imports segs n sp -> (if (n < 1) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (n - 1)) segs))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__106)) (fun es -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__108 with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__107) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((dtb__109).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__107) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((dtb__110).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__107) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((dtb__111).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ValueNotExported (dtb__107, dtb__106))) dtb__107) dtb__106)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__107) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__112) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((dtb__112).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, sp))) dtb__108) sp)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ValueNotExported (dtb__107, dtb__106))) dtb__107) dtb__106)
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (n - 1)) segs))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) segs) (n - 1)) sp)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (match dtb__114 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__113
  | _ -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorName mc0) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor = (fun modules label prefix ns imports name -> (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (match cands with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disIntrinsicName name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dappendMessage ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsuggest name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors))) ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_UnknownConstructor (name))) name))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) pairs)))))
)))))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))
)))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder = (fun label name -> (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_InvalidVariableName (name))) name) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName = (fun label name -> (if (name = "_") then ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_InvalidTopLevelName ("_"))) "_") else (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_InvalidTopLevelName (name))) name) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName = (fun label prefix name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern = (fun fuel modules label prefix ns imports pat -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__115) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__115)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__116, dtb__117) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label) dtb__116)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__116, dtb__117)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__116, Base_dList.C_Base_dList_dList_Nil)) }))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__118, dtb__119, dtb__120) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__119)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__118, (Base_dPair.v_Base_dPair_dfirstOf p), dtb__120)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__118, (Base_dPair.v_Base_dPair_dsecondOf p))) }))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__121, dtb__122) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__121, dtb__122)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__123, dtb__124) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__123, dtb__124)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__125, dtb__126, dtb__127) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__125) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__126)) (fun parts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__125, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__127)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts) })))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__125)) (fun name2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__126)) (fun parts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__127)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts) })))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__128, dtb__129, dtb__130) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__128)) (fun name2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__129)) (fun parts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__130)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts) }))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__131; Base_dPair.f_Base_dPair_dPair_second = dtb__132 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__132)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__133; Base_dPair.f_Base_dPair_dPair_second = dtb__134 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { Base_dPair.f_Base_dPair_dPair_first = dtb__131; Base_dPair.f_Base_dPair_dPair_second = dtb__133 }; Base_dPair.f_Base_dPair_dPair_second = dtb__134 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__135)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__137; Base_dPair.f_Base_dPair_dPair_second = dtb__138 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__136)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__139; Base_dPair.f_Base_dPair_dPair_second = dtb__140 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__139)); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend dtb__138) dtb__140) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil })))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> (match dtb__141 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__143; Base_dPair.f_Base_dPair_dPair_second = dtb__144 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__143)) (fun pr -> (match pr with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__145; Base_dPair.f_Base_dPair_dPair_second = dtb__146 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__142)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = dtb__148 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend dtb__146) dtb__147); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__145; Base_dPair.f_Base_dPair_dPair_second = dtb__144 }, dtb__148)) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__149, dtb__150) -> (match dtb__149 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__151) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpMethodName, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__151))), (Base_dList.C_Base_dList_dList_Cons (dtb__151, Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__151))), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__150)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__152) -> (if (dtb__152 = "") then ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__150) else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__152, mc0)), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__150))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft mc0) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc0)), (Base_dList.C_Base_dList_dList_Cons (mc1, (Base_dList.C_Base_dList_dList_Cons (dtb__153, Base_dList.C_Base_dList_dList_Nil)))), mc0))) dtb__154)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate = (fun sp parts -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks sp) parts) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ("", sp))
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft sp) dtb__155) dtb__156)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct = (fun release sp name resolved scope -> (if release then (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disDebugOnlyName resolved) then (if ((Base_dList.v_Base_dList_dmemName name) scope) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp)))) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DebugConstructInRelease (resolved))) resolved)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (resolved, sp))))))

let v_Vuna_dCompiler_dLoader_dResolve_disParserSyntaxName = (fun name -> (if (if (if (if (if (if (if (if (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax)) then true else (name = Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax)) then true else ((Base_dString.v_Base_dString_dstartsWith "@vuna@list@") name)) then true else ((Base_dString.v_Base_dString_dstartsWith "@vuna@handle@") name)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label prefix dname ctor -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical prefix) dname) ctor))))))

let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__157, dtb__158) -> (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__157)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__159, dtb__160) -> (if (dtb__159 >= 65) then (dtb__159 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult = (fun label prefix ns name -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList_Cons (dtb__161, dtb__162) -> (match dtb__162 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161))))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_AmbiguousConstructor (name, ("Data." ^ name)))) name) ("Data." ^ name))
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__163) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__163))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun vp -> (match vp with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cp -> (match cp with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun tp -> (match tp with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) tp)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) cp)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) vp)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName = (fun modules label prefix ns imports name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__164; Base_dPair.f_Base_dPair_dPair_second = dtb__165 } -> ((fun typePrefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__166) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__166))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__167) -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleNotImported (typePrefix))) typePrefix)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__168) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__168)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__165) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__169) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__169).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__165) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__170) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((dtb__170).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_TypeNotExported (dtb__165, dtb__168))) dtb__165) dtb__168)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__164))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName = (fun modules label prefix ns imports name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult label) prefix) ns) name)) (fun mc -> (match mc with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__171))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName modules) label) prefix) ns) imports) name) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__172) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__172))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__173) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__173)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules label prefix ns imports name -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disIntrinsicTypeName name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName modules) label) prefix) ns) imports) name) else ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName modules) label) prefix) ns) imports) name))))))

let v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__174, dtb__175) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__176, dtb__177, dtb__178) -> (match dtb__176 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__179, dtb__180) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__179))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label prefix name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

let v_Vuna_dCompiler_dLoader_dResolve_disLowerIdent = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (if (dtb__181 >= 97) then (dtb__181 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__183, dtb__184, dtb__185) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames dtb__183)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames) dtb__184))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__186, dtb__187) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerIdent dtb__186) then (Base_dList.C_Base_dList_dList_Cons (dtb__186, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddedupScopeNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__188, dtb__189) -> (if ((Base_dList.v_Base_dList_dmemName dtb__188) dtb__189) then (v_Vuna_dCompiler_dLoader_dResolve_ddedupScopeNames dtb__189) else (Base_dList.C_Base_dList_dList_Cons (dtb__188, (v_Vuna_dCompiler_dLoader_dResolve_ddedupScopeNames dtb__189))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__190, dtb__191) -> (match dtb__190 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> (if (dtb__192 = mc0) then dtb__193 else ((v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf mc0) dtb__191))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__194, dtb__195) -> "do"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__196, dtb__197, dtb__198, dtb__199) -> "if"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__200, dtb__201, dtb__202) -> "case"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__203, dtb__204, dtb__205, dtb__206) -> "let"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__207, dtb__208, dtb__209) -> "lam"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__210, dtb__211) -> "float"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__212, dtb__213) -> "str"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__214, dtb__215) -> "int"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__216, dtb__217, dtb__218) -> "app"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__219, dtb__220) -> ("var " ^ dtb__219)
  | _ -> "other"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped = (fun fuel modules label prefix ns imports bound ty -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__224)) (fun dom2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) (Base_dList.C_Base_dList_dList_Cons (dtb__221, bound))) dtb__225)) (fun cod2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__221, dtb__222, dtb__223, dom2, cod2, dtb__226))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__227, dtb__228, dtb__229) -> (match dtb__227 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__230, dtb__231) -> (if (dtb__230 = "Type") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ty)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__227)) (fun fn2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__228)) (fun args2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__229)))))))))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__227)) (fun fn2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__228)) (fun args2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__229))))))))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__232, dtb__233) -> (if ((Base_dList.v_Base_dList_dmemName dtb__232) bound) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ty)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName dtb__232) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unexpanded macro invocation " ^ dtb__232)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__232) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ty)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__232)) (fun n -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, dtb__233)))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__234, dtb__235) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ty))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__236, dtb__237) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (ty))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_InvalidTypeExpression ((v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)))) (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty))
)) ty)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel modules label prefix ns imports ty -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped fuel) modules) label) prefix) ns) imports) Base_dList.C_Base_dList_dList_Nil) ty))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr = (fun modules label prefix ns imports cx -> (match (v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf cx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__238) -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__238) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__239) -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_UnknownInterface (dtb__238))) dtb__238)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__240) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__241; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__242; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__243; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__244 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) mc5) dtb__241)) (fun c2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__242)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = c2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__243; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__244 }))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__245; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__246; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__247 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__245)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__246)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__245; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__247 }))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__248; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__249; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__250 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__248)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__249)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = n; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = ty2; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__250 }))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__251, dtb__252) -> (match dtb__251 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__253; Base_dPair.f_Base_dPair_dPair_second = dtb__254 } -> ((fun isCtor -> (if isCtor then (Base_dList.C_Base_dList_dList_Cons ((dtb__254).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target, ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__252))) else ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets mc0) dtb__252))) (if ((dtb__254).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then true else ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget mc0) (dtb__254).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal = (fun modules label prefix ns imports scope name -> (if ((Base_dList.v_Base_dList_dmemName name) scope) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name)) else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (match (((v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets prefix) ns) name) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__255, dtb__256) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))))
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtorSet) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified modules) label) imports) name) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (name)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates modules) prefix) ns) imports) name)) (fun cands -> (match cands with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cpairs -> (match cpairs with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypeSet) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun tpairs -> (match tpairs with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dappendMessage ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsuggest name) ((Base_dList.v_Base_dList_dappend (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValues) ((Base_dList.v_Base_dList_dappend (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsCtors) ((Base_dList.v_Base_dList_dappend (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsTypes) scope)))))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dappendMessage (v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint name))) ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_UnknownVariable (name))) name)))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) tpairs)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
))))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget) cpairs)))))
)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) cands)))
)))
  | _ -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets modules) pairs) with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target))))
  | dtb__257 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver name) (v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets dtb__257))))
)
)))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules label prefix ns imports scope name sp -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "empty dotted name")
  | Base_dList.C_Base_dList_dList_Cons (dtb__258, dtb__259) -> (if ((Base_dList.v_Base_dList_dmemName dtb__258) scope) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__258, sp))) dtb__259) sp))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name))) sp)) (fun q -> (match q with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__260) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__260))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__258) (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsValueSet) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__258), sp))) dtb__259) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__258) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__258, sp))) dtb__259) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__258) then (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__261) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__261, sp))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__262) -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleNotImported (dtb__258))) dtb__258)
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__258)) (fun n -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (n, sp))) dtb__259) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind = (fun modules label prefix ns imports scope -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) "bind"))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = dtb__264 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__263)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__265; Base_dPair.f_Base_dPair_dPair_second = dtb__266 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__266) mc6)) dtb__264)) (fun body2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__265; Base_dPair.f_Base_dPair_dPair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__267; Base_dPair.f_Base_dPair_dPair_second = dtb__268 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__267)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__269; Base_dPair.f_Base_dPair_dPair_second = dtb__270 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__270) mc6)) dtb__268)) (fun body2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__269; Base_dPair.f_Base_dPair_dPair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel modules label prefix ns imports scope rec_u binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (match dtb__271 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__273; Base_dPair.f_Base_dPair_dPair_second = dtb__274 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__274)) (fun value2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__273)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__275; Base_dPair.f_Base_dPair_dPair_second = dtb__276 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend dtb__276) scope)) dtb__272) body)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__277; Base_dPair.f_Base_dPair_dPair_second = dtb__278 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__275; Base_dPair.f_Base_dPair_dPair_second = value2 }, dtb__277)); Base_dPair.f_Base_dPair_dPair_second = dtb__278 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun b -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = b }))))
  | _ -> failwith "DT: impossible branch"
)) binds)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__279) -> (match dtb__279 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__280; Base_dPair.f_Base_dPair_dPair_second = dtb__281 } -> ((fun scope2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__281)) (fun values2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun b -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = values2; Base_dPair.f_Base_dPair_dPair_second = b }))))))) ((Base_dList.v_Base_dList_dappend dtb__280) scope))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__282) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__282))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ns) imports) binds))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__283, dtb__284) -> (match dtb__283 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__285; Base_dPair.f_Base_dPair_dPair_second = dtb__286 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__286)) (fun value2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__284)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__285; Base_dPair.f_Base_dPair_dPair_second = value2 }, tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel modules label prefix ns imports scope expr -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__287, dtb__288) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__287) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__287, dtb__288)))) else (if ((Base_dString.v_Base_dString_dstartsWith "!") dtb__287) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((((Base_dString.v_Base_dString_dsubstring 1) (bi_natFromInt (bi_strLength dtb__287))) dtb__287), dtb__288)))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName dtb__287) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unexpanded macro invocation " ^ dtb__287)) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__287) then (if (if (if (if (if (v_Vuna_dCompiler_dLoader_dResolve_disParserSyntaxName dtb__287) then true else ((Base_dString.v_Base_dString_dstartsWith "Base.") prefix)) then true else ((Base_dString.v_Base_dString_dstartsWith "Vuna.") prefix)) then true else ((Base_dString.v_Base_dString_dstartsWith "Base_d") prefix)) then true else ((Base_dString.v_Base_dString_dstartsWith "Vuna_d") prefix)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__287, dtb__288)))) else ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_UnknownVariable (dtb__287))) dtb__287)) else (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot dtb__287) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__287) dtb__288) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__287)) (fun n -> (((((v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct (ns).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dNamespaces_nsRelease) dtb__288) dtb__287) n) scope))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__289, dtb__290, dtb__291, dtb__292) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unreordered infix operator " ^ dtb__289))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__293, dtb__294, dtb__295, dtb__296) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal ("unreordered backtick infix operator " ^ dtb__293))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__297, dtb__298) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["unreordered operator section ("; dtb__297; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__299, dtb__300, dtb__301) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["unreordered left operator section ("; dtb__299; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__302, dtb__303, dtb__304) -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["unreordered right operator section ("; dtb__303; ")"]))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__305, dtb__306) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__305)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__307, dtb__308) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__307, dtb__308))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__309, dtb__310) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__309, dtb__310))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__311, dtb__312) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__311, dtb__312))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__313, dtb__314, dtb__315) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__314)) (fun ps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate dtb__315) ps)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__316, dtb__317, dtb__318) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) dtb__316)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend dtb__316) scope)) dtb__317)) (fun b -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__316, b, dtb__318))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__319, dtb__320, dtb__321) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__319)) (fun fn2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__320)) (fun args2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__321))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__325)) (fun dom2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (dtb__322, Base_dList.C_Base_dList_dList_Nil))) scope)) dtb__326)) (fun cod2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__322, dtb__323, dtb__324, dom2, cod2, dtb__327))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__328, dtb__329, dtb__330, dtb__331) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__330) dtb__328) dtb__329)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__332; Base_dPair.f_Base_dPair_dPair_second = dtb__333 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__332, dtb__333, dtb__330, dtb__331))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__334, dtb__335) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__334)) (fun clauses2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (clauses2, dtb__335))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__336, dtb__337, dtb__338) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__336)) (fun scrut2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__337)) (fun alts2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (scrut2, alts2, dtb__338))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__339, dtb__340, dtb__341, dtb__342) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__339)) (fun c2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__340)) (fun t2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__341)) (fun e2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, e2, dtb__342))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__343, dtb__344, dtb__345) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__343)) (fun b -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (b, dtb__344, dtb__345))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__346, dtb__347, dtb__348) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__346)) (fun name2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__347)) (fun fs -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (name2, fs, dtb__348))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__349, dtb__350, dtb__351) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__349)) (fun b -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__350)) (fun fs -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (b, fs, dtb__351))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__352, dtb__353) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDo (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__352)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__354, dtb__355, dtb__356) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__354)) (fun v2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__355)) (fun t2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (v2, t2, dtb__356))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts = (fun fuel modules label prefix ns imports scope parts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__357, dtb__358) -> (match dtb__357 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__359) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__359)) (fun e2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__358)) (fun ps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (e2)), ps))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__360) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__358)) (fun ps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__360)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)) parts)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDo = (fun fuel modules label prefix ns imports scope stmts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__361, dtb__362) -> (match dtb__361 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__363, dtb__364) -> (match dtb__362 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__363)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts)))
)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind modules) label) prefix) ns) imports) scope)) (fun bindName -> (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain = (fun fuel modules label prefix ns imports scope bindName stmts -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__365, dtb__366) -> (match dtb__365 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__367, dtb__368, dtb__369) -> (match dtb__367 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__370) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__368)) (fun e2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__366)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__369)), (Base_dList.C_Base_dList_dList_Cons (e2, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons ("_", Base_dList.C_Base_dList_dList_Nil)), tail, dtb__369)), Base_dList.C_Base_dList_dList_Nil)))), dtb__369))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__371, dtb__372) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__368)) (fun e2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) (Base_dList.C_Base_dList_dList_Cons (dtb__371, scope))) bindName) dtb__366)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName bindName), dtb__369)), (Base_dList.C_Base_dList_dList_Cons (e2, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons (dtb__371, Base_dList.C_Base_dList_dList_Nil)), tail, dtb__369)), Base_dList.C_Base_dList_dList_Nil)))), dtb__369))))))))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_DoBindPattern)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__373, dtb__374) -> (match dtb__366 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__373)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__373)) (fun e2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__366)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName bindName), dtb__374)), (Base_dList.C_Base_dList_dList_Cons (e2, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons ("_", Base_dList.C_Base_dList_dList_Nil)), tail, dtb__374)), Base_dList.C_Base_dList_dList_Nil)))), dtb__374))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__375; Base_dPair.f_Base_dPair_dPair_second = dtb__376 } -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "resolver") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__376)) (fun v -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__375; Base_dPair.f_Base_dPair_dPair_second = v })))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__377, dtb__378, dtb__379, dtb__380) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__377)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__378)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__379)) (fun b -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__377, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__380))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__381, dtb__382, dtb__383, dtb__384) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__381)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__382)) (fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__383)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__381, ctx2, ty2, dtb__384))))))))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "unexpected instance body declaration")
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules label prefix ns imports d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392, dtb__393) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__385)) (fun dn -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__387)) (fun kind2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ns) imports) dtb__385)) dtb__388)) (fun ctors2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__389)) (fun ds2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dn, dtb__386, kind2, ctors2, ds2, dtb__390, dtb__391, dtb__392, dtb__393))))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, dtb__400, dtb__401) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__394)) (fun dn -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ns) imports)) dtb__396)) (fun fields2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__397)) (fun ds2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dn, dtb__395, fields2, ds2, dtb__398, dtb__399, dtb__400, dtb__401))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__402, dtb__403, dtb__404, dtb__405) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__402)) (fun tn -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ns) imports)) dtb__404)) (fun ms -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (tn, dtb__403, ms, dtb__405))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__406, dtb__407, dtb__408, dtb__409) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__406)) (fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__407)) (fun head2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) ns) imports)) dtb__408)) (fun ms -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctx2, head2, ms, dtb__409))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__410, dtb__411, dtb__412, dtb__413) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__410)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__411)) (fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__412)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (n, ctx2, ty2, dtb__413))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__414, dtb__415, dtb__416) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__414)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__415)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (n, ty2, dtb__416))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__417, dtb__418, dtb__419, dtb__420) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__417)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__419)) (fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (n, dtb__418, ty2, dtb__420))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__421, dtb__422, dtb__423, dtb__424) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__421)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__422)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__423)) (fun b -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (n, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__424))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDeclWithImplicitScopes = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__425, dtb__426, dtb__427, dtb__428) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc2) mc3) dtb__425)) (fun n -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5)) dtb__426)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) ((v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf dtb__425) mc0))) dtb__427)) (fun b -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (n, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__428))))))))))
  | _ -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl mc1) mc2) mc3) mc4) mc5) mc6)
))

let v_Vuna_dCompiler_dLoader_dResolve_disStringDomainExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__429, dtb__430) -> (if (dtb__429 = "String") then true else (if (dtb__429 = "Base.String.String") then true else false))
  | _ -> false
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436) -> (if dtb__432 then (if (dtb__431 = "_") then (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__435) else (if (v_Vuna_dCompiler_dLoader_dResolve_disStringDomainExpr dtb__434) then (Base_dList.C_Base_dList_dList_Cons (dtb__431, (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__435))) else (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__435))) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__437, dtb__438) -> (match dtb__437 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__439, dtb__440, dtb__441, dtb__442) -> ((fun names -> (match names with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__438)
  | _ -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__439; Base_dPair.f_Base_dPair_dPair_second = names }, (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__438)))
)) (v_Vuna_dCompiler_dLoader_dResolve_ddedupScopeNames ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames dtb__441)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames) dtb__440))))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable dtb__438)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules label prefix ns imports decls -> ((fun implicitScopes -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDeclWithImplicitScopes implicitScopes) modules) label) prefix) ns) imports)) decls)) (v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable decls)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun release modules entryPkg imports decls -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith release) decls)) imports) decls))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__443, dtb__444) -> (match dtb__443 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__445; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__446; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__447; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__448; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__449; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__450; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__451; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__452; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__453 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram mc1) dtb__445) dtb__445) ((v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith mc0) dtb__449)) ((Base_dList.v_Base_dList_dappend dtb__447) dtb__448)) dtb__449)) (fun d1 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dResolve_dresolveModules mc0) dtb__444)) (fun d2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
