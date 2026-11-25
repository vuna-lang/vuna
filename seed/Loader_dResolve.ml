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
let v_namespacesOfWith = (fun (release : bool) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let vals = (v_valueNamesOf decls) in (let cts = (Frontend_dAst.v_ctorsOf decls) in (let tys = (Frontend_dAst.v_typeNamesOf decls) in (let cands = (v_ctorCandsOf decls) in { Loader_dModules.f_Namespaces_nsValues = vals; Loader_dModules.f_Namespaces_nsCtors = cts; Loader_dModules.f_Namespaces_nsTypes = tys; Loader_dModules.f_Namespaces_nsValueSet = (B_dContainer_dHashMap.v_ofNames vals); Loader_dModules.f_Namespaces_nsCtorSet = (B_dContainer_dHashMap.v_ofNames cts); Loader_dModules.f_Namespaces_nsTypeSet = (B_dContainer_dHashMap.v_ofNames tys); Loader_dModules.f_Namespaces_nsCtorCands = cands; Loader_dModules.f_Namespaces_nsModuleTbl = (Loader_dModules.v_moduleTblOf modules); Loader_dModules.f_Namespaces_nsRelease = release })))))

# 147 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorTargets = (fun (prefix : string) (ns : Loader_dModules.t_Namespaces) (name : string) -> ((B_dData_dList.v_map (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((Loader_dModules.v_mangle prefix) (B_dData_dPair.v_secondOf p)))) ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_firstOf p) = name))) (ns).Loader_dModules.f_Namespaces_nsCtorCands)))

# 152 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorTarget = (fun (prefix : string) (ns : Loader_dModules.t_Namespaces) (name : string) -> (let nd_uscrut3 = (((v_localCtorTargets prefix) ns) name) in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__40))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 163 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pairExportTarget = (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target)

# 167 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pairIsDataCtor = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> ((Loader_dModules.v_isDataOrRecordCtorTarget modules) (v_pairExportTarget p)))

# 171 "Vuna/Compiler/Loader/Resolve.vuna"
let v_importedCtorTargets = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (tbl : (string, Loader_dModules.t_Module) B_dContainer_dHashMap.t_HashMap) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn tbl) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) ((B_dData_dList.v_filter (v_pairIsDataCtor modules)) pairs))))))))

# 190 "Vuna/Compiler/Loader/Resolve.vuna"
let v_notEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorCandidates = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind ((((v_importedCtorTargets modules) (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (imp : string B_dData_dList.t_List) -> (let local = (((v_localCtorTargets prefix) ns) name) in (if (if (if (if (v_notEmptyList local) then (name <> "Nil") else false) then (name <> "Cons") else false) then (name <> "::") else false) then (Base_dDiag.C_Check_OkC (local)) else (Base_dDiag.C_Check_OkC ((B_dData_dList.v_nubNames ((B_dData_dList.v_append local) imp)))))))))

# 234 "Vuna/Compiler/Loader/Resolve.vuna"
let v_realModuleName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (name : string) -> (match ((Loader_dModules.v_resolveModuleName modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__44) -> dtb__44
  | B_dData_dMaybe.C_Maybe_Nothing -> name
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pathKey = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__46 } -> (String.concat "" [dtb__45; "|"; (Base_dSource.v_joinDots dtb__46)])
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_memPathKey = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (if ((v_pathKey dtb__47) = mc0) then true else ((v_memPathKey mc0) dtb__48))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_uniqPathResults = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (if ((v_memPathKey (v_pathKey dtb__49)) dtb__50) then (v_uniqPathResults dtb__50) else (B_dData_dList.C_List__x58__x58_ (dtb__49, (v_uniqPathResults dtb__50))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_commaJoin = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (match dtb__52 with
  | B_dData_dList.C_List_Nil -> dtb__51
  | _ -> (String.concat "" [dtb__51; ", "; (v_commaJoin dtb__52)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Loader/Resolve.vuna"
let v_lastSegmentOf = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> dtb__54
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Loader/Resolve.vuna"
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

# 292 "Vuna/Compiler/Loader/Resolve.vuna"
let v_firstModuleOf = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match dtb__61 with
  | { B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = dtb__64 } -> dtb__63
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_entryHits = (fun (mc0 : (Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (string) -> Loader_dModules.t_ExportEntry B_dData_dList.t_List) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : string) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__68 } -> (let nd_uscrut11 = dtb__68 in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match dtb__70 with
  | B_dData_dList.C_List_Nil -> (if (dtb__69 = mc3) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc1) dtb__67)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((mc0 es) mc3) with
  | B_dData_dList.C_List_Nil -> ((((v_entryHits mc0) mc1) dtb__66) mc3)
  | dtb__71 -> ((Base_dCommon.v_bind ((((v_entryHits mc0) mc1) dtb__66) mc3)) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = e })) dtb__71)) hits)))))
))) else ((((v_entryHits mc0) mc1) dtb__66) mc3))
  | _ -> ((((v_entryHits mc0) mc1) dtb__66) mc3)
)
  | _ -> ((((v_entryHits mc0) mc1) dtb__66) mc3)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueEntry = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (base : string) -> (match ((Loader_dModules.v_findExportValue es) base) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (B_dData_dMaybe.C_Maybe_Just (dtb__72))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Loader_dModules.v_findExportType es) base)
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueEntries = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (base : string) -> (match ((Loader_dModules.v_findExportValues es) base) with
  | B_dData_dList.C_List_Nil -> ((Loader_dModules.v_findExportTypes es) base)
  | dtb__73 -> dtb__73
))

# 325 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickTypeEntries = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (base : string) -> (match ((Loader_dModules.v_findExportTypes es) base) with
  | B_dData_dList.C_List_Nil -> ((Loader_dModules.v_findExportValues es) base)
  | dtb__74 -> dtb__74
))

# 366 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_anyCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (if ((Frontend_dAst.v_ctorName dtb__75) = mc0) then true else ((v_anyCtorNamed mc0) dtb__76))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorTargetInDecls = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (match dtb__77 with
  | Frontend_dAst.C_Decl_DData (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> (if (((Loader_dModules.v_mangle mc0) dtb__79) = mc1) then (if ((v_anyCtorNamed mc2) dtb__82) then (B_dData_dMaybe.C_Maybe_Just ((((Loader_dModules.v_ctorCanonical mc0) dtb__79) mc2))) else B_dData_dMaybe.C_Maybe_Nothing) else ((((v_ctorTargetInDecls mc0) mc1) mc2) dtb__78))
  | Frontend_dAst.C_Decl_DRecord (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if (if (((Loader_dModules.v_mangle mc0) dtb__88) = mc1) then (dtb__88 = mc2) else false) then (B_dData_dMaybe.C_Maybe_Just (((Loader_dModules.v_mangle mc0) dtb__88))) else ((((v_ctorTargetInDecls mc0) mc1) mc2) dtb__78))
  | _ -> ((((v_ctorTargetInDecls mc0) mc1) mc2) dtb__78)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_findFamilyCtorInModules = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match ((((v_ctorTargetInDecls (Loader_dModules.v_moduleNameOf dtb__96)) mc1) mc2) (Loader_dModules.v_moduleDeclsOf dtb__96)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (B_dData_dMaybe.C_Maybe_Just (dtb__98))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_findFamilyCtorInModules dtb__97) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorRelFamily = (fun (prefix : string) (rel : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot rel)) with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> ((Loader_dModules.v_mangle prefix) (Base_dSource.v_joinDots dtb__99))
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorTargetInFamily = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (ns : Loader_dModules.t_Namespaces) (famTarget : string) (base : string) -> (let nd_uscrut5 = ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> (if ((B_dData_dPair.v_firstOf p) = base) then (((v_ctorRelFamily prefix) (B_dData_dPair.v_secondOf p)) = famTarget) else false))) (ns).Loader_dModules.f_Namespaces_nsCtorCands) in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> (match dtb__101 with
  | { B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = dtb__104 } -> (match dtb__102 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (((Loader_dModules.v_mangle prefix) dtb__104)))
  | _ -> (((v_findFamilyCtorInModules modules) famTarget) base)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_findFamilyCtorInModules modules) famTarget) base)
)))

# 446 "Vuna/Compiler/Loader/Resolve.vuna"
let v_exportTarget = (fun (e : Loader_dModules.t_ExportEntry) -> (e).Loader_dModules.f_ExportEntry_target)

# 464 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_allEq = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (if (mc0 = dtb__105) then ((v_allEq mc0) dtb__106) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Loader/Resolve.vuna"
let v_allSameTarget = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> ((v_allEq dtb__107) dtb__108)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Loader/Resolve.vuna"
let v_uniqueCtorTarget = (fun (mc0 : string) (mc1 : string) (mc2 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (if (v_allSameTarget ((B_dData_dList.v_map v_exportTarget) (B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110)))) then (Base_dDiag.C_Check_OkC ((v_exportTarget dtb__109))) else (Base_dDiag.C_Check_OkC ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverCtor (mc1, (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_exportTarget) (B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110))))))))))
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownConstructor (mc1))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorEntryHits = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> (let nd_uscrut10 = dtb__114 in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (match dtb__116 with
  | B_dData_dList.C_List_Nil -> (if (dtb__115 = mc2) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) dtb__113)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportCtors es) dtb__115) with
  | B_dData_dList.C_List_Nil -> (((v_ctorEntryHits mc0) dtb__112) mc2)
  | dtb__117 -> ((Base_dCommon.v_bind (((v_ctorEntryHits mc0) dtb__112) mc2)) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = e })) dtb__117)) hits)))))
))) else (((v_ctorEntryHits mc0) dtb__112) mc2))
  | _ -> (((v_ctorEntryHits mc0) dtb__112) mc2)
)
  | _ -> (((v_ctorEntryHits mc0) dtb__112) mc2)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 487 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorFamilyEntryOf = (fun (base : string) (parent : string) (x : Loader_dModules.t_ExportEntry) -> (if (if ((x).Loader_dModules.f_ExportEntry_kind = "ctor") then ((x).Loader_dModules.f_ExportEntry_public = base) else false) then ((x).Loader_dModules.f_ExportEntry_parent = parent) else false))

# 490 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorFamilyHits = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) (mc3 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | { B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = dtb__121 } -> (let nd_uscrut11 = dtb__121 in (match nd_uscrut11 with
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
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_foldFieldChain = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__130, dtb__131) -> (((v_foldFieldChain (Frontend_dAst.C_Expr_EField (mc0, dtb__130, mc2))) dtb__131) mc2)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 567 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_takeSegs = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__132, ((v_takeSegs (mc0 - 1)) dtb__133))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_longestNamespaceEntryGo = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (k : int) -> (if (k <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Loader_dModules.v_findExportModule es) (Base_dSource.v_joinDots ((v_takeSegs k) segs))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__134).Loader_dModules.f_ExportEntry_target; B_dData_dPair.f_Pair_second = k }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_longestNamespaceEntryGo es) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 214 "Vuna/Compiler/Loader/Resolve.vuna"
let v_longestNamespaceEntry = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (segs : string B_dData_dList.t_List) -> (((v_longestNamespaceEntryGo es) segs) (B_dData_dList.v_length segs)))

# 571 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_dropSegs = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136)) else ((v_dropSegs (mc0 - 1)) dtb__136))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_walkNamespacePathsFuel = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "namespace path") else (if (v_notEmptyList segs) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let nd_uscrut5 = ((v_longestNamespaceEntry es) segs) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (match dtb__137 with
  | { B_dData_dPair.f_Pair_first = dtb__138; B_dData_dPair.f_Pair_second = dtb__139 } -> ((((v_walkNamespacePathsFuel (fuel - 1)) modules) dtb__138) ((v_dropSegs dtb__139) segs))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = segs }))
  | _ -> failwith "DT: impossible branch"
)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = segs })))))

# 196 "Vuna/Compiler/Loader/Resolve.vuna"
let v_walkNamespacePaths = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> ((((v_walkNamespacePathsFuel (1 + (B_dData_dList.v_length segs))) modules) m) segs))

# 255 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_walkNamespaceCandidates = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> ((Base_dCommon.v_bind (((v_walkNamespacePaths mc0) dtb__140) mc2)) (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((v_walkNamespaceCandidates mc0) dtb__141) mc2) (B_dData_dList.C_List__x58__x58_ (p, mc3)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolvePathPrefixesTry = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (match ((Loader_dModules.v_qualifierCandidates imports) (Base_dSource.v_joinDots ((v_takeSegs n) segs))) with
  | B_dData_dList.C_List_Nil -> ((((v_resolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__142 -> ((Base_dCommon.v_bind ((((v_walkNamespaceCandidates modules) ((B_dData_dList.v_map (v_realModuleName modules)) dtb__142)) ((v_dropSegs n) segs)) B_dData_dList.C_List_Nil)) (fun (rs : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_uniqPathResults rs) with
  | B_dData_dList.C_List_Nil -> ((((v_resolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__143 -> (Base_dDiag.C_Check_OkC (dtb__143))
)))
)))

# 228 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolvePathPrefixes = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (segs : string B_dData_dList.t_List) -> ((((v_resolvePathPrefixesTry modules) imports) segs) ((B_dData_dList.v_length segs) - 1)))

# 331 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveQualified = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ps with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (name))) name)
  | _ -> ((Base_dCommon.v_bind ((((v_entryHits v_pickValueEntries) modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match hits with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "value") ((v_memberLabel name) ps)) hits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
))))

# 575 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_pathEntryHits = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match dtb__144 with
  | { B_dData_dPair.f_Pair_first = dtb__146; B_dData_dPair.f_Pair_second = dtb__147 } -> (let nd_uscrut10 = dtb__147 in (match nd_uscrut10 with
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
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_uniqPathTargets = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (if ((v_memPathKey (v_pathKey dtb__152)) dtb__153) then (v_uniqPathTargets dtb__153) else (B_dData_dList.C_List__x58__x58_ (dtb__152, (v_uniqPathTargets dtb__153))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Loader/Resolve.vuna"
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

# 630 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isEmptyPaths = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedTypeTargetOnly = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (name))) name) else ((Base_dCommon.v_bind ((((v_entryHits v_pickTypeEntries) modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match hits with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") ((v_memberLabel name) ps)) hits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))))))

# 394 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeTarget = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dIntrinsics.v_isIntrinsicTypeName name) then (Base_dDiag.C_Check_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Base_dDiag.C_Check_OkC (name)) else (if (Base_dSource.v_containsDot name) then ((((v_resolveDottedTypeTargetOnly modules) label) imports) name) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownType (name))) name)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))))))

# 429 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveFamilyQualifiedCtor = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = dtb__161 } -> (let famName = (Base_dSource.v_joinDots dtb__160) in ((Base_dCommon.v_bind ((((((v_resolveTypeTarget modules) label) prefix) ns) imports) famName)) (fun (famTarget : string) -> (match (((((v_ctorTargetInFamily modules) prefix) ns) famTarget) dtb__161) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> (Base_dDiag.C_Check_OkC (dtb__162))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeHasNoConstructor (famName, dtb__161))) famName) dtb__161)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorDotted = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then ((((((v_resolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind (((v_ctorEntryHits modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_notEmptyList hits) then (((v_uniqueCtorTarget label) ((v_memberLabel name) ps)) ((B_dData_dList.v_map B_dData_dPair.v_secondOf) hits)) else ((Base_dCommon.v_bind ((((v_ctorFamilyHits modules) ps) ((v_memberLabel name) ps)) (v_lastSegmentOf name))) (fun (familyHits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match familyHits with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "constructor") (v_lastSegmentOf name)) familyHits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))))))))

# 606 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveQualifiedPath = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) (sp : Frontend_dAst.t_NodeRef) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) ((v_takeSegs n) segs))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)) else ((Base_dCommon.v_bind (((v_pathEntryHits modules) ps) ((v_memberLabel "") ps))) (fun (hits : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut8 = (v_uniqPathTargets hits) in (match nd_uscrut8 with
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
))))))))

# 698 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_valuePairTargets = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (match dtb__167 with
  | { B_dData_dPair.f_Pair_first = dtb__169; B_dData_dPair.f_Pair_second = dtb__170 } -> (let isCtor = (if ((dtb__170).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((Loader_dModules.v_isDataOrRecordCtorTarget mc0) (dtb__170).Loader_dModules.f_ExportEntry_target)) in (if isCtor then ((v_valuePairTargets mc0) dtb__168) else (B_dData_dList.C_List__x58__x58_ ((dtb__170).Loader_dModules.f_ExportEntry_target, ((v_valuePairTargets mc0) dtb__168)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 706 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueOrOver = (fun (name : string) (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut2 = (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) pairs)) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (match dtb__172 with
  | B_dData_dList.C_List_Nil -> dtb__171
  | _ -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverValue (name, nd_uscrut2)))
)
  | B_dData_dList.C_List_Nil -> name
  | _ -> failwith "DT: impossible branch"
)))

# 714 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickCtorOrOver = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | B_dData_dList.C_List_Nil -> dtb__173
  | _ -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverCtor (mc0, mc1)))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverCtor (mc0, B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtor = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if (Base_dSource.v_containsDot name) then ((((((v_resolveCtorDotted modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind (((((v_ctorCandidates modules) prefix) ns) imports) name)) (fun (cands : string B_dData_dList.t_List) -> (match cands with
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsCtorSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dIntrinsics.v_isIntrinsicName name) then (Base_dDiag.C_Check_OkC (name)) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage ((Base_dSource.v_suggest name) (ns).Loader_dModules.f_Namespaces_nsCtors))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownConstructor (name))) name))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) pairs)))))
)))))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) cands)))
)))))

# 745 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkBinder = (fun (label : string) (name : string) -> (if (Base_dSource.v_containsDot name) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidVariableName (name))) name) else (Base_dDiag.C_Check_OkC (name))))

# 749 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkTopName = (fun (label : string) (name : string) -> (if (name = "_") then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTopLevelName ("_"))) "_") else (if (Base_dSource.v_containsDot name) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTopLevelName (name))) name) else (Base_dDiag.C_Check_OkC (name)))))

# 755 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTopName = (fun (label : string) (prefix : string) (name : string) -> ((Base_dCommon.v_bind ((v_checkTopName label) name)) (fun (_u : string) -> (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))))))

# 759 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolvePattern = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match pat with
  | Frontend_dAst.C_Pat_PWild (dtb__175) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild (dtb__175)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PVar (dtb__176, dtb__177) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__177))) ((v_checkBinder label) dtb__176))) (fun (_u : string) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__176, dtb__177)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__176, B_dData_dList.C_List_Nil)) }))))
  | Frontend_dAst.C_Pat_PAs (dtb__178, dtb__179, dtb__180) -> ((Base_dCommon.v_bind (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__179)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__178, (B_dData_dPair.v_firstOf p), dtb__180)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__178, (B_dData_dPair.v_secondOf p))) }))))
  | Frontend_dAst.C_Pat_PInt (dtb__181, dtb__182) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__181, dtb__182)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PStr (dtb__183, dtb__184) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__183, dtb__184)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PCon (dtb__185, dtb__186, dtb__187) -> (let nd_uscrut10 = (Frontend_dReserved.v_classify dtb__185) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__188) -> (match dtb__188 with
  | Frontend_dReserved.C_Reserved_RsTupleUnit -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) (Frontend_dAst.C_Pat_PCon ("MkUnit", B_dData_dList.C_List_Nil, dtb__187)))
  | Frontend_dReserved.C_Reserved_RsTuplePair -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) (Frontend_dAst.C_Pat_PCon ("Pair", dtb__186, dtb__187)))
  | _ -> (if (Frontend_dReserved.v_isInternalSyntaxName dtb__185) then ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__186)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__185, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__187)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__187))) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__185))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__186)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (name2, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__187)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))))))
)
  | _ -> (if (Frontend_dReserved.v_isInternalSyntaxName dtb__185) then ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__186)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__185, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__187)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__187))) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__185))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__186)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (name2, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__187)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))))))
))
  | Frontend_dAst.C_Pat_PRecord (dtb__189, dtb__190, dtb__191) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__191))) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__189))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (((((((v_resolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__190)) (fun (parts : ((string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (name2, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__191)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) }))))))
  | _ -> failwith "DT: impossible branch"
)))
# 777 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecordPatternField = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc6 with
  | { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__193 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__193)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__194 }; B_dData_dPair.f_Pair_second = dtb__195 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 830 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveLocalPats = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__196)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__198; B_dData_dPair.f_Pair_second = dtb__199 } -> ((Base_dCommon.v_bind (((((((v_resolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__197)) (fun (r : (Frontend_dAst.t_Pat B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__200)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__199) dtb__201) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))
  | _ -> failwith "DT: impossible branch"
))

# 895 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_collectRecBinds = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) (dtb__202).Frontend_dAst.f_Binding_bindPat)) (fun (pr : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match pr with
  | { B_dData_dPair.f_Pair_first = dtb__204; B_dData_dPair.f_Pair_second = dtb__205 } -> ((Base_dCommon.v_bind ((((((v_collectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__203)) (fun (r : (string B_dData_dList.t_List, Frontend_dAst.t_Binding B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__205) dtb__206); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = dtb__204; Frontend_dAst.f_Binding_bindValue = (dtb__202).Frontend_dAst.f_Binding_bindValue; Frontend_dAst.f_Binding_bindSig = (dtb__202).Frontend_dAst.f_Binding_bindSig; Frontend_dAst.f_Binding_bindRef = (dtb__202).Frontend_dAst.f_Binding_bindRef }, dtb__207)) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 938 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_templateChunks = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (match dtb__208 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__210) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_interpMethodName, (Frontend_dAst.v_exprRef dtb__210))), (B_dData_dList.C_List__x58__x58_ (dtb__210, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_exprRef dtb__210))), ((v_templateChunks mc0) dtb__209)))
  | Frontend_dAst.C_InterpPart_IPText (dtb__211) -> (if (dtb__211 = "") then ((v_templateChunks mc0) dtb__209) else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (dtb__211, mc0)), ((v_templateChunks mc0) dtb__209))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 945 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_concatLeft = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr) (mc2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (((v_concatLeft mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", mc0)), (B_dData_dList.C_List__x58__x58_ (mc1, (B_dData_dList.C_List__x58__x58_ (dtb__212, B_dData_dList.C_List_Nil)))), mc0))) dtb__213)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 932 "Vuna/Compiler/Loader/Resolve.vuna"
let v_lowerTemplate = (fun (sp : Frontend_dAst.t_NodeRef) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match ((v_templateChunks sp) parts) with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EStr ("", sp))
  | B_dData_dList.C_List__x58__x58_ (dtb__214, dtb__215) -> (((v_concatLeft sp) dtb__214) dtb__215)
  | _ -> failwith "DT: impossible branch"
))

# 953 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkDebugConstruct = (fun (release : bool) (sp : Frontend_dAst.t_NodeRef) (name : string) (resolved : string) (scope : string B_dData_dList.t_List) -> (if release then (if (Base_dIntrinsics.v_isDebugOnlyName resolved) then (if ((B_dData_dList.v_memName name) scope) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (resolved, sp)))) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dTc.C_TcErr_DebugConstructInRelease (resolved))) resolved)) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (resolved, sp))))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (resolved, sp))))))

# 970 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isParserSyntaxName = (fun (name : string) -> (match (Frontend_dReserved.v_classify name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__216) -> (Frontend_dReserved.v_isParserSurface dtb__216)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (name = Frontend_dReserved.v_handleOpBinderName) then true else (name = Frontend_dReserved.v_handleOpIndexBinderName))
  | _ -> failwith "DT: impossible branch"
))

# 979 "Vuna/Compiler/Loader/Resolve.vuna"
let v_hiddenRef = (fun (name : string) (sp : Frontend_dAst.t_NodeRef) -> (let stripped = (((B_dData_dString.v_substring 1) (bi_natFromInt (bi_strLength name))) name) in (match (Base_dIntrinsics.v_findIntrinsic stripped) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (stripped, sp))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("hidden reference to unknown intrinsic " ^ stripped))
  | _ -> failwith "DT: impossible branch"
)))

# 990 "Vuna/Compiler/Loader/Resolve.vuna"
let v_normalizeSyntaxNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__218, dtb__219, dtb__220) -> (match dtb__218 with
  | Frontend_dAst.C_Expr_EVar (dtb__221, dtb__222) -> (match dtb__219 with
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> (match dtb__224 with
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> (match dtb__226 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut13 = (Frontend_dReserved.v_classify dtb__221) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> (match dtb__227 with
  | Frontend_dReserved.C_Reserved_RsTuplePair -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("Pair", dtb__222)), (B_dData_dList.C_List__x58__x58_ (dtb__223, (B_dData_dList.C_List__x58__x58_ (dtb__225, B_dData_dList.C_List_Nil)))), dtb__220))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__228, dtb__229) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify dtb__228) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__230) -> (match dtb__230 with
  | Frontend_dReserved.C_Reserved_RsTupleUnit -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar ("MkUnit", dtb__229))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1160 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorDecl = (fun (label : string) (prefix : string) (dname : string) (ctor : string) -> ((Base_dCommon.v_bind ((v_checkTopName label) ctor)) (fun (_u : string) -> (Base_dDiag.C_Check_OkC ((((Loader_dModules.v_ctorCanonical prefix) dname) ctor))))))

# 1166 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isLowerTypeName = (fun (name : string) -> (match (B_dData_dList.dtp_unpack name) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (Frontend_dLexer.v_isLowerChar dtb__231)
  | _ -> failwith "DT: impossible branch"
))

# 1172 "Vuna/Compiler/Loader/Resolve.vuna"
let v_startsUpperName = (fun (name : string) -> (match (B_dData_dList.dtp_unpack name) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__233, dtb__234) -> (if (dtb__233 >= 65) then (dtb__233 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1206 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorResult = (fun (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (name : string) -> (let nd_uscrut4 = (((v_localCtorTargets prefix) ns) name) in (match nd_uscrut4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dList.C_List__x58__x58_ (dtb__235, dtb__236) -> (match dtb__236 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__235))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousConstructor (name, ("Data." ^ name)))) name) ("Data." ^ name))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1214 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveLowerTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else ((Base_dCommon.v_bind ((((v_localCtorResult label) prefix) ns) name)) (fun (mc : string B_dData_dMaybe.t_Maybe) -> (match mc with
  | B_dData_dMaybe.C_Maybe_Just (dtb__237) -> (Base_dDiag.C_Check_OkC (dtb__237))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValueIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (vp : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match vp with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (cp : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match cp with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (tp : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match tp with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (name))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) tp)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) cp)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) vp)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1270 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then ((((((v_resolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind ((((v_entryHits v_pickTypeEntries) modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match hits with
  | B_dData_dList.C_List_Nil -> (match ((((((v_resolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Base_dDiag.C_Check_OkC (dtb__238) -> (Base_dDiag.C_Check_OkC (dtb__238))
  | Base_dDiag.C_Check_ErrC (dtb__239) -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") ((v_memberLabel name) ps)) hits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))))))

# 1245 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveNonLowerTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind ((((v_localCtorResult label) prefix) ns) name)) (fun (mc : string B_dData_dMaybe.t_Maybe) -> (match mc with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> (Base_dDiag.C_Check_OkC (dtb__240))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot name) then ((((((v_resolveDottedTypeName modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (match ((((((v_resolveCtor modules) label) prefix) ns) imports) name) with
  | Base_dDiag.C_Check_OkC (dtb__241) -> (Base_dDiag.C_Check_OkC (dtb__241))
  | Base_dDiag.C_Check_ErrC (dtb__242) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (Base_dDiag.C_Check_ErrC (dtb__242)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))
  | _ -> failwith "DT: impossible branch"
))))

# 1191 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dIntrinsics.v_isIntrinsicTypeName name) then (Base_dDiag.C_Check_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Base_dDiag.C_Check_OkC (name)) else (if (v_isLowerTypeName name) then ((((((v_resolveLowerTypeName modules) label) prefix) ns) imports) name) else ((((((v_resolveNonLowerTypeName modules) label) prefix) ns) imports) name))))))

# 1301 "Vuna/Compiler/Loader/Resolve.vuna"
let v_constraintHeadOf = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__243, dtb__244) -> (B_dData_dMaybe.C_Maybe_Just (dtb__243))
  | Frontend_dAst.C_Expr_EApp (dtb__245, dtb__246, dtb__247) -> (match dtb__245 with
  | Frontend_dAst.C_Expr_EVar (dtb__248, dtb__249) -> (B_dData_dMaybe.C_Maybe_Just (dtb__248))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1313 "Vuna/Compiler/Loader/Resolve.vuna"
let v_normalizeTypeSyntaxNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__250, dtb__251, dtb__252) -> (match dtb__250 with
  | Frontend_dAst.C_Expr_EVar (dtb__253, dtb__254) -> (let nd_uscrut6 = (Frontend_dReserved.v_classify dtb__253) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__255) -> (match dtb__255 with
  | Frontend_dReserved.C_Reserved_RsTuplePair -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("Pair", dtb__254)), dtb__251, dtb__252))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__256, dtb__257) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify dtb__256) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__258) -> (match dtb__258 with
  | Frontend_dReserved.C_Reserved_RsTupleUnit -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar ("Unit", dtb__257))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1351 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeTopName = (fun (label : string) (prefix : string) (name : string) -> ((Base_dCommon.v_bind ((v_checkTopName label) name)) (fun (_u : string) -> (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))))))

# 1462 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isLowerIdent = (fun (n : string) -> (match (B_dData_dList.dtp_unpack n) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (if (dtb__259 >= 97) then (dtb__259 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1457 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_exprLowerNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__261, dtb__262, dtb__263) -> ((B_dData_dList.v_append (v_exprLowerNames dtb__261)) ((B_dData_dList.v_concatMap v_exprLowerNames) dtb__262))
  | Frontend_dAst.C_Expr_EVar (dtb__264, dtb__265) -> (if (v_isLowerIdent dtb__264) then (B_dData_dList.C_List__x58__x58_ (dtb__264, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 1468 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_scopeNamesOf = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (match dtb__266 with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> (if (dtb__268 = mc0) then dtb__269 else ((v_scopeNamesOf mc0) dtb__267))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1492 "Vuna/Compiler/Loader/Resolve.vuna"
let v_tyShape = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EDo (dtb__270, dtb__271) -> "do"
  | Frontend_dAst.C_Expr_EIf (dtb__272, dtb__273, dtb__274, dtb__275) -> "if"
  | Frontend_dAst.C_Expr_ECase (dtb__276, dtb__277, dtb__278) -> "case"
  | Frontend_dAst.C_Expr_ELet (dtb__279, dtb__280, dtb__281, dtb__282) -> "let"
  | Frontend_dAst.C_Expr_ELam (dtb__283, dtb__284, dtb__285) -> "lam"
  | Frontend_dAst.C_Expr_EFloat (dtb__286, dtb__287) -> "float"
  | Frontend_dAst.C_Expr_EStr (dtb__288, dtb__289) -> "str"
  | Frontend_dAst.C_Expr_EInt (dtb__290, dtb__291) -> "int"
  | Frontend_dAst.C_Expr_EApp (dtb__292, dtb__293, dtb__294) -> "app"
  | Frontend_dAst.C_Expr_EVar (dtb__295, dtb__296) -> ("var " ^ dtb__295)
  | _ -> "other"
))

# 1324 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveTypeExprScoped = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (bound : string B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match (v_normalizeTypeSyntaxNames ty) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__297)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_resolveTypeExprScopedRaw fuel) modules) label) prefix) ns) imports) bound) ty)
  | _ -> failwith "DT: impossible branch"
)))
# 1333 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveTypeExprScopedRaw = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (bound : string B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut8 = ty in (match nd_uscrut8 with
  | Frontend_dAst.C_Expr_EPi (dtb__298, dtb__299, dtb__300, dtb__301, dtb__302, dtb__303) -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__301)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) (B_dData_dList.C_List__x58__x58_ (dtb__298, bound))) dtb__302)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__298, dtb__299, dtb__300, dom2, cod2, dtb__303))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__304, dtb__305, dtb__306) -> (match dtb__304 with
  | Frontend_dAst.C_Expr_EVar (dtb__307, dtb__308) -> (if (dtb__307 = "Type") then (Base_dDiag.C_Check_OkC (ty)) else ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__304)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__305)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__306)))))))))
  | _ -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__304)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__305)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__306))))))))
)
  | Frontend_dAst.C_Expr_EVar (dtb__309, dtb__310) -> (if ((B_dData_dList.v_memName dtb__309) bound) then (Base_dDiag.C_Check_OkC (ty)) else (if (Frontend_dReserved.v_isMacroSyntaxName dtb__309) then (Base_dDiag.v_icInternal ("unexpanded macro invocation " ^ dtb__309)) else (if (Frontend_dReserved.v_isInternalSyntaxName dtb__309) then (Base_dDiag.C_Check_OkC (ty)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__310))) ((((((v_resolveTypeName modules) label) prefix) ns) imports) dtb__309))) (fun (n : string) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (n, dtb__310)))))))))
  | Frontend_dAst.C_Expr_EStr (dtb__311, dtb__312) -> (Base_dDiag.C_Check_OkC (ty))
  | Frontend_dAst.C_Expr_EInt (dtb__313, dtb__314) -> (Base_dDiag.C_Check_OkC (ty))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan ty))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTypeExpression ((v_tyShape ty)))) (v_tyShape ty)))
))))

# 1306 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeExpr = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped fuel) modules) label) prefix) ns) imports) B_dData_dList.C_List_Nil) ty))

# 1292 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveConstraintExpr = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (cx : Frontend_dAst.t_Expr) -> (match (v_constraintHeadOf cx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__315) -> (match ((((((v_resolveTypeName modules) label) prefix) ns) imports) dtb__315) with
  | Base_dDiag.C_Check_ErrC (dtb__316) -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan cx))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownInterface (dtb__315))) dtb__315))
  | Base_dDiag.C_Check_OkC (dtb__317) -> (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

# 1356 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorSpec = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : string) (mc6 : Frontend_dAst.t_Ctor) -> (match mc6 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__318; Frontend_dAst.f_Ctor_ctorType = dtb__319; Frontend_dAst.f_Ctor_ctorArity = dtb__320; Frontend_dAst.f_Ctor_ctorRef = dtb__321 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__321))) ((((v_resolveCtorDecl mc1) mc2) mc5) dtb__318))) (fun (c2 : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__319)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = c2; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__320; Frontend_dAst.f_Ctor_ctorRef = dtb__321 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1399 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveRecordField = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Field) -> (match mc5 with
  | { Frontend_dAst.f_Field_fieldName = dtb__322; Frontend_dAst.f_Field_fieldType = dtb__323; Frontend_dAst.f_Field_fieldRef = dtb__324 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__324))) ((v_checkBinder mc1) dtb__322))) (fun (_u : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__323)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__322; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldRef = dtb__324 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1405 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTraitMethod = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_TraitMethod) -> (match mc5 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__325; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__326; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__327 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__327))) (((v_resolveTopName mc1) mc2) dtb__325))) (fun (n : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__326)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = n; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__327 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1508 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorPairTargets = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__328, dtb__329) -> (match dtb__328 with
  | { B_dData_dPair.f_Pair_first = dtb__330; B_dData_dPair.f_Pair_second = dtb__331 } -> (let isCtor = (if ((dtb__331).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((Loader_dModules.v_isDataOrRecordCtorTarget mc0) (dtb__331).Loader_dModules.f_ExportEntry_target)) in (if isCtor then (B_dData_dList.C_List__x58__x58_ ((dtb__331).Loader_dModules.f_ExportEntry_target, ((v_ctorPairTargets mc0) dtb__329))) else ((v_ctorPairTargets mc0) dtb__329)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 641 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveGlobal = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (name : string) -> (if ((B_dData_dList.v_memName name) scope) then (Base_dDiag.C_Check_OkC (name)) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (match (((v_localCtorTargets prefix) ns) name) with
  | B_dData_dList.C_List__x58__x58_ (dtb__332, dtb__333) -> ((Base_dCommon.v_bind (((((v_ctorCandidates modules) prefix) ns) imports) name)) (fun (cands : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) cands)))))
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsCtorSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dSource.v_containsDot name) then ((((v_resolveQualified modules) label) imports) name) else (if (v_isBuiltinName name) then (Base_dDiag.C_Check_OkC (name)) else (if (v_isDtPreludeName name) then (Base_dDiag.C_Check_OkC (name)) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValueIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_ctorCandidates modules) prefix) ns) imports) name)) (fun (cands : string B_dData_dList.t_List) -> (match cands with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (cpairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match cpairs with
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) imports) name)) (fun (tpairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match tpairs with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage ((Base_dSource.v_suggest name) ((B_dData_dList.v_append (ns).Loader_dModules.f_Namespaces_nsValues) ((B_dData_dList.v_append (ns).Loader_dModules.f_Namespaces_nsCtors) ((B_dData_dList.v_append (ns).Loader_dModules.f_Namespaces_nsTypes) scope)))))) ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage (v_traitImportHint name))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownVariable (name))) name)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) tpairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) cpairs)))))
)))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) cands)))
)))
  | _ -> (match ((v_ctorPairTargets modules) pairs) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (((v_pickValueOrOver name) pairs)))
  | dtb__334 -> (match ((v_valuePairTargets modules) pairs) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) (B_dData_dList.v_nubNames dtb__334))))
  | _ -> (Base_dDiag.C_Check_OkC ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverValue (name, (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) pairs)))))))
)
)
)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 538 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedExpr = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (name : string) (sp : Frontend_dAst.t_NodeRef) -> (match (Base_dSource.v_splitOnDot name) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "empty dotted name")
  | B_dData_dList.C_List__x58__x58_ (dtb__335, dtb__336) -> (if ((B_dData_dList.v_memName dtb__335) scope) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb__335, sp))) dtb__336) sp))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan sp))) ((((((v_resolveQualifiedPath modules) label) imports) (Base_dSource.v_splitOnDot name)) (B_dData_dList.v_length (Base_dSource.v_splitOnDot name))) sp))) (fun (q : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) -> (match q with
  | B_dData_dMaybe.C_Maybe_Just (dtb__337) -> (Base_dDiag.C_Check_OkC (dtb__337))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__335) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (((Loader_dModules.v_mangle prefix) dtb__335), sp))) dtb__336) sp))) else (if (v_isBuiltinName dtb__335) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb__335, sp))) dtb__336) sp))) else (if (v_startsUpperName dtb__335) then (match ((((((v_resolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Base_dDiag.C_Check_OkC (dtb__338) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__338, sp))))
  | Base_dDiag.C_Check_ErrC (dtb__339) -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan sp))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (dtb__335))) dtb__335))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan sp))) (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) dtb__335))) (fun (n : string) -> (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (n, sp))) dtb__336) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 1080 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDoBind = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) -> (match (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) ">>=") with
  | Base_dDiag.C_Check_OkC (dtb__340) -> (Base_dDiag.C_Check_OkC (dtb__340))
  | Base_dDiag.C_Check_ErrC (dtb__341) -> (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) "bind")
  | _ -> failwith "DT: impossible branch"
))

# 788 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveAlt = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (alt : Frontend_dAst.t_Alt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports) (alt).Frontend_dAst.f_Alt_altPat)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__342; B_dData_dPair.f_Pair_second = dtb__343 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__343) scope)) (alt).Frontend_dAst.f_Alt_altBody)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Alt_altPat = dtb__342; Frontend_dAst.f_Alt_altBody = body2; Frontend_dAst.f_Alt_altRef = (alt).Frontend_dAst.f_Alt_altRef }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 800 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveBindingSig = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__344) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (dtb__344).Frontend_dAst.f_BindingSig_sigType)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = ty2; Frontend_dAst.f_BindingSig_sigRef = (dtb__344).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 808 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveBindingValue = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : Frontend_dAst.t_BindingValue) -> (match mc7 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__345) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Frontend_dAst.t_LocalClause) -> ((((((((v_resolveLocalClause (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) c))) dtb__345)) (fun (cs : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (cs))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb__346) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__346)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (e2))))))
  | _ -> failwith "DT: impossible branch"
))
# 819 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLocalClause = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (clause : Frontend_dAst.t_LocalClause) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolveLocalPats (fuel - 1)) modules) label) prefix) ns) imports) (clause).Frontend_dAst.f_LocalClause_lcPats)) (fun (p : (Frontend_dAst.t_Pat B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__347; B_dData_dPair.f_Pair_second = dtb__348 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__348) scope)) (clause).Frontend_dAst.f_LocalClause_lcBody)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_LocalClause_lcPats = dtb__347; Frontend_dAst.f_LocalClause_lcBody = body2; Frontend_dAst.f_LocalClause_lcRef = (clause).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (clause).Frontend_dAst.f_LocalClause_lcHead }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 848 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLet = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (rec_u : bool) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (if rec_u then (((((((((v_resolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_resolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
# 857 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLetSeq = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match binds with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = b }))))
  | B_dData_dList.C_List__x58__x58_ (dtb__349, dtb__350) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingSig (fuel - 1)) modules) label) prefix) ns) imports) scope) (dtb__349).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingValue (fuel - 1)) modules) label) prefix) ns) imports) scope) (dtb__349).Frontend_dAst.f_Binding_bindValue)) (fun (value2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports) (dtb__349).Frontend_dAst.f_Binding_bindPat)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__351; B_dData_dPair.f_Pair_second = dtb__352 } -> ((Base_dCommon.v_bind (((((((((v_resolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__352) scope)) dtb__350) body)) (fun (r : (Frontend_dAst.t_Binding B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__353; B_dData_dPair.f_Pair_second = dtb__354 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = dtb__351; Frontend_dAst.f_Binding_bindValue = value2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (dtb__349).Frontend_dAst.f_Binding_bindRef }, dtb__353)); B_dData_dPair.f_Pair_second = dtb__354 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 883 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecLet = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut9 = ((((((v_collectRecBinds modules) label) prefix) ns) imports) binds) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__355) -> (match dtb__355 with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (let scope2 = ((B_dData_dList.v_append dtb__356) scope) in ((Base_dCommon.v_bind ((((((((v_resolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__357)) (fun (values2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = values2; B_dData_dPair.f_Pair_second = b })))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__358) -> (Base_dDiag.C_Check_ErrC (dtb__358))
  | _ -> failwith "DT: impossible branch"
))))
# 911 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecValues = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__359, dtb__360) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind ((((((((v_resolveBindingSig (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (dtb__359).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingValue (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (dtb__359).Frontend_dAst.f_Binding_bindValue)) (fun (value2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind ((((((((v_resolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__360)) (fun (tail : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb__359).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = value2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (dtb__359).Frontend_dAst.f_Binding_bindRef }, tail)))))))))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 1001 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveExpr = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match (v_normalizeSyntaxNames expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__361) -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__361)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_resolveExprRaw fuel) modules) label) prefix) ns) imports) scope) expr)
  | _ -> failwith "DT: impossible branch"
)))
# 1010 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveExprRaw = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match expr with
  | Frontend_dAst.C_Expr_EVar (dtb__362, dtb__363) -> (if (Frontend_dReserved.v_isHoleName dtb__362) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__362, dtb__363)))) else (if (if ((B_dData_dString.v_startsWith "!") dtb__362) then ((bi_strLength dtb__362) > 1) else false) then ((v_hiddenRef dtb__362) dtb__363) else (if (Frontend_dReserved.v_isMacroSyntaxName dtb__362) then (Base_dDiag.v_icInternal ("unexpanded macro invocation " ^ dtb__362)) else (if (Frontend_dReserved.v_isInternalSyntaxName dtb__362) then (if (if (v_isParserSyntaxName dtb__362) then true else (Frontend_dRast_dName.v_isCompilerModulePrefix prefix)) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__362, dtb__363)))) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__363))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownVariable (dtb__362))) dtb__362))) else (if (Base_dSource.v_containsDot dtb__362) then ((((((((v_resolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__362) dtb__363) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__363))) (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) dtb__362))) (fun (n : string) -> (((((v_checkDebugConstruct (ns).Loader_dModules.f_Namespaces_nsRelease) dtb__363) dtb__362) n) scope))))))))
  | Frontend_dAst.C_Expr_EInt (dtb__364, dtb__365) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb__364, dtb__365))))
  | Frontend_dAst.C_Expr_EStr (dtb__366, dtb__367) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb__366, dtb__367))))
  | Frontend_dAst.C_Expr_EFloat (dtb__368, dtb__369) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb__368, dtb__369))))
  | Frontend_dAst.C_Expr_EInterp (dtb__370, dtb__371) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__370)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_lowerTemplate dtb__371) ps)))))
  | Frontend_dAst.C_Expr_ELam (dtb__372, dtb__373, dtb__374) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__374))) ((Base_dCommon.v_traverse (v_checkBinder label)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__372)))) (fun (_u : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__372)) scope)) dtb__373)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__372, b, dtb__374))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__375, dtb__376, dtb__377) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__375)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__376)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__377))))))))
  | Frontend_dAst.C_Expr_EPi (dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__381)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb__378, B_dData_dList.C_List_Nil))) scope)) dtb__382)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__378, dtb__379, dtb__380, dom2, cod2, dtb__383))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__384, dtb__385, dtb__386, dtb__387) -> ((Base_dCommon.v_bind ((((((((((v_resolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__386) dtb__384) dtb__385)) (fun (r : (Frontend_dAst.t_Binding B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__388; B_dData_dPair.f_Pair_second = dtb__389 } -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb__388, dtb__389, dtb__386, dtb__387))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Expr_ECase (dtb__390, dtb__391, dtb__392) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__390)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Alt) -> ((((((((v_resolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__391)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__392))))))))
  | Frontend_dAst.C_Expr_EIf (dtb__393, dtb__394, dtb__395, dtb__396) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__393)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__394)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__395)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, e2, dtb__396))))))))))
  | Frontend_dAst.C_Expr_EField (dtb__397, dtb__398, dtb__399) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__397)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (b, dtb__398, dtb__399))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__400, dtb__401, dtb__402) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__402))) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__400))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__401)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (name2, fs, dtb__402))))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__403, dtb__404, dtb__405) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__403)) (fun (b : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__404)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (b, fs, dtb__405))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__406, dtb__407) -> (((((((((v_resolveDo (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__406) (Frontend_dAst.v_nodeRefSpan dtb__407))
  | _ -> failwith "DT: impossible branch"
)))
# 1048 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveInterpParts = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut8 = parts in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__408, dtb__409) -> (match dtb__408 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__410) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__410)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__409)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e2)), ps))))))))
  | Frontend_dAst.C_InterpPart_IPText (dtb__411) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__409)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__411)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 1067 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDo = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (blockSpan : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut9 = stmts in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__412, dtb__413) -> (match dtb__412 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__414, dtb__415) -> (match dtb__413 with
  | B_dData_dList.C_List_Nil -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__414)
  | _ -> ((Base_dCommon.v_bind ((((((v_resolveDoBind modules) label) prefix) ns) imports) scope)) (fun (bindName : string) -> ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | _ -> ((Base_dCommon.v_bind ((((((v_resolveDoBind modules) label) prefix) ns) imports) scope)) (fun (bindName : string) -> ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At blockSpan) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))))
# 1096 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDoChain = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (bindName : string) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (blockSpan : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut10 = stmts in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__416, dtb__417) -> (match dtb__416 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__418, dtb__419, dtb__420) -> (match dtb__418 with
  | Frontend_dAst.C_Pat_PWild (dtb__421) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__419)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__417) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoIgnore (bindName))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420)))), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), tail, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420))))))))))
  | Frontend_dAst.C_Pat_PVar (dtb__422, dtb__423) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__419)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) (B_dData_dList.C_List__x58__x58_ (dtb__422, scope))) bindName) dtb__417) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoBind (bindName))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420)))), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__422; B_dData_dPair.f_Pair_second = ((Base_dSource.v_spanAtName dtb__422) (Frontend_dAst.v_nodeRefSpan dtb__423)) }, B_dData_dList.C_List_Nil)), tail, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420))))))))))
  | _ -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__418)) (fun (rp : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rp with
  | { B_dData_dPair.f_Pair_first = dtb__424; B_dData_dPair.f_Pair_second = dtb__425 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__419)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__425) scope)) bindName) dtb__417) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoBind (bindName))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420)))), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_doPatternBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_doPatternBinderName, (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))), (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = dtb__424; Frontend_dAst.f_Alt_altBody = tail; Frontend_dAst.f_Alt_altRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__420))))))))))
  | _ -> failwith "DT: impossible branch"
)))
)
  | Frontend_dAst.C_DoStmt_DLet (dtb__426, dtb__427) -> ((Base_dCommon.v_bind ((((((((v_resolveDoLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__426)) (fun (r : (Frontend_dAst.t_Binding B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__428; B_dData_dPair.f_Pair_second = dtb__429 } -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__429) scope)) bindName) dtb__417) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb__428, tail, false, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__427))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__430, dtb__431) -> (match dtb__417 with
  | B_dData_dList.C_List_Nil -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__430)
  | _ -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__430)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__417) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoIgnore (bindName))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__431)))), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), tail, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__431)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__431))))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At blockSpan) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))))
# 1125 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDoLet = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match binds with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | B_dData_dList.C_List__x58__x58_ (dtb__432, dtb__433) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingSig (fuel - 1)) modules) label) prefix) ns) imports) scope) (dtb__432).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingValue (fuel - 1)) modules) label) prefix) ns) imports) scope) (dtb__432).Frontend_dAst.f_Binding_bindValue)) (fun (value2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports) (dtb__432).Frontend_dAst.f_Binding_bindPat)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__435 } -> ((Base_dCommon.v_bind ((((((((v_resolveDoLet (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__435) scope)) dtb__433)) (fun (r : (Frontend_dAst.t_Binding B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = dtb__434; Frontend_dAst.f_Binding_bindValue = value2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (dtb__432).Frontend_dAst.f_Binding_bindRef }, dtb__436)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__435) dtb__437) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 1150 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveFieldValue = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc7 with
  | { B_dData_dPair.f_Pair_first = dtb__438; B_dData_dPair.f_Pair_second = dtb__439 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__439)) (fun (v : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__438; B_dData_dPair.f_Pair_second = v })))))
  | _ -> failwith "DT: impossible branch"
))

# 1411 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveInstanceMethod = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Decl) -> (match mc5 with
  | Frontend_dAst.C_Decl_DFun (dtb__440, dtb__441, dtb__442, dtb__443) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__443))) ((v_checkTopName mc1) dtb__440))) (fun (_u : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__441)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts)) dtb__442)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__440, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), b, dtb__443))))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__444, dtb__445, dtb__446, dtb__447) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__447))) ((v_checkTopName mc1) dtb__444))) (fun (_u : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__445)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__446)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__444, ctx2, ty2, dtb__447))))))))))
  | _ -> (Base_dDiag.v_icInternal "unexpected instance body declaration")
))

# 1362 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDecl = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (d : Frontend_dAst.t_Decl) -> (match d with
  | Frontend_dAst.C_Decl_DData (dtb__448, dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__456))) (((v_resolveTypeTopName label) prefix) dtb__448))) (fun (dn : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__450)) (fun (kind2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolveCtorSpec modules) label) prefix) ns) imports) dtb__448)) dtb__451)) (fun (ctors2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveTypeName modules) label) prefix) ns) imports)) dtb__452)) (fun (ds2 : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dn, dtb__449, kind2, ctors2, ds2, dtb__453, dtb__454, dtb__455, dtb__456))))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__457, dtb__458, dtb__459, dtb__460, dtb__461, dtb__462, dtb__463, dtb__464) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__464))) (((v_resolveTypeTopName label) prefix) dtb__457))) (fun (dn : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveRecordField modules) label) prefix) ns) imports)) dtb__459)) (fun (fields2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveTypeName modules) label) prefix) ns) imports)) dtb__460)) (fun (ds2 : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dn, dtb__458, fields2, ds2, dtb__461, dtb__462, dtb__463, dtb__464))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__469))) (((v_resolveTypeTopName label) prefix) dtb__465))) (fun (tn : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__467)) (fun (ss : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveTraitMethod modules) label) prefix) ns) imports)) dtb__468)) (fun (ms : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (tn, dtb__466, ss, ms, dtb__469))))))))))
  | Frontend_dAst.C_Decl_DInstance (dtb__470, dtb__471, dtb__472, dtb__473) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__470)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__471)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveInstanceMethod modules) label) prefix) ns) imports)) dtb__472)) (fun (ms : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, ms, dtb__473))))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__474, dtb__475, dtb__476, dtb__477) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__477))) (((v_resolveTopName label) prefix) dtb__474))) (fun (n : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__475)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__476)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (n, ctx2, ty2, dtb__477))))))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__478, dtb__479, dtb__480) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__480))) (((v_resolveTopName label) prefix) dtb__478))) (fun (n : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__479)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (n, ty2, dtb__480))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__481, dtb__482, dtb__483, dtb__484) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__484))) (((v_resolveTopName label) prefix) dtb__481))) (fun (n : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__483)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (n, dtb__482, ty2, dtb__484))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__485, dtb__486, dtb__487, dtb__488) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__488))) (((v_resolveTopName label) prefix) dtb__485))) (fun (n : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports)) dtb__486)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) modules) label) prefix) ns) imports) ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts)) dtb__487)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (n, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), b, dtb__488))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1472 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDeclWithImplicitScopes = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Decl) -> (match mc6 with
  | Frontend_dAst.C_Decl_DFun (dtb__489, dtb__490, dtb__491, dtb__492) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__492))) (((v_resolveTopName mc2) mc3) dtb__489))) (fun (n : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) mc1) mc2) mc3) mc4) mc5)) dtb__490)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) mc1) mc2) mc3) mc4) mc5) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts)) ((v_scopeNamesOf dtb__489) mc0))) dtb__491)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (n, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), b, dtb__492))))))))))
  | _ -> ((((((v_resolveDecl mc1) mc2) mc3) mc4) mc5) mc6)
))

# 1515 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isStringDomainExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__493, dtb__494) -> (if (dtb__493 = "String") then true else (if (dtb__493 = "Base.Data.String.String") then true else false))
  | _ -> false
))

# 1522 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isTypeDomainExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__495, dtb__496) -> (if (dtb__495 = "Type") then true else false)
  | _ -> false
))

# 1526 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isRowDomainExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__497, dtb__498) -> (if (dtb__497 = "Row") then true else (if (dtb__497 = "Base.Effect.Core.Row") then true else false))
  | _ -> false
))

# 1447 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_leadingImplicitNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__499, dtb__500, dtb__501, dtb__502, dtb__503, dtb__504) -> (if dtb__500 then (if (dtb__499 = "_") then (v_leadingImplicitNames dtb__503) else (if (if (if (v_isStringDomainExpr dtb__502) then true else (v_isTypeDomainExpr dtb__502)) then true else (v_isRowDomainExpr dtb__502)) then (B_dData_dList.C_List__x58__x58_ (dtb__499, (v_leadingImplicitNames dtb__503))) else (v_leadingImplicitNames dtb__503))) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 1435 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_implicitScopeTable = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__505, dtb__506) -> (match dtb__505 with
  | Frontend_dAst.C_Decl_DSig (dtb__507, dtb__508, dtb__509, dtb__510) -> (let names = (B_dData_dList.v_nubNames ((B_dData_dList.v_append (v_leadingImplicitNames dtb__509)) ((B_dData_dList.v_concatMap v_exprLowerNames) dtb__508))) in (match names with
  | B_dData_dList.C_List_Nil -> (v_implicitScopeTable dtb__506)
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__507; B_dData_dPair.f_Pair_second = names }, (v_implicitScopeTable dtb__506)))
))
  | _ -> (v_implicitScopeTable dtb__506)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1423 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveProgram = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let implicitScopes = (v_implicitScopeTable decls) in ((Base_dCommon.v_traverse ((((((v_resolveDeclWithImplicitScopes implicitScopes) modules) label) prefix) ns) imports)) decls)))

# 1481 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveEntry = (fun (release : bool) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryPkg : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((((v_resolveProgram modules) "<entry>") "") (((v_namespacesOfWith release) modules) decls)) imports) decls))

# 1485 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveModules = (fun (mc0 : bool) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__511, dtb__512) -> (match dtb__511 with
  | { Loader_dModules.f_Module_moduleNameOf = dtb__513; Loader_dModules.f_Module_modulePackageOf = dtb__514; Loader_dModules.f_Module_moduleImportsOf = dtb__515; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__516; Loader_dModules.f_Module_moduleDeclsOf = dtb__517; Loader_dModules.f_Module_moduleExportsOf = dtb__518; Loader_dModules.f_Module_moduleFixitiesOf = dtb__519; Loader_dModules.f_Module_moduleReexportsOf = dtb__520; Loader_dModules.f_Module_moduleOpaqueOf = dtb__521; Loader_dModules.f_Module_moduleExportIndexOf = dtb__522; Loader_dModules.f_Module_moduleFixFactsOf = dtb__523 } -> ((Base_dCommon.v_bind ((((((v_resolveProgram mc1) dtb__513) dtb__513) (((v_namespacesOfWith mc0) mc1) dtb__517)) ((B_dData_dList.v_append dtb__515) dtb__516)) dtb__517)) (fun (d1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_resolveModules mc0) dtb__512)) (fun (d2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
