open Vuna_runtime
# 40 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveFuelBound = 1073741824

# 44 "Vuna/Compiler/Loader/Resolve.vuna"
let v_builtinArity = (fun (name : string) -> (match (Base_dIntrinsics.v_findIntrinsic name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (if (Base_dIntrinsics.v_intrinsicVisible dtb__0) then (B_dData_dMaybe.C_Maybe_Just ((Base_dIntrinsics.v_intrinsicArity dtb__0))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isBuiltinName = (fun (name : string) -> (match (v_builtinArity name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Loader/Resolve.vuna"
let v_dtPreludeNames = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Type", (B_dData_dList.C_List__x58__x58_ ("->", (B_dData_dList.C_List__x58__x58_ ("_", B_dData_dList.C_List_Nil))))))) ((B_dData_dList.v_append Base_dIntrinsics.v_preludeTypeNames) Base_dIntrinsics.v_preludeValueNames))

# 63 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isDtPreludeName = (fun (name : string) -> ((B_dData_dList.v_memName name) v_dtPreludeNames))

# 73 "Vuna/Compiler/Loader/Resolve.vuna"
let v_traitImportHint = (fun (mc0 : string) -> (if (mc0 = "Show") then " (trait Show is not in scope; add `import Base.Trait.Show`)" else (if (mc0 = "Eq") then " (trait Eq is not in scope; add `import Base.Trait.Eq`)" else (if (mc0 = "Ord") then " (trait Ord is not in scope; add `import Base.Trait.Ord`)" else (if (mc0 = "show") then " (trait method show; add `import Base.Trait.Show`)" else (if (mc0 = "eq") then " (trait method eq; add `import Base.Trait.Eq`)" else (if (mc0 = "neq") then " (trait method neq; add `import Base.Trait.Eq`)" else (if (mc0 = "lt") then " (trait method lt; add `import Base.Trait.Ord`)" else (if (mc0 = "le") then " (trait method le; add `import Base.Trait.Ord`)" else (if (mc0 = "gt") then " (trait method gt; add `import Base.Trait.Ord`)" else (if (mc0 = "ge") then " (trait method ge; add `import Base.Trait.Ord`)" else "")))))))))))

# 95 "Vuna/Compiler/Loader/Resolve.vuna"
let v_declValueNames = (fun (d : Frontend_dAst.t_Decl) -> (match d with
  | Frontend_dAst.C_Decl_DFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (B_dData_dList.C_List__x58__x58_ (dtb__2, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb__6, dtb__7, dtb__8, dtb__9) -> (B_dData_dList.C_List__x58__x58_ (dtb__6, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb__10, dtb__11, dtb__12) -> (B_dData_dList.C_List__x58__x58_ (dtb__10, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DExtern (dtb__13, dtb__14, dtb__15, dtb__16) -> (B_dData_dList.C_List__x58__x58_ (dtb__13, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DInstance (dtb__17, dtb__18, dtb__19, dtb__20) -> B_dData_dList.C_List_Nil
  | _ -> B_dData_dList.C_List_Nil
))

# 107 "Vuna/Compiler/Loader/Resolve.vuna"
let v_valueNamesOf = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declValueNames) decls))

# 115 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorCandsOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | Frontend_dAst.C_Decl_DData (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (c : Frontend_dAst.t_Ctor) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.v_ctorName c); B_dData_dPair.f_Pair_second = (String.concat "" [dtb__23; "."; (Frontend_dAst.v_ctorName c)]) })) dtb__26)) (v_ctorCandsOf dtb__22))
  | Frontend_dAst.C_Decl_DRecord (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__32 }, (v_ctorCandsOf dtb__22)))
  | _ -> (v_ctorCandsOf dtb__22)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Loader/Resolve.vuna"
let v_namespacesOfWith = (fun (release : bool) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((fun vals -> ((fun cts -> ((fun tys -> ((fun cands -> { Loader_dModules.f_Namespaces_nsValues = vals; Loader_dModules.f_Namespaces_nsCtors = cts; Loader_dModules.f_Namespaces_nsTypes = tys; Loader_dModules.f_Namespaces_nsValueSet = (B_dContainer_dHashMap.v_ofNames vals); Loader_dModules.f_Namespaces_nsCtorSet = (B_dContainer_dHashMap.v_ofNames cts); Loader_dModules.f_Namespaces_nsTypeSet = (B_dContainer_dHashMap.v_ofNames tys); Loader_dModules.f_Namespaces_nsCtorCands = cands; Loader_dModules.f_Namespaces_nsRelease = release }) (v_ctorCandsOf decls))) (Frontend_dAst.v_typeNamesOf decls))) (Frontend_dAst.v_ctorsOf decls))) (v_valueNamesOf decls)))

# 145 "Vuna/Compiler/Loader/Resolve.vuna"
let v_namespacesOf = (fun (_uarity0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_namespacesOfWith false) _uarity0))

# 150 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorTargets = (fun (prefix : string) (ns : Loader_dModules.t_Namespaces) (name : string) -> ((B_dData_dList.v_map (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((Loader_dModules.v_mangle prefix) (B_dData_dPair.v_secondOf p)))) ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_firstOf p) = name))) (ns).Loader_dModules.f_Namespaces_nsCtorCands)))

# 155 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorTarget = (fun (prefix : string) (ns : Loader_dModules.t_Namespaces) (name : string) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__40))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (((v_localCtorTargets prefix) ns) name)))

# 166 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pairExportTarget = (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target)

# 170 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pairIsDataCtor = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> ((Loader_dModules.v_isDataOrRecordCtorTarget modules) (v_pairExportTarget p)))

# 174 "Vuna/Compiler/Loader/Resolve.vuna"
let v_importedCtorTargets = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtor modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) ((B_dData_dList.v_filter (v_pairIsDataCtor modules)) pairs))))))))

# 193 "Vuna/Compiler/Loader/Resolve.vuna"
let v_notEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorCandidates = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_importedCtorTargets modules) imports) name)) (fun (imp : string B_dData_dList.t_List) -> ((fun local -> (if (if (if (if (v_notEmptyList local) then (name <> "Nil") else false) then (name <> "Cons") else false) then (name <> "::") else false) then (Base_dDiag.C_Check_OkC (local)) else (Base_dDiag.C_Check_OkC ((B_dData_dList.v_nubNames ((B_dData_dList.v_append local) imp)))))) (((v_localCtorTargets prefix) ns) name)))))

# 237 "Vuna/Compiler/Loader/Resolve.vuna"
let v_realModuleName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (name : string) -> (match ((Loader_dModules.v_resolveModuleName modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__44) -> dtb__44
  | B_dData_dMaybe.C_Maybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pathKey = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__46 } -> (String.concat "" [dtb__45; "|"; (Base_dSource.v_joinDots dtb__46)])
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_memPathKey = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (if ((v_pathKey dtb__47) = mc0) then true else ((v_memPathKey mc0) dtb__48))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_uniqPathResults = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (if ((v_memPathKey (v_pathKey dtb__49)) dtb__50) then (v_uniqPathResults dtb__50) else (B_dData_dList.C_List__x58__x58_ (dtb__49, (v_uniqPathResults dtb__50))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_commaJoin = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (match dtb__52 with
  | B_dData_dList.C_List_Nil -> dtb__51
  | _ -> (String.concat "" [dtb__51; ", "; (v_commaJoin dtb__52)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Loader/Resolve.vuna"
let v_lastSegmentOf = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_memberLabel = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (match dtb__55 with
  | { B_dData_dPair.f_Pair_first = dtb__57; B_dData_dPair.f_Pair_second = dtb__58 } -> (match dtb__58 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> dtb__59
  | B_dData_dList.C_List_Nil -> ((v_memberLabel mc0) dtb__56)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Loader/Resolve.vuna"
let v_firstModuleOf = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match dtb__61 with
  | { B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = dtb__64 } -> dtb__63
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_entryHits = (fun (mc0 : (Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (string) -> Loader_dModules.t_ExportEntry B_dData_dList.t_List) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : string) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__68 } -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match dtb__70 with
  | B_dData_dList.C_List_Nil -> (if (dtb__69 = mc3) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc1) dtb__67)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((mc0 es) mc3) with
  | B_dData_dList.C_List_Nil -> ((((v_entryHits mc0) mc1) dtb__66) mc3)
  | dtb__71 -> ((Base_dCommon.v_bind ((((v_entryHits mc0) mc1) dtb__66) mc3)) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = e })) dtb__71)) hits)))))
))) else ((((v_entryHits mc0) mc1) dtb__66) mc3))
  | _ -> ((((v_entryHits mc0) mc1) dtb__66) mc3)
)
  | _ -> ((((v_entryHits mc0) mc1) dtb__66) mc3)
)) dtb__68)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueEntry = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (base : string) -> (match ((Loader_dModules.v_findExportValue es) base) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (B_dData_dMaybe.C_Maybe_Just (dtb__72))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Loader_dModules.v_findExportType es) base)
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueEntries = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (base : string) -> (match ((Loader_dModules.v_findExportValues es) base) with
  | B_dData_dList.C_List_Nil -> ((Loader_dModules.v_findExportTypes es) base)
  | dtb__73 -> dtb__73
))

# 328 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickTypeEntries = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (base : string) -> (match ((Loader_dModules.v_findExportTypes es) base) with
  | B_dData_dList.C_List_Nil -> ((Loader_dModules.v_findExportValues es) base)
  | dtb__74 -> dtb__74
))

# 369 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_anyCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (if ((Frontend_dAst.v_ctorName dtb__75) = mc0) then true else ((v_anyCtorNamed mc0) dtb__76))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorTargetInDecls = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (match dtb__77 with
  | Frontend_dAst.C_Decl_DData (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> (if (((Loader_dModules.v_mangle mc0) dtb__79) = mc1) then (if ((v_anyCtorNamed mc2) dtb__82) then (B_dData_dMaybe.C_Maybe_Just ((((Loader_dModules.v_ctorCanonical mc0) dtb__79) mc2))) else B_dData_dMaybe.C_Maybe_Nothing) else ((((v_ctorTargetInDecls mc0) mc1) mc2) dtb__78))
  | Frontend_dAst.C_Decl_DRecord (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if (if (((Loader_dModules.v_mangle mc0) dtb__88) = mc1) then (dtb__88 = mc2) else false) then (B_dData_dMaybe.C_Maybe_Just (((Loader_dModules.v_mangle mc0) dtb__88))) else ((((v_ctorTargetInDecls mc0) mc1) mc2) dtb__78))
  | _ -> ((((v_ctorTargetInDecls mc0) mc1) mc2) dtb__78)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_findFamilyCtorInModules = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match ((((v_ctorTargetInDecls (Loader_dModules.v_moduleNameOf dtb__96)) mc1) mc2) (Loader_dModules.v_moduleDeclsOf dtb__96)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (B_dData_dMaybe.C_Maybe_Just (dtb__98))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_findFamilyCtorInModules dtb__97) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorRelFamily = (fun (prefix : string) (rel : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot rel)) with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> ((Loader_dModules.v_mangle prefix) (Base_dSource.v_joinDots dtb__99))
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorTargetInFamily = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (ns : Loader_dModules.t_Namespaces) (famTarget : string) (base : string) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (match dtb__101 with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> (match dtb__102 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (((Loader_dModules.v_mangle prefix) dtb__104)))
  | _ -> (((v_findFamilyCtorInModules modules) famTarget) base)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_findFamilyCtorInModules modules) famTarget) base)
)) ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> (if ((B_dData_dPair.v_firstOf p) = base) then (((v_ctorRelFamily prefix) (B_dData_dPair.v_secondOf p)) = famTarget) else false))) (ns).Loader_dModules.f_Namespaces_nsCtorCands)))

# 449 "Vuna/Compiler/Loader/Resolve.vuna"
let v_exportTarget = (fun (e : Loader_dModules.t_ExportEntry) -> (e).Loader_dModules.f_ExportEntry_target)

# 467 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_allEq = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (if (mc0 = dtb__105) then ((v_allEq mc0) dtb__106) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Loader/Resolve.vuna"
let v_allSameTarget = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> ((v_allEq dtb__107) dtb__108)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Loader/Resolve.vuna"
let v_uniqueCtorTarget = (fun (mc0 : string) (mc1 : string) (mc2 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (if (v_allSameTarget ((B_dData_dList.v_map v_exportTarget) (B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110)))) then (Base_dDiag.C_Check_OkC ((v_exportTarget dtb__109))) else (Base_dDiag.C_Check_OkC (((Frontend_dAst.v_overCtorName mc1) (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_exportTarget) (B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110))))))))
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownConstructor (mc1))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 473 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorEntryHits = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (match dtb__116 with
  | B_dData_dList.C_List_Nil -> (if (dtb__115 = mc2) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) dtb__113)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportCtors es) dtb__115) with
  | B_dData_dList.C_List_Nil -> (((v_ctorEntryHits mc0) dtb__112) mc2)
  | dtb__117 -> ((Base_dCommon.v_bind (((v_ctorEntryHits mc0) dtb__112) mc2)) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = e })) dtb__117)) hits)))))
))) else (((v_ctorEntryHits mc0) dtb__112) mc2))
  | _ -> (((v_ctorEntryHits mc0) dtb__112) mc2)
)
  | _ -> (((v_ctorEntryHits mc0) dtb__112) mc2)
)) dtb__114)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorFamilyEntryOf = (fun (base : string) (parent : string) (x : Loader_dModules.t_ExportEntry) -> (if (if ((x).Loader_dModules.f_ExportEntry_kind = "ctor") then ((x).Loader_dModules.f_ExportEntry_public = base) else false) then ((x).Loader_dModules.f_ExportEntry_parent = parent) else false))

# 493 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorFamilyHits = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) (mc3 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | { B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = dtb__121 } -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__122, dtb__123) -> (match dtb__123 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (match dtb__125 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb__122 = mc2) then (dtb__124 = mc3) else false) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) dtb__120)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportType es) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__126) -> (match ((B_dData_dList.v_filter ((v_ctorFamilyEntryOf mc3) (dtb__126).Loader_dModules.f_ExportEntry_target)) es) with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> ((Base_dCommon.v_bind ((((v_ctorFamilyHits mc0) dtb__119) mc2) mc3)) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = { Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = mc3; Loader_dModules.f_ExportEntry_target = (dtb__127).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = (dtb__126).Loader_dModules.f_ExportEntry_target } }, hits))))))
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((Loader_dModules.v_moduleDecls mc0) dtb__120)) (fun (ds : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match ((((v_ctorTargetInDecls dtb__120) (dtb__126).Loader_dModules.f_ExportEntry_target) mc3) ds) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__129) -> ((Base_dCommon.v_bind ((((v_ctorFamilyHits mc0) dtb__119) mc2) mc3)) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = { Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = mc3; Loader_dModules.f_ExportEntry_target = dtb__129; Loader_dModules.f_ExportEntry_parent = (dtb__126).Loader_dModules.f_ExportEntry_target } }, hits))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_ctorFamilyHits mc0) dtb__119) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_ctorFamilyHits mc0) dtb__119) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
))) else ((((v_ctorFamilyHits mc0) dtb__119) mc2) mc3))
  | _ -> ((((v_ctorFamilyHits mc0) dtb__119) mc2) mc3)
)
  | _ -> ((((v_ctorFamilyHits mc0) dtb__119) mc2) mc3)
)
  | _ -> ((((v_ctorFamilyHits mc0) dtb__119) mc2) mc3)
)) dtb__121)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 566 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_foldFieldChain = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (((v_foldFieldChain (Frontend_dAst.C_Expr_EField (mc0, dtb__130, mc2))) dtb__131) mc2)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 570 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_takeSegs = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__132, ((v_takeSegs (mc0 - 1)) dtb__133))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_longestNamespaceEntryGo = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (k : int) -> (if (k <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Loader_dModules.v_findExportModule es) (Base_dSource.v_joinDots ((v_takeSegs k) segs))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__134).Loader_dModules.f_ExportEntry_target; B_dData_dPair.f_Pair_second = k }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_longestNamespaceEntryGo es) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 217 "Vuna/Compiler/Loader/Resolve.vuna"
let v_longestNamespaceEntry = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (segs : string B_dData_dList.t_List) -> (((v_longestNamespaceEntryGo es) segs) (B_dData_dList.v_length segs)))

# 574 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_dropSegs = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136)) else ((v_dropSegs (mc0 - 1)) dtb__136))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_walkNamespacePathsFuel = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "namespace path") else (if (v_notEmptyList segs) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (match dtb__137 with
  | { B_dData_dPair.f_Pair_first = dtb__138; B_dData_dPair.f_Pair_second = dtb__139 } -> ((((v_walkNamespacePathsFuel (fuel - 1)) modules) dtb__138) ((v_dropSegs dtb__139) segs))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = segs }))
  | _ -> failwith "DT: impossible branch"
)) ((v_longestNamespaceEntry es) segs)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = segs })))))

# 199 "Vuna/Compiler/Loader/Resolve.vuna"
let v_walkNamespacePaths = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> ((((v_walkNamespacePathsFuel (1 + (B_dData_dList.v_length segs))) modules) m) segs))

# 258 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_walkNamespaceCandidates = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> ((Base_dCommon.v_bind (((v_walkNamespacePaths mc0) dtb__140) mc2)) (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((v_walkNamespaceCandidates mc0) dtb__141) mc2) (B_dData_dList.C_List__x58__x58_ (p, mc3)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolvePathPrefixesTry = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (match ((Loader_dModules.v_qualifierCandidates imports) (Base_dSource.v_joinDots ((v_takeSegs n) segs))) with
  | B_dData_dList.C_List_Nil -> ((((v_resolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__142 -> ((Base_dCommon.v_bind ((((v_walkNamespaceCandidates modules) ((B_dData_dList.v_map (v_realModuleName modules)) dtb__142)) ((v_dropSegs n) segs)) B_dData_dList.C_List_Nil)) (fun (rs : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_uniqPathResults rs) with
  | B_dData_dList.C_List_Nil -> ((((v_resolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__143 -> (Base_dDiag.C_Check_OkC (dtb__143))
)))
)))

# 231 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolvePathPrefixes = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (segs : string B_dData_dList.t_List) -> ((((v_resolvePathPrefixesTry modules) imports) segs) ((B_dData_dList.v_length segs) - 1)))

# 334 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveQualified = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ps with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (name))) name)
  | _ -> ((Base_dCommon.v_bind ((((v_entryHits v_pickValueEntries) modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match hits with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "value") ((v_memberLabel name) ps)) hits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
))))

# 578 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_pathEntryHits = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match dtb__144 with
  | { B_dData_dPair.f_Pair_first = dtb__146; B_dData_dPair.f_Pair_second = dtb__147 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dList.C_List_Nil -> (((v_pathEntryHits mc0) dtb__145) mc2)
  | B_dData_dList.C_List__x58__x58_ (dtb__148, dtb__149) -> (match dtb__149 with
  | B_dData_dList.C_List_Nil -> (if (dtb__148 = mc2) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) dtb__146)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((v_pickValueEntries es) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_pathEntryHits mc0) dtb__145) mc2)
  | dtb__150 -> ((Base_dCommon.v_bind (((v_pathEntryHits mc0) dtb__145) mc2)) (fun (hits : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = (v_exportTarget e); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) dtb__150)) hits)))))
))) else (((v_pathEntryHits mc0) dtb__145) mc2))
  | _ -> (if (dtb__148 = mc2) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) dtb__146)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportValues es) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_pathEntryHits mc0) dtb__145) mc2)
  | dtb__151 -> ((Base_dCommon.v_bind (((v_pathEntryHits mc0) dtb__145) mc2)) (fun (hits : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = (v_exportTarget e); B_dData_dPair.f_Pair_second = dtb__149 })) dtb__151)) hits)))))
))) else (((v_pathEntryHits mc0) dtb__145) mc2))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__147)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_uniqPathTargets = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (if ((v_memPathKey (v_pathKey dtb__152)) dtb__153) then (v_uniqPathTargets dtb__153) else (B_dData_dList.C_List__x58__x58_ (dtb__152, (v_uniqPathTargets dtb__153))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 626 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_allEmptyTails = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (match dtb__154 with
  | { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__157 } -> (match dtb__157 with
  | B_dData_dList.C_List_Nil -> (v_allEmptyTails dtb__155)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 633 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isEmptyPaths = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedTypeTargetOnly = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (name))) name) else ((Base_dCommon.v_bind ((((v_entryHits v_pickTypeEntries) modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match hits with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") ((v_memberLabel name) ps)) hits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))))))

# 397 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeTarget = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dIntrinsics.v_isIntrinsicTypeName name) then (Base_dDiag.C_Check_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Base_dDiag.C_Check_OkC (name)) else (if (Base_dSource.v_containsDot name) then ((((v_resolveDottedTypeTargetOnly modules) label) imports) name) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownType (name))) name)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))))))

# 432 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveFamilyQualifiedCtor = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = dtb__161 } -> ((fun famName -> ((Base_dCommon.v_bind ((((((v_resolveTypeTarget modules) label) prefix) ns) imports) famName)) (fun (famTarget : string) -> (match (((((v_ctorTargetInFamily modules) prefix) ns) famTarget) dtb__161) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> (Base_dDiag.C_Check_OkC (dtb__162))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeHasNoConstructor (famName, dtb__161))) famName) dtb__161)
  | _ -> failwith "DT: impossible branch"
)))) (Base_dSource.v_joinDots dtb__160))
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorDotted = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then ((((((v_resolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind (((v_ctorEntryHits modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_notEmptyList hits) then (((v_uniqueCtorTarget label) ((v_memberLabel name) ps)) ((B_dData_dList.v_map B_dData_dPair.v_secondOf) hits)) else ((Base_dCommon.v_bind ((((v_ctorFamilyHits modules) ps) ((v_memberLabel name) ps)) (v_lastSegmentOf name))) (fun (familyHits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match familyHits with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "constructor") (v_lastSegmentOf name)) familyHits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))))))))

# 609 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveQualifiedPath = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) (sp : Base_dSource.t_Span) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) ((v_takeSegs n) segs))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)) else ((Base_dCommon.v_bind (((v_pathEntryHits modules) ps) ((v_memberLabel "") ps))) (fun (hits : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> (match dtb__166 with
  | B_dData_dList.C_List_Nil -> (match dtb__164 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar (dtb__165, sp))))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (((v_memberLabel "") ps), (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) nd_uscrut8))))) ((v_memberLabel "") ps)) (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) nd_uscrut8)))
)
  | _ -> (match dtb__164 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb__165, sp))) dtb__166) sp)))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (((v_memberLabel "") ps), (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) nd_uscrut8))))) ((v_memberLabel "") ps)) (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) nd_uscrut8)))
)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel "") ps), ((v_firstModuleOf "") ps)))) ((v_memberLabel "") ps)) ((v_firstModuleOf "") ps))
  | _ -> failwith "DT: impossible branch"
)) (v_uniqPathTargets hits))))))))

# 693 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueOrOver = (fun (name : string) (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (match dtb__168 with
  | B_dData_dList.C_List_Nil -> dtb__167
  | _ -> ((Frontend_dAst.v_overValueName name) nd_uscrut2)
)
  | B_dData_dList.C_List_Nil -> name
  | _ -> failwith "DT: impossible branch"
)) (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) pairs))))

# 701 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickCtorOrOver = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (match dtb__170 with
  | B_dData_dList.C_List_Nil -> dtb__169
  | _ -> ((Frontend_dAst.v_overCtorName mc0) mc1)
)
  | B_dData_dList.C_List_Nil -> ((Frontend_dAst.v_overCtorName mc0) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtor = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if (Base_dSource.v_containsDot name) then ((((((v_resolveCtorDotted modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind (((((v_ctorCandidates modules) prefix) ns) imports) name)) (fun (cands : string B_dData_dList.t_List) -> (match cands with
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ns).Loader_dModules.f_Namespaces_nsCtorSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dIntrinsics.v_isIntrinsicName name) then (Base_dDiag.C_Check_OkC (name)) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtor modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage ((Base_dSource.v_suggest name) (ns).Loader_dModules.f_Namespaces_nsCtors))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownConstructor (name))) name))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) pairs)))))
)))))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) cands)))
)))))

# 732 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkBinder = (fun (label : string) (name : string) -> (if (Base_dSource.v_containsDot name) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidVariableName (name))) name) else (Base_dDiag.C_Check_OkC (name))))

# 736 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkTopName = (fun (label : string) (name : string) -> (if (name = "_") then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTopLevelName ("_"))) "_") else (if (Base_dSource.v_containsDot name) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTopLevelName (name))) name) else (Base_dDiag.C_Check_OkC (name)))))

# 742 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTopName = (fun (label : string) (prefix : string) (name : string) -> ((Base_dCommon.v_bind ((v_checkTopName label) name)) (fun (_u : string) -> (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))))))

# 746 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolvePattern = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match pat with
  | Frontend_dAst.C_Pat_PWild (dtb__171) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild (dtb__171)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PVar (dtb__172, dtb__173) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__173)) ((v_checkBinder label) dtb__172))) (fun (_u : string) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__172, dtb__173)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__172, B_dData_dList.C_List_Nil)) }))))
  | Frontend_dAst.C_Pat_PAs (dtb__174, dtb__175, dtb__176) -> ((Base_dCommon.v_bind (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__175)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__174, (B_dData_dPair.v_firstOf p), dtb__176)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__174, (B_dData_dPair.v_secondOf p))) }))))
  | Frontend_dAst.C_Pat_PInt (dtb__177, dtb__178) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__177, dtb__178)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PStr (dtb__179, dtb__180) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__179, dtb__180)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PCon (dtb__181, dtb__182, dtb__183) -> (if (Frontend_dAst.v_isTuplePairSyntax dtb__181) then (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) (Frontend_dAst.C_Pat_PCon ("Pair", dtb__182, dtb__183))) else (if (Frontend_dAst.v_isTupleUnitSyntax dtb__181) then (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) (Frontend_dAst.C_Pat_PCon ("MkUnit", B_dData_dList.C_List_Nil, dtb__183))) else (if (Frontend_dAst.v_isInternalSyntaxName dtb__181) then ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__182)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__181, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__183)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__183)) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__181))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__182)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (name2, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__183)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))))))))
  | Frontend_dAst.C_Pat_PRecord (dtb__184, dtb__185, dtb__186) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__186)) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__184))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (((((((v_resolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__185)) (fun (parts : ((string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (name2, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__186)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) }))))))
  | _ -> failwith "DT: impossible branch"
)))
# 760 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecordPatternField = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc6 with
  | { B_dData_dPair.f_Pair_first = dtb__187; B_dData_dPair.f_Pair_second = dtb__188 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__188)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__189; B_dData_dPair.f_Pair_second = dtb__190 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__187; B_dData_dPair.f_Pair_second = dtb__189 }; B_dData_dPair.f_Pair_second = dtb__190 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 794 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveLocalPats = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__191)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> ((Base_dCommon.v_bind (((((((v_resolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__192)) (fun (r : (Frontend_dAst.t_Pat B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__195; B_dData_dPair.f_Pair_second = dtb__196 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__195)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__194) dtb__196) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))
  | _ -> failwith "DT: impossible branch"
))

# 856 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_collectRecBinds = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__197, dtb__198) -> (match dtb__197 with
  | { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = dtb__200 } -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__199)) (fun (pr : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match pr with
  | { B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = dtb__202 } -> ((Base_dCommon.v_bind ((((((v_collectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__198)) (fun (r : (string B_dData_dList.t_List, (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__203; B_dData_dPair.f_Pair_second = dtb__204 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__202) dtb__203); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = dtb__200 }, dtb__204)) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 899 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_templateChunks = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__207) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_interpMethodName, (Frontend_dAst.v_exprSpan dtb__207))), (B_dData_dList.C_List__x58__x58_ (dtb__207, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_exprSpan dtb__207))), ((v_templateChunks mc0) dtb__206)))
  | Frontend_dAst.C_InterpPart_IPText (dtb__208) -> (if (dtb__208 = "") then ((v_templateChunks mc0) dtb__206) else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (dtb__208, mc0)), ((v_templateChunks mc0) dtb__206))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 906 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_concatLeft = (fun (mc0 : Base_dSource.t_Span) (mc1 : Frontend_dAst.t_Expr) (mc2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (((v_concatLeft mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", mc0)), (B_dData_dList.C_List__x58__x58_ (mc1, (B_dData_dList.C_List__x58__x58_ (dtb__209, B_dData_dList.C_List_Nil)))), mc0))) dtb__210)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 893 "Vuna/Compiler/Loader/Resolve.vuna"
let v_lowerTemplate = (fun (sp : Base_dSource.t_Span) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match ((v_templateChunks sp) parts) with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EStr ("", sp))
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (((v_concatLeft sp) dtb__211) dtb__212)
  | _ -> failwith "DT: impossible branch"
))

# 914 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkDebugConstruct = (fun (release : bool) (sp : Base_dSource.t_Span) (name : string) (resolved : string) (scope : string B_dData_dList.t_List) -> (if release then (if (Base_dIntrinsics.v_isDebugOnlyName resolved) then (if ((B_dData_dList.v_memName name) scope) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (resolved, sp)))) else (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_DebugConstructInRelease (resolved))) resolved)) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (resolved, sp))))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (resolved, sp))))))

# 929 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isParserSyntaxName = (fun (name : string) -> (if (if (if (if (if (if (if (if (name = Frontend_dAst.v_listNilSyntax) then true else (name = Frontend_dAst.v_listConsSyntax)) then true else (name = Frontend_dAst.v_performSyntax)) then true else (name = Frontend_dAst.v_handleSyntax)) then true else (name = Frontend_dAst.v_handleNoRetSyntax)) then true else (name = Frontend_dAst.v_rowAtSyntax)) then true else (name = Frontend_dAst.v_appAtSyntax)) then true else ((B_dData_dString.v_startsWith "@vuna@list@") name)) then true else ((B_dData_dString.v_startsWith "@vuna@handle@") name)))

# 948 "Vuna/Compiler/Loader/Resolve.vuna"
let v_hiddenRef = (fun (name : string) (sp : Base_dSource.t_Span) -> ((fun stripped -> (match (Base_dIntrinsics.v_findIntrinsic stripped) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (stripped, sp))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("hidden reference to unknown intrinsic " ^ stripped))
  | _ -> failwith "DT: impossible branch"
)) (((B_dData_dString.v_substring 1) (bi_natFromInt (bi_strLength name))) name)))

# 958 "Vuna/Compiler/Loader/Resolve.vuna"
let v_normalizeSyntaxNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__214, dtb__215, dtb__216) -> (match dtb__214 with
  | Frontend_dAst.C_Expr_EVar (dtb__217, dtb__218) -> (match dtb__215 with
  | B_dData_dList.C_List__x58__x58_ (dtb__219, dtb__220) -> (match dtb__220 with
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (match dtb__222 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dAst.v_isAscribeSyntax dtb__217) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EAnn (dtb__219, dtb__221, dtb__216)))) else (if (Frontend_dAst.v_isTuplePairSyntax dtb__217) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("Pair", dtb__218)), (B_dData_dList.C_List__x58__x58_ (dtb__219, (B_dData_dList.C_List__x58__x58_ (dtb__221, B_dData_dList.C_List_Nil)))), dtb__216)))) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__223, dtb__224) -> (if (Frontend_dAst.v_isTupleUnitSyntax dtb__223) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar ("MkUnit", dtb__224)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1097 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorDecl = (fun (label : string) (prefix : string) (dname : string) (ctor : string) -> ((Base_dCommon.v_bind ((v_checkTopName label) ctor)) (fun (_u : string) -> (Base_dDiag.C_Check_OkC ((((Loader_dModules.v_ctorCanonical prefix) dname) ctor))))))

# 1103 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isLowerTypeName = (fun (name : string) -> (match (B_dData_dList.dtp_unpack name) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> (Frontend_dLexer.v_isLowerChar dtb__225)
  | _ -> failwith "DT: impossible branch"
))

# 1109 "Vuna/Compiler/Loader/Resolve.vuna"
let v_startsUpperName = (fun (name : string) -> (match (B_dData_dList.dtp_unpack name) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__227, dtb__228) -> (if (dtb__227 >= 65) then (dtb__227 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1143 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorResult = (fun (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (name : string) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> (match dtb__230 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__229))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousConstructor (name, ("Data." ^ name)))) name) ("Data." ^ name))
)
  | _ -> failwith "DT: impossible branch"
)) (((v_localCtorTargets prefix) ns) name)))

# 1151 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveLowerTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else ((Base_dCommon.v_bind ((((v_localCtorResult label) prefix) ns) name)) (fun (mc : string B_dData_dMaybe.t_Maybe) -> (match mc with
  | B_dData_dMaybe.C_Maybe_Just (dtb__231) -> (Base_dDiag.C_Check_OkC (dtb__231))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValue modules) imports) name)) (fun (vp : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match vp with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtor modules) imports) name)) (fun (cp : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match cp with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (tp : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match tp with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (name))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) tp)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) cp)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) vp)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1207 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then ((((((v_resolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind ((((v_entryHits v_pickTypeEntries) modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match hits with
  | B_dData_dList.C_List_Nil -> (match ((((((v_resolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Base_dDiag.C_Check_OkC (dtb__232) -> (Base_dDiag.C_Check_OkC (dtb__232))
  | Base_dDiag.C_Check_ErrC (dtb__233) -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") ((v_memberLabel name) ps)) hits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))))))

# 1182 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveNonLowerTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind ((((v_localCtorResult label) prefix) ns) name)) (fun (mc : string B_dData_dMaybe.t_Maybe) -> (match mc with
  | B_dData_dMaybe.C_Maybe_Just (dtb__234) -> (Base_dDiag.C_Check_OkC (dtb__234))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot name) then ((((((v_resolveDottedTypeName modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (match ((((((v_resolveCtor modules) label) prefix) ns) imports) name) with
  | Base_dDiag.C_Check_OkC (dtb__235) -> (Base_dDiag.C_Check_OkC (dtb__235))
  | Base_dDiag.C_Check_ErrC (dtb__236) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (Base_dDiag.C_Check_ErrC (dtb__236)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))
  | _ -> failwith "DT: impossible branch"
))))

# 1128 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dIntrinsics.v_isIntrinsicTypeName name) then (Base_dDiag.C_Check_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Base_dDiag.C_Check_OkC (name)) else (if (v_isLowerTypeName name) then ((((((v_resolveLowerTypeName modules) label) prefix) ns) imports) name) else ((((((v_resolveNonLowerTypeName modules) label) prefix) ns) imports) name))))))

# 1238 "Vuna/Compiler/Loader/Resolve.vuna"
let v_constraintHeadOf = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__237, dtb__238) -> (B_dData_dMaybe.C_Maybe_Just (dtb__237))
  | Frontend_dAst.C_Expr_EApp (dtb__239, dtb__240, dtb__241) -> (match dtb__239 with
  | Frontend_dAst.C_Expr_EVar (dtb__242, dtb__243) -> (B_dData_dMaybe.C_Maybe_Just (dtb__242))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1250 "Vuna/Compiler/Loader/Resolve.vuna"
let v_normalizeTypeSyntaxNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__244, dtb__245, dtb__246) -> (match dtb__244 with
  | Frontend_dAst.C_Expr_EVar (dtb__247, dtb__248) -> (if (Frontend_dAst.v_isTuplePairSyntax dtb__247) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("Pair", dtb__248)), dtb__245, dtb__246)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__249, dtb__250) -> (if (Frontend_dAst.v_isTupleUnitSyntax dtb__249) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar ("Unit", dtb__250)))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1284 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeTopName = (fun (label : string) (prefix : string) (name : string) -> ((Base_dCommon.v_bind ((v_checkTopName label) name)) (fun (_u : string) -> (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))))))

# 1392 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isLowerIdent = (fun (n : string) -> (match (B_dData_dList.dtp_unpack n) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (if (dtb__251 >= 97) then (dtb__251 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1387 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_exprLowerNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__253, dtb__254, dtb__255) -> ((B_dData_dList.v_append (v_exprLowerNames dtb__253)) ((B_dData_dList.v_concatMap v_exprLowerNames) dtb__254))
  | Frontend_dAst.C_Expr_EVar (dtb__256, dtb__257) -> (if (v_isLowerIdent dtb__256) then (B_dData_dList.C_List__x58__x58_ (dtb__256, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 1398 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_scopeNamesOf = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259) -> (match dtb__258 with
  | { B_dData_dPair.f_Pair_first = dtb__260; B_dData_dPair.f_Pair_second = dtb__261 } -> (if (dtb__260 = mc0) then dtb__261 else ((v_scopeNamesOf mc0) dtb__259))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1422 "Vuna/Compiler/Loader/Resolve.vuna"
let v_tyShape = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EDo (dtb__262, dtb__263) -> "do"
  | Frontend_dAst.C_Expr_EIf (dtb__264, dtb__265, dtb__266, dtb__267) -> "if"
  | Frontend_dAst.C_Expr_ECase (dtb__268, dtb__269, dtb__270) -> "case"
  | Frontend_dAst.C_Expr_ELet (dtb__271, dtb__272, dtb__273, dtb__274) -> "let"
  | Frontend_dAst.C_Expr_ELam (dtb__275, dtb__276, dtb__277) -> "lam"
  | Frontend_dAst.C_Expr_EFloat (dtb__278, dtb__279) -> "float"
  | Frontend_dAst.C_Expr_EStr (dtb__280, dtb__281) -> "str"
  | Frontend_dAst.C_Expr_EInt (dtb__282, dtb__283) -> "int"
  | Frontend_dAst.C_Expr_EApp (dtb__284, dtb__285, dtb__286) -> "app"
  | Frontend_dAst.C_Expr_EVar (dtb__287, dtb__288) -> ("var " ^ dtb__287)
  | _ -> "other"
))

# 1257 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveTypeExprScoped = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (bound : string B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match (v_normalizeTypeSyntaxNames ty) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__289) -> ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__289)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_resolveTypeExprScopedRaw fuel) modules) label) prefix) ns) imports) bound) ty)
  | _ -> failwith "DT: impossible branch"
)))
# 1266 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveTypeExprScopedRaw = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (bound : string B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Frontend_dAst.C_Expr_EPi (dtb__290, dtb__291, dtb__292, dtb__293, dtb__294, dtb__295) -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__293)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) (B_dData_dList.C_List__x58__x58_ (dtb__290, bound))) dtb__294)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__290, dtb__291, dtb__292, dom2, cod2, dtb__295))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__296, dtb__297, dtb__298) -> (match dtb__296 with
  | Frontend_dAst.C_Expr_EVar (dtb__299, dtb__300) -> (if (dtb__299 = "Type") then (Base_dDiag.C_Check_OkC (ty)) else ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__296)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__297)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__298)))))))))
  | _ -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__296)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__297)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__298))))))))
)
  | Frontend_dAst.C_Expr_EVar (dtb__301, dtb__302) -> (if ((B_dData_dList.v_memName dtb__301) bound) then (Base_dDiag.C_Check_OkC (ty)) else (if (Frontend_dAst.v_isMacroSyntaxName dtb__301) then (Base_dDiag.v_icInternal ("unexpanded macro invocation " ^ dtb__301)) else (if (Frontend_dAst.v_isInternalSyntaxName dtb__301) then (Base_dDiag.C_Check_OkC (ty)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__302)) ((((((v_resolveTypeName modules) label) prefix) ns) imports) dtb__301))) (fun (n : string) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (n, dtb__302)))))))))
  | Frontend_dAst.C_Expr_EStr (dtb__303, dtb__304) -> (Base_dDiag.C_Check_OkC (ty))
  | Frontend_dAst.C_Expr_EInt (dtb__305, dtb__306) -> (Base_dDiag.C_Check_OkC (ty))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan ty))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTypeExpression ((v_tyShape ty)))) (v_tyShape ty)))
)) ty)))

# 1243 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeExpr = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped fuel) modules) label) prefix) ns) imports) B_dData_dList.C_List_Nil) ty))

# 1229 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveConstraintExpr = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (cx : Frontend_dAst.t_Expr) -> (match (v_constraintHeadOf cx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__307) -> (match ((((((v_resolveTypeName modules) label) prefix) ns) imports) dtb__307) with
  | Base_dDiag.C_Check_ErrC (dtb__308) -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan cx))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownInterface (dtb__307))) dtb__307))
  | Base_dDiag.C_Check_OkC (dtb__309) -> (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

# 1289 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorSpec = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : string) (mc6 : Frontend_dAst.t_Ctor) -> (match mc6 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__310; Frontend_dAst.f_Ctor_ctorType = dtb__311; Frontend_dAst.f_Ctor_ctorArity = dtb__312; Frontend_dAst.f_Ctor_ctorSpan = dtb__313 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__313)) ((((v_resolveCtorDecl mc1) mc2) mc5) dtb__310))) (fun (c2 : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__311)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = c2; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__312; Frontend_dAst.f_Ctor_ctorSpan = dtb__313 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1332 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveRecordField = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Field) -> (match mc5 with
  | { Frontend_dAst.f_Field_fieldName = dtb__314; Frontend_dAst.f_Field_fieldType = dtb__315; Frontend_dAst.f_Field_fieldSpan = dtb__316 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__316)) ((v_checkBinder mc1) dtb__314))) (fun (_u : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__315)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__314; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldSpan = dtb__316 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1338 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTraitMethod = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_TraitMethod) -> (match mc5 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__317; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__318; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__319 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__319)) (((v_resolveTopName mc1) mc2) dtb__317))) (fun (n : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__318)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = n; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__319 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1438 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorPairTargets = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__320, dtb__321) -> (match dtb__320 with
  | { B_dData_dPair.f_Pair_first = dtb__322; B_dData_dPair.f_Pair_second = dtb__323 } -> ((fun isCtor -> (if isCtor then (B_dData_dList.C_List__x58__x58_ ((dtb__323).Loader_dModules.f_ExportEntry_target, ((v_ctorPairTargets mc0) dtb__321))) else ((v_ctorPairTargets mc0) dtb__321))) (if ((dtb__323).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((Loader_dModules.v_isDataOrRecordCtorTarget mc0) (dtb__323).Loader_dModules.f_ExportEntry_target)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveGlobal = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (name : string) -> (if ((B_dData_dList.v_memName name) scope) then (Base_dDiag.C_Check_OkC (name)) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (match (((v_localCtorTargets prefix) ns) name) with
  | B_dData_dList.C_List__x58__x58_ (dtb__324, dtb__325) -> ((Base_dCommon.v_bind (((((v_ctorCandidates modules) prefix) ns) imports) name)) (fun (cands : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) cands)))))
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ns).Loader_dModules.f_Namespaces_nsCtorSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dSource.v_containsDot name) then ((((v_resolveQualified modules) label) imports) name) else (if (v_isBuiltinName name) then (Base_dDiag.C_Check_OkC (name)) else (if (v_isDtPreludeName name) then (Base_dDiag.C_Check_OkC (name)) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValue modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_ctorCandidates modules) prefix) ns) imports) name)) (fun (cands : string B_dData_dList.t_List) -> (match cands with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtor modules) imports) name)) (fun (cpairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match cpairs with
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (tpairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match tpairs with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage ((Base_dSource.v_suggest name) ((B_dData_dList.v_append (ns).Loader_dModules.f_Namespaces_nsValues) ((B_dData_dList.v_append (ns).Loader_dModules.f_Namespaces_nsCtors) ((B_dData_dList.v_append (ns).Loader_dModules.f_Namespaces_nsTypes) scope)))))) ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage (v_traitImportHint name))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownVariable (name))) name)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) tpairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) cpairs)))))
)))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) cands)))
)))
  | _ -> (match ((v_ctorPairTargets modules) pairs) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (((v_pickValueOrOver name) pairs)))
  | dtb__326 -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) (B_dData_dList.v_nubNames dtb__326))))
)
)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 541 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedExpr = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (name : string) (sp : Base_dSource.t_Span) -> (match (Base_dSource.v_splitOnDot name) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "empty dotted name")
  | B_dData_dList.C_List__x58__x58_ (dtb__327, dtb__328) -> (if ((B_dData_dList.v_memName dtb__327) scope) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb__327, sp))) dtb__328) sp))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((((((v_resolveQualifiedPath modules) label) imports) (Base_dSource.v_splitOnDot name)) (B_dData_dList.v_length (Base_dSource.v_splitOnDot name))) sp))) (fun (q : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) -> (match q with
  | B_dData_dMaybe.C_Maybe_Just (dtb__329) -> (Base_dDiag.C_Check_OkC (dtb__329))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__327) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (((Loader_dModules.v_mangle prefix) dtb__327), sp))) dtb__328) sp))) else (if (v_isBuiltinName dtb__327) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb__327, sp))) dtb__328) sp))) else (if (v_startsUpperName dtb__327) then (match ((((((v_resolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Base_dDiag.C_Check_OkC (dtb__330) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__330, sp))))
  | Base_dDiag.C_Check_ErrC (dtb__331) -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (dtb__327))) dtb__327))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan sp)) (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) dtb__327))) (fun (n : string) -> (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (n, sp))) dtb__328) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 1058 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDoBind = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) -> (match (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) ">>=") with
  | Base_dDiag.C_Check_OkC (dtb__332) -> (Base_dDiag.C_Check_OkC (dtb__332))
  | Base_dDiag.C_Check_ErrC (dtb__333) -> (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) "bind")
  | _ -> failwith "DT: impossible branch"
))

# 771 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveAlt = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc7 with
  | { B_dData_dPair.f_Pair_first = dtb__334; B_dData_dPair.f_Pair_second = dtb__335 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__334)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = dtb__337 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((B_dData_dList.v_append dtb__337) mc6)) dtb__335)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
# 783 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLocalClause = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc7 with
  | { B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = dtb__339 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__338)) (fun (p : (Frontend_dAst.t_Pat B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__340; B_dData_dPair.f_Pair_second = dtb__341 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((B_dData_dList.v_append dtb__341) mc6)) dtb__339)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__340; B_dData_dPair.f_Pair_second = body2 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
# 812 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLet = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (rec_u : bool) (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (if rec_u then (((((((((v_resolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_resolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
# 821 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLetSeq = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__342, dtb__343) -> (match dtb__342 with
  | { B_dData_dPair.f_Pair_first = dtb__344; B_dData_dPair.f_Pair_second = dtb__345 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__345)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__344)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__346; B_dData_dPair.f_Pair_second = dtb__347 } -> ((Base_dCommon.v_bind (((((((((v_resolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__347) scope)) dtb__343) body)) (fun (r : ((Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__348; B_dData_dPair.f_Pair_second = dtb__349 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__346; B_dData_dPair.f_Pair_second = value2 }, dtb__348)); B_dData_dPair.f_Pair_second = dtb__349 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = b }))))
  | _ -> failwith "DT: impossible branch"
)) binds)))
# 844 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecLet = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binds : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__350) -> (match dtb__350 with
  | { B_dData_dPair.f_Pair_first = dtb__351; B_dData_dPair.f_Pair_second = dtb__352 } -> ((fun scope2 -> ((Base_dCommon.v_bind ((((((((v_resolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__352)) (fun (values2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = values2; B_dData_dPair.f_Pair_second = b }))))))) ((B_dData_dList.v_append dtb__351) scope))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__353) -> (Base_dDiag.C_Check_ErrC (dtb__353))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_collectRecBinds modules) label) prefix) ns) imports) binds))))
# 872 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecValues = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__354, dtb__355) -> (match dtb__354 with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__357)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__355)) (fun (tail : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = value2 }, tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 967 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveExpr = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match (v_normalizeSyntaxNames expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__358) -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__358)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_resolveExprRaw fuel) modules) label) prefix) ns) imports) scope) expr)
  | _ -> failwith "DT: impossible branch"
)))
# 976 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveExprRaw = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match expr with
  | Frontend_dAst.C_Expr_EVar (dtb__359, dtb__360) -> (if (Frontend_dAst.v_isHoleName dtb__359) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__359, dtb__360)))) else (if (if ((B_dData_dString.v_startsWith "!") dtb__359) then ((bi_strLength dtb__359) > 1) else false) then ((v_hiddenRef dtb__359) dtb__360) else (if (Frontend_dAst.v_isMacroSyntaxName dtb__359) then (Base_dDiag.v_icInternal ("unexpanded macro invocation " ^ dtb__359)) else (if (Frontend_dAst.v_isInternalSyntaxName dtb__359) then (if (if (v_isParserSyntaxName dtb__359) then true else (Frontend_dRast_dName.v_isCompilerModulePrefix prefix)) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__359, dtb__360)))) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__360)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownVariable (dtb__359))) dtb__359))) else (if (Base_dSource.v_containsDot dtb__359) then ((((((((v_resolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__359) dtb__360) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__360)) (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) dtb__359))) (fun (n : string) -> (((((v_checkDebugConstruct (ns).Loader_dModules.f_Namespaces_nsRelease) dtb__360) dtb__359) n) scope))))))))
  | Frontend_dAst.C_Expr_EInfix (dtb__361, dtb__362, dtb__363, dtb__364) -> (Base_dDiag.v_icInternal ("unreordered infix operator " ^ dtb__361))
  | Frontend_dAst.C_Expr_EBacktick (dtb__365, dtb__366, dtb__367, dtb__368) -> (Base_dDiag.v_icInternal ("unreordered backtick infix operator " ^ dtb__365))
  | Frontend_dAst.C_Expr_ESectOp (dtb__369, dtb__370) -> (Base_dDiag.v_icInternal (String.concat "" ["unreordered operator section ("; dtb__369; ")"]))
  | Frontend_dAst.C_Expr_ESectL (dtb__371, dtb__372, dtb__373) -> (Base_dDiag.v_icInternal (String.concat "" ["unreordered left operator section ("; dtb__371; ")"]))
  | Frontend_dAst.C_Expr_ESectR (dtb__374, dtb__375, dtb__376) -> (Base_dDiag.v_icInternal (String.concat "" ["unreordered right operator section ("; dtb__375; ")"]))
  | Frontend_dAst.C_Expr_EParen (dtb__377, dtb__378) -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__377)
  | Frontend_dAst.C_Expr_EInt (dtb__379, dtb__380) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb__379, dtb__380))))
  | Frontend_dAst.C_Expr_EStr (dtb__381, dtb__382) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb__381, dtb__382))))
  | Frontend_dAst.C_Expr_EFloat (dtb__383, dtb__384) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb__383, dtb__384))))
  | Frontend_dAst.C_Expr_EInterp (dtb__385, dtb__386, dtb__387) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__386)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_lowerTemplate dtb__387) ps)))))
  | Frontend_dAst.C_Expr_ELam (dtb__388, dtb__389, dtb__390) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__390)) ((Base_dCommon.v_traverse (v_checkBinder label)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__388)))) (fun (_u : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__388)) scope)) dtb__389)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__388, b, dtb__390))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__391, dtb__392, dtb__393) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__391)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__392)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__393))))))))
  | Frontend_dAst.C_Expr_EPi (dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__397)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb__394, B_dData_dList.C_List_Nil))) scope)) dtb__398)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__394, dtb__395, dtb__396, dom2, cod2, dtb__399))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__400, dtb__401, dtb__402, dtb__403) -> ((Base_dCommon.v_bind ((((((((((v_resolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__402) dtb__400) dtb__401)) (fun (r : ((Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__404; B_dData_dPair.f_Pair_second = dtb__405 } -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb__404, dtb__405, dtb__402, dtb__403))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__406, dtb__407) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveLocalClause (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__406)) (fun (clauses2 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELocalFun (clauses2, dtb__407))))))
  | Frontend_dAst.C_Expr_ECase (dtb__408, dtb__409, dtb__410) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__408)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__409)) (fun (alts2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__410))))))))
  | Frontend_dAst.C_Expr_EIf (dtb__411, dtb__412, dtb__413, dtb__414) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__411)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__412)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__413)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, e2, dtb__414))))))))))
  | Frontend_dAst.C_Expr_EField (dtb__415, dtb__416, dtb__417) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__415)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (b, dtb__416, dtb__417))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__418, dtb__419, dtb__420) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__420)) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__418))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__419)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (name2, fs, dtb__420))))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__421, dtb__422, dtb__423) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__421)) (fun (b : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__422)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (b, fs, dtb__423))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__424, dtb__425) -> (((((((((v_resolveDo (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__424) dtb__425)
  | Frontend_dAst.C_Expr_EAnn (dtb__426, dtb__427, dtb__428) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__426)) (fun (v2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__427)) (fun (t2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EAnn (v2, t2, dtb__428))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 1026 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveInterpParts = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__429, dtb__430) -> (match dtb__429 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__431) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__431)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__430)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e2)), ps))))))))
  | Frontend_dAst.C_InterpPart_IPText (dtb__432) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__430)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__432)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)) parts)))
# 1045 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDo = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (blockSpan : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__433, dtb__434) -> (match dtb__433 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__435, dtb__436) -> (match dtb__434 with
  | B_dData_dList.C_List_Nil -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__435)
  | _ -> ((Base_dCommon.v_bind ((((((v_resolveDoBind modules) label) prefix) ns) imports) scope)) (fun (bindName : string) -> ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | _ -> ((Base_dCommon.v_bind ((((((v_resolveDoBind modules) label) prefix) ns) imports) scope)) (fun (bindName : string) -> ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At blockSpan) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
# 1074 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDoChain = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (bindName : string) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (blockSpan : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__437, dtb__438) -> (match dtb__437 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__439, dtb__440, dtb__441) -> (match dtb__439 with
  | Frontend_dAst.C_Pat_PWild (dtb__442) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__440)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__438) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dAst.v_doIgnoreSyntaxName bindName), dtb__441)), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), tail, dtb__441)), B_dData_dList.C_List_Nil)))), dtb__441))))))))
  | Frontend_dAst.C_Pat_PVar (dtb__443, dtb__444) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__440)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) (B_dData_dList.C_List__x58__x58_ (dtb__443, scope))) bindName) dtb__438) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dAst.v_doBindSyntaxName bindName), dtb__441)), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__443; B_dData_dPair.f_Pair_second = ((Base_dSource.v_spanAtName dtb__443) dtb__444) }, B_dData_dList.C_List_Nil)), tail, dtb__441)), B_dData_dList.C_List_Nil)))), dtb__441))))))))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At dtb__441) Base_dDiagnostics_dFrontend.C_PsDiag_DoBindPattern)
)
  | Frontend_dAst.C_DoStmt_DExpr (dtb__445, dtb__446) -> (match dtb__438 with
  | B_dData_dList.C_List_Nil -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__445)
  | _ -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__445)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__438) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dAst.v_doIgnoreSyntaxName bindName), dtb__446)), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), tail, dtb__446)), B_dData_dList.C_List_Nil)))), dtb__446))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At blockSpan) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
)) stmts)))
# 1087 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveFieldValue = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc7 with
  | { B_dData_dPair.f_Pair_first = dtb__447; B_dData_dPair.f_Pair_second = dtb__448 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__448)) (fun (v : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__447; B_dData_dPair.f_Pair_second = v })))))
  | _ -> failwith "DT: impossible branch"
))

# 1344 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveInstanceMethod = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Decl) -> (match mc5 with
  | Frontend_dAst.C_Decl_DFun (dtb__449, dtb__450, dtb__451, dtb__452) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__452)) ((v_checkTopName mc1) dtb__449))) (fun (_u : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__450)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts)) dtb__451)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__449, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), b, dtb__452))))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__453, dtb__454, dtb__455, dtb__456) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__456)) ((v_checkTopName mc1) dtb__453))) (fun (_u : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__454)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__455)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__453, ctx2, ty2, dtb__456))))))))))
  | _ -> (Base_dDiag.v_icInternal "unexpected instance body declaration")
))

# 1295 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDecl = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (d : Frontend_dAst.t_Decl) -> (match d with
  | Frontend_dAst.C_Decl_DData (dtb__457, dtb__458, dtb__459, dtb__460, dtb__461, dtb__462, dtb__463, dtb__464, dtb__465) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__465)) (((v_resolveTypeTopName label) prefix) dtb__457))) (fun (dn : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__459)) (fun (kind2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolveCtorSpec modules) label) prefix) ns) imports) dtb__457)) dtb__460)) (fun (ctors2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveTypeName modules) label) prefix) ns) imports)) dtb__461)) (fun (ds2 : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dn, dtb__458, kind2, ctors2, ds2, dtb__462, dtb__463, dtb__464, dtb__465))))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__473)) (((v_resolveTypeTopName label) prefix) dtb__466))) (fun (dn : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveRecordField modules) label) prefix) ns) imports)) dtb__468)) (fun (fields2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveTypeName modules) label) prefix) ns) imports)) dtb__469)) (fun (ds2 : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dn, dtb__467, fields2, ds2, dtb__470, dtb__471, dtb__472, dtb__473))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__474, dtb__475, dtb__476, dtb__477, dtb__478) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__478)) (((v_resolveTypeTopName label) prefix) dtb__474))) (fun (tn : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__476)) (fun (ss : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveTraitMethod modules) label) prefix) ns) imports)) dtb__477)) (fun (ms : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (tn, dtb__475, ss, ms, dtb__478))))))))))
  | Frontend_dAst.C_Decl_DInstance (dtb__479, dtb__480, dtb__481, dtb__482) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__479)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__480)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveInstanceMethod modules) label) prefix) ns) imports)) dtb__481)) (fun (ms : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, ms, dtb__482))))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__483, dtb__484, dtb__485, dtb__486) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__486)) (((v_resolveTopName label) prefix) dtb__483))) (fun (n : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__484)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__485)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (n, ctx2, ty2, dtb__486))))))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__487, dtb__488, dtb__489) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__489)) (((v_resolveTopName label) prefix) dtb__487))) (fun (n : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__488)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (n, ty2, dtb__489))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__490, dtb__491, dtb__492, dtb__493) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__493)) (((v_resolveTopName label) prefix) dtb__490))) (fun (n : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__492)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (n, dtb__491, ty2, dtb__493))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__494, dtb__495, dtb__496, dtb__497) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__497)) (((v_resolveTopName label) prefix) dtb__494))) (fun (n : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports)) dtb__495)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) modules) label) prefix) ns) imports) ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts)) dtb__496)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (n, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), b, dtb__497))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1402 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDeclWithImplicitScopes = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Decl) -> (match mc6 with
  | Frontend_dAst.C_Decl_DFun (dtb__498, dtb__499, dtb__500, dtb__501) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__501)) (((v_resolveTopName mc2) mc3) dtb__498))) (fun (n : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) mc1) mc2) mc3) mc4) mc5)) dtb__499)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) mc1) mc2) mc3) mc4) mc5) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts)) ((v_scopeNamesOf dtb__498) mc0))) dtb__500)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (n, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), b, dtb__501))))))))))
  | _ -> ((((((v_resolveDecl mc1) mc2) mc3) mc4) mc5) mc6)
))

# 1445 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isStringDomainExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__502, dtb__503) -> (if (dtb__502 = "String") then true else (if (dtb__502 = "Base.Data.String.String") then true else false))
  | _ -> false
))

# 1380 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_leadingImplicitNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__504, dtb__505, dtb__506, dtb__507, dtb__508, dtb__509) -> (if dtb__505 then (if (dtb__504 = "_") then (v_leadingImplicitNames dtb__508) else (if (v_isStringDomainExpr dtb__507) then (B_dData_dList.C_List__x58__x58_ (dtb__504, (v_leadingImplicitNames dtb__508))) else (v_leadingImplicitNames dtb__508))) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 1368 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_implicitScopeTable = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__510, dtb__511) -> (match dtb__510 with
  | Frontend_dAst.C_Decl_DSig (dtb__512, dtb__513, dtb__514, dtb__515) -> ((fun names -> (match names with
  | B_dData_dList.C_List_Nil -> (v_implicitScopeTable dtb__511)
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__512; B_dData_dPair.f_Pair_second = names }, (v_implicitScopeTable dtb__511)))
)) (B_dData_dList.v_nubNames ((B_dData_dList.v_append (v_leadingImplicitNames dtb__514)) ((B_dData_dList.v_concatMap v_exprLowerNames) dtb__513))))
  | _ -> (v_implicitScopeTable dtb__511)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1356 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveProgram = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((fun implicitScopes -> ((Base_dCommon.v_traverse ((((((v_resolveDeclWithImplicitScopes implicitScopes) modules) label) prefix) ns) imports)) decls)) (v_implicitScopeTable decls)))

# 1411 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveEntry = (fun (release : bool) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryPkg : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((((v_resolveProgram modules) "<entry>") "") ((v_namespacesOfWith release) decls)) imports) decls))

# 1415 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveModules = (fun (mc0 : bool) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__516, dtb__517) -> (match dtb__516 with
  | { Loader_dModules.f_Module_moduleNameOf = dtb__518; Loader_dModules.f_Module_modulePackageOf = dtb__519; Loader_dModules.f_Module_moduleImportsOf = dtb__520; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__521; Loader_dModules.f_Module_moduleDeclsOf = dtb__522; Loader_dModules.f_Module_moduleExportsOf = dtb__523; Loader_dModules.f_Module_moduleFixitiesOf = dtb__524; Loader_dModules.f_Module_moduleReexportsOf = dtb__525; Loader_dModules.f_Module_moduleOpaqueOf = dtb__526; Loader_dModules.f_Module_moduleExportIndexOf = dtb__527 } -> ((Base_dCommon.v_bind ((((((v_resolveProgram mc1) dtb__518) dtb__518) ((v_namespacesOfWith mc0) dtb__522)) ((B_dData_dList.v_append dtb__520) dtb__521)) dtb__522)) (fun (d1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_resolveModules mc0) dtb__517)) (fun (d2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
