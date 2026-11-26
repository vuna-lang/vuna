open Vuna_runtime
# 41 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveFuelBound = 1073741824

# 45 "Vuna/Compiler/Loader/Resolve.vuna"
let v_builtinArity = (fun (name : string) -> (match (Base_dIntrinsics.v_findIntrinsic name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (if (Base_dIntrinsics.v_intrinsicVisible dtb__0) then (B_dData_dMaybe.C_Maybe_Just ((Base_dIntrinsics.v_intrinsicArity dtb__0))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isBuiltinName = (fun (name : string) -> (match (v_builtinArity name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__1) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Loader/Resolve.vuna"
let v_dtPreludeNames = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Type", (B_dData_dList.C_List__x58__x58_ ("->", (B_dData_dList.C_List__x58__x58_ ("_", B_dData_dList.C_List_Nil))))))) ((B_dData_dList.v_append Base_dIntrinsics.v_preludeTypeNames) Base_dIntrinsics.v_preludeValueNames))

# 64 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isDtPreludeName = (fun (name : string) -> ((B_dData_dList.v_memName name) v_dtPreludeNames))

# 74 "Vuna/Compiler/Loader/Resolve.vuna"
let v_traitImportHint = (fun (mc0 : string) -> (if (mc0 = "Show") then " (trait Show is not in scope; add `import Base.Trait.Show`)" else (if (mc0 = "Eq") then " (trait Eq is not in scope; add `import Base.Trait.Eq`)" else (if (mc0 = "Ord") then " (trait Ord is not in scope; add `import Base.Trait.Ord`)" else (if (mc0 = "show") then " (trait method show; add `import Base.Trait.Show`)" else (if (mc0 = "eq") then " (trait method eq; add `import Base.Trait.Eq`)" else (if (mc0 = "neq") then " (trait method neq; add `import Base.Trait.Eq`)" else (if (mc0 = "lt") then " (trait method lt; add `import Base.Trait.Ord`)" else (if (mc0 = "le") then " (trait method le; add `import Base.Trait.Ord`)" else (if (mc0 = "gt") then " (trait method gt; add `import Base.Trait.Ord`)" else (if (mc0 = "ge") then " (trait method ge; add `import Base.Trait.Ord`)" else "")))))))))))

# 96 "Vuna/Compiler/Loader/Resolve.vuna"
let v_declValueNames = (fun (d : Frontend_dAst.t_Decl) -> (match d with
  | Frontend_dAst.C_Decl_DFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (B_dData_dList.C_List__x58__x58_ (dtb__2, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb__6, dtb__7, dtb__8, dtb__9) -> (B_dData_dList.C_List__x58__x58_ (dtb__6, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb__10, dtb__11, dtb__12) -> (B_dData_dList.C_List__x58__x58_ (dtb__10, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DExtern (dtb__13, dtb__14, dtb__15, dtb__16) -> (B_dData_dList.C_List__x58__x58_ (dtb__13, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DInstance (dtb__17, dtb__18, dtb__19, dtb__20) -> B_dData_dList.C_List_Nil
  | _ -> B_dData_dList.C_List_Nil
))

# 108 "Vuna/Compiler/Loader/Resolve.vuna"
let v_valueNamesOf = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declValueNames) decls))

# 116 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorCandsOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (match dtb__21 with
  | Frontend_dAst.C_Decl_DData (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (c : Frontend_dAst.t_Ctor) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.v_ctorName c); B_dData_dPair.f_Pair_second = (String.concat "" [dtb__23; "."; (Frontend_dAst.v_ctorName c)]) })) dtb__26)) (v_ctorCandsOf dtb__22))
  | Frontend_dAst.C_Decl_DRecord (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__32 }, (v_ctorCandsOf dtb__22)))
  | _ -> (v_ctorCandsOf dtb__22)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Loader/Resolve.vuna"
let v_namespacesOfWith = (fun (release : bool) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (let vals = (v_valueNamesOf decls) in (let cts = (Frontend_dAst.v_ctorsOf decls) in (let tys = (Frontend_dAst.v_typeNamesOf decls) in (let cands = (v_ctorCandsOf decls) in { Loader_dModules.f_Namespaces_nsValues = vals; Loader_dModules.f_Namespaces_nsCtors = cts; Loader_dModules.f_Namespaces_nsTypes = tys; Loader_dModules.f_Namespaces_nsValueSet = (B_dContainer_dHashMap.v_ofNames vals); Loader_dModules.f_Namespaces_nsCtorSet = (B_dContainer_dHashMap.v_ofNames cts); Loader_dModules.f_Namespaces_nsTypeSet = (B_dContainer_dHashMap.v_ofNames tys); Loader_dModules.f_Namespaces_nsCtorCands = cands; Loader_dModules.f_Namespaces_nsModuleTbl = (Loader_dModules.v_moduleTblOf modules); Loader_dModules.f_Namespaces_nsOpenNames = (Loader_dModules.v_openModuleNames imports); Loader_dModules.f_Namespaces_nsRelease = release })))))

# 150 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorTargets = (fun (prefix : string) (ns : Loader_dModules.t_Namespaces) (name : string) -> ((B_dData_dList.v_map (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((Loader_dModules.v_mangle prefix) (B_dData_dPair.v_secondOf p)))) ((B_dData_dList.v_filter (fun (p : (string, string) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_firstOf p) = name))) (ns).Loader_dModules.f_Namespaces_nsCtorCands)))

# 155 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorTarget = (fun (prefix : string) (ns : Loader_dModules.t_Namespaces) (name : string) -> (let nd_uscrut3 = (((v_localCtorTargets prefix) ns) name) in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__40))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 166 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pairExportTarget = (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target)

# 170 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pairIsDataCtor = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> ((Loader_dModules.v_isDataOrRecordCtorTarget modules) (v_pairExportTarget p)))

# 174 "Vuna/Compiler/Loader/Resolve.vuna"
let v_importedCtorTargets = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (tbl : (string, Loader_dModules.t_Module) B_dContainer_dHashMap.t_HashMap) (openNames : string B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn tbl) openNames) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) ((B_dData_dList.v_filter (v_pairIsDataCtor modules)) pairs))))))))

# 193 "Vuna/Compiler/Loader/Resolve.vuna"
let v_notEmptyList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorCandidates = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind ((((v_importedCtorTargets modules) (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) name)) (fun (imp : string B_dData_dList.t_List) -> (let local = (((v_localCtorTargets prefix) ns) name) in (if (if (if (if (v_notEmptyList local) then (name <> "Nil") else false) then (name <> "Cons") else false) then (name <> "::") else false) then (Base_dDiag.C_Check_OkC (local)) else (Base_dDiag.C_Check_OkC ((B_dData_dList.v_nubNames ((B_dData_dList.v_append local) imp)))))))))

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
let[@tail_mod_cons] rec v_uniqPathResults = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
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
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (if (v_allSameTarget ((B_dData_dList.v_map v_exportTarget) (B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110)))) then (Base_dDiag.C_Check_OkC ((v_exportTarget dtb__109))) else (Base_dDiag.C_Check_OkC ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverCtor (mc1, (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_exportTarget) (B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110))))))))))
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownConstructor (mc1))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 473 "Vuna/Compiler/Loader/Resolve.vuna"
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

# 490 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorFamilyEntryOf = (fun (base : string) (parent : string) (x : Loader_dModules.t_ExportEntry) -> (if (if ((x).Loader_dModules.f_ExportEntry_kind = "ctor") then ((x).Loader_dModules.f_ExportEntry_public = base) else false) then ((x).Loader_dModules.f_ExportEntry_parent = parent) else false))

# 493 "Vuna/Compiler/Loader/Resolve.vuna"
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

# 581 "Vuna/Compiler/Loader/Resolve.vuna"
let v_selectorRecordTarget = (fun (prefix : string) (ns : Loader_dModules.t_Namespaces) (head : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) head) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (B_dData_dMaybe.C_Maybe_Just (((Loader_dModules.v_mangle prefix) head))) else (match (((Loader_dModules.v_modulesExportingTypeIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) head) with
  | Base_dDiag.C_Check_OkC (dtb__130) -> (let nd_uscrut5 = (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) dtb__130)) in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (match dtb__132 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__131))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dDiag.C_Check_ErrC (dtb__133) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 593 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_foldFieldChain = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (((v_foldFieldChain (Frontend_dAst.C_Expr_EField (mc0, dtb__134, mc2))) dtb__135) mc2)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Loader/Resolve.vuna"
let v_dottedFieldSelector = (fun (mc0 : string) (mc1 : Loader_dModules.t_Namespaces) (mc2 : string) (mc3 : string B_dData_dList.t_List) (mc4 : Frontend_dAst.t_NodeRef) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (match (((v_selectorRecordTarget mc0) mc1) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> (B_dData_dMaybe.C_Maybe_Just ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsFieldSel (dtb__138, dtb__136))), mc4))) dtb__137) mc4)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Loader/Resolve.vuna"
let[@tail_mod_cons] rec v_takeSegs = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__139, ((v_takeSegs (mc0 - 1)) dtb__140))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_longestNamespaceEntryGo = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (k : int) -> (if (k <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Loader_dModules.v_findExportModule es) (Base_dSource.v_joinDots ((v_takeSegs k) segs))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__141) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb__141).Loader_dModules.f_ExportEntry_target; B_dData_dPair.f_Pair_second = k }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_longestNamespaceEntryGo es) segs) (k - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 217 "Vuna/Compiler/Loader/Resolve.vuna"
let v_longestNamespaceEntry = (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (segs : string B_dData_dList.t_List) -> (((v_longestNamespaceEntryGo es) segs) (B_dData_dList.v_length segs)))

# 601 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_dropSegs = (fun (mc0 : int) mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143)) else ((v_dropSegs (mc0 - 1)) dtb__143))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_walkNamespacePathsFuel = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "namespace path") else (if (v_notEmptyList segs) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let nd_uscrut5 = ((v_longestNamespaceEntry es) segs) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__144) -> (match dtb__144 with
  | { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = dtb__146 } -> ((((v_walkNamespacePathsFuel (fuel - 1)) modules) dtb__145) ((v_dropSegs dtb__146) segs))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = segs }))
  | _ -> failwith "DT: impossible branch"
)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = m; B_dData_dPair.f_Pair_second = segs })))))

# 199 "Vuna/Compiler/Loader/Resolve.vuna"
let v_walkNamespacePaths = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (m : string) (segs : string B_dData_dList.t_List) -> ((((v_walkNamespacePathsFuel (1 + (B_dData_dList.v_length segs))) modules) m) segs))

# 258 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_walkNamespaceCandidates = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> ((Base_dCommon.v_bind (((v_walkNamespacePaths mc0) dtb__147) mc2)) (fun (p : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((v_walkNamespaceCandidates mc0) dtb__148) mc2) (B_dData_dList.C_List__x58__x58_ (p, mc3)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc3)))
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolvePathPrefixesTry = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (match ((Loader_dModules.v_qualifierCandidates imports) (Base_dSource.v_joinDots ((v_takeSegs n) segs))) with
  | B_dData_dList.C_List_Nil -> ((((v_resolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__149 -> ((Base_dCommon.v_bind ((((v_walkNamespaceCandidates modules) ((B_dData_dList.v_map (v_realModuleName modules)) dtb__149)) ((v_dropSegs n) segs)) B_dData_dList.C_List_Nil)) (fun (rs : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_uniqPathResults rs) with
  | B_dData_dList.C_List_Nil -> ((((v_resolvePathPrefixesTry modules) imports) segs) (n - 1))
  | dtb__150 -> (Base_dDiag.C_Check_OkC (dtb__150))
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

# 605 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_pathEntryHits = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (match dtb__151 with
  | { B_dData_dPair.f_Pair_first = dtb__153; B_dData_dPair.f_Pair_second = dtb__154 } -> (let nd_uscrut10 = dtb__154 in (match nd_uscrut10 with
  | B_dData_dList.C_List_Nil -> (((v_pathEntryHits mc0) dtb__152) mc2)
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> (match dtb__156 with
  | B_dData_dList.C_List_Nil -> (if (dtb__155 = mc2) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) dtb__153)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((v_pickValueEntries es) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_pathEntryHits mc0) dtb__152) mc2)
  | dtb__157 -> ((Base_dCommon.v_bind (((v_pathEntryHits mc0) dtb__152) mc2)) (fun (hits : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = (v_exportTarget e); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) dtb__157)) hits)))))
))) else (((v_pathEntryHits mc0) dtb__152) mc2))
  | _ -> (if (dtb__155 = mc2) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) dtb__153)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportValues es) mc2) with
  | B_dData_dList.C_List_Nil -> (((v_pathEntryHits mc0) dtb__152) mc2)
  | dtb__158 -> ((Base_dCommon.v_bind (((v_pathEntryHits mc0) dtb__152) mc2)) (fun (hits : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (e : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = (v_exportTarget e); B_dData_dPair.f_Pair_second = dtb__156 })) dtb__158)) hits)))))
))) else (((v_pathEntryHits mc0) dtb__152) mc2))
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 631 "Vuna/Compiler/Loader/Resolve.vuna"
let[@tail_mod_cons] rec v_uniqPathTargets = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (if ((v_memPathKey (v_pathKey dtb__159)) dtb__160) then (v_uniqPathTargets dtb__160) else (B_dData_dList.C_List__x58__x58_ (dtb__159, (v_uniqPathTargets dtb__160))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 653 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_allEmptyTails = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__161 with
  | { B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__164 } -> (match dtb__164 with
  | B_dData_dList.C_List_Nil -> (v_allEmptyTails dtb__162)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 660 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isEmptyPaths = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedTypeTargetOnly = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (name))) name) else ((Base_dCommon.v_bind ((((v_entryHits v_pickTypeEntries) modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match hits with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") ((v_memberLabel name) ps)) hits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))))))

# 397 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeTarget = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dIntrinsics.v_isIntrinsicTypeName name) then (Base_dDiag.C_Check_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Base_dDiag.C_Check_OkC (name)) else (if (Base_dSource.v_containsDot name) then ((((v_resolveDottedTypeTargetOnly modules) label) imports) name) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownType (name))) name)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))))))

# 432 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveFamilyQualifiedCtor = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = dtb__168 } -> (let famName = (Base_dSource.v_joinDots dtb__167) in ((Base_dCommon.v_bind ((((((v_resolveTypeTarget modules) label) prefix) ns) imports) famName)) (fun (famTarget : string) -> (match (((((v_ctorTargetInFamily modules) prefix) ns) famTarget) dtb__168) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (Base_dDiag.C_Check_OkC (dtb__169))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeHasNoConstructor (famName, dtb__168))) famName) dtb__168)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorDotted = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then ((((((v_resolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind (((v_ctorEntryHits modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_notEmptyList hits) then (((v_uniqueCtorTarget label) ((v_memberLabel name) ps)) ((B_dData_dList.v_map B_dData_dPair.v_secondOf) hits)) else ((Base_dCommon.v_bind ((((v_ctorFamilyHits modules) ps) ((v_memberLabel name) ps)) (v_lastSegmentOf name))) (fun (familyHits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match familyHits with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "constructor") (v_lastSegmentOf name)) familyHits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))))))))

# 636 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveQualifiedPath = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (segs : string B_dData_dList.t_List) (n : int) (sp : Frontend_dAst.t_NodeRef) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) ((v_takeSegs n) segs))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)) else ((Base_dCommon.v_bind (((v_pathEntryHits modules) ps) ((v_memberLabel "") ps))) (fun (hits : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut8 = (v_uniqPathTargets hits) in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (match dtb__170 with
  | { B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__173 } -> (match dtb__173 with
  | B_dData_dList.C_List_Nil -> (match dtb__171 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar (dtb__172, sp))))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (((v_memberLabel "") ps), (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) nd_uscrut8))))) ((v_memberLabel "") ps)) (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) nd_uscrut8)))
)
  | _ -> (match dtb__171 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb__172, sp))) dtb__173) sp)))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (((v_memberLabel "") ps), (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) nd_uscrut8))))) ((v_memberLabel "") ps)) (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) nd_uscrut8)))
)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel "") ps), ((v_firstModuleOf "") ps)))) ((v_memberLabel "") ps)) ((v_firstModuleOf "") ps))
  | _ -> failwith "DT: impossible branch"
))))))))

# 716 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_valuePairTargets = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__174, dtb__175) -> (match dtb__174 with
  | { B_dData_dPair.f_Pair_first = dtb__176; B_dData_dPair.f_Pair_second = dtb__177 } -> (let isCtor = (if ((dtb__177).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((Loader_dModules.v_isDataOrRecordCtorTarget mc0) (dtb__177).Loader_dModules.f_ExportEntry_target)) in (if isCtor then ((v_valuePairTargets mc0) dtb__175) else (B_dData_dList.C_List__x58__x58_ ((dtb__177).Loader_dModules.f_ExportEntry_target, ((v_valuePairTargets mc0) dtb__175)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 724 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueOrOver = (fun (name : string) (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut2 = (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) pairs)) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (match dtb__179 with
  | B_dData_dList.C_List_Nil -> dtb__178
  | _ -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverValue (name, nd_uscrut2)))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverValue (name, B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)))

# 732 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickCtorOrOver = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (match dtb__181 with
  | B_dData_dList.C_List_Nil -> dtb__180
  | _ -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverCtor (mc0, mc1)))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverCtor (mc0, B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 740 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtor = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if (Base_dSource.v_containsDot name) then ((((((v_resolveCtorDotted modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind (((((v_ctorCandidates modules) prefix) ns) imports) name)) (fun (cands : string B_dData_dList.t_List) -> (match cands with
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsCtorSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dIntrinsics.v_isIntrinsicName name) then (Base_dDiag.C_Check_OkC (name)) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage ((Base_dSource.v_suggest name) (ns).Loader_dModules.f_Namespaces_nsCtors))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownConstructor (name))) name))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) pairs)))))
)))))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) cands)))
)))))

# 763 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkBinder = (fun (label : string) (name : string) -> (if (Base_dSource.v_containsDot name) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidVariableName (name))) name) else (Base_dDiag.C_Check_OkC (name))))

# 767 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkTopName = (fun (label : string) (name : string) -> (if (name = "_") then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTopLevelName ("_"))) "_") else (if (Base_dSource.v_containsDot name) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTopLevelName (name))) name) else (Base_dDiag.C_Check_OkC (name)))))

# 773 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTopName = (fun (label : string) (prefix : string) (name : string) -> ((Base_dCommon.v_bind ((v_checkTopName label) name)) (fun (_u : string) -> (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))))))

# 777 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolvePattern = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match pat with
  | Frontend_dAst.C_Pat_PWild (dtb__182) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild (dtb__182)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PVar (dtb__183, dtb__184) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__184))) ((v_checkBinder label) dtb__183))) (fun (_u : string) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__183, dtb__184)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__183, B_dData_dList.C_List_Nil)) }))))
  | Frontend_dAst.C_Pat_PAs (dtb__185, dtb__186, dtb__187) -> ((Base_dCommon.v_bind (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__186)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__185, (B_dData_dPair.v_firstOf p), dtb__187)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__185, (B_dData_dPair.v_secondOf p))) }))))
  | Frontend_dAst.C_Pat_PInt (dtb__188, dtb__189) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__188, dtb__189)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PStr (dtb__190, dtb__191) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__190, dtb__191)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PCon (dtb__192, dtb__193, dtb__194) -> (let nd_uscrut10 = (Frontend_dReserved.v_classify dtb__192) in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> (match dtb__195 with
  | Frontend_dReserved.C_Reserved_RsTupleUnit -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) (Frontend_dAst.C_Pat_PCon ("MkUnit", B_dData_dList.C_List_Nil, dtb__194)))
  | Frontend_dReserved.C_Reserved_RsTuplePair -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) (Frontend_dAst.C_Pat_PCon ("Pair", dtb__193, dtb__194)))
  | _ -> (if (Frontend_dReserved.v_isInternalSyntaxName dtb__192) then ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__193)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__192, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__194)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__194))) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__192))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__193)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (name2, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__194)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))))))
)
  | _ -> (if (Frontend_dReserved.v_isInternalSyntaxName dtb__192) then ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__193)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__192, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__194)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__194))) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__192))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__193)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (name2, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__194)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) })))))))
))
  | Frontend_dAst.C_Pat_PRecord (dtb__196, dtb__197, dtb__198) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__198))) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__196))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (((((((v_resolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__197)) (fun (parts : ((string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (name2, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), dtb__198)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts) }))))))
  | _ -> failwith "DT: impossible branch"
)))
# 795 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecordPatternField = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc6 with
  | { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = dtb__200 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__200)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = dtb__202 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__199; B_dData_dPair.f_Pair_second = dtb__201 }; B_dData_dPair.f_Pair_second = dtb__202 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 848 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveLocalPats = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__203)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__205; B_dData_dPair.f_Pair_second = dtb__206 } -> ((Base_dCommon.v_bind (((((((v_resolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__204)) (fun (r : (Frontend_dAst.t_Pat B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__207; B_dData_dPair.f_Pair_second = dtb__208 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__207)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__206) dtb__208) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))
  | _ -> failwith "DT: impossible branch"
))

# 913 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_collectRecBinds = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) (dtb__209).Frontend_dAst.f_Binding_bindPat)) (fun (pr : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match pr with
  | { B_dData_dPair.f_Pair_first = dtb__211; B_dData_dPair.f_Pair_second = dtb__212 } -> ((Base_dCommon.v_bind ((((((v_collectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__210)) (fun (r : (string B_dData_dList.t_List, Frontend_dAst.t_Binding B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__213; B_dData_dPair.f_Pair_second = dtb__214 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb__212) dtb__213); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = dtb__211; Frontend_dAst.f_Binding_bindValue = (dtb__209).Frontend_dAst.f_Binding_bindValue; Frontend_dAst.f_Binding_bindSig = (dtb__209).Frontend_dAst.f_Binding_bindSig; Frontend_dAst.f_Binding_bindRef = (dtb__209).Frontend_dAst.f_Binding_bindRef }, dtb__214)) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 956 "Vuna/Compiler/Loader/Resolve.vuna"
let[@tail_mod_cons] rec v_templateChunks = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (match dtb__215 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__217) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_interpMethodName, (Frontend_dAst.v_exprRef dtb__217))), (B_dData_dList.C_List__x58__x58_ (dtb__217, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_exprRef dtb__217))), ((v_templateChunks mc0) dtb__216)))
  | Frontend_dAst.C_InterpPart_IPText (dtb__218) -> (if (dtb__218 = "") then ((v_templateChunks mc0) dtb__216) else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (dtb__218, mc0)), ((v_templateChunks mc0) dtb__216))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_concatLeft = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr) (mc2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__219, dtb__220) -> (((v_concatLeft mc0) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", mc0)), (B_dData_dList.C_List__x58__x58_ (mc1, (B_dData_dList.C_List__x58__x58_ (dtb__219, B_dData_dList.C_List_Nil)))), mc0))) dtb__220)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 950 "Vuna/Compiler/Loader/Resolve.vuna"
let v_lowerTemplate = (fun (sp : Frontend_dAst.t_NodeRef) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match ((v_templateChunks sp) parts) with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EStr ("", sp))
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (((v_concatLeft sp) dtb__221) dtb__222)
  | _ -> failwith "DT: impossible branch"
))

# 971 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkDebugConstruct = (fun (release : bool) (sp : Frontend_dAst.t_NodeRef) (name : string) (resolved : string) (scope : string B_dData_dList.t_List) -> (if release then (if (Base_dIntrinsics.v_isDebugOnlyName resolved) then (if ((B_dData_dList.v_memName name) scope) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (resolved, sp)))) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dTc.C_TcErr_DebugConstructInRelease (resolved))) resolved)) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (resolved, sp))))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (resolved, sp))))))

# 988 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isParserSyntaxName = (fun (name : string) -> (match (Frontend_dReserved.v_classify name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__223) -> (Frontend_dReserved.v_isParserSurface dtb__223)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (name = Frontend_dReserved.v_handleOpBinderName) then true else (name = Frontend_dReserved.v_handleOpIndexBinderName))
  | _ -> failwith "DT: impossible branch"
))

# 997 "Vuna/Compiler/Loader/Resolve.vuna"
let v_hiddenRef = (fun (name : string) (sp : Frontend_dAst.t_NodeRef) -> (let stripped = (((B_dData_dString.v_substring 1) (bi_natFromInt (String.length name))) name) in (match (Base_dIntrinsics.v_findIntrinsic stripped) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__224) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (stripped, sp))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("hidden reference to unknown intrinsic " ^ stripped))
  | _ -> failwith "DT: impossible branch"
)))

# 1008 "Vuna/Compiler/Loader/Resolve.vuna"
let v_normalizeSyntaxNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__225, dtb__226, dtb__227) -> (match dtb__225 with
  | Frontend_dAst.C_Expr_EVar (dtb__228, dtb__229) -> (match dtb__226 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__231 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (match dtb__233 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut13 = (Frontend_dReserved.v_classify dtb__228) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__234) -> (match dtb__234 with
  | Frontend_dReserved.C_Reserved_RsTuplePair -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("Pair", dtb__229)), (B_dData_dList.C_List__x58__x58_ (dtb__230, (B_dData_dList.C_List__x58__x58_ (dtb__232, B_dData_dList.C_List_Nil)))), dtb__227))))
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
  | Frontend_dAst.C_Expr_EVar (dtb__235, dtb__236) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify dtb__235) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__237) -> (match dtb__237 with
  | Frontend_dReserved.C_Reserved_RsTupleUnit -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar ("MkUnit", dtb__236))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1178 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorDecl = (fun (label : string) (prefix : string) (dname : string) (ctor : string) -> ((Base_dCommon.v_bind ((v_checkTopName label) ctor)) (fun (_u : string) -> (Base_dDiag.C_Check_OkC ((((Loader_dModules.v_ctorCanonical prefix) dname) ctor))))))

# 1184 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isLowerTypeName = (fun (name : string) -> (match (B_dData_dList.dtp_unpack name) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__238, dtb__239) -> (Frontend_dLexer.v_isLowerChar dtb__238)
  | _ -> failwith "DT: impossible branch"
))

# 1190 "Vuna/Compiler/Loader/Resolve.vuna"
let v_startsUpperName = (fun (name : string) -> (match (B_dData_dList.dtp_unpack name) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__240, dtb__241) -> (if (dtb__240 >= 65) then (dtb__240 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1240 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorResult = (fun (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (name : string) -> (let nd_uscrut4 = (((v_localCtorTargets prefix) ns) name) in (match nd_uscrut4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dList.C_List__x58__x58_ (dtb__242, dtb__243) -> (match dtb__243 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb__242))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousConstructor (name, ("Data." ^ name)))) name) ("Data." ^ name))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1248 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveLowerTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else ((Base_dCommon.v_bind ((((v_localCtorResult label) prefix) ns) name)) (fun (mc : string B_dData_dMaybe.t_Maybe) -> (match mc with
  | B_dData_dMaybe.C_Maybe_Just (dtb__244) -> (Base_dDiag.C_Check_OkC (dtb__244))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValueIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) name)) (fun (vp : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match vp with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) name)) (fun (cp : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match cp with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) name)) (fun (tp : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match tp with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (name))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) tp)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) cp)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) vp)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1304 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes modules) imports) (Base_dSource.v_splitOnDot name))) (fun (ps : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths ps) then ((((((v_resolveFamilyQualifiedCtor modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind ((((v_entryHits v_pickTypeEntries) modules) ps) ((v_memberLabel name) ps))) (fun (hits : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match hits with
  | B_dData_dList.C_List_Nil -> (match ((((((v_resolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Base_dDiag.C_Check_OkC (dtb__245) -> (Base_dDiag.C_Check_OkC (dtb__245))
  | Base_dDiag.C_Check_ErrC (dtb__246) -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (((v_memberLabel name) ps), ((v_firstModuleOf name) ps)))) ((v_memberLabel name) ps)) ((v_firstModuleOf name) ps))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") ((v_memberLabel name) ps)) hits)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
)))))))

# 1279 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveNonLowerTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> ((Base_dCommon.v_bind ((((v_localCtorResult label) prefix) ns) name)) (fun (mc : string B_dData_dMaybe.t_Maybe) -> (match mc with
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (Base_dDiag.C_Check_OkC (dtb__247))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot name) then ((((((v_resolveDottedTypeName modules) label) prefix) ns) imports) name) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (match ((((((v_resolveCtor modules) label) prefix) ns) imports) name) with
  | Base_dDiag.C_Check_OkC (dtb__248) -> (Base_dDiag.C_Check_OkC (dtb__248))
  | Base_dDiag.C_Check_ErrC (dtb__249) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (Base_dDiag.C_Check_ErrC (dtb__249)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))
  | _ -> failwith "DT: impossible branch"
))))

# 1225 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeName = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dIntrinsics.v_isIntrinsicTypeName name) then (Base_dDiag.C_Check_OkC (name)) else (if (if (name = "Type") then true else (name = "->")) then (Base_dDiag.C_Check_OkC (name)) else (if (v_isLowerTypeName name) then ((((((v_resolveLowerTypeName modules) label) prefix) ns) imports) name) else ((((((v_resolveNonLowerTypeName modules) label) prefix) ns) imports) name))))))

# 1211 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveRecordDeriving = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (if (name = Loader_dSelectors.v_selectorDerivingName) then (Base_dDiag.C_Check_OkC (name)) else ((((((v_resolveTypeName modules) label) prefix) ns) imports) name)))

# 1218 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDataDeriving = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (dname : string) (name : string) -> (if (name = Loader_dSelectors.v_selectorDerivingName) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_SelectorNotRecord (dname))) dname) else ((((((v_resolveTypeName modules) label) prefix) ns) imports) name)))

# 1335 "Vuna/Compiler/Loader/Resolve.vuna"
let v_constraintHeadOf = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__250, dtb__251) -> (B_dData_dMaybe.C_Maybe_Just (dtb__250))
  | Frontend_dAst.C_Expr_EApp (dtb__252, dtb__253, dtb__254) -> (match dtb__252 with
  | Frontend_dAst.C_Expr_EVar (dtb__255, dtb__256) -> (B_dData_dMaybe.C_Maybe_Just (dtb__255))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1347 "Vuna/Compiler/Loader/Resolve.vuna"
let v_normalizeTypeSyntaxNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__257, dtb__258, dtb__259) -> (match dtb__257 with
  | Frontend_dAst.C_Expr_EVar (dtb__260, dtb__261) -> (let nd_uscrut6 = (Frontend_dReserved.v_classify dtb__260) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__262) -> (match dtb__262 with
  | Frontend_dReserved.C_Reserved_RsTuplePair -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("Pair", dtb__261)), dtb__258, dtb__259))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__263, dtb__264) -> (let nd_uscrut3 = (Frontend_dReserved.v_classify dtb__263) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> (match dtb__265 with
  | Frontend_dReserved.C_Reserved_RsTupleUnit -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar ("Unit", dtb__264))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1385 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeTopName = (fun (label : string) (prefix : string) (name : string) -> ((Base_dCommon.v_bind ((v_checkTopName label) name)) (fun (_u : string) -> (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))))))

# 1496 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isLowerIdent = (fun (n : string) -> (match (B_dData_dList.dtp_unpack n) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (if (dtb__266 >= 97) then (dtb__266 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1491 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_exprLowerNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__268, dtb__269, dtb__270) -> ((B_dData_dList.v_append (v_exprLowerNames dtb__268)) ((B_dData_dList.v_concatMap v_exprLowerNames) dtb__269))
  | Frontend_dAst.C_Expr_EVar (dtb__271, dtb__272) -> (if (v_isLowerIdent dtb__271) then (B_dData_dList.C_List__x58__x58_ (dtb__271, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 1502 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_scopeNamesOf = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__273, dtb__274) -> (match dtb__273 with
  | { B_dData_dPair.f_Pair_first = dtb__275; B_dData_dPair.f_Pair_second = dtb__276 } -> (if (dtb__275 = mc0) then dtb__276 else ((v_scopeNamesOf mc0) dtb__274))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1528 "Vuna/Compiler/Loader/Resolve.vuna"
let v_tyShape = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EDo (dtb__277, dtb__278) -> "do"
  | Frontend_dAst.C_Expr_EIf (dtb__279, dtb__280, dtb__281, dtb__282) -> "if"
  | Frontend_dAst.C_Expr_ECase (dtb__283, dtb__284, dtb__285) -> "case"
  | Frontend_dAst.C_Expr_ELet (dtb__286, dtb__287, dtb__288, dtb__289) -> "let"
  | Frontend_dAst.C_Expr_ELam (dtb__290, dtb__291, dtb__292) -> "lam"
  | Frontend_dAst.C_Expr_EFloat (dtb__293, dtb__294) -> "float"
  | Frontend_dAst.C_Expr_EStr (dtb__295, dtb__296) -> "str"
  | Frontend_dAst.C_Expr_EInt (dtb__297, dtb__298) -> "int"
  | Frontend_dAst.C_Expr_EApp (dtb__299, dtb__300, dtb__301) -> "app"
  | Frontend_dAst.C_Expr_EVar (dtb__302, dtb__303) -> ("var " ^ dtb__302)
  | _ -> "other"
))

# 1358 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveTypeExprScoped = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (bound : string B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match (v_normalizeTypeSyntaxNames ty) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__304)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_resolveTypeExprScopedRaw fuel) modules) label) prefix) ns) imports) bound) ty)
  | _ -> failwith "DT: impossible branch"
)))
# 1367 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveTypeExprScopedRaw = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (bound : string B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut8 = ty in (match nd_uscrut8 with
  | Frontend_dAst.C_Expr_EPi (dtb__305, dtb__306, dtb__307, dtb__308, dtb__309, dtb__310) -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__308)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) (B_dData_dList.C_List__x58__x58_ (dtb__305, bound))) dtb__309)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__305, dtb__306, dtb__307, dom2, cod2, dtb__310))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__311, dtb__312, dtb__313) -> (match dtb__311 with
  | Frontend_dAst.C_Expr_EVar (dtb__314, dtb__315) -> (if (dtb__314 = "Type") then (Base_dDiag.C_Check_OkC (ty)) else ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__311)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__312)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__313)))))))))
  | _ -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtb__311)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped (fuel - 1)) modules) label) prefix) ns) imports) bound) dtv))) dtb__312)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__313))))))))
)
  | Frontend_dAst.C_Expr_EVar (dtb__316, dtb__317) -> (if ((B_dData_dList.v_memName dtb__316) bound) then (Base_dDiag.C_Check_OkC (ty)) else (if (Frontend_dReserved.v_isMacroSyntaxName dtb__316) then (Base_dDiag.v_icInternal ("unexpanded macro invocation " ^ dtb__316)) else (if (Frontend_dReserved.v_isInternalSyntaxName dtb__316) then (Base_dDiag.C_Check_OkC (ty)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__317))) ((((((v_resolveTypeName modules) label) prefix) ns) imports) dtb__316))) (fun (n : string) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (n, dtb__317)))))))))
  | Frontend_dAst.C_Expr_EStr (dtb__318, dtb__319) -> (Base_dDiag.C_Check_OkC (ty))
  | Frontend_dAst.C_Expr_EInt (dtb__320, dtb__321) -> (Base_dDiag.C_Check_OkC (ty))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan ty))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTypeExpression ((v_tyShape ty)))) (v_tyShape ty)))
))))

# 1340 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeExpr = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped fuel) modules) label) prefix) ns) imports) B_dData_dList.C_List_Nil) ty))

# 1326 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveConstraintExpr = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (cx : Frontend_dAst.t_Expr) -> (match (v_constraintHeadOf cx) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__322) -> (match ((((((v_resolveTypeName modules) label) prefix) ns) imports) dtb__322) with
  | Base_dDiag.C_Check_ErrC (dtb__323) -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan cx))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownInterface (dtb__322))) dtb__322))
  | Base_dDiag.C_Check_OkC (dtb__324) -> (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

# 1390 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorSpec = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : string) (mc6 : Frontend_dAst.t_Ctor) -> (match mc6 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__325; Frontend_dAst.f_Ctor_ctorType = dtb__326; Frontend_dAst.f_Ctor_ctorArity = dtb__327; Frontend_dAst.f_Ctor_ctorRef = dtb__328 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__328))) ((((v_resolveCtorDecl mc1) mc2) mc5) dtb__325))) (fun (c2 : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__326)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = c2; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__327; Frontend_dAst.f_Ctor_ctorRef = dtb__328 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1433 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveRecordField = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Field) -> (match mc5 with
  | { Frontend_dAst.f_Field_fieldName = dtb__329; Frontend_dAst.f_Field_fieldType = dtb__330; Frontend_dAst.f_Field_fieldRef = dtb__331 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__331))) ((v_checkBinder mc1) dtb__329))) (fun (_u : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__330)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__329; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldRef = dtb__331 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1439 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTraitMethod = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_TraitMethod) -> (match mc5 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__332; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__333; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__334 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__334))) (((v_resolveTopName mc1) mc2) dtb__332))) (fun (n : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__333)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = n; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__334 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1544 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorPairTargets = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__335, dtb__336) -> (match dtb__335 with
  | { B_dData_dPair.f_Pair_first = dtb__337; B_dData_dPair.f_Pair_second = dtb__338 } -> (let isCtor = (if ((dtb__338).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((Loader_dModules.v_isDataOrRecordCtorTarget mc0) (dtb__338).Loader_dModules.f_ExportEntry_target)) in (if isCtor then (B_dData_dList.C_List__x58__x58_ ((dtb__338).Loader_dModules.f_ExportEntry_target, ((v_ctorPairTargets mc0) dtb__336))) else ((v_ctorPairTargets mc0) dtb__336)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveGlobal = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (name : string) -> (if ((B_dData_dList.v_memName name) scope) then (Base_dDiag.C_Check_OkC (name)) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (match (((v_localCtorTargets prefix) ns) name) with
  | B_dData_dList.C_List__x58__x58_ (dtb__339, dtb__340) -> ((Base_dCommon.v_bind (((((v_ctorCandidates modules) prefix) ns) imports) name)) (fun (cands : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) cands)))))
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsCtorSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else (if (Base_dSource.v_containsDot name) then ((((v_resolveQualified modules) label) imports) name) else (if (v_isBuiltinName name) then (Base_dDiag.C_Check_OkC (name)) else (if (v_isDtPreludeName name) then (Base_dDiag.C_Check_OkC (name)) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValueIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ns).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle prefix) name))) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (ns).Loader_dModules.f_Namespaces_nsModuleTbl) (ns).Loader_dModules.f_Namespaces_nsOpenNames) name)) (fun (tpairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match tpairs with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage ((Base_dSource.v_suggest name) ((B_dData_dList.v_append (ns).Loader_dModules.f_Namespaces_nsValues) ((B_dData_dList.v_append (ns).Loader_dModules.f_Namespaces_nsCtors) ((B_dData_dList.v_append (ns).Loader_dModules.f_Namespaces_nsTypes) scope)))))) ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage (v_traitImportHint name))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownVariable (name))) name)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs label) "name") name) tpairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target))))
))))
  | _ -> (match ((v_ctorPairTargets modules) pairs) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (((v_pickValueOrOver name) pairs)))
  | dtb__341 -> (match ((v_valuePairTargets modules) pairs) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver name) (B_dData_dList.v_nubNames dtb__341))))
  | _ -> (Base_dDiag.C_Check_OkC ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverValue (name, (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) pairs)))))))
)
)
)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 541 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedExpr = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (name : string) (sp : Frontend_dAst.t_NodeRef) -> (match (Base_dSource.v_splitOnDot name) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "empty dotted name")
  | B_dData_dList.C_List__x58__x58_ (dtb__342, dtb__343) -> (if ((B_dData_dList.v_memName dtb__342) scope) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb__342, sp))) dtb__343) sp))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan sp))) ((((((v_resolveQualifiedPath modules) label) imports) (Base_dSource.v_splitOnDot name)) (B_dData_dList.v_length (Base_dSource.v_splitOnDot name))) sp))) (fun (q : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) -> (match q with
  | B_dData_dMaybe.C_Maybe_Just (dtb__344) -> (Base_dDiag.C_Check_OkC (dtb__344))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__342) (ns).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (((Loader_dModules.v_mangle prefix) dtb__342), sp))) dtb__343) sp))) else (if (v_isBuiltinName dtb__342) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb__342, sp))) dtb__343) sp))) else (if (v_startsUpperName dtb__342) then (match ((((((v_resolveCtorDotted modules) label) prefix) ns) imports) name) with
  | Base_dDiag.C_Check_OkC (dtb__345) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__345, sp))))
  | Base_dDiag.C_Check_ErrC (dtb__346) -> (match (((((v_dottedFieldSelector prefix) ns) dtb__342) dtb__343) sp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__347) -> (Base_dDiag.C_Check_OkC (dtb__347))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan sp))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (dtb__342))) dtb__342))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan sp))) (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) dtb__342))) (fun (n : string) -> (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (n, sp))) dtb__343) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 1098 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDoBind = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) -> (match (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) ">>=") with
  | Base_dDiag.C_Check_OkC (dtb__348) -> (Base_dDiag.C_Check_OkC (dtb__348))
  | Base_dDiag.C_Check_ErrC (dtb__349) -> (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) "bind")
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveAlt = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (alt : Frontend_dAst.t_Alt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports) (alt).Frontend_dAst.f_Alt_altPat)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__350; B_dData_dPair.f_Pair_second = dtb__351 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__351) scope)) (alt).Frontend_dAst.f_Alt_altBody)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Alt_altPat = dtb__350; Frontend_dAst.f_Alt_altBody = body2; Frontend_dAst.f_Alt_altRef = (alt).Frontend_dAst.f_Alt_altRef }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 818 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveBindingSig = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__352) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (dtb__352).Frontend_dAst.f_BindingSig_sigType)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = ty2; Frontend_dAst.f_BindingSig_sigRef = (dtb__352).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 826 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveBindingValue = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : Frontend_dAst.t_BindingValue) -> (match mc7 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__353) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Frontend_dAst.t_LocalClause) -> ((((((((v_resolveLocalClause (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) c))) dtb__353)) (fun (cs : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (cs))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb__354) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__354)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (e2))))))
  | _ -> failwith "DT: impossible branch"
))
# 837 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLocalClause = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (clause : Frontend_dAst.t_LocalClause) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolveLocalPats (fuel - 1)) modules) label) prefix) ns) imports) (clause).Frontend_dAst.f_LocalClause_lcPats)) (fun (p : (Frontend_dAst.t_Pat B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__355; B_dData_dPair.f_Pair_second = dtb__356 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__356) scope)) (clause).Frontend_dAst.f_LocalClause_lcBody)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_LocalClause_lcPats = dtb__355; Frontend_dAst.f_LocalClause_lcBody = body2; Frontend_dAst.f_LocalClause_lcRef = (clause).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (clause).Frontend_dAst.f_LocalClause_lcHead }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 866 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLet = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (rec_u : bool) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (if rec_u then (((((((((v_resolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_resolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
# 875 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLetSeq = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match binds with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = b }))))
  | B_dData_dList.C_List__x58__x58_ (dtb__357, dtb__358) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingSig (fuel - 1)) modules) label) prefix) ns) imports) scope) (dtb__357).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingValue (fuel - 1)) modules) label) prefix) ns) imports) scope) (dtb__357).Frontend_dAst.f_Binding_bindValue)) (fun (value2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports) (dtb__357).Frontend_dAst.f_Binding_bindPat)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__360 } -> ((Base_dCommon.v_bind (((((((((v_resolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__360) scope)) dtb__358) body)) (fun (r : (Frontend_dAst.t_Binding B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__361; B_dData_dPair.f_Pair_second = dtb__362 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = dtb__359; Frontend_dAst.f_Binding_bindValue = value2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (dtb__357).Frontend_dAst.f_Binding_bindRef }, dtb__361)); B_dData_dPair.f_Pair_second = dtb__362 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 901 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecLet = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (body : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut9 = ((((((v_collectRecBinds modules) label) prefix) ns) imports) binds) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__363) -> (match dtb__363 with
  | { B_dData_dPair.f_Pair_first = dtb__364; B_dData_dPair.f_Pair_second = dtb__365 } -> (let scope2 = ((B_dData_dList.v_append dtb__364) scope) in ((Base_dCommon.v_bind ((((((((v_resolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__365)) (fun (values2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = values2; B_dData_dPair.f_Pair_second = b })))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__366) -> (Base_dDiag.C_Check_ErrC (dtb__366))
  | _ -> failwith "DT: impossible branch"
))))
# 929 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecValues = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__367, dtb__368) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind ((((((((v_resolveBindingSig (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (dtb__367).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingValue (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (dtb__367).Frontend_dAst.f_Binding_bindValue)) (fun (value2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind ((((((((v_resolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__368)) (fun (tail : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb__367).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = value2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (dtb__367).Frontend_dAst.f_Binding_bindRef }, tail)))))))))))
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 1019 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveExpr = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match (v_normalizeSyntaxNames expr) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__369) -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__369)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_resolveExprRaw fuel) modules) label) prefix) ns) imports) scope) expr)
  | _ -> failwith "DT: impossible branch"
)))
# 1028 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveExprRaw = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (expr : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match expr with
  | Frontend_dAst.C_Expr_EVar (dtb__370, dtb__371) -> (if (Frontend_dReserved.v_isHoleName dtb__370) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__370, dtb__371)))) else (if (if ((B_dData_dString.v_startsWith "!") dtb__370) then ((String.length dtb__370) > 1) else false) then ((v_hiddenRef dtb__370) dtb__371) else (if (Frontend_dReserved.v_isMacroSyntaxName dtb__370) then (Base_dDiag.v_icInternal ("unexpanded macro invocation " ^ dtb__370)) else (if (Frontend_dReserved.v_isInternalSyntaxName dtb__370) then (if (if (v_isParserSyntaxName dtb__370) then true else (Frontend_dName.v_isCompilerModulePrefix prefix)) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb__370, dtb__371)))) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__371))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownVariable (dtb__370))) dtb__370))) else (if (Base_dSource.v_containsDot dtb__370) then ((((((((v_resolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__370) dtb__371) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__371))) (((((((v_resolveGlobal modules) label) prefix) ns) imports) scope) dtb__370))) (fun (n : string) -> (((((v_checkDebugConstruct (ns).Loader_dModules.f_Namespaces_nsRelease) dtb__371) dtb__370) n) scope))))))))
  | Frontend_dAst.C_Expr_EInt (dtb__372, dtb__373) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb__372, dtb__373))))
  | Frontend_dAst.C_Expr_EStr (dtb__374, dtb__375) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb__374, dtb__375))))
  | Frontend_dAst.C_Expr_EFloat (dtb__376, dtb__377) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb__376, dtb__377))))
  | Frontend_dAst.C_Expr_EInterp (dtb__378, dtb__379) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__378)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_lowerTemplate dtb__379) ps)))))
  | Frontend_dAst.C_Expr_ELam (dtb__380, dtb__381, dtb__382) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__382))) ((Base_dCommon.v_traverse (v_checkBinder label)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__380)))) (fun (_u : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__380)) scope)) dtb__381)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__380, b, dtb__382))))))))
  | Frontend_dAst.C_Expr_EApp (dtb__383, dtb__384, dtb__385) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__383)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (a : Frontend_dAst.t_Expr) -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__384)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__385))))))))
  | Frontend_dAst.C_Expr_EPi (dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__389)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb__386, B_dData_dList.C_List_Nil))) scope)) dtb__390)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__386, dtb__387, dtb__388, dom2, cod2, dtb__391))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__392, dtb__393, dtb__394, dtb__395) -> ((Base_dCommon.v_bind ((((((((((v_resolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__394) dtb__392) dtb__393)) (fun (r : (Frontend_dAst.t_Binding B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__396; B_dData_dPair.f_Pair_second = dtb__397 } -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb__396, dtb__397, dtb__394, dtb__395))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Expr_ECase (dtb__398, dtb__399, dtb__400) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__398)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : Frontend_dAst.t_Alt) -> ((((((((v_resolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__399)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__400))))))))
  | Frontend_dAst.C_Expr_EIf (dtb__401, dtb__402, dtb__403, dtb__404) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__401)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__402)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__403)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, e2, dtb__404))))))))))
  | Frontend_dAst.C_Expr_EField (dtb__405, dtb__406, dtb__407) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__405)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (b, dtb__406, dtb__407))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__408, dtb__409, dtb__410) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__410))) ((((((v_resolveCtor modules) label) prefix) ns) imports) dtb__408))) (fun (name2 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__409)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (name2, fs, dtb__410))))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__411, dtb__412, dtb__413) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__411)) (fun (b : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtv : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__412)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (b, fs, dtb__413))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__414, dtb__415) -> (((((((((v_resolveDo (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__414) (Frontend_dAst.v_nodeRefSpan dtb__415))
  | _ -> failwith "DT: impossible branch"
)))
# 1066 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveInterpParts = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut8 = parts in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__416, dtb__417) -> (match dtb__416 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__418) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__418)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__417)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (e2)), ps))))))))
  | Frontend_dAst.C_InterpPart_IPText (dtb__419) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__417)) (fun (ps : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__419)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 1085 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDo = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (blockSpan : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut9 = stmts in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__420, dtb__421) -> (match dtb__420 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__422, dtb__423) -> (match dtb__421 with
  | B_dData_dList.C_List_Nil -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__422)
  | _ -> ((Base_dCommon.v_bind ((((((v_resolveDoBind modules) label) prefix) ns) imports) scope)) (fun (bindName : string) -> ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | _ -> ((Base_dCommon.v_bind ((((((v_resolveDoBind modules) label) prefix) ns) imports) scope)) (fun (bindName : string) -> ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) stmts) blockSpan)))
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At blockSpan) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))))
# 1114 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDoChain = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (bindName : string) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (blockSpan : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (let nd_uscrut10 = stmts in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__424, dtb__425) -> (match dtb__424 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__426, dtb__427, dtb__428) -> (match dtb__426 with
  | Frontend_dAst.C_Pat_PWild (dtb__429) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__427)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__425) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoIgnore (bindName))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428)))), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), tail, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428))))))))))
  | Frontend_dAst.C_Pat_PVar (dtb__430, dtb__431) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__427)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) (B_dData_dList.C_List__x58__x58_ (dtb__430, scope))) bindName) dtb__425) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoBind (bindName))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428)))), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__430; B_dData_dPair.f_Pair_second = ((Base_dSource.v_spanAtName dtb__430) (Frontend_dAst.v_nodeRefSpan dtb__431)) }, B_dData_dList.C_List_Nil)), tail, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428))))))))))
  | _ -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__426)) (fun (rp : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rp with
  | { B_dData_dPair.f_Pair_first = dtb__432; B_dData_dPair.f_Pair_second = dtb__433 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__427)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__433) scope)) bindName) dtb__425) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoBind (bindName))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428)))), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_doPatternBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_doPatternBinderName, (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))), (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = dtb__432; Frontend_dAst.f_Alt_altBody = tail; Frontend_dAst.f_Alt_altRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__428))))))))))
  | _ -> failwith "DT: impossible branch"
)))
)
  | Frontend_dAst.C_DoStmt_DLet (dtb__434, dtb__435) -> ((Base_dCommon.v_bind ((((((((v_resolveDoLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__434)) (fun (r : (Frontend_dAst.t_Binding B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__437) scope)) bindName) dtb__425) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb__436, tail, false, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__435))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__438, dtb__439) -> (match dtb__425 with
  | B_dData_dList.C_List_Nil -> ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__438)
  | _ -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__438)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (fuel - 1)) modules) label) prefix) ns) imports) scope) bindName) dtb__425) blockSpan)) (fun (tail : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoIgnore (bindName))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__439)))), (B_dData_dList.C_List__x58__x58_ (e2, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), tail, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__439)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb__439))))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At blockSpan) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))))
# 1143 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDoLet = (fun (fuel : int) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "resolver") else (match binds with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | B_dData_dList.C_List__x58__x58_ (dtb__440, dtb__441) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingSig (fuel - 1)) modules) label) prefix) ns) imports) scope) (dtb__440).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingValue (fuel - 1)) modules) label) prefix) ns) imports) scope) (dtb__440).Frontend_dAst.f_Binding_bindValue)) (fun (value2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports) (dtb__440).Frontend_dAst.f_Binding_bindPat)) (fun (p : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__442; B_dData_dPair.f_Pair_second = dtb__443 } -> ((Base_dCommon.v_bind ((((((((v_resolveDoLet (fuel - 1)) modules) label) prefix) ns) imports) ((B_dData_dList.v_append dtb__443) scope)) dtb__441)) (fun (r : (Frontend_dAst.t_Binding B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match r with
  | { B_dData_dPair.f_Pair_first = dtb__444; B_dData_dPair.f_Pair_second = dtb__445 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = dtb__442; Frontend_dAst.f_Binding_bindValue = value2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (dtb__440).Frontend_dAst.f_Binding_bindRef }, dtb__444)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__443) dtb__445) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 1168 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveFieldValue = (fun (mc0 : int) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : string B_dData_dList.t_List) (mc7 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc7 with
  | { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = dtb__447 } -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind ((((((((v_resolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__447)) (fun (v : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = v })))))
  | _ -> failwith "DT: impossible branch"
))

# 1445 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveInstanceMethod = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : string) (mc3 : Loader_dModules.t_Namespaces) (mc4 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Decl) -> (match mc5 with
  | Frontend_dAst.C_Decl_DFun (dtb__448, dtb__449, dtb__450, dtb__451) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__451))) ((v_checkTopName mc1) dtb__448))) (fun (_u : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__449)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts)) dtb__450)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__448, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), b, dtb__451))))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__452, dtb__453, dtb__454, dtb__455) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__455))) ((v_checkTopName mc1) dtb__452))) (fun (_u : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__453)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__454)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__452, ctx2, ty2, dtb__455))))))))))
  | _ -> (Base_dDiag.v_icInternal "unexpected instance body declaration")
))

# 1396 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDecl = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (d : Frontend_dAst.t_Decl) -> (match d with
  | Frontend_dAst.C_Decl_DData (dtb__456, dtb__457, dtb__458, dtb__459, dtb__460, dtb__461, dtb__462, dtb__463, dtb__464) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__464))) (((v_resolveTypeTopName label) prefix) dtb__456))) (fun (dn : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__458)) (fun (kind2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolveCtorSpec modules) label) prefix) ns) imports) dtb__456)) dtb__459)) (fun (ctors2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolveDataDeriving modules) label) prefix) ns) imports) dtb__456)) dtb__460)) (fun (ds2 : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dn, dtb__457, kind2, ctors2, ds2, dtb__461, dtb__462, dtb__463, dtb__464))))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__472))) (((v_resolveTypeTopName label) prefix) dtb__465))) (fun (dn : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveRecordField modules) label) prefix) ns) imports)) dtb__467)) (fun (fields2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveRecordDeriving modules) label) prefix) ns) imports)) dtb__468)) (fun (ds2 : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dn, dtb__466, fields2, ds2, dtb__469, dtb__470, dtb__471, dtb__472))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__473, dtb__474, dtb__475, dtb__476, dtb__477) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__477))) (((v_resolveTypeTopName label) prefix) dtb__473))) (fun (tn : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__475)) (fun (ss : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveTraitMethod modules) label) prefix) ns) imports)) dtb__476)) (fun (ms : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (tn, dtb__474, ss, ms, dtb__477))))))))))
  | Frontend_dAst.C_Decl_DInstance (dtb__478, dtb__479, dtb__480, dtb__481) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__478)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__479)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveInstanceMethod modules) label) prefix) ns) imports)) dtb__480)) (fun (ms : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, ms, dtb__481))))))))))
  | Frontend_dAst.C_Decl_DSig (dtb__482, dtb__483, dtb__484, dtb__485) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__485))) (((v_resolveTopName label) prefix) dtb__482))) (fun (n : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (cx : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__483)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__484)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (n, ctx2, ty2, dtb__485))))))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__486, dtb__487, dtb__488) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__488))) (((v_resolveTopName label) prefix) dtb__486))) (fun (n : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__487)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (n, ty2, dtb__488))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__489, dtb__490, dtb__491, dtb__492) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__492))) (((v_resolveTopName label) prefix) dtb__489))) (fun (n : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) modules) label) prefix) ns) imports) dtb__491)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (n, dtb__490, ty2, dtb__492))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__493, dtb__494, dtb__495, dtb__496) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__496))) (((v_resolveTopName label) prefix) dtb__493))) (fun (n : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) modules) label) prefix) ns) imports)) dtb__494)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) modules) label) prefix) ns) imports) ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts)) dtb__495)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (n, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), b, dtb__496))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1506 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDeclWithImplicitScopes = (fun (mc0 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : string) (mc4 : Loader_dModules.t_Namespaces) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Decl) -> (match mc6 with
  | Frontend_dAst.C_Decl_DFun (dtb__497, dtb__498, dtb__499, dtb__500) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__500))) (((v_resolveTopName mc2) mc3) dtb__497))) (fun (n : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) mc1) mc2) mc3) mc4) mc5)) dtb__498)) (fun (parts : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) mc1) mc2) mc3) mc4) mc5) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) parts)) ((v_scopeNamesOf dtb__497) mc0))) dtb__499)) (fun (b : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (n, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) parts), b, dtb__500))))))))))
  | _ -> ((((((v_resolveDecl mc1) mc2) mc3) mc4) mc5) mc6)
))

# 1551 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isStringDomainExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__501, dtb__502) -> (if (dtb__501 = "String") then true else (if (dtb__501 = "Base.Data.String.String") then true else false))
  | _ -> false
))

# 1558 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isTypeDomainExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__503, dtb__504) -> (if (dtb__503 = "Type") then true else false)
  | _ -> false
))

# 1562 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isRowDomainExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__505, dtb__506) -> (if (dtb__505 = "Row") then true else (if (dtb__505 = "Base.Effect.Core.Row") then true else false))
  | _ -> false
))

# 1481 "Vuna/Compiler/Loader/Resolve.vuna"
let[@tail_mod_cons] rec v_leadingImplicitNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__507, dtb__508, dtb__509, dtb__510, dtb__511, dtb__512) -> (if dtb__508 then (if (dtb__507 = "_") then (v_leadingImplicitNames dtb__511) else (if (if (if (v_isStringDomainExpr dtb__510) then true else (v_isTypeDomainExpr dtb__510)) then true else (v_isRowDomainExpr dtb__510)) then (B_dData_dList.C_List__x58__x58_ (dtb__507, (v_leadingImplicitNames dtb__511))) else (v_leadingImplicitNames dtb__511))) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 1469 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_implicitScopeTable = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__513, dtb__514) -> (match dtb__513 with
  | Frontend_dAst.C_Decl_DSig (dtb__515, dtb__516, dtb__517, dtb__518) -> (let names = (B_dData_dList.v_nubNames ((B_dData_dList.v_append (v_leadingImplicitNames dtb__517)) ((B_dData_dList.v_concatMap v_exprLowerNames) dtb__516))) in (match names with
  | B_dData_dList.C_List_Nil -> (v_implicitScopeTable dtb__514)
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__515; B_dData_dPair.f_Pair_second = names }, (v_implicitScopeTable dtb__514)))
))
  | _ -> (v_implicitScopeTable dtb__514)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1457 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveProgram = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (prefix : string) (ns : Loader_dModules.t_Namespaces) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let implicitScopes = (v_implicitScopeTable decls) in ((Base_dCommon.v_traverse ((((((v_resolveDeclWithImplicitScopes implicitScopes) modules) label) prefix) ns) imports)) decls)))

# 1515 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveEntry = (fun (release : bool) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (entryPkg : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((((v_resolveProgram modules) "<entry>") "") ((((v_namespacesOfWith release) modules) decls) imports)) imports) decls))

# 1519 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveModules = (fun (mc0 : bool) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__519, dtb__520) -> (match dtb__519 with
  | { Loader_dModules.f_Module_moduleNameOf = dtb__521; Loader_dModules.f_Module_modulePackageOf = dtb__522; Loader_dModules.f_Module_moduleImportsOf = dtb__523; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__524; Loader_dModules.f_Module_moduleDeclsOf = dtb__525; Loader_dModules.f_Module_moduleExportsOf = dtb__526; Loader_dModules.f_Module_moduleFixitiesOf = dtb__527; Loader_dModules.f_Module_moduleReexportsOf = dtb__528; Loader_dModules.f_Module_moduleOpaqueOf = dtb__529; Loader_dModules.f_Module_moduleExportIndexOf = dtb__530; Loader_dModules.f_Module_moduleFixFactsOf = dtb__531 } -> (let allImps = ((B_dData_dList.v_append dtb__523) dtb__524) in ((Base_dCommon.v_bind ((((((v_resolveProgram mc1) dtb__521) dtb__521) ((((v_namespacesOfWith mc0) mc1) dtb__525) allImps)) allImps) dtb__525)) (fun (d1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_resolveModules mc0) dtb__520)) (fun (d2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append d1) d2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
